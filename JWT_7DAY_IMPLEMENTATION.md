# JWT Token Refresh - 7 Day Implementation

## Overview

JWT token refresh has been updated to support:
- **7-day access tokens** (instead of 24 hours)
- **Automatic refresh using refresh tokens**
- **30-day refresh token expiry**
- **Seamless user experience** (no logout during refresh)
- **Automatic logout** when refresh token expires

## Token Lifecycle

```
Login
  ↓
Access Token (7 days) + Refresh Token (30 days)
  ↓
Valid Period (0-6.5 days) ✅
  ↓
Refresh Window (6.5-7 days) 🔄 Auto-refresh on next API call
  ↓
Access Token Expired (>7 days) ⚠️ Use refresh token
  ↓
Refresh Token Valid → New Access Token ✅
  ↓
Refresh Token Expired → Logout ❌
```

## Implementation Details

### 1. Token Storage (`secure_token_storage.dart`)

Added refresh token storage:
```dart
await SecureTokenStorage.instance.storeRefreshToken(
  refreshToken: refreshToken,
  expiresAt: now + (30 * 86400), // 30 days
);
```

### 2. JWT Refresh Manager (`jwt_refresh_manager.dart`)

Handles token refresh using refresh token:
```dart
final newToken = await JwtRefreshManager.instance.refreshToken(username);
```

- Calls `/api/auth/refresh-token` endpoint
- Sends refresh token to get new access token
- Stores new access token (7 days)
- Stores new refresh token if provided (30 days)
- Clears all tokens if refresh token expired (401/403)

### 3. Login Flow (`auth_service.dart`)

Stores both tokens on login:
```dart
// Store access token (7 days)
await SecureTokenStorage.instance.storeJwtToken(
  token: token,
  createdAt: now,
  expiresAt: now + (7 * 86400),
  refreshAt: now + (7 * 86400) - (12 * 3600), // 12h before expiry
);

// Store refresh token (30 days)
if (refreshToken != null) {
  await SecureTokenStorage.instance.storeRefreshToken(
    refreshToken: refreshToken,
    expiresAt: now + (30 * 86400),
  );
}
```

### 4. API Interceptor (`api_client.dart`)

Automatically refreshes on 401/403:
```dart
// Try refresh token
final newToken = await JwtRefreshManager.instance.refreshToken(username);

if (newToken == null) {
  // Refresh token expired - clear session and logout
  await SecureTokenStorage.instance.clearAll();
}
```

### 5. Logout (`auth_service.dart`)

Clears all tokens:
```dart
await SecureTokenStorage.instance.clearAll();
```

## Configuration

### Access Token
- **Expiry**: 7 days (604800 seconds)
- **Refresh Time**: 6.5 days (12 hours before expiry)
- **Safety Buffer**: 5 minutes

### Refresh Token
- **Expiry**: 30 days (2592000 seconds)
- **Used for**: Getting new access tokens
- **Cleared on**: Logout or expiry

## Backend API Requirements

### Login Endpoint
```json
POST /api/auth/login
Response: {
  "success": true,
  "data": {
    "token": "access_token_here",
    "refreshToken": "refresh_token_here"
  }
}
```

### Refresh Token Endpoint
```json
POST /api/auth/refresh-token
Request: {
  "refreshToken": "refresh_token_here"
}
Response: {
  "success": true,
  "data": {
    "accessToken": "new_access_token",
    "refreshToken": "new_refresh_token",
    "expiresIn": "7d"
  }
}
```

## User Experience

### Scenario 1: Normal Usage (Within 7 Days)
- User logs in → Gets 7-day access token
- Makes API calls → Works normally
- No refresh needed

### Scenario 2: After 6.5 Days
- Access token nearing expiry
- Next API call triggers refresh
- New 7-day access token issued
- User continues seamlessly

### Scenario 3: After 7 Days (Access Token Expired)
- API call returns 401
- Interceptor uses refresh token
- New 7-day access token issued
- Original API call retried
- User continues seamlessly

### Scenario 4: After 30 Days (Refresh Token Expired)
- API call returns 401
- Interceptor tries refresh token
- Refresh token expired (401/403)
- All tokens cleared
- User logged out
- Redirect to login screen

## Testing

### Test Access Token Refresh
```dart
// Store token with short expiry
final now = DateTime.now().millisecondsSinceEpoch ~/ 1000;
await SecureTokenStorage.instance.storeJwtToken(
  token: 'test_token',
  createdAt: now,
  expiresAt: now + 60, // 1 minute
  refreshAt: now + 30, // 30 seconds
);

// Wait 30 seconds
await Future.delayed(Duration(seconds: 30));

// Make API call - should auto-refresh
final response = await ApiClient.request(path: '/api/test', method: 'GET');
```

### Test Refresh Token Expiry
```dart
// Store expired refresh token
await SecureTokenStorage.instance.storeRefreshToken(
  refreshToken: 'expired_token',
  expiresAt: now - 1, // Already expired
);

// Make API call - should logout
final response = await ApiClient.request(path: '/api/test', method: 'GET');
// User should be logged out
```

## Files Modified

1. `lib/core/security/secure_token_storage.dart` - Added refresh token storage
2. `lib/core/security/jwt_refresh_manager.dart` - Created refresh manager
3. `lib/features/finance/data/services/auth_service.dart` - Store both tokens on login
4. `lib/features/finance/data/services/security_service.dart` - Updated refresh timing
5. `lib/core/network/api_client.dart` - Use refresh token in interceptor

## Migration Notes

Existing users will need to:
1. Login again to get refresh token
2. Old 24-hour tokens will continue to work until expiry
3. After expiry, users will be prompted to login

## Security Features

✅ Encrypted storage (iOS Keychain / Android Keystore)
✅ Automatic token validation
✅ Refresh token rotation (new refresh token on each refresh)
✅ Automatic logout on refresh token expiry
✅ Mutex protection (prevents concurrent refresh)
✅ No tokens in SharedPreferences
