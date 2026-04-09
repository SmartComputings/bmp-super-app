// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Hungarian (`hu`).
class L10nHu extends L10n {
  L10nHu([String locale = 'hu']) : super(locale);

  @override
  String get alwaysUse24HourFormat => 'hamis';

  @override
  String get repeatPassword => 'Jelszó ismétlése';

  @override
  String get notAnImage => 'Nem kép fájl.';

  @override
  String get setCustomPermissionLevel => 'Egyedi engedélyszint beállítása';

  @override
  String get setPermissionsLevelDescription =>
      'Kérem, válasszon egy előre meghatározott szerepkört, vagy adjon meg egy egyedi engedély szintet 0 és 100 között.';

  @override
  String get ignoreUser => 'Felhasználó ignorálása';

  @override
  String get normalUser => 'Normál felhasználó';

  @override
  String get remove => 'Eltávolítás';

  @override
  String get importNow => 'Importálás most';

  @override
  String get importEmojis => 'Emojik importálása';

  @override
  String get importFromZipFile => 'Importálás zip fájlból';

  @override
  String get exportEmotePack => 'Emojicsomag exportálása zip-be';

  @override
  String get replace => 'Kicserél';

  @override
  String get about => 'Névjegy';

  @override
  String aboutHomeserver(String homeserver) {
    return 'Névjegy $homeserver';
  }

  @override
  String get accept => 'Elfogad';

  @override
  String acceptedTheInvitation(String username) {
    return '👍 $username elfogadta a meghívást';
  }

  @override
  String get account => 'Fiók';

  @override
  String activatedEndToEndEncryption(String username) {
    return '🔐 $username aktiválta a végpontok közötti titkosítást';
  }

  @override
  String get addEmail => 'E-mail-cím hozzáadása';

  @override
  String get confirmMatrixId =>
      'Kérem, igazolja vissza user ID-jét a fiók törléséhez.';

  @override
  String supposedMxid(String mxid) {
    return '$mxid-nek kell lennie';
  }

  @override
  String get addChatDescription => 'Chat leírás hozzáadása...';

  @override
  String get addToSpace => 'Hozzáadás a térhez';

  @override
  String get admin => 'Adminisztrátor';

  @override
  String get alias => 'álnév';

  @override
  String get all => 'Összes';

  @override
  String get allChats => 'Összes csevegés';

  @override
  String get commandHint_roomupgrade =>
      'Szoba frissítése a megadott szoba verzióra';

  @override
  String get commandHint_googly => 'Gülüszemek küldése';

  @override
  String get commandHint_cuddle => 'Összebújás küldése';

  @override
  String get commandHint_hug => 'Ölelés küldése';

  @override
  String googlyEyesContent(String senderName) {
    return '$senderName gülüszemeket küld';
  }

  @override
  String cuddleContent(String senderName) {
    return '$senderName hozzád bújik';
  }

  @override
  String hugContent(String senderName) {
    return '$senderName megölel';
  }

  @override
  String answeredTheCall(String senderName) {
    return '$senderName válaszolt a hívásra';
  }

  @override
  String get anyoneCanJoin => 'Bárki csatlakozhat';

  @override
  String get appLock => 'Alkalmazás zár';

  @override
  String get appLockDescription =>
      'Applikáció zárolása PIN kóddal használaton kívül';

  @override
  String get archive => 'Archívum';

  @override
  String get unArchive => 'Unarchive';

  @override
  String get areGuestsAllowedToJoin => 'Csatlakozhatnak-e vendégek';

  @override
  String get areYouSure => 'Biztos benne?';

  @override
  String get areYouSureYouWantToLogout => 'Biztosan kijelentkezik?';

  @override
  String get askSSSSSign =>
      'A másik fél igazolásához meg kell adnia a biztonságos tároló jelmondatát vagy a visszaállítási kulcsotát.';

  @override
  String askVerificationRequest(String username) {
    return 'Elfogadja $username hitelesítési kérelmét?';
  }

  @override
  String get autoplayImages =>
      'Animált matricák és hangulatjelek automatikus lejátszása';

  @override
  String badServerLoginTypesException(String serverVersions,
      String supportedVersions, Object suportedVersions) {
    return 'A Matrix-kiszolgáló a következő bejelentkezéseket támogatja:\n$serverVersions\nDe ez az alkalmazást csak ezeket támogatja:\n$supportedVersions';
  }

  @override
  String get sendTypingNotifications => 'Gépelési értesítés megjelenítése';

  @override
  String get swipeRightToLeftToReply => 'Húzza balra a válaszoláshoz';

  @override
  String get alwaysShowMessageTimestamps => 'Always Show Message Timestamps';

  @override
  String get alwaysShowMessageTimestampsDescription =>
      'Show timestamps for every message like WhatsApp';

  @override
  String get attachmentCamera => 'Camera';

  @override
  String get attachmentGallery => 'Gallery';

  @override
  String get attachmentDocument => 'Document';

  @override
  String get attachmentLocation => 'Location';

  @override
  String get attachmentContact => 'Contact';

  @override
  String get attachmentSend => 'Send';

  @override
  String get attachmentRequest => 'Request';

  @override
  String get attachmentQR => 'QR';

  @override
  String get attachmentGift => 'Gift';

  @override
  String get attachmentFavorite => 'Favorite';

  @override
  String get sendOnEnter => 'Küldés Enterrel';

  @override
  String badServerVersionsException(
      String serverVersions,
      String supportedVersions,
      Object serverVerions,
      Object supoortedVersions,
      Object suportedVersions) {
    return 'A Matrix-kiszolgáló ezeket a specifikált verziókat támogatja:\n$serverVersions\nAzonban ez az app csak a következőket: $supportedVersions';
  }

  @override
  String countChatsAndCountParticipants(int chats, int participants) {
    return '$chats csevegések és $participants résztvevők';
  }

  @override
  String countMembers(int count) {
    return '$count Members';
  }

  @override
  String get noMoreChatsFound => 'Nem található több csevegés...';

  @override
  String get noChatsFoundHere =>
      'Itt még nem található csevegés. Kezdjen egy új csevegést valakivel a lenti gomb segítéségvel. ⤵️';

  @override
  String get joinedChats => 'Csatlakozott csevegések';

  @override
  String get unread => 'Olvasatlan';

  @override
  String get space => 'Tér';

  @override
  String get spaces => 'Terek';

  @override
  String get banFromChat => 'Kitiltás a csevegésből';

  @override
  String get banned => 'Kitiltva';

  @override
  String bannedUser(String username, String targetName) {
    return '$username kitiltva $targetName által';
  }

  @override
  String get blockDevice => 'Eszköz blokkolása';

  @override
  String get blocked => 'Blokkolva';

  @override
  String get botMessages => 'Bot üzenetek';

  @override
  String get cancel => 'Mégse';

  @override
  String cantOpenUri(String uri) {
    return 'Nem sikerült a következő URI megnyitása: $uri';
  }

  @override
  String get changeDeviceName => 'Eszköznév módosítása';

  @override
  String changedTheChatAvatar(String username) {
    return '$username módosította a csevegési profilképét';
  }

  @override
  String changedTheChatDescriptionTo(String username, String description) {
    return '$username megváltoztatta a csevegés leírást a következőre: \'$description\'';
  }

  @override
  String changedTheChatNameTo(String username, String chatname) {
    return '$username módosította a csevegés nevét a következőre: \'$chatname\'';
  }

  @override
  String changedTheChatPermissions(String username) {
    return '$username módosította a csevegési engedélyeket';
  }

  @override
  String changedTheDisplaynameTo(String username, String displayname) {
    return '$username módosította a megjelenített nevét erre: \'$displayname\'';
  }

  @override
  String changedTheGuestAccessRules(String username) {
    return '$username módosította a vendégek hozzáférési szabályokat';
  }

  @override
  String changedTheGuestAccessRulesTo(String username, String rules) {
    return '$username módosította a vendégek hozzáférési szabályait a következőre: $rules';
  }

  @override
  String changedTheHistoryVisibility(String username) {
    return '$username módosította az előzmények láthatóságát';
  }

  @override
  String changedTheHistoryVisibilityTo(String username, String rules) {
    return '$username módosította az előzmények láthatóságát a következőre: $rules';
  }

  @override
  String changedTheJoinRules(String username) {
    return '$username módosított a csatlakozási szabályokat';
  }

  @override
  String changedTheJoinRulesTo(String username, String joinRules) {
    return '$username módosította a csatlakozási szabályokat a következőre: $joinRules';
  }

  @override
  String changedTheProfileAvatar(String username) {
    return '$username módosította a profilképét';
  }

  @override
  String changedTheRoomAliases(String username) {
    return '$username módosította a szoba álneveit';
  }

  @override
  String changedTheRoomInvitationLink(String username) {
    return '$username módosította a meghívó hivatkozást';
  }

  @override
  String get changePassword => 'Jelszó módosítása';

  @override
  String get changeTheHomeserver => 'Matrix-kiszolgáló váltás';

  @override
  String get changeTheme => 'Stílusának módosítása';

  @override
  String get changeTheNameOfTheGroup => 'Csoport nevének módosítása';

  @override
  String get changeYourAvatar => 'Profilkép módosítása';

  @override
  String get channelCorruptedDecryptError => 'A titkosítás megsérült';

  @override
  String get chat => 'Csevegés';

  @override
  String get yourChatBackupHasBeenSetUp =>
      'A csevegés biztonsági mentés beállításra került.';

  @override
  String get welcome => 'Welcome';

  @override
  String get welcomeSubtitle => 'To an unprecedented experience';

  @override
  String get welcomeDescription =>
      'Here you don\'t just have an app. You have your world in the palm of your hand: connect, buy, pay, explore and transform your day... without leaving Bemind';

  @override
  String get getStarted => 'Get Started';

  @override
  String get chatTitle => 'Chat';

  @override
  String get chatSubtitle => 'Chat, share, and pay all in one place.';

  @override
  String get chatDescription => 'Csevegés leírás';

  @override
  String get goToChat => 'Go to Chat';

  @override
  String get financeTitle => 'Finance';

  @override
  String get financeSubtitle => 'Your money, made simple.';

  @override
  String get financeDescription =>
      'Send, receive, convert, pay with QR, or add funds all in one place. No - hassle. No surprises.';

  @override
  String get goToWallet => 'Go to Wallet';

  @override
  String get marketplaceTitle => 'Marketplace';

  @override
  String get marketplaceSubtitle =>
      'Shop without searching - find what you need.';

  @override
  String get marketplaceDescription =>
      'Products, services, and experiences curated for you. Real prices, no strings attached, and all paid for with your wallet, right from the app.';

  @override
  String get goToMarketplace => 'Go to Marketplace';

  @override
  String get appsTitle => 'Apps';

  @override
  String get appsSubtitle => 'Your favorite apps, already integrated.';

  @override
  String get appsDescription =>
      'From delivery and rides to subscriptions and bookings - everything\'s just one tap away.';

  @override
  String get goToApps => 'Go to Apps';

  @override
  String get communitiesTitle => 'Community';

  @override
  String get communitiesSubtitle => 'Connect, share and create.';

  @override
  String get communitiesDescription =>
      'Discover what others are sharing - or share your own. This isn\'t just social media... it\'s your space, your voice, your place in the digital world.';

  @override
  String get goToCommunity => 'Go to Community';

  @override
  String get music => 'Music';

  @override
  String get yourRhythmYourSpace => 'Your rhythm, your space';

  @override
  String get musicDescription =>
      'Stream your favorite tunes while you chat, shop, or explore - all in one place. Press play on what feels right for you.';

  @override
  String get mentalHealth => 'Mental Health';

  @override
  String get yourPeaceAlsoMatters => 'Your peace matters too';

  @override
  String get mentalHealthDescription =>
      'Discover Breathing exercises, gentle reminders to unplug, and daily wellness tips designed to help you feel your best.';

  @override
  String get aiFinance => 'A.I: Finance';

  @override
  String get letMoneyThinkToo => 'Let your money think for you';

  @override
  String get aiFinanceDescription =>
      'Our al tracks you habits, sends smart alerts, and gives clear, simple recommendations to help you manage your money - no jargon, no confusion.';

  @override
  String get nutrition => 'Nutrition';

  @override
  String get eatWithoutComplications => 'Eat well, without the hassle.';

  @override
  String get nutritionDescription =>
      'Get personalized recipes based on what\'s in your fridge, custom menus, helpful alerts - and daily tips to help you feel your best.';

  @override
  String get accessDenied => 'Access Denied';

  @override
  String get searchError => 'Search Error';

  @override
  String get accessRequired => 'Access Required';

  @override
  String get cameraAccessRequired =>
      'Camera access is required for KYC document verification. Please enable camera permission in app settings.';

  @override
  String get openSettings => 'Open Settings';

  @override
  String get success => 'Success';

  @override
  String get info => 'Info';

  @override
  String get loading => 'Loading...';

  @override
  String get joinMeOnBeMindPower => 'Join me on Be MindPower!';

  @override
  String inviteMessageBody(String displayName) {
    return 'Hi, I\'m $displayName and I\'d like to invite you to chat with me on Be MindPower.';
  }

  @override
  String downloadTheApp(String url) {
    return 'Download the app: $url';
  }

  @override
  String get beMindPowerTagline =>
      'Be MindPower - Connect, Chat, and Grow Together!';

  @override
  String failedToCreateInvite(String error) {
    return 'Failed to create invite: $error';
  }

  @override
  String get emailVerification => 'Email Verification';

  @override
  String get verifyingYourEmail => 'Verifying your email...';

  @override
  String get pleaseWaitWhileWeCompleteRegistration =>
      'Please wait while we complete your registration.';

  @override
  String get registrationComplete => 'Registration Complete!';

  @override
  String get emailVerifiedAndAutoLoginSuccessful =>
      'Email verified and auto-login successful.\nRedirecting to your dashboard...';

  @override
  String get verificationFailed => 'Verification failed';

  @override
  String get tryAgain => 'Próbálja újra';

  @override
  String get emailVerifiedRedirecting =>
      'Email verified! Redirecting to login...';

  @override
  String get emailVerificationFailedTryAgain =>
      'Email verification failed. Please try again.';

  @override
  String get verificationError => 'Verification Error';

  @override
  String get goToLogin => 'Go to Login';

  @override
  String get pleaseLogInToAccessArchive => 'Please log in to access archive';

  @override
  String get error => 'Error';

  @override
  String get errorAccessingArchive => 'Error accessing archive';

  @override
  String get contacts => 'Contacts';

  @override
  String get filter => 'Filter';

  @override
  String get unreadChat => 'Unread Chat';

  @override
  String get noResultsFound => 'No results found';

  @override
  String get search => 'Keresés';

  @override
  String get select => 'Kiválaszt';

  @override
  String get markRead => 'Mark Read';

  @override
  String get markUnread => 'Mark Unread';

  @override
  String get blockUser => 'Block User';

  @override
  String get read => 'Read';

  @override
  String get myWallet => 'My Wallet';

  @override
  String get myBank => 'My Bank';

  @override
  String get home => 'Home';

  @override
  String get logout => 'Kijelentkezés';

  @override
  String get favorites => 'Favorites';

  @override
  String get unfavorite => 'Unfavorite';

  @override
  String get noFavoritesYet => 'No favorites yet';

  @override
  String get starMessagesToAddFavorites =>
      'Star messages to add them to favorites';

  @override
  String get removedFromFavorites => 'Removed from favorites';

  @override
  String get unknownRoom => 'Unknown room';

  @override
  String get unknownTime => 'Unknown time';

  @override
  String errorWithMessage(String message) {
    return 'Error: $message';
  }

  @override
  String get newMessage => 'New Message';

  @override
  String get searchUsers => 'Search @users...';

  @override
  String yourGlobalUsernameIs(String username) {
    return 'Your global username is: @$username';
  }

  @override
  String get invitationLink => 'Invitation link';

  @override
  String get sendLinkToChat => 'Send a link to chat.';

  @override
  String get createGroupChat => 'Create a group chat.';

  @override
  String get scanQRCode => 'Scan a QR code.';

  @override
  String get scanQRCodeDescription => 'Scan a QR code.';

  @override
  String get errorSearchingUsers => 'Error searching users';

  @override
  String get noUsersFound => 'No users found';

  @override
  String get permissionDenied => 'Permission Denied';

  @override
  String get searchContact => 'Search contact';

  @override
  String get noContactsFound => 'No contacts found';

  @override
  String get group => 'Csoport';

  @override
  String get calls => 'Hívások';

  @override
  String get done => 'Done!';

  @override
  String get taskCompletedSuccessfully => 'Task is completed\nsuccessfully';

  @override
  String get goBack => 'Go Back';

  @override
  String get signupSuccessMessage => 'You\'ve signed up \nsuccessfully';

  @override
  String get chatBackup => 'Csevegés biztonsági mentés';

  @override
  String get chatBackupDescription =>
      'A régebbi beszélgetései egy biztonsági kulccsal vannak védve. Bizonyosodjon meg róla, hogy nem veszíti el.';

  @override
  String get paywallTitle => 'Premium BM';

  @override
  String get paywallSubtitle => 'Unlock the true potential of your community';

  @override
  String get firstMonthLabel => 'First month free';

  @override
  String get thenEnjoyMemberPriceLabel => 'Then enjoy our member price';

  @override
  String get usdMonthLabel => 'USD/mo';

  @override
  String get yearlyPlanOfferLabel => 'Annual plan, 1 month free included';

  @override
  String get annualLabel => 'Annual';

  @override
  String get confirmSelectionLabel => 'Please confirm your selection';

  @override
  String get confirmButton => 'Confirm';

  @override
  String get thisMonthIsOnUs => 'This month is on us';

  @override
  String get ifYouLoveItContinueFor => 'If you love it, continue for';

  @override
  String get thenEnjoyMemberPriceForJust =>
      'Then enjoy a member price for just';

  @override
  String get usdMonth => 'USD month';

  @override
  String get yearlyPlanOfferText =>
      'You can also get our yearly plan for only:';

  @override
  String get confirmYourSelection => 'Confirm your selection';

  @override
  String get addPaymentMethod => 'Add Payment Method';

  @override
  String get applePay => 'Apple Pay';

  @override
  String get googlePay => 'Google Pay';

  @override
  String get orPayWithCard => 'OR PAY WITH CARD';

  @override
  String get quickPay => 'Quick Pay';

  @override
  String get creditOrDebitCard => 'Credit or Debit Card';

  @override
  String get invalidCardDetails =>
      'Invalid card details. Please check and try again.';

  @override
  String get subscriptionActivated => 'Subscription activated!';

  @override
  String get chatDetails => 'Csevegés részletei';

  @override
  String get chatHasBeenAddedToThisSpace => 'Csevegés hozzáadva a térhez';

  @override
  String get chats => 'Csevegések';

  @override
  String get chooseAStrongPassword => 'Válasszon egy erős jelszót';

  @override
  String get clearArchive => 'Archívum ürítése';

  @override
  String get close => 'Bezár';

  @override
  String get commandHint_markasdm =>
      'Szoba megjelölése mint közvetlen csevegő szoba az adott Matrix ID-nél';

  @override
  String get commandHint_markasgroup => 'Jelölés csoportnak';

  @override
  String get commandHint_ban => 'Adott felhasználó kitiltása a szobából';

  @override
  String get commandHint_clearcache => 'Gyorsítótár törlése';

  @override
  String get commandHint_create =>
      'Egy üres csevegő csoport létrehozása\nA --no-encryption paraméterrel feloldhatja a titkosítást';

  @override
  String get commandHint_discardsession => 'Munkamenet elvetése';

  @override
  String get commandHint_dm =>
      'Közvetlen csevegés indítása\nA --no-encryption paraméterrel kikapcsolhatja a titkosítást';

  @override
  String get commandHint_html => 'HTML formázott szöveg küldése';

  @override
  String get commandHint_invite => 'Adott felhasználó meghívása ebbe a szobába';

  @override
  String get commandHint_join => 'Csatlakozás a megadott szobához';

  @override
  String get commandHint_kick => 'A megadott felhasználó kirúgása a szobából';

  @override
  String get commandHint_leave => 'Szoba elhagyása';

  @override
  String get commandHint_me => 'Írja le magát';

  @override
  String get commandHint_myroomavatar =>
      'Profilképe hozzárendelése a szobához (mxc URI használatával)';

  @override
  String get commandHint_myroomnick =>
      'Megjelenített nevének hozzárendelése a szobához';

  @override
  String get commandHint_op =>
      'Az adott felhasználó hozzáférési szintjének megadása (alapértelmezett: 50)';

  @override
  String get commandHint_plain => 'Formázatlan szöveg küldése';

  @override
  String get commandHint_react => 'Válasz küldése reakcióként';

  @override
  String get commandHint_send => 'Szöveg küldése';

  @override
  String get commandHint_unban =>
      'Adott felhasználó kitiltásának feloldása a szobához';

  @override
  String get commandInvalid => 'Érvénytelen parancs';

  @override
  String commandMissing(String command) {
    return '$command nem egy parancs.';
  }

  @override
  String get compareEmojiMatch => 'Kérem, hasonlítsa össze a hangulatjeleket';

  @override
  String get compareNumbersMatch => 'Kérem, hasonlítsa össze a számokat';

  @override
  String get configureChat => 'Csevegés konfigurálása';

  @override
  String get confirm => 'Megerősít';

  @override
  String get connect => 'Csatlakozás';

  @override
  String get contactHasBeenInvitedToTheGroup =>
      'Kapcsolat meghívásra került a csoportba';

  @override
  String get containsDisplayName => 'Tartalmazza a megjelenített nevet';

  @override
  String get containsUserName => 'Tartalmazza a felhasználónevet';

  @override
  String get contentHasBeenReported =>
      'A tartalom jelentésre került a szerver adminisztrátorok számára';

  @override
  String get copiedToClipboard => 'Vágólapra másolva';

  @override
  String get copy => 'Másolás';

  @override
  String get copyToClipboard => 'Vágólapra másolás';

  @override
  String couldNotDecryptMessage(String error) {
    return 'Nem sikerült visszafejteni az üzenetet: $error';
  }

  @override
  String get checkList => 'Tennivalók listája';

  @override
  String countParticipants(int count) {
    return '$count résztvevő';
  }

  @override
  String countInvited(int count) {
    return '$count meghívott';
  }

  @override
  String get create => 'Létrehoz';

  @override
  String createdTheChat(String username) {
    return '💬 $username csevegést hozott létre';
  }

  @override
  String get createGroup => 'Csoport létrehozása';

  @override
  String get createNewSpace => 'Új tér';

  @override
  String get currentlyActive => 'Jelenleg aktív';

  @override
  String get darkTheme => 'Sötét';

  @override
  String dateAndTimeOfDay(String date, String timeOfDay) {
    return '$date, $timeOfDay';
  }

  @override
  String dateWithoutYear(String month, String day) {
    return '$month. $day.';
  }

  @override
  String dateWithYear(String year, String month, String day) {
    return '$year. $month. $day.';
  }

  @override
  String get deactivateAccountWarning =>
      'Ez deaktiválja a felhasználói fiókját. Ez nem vonható vissza! Biztos benne?';

  @override
  String get defaultPermissionLevel =>
      'Alapértelmezett hozzáférési szint új felhasználóknál';

  @override
  String get delete => 'Törlés';

  @override
  String get deleteAccount => 'Fiók törlése';

  @override
  String get deleteMessage => 'Üzenet törlése';

  @override
  String get device => 'Eszköz';

  @override
  String get deviceId => 'Eszköz ID';

  @override
  String get devices => 'Eszközök';

  @override
  String get directChats => 'Privát Csevegések';

  @override
  String get allRooms => 'Minden Csoport Csevegés';

  @override
  String get displaynameHasBeenChanged => 'A megjelenítési név megváltozott';

  @override
  String get download => 'Download';

  @override
  String get downloadFile => 'Fájl letöltése';

  @override
  String get edit => 'Szerkeszt';

  @override
  String get editBlockedServers => 'Blokkolt szerverek szerkesztése';

  @override
  String get chatPermissions => 'Csevegés engedélyek';

  @override
  String get editDisplayname => 'Megjelenítési név szerkesztése';

  @override
  String get editRoomAliases => 'Szoba álnevek szerkesztése';

  @override
  String get editRoomAvatar => 'Szoba-profilkép szerkesztése';

  @override
  String get emoteExists => 'A hangulatjel már létezik!';

  @override
  String get emoteInvalid => 'Érvénytelen hangulatjel rövidkód!';

  @override
  String get emoteKeyboardNoRecents =>
      'A nemrég használt hangulatjelek fognak itt megjelenni...';

  @override
  String get emotePacks => 'Hangulatjel csomagok a szobához';

  @override
  String get emoteSettings => 'Hangulatjel Beállítások';

  @override
  String get globalChatId => 'Átfogó csevegő ID';

  @override
  String get accessAndVisibility => 'Hozzáférés és láthatóság';

  @override
  String get accessAndVisibilityDescription =>
      'Ki számára engedélyezett a csevegéshez való csatlakozás, és hogyan találhatja azt meg.';

  @override
  String get customEmojisAndStickers => 'Egyedi hangulatjelek és matricák';

  @override
  String get customEmojisAndStickersBody =>
      'Egyedi hangulatjelek és matricák hozzáadása, amelyek bármely csevegésben felhasználhatóak.';

  @override
  String get emoteShortcode => 'Hangulatjel rövidkód';

  @override
  String get emoteWarnNeedToPick =>
      'Ki kell választania egy hangulatjel rövidkódot és egy képet!';

  @override
  String get emptyChat => 'Üres csevegés';

  @override
  String get enableEmotesGlobally =>
      'Hangulatjel csomag engedélyezése globálisan';

  @override
  String get enableEncryption => 'Titkosítás engedélyezése';

  @override
  String get enableEncryptionWarning =>
      'Többé nem fogja tudni kikapcsolni a titkosítást. Biztos benne?';

  @override
  String get encrypted => 'Titkosított';

  @override
  String get encryption => 'Titkosítás';

  @override
  String get encryptionNotEnabled => 'Titkosítás nem engedélyezve';

  @override
  String endedTheCall(String senderName) {
    return '$senderName befejezte a hívást';
  }

  @override
  String get enterAnEmailAddress => 'Adjon meg egy email címet';

  @override
  String get homeserver => 'Matrix-kiszolgáló';

  @override
  String get enterYourHomeserver => 'Adja meg a Matrix-kiszolgálóját';

  @override
  String errorObtainingLocation(String error) {
    return 'Hiba a helymeghatározáskor: $error';
  }

  @override
  String get everythingReady => 'Minden kész!';

  @override
  String get extremeOffensive => 'Rendkívül sértő';

  @override
  String get fileName => 'Fájlnév';

  @override
  String get fluffychat => 'FluffyChat';

  @override
  String get fontSize => 'Betűméret';

  @override
  String get forward => 'Továbbítás';

  @override
  String get fromJoining => 'Csatlakozás óta';

  @override
  String get fromTheInvitation => 'Meghívás óta';

  @override
  String get goToTheNewRoom => 'Ugrás az új szobába';

  @override
  String get chatDescriptionHasBeenChanged => 'A csevegés leírás megváltozott';

  @override
  String get groupIsPublic => 'A csoport nyilvános';

  @override
  String get groups => 'Csoportok';

  @override
  String groupWith(String displayname) {
    return 'Csoport $displayname-al';
  }

  @override
  String get guestsAreForbidden => 'A vendégek nem engedélyezettek';

  @override
  String get guestsCanJoin => 'Csatlakozhatnak vendégek';

  @override
  String hasWithdrawnTheInvitationFor(String username, String targetName) {
    return '$username visszavonta $targetName meghívását';
  }

  @override
  String get help => 'Súgó';

  @override
  String get hideRedactedEvents => 'Szerkesztett események elrejtése';

  @override
  String get hideRedactedMessages => 'Szerkesztett üzenetek elrejtése';

  @override
  String get hideRedactedMessagesBody =>
      'Ha valaki szerkeszti az üzenetét, ez az üzenet nem jelenik meg a csevegés során.';

  @override
  String get hideInvalidOrUnknownMessageFormats =>
      'Érvénytelen vagy ismeretlen üzenetformátum elrejtése';

  @override
  String get howOffensiveIsThisContent => 'Mennyire sértő ez a tartalom?';

  @override
  String get id => 'ID';

  @override
  String get identity => 'Azonosító';

  @override
  String get block => 'Blokkolás';

  @override
  String get blockedUsers => 'Blokkolt felhasználók';

  @override
  String get blockListDescription =>
      'Az Önt zavaró felhasználókat blokkolhatja. A blokkolt listán található felhasználóktól nem tud fogadni üzenetet vagy szoba meghívást.';

