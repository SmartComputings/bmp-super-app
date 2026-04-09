## Recovery/Bootstrap Fix Guide (Matrix SDK)

### Goal
- Stop the infinite "Processing encryption setup" spinner by providing the recovery key to the Matrix SDK and advancing the bootstrap state correctly.

### Root cause
- The user-entered recovery key was never provided to the SDK. Calls like `bootstrap.openExistingSsss()` and `bootstrap.unlockedSsss()` were invoked without first unlocking SSSS with the recovery key. Additionally, attempting to set `ssss.recoveryKey` is invalid (no such setter).

### Correct API usage
- Use `unlockWithRecoveryKey(key)` on `client.encryption.ssss` to unlock SSSS, then proceed with the bootstrap state method.

---

### Edits in `lib/pages/bootstrap/bootstrap_dialog.dart`

#### 1) Handle BootstrapState.askUnlockSsss using stored key when available

Replace the existing auto-unlock (which passes no key):

```dart
case BootstrapState.askUnlockSsss:
  WidgetsBinding.instance.addPostFrameCallback(
    (_) => bootstrap!.unlockedSsss(),
  );
  break;
```

With:

```dart
case BootstrapState.askUnlockSsss:
  WidgetsBinding.instance.addPostFrameCallback((_) async {
    try {
      final storedKey = await const FlutterSecureStorage().read(key: _secureStorageKey);
      if (storedKey != null && storedKey.isNotEmpty) {
        await widget.client.encryption?.ssss.unlockWithRecoveryKey(storedKey);
        await bootstrap!.unlockedSsss();
      } else {
        if (mounted) setState(() {}); // fall back to key entry UI
      }
    } catch (e) {
      if (mounted) setState(() {}); // fall back to key entry UI on error
    }
  });
  break;
```

Notes:
- This attempts to unlock with a previously stored key. If none is present or unlock fails, the UI remains in the key-entry path (your existing `openExistingSsss` screen).

#### 2) Provide the user-entered key before opening existing SSSS

In the "Next" button handler of the recovery-key entry UI (inside the `openExistingSsss` branch), replace the call that opens without supplying a key:

```dart
onPressed: _recoveryKeyInputLoading ? null : () async {
  final key = _recoveryKeyTextEditingController.text;
  if (key.isEmpty) return;
  setState(() => _recoveryKeyInputLoading = true);
  try {
    await bootstrap!.openExistingSsss(); // key not provided – replace this
  } catch (e) {
    setState(() { _recoveryKeyInputError = e.toLocalizedString(context).toString(); });
  } finally {
    setState(() => _recoveryKeyInputLoading = false);
  }
}
```

With:

```dart
onPressed: _recoveryKeyInputLoading ? null : () async {
  final key = _recoveryKeyTextEditingController.text.trim();
  if (key.isEmpty) return;
  setState(() => _recoveryKeyInputLoading = true);
  try {
    await widget.client.encryption?.ssss.unlockWithRecoveryKey(key);
    await bootstrap!.openExistingSsss();
  } catch (e) {
    setState(() {
      _recoveryKeyInputError = e.toLocalizedString(context).toString();
    });
  } finally {
    setState(() => _recoveryKeyInputLoading = false);
  }
}
```

Notes:
- This ensures the SDK receives the recovery key and can unlock SSSS before proceeding.

#### 3) Store the key only after success (optional hardening)
- Defer writing the recovery key to `FlutterSecureStorage` until bootstrap reaches `BootstrapState.done` and the user has opted in (checkbox). This avoids persisting unusable keys when setup fails mid-way.

#### 4) Add a loading timeout (optional UX improvement)
- If `BootstrapState.loading` persists for > 30s, show an error with actions: Retry, Re-enter key, Wipe backup.

---

### Validation checklist
1. Fresh install, valid key → completes and reaches `done`.
2. Fresh install, wrong key → shows immediate error (no infinite spinner).
3. Lost key flow → wipe SSSS, create new key, copy, proceed → completes and stores key after success.
4. Devices with/without prior stored key → both paths behave consistently.
5. Vodozemac init missing → shows "Encryption Not Available" (separate failure path), not a spinner.

---

### Summary
- Use `unlockWithRecoveryKey(key)` before invoking `bootstrap.unlockedSsss()` / `bootstrap.openExistingSsss()`.
- Remove invalid attempts to set `ssss.recoveryKey` directly.
- Add timeouts and clearer error messages for robustness across devices.


