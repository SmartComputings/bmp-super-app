# Navigation Issues & Solutions

**Last Updated:** 2025-01-21  
**Scope:** All modules except Finance  
**Status:** In Progress

---

## 🎯 Overview

This document identifies navigation inconsistencies throughout the app where back button presses and navigation flows don't properly align with the defined route structure. Issues are organized by module with resolved and unresolved sections.

---

## 1. **Onboarding Module**

### ✅ Resolved Issues

#### Issue 1.1: Login Screen - Signup Navigation
**File:** `lib/features/auth_onboarding/login/login.dart`  
**Line:** ~450  
**Status:** ✅ FIXED

**Previous Code:**
```dart
void signUp() {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => const AccountTypeSelectionScreen(),
    ),
  );
}
```

**Problem:**
- Uses `Navigator.push()` instead of GoRouter
- Back button from signup screen navigates incorrectly
- Doesn't respect route hierarchy

**Solution Applied:**
```dart
void signUp() async {
  final client = await Matrix.of(context).getLoginClient();
  context.push('/home/account-type', extra: client);
}
```

**Route Added:** `/home/account-type` in `routes.dart`

**Impact:** High - Affects user registration flow

---

#### Issue 1.2: Signup Screen - Email Verification onStartOver Navigation
**File:** `lib/features/auth_onboarding/signup/signup.dart`  
**Line:** ~580  
**Status:** ✅ FIXED

**Previous Code:**
```dart
onStartOver: () {
  Navigator.of(context).pop();
  Navigator.of(context).pop(); // Double pop - incorrect
  resetRegistration();
},
```

**Problem:**
- Multiple `pop()` calls indicate broken navigation hierarchy
- Only one pop needed to return to signup screen

**Solution Applied:**
```dart
onStartOver: () {
  Navigator.of(context).pop();
  resetRegistration();
},
```

**Note:** EmailVerificationPage uses Navigator.push with callbacks which is acceptable for this specific case as it requires dynamic callback functions that can't be easily passed through GoRouter routes.

**Impact:** Medium - Affects registration flow

---

#### Issue 1.3: Signup Screen - Login Navigation
**File:** `lib/features/auth_onboarding/signup/signup.dart`  
**Line:** ~393  
**Status:** ✅ FIXED

**Previous Code:**
```dart
void LoginView() {
  Navigator.of(context).pop();
  Navigator.of(context).pop();
}
```

**Problem:**
- Double `pop()` indicates navigation stack confusion
- Should use proper route navigation

**Solution Applied:**
```dart
void LoginView() {
  context.go('/home/login');
}
```

**Impact:** Medium - Affects user flow between login/signup

---

#### Issue 1.4: Intro Video - Splash Navigation
**File:** `lib/features/auth_onboarding/onBoardingScreens/Screens/IntroVideoScreen.dart`  
**Line:** ~58  
**Status:** ✅ FIXED

**Current Code:**
```dart
void _navigateToSplash() {
  if (mounted) {
    context.go('/SplashScreen');
  }
}
```

**Problem (Before Fix):**
- Route path inconsistency: `/SplashScreen` and `/splash` both existed
- Duplicate routes for same screen

**Solution Applied:**
- Removed duplicate `/splash` route from routes.dart
- Kept `/SplashScreen` as the single route
- IntroVideoScreen already uses correct path `/SplashScreen`

**Impact:** Low - Affects initial app load

---

### ⚠️ Unresolved Issues

No unresolved issues in Onboarding module at this time.

---



---

## 2. **Chat Module**

### ✅ Resolved Issues

#### Issue 2.8: Calls History Screen - Back Navigation with Keyboard
**File:** `lib/features/chat/dialer/widgets/calls_history_screen.dart`  
**Line:** ~64  
**Status:** ✅ FIXED

**Previous Code:**
```dart
return KeyboardDismissiblePopScope(
  focusNodes: [_searchFocusNode],
  child: Stack(...)
```

**Problem:**
- Used `KeyboardDismissiblePopScope` which intercepted back button before `ChatBottomNavBar`'s `PopScope`
- When pressing back from Calls tab, it navigated directly to main menu instead of switching to Chats tab first
- Bypassed the tab switching logic in `ChatBottomNavBar`

**Solution Applied:**
```dart
return GestureDetector(
  onTap: () {
    if (_searchFocusNode.hasFocus) {
      _searchFocusNode.unfocus();
    }
  },
  child: Stack(...)
```

**Impact:** Medium - Fixes back navigation flow from Calls tab

---