  @override
  String get blockUsername => 'Felhasználónév ignorálása';

  @override
  String get iHaveClickedOnLink => 'Rákattintottam a linkre';

  @override
  String get incorrectPassphraseOrKey =>
      'Hibás jelmondat vagy visszaállítási kulcs';

  @override
  String get inoffensive => 'Nem sértő';

  @override
  String get inviteContact => 'Ismerős meghívása';

  @override
  String inviteContactToGroupQuestion(Object contact, Object groupName) {
    return 'Meg kívánja hívni $contact ismerősét a \"$groupName\" csevegő csoportba?';
  }

  @override
  String inviteContactToGroup(String groupName) {
    return 'Ismerős meghívása a(z) $groupName csoportba';
  }

  @override
  String get noChatDescriptionYet => 'Még nincs csevegő szoba leírás.';

  @override
  String get hangup => 'Hangup';

  @override
  String get logoutConfirmTitle => 'Logout';

  @override
  String get logoutConfirmMessage => 'Are you sure you want to logout?';

  @override
  String get logoutButton => 'Logout';

  @override
  String get comingSoon => 'Coming soon';

  @override
  String get searchApps => 'Search apps...';

  @override
  String get education => 'Education';

  @override
  String get game => 'Game';

  @override
  String get sport => 'Sport';

  @override
  String get animal => 'Animal';

  @override
  String get love => 'Love';

  @override
  String get traveling => 'Traveling';

  @override
  String get automotive => 'Automotive';

  @override
  String get popular => 'Popular';

  @override
  String get food => 'Food';

  @override
  String get health => 'Health';

  @override
  String get shopping => 'Shopping';

  @override
  String get art => 'Art';

  @override
  String get spiritual => 'Spiritual';

  @override
  String get maintenance => 'Maintenance';

  @override
  String get lifestyle => 'Lifestyle';

  @override
  String get construction => 'Construction';

  @override
  String get camera => 'Camera';

  @override
  String get comingSoonEllipsis => 'Coming Soon...';

  @override
  String get exploreFeatures => 'Explore Features';

  @override
  String get welcomeToBeMindPower => 'Welcome to \n BeMind Power';

  @override
  String get signUpForAnAccount => 'Sign up for an account';

  @override
  String get whatTypeOfAccountDoYouWantToOpen =>
      'What type of account do you want to open?';

  @override
  String get naturalPerson => 'Natural person';

  @override
  String get verificationEmailSent => 'Verification Email Sent!';

  @override
  String get pleaseCheckEmailAndVerify =>
      'Please check your email and click the verification link, then click \"Complete Registration\" below.';

  @override
  String get clickCompleteAfterVerifying =>
      'Click \"Complete Registration\" after verifying your email.';

  @override
  String get completeRegistration => 'Complete registration';

  @override
  String get startOver => 'Start Over';

  @override
  String get successfullyRegistered => 'Successfully registered!';

  @override
  String get emailVerificationRequired => 'Email Verification Required';

  @override
  String get pleaseVerifyEmailFirst =>
      'Please check your email and click the verification link first, then try again.';

  @override
  String get sessionExpiredStartOver =>
      'Your session has expired. Please start the registration process again.';

  @override
  String get pleaseVerifyEmailBeforeCompleting =>
      'Please verify your email address before completing registration.';

  @override
  String get gotIt => 'Got it';

  @override
  String get createPassword => 'Create password';

  @override
  String get enterYourPassword => 'Enter your password';

  @override
  String get confirmPassword => 'Confirm password';

  @override
  String get alreadyHaveAccount => 'Already have an account?';

  @override
  String get logIn => 'Log in';

  @override
  String get federationBaseURL => 'Federation Base URL';

  @override
  String get clientWellKnownInformation => 'Client-Well-Known Information:';

  @override
  String get baseURL => 'Base URL';

  @override
  String get identityServer => 'Identity Server:';

  @override
  String get defaultPack => 'Default Pack';

  @override
  String get pushError => 'Push Error';

  @override
  String get deleteError => 'Delete Error';

  @override
  String get answer => 'Answer';

  @override
  String heldTheCall(String displayName) {
    return '$displayName held the call.';
  }

  @override
  String get youHeldTheCall => 'You held the call.';

  @override
  String get foregroundServiceRunning =>
      'Ez az értesítés akkor jelenik meg ha az előtéri szolgáltatás fut.';

  @override
  String get screenSharingTitle => 'képernyő megosztás';

  @override
  String get screenSharingDetail => 'Megosztja a képernyőjét a FluffyChat-ben';

  @override
  String get emailVerificationFailed => 'Email verification failed';

  @override
  String get unableToGetSession => 'Unable to get session for registration';

  @override
  String get registrationFailed => 'Registration failed';

  @override
  String get networkError =>
      'Network error. Please check your connection and try again.';

  @override
  String emailVerificationFailedWithError(String error) {
    return 'Email verification failed: $error';
  }

  @override
  String get registrationDataNotFound =>
      'Registration data not found. Please start registration again.';

  @override
  String get usernameAlreadyExists => 'Username already exists';

  @override
  String get unableToGetSessionTryAgain =>
      'Unable to get session. Please try again.';

  @override
  String get emailNotVerifiedYet =>
      'Email not verified yet. Please check your inbox and click the verification link.';

  @override
  String get usernameAlreadyExistsChooseDifferent =>
      'Username already exists. Please choose a different username.';

  @override
  String get emailAlreadyRegistered => 'Email Already Registered';

  @override
  String get emailAlreadyExist => 'Email already registered';

  @override
  String get networkErrorCheckConnection =>
      'Network error. Please check your connection and try again.';

  @override
  String get bmpDescription =>
      'BMP lets you chat with your friends across different messengers.';

  @override
  String get signUp => 'Sign Up';

  @override
  String photos(int count) {
    return '$count Photos';
  }

  @override
  String videos(int count) {
    return '$count Videos';
  }

  @override
  String files(int count) {
    return 'Fájlok';
  }

  @override
  String audio(int count) {
    return '$count Audio';
  }

  @override
  String get sharedMedia => 'Shared Media';

  @override
  String items(int count) {
    return '$count items';
  }

  @override
  String get noMediaToShow => 'No media to show';

  @override
  String get beTheFirstToShareAMoment => 'Be the first to share a moment';

  @override
  String get file => 'File';

  @override
  String opening(String fileName) {
    return 'Opening $fileName';
  }

  @override
  String get renameChannel => 'Rename Channel';

  @override
  String get renameGroupChannel => 'Rename Group Channel';

  @override
  String get renameGroup => 'Rename group';

  @override
  String get changeGroupName => 'Change the group name';

  @override
  String get setCustomEmotes => 'Egyedi hangulatjelek beállítása';

  @override
  String get whoCanPerformWhichAction => 'Ki milyen műveletet végezhet';

  @override
  String get setting => 'Settings';

  @override
  String get financePersonalInfo => 'Personal\nInfo';

  @override
  String get financeAddress => 'Address';

  @override
  String get financeID => 'ID';

  @override
  String get financeTermsOfService => 'Terms\nof service';

  @override
  String get financeBack => 'Back';

  @override
  String get financeCancel => 'Cancel';

  @override
  String get financeCreate => 'Create';

  @override
  String get financeNext => 'Next';

  @override
  String get financeError => 'Error';

  @override
  String get financeFailedToAcceptToS => 'Failed to accept ToS';

  @override
  String get financeTermsAcceptanceRequired =>
      'Please accept the Terms of Service to continue';

  @override
  String get financeIncompleteFields => 'Incomplete Fields';

  @override
  String get financeValidEmail => 'Valid Email';

  @override
  String get financeBirthDate => 'Birth Date';

  @override
  String get financeStreetAddress => 'Street Address';

  @override
  String get financeCity => 'City';

  @override
  String get financeCountry => 'Search your country';

  @override
  String get financeState => 'Search your state';

  @override
  String get financePostalCode => 'Postal Code';

  @override
  String get financePrimaryID => 'Primary ID';

  @override
  String get financePrimaryIDNumber => 'Primary ID Number';

  @override
  String get financeSecondaryID => 'Secondary ID';

  @override
  String get financeSecondaryIDNumber => 'Secondary ID Number';

  @override
  String get financeIDImages => 'ID Images';

  @override
  String get financeIDType => 'ID Type';

  @override
  String get financeIDNumber => 'ID Number';

  @override
  String get financeSuccess => 'Success';

  @override
  String get financeAnErrorOccurred => 'An error occurred';

  @override
  String get financeAnErrorOccurredTryAgain =>
      'An error occurred. Please try again.';

  @override
  String financeFailedToSetPIN(String message) {
    return 'Failed to set PIN: $message';
  }

  @override
  String get financeCustomerUpdatedSuccess => 'Customer updated successfully';

  @override
  String get financeFirstName => 'First Name';

  @override
  String get financeLastName => 'Last Name';

  @override
  String get unableToPlayVideo => 'Unable to play video';

  @override
  String get notImplemented => 'Not implemented';

  @override
  String get loadingEmojiVerification => 'Loading emoji verification...';

  @override
  String get preparingEmojiVerification => 'Preparing emoji verification...';

  @override
  String get verificationCodesDontMatch =>
      'The verification codes don\'t match. Please try again.';

  @override
  String get verificationCancelled => 'Verification was cancelled by the user';

  @override
  String get otherUserCancelledVerification =>
      'The other user cancelled the verification.';

  @override
  String get verificationTimeout => 'Verification timed out. Please try again.';

  @override
  String get verificationTimedOut =>
      'Verification timed out. Please try again.';

  @override
  String get unknownVerificationTransaction =>
      'Unknown verification transaction. Please start a new verification.';

  @override
  String get methodNotSupported => 'Method Not Supported';

  @override
  String get verificationMethodNotSupported =>
      'Verification method not supported. Please try a different method.';

  @override
  String get unexpectedMessageReceived =>
      'Unexpected message received during verification.';

  @override
  String get keyVerificationFailed => 'Key Verification Failed';

  @override
  String get keysCouldNotBeVerified => 'The keys could not be verified.';

  @override
  String get userVerificationFailed => 'User Verification Failed';

  @override
  String get userIdentityCouldNotBeVerified =>
      'The user identity could not be verified.';

  @override
  String get invalidMessage => 'Invalid Message';

  @override
  String get invalidMessageReceived =>
      'An invalid message was received during verification.';

  @override
  String get alreadyVerified => 'Already Verified';

  @override
  String get verificationAlreadyAccepted =>
      'This verification was already accepted on another device.';

  @override
  String get verificationCancelledByOtherUser =>
      'The verification was cancelled by the other user.';

  @override
  String get tourGuide => 'Tour Guide';

  @override
  String get finance => 'Finance';

  @override
  String get marketplace => 'Marketplace';

  @override
  String get community => 'Community';

  @override
  String get apps => 'Apps';

  @override
  String get addContacts => 'Add Contacts';

  @override
  String get goBackToAllChats => 'Go Back to All Chats';

  @override
  String failedToInviteUser(String roomId) {
    return 'Failed to invite user from room $roomId';
  }

  @override
  String get unableToCreateGroup => 'Unable to create group';

  @override
  String get pleaseFillOut => 'Kérem töltse ki';

  @override
  String get newGroup => 'Új csoport';

  @override
  String get imageGroup => 'Image group';

  @override
  String get groupName => 'Csoport név';

  @override
  String get enterGroupName => 'Enter group name';

  @override
  String get changeNameGroup => 'Change Name Group';

  @override
  String get publicGroup => 'Public Group';

  @override
  String get privateGroup => 'Private Group';

  @override
  String get anyoneCanFindAndJoin => 'Anyone can find and join this group';

  @override
  String get onlyInvitedMembersCanJoin =>
      'Only invited members can join this group';

  @override
  String get endToEndEncryption => 'End-to-End Encryption';

  @override
  String get messagesWillBeEncrypted =>
      'Messages will be encrypted for security';

  @override
  String get messagesWillNotBeEncrypted => 'Messages will not be encrypted';

  @override
  String get pleaseEnterGroupNameFirst => 'Please enter group name first';

  @override
  String get selectFromYourContacts => 'Select from your contacts';

  @override
  String get contactsInGroup => 'Contacts in group';

  @override
  String get unsupportedVersion => 'Unsupported Version';

  @override
  String get copied => 'Copied';

  @override
  String qrCodeScanned(String link) {
    return 'QR Code Scanned: $link';
  }

  @override
  String usernameServer(String username, String server) {
    return 'Username: $username, Server: $server';
  }

  @override
  String extractedUserId(String userId) {
    return 'Extracted User ID: $userId';
  }

  @override
  String get matrixUrlDetected => 'Matrix.to URL or other format detected';

  @override
  String get addCaption => 'Add a caption...';

  @override
  String get selectContact => 'Select Contact';

  @override
  String get scanQR => 'Scan QR';

  @override
  String get messages => 'Üzenetek';

  @override
  String get decline => 'Elutasítás';

  @override
  String youInvitedBy(String user) {
    return '📩 $user jóvoltából kapott meghívást';
  }

  @override
  String get invalidServerName => 'Hibás szerver név';

  @override
  String get archiveRoomDescription =>
      'A csevegés bekerül az archívumba. Más felhasználók látni fogják, hogy elhagyta a csevegést.';

  @override
  String get hidePresences => 'El kívánja rejteni a státusz listát?';

  @override
  String get leaveEmptyToClearStatus => 'Hagyja üresen a státusz kitörléséhez.';

  @override
  String get removeFromBundle => 'Eltávolítás a fiókcsoportból';

  @override
  String get encryptionSetupRequired =>
      'Encryption setup is required for secure messaging. Please complete the setup in Settings.';

  @override
  String get warning => 'Figyelem!';

  @override
  String get noDevicesSelectedForRemoval => 'No devices selected for removal';

  @override
  String get deviceDeletionNotAllowed =>
      'Device deletion not allowed: These devices may be protected, recently active, or require additional permissions from your server administrator. This message will not appear again.';

  @override
  String get deviceDeletionFailed =>
      'Device deletion failed: Server rejected the request.';

  @override
  String failedToRemoveDevices(String error) {
    return 'Failed to remove devices: $error';
  }

  @override
  String get devicesRemovedSuccessfully => 'Devices removed successfully';

  @override
  String errorRemovingDevices(String error) {
    return 'Error removing devices: $error';
  }

  @override
  String get verifyOtherDevice => '🔐 Más eszköz hitelesítése';

  @override
  String get verifyOtherDeviceDescription =>
      'Amikor egy másik eszközt hitelesít, az eszközök kulcsokat cserélnek egymás között, ezáltal növelve az összbiztonságot. 💪 Amikor megkezdődik a folyamat, mind a két eszközön megjelenik egy felugró üzenet. Hangulatjelek és számok sorozata fog megjelenni, amit össze tud hasonlítani a két eszközön. Érdemes tehát mind a két eszközt a közelben tartani. 🤳';

  @override
  String get removeDevicesDescription =>
      'Ki fog jelentkezni a készülékről, és többé nem fog tudni fogadni üzeneteket.';

  @override
  String get failedToLoadChat => 'Failed to load chat. Please try again.';

  @override
  String get encryptionIssue => 'Encryption Issue';

  @override
  String get encryptionStatus => 'Encryption Status';

  @override
  String get room => 'Room';

  @override
  String get clientReady => 'Client Ready';

  @override
  String get roomReady => 'Room Ready';

  @override
  String get canReceive => 'Can Receive';

  @override
  String get recommendations => 'Recommendations';

  @override
  String get fixEncryption => 'Fix Encryption';

  @override
  String get addedToFavorites => 'Added to favorites';

  @override
  String get transferOnlyDirectChats =>
      'Transfer is only available in direct chats';

  @override
  String get transferSuccessful => 'Transfer successful:';

  @override
  String get messageForwardedSuccessfully => 'Message forwarded successfully';

  @override
  String get callsOnlyDirectChats =>
      'Calls are only available in direct chats.';

  @override
  String get mustBeMemberToCall =>
      'You must be a member of this room to start a call.';

  @override
  String get cannotDetermineCallRecipient => 'Cannot determine call recipient.';

  @override
  String get voiceVideoCallsNotAvailable =>
      'Voice and video calls are not available. Please enable them in settings.';

  @override
  String get failedToStartCall => 'Failed to start call';

  @override
  String get startGroupCall => 'Start Group Call';

  @override
  String get chooseGroupCallType => 'Choose the type of group call:';

  @override
  String get voiceGroupCall => 'Voice Group Call';

  @override
  String get videoGroupCall => 'Video Group Call';

  @override
  String get startCall => 'Start Call';

  @override
  String get chooseCallType => 'Choose the type of call you want to make:';

  @override
  String get makeYourFirstCall => 'Make your first call';

  @override
  String get checkBackLater => 'or check back later for new activity';

  @override
  String get startAConversation => 'Start a\nConversation';

  @override
  String get sendMessageToGetStarted => 'Send a message to get started';

  @override
  String get noParticipantsGroupCall =>
      'No participants available for group call.';

  @override
  String get groupCallsInDevelopmentDirectOnly =>
      'Group calls are in development. Please use direct calls for now.';

  @override
  String get invited => 'Meghívott';

  @override
  String get redactMessageDescription =>
      'A társalgásban összes résztvevője számára módosításra kerül az üzenet. Ez nem visszavonható.';

  @override
  String get optionalRedactReason => '(Választható) A szerkesztés oka...';

  @override
  String invitedUser(String username, String targetName) {
    return '📩 $username meghívta $targetName felhasználót';
  }

  @override
  String get invitedUsersOnly => 'Csak meghívott felhasználók';

  @override
  String get inviteForMe => 'Meghívás számomra';

  @override
  String inviteText(String username, String link) {
    return '$username meghívta a BMP.\n1. Regisztráljon vagy jelentkezzen be \n2. Nyissa meg a meghívó linket: \n $link';
  }

  @override
  String get gallery => 'Galéria';

  @override
  String get document => 'Document';

  @override
  String get location => 'Location';

  @override
  String get contact => 'Contact';

  @override
  String get send => 'Küldés';

  @override
  String get request => 'Request';

  @override
  String get qr => 'QR';

  @override
  String get replaceOldestPin => 'Replace oldest pin?';

  @override
  String get yourNewPinWillReplace =>
      'Your new pin will replace the oldest one.';

  @override
  String get gift => 'Gift';

  @override
  String get favorite => 'Favorite';

  @override
  String get recoveryKey => 'Visszaállító kulcs';

  @override
  String get storeInAndroidKeystore => 'Tárolás az Android KeyStore-ba';

  @override
  String get storeInAppleKeyChain => 'Tárolás az Apple KeyChain-be';

  @override
  String get storeSecurlyOnThisDevice => 'Biztonságos tárolás az eszközön';

  @override
  String get storeInSecureStorageDescription =>
      'Tárolja a visszaállítási kulcsot az eszköz biztonsági tárjában.';

  @override
  String get saveKeyManuallyDescription =>
      'A kulcs manuális mentése rendszer megosztás vagy vágólap másolás segítségével.';

  @override
  String get pleaseEnterRecoveryKeyDescription =>
      'A régi üzenetei feloldásához adja meg a korábban generált visszaállítási jelszavát. A visszaállítási jelszó NEM EGYEZIK MEG a jelszóval.';

  @override
  String get unlockOldMessages => 'Régi üzenetek feloldása';

  @override
  String get wrongRecoveryKey =>
      'Sajnos, úgy tűnik hibásan adta meg a visszaállítási kulcsot.';

  @override
  String get recoveryKeyLost => 'Elveszett visszaállító kulcs?';

  @override
  String get wipeChatBackup =>
      'Le kívánja törölni a chat mentését, hogy létrehozhasson egy új visszaállítási kulcsot?';

  @override
  String get isTyping => 'épp gépel…';

  @override
  String joinedTheChat(String username) {
    return '👋 $username csatlakozott a csevegéshez';
  }

  @override
  String get joinRoom => 'Csatlakozás a szobához';

  @override
  String kicked(String username, String targetName) {
    return '👞 $username kirúgta $targetName-t';
  }

  @override
  String kickedAndBanned(String username, String targetName) {
    return '🙅 $username kirúgta és kitiltotta $targetName-t';
  }

  @override
  String get kickFromChat => 'Kirúgás a csevegésből';

  @override
  String lastActiveAgo(String localizedTimeShort) {
    return 'Utoljára aktív: $localizedTimeShort';
  }

  @override
  String get leave => 'Elhagy';

  @override
  String get leftTheChat => 'Elhagyta a csevegést';

  @override
  String get license => 'Licenc';

  @override
  String get lightTheme => 'Világos';

  @override
  String loadCountMoreParticipants(int count) {
    return 'További $count résztvevő betöltése';
  }

  @override
  String get dehydrate => 'Munkamenet exportálása és az eszköz törlése';

  @override
  String get dehydrateWarning =>
      'Ez nem visszavonható. Bizonyosodjon meg róla, hogy biztonságos helyre menti a fájlt.';

  @override
  String get dehydrateTor => 'TOR felhasználók: Munkamenet exportálása';

  @override
  String get dehydrateTorLong =>
      'TOR felhasználóknak ajánlott a munkamenet exportálása az ablak bezárása előtt.';

  @override
  String get hydrateTor => 'TOR felhasználóknak: munkamenet export importálása';

  @override
  String get hydrateTorLong =>
      'Legutóbb TOR segítségével exportálta korábbi munkamenetét? Gyorsan importálja őket vissza, és folytassa a csevegést.';

  @override
  String get hydrate => 'Visszaállítás mentett fájlból';

  @override
  String get loadingPleaseWait => 'Betöltés… Kérem, várjon.';

  @override
  String get loadMore => 'Továbbiak betöltése…';

  @override
  String get locationDisabledNotice =>
      'A helymeghatározás ki van kapcsolva. Kérem, kapcsolja be, hogy meg tudja osztani helyzetét.';

  @override
  String get locationPermissionDeniedNotice =>
      'A helymeghatározás visszautasításra került. Kérem engedélyezze, hogy meg tudja osztani helyzetét.';

  @override
  String get login => 'Bejelentkezés';

  @override
  String logInTo(String homeserver) {
    return 'Bejelentkezés a(z) $homeserver Matrix-kiszolgálóra';
  }

  @override
  String get memberChanges => 'Tagi változások';

  @override
  String get mention => 'Megemlítés';

  @override
  String get messagesStyle => 'Üzenetek:';

  @override
  String get moderator => 'Moderátor';

  @override
  String get muteChat => 'Csevegés némítása';

  @override
  String get needPantalaimonWarning =>
      'Jelenleg a Pantalaimon szükséges a végpontok közötti titkosítás használatához.';

  @override
  String get newChat => 'Új csevegés';

  @override
  String get newMessageInFluffyChat => '💬 Új FluffyChat üzenet';

  @override
  String get newVerificationRequest => 'Új hitelesítési kérelem!';

  @override
  String get next => 'Következő';

  @override
  String get no => 'Nem';

  @override
  String get noConnectionToTheServer => 'Nem elérhető a szerver';

  @override
  String get members => 'Members';

  @override
  String get welcomeToMindPower => 'Welcome to MindPower!';

  @override
  String get accountSuccessfullyCreated =>
      'Your account has been successfully created and verified.';

  @override
  String get takingYouToDashboard => 'Taking you to your dashboard...';

  @override
  String get continueToApp => 'Continue to App';

  @override
  String get quickAccess => 'Quick access';

  @override
  String get cards => 'Cards';

  @override
  String get privacy => 'Adatvédelem';

  @override
  String get notification => 'Notification';

  @override
  String get wallet => 'Wallet';

  @override
  String get allCalls => 'All Calls';

  @override
  String get unreadCalls => 'Unread Calls';

  @override
  String get setChatDescription => 'Csevegés leírás beállítása';

  @override
  String get replaceRoomWithNewerVersion =>
      'Szoba cserélése egy újabb verzióra';

  @override
  String get roomUpgradeDescription =>
      'A csevegés újra elkészül az új szoba verzióval. Minden résztvevő értesítést kap, hogy át kell állniuk az új csevegésre. További információkért a szoba verziókról látogasson el a https://spec.matrix.org/latest/rooms/ címre';

  @override
  String get usersMustKnock => 'A felhasználóknak be kell kopogniuk';

  @override
  String get noOneCanJoin => 'Senki sem csatlakozhat';

  @override
  String get restricted => 'Korlátozott';

  @override
  String get knockRestricted => 'Kopogás korlátozva';

  @override
  String get unknown => 'Unknown';

  @override
  String get openGallery => 'Galéria megnyitása';

  @override
  String get voiceCallsOnlyDirectChats =>
      'Voice calls are only available in direct chats';

  @override
  String get videoCallsOnlyDirectChats =>
      'Video calls are only available in direct chats';

  @override
  String get voiceCallsNotAvailable =>
      'Voice and video calls are not available. Please enable them in settings.';

  @override
  String get videoCallsNotAvailable => 'Video calls are not available';

  @override
  String failedToStartVoiceCall(String error) {
    return 'Failed to start voice call: $error';
  }

  @override
  String failedToStartVideoCall(String error) {
    return 'Failed to start video call: $error';
  }

  @override
  String get unsupportedAndroidVersion => 'Nem támogatott Android verzió';

  @override
  String get unsupportedAndroidVersionLong =>
      'Ehhez a funkcióhoz egy újabb Android verzió kell. Kérem ellenőrizze be van e frissítve teljesen készüléke, esetlegesen van e LineageOS támogatás hozzá.';

  @override
  String get available => 'Available';

  @override
  String get typeMessage => 'Type message..';

  @override
  String get report => 'jelentés';

  @override
  String get selectPhotos => 'Select Photos';

  @override
  String selectPhotosWithCount(int count) {
    return 'Select Photos ($count)';
  }

  @override
  String get galleryAccessRequired => 'Gallery Access Required';

  @override
  String get grantPermission => 'Grant Permission';

  @override
  String get messageInfo => 'Üzenet információ';

  @override
  String get pinnMessage => 'Pin message';

  @override
  String get redactMessage => 'Üzenet szerkesztése';

  @override
  String get reportMessage => 'Üzenet jelentése';

  @override
  String get jumpToLastReadMessage => 'Az utoljára olvasott üzenethez ugrás';

  @override
  String get jump => 'Ugrás';

  @override
  String get enterNewChat => 'Belépés új csevegésbe';

  @override
  String get reopenChat => 'Csevegés újranyitása';

  @override
  String get reply => 'Válasz';

  @override
  String get shareContact => 'Share Contact';

  @override
  String get searchContacts => 'Search contacts';

  @override
  String get loadingContacts => 'Loading contacts...';

  @override
  String get accessYourContacts => 'Access Your Contacts';

  @override
  String get contactsPermissionMessage =>
      'To share contacts with your friends, please allow access to your device contacts.';

  @override
  String get allowAccess => 'Allow Access';

  @override
  String contactsSelected(int count, String plural) {
    return '$count contact$plural selected';
  }

  @override
  String get sending => 'Sending...';

  @override
  String sendCount(int count) {
    return 'Send ($count)';
  }

  @override
  String contactsSharedSuccessfully(int count, String plural) {
    return '$count contact$plural shared successfully';
  }

  @override
  String failedToSendContacts(String error) {
    return 'Failed to send contacts: $error';
  }

  @override
  String get encryptionEnabledButIncomplete =>
      'Encryption is enabled but device verification is incomplete.';

  @override
  String get recreateChatError =>
      'Trying to recreate a room that is not a direct chat. This should not be possible from the UI!';

  @override
  String get transferFunds => 'Transfer Funds';

  @override
  String get checkingRecipient => 'Checking recipient...';

  @override
  String get transferNotAvailable => 'Transfer Not Available';

  @override
  String get recipientNoEthereumWallet =>
      'Recipient has no Ethereum wallet. Please ask them to create an Ethereum wallet first.';

  @override
  String get createEthereumWalletFirst =>
      'You need to create an Ethereum wallet first to make transfers.';

  @override
  String get createCustomerAccountFirstChat =>
      'Please create a customer account first';

  @override
  String get createCustomerAccountFirst =>
      'Please create a customer account first to make transfers.';

  @override
  String get retry => 'Retry';

  @override
  String get createCustomer => 'Create Customer';

  @override
  String get loadingWallets => 'Loading wallets...';

  @override
  String get createWallet => 'Create Wallet';

  @override
  String get loadingRecipientWallets => 'Loading recipient wallets...';

  @override
  String transferPaymentTo(String recipient) {
    return 'Transfer Payment to $recipient';
  }

  @override
  String get amount => 'Amount';

  @override
  String get pleaseEnterAmount => 'Please enter amount';

  @override
  String get pleaseEnterValidAmount => 'Please enter valid amount';

  @override
  String get minimumAmount => 'Minimum amount is \$1';

