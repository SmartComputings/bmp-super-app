# JWT Token Refresh Implementation

## Overview

Comprehensive JWT token refresh functionality has been implemented for the MindPower Super App with automatic token validation, refresh, and secure storage.

## Features

✅ **Automatic Token Refresh** - Tokens refresh automatically on 401/403 errors  
✅ **Proactive Refresh** - Check and refresh tokens before they expire  
✅ **Secure Storage** - Encrypted token storage using platform-specific secure storage  
✅ **Mutex Protection** - Prevents concurrent refresh attempts  
✅ **Rate Limit Handling** - Exponential backoff for 429 errors  
✅ **Background Refresh** - Optional periodic token refresh service  

## Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                    Application Layer                         │
├─────────────────────────────────────────────────────────────┤
│  ProactiveTokenRefreshService (Optional Background Service)  │
├─────────────────────────────────────────────────────────────┤
│  JwtRefreshManager (Token Refresh Logic + Mutex)            │
├─────────────────────────────────────────────────────────────┤
│  ApiClient Interceptor (Automatic Refresh on 401/403)       │
├─────────────────────────────────────────────────────────────┤
│  SecureTokenStorage (Encrypted Storage + Validation)        │
├─────────────────────────────────────────────────────────────┤
│  Platform Secure Storage (iOS Keychain / Android Keystore)  │
└─────────────────────────────────────────────────────────────┘
```

## Files Created/Modified

### New Files
- `lib/core/security/jwt_refresh_manager.dart` - Token refresh logic
- `lib/core/security/proactive_token_refresh_service.dart` - Background refresh service
- `lib/examples/jwt_refresh_examples.dart` - Usage examples
- `docs/JWT_REFRESH_GUIDE.md` - Comprehensive documentation

### Modified Files
- `lib/core/security/secure_token_storage.dart` - Added `shouldRefreshJwtToken()` method
- `lib/core/network/api_client.dart` - Integrated JwtRefreshManager in interceptor

## Quick Start

### 1. Automatic Refresh (Recommended)

No code changes needed! ApiClient automatically handles token refresh:

```dart
// Just make API calls normally
final response = await ApiClient.request(
  path: '/api/endpoint',
  method: 'GET',
);
// Token automatically refreshes on 401/403 errors
```

### 2. Proactive Refresh (Optional)

Start background token refresh service:

```dart
// In your app initialization
ProactiveTokenRefreshService.instance.startPeriodicRefresh(
  checkInterval: const Duration(minutes: 10),
);
```

### 3. Manual Refresh

Refresh token manually when needed:

```dart
final username = await UsernameInjection.getUsername();
final newToken = await JwtRefreshManager.instance.refreshToken(username!);
```

### 4. Before Critical Operations

Ensure token is valid before important operations:

```dart
final isValid = await ProactiveTokenRefreshService.instance.ensureValidToken();
if (isValid) {
  // Proceed with operation
}
```

## Token Lifecycle

```
Token Created (24h expiry)
    ↓
Valid Period (0-12h) ✅
    ↓
Refresh Window (12h-23h55m) 🔄 Auto-refresh on next API call
    ↓
Safety Buffer (23h55m-24h) ⚠️ Force refresh
    ↓
Expired (>24h) ❌ Must re-authenticate
```

## Configuration

### Token Expiry
- **Token Lifetime**: 24 hours
- **Refresh Time**: 12 hours (50% of lifetime)
- **Safety Buffer**: 5 minutes before expiry

### Retry Settings
- **API Retry**: 1 attempt after token refresh
- **Token Generation Retry**: 3 attempts with exponential backoff
- **Rate Limit Backoff**: 2s, 4s, 6s

## Security Features

1. **Encrypted Storage**
   - iOS: Keychain with `first_unlock_this_device`
   - Android: Keystore with AES-GCM encryption

2. **Automatic Validation**
   - Checks expiry before returning token
   - Validates refresh time
   - Safety buffer prevents last-minute failures

3. **Mutex Protection**
   - Prevents concurrent refresh attempts
   - Queues requests during refresh
   - Shares refreshed token across waiting requests

4. **Rate Limit Handling**
   - Exponential backoff on 429 errors
   - Fresh RSA headers on each retry
   - Maximum retry limits

## Usage Examples

See `lib/examples/jwt_refresh_examples.dart` for complete examples:

- App initialization with periodic refresh
- Manual token refresh
- Token status checking
- Login/logout flow
- Before critical operations
- Background refresh service

## API Endpoints

- **Generate Token**: `POST /api/auth/generate-token`
- **Refresh Token**: Same endpoint with RSA authentication
- **CSRF Token**: `GET /api/auth/csrf-token` (requires valid JWT)

## Testing

```dart
// Test token expiry
final now = DateTime.now().millisecondsSinceEpoch ~/ 1000;
await SecureTokenStorage.instance.storeJwtToken(
  token: 'test_token',
  createdAt: now,
  expiresAt: now + 60, // 1 minute
  refreshAt: now + 30, // 30 seconds
);

await Future.delayed(Duration(seconds: 30));

final shouldRefresh = await SecureTokenStorage.instance.shouldRefreshJwtToken();
assert(shouldRefresh == true);
```

## Troubleshooting

### Token not refreshing
- Check username is stored in UsernameInjection
- Verify RSA headers are generated correctly
- Check network connectivity
- Review debug logs

### Multiple refresh attempts
- Ensure mutex is working
- Verify completer is completed properly
- Check for race conditions

### Token refresh loop
- Verify token expiry times are correct
- Check safety buffer is reasonable
- Ensure refresh time is 50% of lifetime

## Best Practices

1. ✅ Use SecureTokenStorage for all token storage
2. ✅ Let ApiClient handle automatic refresh
3. ✅ Use proactive refresh for background services
4. ✅ Check token status before long operations
5. ✅ Clear tokens on logout
6. ❌ Never store tokens in SharedPreferences
7. ❌ Don't manually refresh unless necessary

## Documentation

- **Full Guide**: `docs/JWT_REFRESH_GUIDE.md`
- **Examples**: `lib/examples/jwt_refresh_examples.dart`
- **API Docs**: See inline documentation in source files

## Related Files

- `lib/core/security/secure_token_storage.dart`
- `lib/core/security/jwt_refresh_manager.dart`
- `lib/core/security/proactive_token_refresh_service.dart`
- `lib/core/network/api_client.dart`
- `lib/features/finance/data/services/security_service.dart`
- `lib/features/finance/data/services/rsa_auth_service.dart`