#### Issue 2.9: Calls History - Chat Navigation
**File:** `lib/features/chat/dialer/widgets/calls_history_screen.dart`  
**Lines:** ~485, ~490  
**Status:** ✅ FIXED

**Previous Code:**
```dart
void _openChat(String roomId) {
  context.go('/mainMenuScreen/rooms/$roomId');
}

void _makeCall(CallHistoryEntry call) {
  context.go('/mainMenuScreen/rooms/${call.roomId}');
}
```

**Problem:**
- Used `context.go()` which replaces navigation stack
- Back button from chat went to chat list instead of returning to CallsScreen

**Solution Applied:**
```dart
void _openChat(String roomId) {
  context.push('/mainMenuScreen/rooms/$roomId');
}

void _makeCall(CallHistoryEntry call) {
  context.push('/mainMenuScreen/rooms/${call.roomId}');
}
```

**Impact:** Medium - Preserves navigation history from calls screen

---

#### Issue 2.1: Main Menu - Coming Soon Navigation
**File:** `lib/features/chat/main_menu/main_menu_screen.dart`  
**Lines:** ~150, ~165, ~180, ~195  
**Status:** ✅ FIXED

**Previous Code:**
```dart
onTap: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => const ComingSoonScreen(),
    ),
  );
}
```

**Problem:**
- Used for Apps, Marketplace, Community, Tour Guide sections
- Creates separate navigation stack
- Back button doesn't return to main menu properly

**Solution Applied:**
```dart
// Apps
onTap: () => context.push('/coming-soon', extra: {'feature': 'Apps'}),

// Marketplace
onTap: () => context.push('/coming-soon', extra: {'feature': 'Marketplace'}),

// Community
onTap: () => context.push('/coming-soon', extra: {'feature': 'Community'}),

// Tour Guide
onTap: () => context.push('/coming-soon', extra: {'feature': 'Tour Guide'}),
```

**Impact:** Medium - Affects multiple menu items

---

#### Issue 2.2: Chat List - Ignore List Navigation from Dialog
**File:** `lib/features/chat/chat_list/chat_list.dart`  
**Line:** ~146  
**Status:** ✅ VERIFIED CORRECT

**Current Code:**
```dart
case InviteAction.block:
  final userId = inviteEvent?.senderId;
  context.go('/mainMenuScreen/rooms/settings/security/ignorelist',
      extra: userId);
  return;
```

**Why It's Correct:**
- `context.go()` is **CORRECT** for dialog navigation
- Navigation originates from AlertDialog (temporary context)
- Dialog auto-closes when navigation occurs
- `context.push()` causes "LeafRenderObjectElement unmounted" errors with disposed dialog context