  @override
  String get maximumAmount => 'Maximum amount is \$10,000';

  @override
  String get currency => 'Currency';

  @override
  String get sourceWallet => 'Source Wallet';

  @override
  String recipientWallets(int count) {
    return 'Recipient Wallets ($count)';
  }

  @override
  String get transfer => 'Transfer';

  @override
  String get pleaseSelectSourceWallet => 'Please select a source wallet';

  @override
  String get createWalletAccountFirst => 'Please create a wallet account first';

  @override
  String get unableToVerifyAccount =>
      'Unable to verify your account. Please try again.';

  @override
  String get unableToFindRecipientAccount => 'Unable to find recipient account';

  @override
  String get transferFailed => 'Transfer Failed';

  @override
  String get otherPartyNotLoggedIn =>
      'A másik fél jelenleg nincs bejelentkezve, emiatt nem fogadhat üzeneteket!';

  @override
  String get transferOnlyInDirectChats =>
      'Transfer is only available in direct chats';

  @override
  String get transferCompleted => 'Transfer Completed';

  @override
  String get transferProcessedSuccessfully =>
      'Transfer has been processed successfully.';

  @override
  String get failedToSendTransferMessage => 'Failed to send transfer message';

  @override
  String get voiceCallStarted => 'Voice call started...';

  @override
  String get videoCallStarted => 'Video call started...';

  @override
  String get callsOnlyInDirectChats =>
      'Calls are only available in direct chats.';

  @override
  String get noParticipantsForGroupCall =>
      'No participants available for group call.';

  @override
  String get groupCallsInDevelopment =>
      'Group calls are in development. Please use direct calls for now.';

  @override
  String get to => 'to';

  @override
  String get chain => 'Chain';

  @override
  String get transactionId => 'Transaction ID';

  @override
  String get sendAsText => 'Küldés szövegként';

  @override
  String get whyDoYouWantToReportThis => 'Miért kívánja ezt bejelenteni?';

  @override
  String get reason => 'Indok';

  @override
  String get offensive => 'Sértő';

  @override
  String get confirmEventUnpin =>
      'Biztosan végleg le akarja venni a kitűzött eseményt?';

  @override
  String get noEmotesFound => 'Nem találhatóak hangulatjelek. 😕';

  @override
  String get addNewEmote => 'Add New Emote';

  @override
  String get shortcode => 'Shortcode';

  @override
  String get image => 'Image';

  @override
  String get addEmote => 'Add Emote';

  @override
  String get chooseImage => 'Choose Image';

  @override
  String get imageSelected => 'Image Selected';

  @override
  String get deleteEmote => 'Delete Emote';

  @override
  String get noEncryptionForPublicRooms =>
      'Csak akkor kapcsolható be a titkosítás, ha a szoba nem nyilvánosan hozzáférhető.';

  @override
  String get noGoogleServicesWarning =>
      'Úgy tűnik a Firebase Cloud Messaging nem elérhető a készülékén. Ha mégis push értesítéseket kíván kapni, javasoljuk a ntfy telepítését. A ntfy vagy más egyéb Egyesített Push szolgáltató esetében úgy kaphat értesítést, hogy adatai biztonságban maradnak. Letöltheti a ntfy-t a PlayStore-ból, vagy F-Droid-ról is.';

  @override
  String noMatrixServer(String server1, String server2) {
    return '$server1 nem egy Matrix szerver, akarja használja a $server2 szervert inkább?';
  }

  @override
  String get shareInviteLink => 'Meghívó link megosztása';

  @override
  String get scanQrCode => 'QR kód beolvasása';

  @override
  String get none => 'Nincs';

  @override
  String get noPasswordRecoveryDescription =>
      'Még nem adott meg semmilyen módszert a jelszava visszaállítására.';

  @override
  String get noPermission => 'Nincs engedély';

  @override
  String get noRoomsFound => 'Nem találhatóak szobák…';

  @override
  String get notifications => 'Értesítések';

  @override
  String get notificationsEnabledForThisAccount =>
      'Értesítések be vannak kapcsolva ebben a fiókban';

  @override
  String numUsersTyping(int count) {
    return '$count felhasználó gépel…';
  }

  @override
  String get obtainingLocation => 'Tartózkodási hely lekérése…';

  @override
  String get locationFound => 'Location Found';

  @override
  String get otherPartyCannotReceiveEncryptedMessages =>
      'Other party cannot receive encrypted messages';

  @override
  String get accuracy => 'Accuracy';

  @override
  String get offline => 'Offline';

  @override
  String get ok => 'Ok';

  @override
  String get online => 'Online';

  @override
  String get onlineKeyBackupEnabled => 'Online kulcsmentés engedélyezve';

  @override
  String get oopsPushError =>
      'Hoppá! Sajnos hiba lépett fel a push értesítések beállításakor.';

  @override
  String get oopsSomethingWentWrong => 'Hoppá, valami hiba lépett fel…';

  @override
  String get openAppToReadMessages =>
      'Alkalmazás megnyitása az üzenetek elolvasásához';

  @override
  String get openCamera => 'Kamera megnyitása';

  @override
  String get openVideoCamera => 'Kamera megnyitása videóhoz';

  @override
  String get oneClientLoggedOut => 'Az egyik kliense kijelentkezett';

  @override
  String get addAccount => 'Fiók hozzáadása';

  @override
  String get editBundlesForAccount =>
      'Fiókcsoportok szerkesztése ehhez a fiókhoz';

  @override
  String get addToBundle => 'Hozzáadás fiókcsoporthoz';

  @override
  String get bundleName => 'Fiókcsoport neve';

  @override
  String get enableMultiAccounts => '(BÉTA) Több fiók bekapcsolása az eszközön';

  @override
  String get openInMaps => 'Megnyitás térképen';

  @override
  String get link => 'Hivatkozás';

  @override
  String get serverRequiresEmail =>
      'Ehhez a szerverhez szükséges az email címének visszaigazolása.';

  @override
  String get or => 'Vagy';

  @override
  String get participant => 'Résztvevő';

  @override
  String get passphraseOrKey => 'jelmondat vagy visszaállítási kulcs';

  @override
  String get password => 'Jelszó';

  @override
  String get passwordForgotten => 'Elfelejtett jelszó';

  @override
  String get passwordHasBeenChanged => 'A jelszó módosításra került';

  @override
  String get hideMemberChangesInPublicChats =>
      'Tag változások elrejtése a publikus csevegésben';

  @override
  String get hideMemberChangesInPublicChatsBody =>
      'Ne mutassa ha valaki be- vagy kilép a csevegésből az olvashatóság javítása érdekében.';

  @override
  String get overview => 'Áttekintés';

  @override
  String get notifyMeFor => 'Értesítsen ha';

  @override
  String get passwordRecoverySettings => 'Jelszó-helyreállítási beállítások';

  @override
  String get passwordRecovery => 'Jelszó visszaállítás';

  @override
  String get people => 'Emberek';

  @override
  String get pickImage => 'Kép választása';

  @override
  String get pin => 'Rögzítés';

  @override
  String play(String fileName) {
    return '$fileName lejátszása';
  }

  @override
  String get pleaseChoose => 'Kérem, válasszon';

  @override
  String get pleaseChooseAPasscode => 'Kérem, válasszon egy kódot';

  @override
  String get pleaseClickOnLink =>
      'Kérem, kattintson a linkre az emailben, és folytassa a műveletet.';

  @override
  String get pleaseEnter4Digits =>
      'Írjon be 4 számjegyet, vagy hagyja üresen a zár kikapcsolásához.';

  @override
  String get pleaseEnterRecoveryKey => 'Kérem, adja meg a visszaállító kódját:';

  @override
  String get pleaseEnterYourPassword => 'Kérem, adja meg jelszavát';

  @override
  String get pleaseEnterYourPin => 'Kérem, írja be PIN kódját';

  @override
  String get pleaseEnterYourUsername => 'Kérem, adja meg a felhasználónevét';

  @override
  String get pleaseFollowInstructionsOnWeb =>
      'Kérem, kövesse az instrukciókat az oldalon, és nyomjon a tovább gombra.';

  @override
  String get publicRooms => 'Nyilvános szobák';

  @override
  String get pushRules => 'Push szabályok';

  @override
  String get recording => 'Felvétel';

  @override
  String redactedBy(String username) {
    return '$username által szerkesztve';
  }

  @override
  String get directChat => 'Privát csevegés';

  @override
  String redactedByBecause(String username, String reason) {
    return '$username által szerkesztve, mivel: \"$reason\"';
  }

  @override
  String redactedAnEvent(String username) {
    return '$username szerkesztett egy eseményt';
  }

  @override
  String get register => 'Regisztráció';

  @override
  String get reject => 'Elutasít';

  @override
  String rejectedTheInvitation(String username) {
    return '$username elutasította a meghívást';
  }

  @override
  String get rejoin => 'Újracsatlakozás';

  @override
  String get removeAllOtherDevices => 'Minden más eszköz eltávolítása';

  @override
  String removedBy(String username) {
    return '$username által eltávolítva';
  }

  @override
  String get removeDevice => 'Eszköz eltávolítása';

  @override
  String get unbanFromChat => 'Csevegés kitiltás feloldása';

  @override
  String get removeYourAvatar => 'Profilképének törlése';

  @override
  String get requestPermission => 'Jogosultsági kérelem';

  @override
  String get roomHasBeenUpgraded => 'A szoba frissítésre került';

  @override
  String get roomVersion => 'Szoba verzió';

  @override
  String get saveFile => 'Fájl mentése';

  @override
  String get security => 'Biztonság';

  @override
  String seenByUser(String username) {
    return '$username látta';
  }

  @override
  String get sendAMessage => 'Üzenet küldése';

  @override
  String get sendAudio => 'Hangüzenet küldése';

  @override
  String get sendFile => 'Fájl küldése';

  @override
  String get sendImage => 'Kép küldése';

  @override
  String sendImages(int count) {
    return '$count kép küldése';
  }

  @override
  String get sendMessages => 'Üzenetek küldése';

  @override
  String get sendOriginal => 'Eredeti küldése';

  @override
  String get sendSticker => 'Matrica küldése';

  @override
  String get sendVideo => 'Videó küldése';

  @override
  String sentAFile(String username) {
    return '📁 $username küldött egy fájlt';
  }

  @override
  String get pickFiles => 'Pick Files';

  @override
  String get allFiles => 'All Files';

  @override
  String get documents => 'Documents';

  @override
  String get spreadsheets => 'Spreadsheets';

  @override
  String get pdf => 'PDF';

  @override
  String get twitterLoginComingSoon => 'Twitter login will be available soon!';

  @override
  String get googleLoginComingSoon => 'Google login will be available soon!';

  @override
  String get audioFile => 'Audio';

  @override
  String sentAnAudio(String username) {
    return '🎤 $username hangüzenetet küldött';
  }

  @override
  String sentAPicture(String username) {
    return '🖼️ $username képet küldött';
  }

  @override
  String sentASticker(String username) {
    return '😊 $username matricát küldött';
  }

  @override
  String sentAVideo(String username) {
    return '🎥 $username videót küldött';
  }

  @override
  String sentCallInformations(String senderName) {
    return '$senderName hívásinformációt küldött';
  }

  @override
  String get separateChatTypes => 'Csoportok és privát üzenetek elkülönítése';

  @override
  String get setAsCanonicalAlias => 'Beállítás alapértelmezett álnévként';

  @override
  String get setInvitationLink => 'Meghívó hivatkozás beállítása';

  @override
  String get setPermissionsLevel => 'Engedélyszint beállítása';

  @override
  String get setStatus => 'Állapot beállítása';

  @override
  String get settings => 'Beállítások';

  @override
  String get share => 'Megosztás';

  @override
  String sharedTheLocation(String username) {
    return '$username megosztotta a pozícióját';
  }

  @override
  String get shareLocation => 'Pozíció megosztása';

  @override
  String get showPassword => 'Jelszó megjelenítése';

  @override
  String get presenceStyle => 'Állapot:';

  @override
  String get presencesToggle =>
      'Más felhasználók állapot üzeneteinek megjelenítése';

  @override
  String get singlesignon => 'Egyszeri Bejelentkezés';

  @override
  String get skip => 'Kihagy';

  @override
  String get sourceCode => 'Forráskód';

  @override
  String get spaceIsPublic => 'A tér publikus';

  @override
  String get spaceName => 'Tér név';

  @override
  String startedACall(String senderName) {
    return '$senderName hívást indított';
  }

  @override
  String get startFirstChat => 'Kezdje meg első csevegését';

  @override
  String get status => 'Állapot';

  @override
  String get statusExampleMessage => 'Hogy érzi magát a mai napon?';

  @override
  String get submit => 'Beküldés';

  @override
  String get synchronizingPleaseWait => 'Szinkronizálás... Kérem, várjon.';

  @override
  String synchronizingPleaseWaitCounter(String percentage) {
    return ' Szinkronizálás… ($percentage%)';
  }

  @override
  String get systemTheme => 'Rendszer';

  @override
  String get theyDontMatch => 'Nem egyezőek';

  @override
  String get theyMatch => 'Egyezőek';

  @override
  String get notFound => 'Not found';

  @override
  String get pinLimitMessage => 'You can only pin up to 3 chats';

  @override
  String get title => 'FluffyChat';

  @override
  String get toggleFavorite => 'Kedvencek megjelenítése';

  @override
  String get toggleMuted => 'Némítottak megjelenítése';

  @override
  String get toggleUnread => 'Jelölés Olvasottként/Olvasatlanként';

  @override
  String get tooManyRequestsWarning =>
      'Túl sok egyidejű kérelem. Kérem próbálja meg később!';

  @override
  String get transferFromAnotherDevice => 'Átvitel másik eszközről';

  @override
  String get tryToSendAgain => 'Újraküldés megpróbálása';

  @override
  String get unavailable => 'Nem elérhető';

  @override
  String unbannedUser(String username, String targetName) {
    return '$username feloldotta $targetName kitiltását';
  }

  @override
  String get unblockDevice => 'Eszköz blokkolás feloldása';

  @override
  String get unknownDevice => 'Ismeretlen eszköz';

  @override
  String get unknownEncryptionAlgorithm => 'Ismeretlen titkosítási algoritmus';

  @override
  String unknownEvent(String type) {
    return 'Ismeretlen esemény: \'$type\'';
  }

  @override
  String get unmuteChat => 'Csevegés némítás feloldása';

  @override
  String get unpin => 'Rögzítés megszüntetése';

  @override
  String get unreadChats => 'null';

  @override
  String userAndOthersAreTyping(String username, int count) {
    return '$username és $count másik résztvevő gépel…';
  }

  @override
  String userAndUserAreTyping(String username, String username2) {
    return '$username és $username2 gépel…';
  }

  @override
  String userIsTyping(String username) {
    return '$username gépel…';
  }

  @override
  String userLeftTheChat(String username) {
    return '🚪 $username elhagyta a csevegést';
  }

  @override
  String get username => 'Felhasználónév';

  @override
  String userSentUnknownEvent(String username, String type) {
    return '$username felhasználó $type eseményt küldött';
  }

  @override
  String get unverified => 'Hitelesítetlen';

  @override
  String get verified => 'Hitelesített';

  @override
  String get verify => 'Hitelesít';

  @override
  String get verifyStart => 'Hitelesítés megkezdése';

  @override
  String get verifySuccess => 'Sikeres hitelesítés!';

  @override
  String get verifyTitle => 'Másik fiók hitelesítése';

  @override
  String get videoCall => 'Videóhívás';

  @override
  String get visibilityOfTheChatHistory => 'Csevegési előzmény láthatósága';

  @override
  String get visibleForAllParticipants => 'Minden résztvevő számára látható';

  @override
  String get visibleForEveryone => 'Bárki számára látható';

  @override
  String get voiceMessage => 'Hangüzenet';

  @override
  String get waitingPartnerAcceptRequest =>
      'Várakozás a partnerre, hogy elfogadja a kérést…';

  @override
  String get waitingPartnerEmoji =>
      'Várakozás a partnerre, hogy elfogadja a hangulatjelet…';

  @override
  String get waitingPartnerNumbers =>
      'Várakozás a partnerre, hogy elfogadja a számokat…';

  @override
  String get wallpaper => 'Háttér:';

  @override
  String get weSentYouAnEmail => 'Küldtünk Önnek egy emailt';

  @override
  String get whoIsAllowedToJoinThisGroup => 'Ki csatlakozhat a csoporthoz';

  @override
  String get unableToPlayAudioMessage => 'Unable to play audio message';

  @override
  String get message => 'Message';

  @override
  String get call => 'Call';

  @override
  String get save => 'Save';

  @override
  String get edited => 'edited';

  @override
  String get withTheseAddressesRecoveryDescription =>
      'Ezekkel a címekkel vissza tudja állítani a jelszavát.';

  @override
  String get writeAMessage => 'Írjon egy üzenetet…';

  @override
  String get yes => 'Igen';

  @override
  String get you => 'Ön';

  @override
  String get youAreNoLongerParticipatingInThisChat =>
      'Immáron nem vesz részt ebben a csevegésben';

  @override
  String get youHaveBeenBannedFromThisChat => 'Kitiltották ebből a csevegésből';

  @override
  String get yourPublicKey => 'A publikus kulcsa';

  @override
  String get time => 'Idő';

  @override
  String get messageType => 'Üzenet típus';

  @override
  String get sender => 'Küldő';

  @override
  String get removeFromSpace => 'Eltávolítás a térről';

  @override
  String get addToSpaceDescription =>
      'Válassza ki melyik térhez kívánja hozzáadni a csevegést.';

  @override
  String get start => 'Kezdés';

  @override
  String get publish => 'Közzététel';

  @override
  String videoWithSize(String size) {
    return 'Videó ($size)';
  }

  @override
  String get openChat => 'Csevegés megnyitása';

  @override
  String get markAsRead => 'Olvasottként megjelölés';

  @override
  String get reportUser => 'Felhasználó jelentése';

  @override
  String get dismiss => 'Elvetés';

  @override
  String reactedWith(String sender, String reaction) {
    return '$sender a következőképp reagált: $reaction';
  }

  @override
  String get pinMessage => 'Kitűzés a szobában';

  @override
  String get shareItemsValidationError => 'Invalid file path';

  @override
  String get voiceRecordingPermissionDenied =>
      'Voice recording permission denied';

  @override
  String get noEventsSelected => 'No events selected';

  @override
  String actionFailed(String action, String error) {
    return '$action failed: $error';
  }

  @override
  String get emojis => 'Hangulatjelek';

  @override
  String get placeCall => 'Tér hívás';

  @override
  String get voiceCall => 'Hang hívás';

  @override
  String get videoCallsBetaWarning =>
      'Kérem vegye figyelembe, hogy a videó hívások jelenleg béta fázisban vannak. Nem biztos, hogy megfelelően fognak működni, vagy egyáltalán elindulnak egyes platformokon.';

  @override
  String get experimentalVideoCalls => 'Kísérleti videó hívások';

  @override
  String get emailOrUsername => 'Email vagy felhasználónév';

  @override
  String get indexedDbErrorTitle => 'Privát mód problémák';

  @override
  String get indexedDbErrorLong =>
      'Sajnos az üzenet mentés alapból nincs bekapcsolva privát módban.\nKeresse meg a\n - about:config\n - állítsa a dom.indexedDB.privateBrowsing.enabled \"true\"-ra\nMáskülönben nem lehetséges a FluffyChat futtatása.';

  @override
  String switchToAccount(String number) {
    return 'A $number számú fiókra váltás';
  }

  @override
  String get nextAccount => 'Következő fiók';

  @override
  String get previousAccount => 'Előző fiók';

  @override
  String get addWidget => 'Widget hozzáadása';

  @override
  String get widgetVideo => 'Videó';

  @override
  String get widgetEtherpad => 'Szöveges megjegyzés';

  @override
  String get widgetJitsi => 'Jitsi Meet';

  @override
  String get widgetCustom => 'Egyedi';

  @override
  String get widgetName => 'Név';

  @override
  String get widgetUrlError => 'Helytelen hivatkozás.';

  @override
  String get widgetNameError => 'Kérem adjon meg egy megjelenítendő nevet.';

  @override
  String get errorAddingWidget => 'Hiba lépett fel a widget hozzáadásánál.';

  @override
  String get youRejectedTheInvitation => 'Visszautasította a meghívást';

  @override
  String get youJoinedTheChat => 'Becsatlakozott a csevegésbe';

  @override
  String get youAcceptedTheInvitation => '👍 Elfogadta a meghívást';

  @override
  String youBannedUser(String user) {
    return 'Letitotta $user felhasználót';
  }

  @override
  String youHaveWithdrawnTheInvitationFor(String user) {
    return 'Visszavonta $user meghívását';
  }

  @override
  String youInvitedToBy(String alias) {
    return '📩 Meghívást kapott linken keresztül a következőhöz:\n$alias';
  }

  @override
  String invitedBy(String user) {
    return '📩 $user jóvoltából meghívva';
  }

  @override
  String youInvitedUser(String user) {
    return '📩 Meghívta $user-t';
  }

  @override
  String youKicked(String user) {
    return '👞 Kirúgta $user-t';
  }

  @override
  String youKickedAndBanned(String user) {
    return '🙅 Kirúgta és kitiltotta $user-t';
  }

  @override
  String youUnbannedUser(String user) {
    return 'Levette a letiltást $user-ről';
  }

  @override
  String hasKnocked(String user) {
    return '🚪 $user bekopogott';
  }

  @override
  String userWouldLikeToChangeTheChat(String user) {
    return '$user szeretne csatlakozni a csevegéshez.';
  }

  @override
  String get noPublicLinkHasBeenCreatedYet =>
      'Nyilvános link nem került még létrehozásra';

  @override
  String get knock => 'Kopogás';

  @override
  String get users => 'Felhasználók';

  @override
  String countFiles(int count) {
    return '$count fájl';
  }

  @override
  String get user => 'Felhasználó';

  @override
  String get custom => 'Egyedi';

  @override
  String get callingPermissions => 'Hívási engedélyek';

  @override
  String get callingAccount => 'Hívási fiók';

  @override
  String get callingAccountDetails =>
      'Engedélyezés a FluffyChat számára hogy használja a natív android hívás applikációt.';

  @override
  String get appearOnTop => 'Megjelenés legfelül';

  @override
  String get appearOnTopDetails =>
      'Engedélyezi az app számára, hogy mindig legfelül jelenjen meg (nem szükséges, ha a FluffyChat hívó fiókként lett beállítva)';

  @override
  String get otherCallingPermissions =>
      'Mikrofon, kamera, és más egyéb FluffyChat engedélyek';

  @override
  String get whyIsThisMessageEncrypted => 'Miért olvashatatlan ez az üzenet?';

  @override
  String get noKeyForThisMessage =>
      'Akkor fordulhat elő, ha az üzenet az eszközre való bejelentkezés előtt került küldésre.\n\nAz is elképzelhető, hogy a küldő blokkolta az eszközét, vagy valami probléma lépett fel az internet kapcsolatban.\n\nMás helyen látja az üzenetet? Akkor át tudja másolni ide is! Menjen a Beállítások > Eszközök részbe, és győződjön meg róla, hogy az eszközei megerősítették egymást. Legközelebb amikor ezt a szobát megnyitja, és mind a két kliens az előtérben van, akkor szikronizálódni fognak.\n\nNem akarja elveszíteni a kulcsokat amikor kijelentkezik, vagy eszközt cserél? Győződjön meg róla, hogy bekapcsolta a chat mentést a beállításokban.';

  @override
  String get newSpace => 'Új tér';

  @override
  String get enterSpace => 'Belépés a térre';

  @override
  String get enterRoom => 'Belépés a szobába';

  @override
  String get allSpaces => 'Minden tér';

  @override
  String numChats(String number) {
    return '$number csevegés';
  }

  @override
  String get hideUnimportantStateEvents =>
      'Jelentéktelen esemény státuszok elrejtése';

  @override
  String get doNotShowAgain => 'Ne mutassa újra';

  @override
  String wasDirectChatDisplayName(String oldDisplayName) {
    return 'Üres csevegés (korábban $oldDisplayName)';
  }

  @override
  String get newSpaceDescription =>
      'A terek lehetővé teszik a csevegések konszolidációját, ezáltal létrehozva publikus vagy privát közösségeket.';

  @override
  String get encryptThisChat => 'A csevegés titkosítása';

  @override
  String get disableEncryptionWarning =>
      'Biztonsági okokból nem kapcsolható ki egy korábban bekapcsolt csevegés titkosítás.';

  @override
  String get sorryThatsNotPossible => 'Ez sajnos nem lehetséges';

  @override
  String get deviceKeys => 'Eszköz kulcsok:';

  @override
  String get noBackupWarning =>
      'Figyelem! Ha nem kapcsolja be a csevegés mentést, elveszíti a hozzáférést a tikosított üzeneteihez. Erősen ajánlott a csevegés mentés bekapcsolása kijelentkezés előtt.';

  @override
  String get noOtherDevicesFound => 'Nem található más eszköz';

  @override
  String fileIsTooBigForServer(String max) {
    return 'Nem küldhető el! A szerver csak $max határig enged csatolmányokat.';
  }

  @override
  String fileHasBeenSavedAt(String path) {
    return 'A fájl mentésre került a következő elérési úton $path';
  }

  @override
  String get readUpToHere => 'Olvasás idáig';

  @override
  String get openLinkInBrowser => 'Hivatkozás megnyitása böngészőben';

  @override
  String get reportErrorDescription =>
      '😭 Sajnos, valami félresiklott. Ha kívánja, jelezheti a bugot a fejlesztőknek.';

  @override
  String get signInWithPassword => 'Bejelentkezés jelszóval';

  @override
  String get pleaseTryAgainLaterOrChooseDifferentServer =>
      'Próbálja meg később, vagy válasszon másik szervert.';

  @override
  String signInWith(String provider) {
    return 'Bejelentkezés a $provider kiszolgálóval';
  }

  @override
  String get profileNotFound =>
      'A felhasználó nem található a szerveren. Lehetséges, hogy csatlakozási problémák adódtak, vagy nem létezik a felhasználó.';

  @override
  String get setTheme => 'Téma beállítása:';

  @override
  String get setColorTheme => 'Szín séma beállítása:';

  @override
  String get invite => 'Meghívás';

  @override
  String get inviteGroupChat => '📨 Meghívó a csoportba';

  @override
  String get invitePrivateChat => '📨 Meghívó privát csevegéshez';

  @override
  String get invalidInput => 'Hibás bevitel!';

  @override
  String get wrongPinEntered =>
      'Hibás pinkódot adott meg! Próbálja újra null mp múlva...';

  @override
  String get pleaseEnterANumber => 'Adjon meg egy 0-nál nagyobb számot';

  @override
  String get banUserDescription =>
      'A felhasználó kitiltásra kerül a csevegésből, és nem fog tudni visszajönni egészen a kitiltás feloldásáig.';

  @override
  String get unbanUserDescription =>
      'A felhasználó vissza tud jönni a csevegésbe ha akar.';

  @override
  String get kickUserDescription =>
      'A felhasználó kirúgásra került a csevegésből, de nincs kitiltva. Publikus csevegés esetén a felhasználó bármikor visszatérhet.';

  @override
  String get makeAdminDescription =>
      'Miután a felhasználót aminisztrátorrá lépteti elő, nem fogja tudni visszavonni döntését, mivel azonos jogosultsági szinttel fognak rendelkezni.';

  @override
  String get pushNotificationsNotAvailable => 'Push értesítések nem elérhetőek';

  @override
  String get learnMore => 'Tudjon meg többet';

  @override
  String get yourGlobalUserIdIs => 'A globális felhasználó-ID-je: ';

  @override
  String noUsersFoundWithQuery(String query) {
    return '\"$query\"-vel nem található felhasználó. Ellenőrizze nincs e elírás.';
  }

  @override
  String get knocking => 'Bekopogás';

  @override
  String chatCanBeDiscoveredViaSearchOnServer(String server) {
    return 'Csevegés felfedezhető a $server szerveren történő kereséssel';
  }

  @override
  String get searchChatsRooms => 'Keressen #csevegéseket, @felhasználókat...';

  @override
  String get nothingFound => 'Nincs találat...';

  @override
  String get createGroupAndInviteUsers =>
      'Hozzon létre egy csoportot és hívjon meg felhasználókat';

  @override
  String get groupCanBeFoundViaSearch =>
      'A csoportokat kereséssel találhatja meg';

  @override
  String get startConversation => 'Társalgás kezdése';

  @override
  String get commandHint_sendraw => 'Tiszta json küldése';

  @override
  String get databaseMigrationTitle => 'Adatbázis optimalizálva';

  @override
  String get databaseMigrationBody =>
      'Kérem várjon. Ez igénybe vehet valamennyi időt.';

  @override
  String get searchForUsers => 'Keressen @felhasználókat...';

  @override
  String get pleaseEnterYourCurrentPassword =>
      'Kérem adja meg jelenlegi jelszavát';

  @override
  String get newPassword => 'Új jelszó';

  @override
  String get pleaseChooseAStrongPassword => 'Kérem válasszon egy erős jelszót';

  @override
  String get passwordsDoNotMatch => 'A jelszavak nem egyeznek';

  @override
  String get passwordIsWrong => 'Hibás a beírt jelszava';

  @override
  String get publicLink => 'Nyilvános hivatkozás';

  @override
  String get publicChatAddresses => 'Nyilvános csevegés címek';

  @override
  String get createNewAddress => 'Új cím létrehozása';

  @override
  String get joinSpace => 'Csatlakozás a térre';

  @override
  String get publicSpaces => 'Nyilvános terek';

  @override
  String get addChatOrSubSpace => 'Csevegés vagy al-tér hozzáadása';

  @override
  String get subspace => 'Al-tér';

  @override
  String get thisDevice => 'Ez az eszköz:';

  @override
  String get initAppError => 'Hiba lépett fel az app indítása során';

  @override
  String get userRole => 'Felhasználói szerep';

  @override
  String minimumPowerLevel(String level) {
    return '$level a minimum szint.';
  }

  @override
  String searchIn(String chat) {
    return 'Keresés a \"$chat\" csevegésben...';
  }

  @override
  String get searchMore => 'További keresés...';

  @override
  String databaseBuildErrorBody(String url, String error) {
    return 'Nem lehetséges az SQlite adatbázis létrehozása. Az app megpróbálja a régi típusú adatbázist használni. Kérem jelentse a hibát a fejlesztőknek a $url hivatkozáson. A hiba szövege a következő: $error';
  }

  @override
  String sessionLostBody(String url, String error) {
    return 'A munkamenete elvesződött. Kérem jelentse ezt a fejlesztőknek a $url címen. A hiba szövege a következő: $error';
  }

  @override
  String restoreSessionBody(String url, String error) {
    return 'Megpróbálkozunk visszaállítani a munkamenetét egy korábbi mentésből. Kérem jelezze a hibát a fejlesztőknek a $url címen. A hiba szövege a következő: $error';
  }

  @override
  String forwardMessageTo(String roomName) {
    return 'Üzenet továbbítása a $roomName szobába?';
  }

  @override
  String get sendReadReceipts => 'Olvasási igazolás küldése';

  @override
  String get sendTypingNotificationsDescription =>
      'A csevegés többi tagja látja amikor gépel.';

  @override
  String get sendReadReceiptsDescription =>
      'A csevegés többi tagja láthatja, ha olvasta az üzeneteiket.';

  @override
  String get formattedMessages => 'Formázott üzenetek';

  @override
  String get formattedMessagesDescription =>
      'Formázott szöveg - mint például félkövér - megjelenítése \"markdown\"-al.';

  @override
  String get verifyOtherUser => '🔐 Más felhasználó igazolása';

  @override
  String get verifyOtherUserDescription =>
      'Ha megerősít egy másik felhasználót, akkor teljesen biztos lehet abban kivel cseveg. 💪\n\nA megerősítési folyamat kezdetekor megjelenik egy felugró ablak mindkettőjüknél. Ekkor egy hangulatjel vagy szám sor összehasonlítási folyamat veszi kezdetét.\n\nA legpraktikusabb módja ennek, hogy találkozzanak, vagy videó hívás során beszéljék meg. 👭';

  @override
  String acceptedKeyVerification(String sender) {
    return '$sender elfogadta a kulcs megerősítést';
  }

  @override
  String canceledKeyVerification(String sender) {
    return '$sender visszautasította a kulcs megerősítést';
  }

  @override
  String completedKeyVerification(String sender) {
    return '$sender befejezte a kulcs megerősítést';
  }

  @override
  String isReadyForKeyVerification(String sender) {
    return '$sender készen áll a kulcs megerősítésre';
  }

  @override
  String requestedKeyVerification(String sender) {
    return '$sender kulcs megerősítést kér';
  }

  @override
  String startedKeyVerification(String sender) {
    return '$sender elkezdte a kulcs megerősítést';
  }

  @override
  String get transparent => 'Átlátszó';

  @override
  String get incomingMessages => 'Bejövő üzenetek';

  @override
  String get stickers => 'Matricák';

  @override
  String get discover => 'Felfedezés';

  @override
  String get commandHint_ignore => 'Adott matrix ID figyelmen kívül hagyása';

  @override
  String get commandHint_unignore => 'Adott matrix ID figyelembe vétele';

  @override
  String unreadChatsInApp(String appname, String unread) {
    return '$appname: $unread olvasatlan csevegések';
  }

  @override
  String get noDatabaseEncryption =>
      'Adatbázis titkosítás nem támogatott ezen a platformon';

  @override
  String thereAreCountUsersBlocked(Object count) {
    return 'Jelenleg $count felhasználó van letiltva.';
  }

  @override
  String goToSpace(Object space) {
    return 'Ugrás a $space térre';
  }

  @override
  String get youDeletedThisMessage => 'You deleted this message';

  @override
  String get thisMessageWasDeleted => 'This message was deleted';

  @override
  String get refreshing => 'Refreshing...';

  @override
  String get markAsUnread => 'Olvasatlannak jelölés';

  @override
  String userLevel(int level) {
    return '$level - Felhasználó';
  }

  @override
  String moderatorLevel(int level) {
    return '$level - Moderátor';
  }

  @override
  String adminLevel(int level) {
    return '$level - Adminisztrátor';
  }

  @override
  String get changeGeneralChatSettings =>
      'Általános csevegés beállítások módosítása';

  @override
  String get inviteOtherUsers => 'Más felhasználók meghívása a csevegésbe';

  @override
  String get changeTheChatPermissions => 'Csevegés engedélyek változtatása';

  @override
  String get changeTheVisibilityOfChatHistory =>
      'Csevegési előzmények láthatóságának változtatása';

  @override
  String get changeTheCanonicalRoomAlias =>
      'Csevegés fő, nyilvános címének változtatása';

  @override
  String get sendRoomNotifications => '@szoba értesítés küldése';

  @override
  String get changeTheDescriptionOfTheGroup =>
      'Csevegés leírásának változtatása';

  @override
  String get chatPermissionsDescription =>
      'Adja meg milyen erősségi szint kell egyes csevegési művelethez. A 0, 50 és 100-as szintek általában felhasználókat, moderátorokat és adminisztrátorokat jelölnek de bármilyen szintezés lehetséges.';

  @override
  String updateInstalled(String version) {
    return '🎉 $version verziójú frissítés telepítve!';
  }

  @override
  String get changelog => 'Változásnapló';

  @override
  String get sendCanceled => 'Küldés visszavonva';

  @override
  String get loginWithMatrixId => 'Bejelentkezés Matrix-ID-vel';

  @override
  String get discoverHomeservers => 'Matrix-kiszolgálók felfedezése';

  @override
  String get whatIsAHomeserver => 'Mi az a Matrix-kiszolgáló?';

  @override
  String get homeserverDescription =>
      'Az összes adata a Mátrix-kiszolgálón tárolódik, pont mint egy e-mail kiszolgálón. Kiválaszthatja melyik Matrix-kiszolgálót akarja használni, miközben tud kommunikálni mindenkivel. Tudjon meg többet a https://invitation.be-mindpower.net/ címen.';

  @override
  String get doesNotSeemToBeAValidHomeserver =>
      'Nem tűnik kompatibilisnek a Mátrix-kiszolgálónak. Hibás a hivatkozás?';

  @override
  String get calculatingFileSize => 'Fájl méret kalkulálása...';

  @override
  String get prepareSendingAttachment => 'Felkészülés csatolmány küldésére...';

  @override
  String get sendingAttachment => 'Csatolmány küldése...';

  @override
  String get generatingVideoThumbnail => 'Videó miniatűr generálása...';

  @override
  String get compressVideo => 'Videó tömörítése...';

  @override
  String sendingAttachmentCountOfCount(int index, int length) {
    return '$index csatolmány küldése $length-ból...';
  }

  @override
  String serverLimitReached(int seconds) {
    return 'Szerver korlát elérve! $seconds mp türelem...';
  }

  @override
  String get oneOfYourDevicesIsNotVerified =>
      'Egyik készüléke nem hitelesített';

  @override
  String get noticeChatBackupDeviceVerification =>
      'Megjegyzés: Minden eszköze amit a csevegés mentéshez kapcsol, automatikusan hitelesítésre kerül.';

  @override
  String get continueText => 'Folytatás';

  @override
  String get welcomeText =>
      'Üdv 👋 Ez a FluffyChat. Bejelentkezhet bármely matrix-kiszolgálóhoz amely kompatibilis a https://invitation.be-mindpower.net/ címmel. Ezután cseveghet bárkivel. Így képez egy óriási decentralizált üzenetküldő hálózatot!';

  @override
  String get blur => 'Homályosít:';

  @override
  String get opacity => 'Átlátszóság:';

  @override
  String get setWallpaper => 'Háttér beállítás';

  @override
  String get manageAccount => 'Fiók kezelése';

  @override
  String get noContactInformationProvided =>
      'A szervertől nem érkezett vissza kapcsolati információ';

  @override
  String get contactServerAdmin => 'Kapcsolatfelvétel a szerver adminnal';

  @override
  String get contactServerSecurity =>
      'Kapcsolatfelvétel a szerver biztonsággal';

  @override
  String get supportPage => 'Támogatási oldal';

  @override
  String get serverInformation => 'Szerver információ:';

  @override
  String get name => 'Név';

  @override
  String get version => 'Verzió';

  @override
  String get website => 'Weboldal';

  @override
  String get compress => 'Tömörítés';

  @override
  String get boldText => 'Félkövér szöveg';

  @override
  String get italicText => 'Dőlt szöveg';

  @override
  String get strikeThrough => 'Áthúzott';

  @override
  String get invalidUrl => 'Helytelen hivatkozás';

  @override
  String get addLink => 'Hivatkozás hozzáadása';

  @override
  String get unableToJoinChat =>
      'Nem csatlakozhat a csevegéshez. Elképzelhető, hogy a másik fél már kilépett.';

  @override
  String get previous => 'Előző';

  @override
  String appWantsToUseForLogin(String server) {
    return 'Használja a \'$server\' szervert a bejelentkezéshez';
  }

  @override
  String get appWantsToUseForLoginDescription =>
      'Ezennel engedélyezi az applikáció és weboldal számára, hogy információkat gyűjtsön Önről.';

  @override
  String get open => 'Megnyitás';

  @override
  String get waitingForServer => 'Várakozás a szerverre...';

  @override
  String get appIntroduction =>
      'A FluffyChat segítségével cseveghet barátaival, akár más üzenetküldő alkalmazásokon keresztül is. Tudjon meg erről többet a https://invitation.be-mindpower.net/ oldalon, vagy nyomjon a \"Folytatás\" gombra.';

  @override
  String get newChatRequest => '📩 Új csevegés kérelem';

  @override
  String get contentNotificationSettings => 'Tartalom értesítési beállítások';

  @override
  String get generalNotificationSettings => 'Átalános értesítési beállítások';

  @override
  String get roomNotificationSettings => 'Szoba értesítési beállítások';

  @override
  String get userSpecificNotificationSettings =>
      'Felhasználó specifikus értesítés beállítások';

  @override
  String get otherNotificationSettings => 'Egyéb értesítés beállítások';

  @override
  String get notificationRuleContainsUserName => 'Felhasználó nevet tartalmaz';

  @override
  String get notificationRuleContainsUserNameDescription =>
      'Értesíti a felhasználót, ha az üzenet tartalmazza a nevét.';

  @override
  String get notificationRuleMaster => 'Minden értesítés némítása';

  @override
  String get notificationRuleMasterDescription =>
      'Felülír minden más szabályt, és kikapcsolja az összes értesítést.';

  @override
  String get notificationRuleSuppressNotices =>
      'Minden automata üzenetet némít';

  @override
  String get notificationRuleSuppressNoticesDescription =>
      'Némít minden automata klienstől érkező értesítést mint például botok.';

  @override
  String get notificationRuleInviteForMe => 'Meghívás Számomra';

  @override
  String get notificationRuleInviteForMeDescription =>
      'Értesíti a felhasználót szoba meghívás esetén.';

  @override
  String get notificationRuleMemberEvent => 'Tagi Esemény';

  @override
  String get notificationRuleMemberEventDescription =>
      'Némítja a tagi események értesítéseit.';

  @override
  String get notificationRuleIsUserMention => 'Felhasználó Említése';

  @override
  String get notificationRuleIsUserMentionDescription =>
      'Értesíti a felhasználót, ha közvetlenül említésre kerül az üzenetben.';

  @override
  String get notificationRuleContainsDisplayName =>
      'Megjelenített Nevet Tartalmaz';

  @override
  String get notificationRuleContainsDisplayNameDescription =>
      'Értesíti a felhasználót, ha közvetlenül említésre kerül a megjelenített neve az üzenetben.';

  @override
  String get notificationRuleIsRoomMention => 'Szoba Említés';

  @override
  String get notificationRuleIsRoomMentionDescription =>
      'Értesíti a felhasználót szoba említéskor.';

  @override
  String get notificationRuleRoomnotif => 'Szoba Értesítés';

  @override
  String get notificationRuleRoomnotifDescription =>
      'Értesíti a felhasználót ha az üzenet tartalmazza a \'@szoba\' említést.';

  @override
  String get notificationRuleTombstone => 'Sírkő';

  @override
  String get notificationRuleTombstoneDescription =>
      'Értesíti a felhasználót a szoba deaktiválás üzenetekről.';

  @override
  String get notificationRuleReaction => 'Reakció';

  @override
  String get notificationRuleReactionDescription =>
      'Némítja a reakciók értesítéseit.';

  @override
  String get notificationRuleRoomServerAcl => 'Szoba Szerver ACL';

  @override
  String get notificationRuleRoomServerAclDescription =>
      'Némítja a szoba szerver hozzáférési kezelő lista (ACL) értesítéseket.';

  @override
  String get notificationRuleSuppressEdits => 'Szerkesztések némítása';

  @override
  String get notificationRuleSuppressEditsDescription =>
      'Némítja a szerkesztett üzenetek értesítéseit.';

  @override
  String get notificationRuleCall => 'Hívás';

  @override
  String get notificationRuleCallDescription =>
      'Értesíti a felhasználót a hívásokról.';

  @override
  String get notificationRuleEncryptedRoomOneToOne =>
      'Titkosított Négyszemközti Szoba';

  @override
  String get notificationRuleEncryptedRoomOneToOneDescription =>
      'Értesíti a felhasználót a titkosított négyszemközti szobákban levő üzenetekről.';

  @override
  String get notificationRuleRoomOneToOne => 'Négyszemközti Szoba';

  @override
  String get notificationRuleRoomOneToOneDescription =>
      'Értesíti a felhasználót a négyszemközti szobában levő üzenetekről.';

  @override
  String get notificationRuleMessage => 'Üzenet';

  @override
  String get notificationRuleMessageDescription =>
      'Értesíti a felhasználót az általános üzenetekről.';

  @override
  String get notificationRuleEncrypted => 'Titkosított';

  @override
  String get notificationRuleEncryptedDescription =>
      'Értesíti a felhasználót a titkosított szobákban levő üzenetekről.';

  @override
  String get notificationRuleJitsi => 'Jitsi';

  @override
  String get notificationRuleJitsiDescription =>
      'Értesíti a felhasználót a Jitsi widget eseményekről.';

  @override
  String get notificationRuleServerAcl => 'Némítja a Szerver ACL Eseményeket';

  @override
  String get notificationRuleServerAclDescription =>
      'Némítja a Szerver ACL események értesítéseit.';

  @override
  String unknownPushRule(String rule) {
    return '\'$rule\' egy ismeretlen push szabály';
  }

  @override
  String sentVoiceMessage(String sender, String duration) {
    return '🎙️ $duration - $sender';
  }

  @override
  String get deletePushRuleCanNotBeUndone =>
      'Ha törli ezt az értesítési beállítást, később nem vonható vissza.';

  @override
  String get more => 'Több';

  @override
  String get shareKeysWith => 'Kulcsok megosztása...';

  @override
  String get shareKeysWithDescription =>
      'Mely eszközök tekinthetőek megbízhatónak, hogy olvashassák a titkosított csevegéseket is?';

  @override
  String get allDevices => 'Minden eszköz';

  @override
  String get crossVerifiedDevicesIfEnabled =>
      'Kereszt-hitelesített eszközök ha be van kapcsolva';

  @override
  String get crossVerifiedDevices => 'Kereszt-hitelesített eszközök';

  @override
  String get verifiedDevicesOnly => 'Csak hitelesített eszközök';

  @override
  String get takeAPhoto => 'Készítsen egy fotót';

  @override
  String get recordAVideo => 'Vegyen fel egy videót';

  @override
  String get optionalMessage => '(Választható) üzenet...';

  @override
  String get notSupportedOnThisDevice => 'Nem támogatott ezen az eszközön';

  @override
  String get approve => 'Jóváhagy';

  @override
  String get youHaveKnocked => 'Kopogott';

  @override
  String get pleaseWaitUntilInvited =>
      'Kérem várjon, amíg valaki a szobából behívja Önt.';

  @override
  String get commandHint_logout => 'Logout your current device';

  @override
  String get commandHint_logoutall => 'Logout all active devices';

  @override
  String get displayNavigationRail => 'Show navigation rail on mobile';

  @override
  String get customReaction => 'Custom reaction';

  @override
  String get unexpectedVerificationMessage =>
      'Unexpected message received during verification.';

  @override
  String get financeLoading => 'Loading...';

  @override
  String get financePleaseWaitLoadWallet =>
      'Please wait while we load your wallet';

  @override
  String get financeWelcome => 'Welcome';

  @override
  String get financeRegistrationCompleted =>
      'Registration completed successfully!';

  @override
  String financeFailedToUpdate(String error) {
    return 'Failed to update: $error';
  }

  @override
  String get financeStatusRefreshed => 'Status refreshed successfully';

  @override
  String financeFailedToRefresh(String error) {
    return 'Failed to refresh: $error';
  }

  @override
  String get financeFailedToStartKYC => 'Failed to start KYC Retry';

  @override
  String get financeAccountFullyVerified =>
      'Your account is fully verified and active';

  @override
  String get financeAccountVerificationFailed =>
      'Your account verification was not successful';

  @override
  String get financeAccountUnderReview => 'Your account is under review';

  @override
  String get financeAdditionalVerificationRequired =>
      'Additional verification required';

  @override
  String get financeManageWalletServices => 'Manage your Wallet services';

  @override
  String get financeAccountRejected => 'Account Rejected';

  @override
  String get financeAccountUnderReviewTitle => 'Account Under Review';

  @override
  String get financeAccountIncomplete => 'Account Incomplete';

  @override
  String get financeFinishVerification => 'Finish Your Verification';

  @override
  String get financeAccountIssues => 'Account Issues';

  @override
  String get financeBankAccounts => 'Virtual Accounts';

  @override
  String get financeBankAccountsSubtitle =>
      'Virtual Bank account for receive payments';

  @override
  String get financeExternalAccount => 'External Account';

  @override
  String get financeExternalAccountSubtitle =>
      'Add your bank accounts for send money by ACH o Wire';

  @override
  String get financeDigitalWallets => 'Digital Wallets';

  @override
  String get financeDigitalWalletsSubtitle => 'Access your digital wallets';

  @override
  String get financeDedicatedAddresses => 'Dedicated Addresses';

  @override
  String get financeDedicatedAddressesSubtitle =>
      'Address for instant transfers';

  @override
  String get financeMainWallet => 'Main Wallet';

  @override
  String get financeTotalBalance => 'Total balance';

  @override
  String get financeNoCardsAvailable => 'No Cards Available';

  @override
  String get financeCreateFirstCard => 'Create your first card to get started';

  @override
  String get financeViewCards => 'View Cards';

  @override
  String get financeMyCards => 'Cards';

  @override
  String get financeNoCards => 'No Cards';

  @override
  String get financeCreateCardToGetStarted =>
      'Create a new card to get started';

  @override
  String get financeCreateNewCard => 'Create New Card';

  @override
  String get financeVirtualCard => 'Virtual Card';

  @override
  String get financeActivatingCard => 'Activating Card';

  @override
  String get financeAlmostReady => 'Almost Ready';

  @override
  String get financeCardActivationInProgress => 'Activation in progress...';

  @override
  String get financeCardActivationUnderReview =>
      'Card activation is under review. Please wait.';

  @override
  String get financeCardVerificationFailed =>
      'Card verification failed. Please contact support.';

  @override
  String get financeCardCreationFailed =>
      'Card creation failed. Please try again later.';

  @override
  String get financeCardActivationSuccess => 'Card activated successfully!';

  @override
  String get financeCardActivationError =>
      'Error activating card. Please try again.';

  @override
  String get financeCardActivationInfo =>
      'Your card is being activated. This may take a few moments. Please do not close the app.';

  @override
  String get financeCompleteIdentityVerification =>
      'Complete your identity verification to create and manage virtual cards.';

  @override
  String get financeKYCVerificationRequired => 'KYC Verification Required';

  @override
  String get financeStartKYCVerification => 'Start KYC Verification';

  @override
  String get financeKYCActivationInProgress => 'Card activation in progress...';

  @override
  String get financeKYCUnderReview =>
      'The card activation is under review. Please wait.';

  @override
  String get financeKYCVerificationFailed =>
      'Card verification failed. Please contact support.';

  @override
  String get financeKYCCardCreationFailed =>
      'Failed to create card. Please try again.';

  @override
  String get financeKYCFailedToActivate => 'Failed to activate card';

  @override
  String get financeKYCRejected => 'KYC Rejected';

  @override
  String get financeKYCRejectedMessage =>
      'Your identity verification has been rejected. Please review your details and try again.';

  @override
  String get financeKYCCommonIssues => 'Common Issues:';

  @override
  String get financeKYCUnderReviewTitle => 'KYC Under Review';

  @override
  String get financeKYCUnderReviewMessage =>
      'Your KYC application is currently under review. This usually takes 1-3 business days.';

  @override
  String get financeKYCPendingTitle => 'Verification in Progress';

  @override
  String get financeKYCPendingMessage =>
      'We\'re currently reviewing your documents. You\'ll be notified once the verification is complete.';

  @override
  String get financeKYCDocumentUploaded => 'Uploaded';

  @override
  String get financeKYCIdentityVerified => 'Identity Verified';

  @override
  String get financeKYCPersonalInfoVerified => 'Personal Info Verified';

  @override
  String get financeKYCAddressVerified => 'Address Verified';

  @override
  String get financeKYCStartVerification => 'Start Verification';

  @override
  String get financeKYCContinueVerification => 'Continue Verification';

  @override
  String get financeKYCCheckStatus => 'Check Status';

  @override
  String get financeKYCTryAgain => 'Try Again';

  @override
  String get financeCardStatusActive => 'Active';

  @override
  String get financeCardStatusInactive => 'Inactive';

  @override
  String get financeCardStatusFrozen => 'Frozen';

  @override
  String get financeCardStatusUnderReview => 'Under Review';

  @override
  String get financeCardStatusFailed => 'Verification Failed';

  @override
  String get financeCardActivationTitle => 'Activating Card';

  @override
  String get financeCardAlmostReady => 'It\'s almost ready';

  @override
  String get financeCardActivationMessage =>
      'Your card is being activated. This may take a few moments. Please do not close the app.';

  @override
  String get financeCardActivationCancel => 'Cancel';

  @override
  String get financeCardActivationActivate => 'Activate Now';

  @override
  String get financeCardUnderReview =>
      'Card activation is under review. Please wait.';

  @override
  String get financeUSD => 'USD';

  @override
  String get financeViewAll => 'View All';

  @override
  String get financeNoAccount => 'No Account';

  @override
  String get financeCreateNewAccountSubtitle =>
      'Create a new account to get started';

  @override
  String get financeCreateNewAccount => 'Create a New Account';

  @override
  String get financeSourceOfFundsQuestionnaire =>
      'Complete Source of Funds Questionnaire';

  @override
  String get financeSanctionsScreen => 'Complete Sanctions Screening';

  @override
  String get financePEPScreen =>
      'Complete PEP (Politically Exposed Person) Screening';

  @override
  String get financeBlocklistLookup => 'Complete Blocklist Verification';

  @override
  String get financeAdverseMediaScreen => 'Complete Adverse Media Screening';

  @override
  String get financeGovernmentIDVerification =>
      'Complete Government ID Verification';

  @override
  String get financeServiceNotAvailableInRegion =>
      'This service is not available in your current region';

  @override
  String get financeSSN => 'Social Security Number (SSN)';

  @override
  String get financeTIN => 'Tax Identification Number (TIN)';

  @override
  String get financeSIN => 'Social Insurance Number (SIN)';

  @override
  String get financeNIF => 'Tax Identification Number (NIF)';

  @override
  String get financePAN => 'Permanent Account Number (PAN)';

  @override
  String get financeCPF => 'Individual Taxpayer Registry (CPF)';

  @override
  String get financeRFC => 'Federal Taxpayer Registry (RFC)';

  @override
  String get financeNINO => 'National Insurance Number (NINO)';

  @override
  String get financePassport => 'Passport';

  @override
  String get financeNationalID => 'National ID Number';

  @override
  String get financeDriversLicense => 'Driver\'s License Number';

  @override
  String get financeITIN => 'Individual Taxpayer ID (ITIN)';

  @override
  String get financeCUIL => 'Unique Labor ID Code (CUIL)';

  @override
  String get financeRUT => 'Unique Tax Roll (RUT)';

  @override
  String get financeNIT => 'Tax ID Number (NIT)';

  @override
  String get financeCPR => 'Civil Personal Registration (CPR)';

  @override
  String get financeTFN => 'Tax File Number (TFN)';

  @override
  String get financeHETU => 'Personal Identity Code (HETU)';

  @override
  String get financePESEL => 'Universal Electronic System (PESEL)';

  @override
  String get financeVOEN => 'Tax Identification Number (VOEN)';

  @override
  String get financeOtherID => 'Other ID Number';

  @override
  String get financeSelectImageSource => 'Select Image Source';

  @override
  String get financeCamera => 'Camera';

  @override
  String get financeGallery => 'Gallery';

  @override
  String get financeTermsError => 'Terms Error';

  @override
  String get financeTermOfService => 'Term of service';

  @override
  String get financeTermsAcceptanceMessage =>
      'You must accept the terms of service before updating customer information.';

  @override
  String get financeAcceptTerms => 'I accept the terms of service';

  @override
  String get financeTermsAccepted => 'Terms of service accepted';

  @override
  String get financeCustomerType => 'Customer Type';

  @override
  String get financeIndividual => 'Individual';

  @override
  String get financeCustomerTypeRequired => 'Customer type is required';

  @override
  String get financeEmail => 'Email';

  @override
  String get financeBirthday => 'Birthday';

  @override
  String get financeBirthDateRequired => 'Birth date is required';

  @override
  String get financeMinimumAge => 'You must be at least 18 years old';

  @override
  String get financeUploadFrontID => 'Upload Front ID';

  @override
  String get financeUploadBackID => 'Upload Back ID';

  @override
  String get financeUploadBothImages =>
      'Please upload both front and back ID images';

  @override
  String get financePrimaryIDRequired => 'Primary ID (SSN/ITIN) is required';

  @override
  String get financeSSNLabel => 'Social Security Number (SSN)';

  @override
  String get financeITINLabel => 'Individual Taxpayer ID (ITIN)';

  @override
  String get financePrimaryIDRequiredUSA => 'Primary ID is required for USA';

  @override
  String get financeSelectPrimaryIDType => 'Please select a Primary ID type';

  @override
  String get financeSecondaryIDRequired => 'Secondary ID is required';

  @override
  String get financeDriversLicenseLabel => 'Driver\'s License';

  @override
  String get financePassportLabel => 'Passport';

  @override
  String get financeNationalIDLabel => 'National ID';

  @override
  String get financeSecondaryIDRequiredUSA =>
      'Secondary ID is required for USA';

  @override
  String get financeSelectSecondaryIDType =>
      'Please select a Secondary ID type';

  @override
  String get financeIDTypeRequired => 'ID type is required';

  @override
  String get financeSelectIDType => 'Please select an ID type';

  @override
  String get financeNumber => 'Number';

  @override
  String get financeNumberRequired => 'number is required';

  @override
  String get financeEditCustomer => 'Edit Customer';

  @override
  String get financePleaseWait => 'Please wait ';

  @override
  String get financeUpdate => 'Update';