**Trade-off:**
- Using `context.go()` replaces navigation stack (can't go back to chat requests list)
- Using `context.push()` causes crashes due to disposed context
- `context.go()` is the safer choice to avoid crashes

**Rule:** Use `context.go()` when navigating from dialogs, bottom sheets, or other temporary contexts

**Impact:** None - Already correctly implemented

---

#### Issue 2.3: Chat List - Archive Navigation
**File:** `lib/features/chat/chat_list/chat_list.dart`  
**Line:** ~290  
**Status:** ✅ FIXED

**Current Code:**
```dart
if (room.membership == Membership.leave) {
  context.push('/mainMenuScreen/rooms/archive/${room.id}');
  return;
}
```

**Note:** Changed from `context.go()` to `context.push()` to preserve navigation history

**Impact:** Low - Affects archived room access

---

#### Issue 2.4: Chat List - Room Navigation
**File:** `lib/features/chat/chat_list/chat_list.dart`  
**Line:** ~300  
**Status:** ✅ FIXED

**Current Code:**
```dart
context.push('/mainMenuScreen/rooms/${room.id}');
```

**Note:** Changed from `context.go()` to `context.push()` to maintain navigation stack

**Impact:** High - Affects all chat room navigation

---

#### Issue 2.5: Archive View - Chat Navigation from Archive
**File:** `lib/features/chat/archive/archive_view.dart`  
**Line:** ~76  
**Status:** ✅ FIXED

**Current Code:**
```dart
onTap: () => context.push('/mainMenuScreen/rooms/archive/${controller.archive[i].id}'),
```

**Problem (Before Fix):**
- Used `context.go()` which replaced navigation stack
- When opening chat from archive and pressing back, it went to all chats list instead of archive
- Navigation history was lost

**Solution Applied:**
- Changed to `context.push()` with proper nested archive route path
- Route structure: `/mainMenuScreen/rooms/archive/{roomId}` (defined in routes.dart)
- Now back button correctly returns to archive screen

**Impact:** Medium - Affects navigation from archived chats

---

#### Issue 2.6: Chat Bottom Nav Bar - Tab Navigation
**File:** `lib/features/chat/chat_list/chat_bottom_nav_bar.dart`  
**Line:** ~56-67  
**Status:** ✅ FIXED

**Previous Code:**
```dart
PopScope(
  canPop: false,
  onPopInvokedWithResult: (didPop, result) {
    if (didPop) return;
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    } else {
      context.go('/mainMenuScreen');
    }
  },
```

**Problem:**
- Back button from "Calls" tab went directly to mainMenuScreen
- Back button from contacts/new private chat went to mainMenuScreen
- Should return to "Chats" tab first before going to mainMenuScreen

**Solution Applied:**
```dart
PopScope(
  canPop: false,
  onPopInvokedWithResult: (didPop, result) {
    if (didPop) return;
    
    // If not on Chats tab, go back to Chats tab first
    if (_selectedTab != 0) {
      setState(() => _selectedTab = 0);
      return;
    }
    
    // If on Chats tab, go to main menu
    context.go('/mainMenuScreen');
  },
```

**Impact:** Medium - Improves bottom navigation UX

---

#### Issue 2.7: Chat Bottom Nav Bar - Center Button Navigation
**File:** `lib/features/chat/chat_list/chat_bottom_nav_bar.dart`  
**Line:** ~318  
**Status:** ✅ FIXED

**Previous Code:**
```dart
GestureDetector(
  onTap: () => context.go('/mainMenuScreen/rooms/newprivatechat'),
```

**Problem:**
- Used `context.go()` which replaces navigation stack
- Back button from contacts screen went to mainMenuScreen instead of chat list

**Solution Applied:**
```dart
GestureDetector(
  onTap: () => context.push('/mainMenuScreen/rooms/newprivatechat'),
```

**Impact:** Medium - Fixes back navigation from contacts screen

---

### ⚠️ Unresolved Issues

No unresolved issues in Chat module at this time.

---

## 3. **Settings Module**

### ✅ Resolved Issues

#### Issue 3.1: Splash Screen - Welcome/Main Menu Navigation
**File:** `lib/features/auth_onboarding/onBoardingScreens/Screens/SplashScreen.dart`  
**Line:** ~150  
**Status:** ✅ VERIFIED CORRECT

**Current Code:**
```dart
void _checkLoginAndNavigate() {
  try {
    final matrix = Matrix.of(context);
    final isLoggedIn =
        matrix.widget.clients.any((client) => client.isLogged());

    if (isLoggedIn) {
      context.go('/mainMenuScreen');
    } else {
      context.go('/welcome');
    }
  } catch (e) {
    context.go('/welcome');
  }
}
```

**Note:** Uses `context.go()` which is correct for initial navigation

**Impact:** None - Already correctly implemented

---

#### Issue 3.2: Main Menu - Settings Navigation
**File:** `lib/features/chat/main_menu/main_menu_screen.dart`  
**Line:** ~178  
**Status:** ✅ VERIFIED CORRECT

**Current Code:**
```dart
MenuItem(
  color: blueBox,
  icon: "assets/MainMenu/settings.png",
  title: L10n.of(context).settings,
  menuIcon: "assets/MainMenu/setting_app.png",
  menuIconPadding: const EdgeInsets.only(left: 0),
  onTap: () => context.go('/mainMenuScreen/settings'),
),
```

**Why It's Correct:**
- Uses `context.go()` which is appropriate for navigating to main sections
- Settings is a top-level navigation destination
- Replaces navigation stack to prevent deep navigation hierarchies

**Impact:** None - Already correctly implemented

---

#### Issue 3.3: DynamicHeader - My Bank Navigation
**File:** `lib/features/auth_onboarding/onBoardingScreens/Screens/OnBoardingScreen/widgets/DynamicHeader.dart`  
**Line:** ~133  
**Status:** ✅ FIXED

**Previous Code:**
```dart
case SettingsAction.myBank:
  context.push('/mainMenuScreen/wallet?from=menu');
  break;
```

**Problem:**
- Used `context.push()` for hamburger menu navigation
- Should use `context.go()` for top-level navigation
- No tab parameter means it defaults to tab 0 (Wallet)

**Solution Applied:**
```dart
case SettingsAction.myBank:
  context.go('/mainMenuScreen/wallet');
  break;
```

**Impact:** Medium - Affects wallet navigation from hamburger menu

---

#### Issue 3.4: DynamicHeader - My Card Navigation
**File:** `lib/features/auth_onboarding/onBoardingScreens/Screens/OnBoardingScreen/widgets/DynamicHeader.dart`  
**Line:** ~116  
**Status:** ✅ FIXED

**Previous Code:**
```dart
case SettingsAction.mycard:
  context.push('/mainMenuScreen/wallet?tab=1');
  break;
```

**Problem:**
- Used `context.push()` for hamburger menu navigation
- Should use `context.go()` for top-level navigation
- Tab parameter `?tab=1` correctly selects cards tab

**Solution Applied:**
```dart
case SettingsAction.mycard:
  context.go('/mainMenuScreen/wallet?tab=1');
  break;
```

**Impact:** Medium - Affects cards navigation from hamburger menu

---

#### Issue 3.5: Settings View - Blocked Users Navigation
**File:** `lib/features/chat/settings/settings_view.dart`  
**Line:** ~365  
**Status:** ✅ FIXED

**Previous Code:**
```dart
_buildSettingsItem(
  icon: Icons.delete_outlined,
  title: L10n.of(context).blockedUsers,
  onTap: () => context.go('/mainMenuScreen/rooms/settings/security/userBlockedList'),
),
```

**Problem:**
- Used `context.go()` which replaces navigation stack
- Should use `context.push()` to preserve navigation history
- Back button should return to settings screen

**Solution Applied:**
```dart
_buildSettingsItem(
  icon: Icons.delete_outlined,
  title: L10n.of(context).blockedUsers,
  onTap: () => context.push('/mainMenuScreen/rooms/settings/security/userBlockedList'),
),
```

**Impact:** Low - Affects blocked users list navigation

---

#### Issue 3.6: User Dialog - Ignore User Navigation Route Fix
**File:** `lib/shared/widgets/adaptive_dialogs/user_dialog.dart`  
**Line:** ~210  
**Status:** ✅ FIXED

**Previous Code:**
```dart
AdaptiveDialogAction(
  bigButtons: true,
  onPressed: () {
    final router = GoRouter.of(context);
    Navigator.of(context).pop();
    router.go(
      '/rooms/settings/security/ignorelist',
      extra: profile.userId,
    );
  },
  child: Text(
    L10n.of(context).ignoreUser,
    style: TextStyle(color: theme.colorScheme.error),
  ),
),
```

**Problem:**
- Used incorrect route path `/rooms/settings/security/ignorelist`
- Missing `/mainMenuScreen` prefix
- Route doesn't match defined routes in routes.dart

**Solution Applied:**
```dart
AdaptiveDialogAction(
  bigButtons: true,
  onPressed: () {
    final router = GoRouter.of(context);
    Navigator.of(context).pop();
    router.go(
      '/mainMenuScreen/rooms/settings/security/ignorelist',
      extra: profile.userId,
    );
  },
  child: Text(
    L10n.of(context).ignoreUser,
    style: TextStyle(color: theme.colorScheme.error),
  ),
),
```

**Note:** Uses `router.go()` which is correct for dialog navigation after dismissal

**Impact:** Medium - Fixes broken ignore user navigation from user dialog

---

#### Issue 3.7: User Dialog - Start Conversation Navigation Route Fix
**File:** `lib/shared/widgets/adaptive_dialogs/user_dialog.dart`  
**Line:** ~170-195  
**Status:** ✅ FIXED

**Previous Code:**
```dart
if (dmRoomId != null) {
  router.push('/rooms/$dmRoomId');
  return;
}
// ...
client.startDirectChat(profile.userId).then((roomId) {
  navigator.pop();
  router.push('/rooms/$roomId');
}).catchError((error) {
  navigator.pop();
  router.push('/rooms');
});
```

**Problem:**
- Used incorrect route paths `/rooms/$dmRoomId` and `/rooms/$roomId`
- Missing `/mainMenuScreen` prefix
- Routes don't match defined routes in routes.dart
- Causes navigation errors when clicking "Send a message"

**Solution Applied:**
```dart
if (dmRoomId != null) {
  router.push('/mainMenuScreen/rooms/$dmRoomId');
  return;
}
// ...
client.startDirectChat(profile.userId).then((roomId) {
  navigator.pop();
  router.push('/mainMenuScreen/rooms/$roomId');
}).catchError((error) {
  navigator.pop();
  router.push('/mainMenuScreen/rooms');
});
```

**Key Changes:**
- Added `/mainMenuScreen` prefix to all room navigation paths
- Matches route structure used in chat_list.dart (line 300)
- Fixes "Send a message" button navigation error

**Impact:** High - Fixes broken direct message navigation from user dialog

---

### ⚠️ Unresolved Issues

No unresolved issues in Settings module at this time.

---

## 4. **General / Route Structure**

### ✅ Resolved Issues

#### Issue 4.1: Missing Coming Soon Route
**File:** `lib/shared/routes/routes.dart`  
**Status:** ✅ FIXED

**Problem:**
- ComingSoonScreen used in multiple places but no route defined
- Forces use of Navigator.push() instead of GoRouter

**Solution Applied:**
```dart
GoRoute(
  path: '/coming-soon',
  pageBuilder: (context, state) => defaultPageBuilder(
    context,
    state,
    ComingSoonScreen(
      featureName: (state.extra as Map<String, dynamic>?)?['feature'],
    ),
  ),
),
```

**Impact:** Medium - Enables proper navigation for multiple features

---

#### Issue 4.2: Duplicate Wallet Route Definitions
**File:** `lib/shared/routes/routes.dart`  
**Status:** ✅ FIXED

**Problem:**
- Duplicate wallet routes: `/mainMenuScreen/wallet` and `/mainMenuScreen/rooms/wallet`
- Inconsistent path usage across codebase

**Solution Applied:**
- Removed all `/mainMenuScreen/rooms/wallet` references
- Standardized on `/mainMenuScreen/wallet` throughout codebase
- Updated files:
  - `wallet_list_widget.dart`
  - `accounts_list_widget.dart`
  - `routes.dart` (multiple return routes)

**Impact:** Medium - Affects wallet navigation consistency

---

### ⚠️ Unresolved Issues

No unresolved issues in General/Route Structure at this time.

---

## 🔧 Recommended Refactoring Strategy

### Phase 1: Critical Fixes (Week 1)
1. Fix all `Navigator.push()` in auth/onboarding flows
2. Fix remaining chat navigation issues
3. Resolve duplicate route definitions

### Phase 2: Route Cleanup (Week 2)
1. Standardize route naming (lowercase)
2. Add route redirects for legacy paths
3. Review and fix settings module navigation

### Phase 3: Testing & Validation (Week 3)
1. Test all back button behaviors
2. Verify deep linking works correctly
3. Test navigation from notifications
4. Validate multi-account switching

---

## 📊 Impact Summary

| Module | Resolved | Unresolved | High Priority | Medium Priority | Low Priority |
|--------|----------|------------|---------------|-----------------|--------------|
| Onboarding | 4 | 0 | 0 | 1 | 1 |
| Chat | 9 | 0 | 0 | 4 | 0 |
| Settings | 7 | 0 | 1 | 3 | 1 |
| General | 2 | 0 | 0 | 2 | 0 |
| **Total** | **20** | **0** | **1** | **9** | **3** |

---

## ✅ Best Practices Going Forward

### DO:
- ✅ Use `context.push()` for navigating to new screens
- ✅ Use `context.go()` only for:
  - Replacing entire navigation stack (login/logout)
  - Navigating from temporary contexts (dialogs, bottom sheets)
- ✅ Use `context.pop()` for going back
- ✅ Define all routes in `routes.dart`
- ✅ Use lowercase route paths
- ✅ Pass data via `extra` parameter

### DON'T:
-   Use `Navigator.push()` or `Navigator.pop()`
-   Use multiple `pop()` calls in sequence
-   Create routes inline with MaterialPageRoute
-   Mix navigation approaches in same module
-   Use `context.go()` when `context.push()` is appropriate

---

## 🔗 Related Files

- Main Routes: `lib/shared/routes/routes.dart`
- Login: `lib/features/auth_onboarding/login/login.dart`
- Signup: `lib/features/auth_onboarding/signup/signup.dart`
- Chat List: `lib/features/chat/chat_list/chat_list.dart`
- Main Menu: `lib/features/chat/main_menu/main_menu_screen.dart`
- Archive: `lib/features/chat/archive/archive_view.dart`

---

## 📝 Notes

- Finance module excluded as per requirements
- All line numbers are approximate and may shift with code changes
- Test thoroughly after each fix
- Consider adding navigation tests to prevent regression
- Update this document as issues are resolved

---

**Next Steps:**
1. Review and prioritize unresolved fixes with team
2. Create tickets for each unresolved issue
3. Assign to developers
4. Schedule testing after fixes
5. Update documentation

---

*Generated: 2025-01-21*  
*Maintainer: Development Team*