  @override
  String get financeChooseImageSource =>
      'Choose how you want to add your image:';

  @override
  String get financeImageError => 'Image Error';

  @override
  String financeFailedToPickImage(String error) {
    return 'Failed to pick image: $error';
  }

  @override
  String get financeChoose => 'Choose';

  @override
  String get financeTermsRequired => 'Terms Required';

  @override
  String get financeAcceptToSBeforeUpdate =>
      'Please accept the Terms of Service before updating';

  @override
  String get financeUpdateFailed => 'Update Failed';

  @override
  String financePleaseComplete(String fields) {
    return 'Please complete: $fields';
  }

  @override
  String get financeTakeNewPhoto => 'Take a new photo';

  @override
  String get financeChooseExistingPhotos => 'Choose from existing photos';

  @override
  String get financeCameraAccessRequired =>
      'Camera access is required to take photos. Please allow camera permission and try again.';

  @override
  String get financeGalleryAccessRequired =>
      'Gallery access is required to select images. Please allow photo/storage permission and try again.';

  @override
  String get financeCameraAccessDenied =>
      'Camera access has been permanently denied. Please enable camera permission in your device settings to take photos.';

  @override
  String get financeGalleryAccessDenied =>
      'Gallery access has been permanently denied. Please enable photo/storage permission in your device settings to select images.';

  @override
  String get financeCameraAccessRestricted =>
      'Camera access is restricted on this device.';

  @override
  String get financeGalleryAccessRestricted =>
      'Gallery access is restricted on this device.';

  @override
  String get financeCameraPermissionRequired =>
      'Camera permission is required to take photos.';

  @override
  String get financeGalleryPermissionRequired =>
      'Gallery permission is required to select images. Please enable photo/storage permission in settings.';

  @override
  String get financeFailedToAccessImage => 'Failed to access image';

  @override
  String get financeCameraAccessWasDenied =>
      'Camera access was denied. Please enable camera permission in settings.';

  @override
  String get financeGalleryAccessWasDenied =>
      'Gallery access was denied. Please enable photo/storage permission in settings.';

  @override
  String get financeNoCameraAvailable =>
      'No camera is available on this device.';

  @override
  String get financeInvalidImageFile =>
      'Selected file is not a valid image. Please choose a different file.';

  @override
  String get financeUnableToTakePhoto =>
      'Unable to take photo. Please try again.';

  @override
  String get financeUnableToSelectImage =>
      'Unable to select image. Please try again.';

  @override
  String get financeFailedToCreateCustomer => 'Failed to create customer';

  @override
  String financeFailedToSendOTP(String message) {
    return 'Failed to send OTP: $message';
  }

  @override
  String financeInvalidOTP(String message) {
    return 'Invalid OTP: $message';
  }

  @override
  String get financeCustomerCreatedSuccess => 'Customer created successfully!';

  @override
  String get financeCountryRequired => 'Country is required';

  @override
  String get financeIdentificationtype => 'Identification type';

  @override
  String get financeUploadBothImagesSecondaryID =>
      'Please upload both front and back images for secondary ID';

  @override
  String get financeUploadBothIDImages =>
      'Please upload both front and back ID images';

  @override
  String get financeAcceptToSBeforeCreating =>
      'Please accept the Terms of Service before creating a customer';

  @override
  String get financeWalletDashboard => 'Wallet Dashboard';

  @override
  String get financeVirtualCards => 'Virtual Cards';

  @override
  String get financeCreateNewWallet => 'Create New \n Wallet';

  @override
  String get financeAllWalletsCreated =>
      'All available wallets have been created';

  @override
  String get financeCustomerIDNotFound =>
      'Customer ID not found. Please login again.';

  @override
  String get financeFailedToCreateWallet => 'Failed to create wallet';

  @override
  String get financeWalletDetails => 'Wallet Details';

  @override
  String get financeLoadingWalletDetails => 'Loading wallet details...';

  @override
  String get financeWalletNotFound => 'Wallet Not Found';

  @override
  String get financeWalletNotFoundMessage =>
      'The requested wallet could not be found';

  @override
  String get financeGoBack => 'Go Back';

  @override
  String get financeNoWalletsFound => 'No Wallets Found';

  @override
  String get finanaceCreateAccountSubtitle =>
      'We need some information from you to set up your wallet';

  @override
  String get financeNoWalletsMessage =>
      'You don\'t have any wallets yet. Create your first wallet to get started.';

  @override
  String get financeRetry => 'Retry';

  @override
  String get financeWalletOverview => 'Wallet Overview';

  @override
  String get financeManageAssets =>
      'Manage your digital assets and transactions';

  @override
  String get financeWalletInformation => 'Wallet information';

  @override
  String get financeCreated => 'Created';

  @override
  String get financeWalletAddress => 'Wallet address';

  @override
  String get financeTokenBalances => 'Token Balances';

  @override
  String get financeNoTokenBalances => 'No token balances available';

  @override
  String get financeCopied => 'Copied!';

  @override
  String get financeAddressCopied => 'Address copied to clipboard';

  @override
  String get financeInvalidDestinationAddress =>
      'Invalid destination address or parameters. Please check your input.';

  @override
  String get financeAuthenticationError =>
      'Authentication error. Please try logging in again.';

  @override
  String get financeInsufficientBalance =>
      'Insufficient balance for this transaction.';

  @override
  String get financeNetworkError =>
      'Network error. Please check your internet connection.';

  @override
  String get financeRequestTimeout => 'Request timeout. Please try again.';

  @override
  String get financeRecentTransactions => 'Recent transactions';

  @override
  String get financeNoTransactionsYet => 'No transactions yet';

  @override
  String get financeTransactionsWillAppear =>
      'Your transactions and deposits will appear here';

  @override
  String get financeTransactionReceipt => 'Transaction Receipt';

  @override
  String get financeTransactionID => 'Transaction ID';

  @override
  String get financeAmount => 'Amount';

  @override
  String get financeStatus => 'Status';

  @override
  String get financeFromCurrency => 'From Currency';

  @override
  String get financeToCurrency => 'To Currency';

  @override
  String get financeToAddress => 'To Address';

  @override
  String get financeNetwork => 'Network';

  @override
  String get financeDate => 'Date';

  @override
  String get financeTransactionCompleted =>
      'Transaction completed successfully';

  @override
  String get financeCopiedToClipboard => 'Copied to clipboard';

  @override
  String get financeVerifyAddress => 'Verify address before sending';

  @override
  String get financeLoadingTransfers => 'Loading transfers...';

  @override
  String get financeNoTransfersYet => 'No Transfers Yet';

  @override
  String get financeTransfersWillAppear =>
      'Your crypto transfers will appear here';

  @override
  String get financeCryptoTransfer => 'Crypto Transfer';

  @override
  String get financeNoItemsFound => 'No items found';

  @override
  String get financePleaseEnterAmount => 'Please enter amount';

  @override
  String get financePleaseEnterAllFields => 'Please fill all fields';

  @override
  String get financeCustomerNotFound => 'Customer not found. Please try again.';

  @override
  String get financeInfo => 'Info';

  @override
  String get financeProcessingTransfer => 'Processing transfer...';

  @override
  String get financeTransferSuccessful => 'Transfer Successful';

  @override
  String get financeSentTo => 'sent to';

  @override
  String get financeDone => 'Done';

  @override
  String get financeDepositInstructions => 'Deposit Instructions';

  @override
  String get financeImportantDepositMessage => 'Important Deposit Message';

  @override
  String get financeAccountNumber => 'Account Number';

  @override
  String get financeRoutingNumber => 'Routing Number';

  @override
  String get financeBankName => 'Bank Name';

  @override
  String get financeBankAddress => 'Bank Address';

  @override
  String get financeBeneficiaryName => 'Beneficiary Name';

  @override
  String get financeAccountBlocked => 'Account Blocked';

  @override
  String get financePINVerificationFailed => 'PIN Verification';

  @override
  String get financeOK => 'OK';

  @override
  String get financeTransferFailed => 'Transfer Failed';

  @override
  String get financeDepositFailed => 'Deposit Failed';

  @override
  String get financeDepositSuccessful => 'Deposit successful';

  @override
  String get financeDestination => 'Destination';

  @override
  String get financeSelectBlockchain => 'Select blockchain for your';

  @override
  String get financeNewWallet => 'new wallet';

  @override
  String get financeCryptocurrencySearch => 'Cryptocurrency Search';

  @override
  String get financeSearch => 'Search';

  @override
  String get financeEthereumETH => 'Ethereum (ETH)';

  @override
  String get financeConfirm => 'Confirm';

  @override
  String get financeRequired => 'Required';

  @override
  String get financeInvalidAmount => 'Invalid amount';

  @override
  String get financeMinAmount => 'Min \$1';

  @override
  String get financeMaxAmount => 'Max \$10,000';

  @override
  String get financeInvalidAddress => 'Invalid address';

  @override
  String get financeSelect => 'Select';

  @override
  String get financeStates => 'States';

  @override
  String get financeDateRange => '10 May - 30 Sept';

  @override
  String get financeIncome => 'Income';

  @override
  String get financeEnterCode => 'Enter Code';

  @override
  String get financeEnter4DigitCode =>
      'Enter your 4 digit transaction code to proceed';

  @override
  String get financeForgotPIN => 'Forgot PIN?';

  @override
  String get financeVerifyOTP => 'Verify OTP';

  @override
  String get financeEnter6DigitCodeSent => 'Enter the 6-digit code sent to';

  @override
  String get financeVerify => 'Verify';

  @override
  String get financeDidntReceiveCode => 'Didn\'t receive code? ';

  @override
  String get financeResend => 'Resend';

  @override
  String financeResendIn(Object seconds) {
    return 'Resend in ${seconds}s';
  }

  @override
  String get financeOTPMust6Digits => 'OTP must be 6 digits';

  @override
  String get financeWrongOTP =>
      'Wrong OTP. Please enter the correct OTP again.';

  @override
  String get financeInvalidOTPRestart =>
      'Invalid OTP. Please start registration again.';

  @override
  String get financeSendingOTP => 'Sending OTP';

  @override
  String get financePleaseWaitSendingCode =>
      'Please wait while we send verification code to your email';

  @override
  String financeOTPSentTo(String email) {
    return 'OTP sent to: $email';
  }

  @override
  String get financeExpenses => 'Expenses';

  @override
  String get financeTransferOptions => 'Transfer Options';

  @override
  String get financeDepositFounds => 'Deposit Funds';

  @override
  String get financeAddMoneyFromBank => 'Add money from bank to wallet';

  @override
  String get financeTransfer => 'Transfer';

  @override
  String get financeTransferToWalletAddress =>
      'Transfer to another wallet address';

  @override
  String get financeWithdrawToExternalAccount => 'Withdraw to External Account';

  @override
  String get financeTransferToBankAccount => 'Transfer to your bank account';

  @override
  String get financeWithdraw => 'withdraw';

  @override
  String get financeLoadingWallets => 'Loading wallets...';

  @override
  String get financeZeroBalance => '0.00 usd';

  @override
  String get financeNoWallet => 'No Wallet';

  @override
  String get financeCreateCardMessage => 'Create a new card to get started!';

  @override
  String get financeCreateANewWallet => 'Create a New Wallet';

  @override
  String get financeSendCryptoToWallet =>
      'Send crypto to another wallet address';

  @override
  String get financeHowMuch => 'How much?';

  @override
  String get financeTransfer_money_to_any_user => 'transfer money to any user';

  @override
  String get financeCurrency => 'Currency';

  @override
  String get financeDestinationChain => 'Destination Chain';

  @override
  String get financeDestinationAddress => 'Destination Address';

  @override
  String get financeDepositFunds => 'Deposit Funds';

  @override
  String get financeSelectCurrency => 'Source Currency';

  @override
  String get financePaymentMethod => 'Payment method';

  @override
  String get financeACHPush => 'ACH Push';

  @override
  String get financeDestinationCurrency => 'Destination Currency';

  @override
  String get financeBankAccount => 'Bank Account';

  @override
  String get financeExternalAccountAdd => 'Add External Account';

  @override
  String get financeExternalAccountEdit => 'Edit External Account';

  @override
  String get financeExternalAccountStepBank => 'Bank\nInfo';

  @override
  String get financeExternalAccountStepPersonal => 'Personal\nInfo';

  @override
  String get financeExternalAccountStepAccount => 'Account\nDetail';

  @override
  String get financeExternalAccountStepAddress => 'Address';

  @override
  String get financeExternalAccountAccountName => 'Account Name';

  @override
  String get financeExternalAccountGetProfileInfo =>
      'Get info from your profile';

  @override
  String get financeExternalAccountGoBackTitle => 'Go Back?';

  @override
  String get financeExternalAccountGoBackMessage =>
      'Are you sure you want to go back? All entered information will be lost.';

  @override
  String get financeExternalAccountAccountInfo => 'Account Information';

  @override
  String get financeExternalAccountUpdateAddress => 'Update Address';

  @override
  String get financeExternalAccountAccountOwner => 'Account Owner';

  @override
  String get financeExternalAccountAccountType => 'Account Type';

  @override
  String get financeExternalAccountActive => 'Active';

  @override
  String get financeExternalAccountInactive => 'Inactive';

  @override
  String get financeExternalAccountErrorLoading => 'Error Loading Account';

  @override
  String get financeExternalAccountNotFound => 'Account Not Found';

  @override
  String get financeExternalAccountNotFoundMessage =>
      'The external account could not be found';

  @override
  String get financeExternalAccountAddressUpdated =>
      'Address updated successfully!';

  @override
  String get financeExternalAccountNoCustomer => 'No Customer Found';

  @override
  String get financeExternalAccountNoCustomerMessage =>
      'Please create a customer profile first to manage external accounts';

  @override
  String get financeExternalAccountLoadingAccounts =>
      'Loading external accounts...';

  @override
  String get financeExternalAccountLetsStart =>
      'Let\'s start an\n external account';

  @override
  String get financeExternalAccountSetupMessage =>
      'We need some information from you to set up the external account';

  @override
  String get financeExternalAccountBankInfo => 'Bank information';

  @override
  String get financeExternalAccountAccountDetails => 'Account details';

  @override
  String get financeExternalAccountOwnerInfo => 'Owner information';

  @override
  String get financeExternalAccountTimestamps => 'Timestamps';

  @override
  String get financeExternalAccountOwnerType => 'Owner Type';

  @override
  String get financeExternalAccountUpdated => 'Updated';

  @override
  String get financeExternalAccountNumberCopied => 'Account number copied!';

  @override
  String get financeExternalAccountOwnerTypeLabel => 'Account Type';

  @override
  String get financeExternalAccountIndividual => 'Individual';

  @override
  String get financeExternalAccountChecking => 'Checking';

  @override
  String get financeExternalAccountSavings => 'Savings';

  @override
  String get financeExternalAccountUnitedStates => 'United States';

  @override
  String get financeExternalAccountRequired => 'Required';

  @override
  String get financeExternalAccountStreetAddressTooShort =>
      'Street address too short';

  @override
  String get financeExternalAccountPleaseSelectState => 'Please select a state';

  @override
  String get financeExternalAccountPleaseEnterCity => 'Please enter city';

  @override
  String get financeExternalAccountCityNameTooShort => 'City name too short';

  @override
  String get financeExternalAccountPleaseEnterZIP => 'Please enter ZIP';

  @override
  String get financeExternalAccountMustBe5Digits => 'Must be 5 digits';

  @override
  String get financeExternalAccountNumbersOnly => 'Numbers only';

  @override
  String get financeExternalAccountBankNameRequired => 'Bank name is required';

  @override
  String get financeExternalAccountBankNameMin =>
      'Bank name must be at least 3 characters';

  @override
  String get financeExternalAccountBankNameMax =>
      'Bank name too long (max 50 characters)';

  @override
  String get financeExternalAccountInvalidCharacters =>
      'Invalid characters in bank name';

  @override
  String get financeExternalAccountAccountNameRequired =>
      'Account name is required';

  @override
  String get financeExternalAccountAccountNameMin =>
      'Account name must be at least 2 characters';

  @override
  String get financeExternalAccountAccountNameMax =>
      'Account name too long (max 40 characters)';

  @override
  String get financeExternalAccountOnlyLetters =>
      'Only letters, spaces, dots and hyphens allowed';

  @override
  String get financeExternalAccountOwnerTypeRequired =>
      'Account owner type is required';

  @override
  String get financeExternalAccountFirstNameRequired =>
      'First name is required';

  @override
  String get financeExternalAccountFirstNameTooShort => 'First name too short';

  @override
  String get financeExternalAccountLastNameRequired => 'Last name is required';

  @override
  String get financeExternalAccountLastNameTooShort => 'Last name too short';

  @override
  String get financeExternalAccountRoutingNumberRequired =>
      'Routing number is required';

  @override
  String get financeExternalAccountMustBe9Digits => 'Must be exactly 9 digits';

  @override
  String get financeExternalAccountAccountNumberRequired =>
      'Account number is required';

  @override
  String get financeExternalAccountAccountNumberTooShort =>
      'Account number too short';

  @override
  String get financeExternalAccountAccountTypeRequired =>
      'Account type is required';

  @override
  String get financeExternalAccountStreetAddressRequired =>
      'Street address is required';

  @override
  String get financeExternalAccountCountryRequired => 'Country is required';

  @override
  String get financeExternalAccountCityRequired => 'City is required';

  @override
  String get financeExternalAccountStateRequired => 'State is required';

  @override
  String get financeExternalAccountPostalCodeRequired =>
      'Postal code is required';

  @override
  String get financeExternalAccountNoCustomerFound =>
      'No customer found. Please create a customer first.';

  @override
  String get financeExternalAccountFailedToUpdate => 'Failed to update address';

  @override
  String get financeExternalAccountSubmit => 'Submit';

  @override
  String get financePayCryptoCreateVirtualCard => 'Create Virtual Card';

  @override
  String get financePayCryptoSelectCardType => 'Select Card Type';

  @override
  String get financePayCryptoChooseCardType =>
      'Choose the type of virtual card you want to create';

  @override
  String get financePayCryptoNoCardTypes => 'No card types available';

  @override
  String get financePayCryptoContinue => 'Continue';

  @override
  String get financePayCryptoVirtualCard => 'Virtual Card';

  @override
  String financePayCryptoCurrency(String currency) {
    return 'Currency: $currency';
  }

  @override
  String financePayCryptoType(String type) {
    return 'Type: $type';
  }

  @override
  String get financePayCryptoPhysical => 'Physical';

  @override
  String get financePayCryptoVirtual => 'Virtual';

  @override
  String get financePayCryptoKYCRequired => 'KYC Required';

  @override
  String get financePayCryptoCompleteKYCFirst =>
      'Please complete KYC verification first';

  @override
  String get financePayCryptoCardCreatedSuccess => 'Card created successfully!';

  @override
  String get financePayCryptoCardDetails => 'Card Details';

  @override
  String get financePayCryptoCardFound => 'Card Found';

  @override
  String get financePayCryptoActivateCard =>
      'Activate your card to access all features.';

  @override
  String get financePayCryptoWelcomeBack => 'Welcome Back';

  @override
  String get financePayCryptoCardActive =>
      'Your card is active and ready to use.';

  @override
  String get financePayCryptoBalanceOverview => 'Balance Overview';

  @override
  String get financePayCryptoCurrentBalance => 'Current balance';

  @override
  String get financePayCryptoAvailableBalance => 'Available balance';

  @override
  String get financePayCryptoCardInformation => 'Card Information';

  @override
  String get financePayCryptoCardNumber => 'Card number';

  @override
  String get financePayCryptoCVV => 'CVV';

  @override
  String get financePayCryptoExpires => 'Expires';

  @override
  String get financePayCryptoCardholder => 'Cardholder';

  @override
  String get financePayCryptoShowDetails => 'Show Details';

  @override
  String get financePayCryptoHideDetails => 'Hide Details';

  @override
  String get financePayCryptoActivateCardMessage =>
      'Activate your card to view sensitive details';

  @override
  String get financePayCryptoFreezeCard => 'Freeze Card';

  @override
  String get financePayCryptoEnterReason => 'Enter reason for freezing';

  @override
  String get financePayCryptoConfirmFreeze =>
      'Are you sure you want to freeze this card?';

  @override
  String get financePayCryptoFreeze => 'Freeze';

  @override
  String get financePayCryptoUnfreeze => 'Unfreeze';

  @override
  String get financePayCryptoCardFrozenSuccess => 'Card frozen successfully';

  @override
  String get financePayCryptoCardUnfrozenSuccess =>
      'Card unfrozen successfully';

  @override
  String get financePayCryptoFailedToFreezeCard => 'Failed to freeze card';

  @override
  String get financePayCryptoFailedToUnfreezeCard => 'Failed to unfreeze card';

  @override
  String get financePayCryptoRecentTransactions => 'Recent transactions';

  @override
  String get financePayCryptoNoTransactionsYet => 'No transactions yet';

  @override
  String get financePayCryptoDeposit => 'Deposit';

  @override
  String get financePayCryptoCompleted => 'Completed';

  @override
  String get financePayCryptoPending => 'Pending';

  @override
  String get financePayCryptoDepositDetails => 'Deposit Details';

  @override
  String get financePayCryptoCryptoAmount => 'Crypto Amount';

  @override
  String get financePayCryptoCoinPrice => 'Coin Price';

  @override
  String get financePayCryptoExchangeRate => 'Exchange Rate';

  @override
  String get financePayCryptoLoadingFee => 'Loading Fee';

  @override
  String get financePayCryptoExchangeFee => 'Exchange Fee';

  @override
  String get financePayCryptoCustomerTXID => 'Customer TX ID';

  @override
  String get financePayCryptoCopyNumber => 'Copy Number';

  @override
  String get financePayCryptoCopyAll => 'Copy All';

  @override
  String get financePayCryptoSecurityTips => 'Security Tips';

  @override
  String get financePayCryptoSecurityMessage =>
      'Do not share your PIN or card details.\nOnly shop on secure sites (https).\nEnable alerts and blocking from the app.\nCheck your transactions regularly.';

  @override
  String get financePayCryptoCardNumberCopied =>
      'Card number copied to clipboard';

  @override
  String get financePayCryptoAllDetailsCopied =>
      'All card details copied to clipboard';

  @override
  String get financePayCryptoSeeCardDetails => 'see your card details';

  @override
  String get financePayCryptoNoCards => 'No Cards';

  @override
  String get financePayCryptoCreateNewCard =>
      'Create a new card to get started';

  @override
  String get financePayCryptoCreateANewCard => 'Create a New Card           ';

  @override
  String get financePayCryptoCardActivatedSuccess =>
      'Card activated successfully!';

  @override
  String get financePayCryptoFailedToActivateCard =>
      'Failed to activate card. Please try again.';

  @override
  String get financePayCryptoActivationRequired => 'Activation Required';

  @override
  String get financePayCryptoActivateCardFirst =>
      'Please activate your card first to view details';

  @override
  String get financePayCryptoNewDeposit => 'New Deposit';

  @override
  String get financePayCryptoDepositMoney =>
      'Deposit money from user to receive from that person.';

  @override
  String get financePayCryptoSelectCryptocurrency => 'Select Cryptocurrency';

  @override
  String financePayCryptoAmountUSDT(String currency) {
    return 'Amount ($currency)';
  }

  @override
  String get financePayCryptoMinimumAmount => 'Minimum amount: 1 USDT';

  @override
  String get financePayCryptoRemarkOptional => 'Remark (Optional)';

  @override
  String get financePayCryptoDepositFunds => 'Deposit Funds';

  @override
  String get financePayCryptoInvalidAmount => 'Invalid Amount';

  @override
  String financePayCryptoAmountMustBeAtLeast(String currency) {
    return 'Amount must be at least 1 $currency';
  }

  @override
  String get financePayCryptoDepositSuccess => 'Deposit Success';

  @override
  String financePayCryptoDepositInitiated(String transactionId) {
    return 'Deposit initiated: $transactionId';
  }

  @override
  String get financePayCryptoDepositFailed => 'Deposit Failed';

  @override
  String get financePayCryptoFailedToProcessDeposit =>
      'Failed to process deposit';

  @override
  String get financePayCryptoHistory => 'History';

  @override
  String get financePayCryptoTransferMoney => 'transfer money to any user';

  @override
  String get financePayCryptoNoHistoryYet => 'No History Yet';

  @override
  String get financePayCryptoTransactionsWillAppear =>
      'Your transactions will appear here';

  @override
  String get financePayCryptoKYCVerification => 'KYC Verification';

  @override
  String get financeKYCSectionPersonalInfo => 'Personal\nInfo';

  @override
  String get financeKYCSectionAddress => 'Address';

  @override
  String get financeKYCSectionDocuments => 'Documents';

  @override
  String get financeKYCSectionReview => 'Review & Submit';

  @override
  String get financeKYCBtnPrevious => 'Previous';

  @override
  String get financeKYCBtnNext => 'Next';

  @override
  String get financeKYCBtnSubmit => 'Submit KYC';

  @override
  String get financeKYCBtnCancel => 'Cancel';

  @override
  String get financePayCryptoPersonalInfo => 'Personal\nInfo';

  @override
  String get financePayCryptoAddress => 'Address';

  @override
  String get financePayCryptoDocument => 'Document';

  @override
  String get financePayCryptoReview => 'Review';

  @override
  String get financePayCryptoFirstName => 'First Name';

  @override
  String get financePayCryptoLastName => 'Last Name';

  @override
  String get financePayCryptoFirstNameRequired => 'First name is required';

  @override
  String get financePayCryptoFirstNameMinLength =>
      'First name must be at least 3 characters';

  @override
  String get financePayCryptoLastNameRequired => 'Last name is required';

  @override
  String get financePayCryptoLastNameMinLength =>
      'Last name must be at least 3 characters';

  @override
  String get financePayCryptoZipMinLength =>
      'ZIP code must be at least 4 characters';

  @override
  String get financePayCryptoFixFollowingIssues =>
      'Please fix the following issues';

  @override
  String get financePayCryptoPleaseEnterFirstName =>
      'Please enter your first name';

  @override
  String get financePayCryptoPleaseEnterLastName =>
      'Please enter your last name';

  @override
  String get financePayCryptoPleaseEnterEmail =>
      'Please enter your email address';

  @override
  String get financePayCryptoPleaseEnterValidEmail =>
      'Please enter a valid email address';

  @override
  String get financePayCryptoPleaseEnterPhone =>
      'Please enter your phone number';

  @override
  String get financePayCryptoPleaseSelectDOB =>
      'Please select your date of birth';

  @override
  String get financePayCryptoAgeVerificationError =>
      'You must be at least 18 years old to proceed';

  @override
  String get financePayCryptoPleaseEnterAddress => 'Please enter your address';

  @override
  String get financePayCryptoPleaseEnterCity => 'Please enter your city';

  @override
  String get financePayCryptoPleaseSelectState =>
      'Please select your state/province';

  @override
  String get financePayCryptoPleaseEnterZip => 'Please enter your ZIP code';

  @override
  String get financePayCryptoPleaseSelectCountry =>
      'Please select your country';

  @override
  String get financePayCryptoPleaseEnterDocNumber =>
      'Please enter your document number';

  @override
  String get financePayCryptoDocNumberMinLength =>
      'Document number must be at least 4 characters';

  @override
  String get financePayCryptoPleaseEnterMothersName =>
      'Please enter your mother\'s maiden name';

  @override
  String get financePayCryptoMothersNameMinLength =>
      'Mother\'s maiden name must be at least 2 characters';

  @override
  String get financePayCryptoUploadFrontDoc =>
      'Please upload the front of your document';

  @override
  String get financePayCryptoUploadBackDoc =>
      'Please upload the back of your document';

  @override
  String get financePayCryptoUploadSelfieDoc =>
      'Please upload a selfie holding your document clearly visible';

  @override
  String get financePayCryptoEmail => 'Email';

  @override
  String get financePayCryptoEmailRequired => 'Please enter your email address';

  @override
  String get financePayCryptoEmailInvalid =>
      'Please enter a valid email address';

  @override
  String get financePayCryptoFetchingEmail => 'Fetching email for user';

  @override
  String get financePayCryptoEmailFetchResponse => 'Email fetch response';

  @override
  String get financePayCryptoEmailExtracted => 'Extracted email from response';

  @override
  String get financePayCryptoEmailFetchError => 'Error fetching email';

  @override
  String get financePayCryptoLoadingEmail => 'Loading email for user';

  @override
  String financePayCryptoExtractedUsername(Object username) {
    return 'Extracted username: $username';
  }

  @override
  String get financePayCryptoInvalidUserId => 'Invalid user ID format';

  @override
  String get financePayCryptoCountryRequired => 'Country is required';

  @override
  String get financePayCryptoDocumentsUnderReview => 'Documents Under Review';

  @override
  String get personal => 'Personal';

  @override
  String get address => 'Address';

  @override
  String get review => 'Review';

  @override
  String get financePayCryptoDocumentNumberMinLength =>
      'Document number must be at least 4 characters';

  @override
  String get financePayCryptoMothersMaidenName => 'Mother\'s Maiden Name';

  @override
  String get financePayCryptoMothersMaidenNameRequired =>
      'Mother\'s maiden name is required';

  @override
  String get financePayCryptoCountryCode => 'Country Code';

  @override
  String get financePayCryptoPhoneNumber => 'Phone Number';

  @override
  String get financePayCryptoPhoneRequired => 'Please enter your phone number';

  @override
  String get financePayCryptoPhoneMinLength =>
      'Phone number must be at least 5 digits';

  @override
  String get financePayCryptoGender => 'Gender';

  @override
  String get financePayCryptoMale => 'Male';

  @override
  String get financePayCryptoFemale => 'Female';

  @override
  String get financePayCryptoDateOfBirth => 'Date of Birth';

  @override
  String get financePayCryptoDobRequired => 'Date of birth is required';

  @override
  String get financePayCryptoAddressRequired => 'Address is required';

  @override
  String get financePayCryptoAddressMinLength =>
      'Address must be at least 5 characters';

  @override
  String get financePayCryptoCity => 'City';

  @override
  String get financePayCryptoCityRequired => 'City is required';

  @override
  String get financePayCryptoCountry => 'Country';

  @override
  String get financePayCryptoState => 'State/Province';

  @override
  String get financePayCryptoStateRequired => 'State/Province is required';

  @override
  String get financePayCryptoStateProvince => 'State/Province';

  @override
  String get financePayCryptoSelectCountryFirst => 'Select a country first';

  @override
  String get financePayCryptoZipCode => 'ZIP Code';

  @override
  String get financePayCryptoZipRequired => 'ZIP code is required';

  @override
  String get financePayCryptoDocumentType => 'Document Type';

  @override
  String get financePayCryptoPassport => 'Passport';

  @override
  String get financePayCryptoIdCard => 'ID Card';

  @override
  String get financePayCryptoDriversLicense => 'Driver\'s License';

  @override
  String get financePayCryptoDocumentNumber => 'Document Number';

  @override
  String get financePayCryptoDocumentNumberRequired =>
      'Please enter document number';

  @override
  String get financePayCryptoFrontDocument => 'Front of Document';

  @override
  String get financePayCryptoBackDocument => 'Back of Document';

  @override
  String get financePayCryptoSelfieWithDocument => 'Selfie with Document';

  @override
  String get financePayCryptoUploadPhoto => 'Upload Photo';

  @override
  String get financePayCryptoTakePhoto => 'Take Photo';

  @override
  String get financePayCryptoChooseFromGallery => 'Choose from Gallery';

  @override
  String get financePayCryptoCancel => 'Cancel';

  @override
  String get financePayCryptoNext => 'Next';

  @override
  String get financePayCryptoPrevious => 'Previous';

  @override
  String get financePayCryptoSubmit => 'Submit';

  @override
  String get financePayCryptoReviewYourInfo => 'Review Your Information';

  @override
  String get financePayCryptoPleaseReview =>
      'Please review your information before submitting.';

  @override
  String financePayCryptoDocumentRequired(Object documentType) {
    return '$documentType is required';
  }

  @override
  String get financePayCryptoKYCSubmitConfirmTitle => 'Submit KYC Information';

  @override
  String get financePayCryptoKYCSubmitConfirmMessage =>
      'Are you sure you want to submit your KYC information? You won\'t be able to make changes after submission.';

  @override
  String get financePayCryptoKYCSubmitSuccess =>
      'KYC information submitted successfully!';

  @override
  String get financePayCryptoKYCSubmitError =>
      'Failed to submit KYC information. Please try again.';

  @override
  String get financePayCryptoKYCProcessing =>
      'Your identity verification is being processed. We\'ll notify you once approved.';

  @override
  String get financePayCryptoKYCUnderReviewTitle => 'Under Review';

  @override
  String get financePayCryptoKYCUnderReviewMessage =>
      'Your KYC information is being reviewed. We\'ll notify you once it\'s approved.';

  @override
  String get financePayCryptoKYCAwaitingApproval => 'Awaiting Approval';

  @override
  String get financePayCryptoKYCDocumentsReceived => 'Documents Received';

  @override
  String get financePayCryptoKYCDocumentsUnderReview =>
      'Documents Under Review';

  @override
  String get financePayCryptoKYCApprovalPending => 'Approval Pending';

  @override
  String get financePayCryptoKYCCheckStatus => 'Check Status';

  @override
  String get financePayCryptoKYCBackToHome => 'Back to Home';

  @override
  String get financeKYCFirstName => 'First Name';

  @override
  String get financeKYCLastName => 'Last Name';

  @override
  String get financeKYCEmail => 'Email';

  @override
  String get financeKYCCountryCode => 'Country Code';

  @override
  String get financeKYCPhoneNumber => 'Phone Number';

  @override
  String get financeKYCGender => 'Gender';

  @override
  String get financeKYCMale => 'Male';

  @override
  String get financeKYCFemale => 'Female';

  @override
  String get financeKYCDateOfBirth => 'Date of Birth';

  @override
  String get financeKYCAddress => 'Address';

  @override
  String get financeKYCCity => 'City';

  @override
  String get financeKYCState => 'State/Province';

  @override
  String get financeKYCZipCode => 'ZIP Code';

  @override
  String get financeKYCSelectCountryFirst => 'Select a country first';

  @override
  String get financePayCryptoPleaseEnterCountryCode =>
      'Please enter country code';

  @override
  String get financePayCryptoPleaseEnterPhoneNumber =>
      'Please enter your phone number';

  @override
  String get financePayCryptoKYCUnderReview => 'KYC Under Review';

  @override
  String get financePayCryptoDocumentsReceived => 'Documents Received';

  @override
  String get financePayCryptoUnderReview => 'Under Review';

  @override
  String get financePayCryptoApprovalPending => 'Approval Pending';

  @override
  String get financePayCryptoCheckStatus => 'Check Status';

  @override
  String get financePayCryptoZIPCode => 'ZIP Code';

  @override
  String get financePayCryptoMotherMaidenName => 'Mother\'s Maiden Name';

  @override
  String get financePayCryptoUploadFrontID => 'Upload Front ID';

  @override
  String get financePayCryptoUploadBackID => 'Upload Back ID';

  @override
  String get financePayCryptoUploadSelfie => 'Upload Selfie with Document';

  @override
  String get financePayCryptoUploaded => 'Uploaded';

  @override
  String get financePayCryptoUploadImage => 'Upload image';

  @override
  String get financePayCryptoName => 'Name';

  @override
  String get financePayCryptoPhone => 'Phone';

  @override
  String get financePayCryptoFrontImage => 'Front Image';

  @override
  String get financePayCryptoBackImage => 'Back Image';

  @override
  String get financePayCryptoMixedImage => 'Mixed Image';

  @override
  String get financePayCryptoNotUploaded => 'Not uploaded';

  @override
  String get financePayCryptoSubmitKYC => 'Submit KYC';

  @override
  String get financePayCryptoMissingInfo => 'Missing Information';

  @override
  String get financePayCryptoKYCApproved => 'KYC Approved';

  @override
  String get financePayCryptoVerificationComplete =>
      'Your identity verification is complete';

  @override
  String get financePayCryptoGoToWallet => 'Go to Wallet';

  @override
  String get financePayCryptoDefaultCard => 'Default card';

  @override
  String get financePayCryptoUseAsDefault => 'Use this card as default';

  @override
  String get financePayCryptoContactlessPayment => 'Contactless payment';

  @override
  String get financePayCryptoEnableContactless => 'Enable contactless payments';

  @override
  String get financePayCryptoPINCode => 'PIN code';

  @override
  String get financePayCryptoAskPINWhenPaying =>
      'Ask for a PIN code when paying';

  @override
  String get financePayCryptoSpending => 'Spending';

  @override
  String get financePayCryptoTransactionHistory => 'Transaction';

  @override
  String get financePayCryptoActivateNow => 'Activate Now';

  @override
  String get financePayCryptoActivating => 'Activating...';

  @override
  String get financePayCryptoNoDeposits => 'No Deposits';

  @override
  String get financeExternalAccountPleaseCreateCustomer =>
      'Please create a customer profile first to manage external accounts';

  @override
  String get financeExternalAccountWeNeedInfo =>
      'We need some information from you\n to set up the external account';

  @override
  String get financeExternalAccountCreate => 'Create';

  @override
  String get financeExternalAccountBankName => 'Bank name';

  @override
  String get financeExternalAccountCreated => 'Created';

  @override
  String get financeExternalAccountTitle => 'External Accounts';

  @override
  String get financeExternalAccountSingular => 'External account';

  @override
  String get back => 'Back';

  @override
  String get financeLiquidationAddresses => 'Liquidation Addresses';

  @override
  String get financeLiquidationAddressDetails => 'Liquidation Address Details';

  @override
  String get financeCreateLiquidationAddress => 'Create liquidation address';

  @override
  String get financeLetsStartLiquidation =>
      'Let\'s start\na liquidation address';

  @override
  String get financeWeNeedInfoLiquidation =>
      'We need some information from you to set up a Liquidation address';

  @override
  String get financeManageLiquidationAddresses =>
      'Manage cryptocurrency liquidation addresses for automatic conversions';

  @override
  String get financeLoadingLiquidationAddresses =>
      'Loading Liquidation Addresses...';

  @override
  String get financeClientReferenceID => 'Client Reference ID';

  @override
  String get financeClientReferenceIDRequired =>
      'Client reference ID is required';

  @override
  String get financeWireMessage => 'Wire Message';

  @override
  String get financeWireMessageRequired => 'Wire message is required';

  @override
  String get financeSelectCurrencyLabel => 'Select currency';

  @override
  String get financeCurrencyRequired => 'Currency is required';

  @override
  String get financeChain => 'Chain';

  @override
  String get financeSelectChain => 'Select chain';

  @override
  String get financeChainRequired => 'Chain is required';

  @override
  String get financeSelectExternalAccount => 'Select external account';

  @override
  String get financeAddressInvalidWarning =>
      'The address for this external account is invalid';

  @override
  String get financeAddressInformation => 'Address Information';

  @override
  String get financeActiveBalance => 'Active Balance';

  @override
  String get financePendingBalance => 'Pending Balance';

  @override
  String get financeBalanceNotAvailable => 'Balance information not available';

  @override
  String get financeTransactionHistory => 'Transaction History';

  @override
  String get financeNoTransactions => 'No transactions';

  @override
  String get financeNoDrainTransactions =>
      'No drain transactions found for this address';

  @override
  String get financePaymentRail => 'Payment Rail';

  @override
  String get financeDestinationCurrencyLabel => 'Destination Currency';

  @override
  String get financeViewLiquidationInfo =>
      'View liquidation address information and transaction history';

  @override
  String get financeCouldNotLoadDetails =>
      'Could not load liquidation address details';

  @override
  String get financeBalance => 'Balance';

  @override
  String get financeFailedToLoad => 'Failed to Load';

  @override
  String get financeVirtualAccounts => 'Virtual Accounts';

  @override
  String get financeLoadingVirtualAccount => 'Loading Virtual account...';

  @override
  String get financeCreateVirtualAccount => 'Create virtual account';

  @override
  String get financeCustomerRequired => 'Customer Required';

  @override
  String get financePleaseCreateCustomerFirst =>
      'Please create a customer account first';

  @override
  String get financeCreateVirtualAddress => 'Create Virtual address';

  @override
  String get financeDestinationAddressRequired =>
      'Destination address is required';

  @override
  String get financeAddressTooShort => 'Address too short';

  @override
  String get financeSelectSourceCurrency => 'Select source currency';

  @override
  String get financeSelectCurrencyRequired => 'Select currency is required';

  @override
  String get financeSelectDestinationChain => 'Select destination chain';

  @override
  String get financeDestinationChainRequired => 'Destination chain is required';

  @override
  String get financeSelectDestinationCurrency => 'Select destination currency';

  @override
  String get financeDestinationCurrencyRequired =>
      'Destination currency is required';

  @override
  String get financeFailedToCreateVirtualAccount =>
      'Failed to create virtual account';

  @override
  String get financeInvalidPINTryAgain => 'Invalid PIN. Please try again.';

  @override
  String get financePINVerificationFailedTryAgain =>
      'PIN verification failed. Please try again.';

  @override
  String get financeDetails => 'Details';

  @override
  String get financeAccountNumberCopiedShort => 'Account number copied';

  @override
  String get financeAccountNumberCopied => 'Account number copied to clipboard';

  @override
  String get financeVirtualAccountDetails => 'Virtual account details';

  @override
  String get financeTransferDetails => 'Transfer details';

  @override
  String get financeVirtualAccount => 'Virtual Account';

  @override
  String get financeDepositReceived => 'Deposit Received';

  @override
  String get financeBankInformation => 'Bank information';

  @override
  String get financeBeneficiaryInformation => 'Beneficiary information';

  @override
  String get financeBeneficiaryAddress => 'Beneficiary Address';

  @override
  String get financeDestinationDetails => 'Destination details';

  @override
  String get financeLetsStartVirtualAccount =>
      'Let\'s start\na Virtual account';

  @override
  String get financeWeNeedInfoVirtualAccount =>
      'We need some information from you\nto set up the Virtual account';

  @override
  String get financePayCryptoCardActivationUnderReview =>
      'Card activation is under review';

  @override
  String get financePayCryptoCardVerificationFailed =>
      'Card verification failed';

  @override
  String get financePayCryptoCardCreationFailed => 'Card creation failed';

  @override
  String get financePayCryptoCardReadyActivation =>
      'Your card is ready for activation';

  @override
  String get financePayCryptoActivateToAccess =>
      'Activate your card to access all features';

  @override
  String get financePayCryptoKYCCompletedSuccess =>
      'KYC completed successfully!';

  @override
  String get financePayCryptoFailedToCreateCard => 'Failed to create card';

  @override
  String get financePayCryptoErrorLoadingCard => 'Error loading card';

  @override
  String get financePayCryptoAccountNotFound => 'Account number not found';

  @override
  String get financeMain_Wallet => 'Wallet';

  @override
  String get financeResetYourPIN => 'Reset your PIN';

  @override
  String get financeEnterOTPAndNewPIN =>
      'Enter OTP sent to your email and set your new PIN';

  @override
  String get financeEnterNewPINToReset => 'Enter your new PIN to reset it.';

  @override
  String get financeOTPCode => 'OTP Code';

  @override
  String get financeEnter6DigitOTP => 'Enter 6-digit OTP';

  @override
  String get financeNewPIN => 'New PIN';

  @override
  String get financeConfirmPIN => 'Confirm PIN';

  @override
  String get financePINMust4Digits => 'PIN must be 4 digits';

  @override
  String get financePINsDoNotMatch => 'PIN does not match';

  @override
  String get financeOTPSentToEmail => 'OTP sent to your email';

  @override
  String get financeOTPExpired => 'OTP has expired. Please request a new OTP.';

  @override
  String get subscriptionInformation => 'Subscription Information';

  @override
  String get subscriptionMessage =>
      'You are about to download the beta version of Be-MindPower. After testing the bank account, wallet, and debit card services, an initial charge of 30 USD will be applied. If you decide to continue, the subscription will be 17.5 USD per month. If you agree, please press to continue.';

  @override
  String get noItemsFound => 'No items found';

  @override
  String get uploaded => 'Uploaded';

  @override
  String get uploadImage => 'Upload image';

  @override
  String get addressCopiedToClipboard => 'Address copied to clipboard';

  @override
  String get recentTransactions => 'Recent transactions';

  @override
  String get attention => 'Attention';

  @override
  String get usdcPaymentWarning =>
      'To ensure that your payment is received correctly, we only accept transfers in USDC (USD Coin). Payments sent in other cryptocurrencies cannot be credited or processed.';

  @override
  String get iAgree => 'I Agree';

  @override
  String get noCountriesAvailable => 'No countries available';

  @override
  String get noCountriesFound => 'No countries found';

  @override
  String get january => 'January';

  @override
  String get february => 'February';

  @override
  String get march => 'March';

  @override
  String get april => 'April';

  @override
  String get may => 'May';

  @override
  String get june => 'June';

  @override
  String get july => 'July';

  @override
  String get august => 'August';

  @override
  String get september => 'September';

  @override
  String get october => 'October';

  @override
  String get november => 'November';

  @override
  String get december => 'December';

  @override
  String get selectMonth => 'Select month';

  @override
  String get selectYear => 'Select year';

  @override
  String get birthday => 'Birthday';

  @override
  String get sunday => 'Su';

  @override
  String get monday => 'Mo';

  @override
  String get tuesday => 'Tu';

  @override
  String get wednesday => 'We';

  @override
  String get thursday => 'Th';

  @override
  String get friday => 'Fr';

  @override
  String get saturday => 'Sa';

  @override
  String get virtualCard => 'Virtual Card';

  @override
  String get cardType => 'Card Type';

  @override
  String get financeErrorCountryLoadFailed => 'Failed to load countries data';

  @override
  String get financeErrorRegistrationFailed =>
      'Failed to register customer after retries';

  @override
  String get financeErrorOTPVerificationFailed =>
      'Failed to verify OTP after retries';

  @override
  String get financeErrorCustomerStatusFailed =>
      'Failed to get customer status';

  @override
  String get financeErrorKYCLinkFailed => 'Failed to get KYC link';

  @override
  String get financeErrorTermsAcceptFailed =>
      'Failed to accept terms of service';

  @override
  String get financeErrorUsernameCheckFailed => 'Username check failed';

  @override
  String get financeErrorVerificationStatusFailed =>
      'Failed to get customer verification status';

  @override
  String get financeErrorCustomerUpdateFailed => 'Failed to update customer';

  @override
  String get financeErrorKYCCreateFailed => 'Failed to create KYC link';

  @override
  String get financeErrorKYCStatusFailed => 'Failed to get KYC status';

  @override
  String get financeErrorCustomerDeleteFailed => 'Failed to delete customer';

  @override
  String get financeErrorCustomerIDNotFound =>
      'Customer ID not found. Please login again.';

  @override
  String get financeErrorNoCustomerID => 'Customer ID not found';

  @override
  String get financeErrorPINVerificationFailed => 'PIN verification';

  @override
  String get financeErrorInvalidPIN => 'Invalid PIN';

  @override
  String get financeErrorWalletCreateFailed => 'Failed to create wallet';

  @override
  String get financeErrorWalletDetailsFailed => 'Failed to load wallet details';

  @override
  String get financeErrorWalletLoadFailed => 'Failed to load wallets';

  @override
  String get financeErrorTransferFailed => 'Transfer failed';

  @override
  String get financeErrorExternalTransferFailed => 'External transfer failed';

  @override
  String get financeErrorNoTransferHistory => 'No transfer history found';

  @override
  String get financeErrorDepositFailed => 'Deposit failed';

  @override
  String get financeErrorCustomerIDRequired => 'Customer ID is required';

  @override
  String get financeErrorCustomerIDRequiredDeposit =>
      'Customer ID is required for deposit';

  @override
  String get financeErrorNetworkUnavailable =>
      'Network connection unavailable. Please check your internet connection.';

  @override
  String get financeErrorInstitutionBalanceFailed =>
      'Failed to get institution balance';

  @override
  String get financeErrorCardTypesFailed => 'Failed to get card types';

  @override
  String get financeErrorExchangeRatesFailed => 'Failed to get exchange rates';

  @override
  String get financeErrorCurrencyEstimationFailed =>
      'Failed to calculate currency estimation';

  @override
  String get financeErrorCryptoEstimationFailed =>
      'Failed to calculate crypto estimation';

  @override
  String get financeErrorKYCSubmitFailed => 'Failed to submit KYC';

  @override
  String get financeErrorCardCreateFailed => 'Failed to create card';

  @override
  String get financeErrorCardBalanceFailed => 'Failed to get card balance';

  @override
  String get financeErrorTransactionHistoryFailed =>
      'Failed to get transaction history';

  @override
  String get financeErrorDepositUSDTFailed => 'Failed to deposit USDT';

  @override
  String get financeErrorDepositCryptoFailed => 'Failed to deposit crypto';

  @override
  String get financeErrorDepositFiatFailed => 'Failed to deposit fiat amount';

  @override
  String get financeErrorDepositStatusFailed => 'Failed to get deposit status';

  @override
  String get financeErrorDepositTransactionsFailed =>
      'Failed to get deposit transactions';

  @override
  String get financeSecurityPINSetSuccess => 'PIN set successfully';

  @override
  String get financeSecurityPINResetSuccess => 'PIN reset successfully';

  @override
  String get financeSecurityCustomerIDNotFound =>
      'Customer ID not found. Please login again.';

  @override
  String get financeSecurityPINVerificationCompleted => 'PIN verification';

  @override
  String get financeSecurityPINVerificationFailed => 'PIN verification';

  @override
  String get financeSecurityOTPSentSuccess => 'OTP sent successfully';

  @override
  String get financeSecurityOTPVerifiedSuccess => 'OTP verified successfully';

  @override
  String get financeSecurityTokenGeneratedSuccess =>
      'Token generated successfully';

  @override
  String get financeSecurityTokenGenerationFailed => 'Failed to generate token';

  @override
  String get financeSecurityRequestTimeout =>
      'Request timed out - please check your network connection';

  @override
  String get financeSecurityNetworkError =>
      'Network error - unable to connect to server';

  @override
  String get financeSecurityNoTokenFound =>
      'No security token found. Please generate token first.';

  @override
  String get financeSecurityCSRFRetrievedSuccess =>
      'CSRF token retrieved successfully';

  @override
  String get financeSecurityCSRFRetrievalFailed => 'Failed to get CSRF token';

  @override
  String get financeSecurityJWTExpiredRefreshFailed =>
      'JWT token expired and refresh failed';

  @override
  String get financeSecurityMissingJWTToken =>
      'Missing JWT token. Please generate security token first.';

  @override
  String get financeSecuritySignatureGeneratedSuccess =>
      'Signature generated successfully';

  @override
  String get financeErrorServiceUnavailable =>
      'Service temporarily unavailable. Please try again.';

  @override
  String get financeErrorInvalidRequest =>
      'Invalid request. Please check your information and try again.';

  @override
  String get financeUnknownError => 'An unknown error occurred';

  @override
  String get financeErrorAuthenticationFailed =>
      'Authentication failed. Please login again.';

  @override
  String get financeErrorAccessDenied =>
      'Access denied. Please contact support.';

  @override
  String get financeErrorToSLinkFailed =>
      'Unable to generate terms of service link. Please try again.';

  @override
  String get financeErrorToSError => 'Terms of Service Error';

  @override
  String get financeLoadingToS => 'Loading Terms of Service...';

  @override
  String get financeVerification => 'Verification';

  @override
  String get financeLoadingKycVerification => 'Loading KYC Verification...';

  @override
  String get financeCompleted => 'Completed';

  @override
  String get financeSubmitted => 'Submitted';

  @override
  String get financeInReview => 'In Review';

  @override
  String get financeReceived => 'Received';

  @override
  String get financeScheduled => 'Scheduled';

  @override
  String get financeAwaiting => 'Awaiting';

  @override
  String get financeFailed => 'Failed';

  @override
  String get financeReturned => 'Returned';

  @override
  String get financeRefunded => 'Refunded';

  @override
  String get financeCanceled => 'Canceled';

  @override
  String get financeUnknown => 'Unknown';

  @override
  String get financeTransactionInfo => 'Transaction Info';

  @override
  String get financeType => 'Type';

  @override
  String get financeReceipt => 'Receipt';

  @override
  String get financeInitialAmount => 'Initial Amount';

  @override
  String get financeFinalAmount => 'Final Amount';

  @override
  String get financeSource => 'Source';

  @override
  String get financeSender => 'Sender';

  @override
  String get financeBlockchain => 'Blockchain';

  @override
  String get financeTxHash => 'Tx Hash';

  @override
  String get financeTransactionDetails => 'Transaction Details';

  @override
  String get financeStreetAddressRequired => 'Street address is required';

  @override
  String get financeCityRequired => 'City is required';

  @override
  String get financePleaseSelectCountry => 'Please select a country';

  @override
  String get financeStateRequired => 'State is required';

  @override
  String get financePleaseSelectCountryFirst => 'Please select a country first';

  @override
  String get financeRequirementAddressOfIncorporation =>
      '(business) registered_address has not been provided';

  @override
  String get financeRequirementAddressOfOperation =>
      '(business) physical_address has not been provided';

  @override
  String get financeRequirementAddressOfResidence =>
      '(individual, associated person) physical_address has not been provided';

  @override
  String get financeRequirementBusinessDescription =>
      '(business) business_description has not been provided';

  @override
  String get financeRequirementBusinessFormationDocument =>
      '(business) no document including business_formation as a purpose has been provided';

  @override
  String get financeRequirementBusinessIndustry =>
      '(business) business_industry has not been provided';

  @override
  String get financeRequirementBusinessName =>
      '(business) business_legal_name has not been provided';

  @override
  String get financeRequirementBusinessOwnershipDocument =>
      '(business) no document including ownership_information as a purpose has been provided';

  @override
  String get financeRequirementBusinessWebsite =>
      '(business) primary_website has not been provided';

  @override
  String get financeRequirementControlPerson =>
      '(business) no one in associated_persons has has_control set to true';

  @override
  String get financeRequirementDateOfBirth =>
      '(individual, associated person) birth_date has not been provided';

  @override
  String get financeRequirementEmailAddress => 'email has not been provided';

  @override
  String get financeRequirementFirstName =>
      '(individual, associated person) first_name has not been provided';

  @override
  String get financeRequirementHasBase =>
      'indicates that another endorsement needs to be approved to unblock the current one';

  @override
  String get financeRequirementHasSepa =>
      'indicates that another endorsement needs to be approved to unblock the current one';

  @override
  String get financeRequirementIsDao =>
      '(business) is_dao has not been provided';

  @override
  String get financeRequirementLastName =>
      '(individual, associated person) last-name has not been provided';

  @override
  String get financeRequirementMinAge18 =>
      '(individual, associated person) have not been able to confirm a person meets age requirements';

  @override
  String get financeRequirementMinAge60 =>
      '(individual, associated person) have not been able to confirm a person meets age requirements';

  @override
  String get financeRequirementMinimalSourceOfFundsData =>
      '(business) account_purpose and source_of_funds have not been supplied';

  @override
  String get financeRequirementOwnershipStructureAttestation =>
      '(business) no one in associated_persons has provided attested_ownership_structure_at';

  @override
  String get financeRequirementPersonaSanctionsScreen =>
      'sanctions screening has not been performed';

  @override
  String get financeRequirementProofOfAddressDocument =>
      '(business) no document including proof_of_address as a purpose has been provided';

  @override
  String get financeRequirementProofOfNatureOfBusinessDocument =>
      '(business) no document including proof_of_nature_of_business as a purpose has been provided';

  @override
  String get financeRequirementProofOfNatureOfBusinessDocumentInPersona =>
      '(business) no document including proof_of_nature_of_business as a purpose has been provided';

  @override
  String get financeRequirementSourceOfFundsQuestionnaire =>
      'customer has been flagged as requiring SoF but has not submitted the full questionnaire';

  @override
  String get financeRequirementSubdivisionNotAkUsa =>
      'have not been able to confirm the location of the customer';

  @override
  String get financeRequirementSubdivisionNotNyUsa =>
      'have not been able to confirm the location of the customer';

  @override
  String get financeRequirementTaxIdentificationNumber =>
      'no tax identification number suitable for the country of residence/operation has been provided';

  @override
  String get financeRequirementTermsOfServiceV1 =>
      'customer has not accepted the minimum required version of Bridge\'s terms of service';

  @override
  String get financeRequirementTermsOfServiceV2 =>
      'customer has not accepted the minimum required version of Bridge\'s terms of service';

  @override
  String get financeIssueBeneficialOwnerTooYoung =>
      'individual is under the minimum required age (18 years old)';

  @override
  String get financeIssueCustomerTooYoung =>
      'individual is under the minimum required age (18 years old)';

  @override
  String get financeIssueBeneficialOwnerOverAge =>
      'individual exceeds maximum age';

  @override
  String get financeIssueCustomerOverAge => 'individual exceeds maximum age';

  @override
  String get financeIssueDeveloperNotCompatible =>
      'developer account is not compatible with the endorsement';

  @override
  String get financeIssueCustomerNotCompatible =>
      'customer profile is not compatible with requirements';

  @override
  String get financeIssueTaxIdentificationNumberNotCompatible =>
      'the format of the TIN did not pass validation';

  @override
  String get financeIssueEndorsementNotAvailableInCustomersRegion =>
      'endorsement not available in customer\'s geographic region';

  @override
  String get financeIssueResidenceAddressInvalidCity =>
      'Residence address city is invalid';

  @override
  String get financeIssueResidenceAddressInvalidAddressLine1 =>
      'Residence address line 1 is invalid';

  @override
  String get financeIssueResidenceAddressInvalidAddressLine2 =>
      'Residence address line 2 is invalid';

  @override
  String get financeIssueResidenceAddressInvalidPostalCode =>
      'Residence address postal code is invalid';

  @override
  String get financeIssueResidenceAddressInvalidSubdivisionCode =>
      'Residence address subdivision code is invalid';

  @override
  String get financeIssueAdverseMediaReportMatch =>
      'potential adverse media match found; customer will need a manual review';

  @override
  String get financeIssueWatchlistReportMatch =>
      'potential sanctions watchlist match found; customer will need a manual review';

  @override
  String get financeIssueBusinessFormationDocumentVerificationFailed =>
      'Business formation document verification failed';

  @override
  String get financeIssueBusinessOwnershipDocumentVerificationFailed =>
      'Business ownership document verification failed';

  @override
  String get financeIssueGovernmentIdVerificationFailed =>
      'government ID verification failed';

  @override
  String get financeIssueFundsSourcedPensionOrRetirement =>
      'funds sourced from pension/retirement (flagged)';

  @override
  String get financeIssueHighExpectedMonthlyPayments =>
      'high expected monthly payments (flagged)';

  @override
  String get financeIssueHighRiskBusinessActivities =>
      'customer engages in high-risk business activities';

  @override
  String get financeIssueOperatesInProhibitedCountries =>
      'customer operates in prohibited countries';

  @override
  String get financeIssuePoaInvalidDocumentType =>
      'Proof of Address document type is not accepted';

  @override
  String get financeIssuePoaManipulated =>
      'Proof of Address document appears to be manipulated';

  @override
  String get financeIssuePoaNameMismatch =>
      'Proof of Address document name doesn\'t match customer name';

  @override
  String get financeIssuePoaPast90Days =>
      'Proof of Address document is older than 90 days';

  @override
  String get financeIssuePoaVirtualOrPoBox =>
      'proof of Address is a virtual address or PO Box (not allowed)';

  @override
  String get financeIssueProofOfNatureOfBusinessDocumentVerificationFailed =>
      'Proof of nature of business document verification failed';

  @override
  String get financeIssueSuspiciousPrimaryPurpose =>
      'primary purpose appears suspicious';

  @override
  String get financeIssueSuspiciousSourceOfFunds =>
      'source of funds appears suspicious';

  @override
  String get financeIssueUnemployedUsingSalary =>
      'unemployed person claiming salary income (flagged)';

  @override
  String get financeIssueBusinessLookupNoMatch =>
      'found no matches in the business registry; customer will need a manual review';

  @override
  String get financeIssueBusinessRegistryNoMatch =>
      'found no matches in the business registry; customer will need a manual review';

  @override
  String get financeIssueBusinessEinNoMatch => 'EIN validation failed';

  @override
  String get financeIssueBusinessWebsiteFailure =>
      'validation of the provided website failed; customer will need a manual review';

  @override
  String get financeIssueDatabaseCheckFailedOnNameLast =>
      'database check failed on last name';

  @override
  String get financeIssueDatabaseCheckFailedOnSocialSecurityNumber =>
      'database check failed on SSN';

  @override
  String get financeIssueDatabaseCheckFailedOnTinValidation =>
      'database check failed on TIN validation';

  @override
  String get financeIssueDatabaseCheckFailedOnHouseNumber =>
      'database check failed on house number';

  @override
  String get financeIssueDatabaseCheckFailedOnStreetName =>
      'database check failed on street name';

  @override
  String get financeIssueDatabaseCheckFailedOnStreetType =>
      'database check failed on street type';

  @override
  String get financeIssueDatabaseCheckFailedOnCity =>
      'database check failed on city';

  @override
  String get financeIssueDatabaseCheckFailedOnPostalCode =>
      'database check failed on postal code';

  @override
  String get financeIssueDatabaseCheckFailedOnSubdivision =>
      'database check failed on subdivision';

  @override
  String get financeIssueDatabaseCheckFailedOnCountryCode =>
      'database check failed on country code';

  @override
  String get financeIssuePoaFailed => 'proof of Address verification failed';

  @override
  String get financeIssueBlocklistCheckFailed =>
      'identifying information provided is for a person that Bridge will not support';

  @override
  String get financeIssueManualReviewRejected => 'manual review was rejected';

  @override
  String get financeIssuePendingRfi =>
      'request for Information (RFI) is pending';

  @override
  String get financeIssueRejectedDueToUnsupportedGeo =>
      'rejected due to unsupported geography';

  @override
  String get financeIssueRejectedDueToUnsupportedBusinessActivities =>
      'rejected due to unsupported business activities';

  @override
  String get financeIssueRejectedDueToInaccurateOnboardingDetails =>
      'rejected due to inaccurate onboarding details';

  @override
  String get financeIssueRejectedDueToUnidentifiableBusinessEntity =>
      'rejected due to unidentifiable business entity';

  @override
  String get youAreConnected => 'You are connected!';

  @override
  String youCanNowTalkTo(String contactName) {
    return 'You can now talk to @$contactName';
  }

  @override
  String get goChat => 'go chat';

  @override
  String get verifyingOtherAccount => 'Verifying the \n other account';

  @override
  String waitingForContactToAccept(String contactName) {
    return 'Waiting for $contactName to \n accept the invitation.';
  }

  @override
  String get creatingGroup => 'Creating group';

  @override
  String settingUpYourGroup(String groupName) {
    return 'Setting up your group $groupName';
  }

  @override
  String get groupCreated => 'Group Created!';

  @override
  String yourGroupIsReady(String groupName) {
    return 'Your group \'$groupName\' is ready';
  }

  @override
  String get goToGroup => 'Go to Group';

  @override
  String get noInternetConnection => 'No internet connection!';

  @override
  String get pleaseCheckYourInternetConnection =>
      'Please check your internet\nconnection';

  @override
  String get enableWiFi => 'Enable WiFi';

  @override
  String get testingExternalAccountCreationAPI =>
      'Testing External Account Creation API';

  @override
  String get payload => 'Payload';

  @override
  String get responseStatus => 'Response Status';

  @override
  String get responseHeaders => 'Response Headers';

  @override
  String get responseBody => 'Response Body';

  @override
  String get successExternalAccountCreated =>
      'Success! External account created successfully';

  @override
  String get responseStructure => 'Response structure';

  @override
  String get errorDetails => 'Error details';

  @override
  String get rawError => 'Raw error';

  @override
  String get exception => 'Exception';

  @override
  String get testingCustomerVerificationStatus =>
      'Testing Customer Verification Status';

  @override
  String get customerID => 'Customer ID';

  @override
  String get customerFound => 'Customer found';

  @override
  String get hasAcceptedTerms => 'Has accepted terms';

  @override
  String get rejectionReasons => 'Rejection reasons';

  @override
  String get requirementsDue => 'Requirements due';

  @override
  String get canCreateExternalAccounts => 'Can create external accounts';

  @override
  String get issuesPreventingExternalAccountCreation =>
      'Issues preventing external account creation:';

  @override
  String get termsOfServiceNotAccepted => 'Terms of service not accepted';

  @override
  String get accountHasRejectionReasons => 'Account has rejection reasons';

  @override
  String get authFixCheckingClient => 'AuthFix: Checking client';

  @override
  String get isLogged => 'isLogged';

  @override
  String get userID => 'userID';

  @override
  String get authFixStoredMatrixId => 'AuthFix: Stored matrix_id';

  @override
  String get authFixFixingMatrixId => 'AuthFix: Fixing matrix_id from';

  @override
  String get authFixGeneratingTokens =>
      'AuthFix: Generating tokens for username';

  @override
  String get authFixJwtTokenGenerated =>
      'AuthFix: JWT token generated and stored';

  @override
  String get authFixCsrfTokenGenerated =>
      'AuthFix: CSRF token generated and refresh initialized';

  @override
  String get authFixCsrfTokenFailed => 'AuthFix: CSRF token generation failed';

  @override
  String get authFixJwtTokenFailed => 'AuthFix: JWT token generation failed';

  @override
  String get authFixMatrixIdCorrect =>
      'AuthFix: Matrix ID already correct, no fix needed';

  @override
  String get authFixClientNotLoggedIn =>
      'AuthFix: Client not logged in or no userID';

  @override
  String get authFixException => 'AuthFix: Exception';

  @override
  String get autoEncryptionSetupFailed => 'Auto encryption setup failed';

  @override
  String get autoDeviceVerificationFailed => 'Auto device verification failed';

  @override
  String get autoRoomEncryptionFailed => 'Auto room encryption failed';

  @override
  String get messageSentToRoom => 'Message sent to room';

  @override
  String get roomNotFound => 'Room not found';

  @override
  String get errorSendingMessage => 'Error sending message';

  @override
  String get messageSentToRoomAlias => 'Message sent to room alias';

  @override
  String get errorSendingMessageToAlias => 'Error sending message to alias';

  @override
  String get directMessageSentTo => 'Direct message sent to';

  @override
  String get errorSendingDirectMessage => 'Error sending direct message';

  @override
  String get passwordMinLength => 'Password must be at least 6 characters';

  @override
  String get contactSearch => 'Contact Search';

  @override
  String get noChatsFound => 'No chats found';

  @override
  String get emoji => 'Emoji';

  @override
  String get contactsAccessRequired => 'Contacts Access Required';

  @override
  String get myCard => 'My Card';

  @override
  String get favoriteMessage => 'Favorite message';

  @override
  String get messageContentUnavailable => 'Message content unavailable';

  @override
  String get storageAccessRequired => 'Storage Access Required';

  @override
  String get searchFiles => 'Search files';

  @override
  String get noFilesFound => 'No files found';

  @override
  String get refresh => 'Refresh';

  @override
  String sendPhotos(int count, String plural) {
    return 'Send $count Photo$plural';
  }

  @override
  String get locationAccessRequired => 'Location Access Required';

  @override
  String get failedToGetLocation => 'Failed to get location';

  @override
  String get tapToGetCurrentLocation => 'Tap to get current location';

  @override
  String get getLocation => 'Get Location';

  @override
  String get currentLocation => 'Current Location';

  @override
  String get sendCurrentLocation => 'Send Current Location';

  @override
  String get chooseOnMap => 'Choose on Map';

  @override
  String get refreshLocation => 'Refresh Location';

  @override
  String get debug => 'Debug';

  @override
  String get weak => 'Weak';

  @override
  String get medium => 'Medium';

  @override
  String get good => 'Good';

  @override
  String get strong => 'Strong';

  @override
  String get confirmGoBack => 'Confirm';

  @override
  String get goBackProgressLost =>
      'Are you sure you want to go back? Your progress will be lost.';

  @override
  String get createAccount => 'Create Account';

  @override
  String get verifyPhone => 'Let\'s verify your phone number.';

  @override
  String get isItCorrectOrModify =>
      'Is it correct, or do you want to modify it?';

  @override
  String get waitingToDetectSms =>
      'Waiting to automatically detect the SMS sent to';

  @override
  String get verificationCode => 'Verification code';

  @override
  String get resendCode => 'Resend code';

  @override
  String get sendAgain => 'Send again';

  @override
  String get fullName => 'Full Name';

  @override
  String get exampleEmail => 'example@mail.com';

  @override
  String get continueButton => 'Continue';

  @override
  String get atLeast6Characters => 'at least 6 characters';

  @override
  String get backToLogin => 'Back to Login';

  @override
  String get usernameOrEmailRequired => 'Username or email is required';

  @override
  String get invalidEmailOrPassword => 'Invalid email or password';

  @override
  String get invalidUsernameOrPassword => 'Invalid username or password';

  @override
  String get emailNotFoundSignUp =>
      'Email not found. Please check your email or sign up first.';

  @override
  String get tooManyLoginAttempts =>
      'Too many login attempts. Please try again later.';

  @override
  String get serverErrorTryAgain => 'Server error. Please try again later.';

  @override
  String loginFailed(Object loginError) {
    return 'Login failed: $loginError';
  }

  @override
  String get serverConfigError =>
      'Server configuration error. Please contact support.';

  @override
  String get serverError =>
      'Server error. Email service may not be configured.';

  @override
  String get requestTimeout => 'Request timeout. Please try again.';

  @override
  String get emailServiceNotAvailable =>
      'Email service not available. Please contact support.';

  @override
  String get serverErrorTryLater => 'Server error. Please try again later.';

  @override
  String get passwordIsRequired => 'Password is required';

  @override
  String get confirmPasswordRequired => 'Confirm password is required';

  @override
  String get emailNotVerified =>
      'You have not verified your email yet.\\nPlease check your email and click the verification link first.';

  @override
  String weSentResetLink(String email) {
    return 'We sent a reset link to $email';
  }

  @override
  String get verificationWarning =>
      'Not verified yet. Please click the verification link in your email, then enter your new password below.';

  @override
  String get enterNewPassword => 'Enter new password';

  @override
  String get confirmNewPassword => 'Confirm new password';

  @override
  String get connectionError =>
      'Connection error. Please check your internet connection.';

  @override
  String get enterEmail => 'Enter email';

  @override
  String get enterEmailOrUsername => 'Enter email or username';

  @override
  String get forgotYourPassword => 'Forgot your Password?';

  @override
  String get orLoginWith => 'or Login with';

  @override
  String get doYouHaveAccount => 'Do you have an account?';

  @override
  String get usernameMinLength => 'Username must be at least 3 characters';

  @override
  String get usernameMaxLength => 'Username must be 20 characters or less';

  @override
  String get usernameInvalidFormat =>
      'Username can only contain lowercase letters, numbers, underscore (_), and dot (.)';

  @override
  String get usernameCannotStartWith =>
      'Username cannot start with underscore (_) or dot (.)';

  @override
  String get usernameCannotEndWith =>
      'Username cannot end with underscore (_) or dot (.)';

  @override
  String get usernameConsecutiveChars =>
      'Username cannot have consecutive special characters';

  @override
  String get usernameMustContainLetter =>
      'Username must contain at least one letter';

  @override
  String get fullNameIsRequired => 'Full name is required';

  @override
  String get usernameAlreadyTaken => 'Username Already Taken';

  @override
  String get usernameAlreadyInUse =>
      'This username is already in use. Please choose a different username.';

  @override
  String get emailAlreadyInUse => 'This email is already in use.';

  @override
  String get langEnglish => 'English';

  @override
  String get langSpanish => 'Spanish';

  @override
  String get countrySpain => 'Spain';

  @override
  String get countryUS => 'US';

  @override
  String get countryUnitedStates => 'United States';

  @override
  String get countryFrance => 'France';

  @override
  String get countryGermany => 'Germany';

  @override
  String get countryItaly => 'Italy';

  @override
  String get countryAustralia => 'Australia';

  @override
  String get countryBrazil => 'Brazil';

  @override
  String get enterText => 'Enter text';

  @override
  String get recordingFailed => 'Recording failed!';

  @override
  String get rememberMe => 'Remember me';

  @override
  String get otpVerificationFailed => 'OTP verification failed';

  @override
  String get customerNotFound => 'Customer not found';

  @override
  String get failedToGetCustomerStatus => 'Failed to get customer status';

  @override
  String get failedToGetCustomerStatusAfterCsrfRefresh =>
      'Failed to get customer status after CSRF refresh';

  @override
  String get failedToUpdateCustomer => 'Failed to update customer';

  @override
  String get failedToCreateKycLink => 'Failed to create KYC link';

  @override
  String get failedToGetKycStatus => 'Failed to get KYC status';

  @override
  String get usernameCheckFailed => 'Username check failed';

  @override
  String get failedToRegisterCustomerAfterRetries =>
      'Failed to register customer after all retry attempts';

  @override
  String get failedToVerifyOtpAfterRetries =>
      'Failed to verify OTP after all retry attempts';

  @override
  String get fullNameRequired => 'Full name is required';

  @override
  String get usernameRequired => 'Username is required';

  @override
  String get usernameCannotContainSpaces => 'Username cannot contain spaces';

  @override
  String get apiErrorTitle => 'Error';

  @override
  String get apiErrorDefaultMessage => 'An error occurred';

  @override
  String get apiErrorInvalidField => 'Invalid field';

  @override
  String get financeKYCAgeRestrictionError =>
      'You must be at least 18 years old to register';

  @override
  String get financeKYCDocumentUpload => 'Upload image';

  @override
  String get financeKYCPreviousButton => 'Previous';

  @override
  String get financeKYCCancelButton => 'Cancel';

  @override
  String get financeKYCNextButton => 'Next';

  @override
  String get financeKYCSubmitButton => 'Submit KYC';

  @override
  String get financeKYCPersonalInfoStep => 'Personal Info';

  @override
  String get financeKYCAddressStep => 'Address';

  @override
  String get financeKYCDocumentStep => 'Document';

  @override
  String get financeKYCReviewStep => 'Review';

  @override
  String get financeKYCFrontDocument => 'Front of Document';

  @override
  String get financeKYCBackDocument => 'Back of Document';

  @override
  String get financeKYCSelfieWithDocument => 'Selfie with Document';

  @override
  String get financeKYCErrorTitle => 'Error';

  @override
  String get financeKYCProcessingMessage =>
      'Your KYC submission is being processed. We\'ll notify you once it\'s complete.';

  @override
  String get financeKYCDocumentsReceived => 'Documents Received';

  @override
  String get financeKYCUnderReviewStatus => 'Under Review';

  @override
  String get financeKYCApprovalPending => 'Approval Pending';

  @override
  String get createStory => 'Create Story';

  @override
  String get text => 'Text';

  @override
  String get photo => 'Photo';

  @override
  String get video => 'Video';

  @override
  String get typeYourStory => 'Type your story...';

  @override
  String get videoSelected => 'Video Selected';

  @override
  String get tapToSelectPhoto => 'Tap to select photo';

  @override
  String get tapToSelectVideo => 'Tap to select video';

  @override
  String get storyCreatedSuccessfully => 'Story created successfully!';

  @override
  String get pleaseEnterSomeText => 'Please enter some text';

  @override
  String get pleaseSelectAPhoto => 'Please select a photo';

  @override
  String get pleaseSelectAVideo => 'Please select a video';

  @override
  String errorPickingMedia(String error) {
    return 'Error picking media: $error';
  }

  @override
  String errorCreatingStory(String error) {
    return 'Error creating story: $error';
  }

  @override
  String get storyViews => 'Story Views';

  @override
  String views(int count) {
    return '$count views';
  }

  @override
  String get noViewsYet => 'No views yet';

  @override
  String get videoStory => 'Video Story';

  @override
  String get justNow => 'Just now';

  @override
  String minutesAgo(int minutes) {
    return '${minutes}m ago';
  }

  @override
  String hoursAgo(int hours) {
    return '${hours}h ago';
  }

  @override
  String get couldNotOpenFile => 'Could not open file';

  @override
  String get noStoriesAvailable => 'No stories available';

  @override
  String get mediaUploadIssue => 'Media Upload Issue';

  @override
  String get checkSynapseMediaConfiguration =>
      'Check Synapse media configuration';

  @override
  String get replyToStory => 'Reply to story...';

  @override
  String get view => 'View';

  @override
  String get mapUnavailable => 'Map unavailable';

  @override
  String get locationPreview => 'Location Preview';

  @override
  String get selectFilesUsingButtonsAbove =>
      'Select files using the buttons above';

  @override
  String viewedBy(int count) {
    return 'Viewed by $count';
  }

  @override
  String get replySent => 'Reply sent!';

  @override
  String get deleteStory => 'Delete Story';

  @override
  String get areYouSureDeleteStory =>
      'Are you sure you want to delete this story?';

  @override
  String get noBlockedUsers => 'No blocked users';

  @override
  String get incomingCall => 'Incoming Call';

  @override
  String get profileSettings => 'Profile Settings';

  @override
  String get flightMode => 'Flight Mode';

  @override
  String get manageYourFlightMode => 'Manage your flight mode';

  @override
  String get passwordAndSecurity => 'Password & Security';

  @override
  String get twoFactorAuthentication => 'Two-factor authentication';

  @override
  String get enableTwoFactorAuthentication =>
      'Enable two-factor authentication';

  @override
  String get viewActiveSessions => 'View active sessions';

  @override
  String get signingIn => 'Signing in';

  @override
  String get usernameInvalidCharacters =>
      'Username can only contain letters, numbers, dots, underscores, and hyphens';

  @override
  String get emailRequired => 'Email is required';

  @override
  String get pleaseEnterValidEmail => 'Please enter a valid email address';

  @override
  String get passwordRequired => 'Password is required';

  @override
  String get passwordMustContainUppercase =>
      'Password must contain at least 1 uppercase letter (A-Z)';

  @override
  String get passwordMustContainLowercase =>
      'Password must contain at least 1 lowercase letter (a-z)';

  @override
  String get passwordMustContainNumber =>
      'Password must contain at least 1 number (0-9)';

  @override
  String get passwordMustContainSpecialChar =>
      'Password must contain at least 1 special character (!@#\$%^&*?)';

  @override
  String get passwordCannotContainUsername =>
      'Password cannot contain your username';

  @override
  String get passwordCannotContainCommonWords =>
      'Password cannot contain common words';

  @override
  String get passwordCannotContainSequences =>
      'Password cannot contain simple sequences';

  @override
  String get noPendingVerification =>
      'No pending verification found. Please start registration again.';

  @override
  String get emailVerificationRequiredMessage =>
      'Email verification required. Please check your email and click the verification link. Make sure to click the link in the email before trying to complete registration.';

  @override
  String get failedToStartEmailVerification =>
      'Failed to start email verification';

  @override
  String get personalAccount => 'Personal Account';

  @override
  String get provideIdentificationDetails =>
      'Please provide your identification details in the space below.';

  @override
  String get processingData => 'Processing Data';

  @override
  String get firstName => 'First Name';

  @override
  String get pleaseEnterFirstName => 'Please enter your first name';

  @override
  String get middleNameOptional => 'Middle Name (optional)';

  @override
  String get lastName => 'Last Name';

  @override
  String get pleaseEnterLastName => 'Please enter your last name';

  @override
  String get idOrPassportType => 'ID or Passport Type';

  @override
  String get pleaseSelectDocumentType => 'Please select a document type';

  @override
  String get dni => 'DNI';

  @override
  String get passport => 'Passport';

  @override
  String get driverLicense => 'Driver License';

  @override
  String get otherId => 'Other ID';

  @override
  String get documentNumber => 'Document Number';

  @override
  String get pleaseEnterDocumentNumber => 'Please enter your document number';

  @override
  String get resetPassword => 'Reset Password';

  @override
  String get checkYourEmail => 'Check Your Email';

  @override
  String get enterYourEmail => 'Enter your email';

  @override
  String get emailIsRequired => 'Email is required';

  @override
  String get sendResetLink => 'Send Reset Link';

  @override
  String get failedToSendResetEmail => 'Failed to send reset email';

  @override
  String get emailNotFound =>
      'Email address not found. Please check your email or sign up first.';

  @override
  String get myStory => 'My Story';

  @override
  String get today => 'Today';

  @override
  String get yesterday => 'Yesterday';

  @override
  String get financeDeleteAccount => 'Delete External Account';

  @override
  String get financeDeleteAccountConfirmation =>
      'Are you sure you want to delete this external account? This action cannot be undone.';

  @override
  String get financeAccountDeleted => 'External account deleted successfully';

  @override
  String get financeKYCStepPersonalInfo => 'Personal\nInfo';

  @override
  String get financeKYCStepAddress => 'Address';

  @override
  String get financeKYCStepDocument => 'Document';

  @override
  String get financeKYCStepReview => 'Review';

  @override
  String get financeKYCDocumentType => 'Document Type';

  @override
  String get financeKYCPassport => 'Passport';

  @override
  String get financeKYCDocumentNumber => 'Document Number';

  @override
  String get financePayCryptoDocNumberRequired =>
      'Please enter your document number';

  @override
  String get financeKYCMotherMaidenName => 'Mother\'s Maiden Name';

  @override
  String get financePayCryptoMaidenNameRequired =>
      'Please enter mother\'s maiden name';

  @override
  String get financeKYCUploadFrontID => 'Upload Front ID';

  @override
  String get financeKYCUploadBackID => 'Upload Back ID';

  @override
  String get financeKYCUploadSelfieWithDoc => 'Upload Selfie with Document';

  @override
  String get financeKYCReviewName => 'Name';

  @override
  String get financeKYCReviewEmail => 'Email';

  @override
  String get financeKYCReviewPhone => 'Phone';

  @override
  String get financeKYCReviewAddress => 'Address';

  @override
  String get financeKYCReviewDocumentType => 'Document Type';

  @override
  String get financeKYCReviewDocumentNumber => 'Document Number';

  @override
  String get financeKYCReviewFrontImage => 'Front Image';

  @override
  String get financeKYCReviewBackImage => 'Back Image';

  @override
  String get financeKYCReviewMixedImage => 'Mixed Image';

  @override
  String get financeKYCReviewUploaded => 'Uploaded';

  @override
  String get financeKYCReviewNotUploaded => 'Not uploaded';

  @override
  String get financeKYCUploadImage => 'Upload image';

  @override
  String get financeKYCMustBe18 =>
      'You must be at least 18 years old to register';

  @override
  String get financeKYCPleaseFixIssues => 'Please fix the following issues:';

  @override
  String get financeKYCPleaseSelectStateProvince =>
      'Please select your state/province';

  @override
  String get financePayCryptoMaidenNameMinLength =>
      'Mother\'s maiden name must be at least 2 characters';

  @override
  String get financeKYCUploadFrontDoc =>
      'Please upload the front of your document';

  @override
  String get financeKYCUploadBackDoc =>
      'Please upload the back of your document';

  @override
  String get financeKYCUploadSelfieWithDocClear =>
      'Please upload a selfie holding your document clearly visible';

  @override
  String get financeKYCSubmissionFailed => 'KYC submission failed';

  @override
  String get financeKYCSubmissionFailedCheckDocs =>
      'KYC submission failed. Please check your documents and try again.';

  @override
  String get financeKYCFailedToSubmit => 'Failed to submit KYC';

  @override
  String financeKYCErrorProcessingImages(String error) {
    return 'Error processing images: $error';
  }

  @override
  String get financeKycNotStarted => 'KYC Not Started';

  @override
  String get financeKycIncomplete => 'KYC Incomplete';

  @override
  String get financeKycQuestionnaireRequired => 'Questionnaire Required';

  @override
  String get financeKycUboDetailsRequired => 'UBO Details Required';

  @override
  String get financeKycUnderReview => 'Under Review';

  @override
  String get financeKycApproved => 'KYC Approved';

  @override
  String get financeKycRejected => 'KYC Rejected';

  @override
  String get financeKycAccountPaused => 'Account Paused';

  @override
  String get financeKycAccountClosed => 'Account Closed';

  @override
  String get financeKycStatusUnknown => 'Status Unknown';

  @override
  String get financeKycNotStartedDesc =>
      'Identity verification has not been started yet';

  @override
  String get financeKycIncompleteDesc =>
      'Please complete all required verification steps';

  @override
  String get financeKycQuestionnaireRequiredDesc =>
      'Additional questionnaire needs to be completed';

  @override
  String get financeKycUboDetailsRequiredDesc =>
      'Ultimate Beneficial Owner details are required';

  @override
  String get financeKycUnderReviewDesc =>
      'Your verification is currently being reviewed';

  @override
  String get financeKycApprovedDesc =>
      'Your identity has been successfully verified';

  @override
  String get financeKycRejectedDesc =>
      'Verification was rejected. Please review and resubmit';

  @override
  String get financeKycAccountPausedDesc =>
      'Your account has been temporarily paused';

  @override
  String get financeKycAccountClosedDesc => 'Your account has been closed';

  @override
  String get financeKycUnknownStatusDesc =>
      'Unable to determine verification status';

  @override
  String get financeKycStartVerification => 'Start Verification';

  @override
  String get financeKycCompleteVerification => 'Complete Verification';

  @override
  String get financeKycCompleteQuestionnaire => 'Complete Questionnaire';

  @override
  String get financeKycProvideUboDetails => 'Provide UBO Details';

  @override
  String get financeKycRetryVerification => 'Retry Verification';

  @override
  String get financeKycContinueVerification => 'Continue Verification';

  @override
  String get financeKycLoadingStatus => 'Loading Status...';

  @override
  String get financeKycOpenLink => 'Open Link';

  @override
  String get financeKycViewTerms => 'View Terms';

  @override
  String get financeKycRefreshStatus => 'Refresh Status';

  @override
  String get financeKycCannotOpenLink => 'Cannot Open Link';

  @override
  String get financeKycFailedToOpenLink => 'Failed to open verification link';

  @override
  String get financeKycTosAcceptedSuccess =>
      'Terms of Service accepted successfully';

  @override
  String get customerKycLoadingUserInfo => 'Loading user information...';

  @override
  String get customerKycCreateCustomerAccount => 'Create Customer Account';

  @override
  String get customerKycCompleteKycSubtitle =>
      'Complete KYC verification to access financial services';

  @override
  String get customerKycCustomerType => 'Customer Type';

  @override
  String get customerKycIndividual => 'Individual';

  @override
  String get customerKycCompany => 'Company';

  @override
  String get customerKycFullName => 'Full Name';

  @override
  String get customerKycEmail => 'Email';

  @override
  String get customerKycGenerateKycLink => 'Generate KYC Link';

  @override
  String get customerKycNameRequired => 'Name is required';

  @override
  String get customerKycEmailRequired => 'Email is required';

  @override
  String get customerKycInvalidEmailFormat => 'Invalid email format';

  @override
  String get customerKycSelectEndorsement =>
      'Please select at least one endorsement';

  @override
  String get customerKycSelectPaymentService =>
      'Please select at least one payment service';

  @override
  String get customerKycUsernameNotFound =>
      'Username not found. Please login again.';

  @override
  String get customerKycFailedSendOtp => 'Failed to send OTP';

  @override
  String get customerKycVerificationFailed => 'Verification failed';

  @override
  String get customerKycFailedCreateLink => 'Failed to create KYC link';

  @override
  String get customerKycCustomerIdNotFound =>
      'Customer ID not found in response';

  @override
  String get customerKycLinkAlreadyExists =>
      'A KYC link already exists for this email';

  @override
  String get customerKycCannotOpenLink => 'Cannot open this link';

  @override
  String get customerKycFailedOpenLink => 'Failed to open link';

  @override
  String get customerKycLinkGeneratedSuccess =>
      'KYC link generated successfully';

  @override
  String get customerKycVerification => 'KYC Verification';

  @override
  String get customerKycOpenKycLink => 'Open KYC Link';

  @override
  String get customerKycViewTermsOfService => 'View Terms of Service';

  @override
  String get customerKycCreateAccount => 'Create Account';

  @override
  String get customerKycPaymentServices => 'Payment Services';

  @override
  String get customerKycPaymentServicesSubtitle =>
      'Select the payment methods and currencies you want to use. You can choose multiple options.';

  @override
  String get customerKycAllServices => 'All Services';

  @override
  String get customerKycUsdAchWire => 'USD (ACH/Wire)';

  @override
  String get customerKycEurSepa => 'EUR (SEPA)';

  @override
  String get customerKycMxnSpei => 'MXN (SPEI)';

  @override
  String get customerKycBrlPix => 'BRL (Pix)';

  @override
  String get customerKycUsdTooltip =>
      'Supports USD payments via ACH or Wire transfers for US dollar transactions.';

  @override
  String get customerKycEurTooltip =>
      'Provides EUR payments through SEPA for European transactions.';

  @override
  String get customerKycMxnTooltip =>
      'Enables MXN payments via SPEI for Mexican peso transactions.';

  @override
  String get customerKycBrlTooltip =>
      'Allows BRL payments via Pix for Brazilian real transactions.';

  @override
  String get customerKycStatusNotStarted =>
      'KYC not started. Please begin verification.';

  @override
  String get customerKycStatusInProgress =>
      'KYC in progress. Please complete verification.';

  @override
  String get customerKycStatusApproved =>
      'KYC approved! You can now create your account.';

  @override
  String get customerKycStatusRejected =>
      'KYC rejected. Please review and retry.';

  @override
  String get customerKycStatusUnderReview =>
      'KYC under review. Please wait for approval.';

  @override
  String get customerKycStatusUnknown => 'Unknown status';

  @override
  String get customerKycDialogGotIt => 'Got it';

  @override
  String get exit => 'Exit';

  @override
  String get doYouWantToExitTheApp => 'Do you want to exit the app?';

  @override
  String get newChatRequests => 'New Chat Requests';

  @override
  String get changeLanguageTitle => 'Change Language';

  @override
  String get selectLanguage => 'Select Language';

  @override
  String get messageQuestionWillBeAvailable =>
      'Message Question will be available soon!';

  @override
  String get enter4DigitPin => 'Enter your 4-digit PIN';

  @override
  String get createPinCode => 'Create your PIN code';

  @override
  String get welcomeTo => 'Welcome to';

  @override
  String get enjoyFullExperience =>
      'Enjoy the full experience that BMP offers you';

  @override
  String get signUpForAccount => 'Sign up For an\naccount';

  @override
  String get enterYourPhoneNumber => 'Enter your phone number';

  @override
  String get verificationSMSMessage =>
      'BMP will send you an SMS message to verify your phone number.';

  @override
  String get phoneNumber => 'Phone number';

  @override
  String get loginOnboardingNote =>
      '• Users who already have an account with email, please log in using your email first and then link your phone number.\n\n• New users should register directly using their phone number.';

  @override
  String get note => 'Note';

  @override
  String get enterEmailOrUsernameToContinue =>
      'Enter your email or username and password to continue';

  @override
  String get securityUpdateRequired => 'Security Update Required';

  @override
  String get linkPhoneToSecureAccount =>
      'Please link your phone number to secure your account and continue.';

  @override
  String get ageRestrictionMessage =>
      'You must be at least 16 years old to register. Learn more about how BMP works.';

  @override
  String get enterPhoneNumberError => 'Please enter a phone number';

  @override
  String get pinSetSuccessfully => 'PIN Set Successfully!';

  @override
  String get selectCountry => 'Select Country';

  @override
  String get searchYourCountry => 'Search your country';

  @override
  String get groupChats => 'Group Chats';

  @override
  String get myQR => 'My QR';

  @override
  String get tapToStartConversation => 'Tap to start conversation';

  @override
  String get changeProfilePicture => 'Change Profile Picture';

  @override
  String get displayName => 'Display Name';

  @override
  String get editContact => 'Edit Contact';

  @override
  String get pleaseEnterYourPhoneNumber => 'Please enter your phone number';

  @override
  String get otpSentSuccessfully => 'OTP sent successfully';

  @override
  String get otpSendFailed => 'OTP send failed';

  @override
  String get otpVerifiedSuccessfully => 'OTP verified successfully';

  @override
  String get sessionIdIsMissing => 'Session ID is missing';

  @override
  String get verificationSuccessful => 'Verification successful';

  @override
  String get pleaseEnterPhoneNumber => 'Please enter phone number';

  @override
  String phoneNumberMustBeDigits(int requiredLength) {
    return 'El número de teléfono debe tener al menos $requiredLength dígitos';
  }

  @override
  String phoneNumberCannotExceedDigits(Object requiredLength) {
    return 'Phone number cannot exceed $requiredLength digits';
  }

  @override
  String get phoneNumberMustContainOnlyDigits =>
      'Phone number must contain only digits';

  @override
  String get ibanNumber => 'IBAN Number';

  @override
  String get bicSwift => 'BIC / SWIFT';

  @override
  String get encryptionSetupTitle => 'Encryption Setup Required';

  @override
  String get encryptionSetupMessage =>
      'Your device encryption is not properly set up. This is required for secure messaging.\n\nWould you like to complete the encryption setup now?';

  @override
  String get encryptionSetupOk => 'Complete Setup';

  @override
  String get encryptionDisableNotAllowed =>
      'You cannot disable the encryption in a room. If you want to disable the encryption, then create a new room without encryption.';

  @override
  String get publicRoomEncryptionNotAllowed =>
      'Public rooms cannot be encrypted.';

  @override
  String get encryptionPermissionDenied =>
      'You do not have permission to change this.';

  @override
  String get encryptionSetupCompleted =>
      'Encryption setup completed! You can now enable encryption.';

  @override
  String enableEncryptionFailed(Object error) {
    return 'Failed to enable encryption: $error';
  }

  @override
  String completeEncryptionSetupFailed(Object error) {
    return 'Failed to complete encryption setup: $error. Please try again or contact support.';
  }

  @override
  String get encryptionIrreversibleWarning =>
      'Enabling encryption in this room is irreversible! Are you sure?';

  @override
  String get encryptionEnabledSuccess => 'Encryption enabled successfully!';

  @override
  String get encryptionError => 'Encryption Error';

  @override
  String get encryptionSetupFailedTitle => 'Encryption Setup Failed';

  @override
  String get noTransactionHistoryAvailable =>
      'No transaction history available';

  @override
  String get approved => 'Approved';

  @override
  String get active => 'Active';

  @override
  String get rejected => 'Rejected';

  @override
  String get pending => 'Pending';

  @override
  String get under_review => 'Under Review';

  @override
  String get incomplete => 'Incomplete';

  @override
  String get not_started => 'Not Started';

  @override
  String get awaiting_questionnaire => 'Awaiting Questionnaire';

  @override
  String get awaiting_ubo => 'Awaiting UBO';

  @override
  String get paused => 'Paused';

  @override
  String get offboarded => 'Offboarded';

  @override
  String get virtual => 'Virtual';

  @override
  String get physical => 'Physical';

  @override
  String get selectCardType => 'Select Card Type';

  @override
  String get chooseCardTypeDescription =>
      'Choose the type of card you want to create';

  @override
  String get chooseVirtualAccountType =>
      'Choose the type of virtual account you want to create';

  @override
  String get noStoriesToShow => 'No Stories to Show';

  @override
  String get noExternalAccountsAvailable => 'No external account';

  @override
  String get noExternalAccountAdded => 'No External account added';

  @override
  String get editAddress => 'Edit Address';

  @override
  String get inactive => 'Inactive';

  @override
  String get activated => 'Activated';

  @override
  String get editAccount => 'Edit Account';

  @override
  String get networkConnectionFailed =>
      'Network connection failed. Please make sure that you are connected to the internet.';

  @override
  String get networkErrorTitle => 'Network Error';

  @override
  String get maxTwoVideos => 'You can select up to 2 videos';

  @override
  String get maxEightImages => 'You can select up to 8 images';

  @override
  String get createChannel => 'Create Channel';

  @override
  String get channelCreatedSuccess => 'Channel has been successfully created';

  @override
  String get channelCreatedFailed => 'Failed to create channel';

  @override
  String get channelNameEmpty => 'Channel name cannot be empty';

  @override
  String get channelNameExists => 'Channel name already exists in this group';

  @override
  String get enterChannelName => 'Enter Channel Name';

  @override
  String get createGroupChannel => 'Create Group Channel';

  @override
  String get initiateKycProcess => 'Initiate KYC Process';

  @override
  String get acceptTermsAndConditions => 'Accept Terms & Conditions';

  @override
  String get setTransactionPin => 'Set Transaction PIN';

  @override
  String get createFourDigitPin => 'Create a 4-digit PIN for transactions';

  @override
  String loadLiquidationAddressFailed(Object error) {
    return 'Load liquidation address details failed: $error';
  }

  @override
  String get invalidExternalAccountAddress =>
      'The address for this external account is invalid';

  @override
  String get customerIdCheck => 'Customer ID check';

  @override
  String get customerIdNotFound => 'Customer ID not found. Please try again.';

  @override
  String get enterPin => 'Enter PIN';

  @override
  String get enterFourDigitPin =>
      'Enter your 4-digit PIN to create liquidation address';

  @override
  String get liquidationAddressPayload => 'Liquidation Address Payload';

  @override
  String get failedToCreateLiquidationAddress =>
      'Failed to create liquidation address';

  @override
  String get liquidationCreationFailed => 'Liquidation creation failed';

  @override
  String networkErrorWithMessage(Object error) {
    return 'Network error: $error';
  }

  @override
  String createLiquidationAddressFailedWithMessage(Object error) {
    return 'Create liquidation address failed: $error';
  }

  @override
  String get completeRequiredFields => 'Please complete all required fields:';

  @override
  String get noRecentTransactions => 'No recent transactions yet';

  @override
  String wrongPinEnteredWithCooldown(int seconds) {
    return 'Wrong PIN entered. Try again in $seconds seconds.';
  }

  @override
  String get pinsDoNotMatch => 'PINs do not match';

  @override
  String get reEnter4DigitPin => 'Re-enter your 4-digit PIN';

  @override
  String get enterPinToUnlock => 'Enter your PIN to unlock';

  @override
  String get enterCurrentPinToChange => 'Enter current PIN to change';

  @override
  String get dialerConnecting => 'Connecting...';

  @override
  String get dialerReconnecting => 'Reconnecting...';

  @override
  String get dialerReconnectingMessage =>
      'Please wait while we restore the connection';

  @override
  String get dialerRinging => 'Ringing...';

  @override
  String get dialerCalling => 'Calling...';

  @override
  String get dialerVideoCalling => 'Video calling...';

  @override
  String get dialerIncomingVoiceCall => 'Incoming voice call...';

  @override
  String get dialerIncomingVideoCall => 'Incoming video call...';

  @override
  String get dialerIncomingCall => 'Incoming Call';

  @override
  String get dialerMuted => 'Muted';

  @override
  String get dialerUnknown => 'Unknown';

  @override
  String get networkQualityExcellent => 'Excellent';

  @override
  String get networkQualityGood => 'Good';

  @override
  String get networkQualityFair => 'Fair';

  @override
  String get networkQualityPoor => 'Poor';

  @override
  String get networkQualityDisconnected => 'Disconnected';

  @override
  String get videoQuality => 'Video Quality';

  @override
  String get uploadSpeedLabel => 'Up';

  @override
  String get downloadSpeedLabel => 'Down';

  @override
  String get outgoingCalls => 'Outgoing Calls';

  @override
  String get outgoing => 'Outgoing';

  @override
  String durationMinutes(int minutes) {
    return '$minutes min';
  }

  @override
  String get subscriptionActivating =>
      'Your subscription is being activated. This may take a few moments.';

  @override
  String get subscriptionPaymentPending =>
      'Payment pending. Please complete your payment to activate subscription.';

  @override
  String get subscriptionPaymentFailed =>
      'Payment failed. Please update your payment method.';

  @override
  String get completeYourProfile => 'Complete Your Profile';

  @override
  String get provideDetailsToContinu =>
      'Please provide your details to continue';

  @override
  String get enterValidEmail => 'Enter a valid email';

  @override
  String get enterYourName => 'Enter your name';

  @override
  String get nameIsRequired => 'Name is required';

  @override
  String get phoneOptional => 'Phone (Optional)';

  @override
  String get phone => 'Phone';

  @override
  String get enterPhoneNumber => 'Enter phone number';

  @override
  String get continueBtn => 'Continue';

  @override
  String get noPricingPlansAvailable => 'No pricing plans available';

  @override
  String get failedToLoadPricingPlans => 'Failed to load pricing plans';

  @override
  String unlockFeature(String feature) {
    return 'Unlock $feature';
  }

  @override
  String subscribeToUnlock(String feature) {
    return 'Subscribe to unlock $feature and all other premium features.';
  }

  @override
  String get subscribeNow => 'Subscribe Now';

  @override
  String get cancelAnyTimeRecurringBilling =>
      'Cancel anytime. Recurring billing.';

  @override
  String get actions => 'Actions';

  @override
  String get cancelSubscription => 'Cancel Subscription';

  @override
  String get cancelSubscriptionSubtitle =>
      'You will retain access until your billing period ends';

  @override
  String get reactivateSubscription => 'Reactivate Subscription';

  @override
  String get reactivateSubscriptionSubtitle =>
      'Cancel the scheduled cancellation and keep your subscription';

  @override
  String get subscribeToPremium => 'Subscribe to Premium';

  @override
  String get unlockPremiumFeatures => 'Unlock all premium features';

  @override
  String get noActiveSubscriptionToCancel =>
      'No active subscription found to cancel';

  @override
  String get subscriptionCancelledAtPeriodEnd =>
      'Your subscription will be cancelled at the end of your billing period.';

  @override
  String get subscriptionCancelled => 'Your subscription has been cancelled.';

  @override
  String get failedToCancelSubscription => 'Failed to cancel subscription';

  @override
  String get noSubscriptionToReactivate =>
      'No subscription found to reactivate';

  @override
  String get subscriptionReactivated =>
      'Your subscription has been reactivated!';

  @override
  String get failedToReactivateSubscription =>
      'Failed to reactivate subscription';

  @override
  String get cancelSubscriptionQuestion => 'Cancel Subscription?';

  @override
  String subscriptionWillEndOn(String date) {
    return 'Your subscription will end on $date. You will have access to premium features until then. After that, you will lose access to premium features.';
  }

  @override
  String get keepSubscription => 'Keep Subscription';

  @override
  String get subscriptionWillContinue =>
      'Your subscription will continue as normal. No additional charges until your next billing cycle.';

  @override
  String get keepCancelled => 'Keep Cancelled';

  @override
  String get reactivate => 'Reactivate';

  @override
  String get premiumPlan => 'Premium Plan';

  @override
  String get cancelledOn => 'Cancelled On';

  @override
  String get accessEndsOn => 'Access Ends On';

  @override
  String get nextBillingDate => 'Next Billing Date';

  @override
  String get subscriptionStatusCancelling => 'Cancelling';

  @override
  String get subscriptionStatusActive => 'Active';

  @override
  String get subscriptionStatusTrial => 'Trial';

  @override
  String get subscriptionStatusCancelled => 'Cancelled';

  @override
  String get subscriptionStatusExpired => 'Expired';

  @override
  String get subscriptionStatusPaymentPending => 'Payment Pending';

  @override
  String get subscriptionStatusPaymentOverdue => 'Payment Overdue';

  @override
  String get subscriptionStatusNone => 'No Subscription';

  @override
  String subscriptionDescCancelling(int days) {
    return 'Your subscription is scheduled for cancellation. You still have access for $days more days. You can reactivate anytime before it ends.';
  }

  @override
  String get subscriptionDescActive =>
      'You have full access to all premium features. Enjoy your subscription!';

  @override
  String get subscriptionDescTrial =>
      'You are currently on a free trial. Subscribe to premium to unlock all features.';

  @override
  String get subscriptionDescCancelled =>
      'You cancelled your subscription. Your previous subscription has ended. Subscribe again to regain access to premium features.';

  @override
  String get subscriptionDescExpired =>
      'Your subscription has expired due to a payment issue. Please subscribe again with an updated payment method to continue enjoying premium features.';

  @override
  String get subscriptionDescIncomplete =>
      'Your payment is being processed. Please wait for confirmation, or try subscribing again.';

  @override
  String get subscriptionDescPastDue =>
      'Your payment is overdue. Please update your payment method immediately to avoid losing access to premium features.';

  @override
  String get subscriptionDescDefault =>
      'Subscribe to unlock premium features and get the most out of your experience.';

  @override
  String get failedToInitiateRegistration => 'Failed to initiate registration';

  @override
  String get paymentFailed => 'Payment failed';

  @override
  String get supportPageTitle => 'Submit Support Ticket';

  @override
  String get supportPageSubtitle => 'Tell us about the issue you are facing.';

  @override
  String get supportSubjectLabel => 'Subject';

  @override
  String get supportDescriptionLabel => 'Description';

  @override
  String get supportSubjectHint =>
      'Enter subject (e.g., Login issues, Payment problem, etc.)';

  @override
  String get supportDescriptionHint => 'Enter description here...';

  @override
  String get logInToYourAccount => 'Log in to your\naccount';

  @override
  String supportCharacterCount(int count) {
    return '$count characters';
  }

  @override
  String get supportSubjectRequired => 'Please enter a subject';

  @override
  String get supportDescriptionRequired => 'Please enter a description';

  @override
  String get supportSubmitButton => 'Submit Ticket';

  @override
  String get supportSuccessTitle => 'Success';

  @override
  String get supportSuccessMessage => 'Support request submitted successfully';

  @override
  String get supportErrorTitle => 'Error';

  @override
  String get supportErrorMessage =>
      'Failed to submit ticket. Please try again.';

  @override
  String get missedCalls => 'Missed Calls';

  @override
  String get selectAtLeastOneMember =>
      'Select at least one member to create a group';

  @override
  String get chatSupportComingSoon => 'Chat support will be available soon';

  @override
  String get selectStartDate => 'Select start date';

  @override
  String get selectEndDate => 'Select end date';

  @override
  String get recentContacts => 'Recent Contacts';

  @override
  String get sortZA => 'Sort Z–A';

  @override
  String get sortAZ => 'Sort A–Z';

  @override
  String get selectYourCardType => 'Select your card type';

  @override
  String get selectCards => 'Select Cards';

  @override
  String get confirmCardSelection => 'Confirm Card Selection';

  @override
  String get reviewYourSelection => 'Review your selection';

  @override
  String get mastercard => 'Mastercard';

  @override
  String get mastercardDescription =>
      'A global payment network accepted worldwide, offering secure, fast transactions with broad merchant coverage.';

  @override
  String get visa => 'Visa';

  @override
  String get visaDescription =>
      'A worldwide digital payments network that enables quick, reliable, and secure card payments almost everywhere.';

  @override
  String get selectVisaType => 'Select Visa type';

  @override
  String get selectMastercardType => 'Select Mastercard\ntype';

  @override
  String get selectCardTypeForNewCard => 'Select card type for your new card';

  @override
  String get noCardTypesAvailable => 'No card types available';

  @override
  String get allCardTypesAlreadyCreated =>
      'You have already created all available cards of this type';

  @override
  String get errorCheckingKycStatus => 'Error checking KYC status';

  @override
  String get financePayCryptoAccountRequired => 'PayCrypto account is required';

  @override
  String get pleaseEnter6DigitCode => 'Please enter the 6-digit code';

  @override
  String get cameraAccessDenied =>
      'Camera access denied. Please enable camera permission in settings.';

  @override
  String get pinChangedSuccessfully => 'PIN Changed Successfully!';

  @override
  String get notAValidQrCode => 'Not a valid QR code';

  @override
  String get errorScanningImage => 'Error scanning image';

  @override
  String get cardSetAsDefault => 'This card is now your default card';

  @override
  String get failedToSetDefaultCard => 'Failed to set default card.';

  @override
  String get allContacts => 'All Contacts';

  @override
  String get outgoingCall => 'Outgoing Call';

  @override
  String get makeDefaultCard => 'Make Default Card';

  @override
  String get enterPinToViewBalance => 'Enter your PIN to view balance';

  @override
  String get verifyPin => 'Verify PIN';

  @override
  String get unlockPremiumAccess => 'Unlock Premium Access';

  @override
  String get subscribeToAccessAllFeatures =>
      'Subscribe now to access all features without limits.';

  @override
  String get monthly => 'Monthly';

  @override
  String get supportDescriptionTooShort => 'Description is too short';

  @override
  String get supportDescriptionMinLength =>
      'Description should be at least 20 characters';

  @override
  String get paymentsSecurelyProcessedBy => 'Payments securely processed by';

  @override
  String get sessionExpired => 'Session Expired';

  @override
  String get sessionExpiredMessage =>
      'Your session has expired or is no longer valid. You will be logged out for security.';

  @override
  String get activeCards => 'Active Cards';

  @override
  String get inactiveCards => 'Inactive Cards';

  @override
  String get freezeCards => 'Freeze Cards';

  @override
  String depositInstructionSendOnly(Object currency, Object chain) {
    return 'Send only $currency on $chain to this address';
  }

  @override
  String get depositInstructionProcessingTime =>
      'Processing time: 2–15 minutes depending on blockchain';

  @override
  String get depositInstructionMinimum =>
      'Minimum deposit: \$10 USD equivalent';

  @override
  String get depositInstructionAutoLoad =>
      '• Your card will be loaded automatically';

  @override
  String get depositInstructionPushNotification =>
      'You\'ll receive a push notification when complete';

  @override
  String get shareQr => 'Share QR';

  @override
  String get copyQr => 'Copy QR';

  @override
  String get importantInformation => 'Important Information';

  @override
  String get errorLoadingAddress => 'Error Loading Address';

  @override
  String get deposit => 'Deposit';

  @override
  String get copiedTitle => 'Copied!';

  @override
  String get addressCopiedMessage => 'Address copied to clipboard';

  @override
  String get selectBlockchain => 'Select Blockchain';

  @override
  String get noChainsAvailableTitle => 'No Chains Available';

  @override
  String get noChainsAvailableMessage =>
      'No supported chains found for your account';

  @override
  String get processing => 'Processing...';

  @override
  String get noCardInformationAvailable => 'No card information available';

  @override
  String get cardDetailsTitle => 'Card details';

  @override
  String get seeYourCardInfo => 'See your card information';

  @override
  String get securityTipDoNotSharePin =>
      'Do not share your PIN or card details.';

  @override
  String get securityTipShopSecureSites => 'Only shop on secure sites (https).';

  @override
  String get securityTipEnableAlerts =>
      'Enable alerts and blocking from the app.';

  @override
  String get securityTipCheckTransactions =>
      'Check your transactions regularly.';

  @override
  String get onlyAdminsCanEditGroup =>
      'Only admins can edit group name and icon';

  @override
  String get profileUpdatedSuccessfully => 'Profile updated successfully';

  @override
  String get groupEditPermissionDenied =>
      'You don\'t have permission to edit this group. Only admins can edit group details.';

  @override
  String get insufficientGroupPermissions =>
      'Insufficient permissions. Only admins can edit group details.';

  @override
  String get failedToUpdateProfile => 'Failed to update profile';

  @override
  String get unableToDetermineEmail =>
      'Unable to determine your email. Please try again.';

  @override
  String get transferInitiated => 'Transfer Initiated';

  @override
  String get transferInitiatedSuccess =>
      'Your transfer has been initiated successfully!';

  @override
  String get invitationSent => 'Invitation Sent';

  @override
  String get invitationSentTo => 'Invitation sent to';

  @override
  String get inviteFailed => 'Invite Failed';

  @override
  String get failedToSendInvitation => 'Failed to send invitation';

  @override
  String get inviteToBMP => 'Invite to BMP';

  @override
  String inviteDescription(Object email) {
    return 'Send an invitation to $email to join BMP and receive USDC payments';
  }

  @override
  String get sendInvite => 'Send Invite';

  @override
  String get sendMoney => 'Send Money';

  @override
  String get transferUsdcViaEmail => 'Transfer USDC via email address';

  @override
  String get from => 'From';

  @override
  String get recipientEmail => 'Recipient Email';

  @override
  String get enterRecipientEmail => 'Please enter recipient email';

  @override
  String get validRecipientEmail => 'Please enter a valid email address';

  @override
  String get cannotSendToYourself => 'Cannot send money to yourself';

  @override
  String get enterAmount => 'Please enter amount';

  @override
  String get validAmount => 'Please enter a valid amount greater than 0';

  @override
  String get insufficientBalance =>
      'You don\'t have enough balance. Please recharge your wallet.';

  @override
  String get recipientNotOnBMP => 'The recipient isn\'t on BMP yet.';

  @override
  String get recipientNeedsWallet =>
      'The recipient needs to set up their wallet.';

  @override
  String incorrectPinAttempts(Object attempts) {
    return 'Incorrect PIN. $attempts attempts remaining.';
  }

  @override
  String get tooManyAttempts =>
      'Too many attempts. Please try again after 1 hour.';

  @override
  String get accountBlocked =>
      'Your account is blocked. Please contact support.';

  @override
  String get createWalletToProceed =>
      'Create a wallet to proceed with payments';

  @override
  String get selectSourceWallet => 'Please select a source wallet.';

  @override
  String get selectDestinationWallet => 'Please select a destination wallet.';

  @override
  String get shareFailed => 'Share Failed';

  @override
  String get failedToOpenShareDialog => 'Failed to open share dialog';

  @override
  String get reviewAndConfirmTransfer => 'Review & confirm your transfer';

  @override
  String get transferSummary => 'Transfer Summary';

  @override
  String get destinationWallet => 'Destination Wallet';

  @override
  String get paymentProcessed =>
      'Payment processed successfully. You\'ll receive a confirmation email shortly.';

  @override
  String get phoneNumberAlreadyInUse =>
      'Phone number already exists. Please use a different phone number.';

  @override
  String get phoneNumberNotFound =>
      'Phone number not found. Please check your phone number or sign up first.';

  @override
  String get linkEmailTitle => 'Link Email';

  @override
  String get linkEmailSubtitle =>
      'Please enter an email address to link to your account for better security.';

  @override
  String get emailHint => 'Email';

  @override
  String get enterOtpEmail => 'Enter OTP sent to email';

  @override
  String get enterOtpSms => 'Enter OTP sent via SMS';
}
