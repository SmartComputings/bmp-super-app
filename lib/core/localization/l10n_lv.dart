// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Latvian (`lv`).
class L10nLv extends L10n {
  L10nLv([String locale = 'lv']) : super(locale);

  @override
  String get alwaysUse24HourFormat => 'nē';

  @override
  String get repeatPassword => 'Atkārtot paroli';

  @override
  String get notAnImage => 'Nav attēla datne.';

  @override
  String get setCustomPermissionLevel => 'Iestatīt pielāgotu atļauju līmeni';

  @override
  String get setPermissionsLevelDescription =>
      'Lūgums zemāk atlasīt iepriekšizveidotu lomu vai ievadīt pielāgotu atļauju līmeni starp 0 un 100.';

  @override
  String get ignoreUser => 'Neņemt vērā lietotāju';

  @override
  String get normalUser => 'Parasts lietotājs';

  @override
  String get remove => 'Noņemt';

  @override
  String get importNow => 'Ievietot tagad';

  @override
  String get importEmojis => 'Ievietot emocijzīmes';

  @override
  String get importFromZipFile => 'Ievietot no .zip datnes';

  @override
  String get exportEmotePack => 'Izgūt emociju paku kā .zip';

  @override
  String get replace => 'Aizstāt';

  @override
  String get about => 'Par';

  @override
  String aboutHomeserver(String homeserver) {
    return 'Par $homeserver';
  }

  @override
  String get accept => 'Pieņemt';

  @override
  String acceptedTheInvitation(String username) {
    return '👍 $username pieņēma uzaicinājumu';
  }

  @override
  String get account => 'Konts';

  @override
  String activatedEndToEndEncryption(String username) {
    return '🔐 $username iespējoja pilnīgu šifrēšanu';
  }

  @override
  String get addEmail => 'Pievienot e-pasta adresi';

  @override
  String get confirmMatrixId =>
      'Lūgums apliecināt savu user Id, lai varētu izdzēst savu kontu.';

  @override
  String supposedMxid(String mxid) {
    return 'Tam būtu jābūt $mxid';
  }

  @override
  String get addChatDescription => 'Pievienot tērzēšanas aprakstu…';

  @override
  String get addToSpace => 'Pievienot vietai';

  @override
  String get admin => 'Pārvaldītājs';

  @override
  String get alias => 'aizstājvārds';

  @override
  String get all => 'Viss';

  @override
  String get allChats => 'Visas tērzēšanas';

  @override
  String get commandHint_roomupgrade =>
      'Uzlabot šo istabu uz norādīto istabas versiju';

  @override
  String get commandHint_googly => 'Nosūtīt izbolītu acu pāri';

  @override
  String get commandHint_cuddle => 'Nosūtīt samīļojienu';

  @override
  String get commandHint_hug => 'Nosūtīt apskāvienu';

  @override
  String googlyEyesContent(String senderName) {
    return '$senderName sūta izbolītas acis';
  }

  @override
  String cuddleContent(String senderName) {
    return '$senderName samīļo Tevi';
  }

  @override
  String hugContent(String senderName) {
    return '$senderName apskauj Tevi';
  }

  @override
  String answeredTheCall(String senderName) {
    return '$senderName atbildēja uz zvanu';
  }

  @override
  String get anyoneCanJoin => 'Ikviens var pievienoties';

  @override
  String get appLock => 'Lietotnes aizslēgšana';

  @override
  String get appLockDescription =>
      'Aizslēgt lietotni, kad tā netiek izmantota, ar PIN kodu';

  @override
  String get archive => 'Arhīvs';

  @override
  String get unArchive => 'Unarchive';

  @override
  String get areGuestsAllowedToJoin =>
      'Vai vieslietotājiem ir ļauts pievienoties';

  @override
  String get areYouSure => 'Vai tiešām?';

  @override
  String get areYouSureYouWantToLogout => 'Vai tiešām atteikties?';

  @override
  String get askSSSSSign =>
      'Lai varētu parakstīt otru cilvēku, lūgums ievadīt savu drošo krātuves paroles vārdkopu vai atkopes atslēgu.';

  @override
  String askVerificationRequest(String username) {
    return 'Pieņemt apliecināšanas pieprasījumu no $username?';
  }

  @override
  String get autoplayImages =>
      'Automātiski atskaņot animētas uzlīmes un emocijas';

  @override
  String badServerLoginTypesException(String serverVersions,
      String supportedVersions, Object suportedVersions) {
    return 'Mājasserveris nodrošina pieteikšanās veidus:\n$serverVersions\nSavukārt, šī lietotne atbalsta tikai:\n$supportedVersions';
  }

  @override
  String get sendTypingNotifications => 'Nosūtīt rakstīšanas paziņojumus';

  @override
  String get swipeRightToLeftToReply =>
      'Pavilkt no labās puses uz kreiso, lai atbildētu';

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
  String get sendOnEnter => 'Nosūtīt ar Enter';

  @override
  String badServerVersionsException(
      String serverVersions,
      String supportedVersions,
      Object serverVerions,
      Object supoortedVersions,
      Object suportedVersions) {
    return 'Mājasserveris nodrošina specifikācijas versijas:\n$serverVersions\nSavukārt, lietotne atbalsta tikai $supportedVersions';
  }

  @override
  String countChatsAndCountParticipants(int chats, int participants) {
    return '$chats tērzēšanas un $participants dalībnieki';
  }

  @override
  String countMembers(int count) {
    return '$count Members';
  }

  @override
  String get noMoreChatsFound => 'Vairs netika atrasta neviena tērzēšana...';

  @override
  String get noChatsFoundHere =>
      'Šeit vēl nav tērzēšanu. Jauna saruna ar kādu ir uzsākama ar zemāk esošo pogu. ⤵️';

  @override
  String get joinedChats => 'Tērzēšanas, kurās piedalos';

  @override
  String get unread => 'Nelasītas';

  @override
  String get space => 'Vieta';

  @override
  String get spaces => 'Vietas';

  @override
  String get banFromChat => 'Izslēgt no tērzēšanas';

  @override
  String get banned => 'Izslēgts';

  @override
  String bannedUser(String username, String targetName) {
    return '$username izslēdza $targetName';
  }

  @override
  String get blockDevice => 'Liegt ierīci';

  @override
  String get blocked => 'Liegta';

  @override
  String get botMessages => 'Robotprogrammatūras ziņām';

  @override
  String get cancel => 'Atcelt';

  @override
  String cantOpenUri(String uri) {
    return 'Nevar atvērt adresi $uri';
  }

  @override
  String get changeDeviceName => 'Mainīt ierīces nosaukumu';

  @override
  String changedTheChatAvatar(String username) {
    return '$username nomainīja tērzēšanas attēlu';
  }

  @override
  String changedTheChatDescriptionTo(String username, String description) {
    return '$username nomainīja tērzēšanas aprakstu uz \'$description\'';
  }

  @override
  String changedTheChatNameTo(String username, String chatname) {
    return '$username nomainīja tērzēšanas nosaukumu uz \'$chatname\'';
  }

  @override
  String changedTheChatPermissions(String username) {
    return '$username nomainīja tērzēšanas atļaujas';
  }

  @override
  String changedTheDisplaynameTo(String username, String displayname) {
    return '$username nomainīja savu attēlojamo vārdu uz \'$displayname\'';
  }

  @override
  String changedTheGuestAccessRules(String username) {
    return '$username nomainīja viesu piekļuves nosacījumus';
  }

  @override
  String changedTheGuestAccessRulesTo(String username, String rules) {
    return '$username nomainīja viesu piekļuves nosacījumus uz $rules';
  }

  @override
  String changedTheHistoryVisibility(String username) {
    return '$username mainīja vēstures redzamību';
  }

  @override
  String changedTheHistoryVisibilityTo(String username, String rules) {
    return '$username nomainīja vēstures redzamību uz $rules';
  }

  @override
  String changedTheJoinRules(String username) {
    return '$username nomainīja pievienošanās nosacījumus';
  }

  @override
  String changedTheJoinRulesTo(String username, String joinRules) {
    return '$username nomainīja pievienošanās nosacījumus uz $joinRules';
  }

  @override
  String changedTheProfileAvatar(String username) {
    return '$username nomainīja savu attēlu';
  }

  @override
  String changedTheRoomAliases(String username) {
    return '$username nomainīja istabas aizstājvārdus';
  }

  @override
  String changedTheRoomInvitationLink(String username) {
    return '$username nomainīja uzaicinājuma saiti';
  }

  @override
  String get changePassword => 'Nomainīt paroli';

  @override
  String get changeTheHomeserver => 'Mainīt mājasserveri';

  @override
  String get changeTheme => 'Mainīt izskatu';

  @override
  String get changeTheNameOfTheGroup => 'Mainīt kopas nosaukumu';

  @override
  String get changeYourAvatar => 'Mainīt savu attēlu';

  @override
  String get channelCorruptedDecryptError => 'Šifrēšana tika bojāta';

  @override
  String get chat => 'Tērzēšana';

  @override
  String get yourChatBackupHasBeenSetUp =>
      'Tērzēšanu rezerves kopēšana tika iestatīta.';

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
  String get chatDescription => 'Tērzēšanas apraksts';

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
  String get tryAgain => 'Jāmēģina vēlreiz';

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
  String get search => 'Meklēt';

  @override
  String get select => 'Atlasīt';

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
  String get logout => 'Atteikties';

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
  String get group => 'Kopa';

  @override
  String get calls => 'Zvani';

  @override
  String get done => 'Done!';

  @override
  String get taskCompletedSuccessfully => 'Task is completed\nsuccessfully';

  @override
  String get goBack => 'Go Back';

  @override
  String get signupSuccessMessage => 'You\'ve signed up \nsuccessfully';

  @override
  String get chatBackup => 'Tērzēšanu rezerves kopēšana';

  @override
  String get chatBackupDescription =>
      'Iepriekšējās ziņas ir aizsargātas ar atkopes atslēgu. Lūgums nodrošināt, ka tā netiek pazaudēta.';

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
  String get chatDetails => 'Tērzēšanas izvērsums';

  @override
  String get chatHasBeenAddedToThisSpace =>
      'Šai vietai tika pievienota tērzēšana';

  @override
  String get chats => 'Tērzēšanas';

  @override
  String get chooseAStrongPassword => 'Jāizvēlas droša parole';

  @override
  String get clearArchive => 'Iztīrīt arhīvu';

  @override
  String get close => 'Aizvērt';

  @override
  String get commandHint_markasdm =>
      'Atzīmēt kā tiešo ziņu istabu norādītajam Matrix Id';

  @override
  String get commandHint_markasgroup => 'Atzīmēt kā kopu';

  @override
  String get commandHint_ban => 'Izslēgt norādīto lietotāju no šīs istabas';

  @override
  String get commandHint_clearcache => 'Iztīrīt kešatmiņu';

  @override
  String get commandHint_create =>
      'Izveidot tukšu kopas tērzēšanu\nLai atspējotu šifrēšanu, jāizmanto --no-encryption';

  @override
  String get commandHint_discardsession => 'Atmest sesiju';

  @override
  String get commandHint_dm =>
      'Uzsākt tiešu tērzēšanu\nLai atspējotu šifrēšanu, jāizmanto --no-encryption';

  @override
  String get commandHint_html => 'Nosūtīt ar HTML formatētu tekstu';

  @override
  String get commandHint_invite => 'Uzaicināt norādīto lietotāju šajā istabā';

  @override
  String get commandHint_join => 'Pievienoties norādītajai istabai';

  @override
  String get commandHint_kick => 'Noņemt norādīto lietotāju no šīs istabas';

  @override
  String get commandHint_leave => 'Pamest šo istabu';

  @override
  String get commandHint_me => 'Apraksti sevi';

  @override
  String get commandHint_myroomavatar =>
      'Iestatīt savu attēlu šajā istabā (ar mxc-uri)';

  @override
  String get commandHint_myroomnick =>
      'Iestatīt savu attēlojamo vārdu šajā istabā';

  @override
  String get commandHint_op =>
      'Iestatīt norādītā lietotāja pilnvaru līmeni (noklusējums: 50)';

  @override
  String get commandHint_plain => 'Nosūtīt neformatētu tekstu';

  @override
  String get commandHint_react => 'Nosūtīt atbildi kā reakciju';

  @override
  String get commandHint_send => 'Nosūtīt tekstu';

  @override
  String get commandHint_unban =>
      'Atcelt norādītā lietotāja izslēgšanu no šīs istabas';

  @override
  String get commandInvalid => 'Nederīga komanda';

  @override
  String commandMissing(String command) {
    return '$command nav komanda.';
  }

  @override
  String get compareEmojiMatch => 'Lūgums salīdzināt emocijzīmes';

  @override
  String get compareNumbersMatch => 'Lūgums salīdzināt skaitļus';

  @override
  String get configureChat => 'Konfigurēt tērzēšanu';

  @override
  String get confirm => 'Apstiprināt';

  @override
  String get connect => 'Savienot';

  @override
  String get contactHasBeenInvitedToTheGroup =>
      'Kontaktpersona tika uzaicināta kopā';

  @override
  String get containsDisplayName => 'Satur attēlojamo vārdu';

  @override
  String get containsUserName => 'Satur lietotājvārdu';

  @override
  String get contentHasBeenReported =>
      'Par saturu tika ziņos servera pārvaldītājiem';

  @override
  String get copiedToClipboard => 'Ievietots starpliktuvē';

  @override
  String get copy => 'Ievietot starpliktuvē';

  @override
  String get copyToClipboard => 'Ievietot starpliktuvē';

  @override
  String couldNotDecryptMessage(String error) {
    return 'Nevarēja atšifrēt ziņu: $error';
  }

  @override
  String get checkList => 'Pārbaužu saraksts';

  @override
  String countParticipants(int count) {
    return '$count dalībnieki';
  }

  @override
  String countInvited(int count) {
    return '$count uzaicināti';
  }

  @override
  String get create => 'Izveidot';

  @override
  String createdTheChat(String username) {
    return '💬 $username izveidoja tērzēšanu';
  }

  @override
  String get createGroup => 'Izveidot kopu';

  @override
  String get createNewSpace => 'Jauna vieta';

  @override
  String get currentlyActive => 'Pašreiz darbīgi';

  @override
  String get darkTheme => 'Tumšs';

  @override
  String dateAndTimeOfDay(String date, String timeOfDay) {
    return '$date, $timeOfDay';
  }

  @override
  String dateWithoutYear(String month, String day) {
    return '$day.$month.';
  }

  @override
  String dateWithYear(String year, String month, String day) {
    return '$year.$month.$day';
  }

  @override
  String get deactivateAccountWarning =>
      'Tas atspējos Tavu lietotāja kontu. To nevar atdarīt. Vai tiešām?';

  @override
  String get defaultPermissionLevel =>
      'Noklusējuma atļauju līmenis jauniem lietotājiem';

  @override
  String get delete => 'Izdzēst';

  @override
  String get deleteAccount => 'Izdzēst kontu';

  @override
  String get deleteMessage => 'Izdzēst ziņu';

  @override
  String get device => 'Ierīce';

  @override
  String get deviceId => 'Ierīces Id';

  @override
  String get devices => 'Ierīces';

  @override
  String get directChats => 'Tiešās tērzēšanas';

  @override
  String get allRooms => 'Visām kopu tērzēšanām';

  @override
  String get displaynameHasBeenChanged => 'Attēlojamais vārds tika nomainīts';

  @override
  String get download => 'Download';

  @override
  String get downloadFile => 'Lejupielādēt datni';

  @override
  String get edit => 'Labot';

  @override
  String get editBlockedServers => 'Labot liegtos serverus';

  @override
  String get chatPermissions => 'Tērzēšanas atļaujas';

  @override
  String get editDisplayname => 'Labot attēlojamo vārdu';

  @override
  String get editRoomAliases => 'Labot istabu aizstājvārdus';

  @override
  String get editRoomAvatar => 'Labot istabas attēlu';

  @override
  String get emoteExists => 'Emocija jau pastāv.';

  @override
  String get emoteInvalid => 'Nederīgs emocijas īskods.';

  @override
  String get emoteKeyboardNoRecents =>
      'Nesen izmantotās emocijas parādīsies šeit...';

  @override
  String get emotePacks => 'Emociju pakas istabai';

  @override
  String get emoteSettings => 'Emociju iestatījumi';

  @override
  String get globalChatId => 'Vispārējais tērzēšanas Id';

  @override
  String get accessAndVisibility => 'Piekļuve un redzamība';

  @override
  String get accessAndVisibilityDescription =>
      'Kam ir ļauts pievienoties šai tērzēšanai un kā tērzēšana var tikt atklāta.';

  @override
  String get customEmojisAndStickers => 'Pielāgotas emocijzīmes un uzlīmes';

  @override
  String get customEmojisAndStickersBody =>
      'Pievienot vai kopīgot pielāgotas emocijzīmes vai uzlīmes, kas var tikt izmantotas jebkurā tērzēšanā.';

  @override
  String get emoteShortcode => 'Emocijas īskods';

  @override
  String get emoteWarnNeedToPick =>
      'Nepieciešams izvēlēties emocijas īskodu un attēlu.';

  @override
  String get emptyChat => 'Tukša tērzēšana';

  @override
  String get enableEmotesGlobally => 'Iespējot kā vispārēju emociju paku';

  @override
  String get enableEncryption => 'Iespējot šifrēšanu';

  @override
  String get enableEncryptionWarning =>
      'Vairs nebūs iespējams atspējot šifrēšanu. Vai tiešām to darīt?';

  @override
  String get encrypted => 'Šifrēta';

  @override
  String get encryption => 'Šifrēšana';

  @override
  String get encryptionNotEnabled => 'Šifrēšana nav iespējota';

  @override
  String endedTheCall(String senderName) {
    return '$senderName beidza zvanu';
  }

  @override
  String get enterAnEmailAddress => 'Jāievada e-pasta adrese';

  @override
  String get homeserver => 'Mājasserveris';

  @override
  String get enterYourHomeserver => 'Jāievada mājasserveris';

  @override
  String errorObtainingLocation(String error) {
    return 'Kļūda atrašanās vietas iegūšanā: $error';
  }

  @override
  String get everythingReady => 'Viss ir gatavs!';

  @override
  String get extremeOffensive => 'Īpaši aizskarošs';

  @override
  String get fileName => 'Datnes nosaukums';

  @override
  String get fluffychat => 'FluffyChat';

  @override
  String get fontSize => 'Fonta izmērs';

  @override
  String get forward => 'Pārsūtīt';

  @override
  String get fromJoining => 'No pievienošanās';

  @override
  String get fromTheInvitation => 'No uzaicinājuma';

  @override
  String get goToTheNewRoom => 'Doties uz jauno istabu';

  @override
  String get chatDescriptionHasBeenChanged =>
      'Tērzēšanas apraksts ir mainījies';

  @override
  String get groupIsPublic => 'Kopa ir publiska';

  @override
  String get groups => 'Kopas';

  @override
  String groupWith(String displayname) {
    return 'Kopa ar $displayname';
  }

  @override
  String get guestsAreForbidden => 'Viesi nav ļauti';

  @override
  String get guestsCanJoin => 'Viesi var pievienoties';

  @override
  String hasWithdrawnTheInvitationFor(String username, String targetName) {
    return '$username atsauca uzaicinājumu $targetName';
  }

  @override
  String get help => 'Palīdzība';

  @override
  String get hideRedactedEvents => 'Paslēpt labošanas notikumus';

  @override
  String get hideRedactedMessages => 'Paslēpt labošanas ziņas';

  @override
  String get hideRedactedMessagesBody =>
      'Ja kāds labo ziņu, tā vairs nebūs redzama tērzēšanā.';

  @override
  String get hideInvalidOrUnknownMessageFormats =>
      'Paslēpt nederīgus vai nezināmus ziņu formātus';

  @override
  String get howOffensiveIsThisContent => 'Cik aizskarošs ir šis saturs?';

  @override
  String get id => 'Id';

  @override
  String get identity => 'Identitāte';

  @override
  String get block => 'Izslēgt';

  @override
  String get blockedUsers => 'Atslēgtie lietotāji';

  @override
  String get blockListDescription =>
      'Ir iespējams atslēgt traucējošus lietotājus. Nebūs iespējams saņem jebkādas ziņas vai uzaicinājumus uz istabām no lietotājiem, kas ir personīgajā izslēgšanas sarakstā.';

  @override
  String get blockUsername => 'Neņemt vērā lietotājvārdu';

  @override
  String get iHaveClickedOnLink => 'Es uzklikšķināju uz saites';

  @override
  String get incorrectPassphraseOrKey =>
      'Nepareiza paroles vārdkopa vai atkopes atslēga';

  @override
  String get inoffensive => 'Nav aizskarošs';

  @override
  String get inviteContact => 'Uzaicināt kontaktpersonu';

  @override
  String inviteContactToGroupQuestion(Object contact, Object groupName) {
    return 'Vai vēlies uzaicināt $contact uz tērzēšanu \"$groupName\"?';
  }

  @override
  String inviteContactToGroup(String groupName) {
    return 'Uzaicināt kontaktpersonu $groupName';
  }

  @override
  String get noChatDescriptionYet => 'Tērzēšanas apraksts vēl nav izveidots.';

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
      'Šis paziņojums parādās, kad darbojas priekšplāna pakalpojums.';

  @override
  String get screenSharingTitle => 'ekrāna kopīgošana';

  @override
  String get screenSharingDetail => 'Tu kopīgo savu ekrānu FluffyChat';

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
    return 'Datnes';
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
  String get setCustomEmotes => 'Iestatīt pielāgotas emocijas';

  @override
  String get whoCanPerformWhichAction => 'Kurš var veikt kādas darbības';

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
  String get pleaseFillOut => 'Lūgums aizpildīt';

  @override
  String get newGroup => 'Jauna kopa';

  @override
  String get imageGroup => 'Image group';

  @override
  String get groupName => 'Kopas nosaukums';

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
  String get messages => 'Ziņas';

  @override
  String get decline => 'Atteikt';

  @override
  String youInvitedBy(String user) {
    return '📩 $user Tevi uzaicināja';
  }

  @override
  String get invalidServerName => 'Nederīgs servera nosaukums';

  @override
  String get archiveRoomDescription =>
      'Tērzēšana tiks pārvietota uz arhīvu. Citi lietotāji redzēs, ka pameti tērzēšanu.';

  @override
  String get hidePresences => 'Paslēpt stāvokļu sarakstu?';

  @override
  String get leaveEmptyToClearStatus =>
      'Atstāt tukšu, lai notīrītu savu stāvokli.';

  @override
  String get removeFromBundle => 'Noņemt no šī komplekta';

  @override
  String get encryptionSetupRequired =>
      'Encryption setup is required for secure messaging. Please complete the setup in Settings.';

  @override
  String get warning => 'Uzmanību!';

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
  String get verifyOtherDevice => '🔐 Apliecināt otru ierīci';

  @override
  String get verifyOtherDeviceDescription =>
      'Kad apliecini citu ierīci, šīs ierīces var apmainīt atslēgas, palielinot vispārējo drošību. 💪 Pēc apliecināšanas uzsākšanas abās ierīcēs lietotnē parādīsies uznirstošais logs. Tajā būs redzamas dažādas emocijzīmes vai skaitļi, kas jāsalīdzina abās ierīcēs. Vislabāk, ja abas ierīces ir pieejamas, pirms tiek uzsākta apliecināšana. 🤳';

  @override
  String get removeDevicesDescription =>
      'Tu tiksi izrakstīts no šīs ierīces un vairs nevarēsi saņemt ziņas.';

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
  String get invited => 'Uzaicināts';

  @override
  String get redactMessageDescription =>
      'Ziņa tiks labota visiem šīs sarunas dalībniekiem. To nevar atdarīt.';

  @override
  String get optionalRedactReason => '(Pēc izvēles) Ziņas labošanas iemesls...';

  @override
  String invitedUser(String username, String targetName) {
    return '📩 $username uzaicināja $targetName';
  }

  @override
  String get invitedUsersOnly => 'Tikai uzaicināti lietotāji';

  @override
  String get inviteForMe => 'Uzaicinājumu man';

  @override
  String inviteText(String username, String link) {
    return '$username uzaicināja pievienoties .\n1. Jāizveido konts vai jāpiesakās \n2. Jāatver uzaicinājuma saite: \n $link';
  }

  @override
  String get gallery => 'Galerija';

  @override
  String get document => 'Document';

  @override
  String get location => 'Location';

  @override
  String get contact => 'Contact';

  @override
  String get send => 'Nosūtīt';

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
  String get recoveryKey => 'Atkopes atslēga';

  @override
  String get storeInAndroidKeystore => 'Glabāt Android KeyStore';

  @override
  String get storeInAppleKeyChain => 'Glabāt Apple KeyChain';

  @override
  String get storeSecurlyOnThisDevice => 'Droši uzglabāt šajā ierīcē';

  @override
  String get storeInSecureStorageDescription =>
      'Glabāt atkopes atslēgu šīs ierīces drošajā krātuvē.';

  @override
  String get saveKeyManuallyDescription =>
      'Šo atslēgu var pašrocīgi saglabāt ar sistēmas kopīgošanas dialogloga vai starpliktuves izsaukšanu.';

  @override
  String get pleaseEnterRecoveryKeyDescription =>
      'Lai atslēgtu savas vecās ziņas, lūgums ievadīt savu atkopes atslēgu, kas tika izveidota iepriekšējā sesijā. Atkopes atslēga NAV parole.';

  @override
  String get unlockOldMessages => 'Atslēgt vecās ziņas';

  @override
  String get wrongRecoveryKey =>
      'Atvaino... Nešķiet, ka šī būtu pareiza atkopes atslēga.';

  @override
  String get recoveryKeyLost => 'Pazaudēta atkopes atslēga?';

  @override
  String get wipeChatBackup =>
      'Notīrīt tērzēšanu rezerves kopiju, lai izveidotu jaunu atkopes atslēgu?';

  @override
  String get isTyping => 'raksta…';

  @override
  String joinedTheChat(String username) {
    return '👋 $username pievienojās tērzēšanai';
  }

  @override
  String get joinRoom => 'Pievienoties istabai';

  @override
  String kicked(String username, String targetName) {
    return '👞 $username izmeta $targetName';
  }

  @override
  String kickedAndBanned(String username, String targetName) {
    return '🙅 $username izmeta $targetName un liedza piekļuvi';
  }

  @override
  String get kickFromChat => 'Izmest no tērzēšanas';

  @override
  String lastActiveAgo(String localizedTimeShort) {
    return 'Pēdējoreiz tiešsaistē: $localizedTimeShort';
  }

  @override
  String get leave => 'Pamest';

  @override
  String get leftTheChat => 'Pameta tērzēšanu';

  @override
  String get license => 'Licence';

  @override
  String get lightTheme => 'Gaišs';

  @override
  String loadCountMoreParticipants(int count) {
    return 'Ielādēt vēl $count dalībniekus';
  }

  @override
  String get dehydrate => 'Izgūt sesiju un iztīrīt ierīci';

  @override
  String get dehydrateWarning =>
      'Šī darbība nav atdarāma. Jānodrošina, ka rezerves kopijas datne tiek droši uzglabāta.';

  @override
  String get dehydrateTor => 'TOR lietotāji: izgūt sesiju';

  @override
  String get dehydrateTorLong =>
      'TOR lietotājiem ir ieteicams izgūt sesiju pirms loga aizvēršanas.';

  @override
  String get hydrateTor => 'TOR lietotāji: ievietot sesijas izguvi';

  @override
  String get hydrateTorLong =>
      'Vai sesija pēdējoreiz tika izgūta TOR? Ātri ievieto to un turpini tērzēšanu!';

  @override
  String get hydrate => 'Atjaunot no rezerves kopijas datnes';

  @override
  String get loadingPleaseWait => 'Ielādē... Lūgums uzgaidīt.';

  @override
  String get loadMore => 'Ielādēt vēl…';

  @override
  String get locationDisabledNotice =>
      'Atrašanās vietas pakalpojumi ir atspējoti. Lūgums tos iespējot, lai būtu iespējams kopīgot savu atrašanās vietu.';

  @override
  String get locationPermissionDeniedNotice =>
      'Atrašanās vietas atļauja noliegta. Lūgums nodrošināt to, lai būtu iespējams kopīgot savu atrašanās vietu.';

  @override
  String get login => 'Pieteikties';

  @override
  String logInTo(String homeserver) {
    return 'PIeteikties $homeserver';
  }

  @override
  String get memberChanges => 'Dalībnieku izmaiņām';

  @override
  String get mention => 'Pieminēt';

  @override
  String get messagesStyle => 'Ziņas:';

  @override
  String get moderator => 'Moderators';

  @override
  String get muteChat => 'Apklusināt tērzēšanu';

  @override
  String get needPantalaimonWarning =>
      'Lūgums ņemt vērā, ka pagaidām ir nepieciešams Pantalaimon, lai izmantotu pilnīgu šifrēšanu.';

  @override
  String get newChat => 'Jauna tērzēšana';

  @override
  String get newMessageInFluffyChat => '💬 Jauna ziņa FluffyChat';

  @override
  String get newVerificationRequest => 'Jauns apliecināšanas pieprasījums.';

  @override
  String get next => 'Nākamais';

  @override
  String get no => 'Nē';

  @override
  String get noConnectionToTheServer => 'Nav savienojuma ar serveri';

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
  String get privacy => 'Privātums';

  @override
  String get notification => 'Notification';

  @override
  String get wallet => 'Wallet';

  @override
  String get allCalls => 'All Calls';

  @override
  String get unreadCalls => 'Unread Calls';

  @override
  String get setChatDescription => 'Iestatīt tērzēšanas aprakstu';

  @override
  String get replaceRoomWithNewerVersion =>
      'Aizvietot istabu ar jaunāku versiju';

  @override
  String get roomUpgradeDescription =>
      'Tērzēšana tad tiks atkārtoti izveidota ar jauno istabas versiju. Visiem dalībniekiem tiks paziņots, ka viņiem ir jāpārslēdzas uz jauno tērzēšanu. Vairāk par istabu versijām var atrast https://spec.matrix.org/latest/rooms/';

  @override
  String get usersMustKnock => 'Lietotājiem jāpieklauvē';

  @override
  String get noOneCanJoin => 'Neviens nevar pievienoties';

  @override
  String get restricted => 'Ierobežots';

  @override
  String get knockRestricted => 'Pieklauvēt ierobežotajiem';

  @override
  String get unknown => 'Unknown';

  @override
  String get openGallery => 'Atvērt galeriju';

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
  String get unsupportedAndroidVersion => 'Neatbalstīta Android versija';

  @override
  String get unsupportedAndroidVersionLong =>
      'Šai iespējai ir nepieciešama jaunāka Android versija. Lūgums pārbaudīt atjauninājumus vai Lineage OS atbalstu.';

  @override
  String get available => 'Available';

  @override
  String get typeMessage => 'Type message..';

  @override
  String get report => 'Ziņot';

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
  String get messageInfo => 'Informācija par ziņu';

  @override
  String get pinnMessage => 'Pin message';

  @override
  String get redactMessage => 'Labot ziņu';

  @override
  String get reportMessage => 'Ziņot par ziņu';

  @override
  String get jumpToLastReadMessage => 'Pārlēkt uz pēdējo izlasīto ziņu';

  @override
  String get jump => 'Pārlēkt';

  @override
  String get enterNewChat => 'Ieiet jaunajā tērzēšanā';

  @override
  String get reopenChat => 'Atkārtoti atvērt tērzēšanu';

  @override
  String get reply => 'Atbildēt';

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
      'Otra puse pašlaik nav pieteikusies un tādēļ nevar saņemt ziņas.';

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
  String get sendAsText => 'Nosūtīt kā tekstu';

  @override
  String get whyDoYouWantToReportThis => 'Kādēļ vēlies ziņot par šo?';

  @override
  String get reason => 'Iemesls';

  @override
  String get offensive => 'Aizskarošs';

  @override
  String get confirmEventUnpin =>
      'Vai tiešām neatgriezeniski atspraust šo notikumu?';

  @override
  String get noEmotesFound => 'Netika atrasta neviena emocija. 😕';

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
      'Šifrēšanu var iespējot tikai tad, kad istaba vairs nav publiski pieejama.';

  @override
  String get noGoogleServicesWarning =>
      'Izskatās, ka Firebase mākoņziņojumapmaiņa nav pieejama šajā ierīcē. Lai joprojām saņemtu pašpiegādes paziņojumus, mēs iesakām uzstādīt ntfy. Ar ntfy vai citu Vienotās pašpiegādes nodrošinātāju ir iespējams saņemt pašpiegādes paziņojumus drošā veidā. ntfy var lejupielādēt no PlayStore vai F-Droid.';

  @override
  String noMatrixServer(String server1, String server2) {
    return '$server1 nav Matrix serveris, tā vietā izmantot $server2?';
  }

  @override
  String get shareInviteLink => 'Kopīgot uzaicinājuma saiti';

  @override
  String get scanQrCode => 'Nolasīt kvadrātkodu';

  @override
  String get none => 'Neviens';

  @override
  String get noPasswordRecoveryDescription =>
      'Vēl nav pievienots paroles atjaunošanas veids.';

  @override
  String get noPermission => 'Nav atļaujas';

  @override
  String get noRoomsFound => 'Istabas netika atrastas…';

  @override
  String get notifications => 'Paziņojumi';

  @override
  String get notificationsEnabledForThisAccount =>
      'Paziņojumi iespējoti šim kontam';

  @override
  String numUsersTyping(int count) {
    return '$count lietotāji raksta…';
  }

  @override
  String get obtainingLocation => 'Iegūst atrašanās vietu…';

  @override
  String get locationFound => 'Location Found';

  @override
  String get otherPartyCannotReceiveEncryptedMessages =>
      'Other party cannot receive encrypted messages';

  @override
  String get accuracy => 'Accuracy';

  @override
  String get offline => 'Bezsaistē';

  @override
  String get ok => 'Labi';

  @override
  String get online => 'Tiešsaistē';

  @override
  String get onlineKeyBackupEnabled =>
      'Tiešsaistes atslēgas rezerves kopēšana ir iespējota';

  @override
  String get oopsPushError =>
      'Ups! Diemžēl atgadījās kļūda pašpiegādes paziņojumu iestatīšanas laikā.';

  @override
  String get oopsSomethingWentWrong => 'Ups! Kaut kas nogāja greizi…';

  @override
  String get openAppToReadMessages => 'Atvērt lietotni, lai lasītu ziņas';

  @override
  String get openCamera => 'Atvērt kameru';

  @override
  String get openVideoCamera => 'Atvērt kameru video uzņemšanai';

  @override
  String get oneClientLoggedOut => 'Viens no klientiem ir atteicies';

  @override
  String get addAccount => 'Pievienot kontu';

  @override
  String get editBundlesForAccount => 'Labot šī konta komplektus';

  @override
  String get addToBundle => 'Pievienot komplektam';

  @override
  String get bundleName => 'Komplekta nosaukums';

  @override
  String get enableMultiAccounts =>
      '(BETA) Iespējot vairākus kontus šajā ierīcē';

  @override
  String get openInMaps => 'Atvērt kartēs';

  @override
  String get link => 'Saite';

  @override
  String get serverRequiresEmail =>
      'Šim serverim ir nepieciešams pārbaudīt Tavu e-pasta adresi reģistrācijai.';

  @override
  String get or => 'Vai';

  @override
  String get participant => 'Dalībnieks';

  @override
  String get passphraseOrKey => 'paroles vārdkopa vai atkopes atslēga';

  @override
  String get password => 'Parole';

  @override
  String get passwordForgotten => 'Aizmirsta parole';

  @override
  String get passwordHasBeenChanged => 'Parole tikai nomainīta';

  @override
  String get hideMemberChangesInPublicChats =>
      'Paslēpt dalībnieku izmaiņas publiskajās tērzēšanās';

  @override
  String get hideMemberChangesInPublicChatsBody =>
      'Nerādīt tērzēšanas plūsmā, ja kāds pievienojas publiskai tērzēšanai vai pamet to, lai uzlabotu lasāmību.';

  @override
  String get overview => 'Pārskats';

  @override
  String get notifyMeFor => 'Paziņot man par';

  @override
  String get passwordRecoverySettings => 'Paroles atkopes iestatījumi';

  @override
  String get passwordRecovery => 'Paroles atkope';

  @override
  String get people => 'Cilvēki';

  @override
  String get pickImage => 'Izvēlēties attēlu';

  @override
  String get pin => 'PIN';

  @override
  String play(String fileName) {
    return 'Atskaņot $fileName';
  }

  @override
  String get pleaseChoose => 'Lūgums izvēlēties';

  @override
  String get pleaseChooseAPasscode => 'Lūgums izvēlēties piekļuves kodu';

  @override
  String get pleaseClickOnLink =>
      'Lūgums klikšķināt uz saites e-pastā un tad turpināt.';

  @override
  String get pleaseEnter4Digits =>
      'Lūgums ievadīt 4 ciparus vai atstāt tukšu, lai atspējotu lietotnes slēgu.';

  @override
  String get pleaseEnterRecoveryKey => 'Lūgums ievadīt savu atkopes atslēgu:';

  @override
  String get pleaseEnterYourPassword => 'Lūgums ievadīt savu paroli';

  @override
  String get pleaseEnterYourPin => 'Lūgums ievadīt savu PIN';

  @override
  String get pleaseEnterYourUsername => 'Lūgums ievadīt savu lietotājvārdu';

  @override
  String get pleaseFollowInstructionsOnWeb =>
      'Lūgums sekot norādēm tīmekļvietnē un piesist \"Nākamais\".';

  @override
  String get publicRooms => 'Publiskas istabas';

  @override
  String get pushRules => 'Pašpiegādes nosacījumi';

  @override
  String get recording => 'Ieraksta';

  @override
  String redactedBy(String username) {
    return 'Laboja $username';
  }

  @override
  String get directChat => 'Tiešā tērzēšana';

  @override
  String redactedByBecause(String username, String reason) {
    return 'Laboja $username, jo: \"$reason\"';
  }

  @override
  String redactedAnEvent(String username) {
    return '$username laboja notikumu';
  }

  @override
  String get register => 'Reģistrēties';

  @override
  String get reject => 'Noraidīt';

  @override
  String rejectedTheInvitation(String username) {
    return '$username noraidīja uzaicinājumu';
  }

  @override
  String get rejoin => 'Pievienoties atkārtoti';

  @override
  String get removeAllOtherDevices => 'Noņemt visas pārējās ierīces';

  @override
  String removedBy(String username) {
    return 'Noņēma $username';
  }

  @override
  String get removeDevice => 'Noņemt ierīci';

  @override
  String get unbanFromChat => 'Atcelt liegumu tērzēšanā';

  @override
  String get removeYourAvatar => 'Noņemt savu attēlu';

  @override
  String get requestPermission => 'Pieprasīt atļauju';

  @override
  String get roomHasBeenUpgraded => 'Istaba tika atjaunināta';

  @override
  String get roomVersion => 'Istabas versija';

  @override
  String get saveFile => 'Saglabāt datni';

  @override
  String get security => 'Drošība';

  @override
  String seenByUser(String username) {
    return '$username redzēja';
  }

  @override
  String get sendAMessage => 'Nosūtīt ziņu';

  @override
  String get sendAudio => 'Nosūtīt skaņu';

  @override
  String get sendFile => 'Nosūtīt datni';

  @override
  String get sendImage => 'Nosūtīt attēlu';

  @override
  String sendImages(int count) {
    return 'Nosūtīt $count attēlu(s)';
  }

  @override
  String get sendMessages => 'Nosūtīt ziņas';

  @override
  String get sendOriginal => 'Nosūtīt sākotnējo';

  @override
  String get sendSticker => 'Nosūtīt uzlīmi';

  @override
  String get sendVideo => 'Nosūtīt video';

  @override
  String sentAFile(String username) {
    return '📁 $username nosūtīja datni';
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
    return '🎤 $username nosūtīja skaņu';
  }

  @override
  String sentAPicture(String username) {
    return '🖼️ $username nosūtīja attēlu';
  }

  @override
  String sentASticker(String username) {
    return '😊 $username nosūtīja uzlīmi';
  }

  @override
  String sentAVideo(String username) {
    return '🎥 $username nosūtīja video';
  }

  @override
  String sentCallInformations(String senderName) {
    return '$senderName nosūtīja informāciju par zvanu';
  }

  @override
  String get separateChatTypes => 'Atdalīt tiešās tērzēšanas un kopas';

  @override
  String get setAsCanonicalAlias => 'Iestatīt kā galveno aizstājvārdu';

  @override
  String get setInvitationLink => 'Iestatīt uzaicinājumu saiti';

  @override
  String get setPermissionsLevel => 'Iestatīt atļauju līmeni';

  @override
  String get setStatus => 'Iestatīt stāvokli';

  @override
  String get settings => 'Iestatījumi';

  @override
  String get share => 'Kopīgot';

  @override
  String sharedTheLocation(String username) {
    return '$username kopīgoja savu atrašanās vietu';
  }

  @override
  String get shareLocation => 'Kopīgot atrašanās vietu';

  @override
  String get showPassword => 'Rādīt paroli';

  @override
  String get presenceStyle => 'Klātesamība:';

  @override
  String get presencesToggle => 'Rādīt citu lietotāju stāvokļa ziņas';

  @override
  String get singlesignon => 'Vienotā pieteikšanās';

  @override
  String get skip => 'Izlaist';

  @override
  String get sourceCode => 'Pirmkods';

  @override
  String get spaceIsPublic => 'Vieta ir publiska';

  @override
  String get spaceName => 'Vietas nosaukums';

  @override
  String startedACall(String senderName) {
    return '$senderName uzsāka zvanu';
  }

  @override
  String get startFirstChat => 'Uzsāc savu pirmo tērzēšanu';

  @override
  String get status => 'Stāvoklis';

  @override
  String get statusExampleMessage => 'Kā Tev šodien klājas?';

  @override
  String get submit => 'Iesniegt';

  @override
  String get synchronizingPleaseWait => 'Sinhronizē... Lūgums uzgaidīt.';

  @override
  String synchronizingPleaseWaitCounter(String percentage) {
    return ' Sinhronizē... ($percentage%)';
  }

  @override
  String get systemTheme => 'Sistēmas';

  @override
  String get theyDontMatch => 'Tās nesakrīt';

  @override
  String get theyMatch => 'Tās sakrīt';

  @override
  String get notFound => 'Not found';

  @override
  String get pinLimitMessage => 'You can only pin up to 3 chats';

  @override
  String get title => 'FluffyChat';

  @override
  String get toggleFavorite => 'Pārslēgt iecienīto';

  @override
  String get toggleMuted => 'Pārslēgt apklusināšanu';

  @override
  String get toggleUnread => 'Atzīmēt kā lasītu/nelasītu';

  @override
  String get tooManyRequestsWarning =>
      'Pārāk daudz pieprasījumu. Lūgums vēlāk mēģināt vēlreiz.';

  @override
  String get transferFromAnotherDevice => 'Pārnest no citas ierīces';

  @override
  String get tryToSendAgain => 'Mēģināt nosūtīt vēlreiz';

  @override
  String get unavailable => 'Nav pieejams';

  @override
  String unbannedUser(String username, String targetName) {
    return '$username atcēla $targetName piekļuves liegumu';
  }

  @override
  String get unblockDevice => 'Atslēgt ierīci';

  @override
  String get unknownDevice => 'Nezināma ierīce';

  @override
  String get unknownEncryptionAlgorithm => 'Nezināms šifrēšanas algoritms';

  @override
  String unknownEvent(String type) {
    return 'Nezināms notikums \'$type\'';
  }

  @override
  String get unmuteChat => 'Atcelt tērzēšanas apklusināšanu';

  @override
  String get unpin => 'Atspraust';

  @override
  String get unreadChats => 'null';

  @override
  String userAndOthersAreTyping(String username, int count) {
    return '$username un $count citi raksta…';
  }

  @override
  String userAndUserAreTyping(String username, String username2) {
    return '$username un $username2 raksta…';
  }

  @override
  String userIsTyping(String username) {
    return '$username raksta…';
  }

  @override
  String userLeftTheChat(String username) {
    return '🚪 $username pameta tērzēšanu';
  }

  @override
  String get username => 'Lietotājvārds';

  @override
  String userSentUnknownEvent(String username, String type) {
    return '$username nosūtīja notikumu $type';
  }

  @override
  String get unverified => 'Neapliecināta';

  @override
  String get verified => 'Apliecināta';

  @override
  String get verify => 'Apliecināt';

  @override
  String get verifyStart => 'Uzsākt apliecināšanu';

  @override
  String get verifySuccess => 'Apliecināšana bija sekmīga.';

  @override
  String get verifyTitle => 'Apliecina citu kontu';

  @override
  String get videoCall => 'Videozvans';

  @override
  String get visibilityOfTheChatHistory => 'Tērzēšanas vēstures redzamība';

  @override
  String get visibleForAllParticipants => 'Redzama visiem dalībniekiem';

  @override
  String get visibleForEveryone => 'Redzama visiem';

  @override
  String get voiceMessage => 'Balss ziņa';

  @override
  String get waitingPartnerAcceptRequest =>
      'Gaida, līdz biedrs apstiprinās pieprasījumu…';

  @override
  String get waitingPartnerEmoji =>
      'Gaida, līdz biedrs apstiprinās emocijzīmi…';

  @override
  String get waitingPartnerNumbers =>
      'Gaida, līdz biedrs apstiprinās skaitļus…';

  @override
  String get wallpaper => 'Ekrāntapete:';

  @override
  String get weSentYouAnEmail => 'Mēs nosūtīja e-pasta ziņu';

  @override
  String get whoIsAllowedToJoinThisGroup =>
      'Kuram ir ļauts pievienoties šai kopai';

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
      'Ar šīm adresēm var atjaunot savu paroli.';

  @override
  String get writeAMessage => 'Rakstīt ziņu…';

  @override
  String get yes => 'Jā';

  @override
  String get you => 'Tu';

  @override
  String get youAreNoLongerParticipatingInThisChat =>
      'Tu vairs nepiedalies šajā tērzēšanā';

  @override
  String get youHaveBeenBannedFromThisChat =>
      'Tev tika liegta piekļuve šai tērzēšanai';

  @override
  String get yourPublicKey => 'Tava publiskā atslēga';

  @override
  String get time => 'Laiks';

  @override
  String get messageType => 'Ziņas veids';

  @override
  String get sender => 'Sūtītājs';

  @override
  String get removeFromSpace => 'Noņemt no vietas';

  @override
  String get addToSpaceDescription =>
      'Atlasīt vietu, kurai pievienot šo tērzēšanu.';

  @override
  String get start => 'Uzsākt';

  @override
  String get publish => 'Publicēt';

  @override
  String videoWithSize(String size) {
    return 'Video ($size)';
  }

  @override
  String get openChat => 'Atvērt tērzēšanu';

  @override
  String get markAsRead => 'Atzīmēt kā lasītu';

  @override
  String get reportUser => 'Ziņot par lietotāju';

  @override
  String get dismiss => 'Atmest';

  @override
  String reactedWith(String sender, String reaction) {
    return '$sender atsaucās ar $reaction';
  }

  @override
  String get pinMessage => 'Piespraust istabai';

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
  String get emojis => 'Emocijzīmes';

  @override
  String get placeCall => 'Veikt zvanu';

  @override
  String get voiceCall => 'Balss zvans';

  @override
  String get videoCallsBetaWarning =>
      'Lūgums ņemt vērā, ka video zvani pašreiz ir beta stāvoklī. Tie visās platformās var nedarboties kā paredzēs vai pat nedarboties vispār.';

  @override
  String get experimentalVideoCalls => 'Izmēģinājuma video zvani';

  @override
  String get emailOrUsername => 'E-pasta adrese vai lietotājvārds';

  @override
  String get indexedDbErrorTitle => 'Privātā režīma nebūšanas';

  @override
  String get indexedDbErrorLong =>
      'Diemžēl ziņu krātuve pēc noklusējuma nav iespējota privātajā režīmā.\nLūgums apmeklēt\n - about:config\n - iestatīt dom.indexedDB.privateBrowsing.enabled kā true\nPretējā gadījumā nav iespējams palaist FluffyChat.';

  @override
  String switchToAccount(String number) {
    return 'Pārslēgties uz kontu $number';
  }

  @override
  String get nextAccount => 'Nākamais konts';

  @override
  String get previousAccount => 'Iepriekšējais konts';

  @override
  String get addWidget => 'Pievienot logrīku';

  @override
  String get widgetVideo => 'Video';

  @override
  String get widgetEtherpad => 'Teksta piezīme';

  @override
  String get widgetJitsi => 'Jitsi Meet';

  @override
  String get widgetCustom => 'Pielāgots';

  @override
  String get widgetName => 'Nosaukums';

  @override
  String get widgetUrlError => 'Tas nav derīgs URL.';

  @override
  String get widgetNameError => 'Lūgums norādīt attēlojamo nosaukumu.';

  @override
  String get errorAddingWidget => 'Kļūda logrīka pievienošanā.';

  @override
  String get youRejectedTheInvitation => 'Tu noraidīji uzaicinājumu';

  @override
  String get youJoinedTheChat => 'Tu pievienojies tērzēšanai';

  @override
  String get youAcceptedTheInvitation => '👍 Tu pieņēmi uzaicinājumu';

  @override
  String youBannedUser(String user) {
    return 'Tu $user liedzi piekļuvi';
  }

  @override
  String youHaveWithdrawnTheInvitationFor(String user) {
    return 'Tu atsauci $user uzaicinājumu';
  }

  @override
  String youInvitedToBy(String alias) {
    return '📩 Tu tiki uzaicināts ar saiti:\n$alias';
  }

  @override
  String invitedBy(String user) {
    return '📩 $user uzaicināja';
  }

  @override
  String youInvitedUser(String user) {
    return '📩 Tu uzaicināji $user';
  }

  @override
  String youKicked(String user) {
    return '👞 Tu izraidīji $user';
  }

  @override
  String youKickedAndBanned(String user) {
    return '🙅 Izraidīji $user un liedzi piekļuvi';
  }

  @override
  String youUnbannedUser(String user) {
    return 'Tu atcēli $user piekļuves liegumu';
  }

  @override
  String hasKnocked(String user) {
    return '🚪 $user pieklauvēja';
  }

  @override
  String userWouldLikeToChangeTheChat(String user) {
    return '$user vēlas pievienoties tērzēšanai.';
  }

  @override
  String get noPublicLinkHasBeenCreatedYet =>
      'Vēl nav izveidota neviena publiska saite';

  @override
  String get knock => 'Pieklauvēt';

  @override
  String get users => 'Lietotāji';

  @override
  String countFiles(int count) {
    return '$count datnes';
  }

  @override
  String get user => 'Lietotājs';

  @override
  String get custom => 'Pielāgots';

  @override
  String get callingPermissions => 'Zvanīšanas atļaujas';

  @override
  String get callingAccount => 'Zvanīšanas konts';

  @override
  String get callingAccountDetails =>
      'Ļauj FluffyChat izmantot iebūvēto Android zvanīšanas lietotni.';

  @override
  String get appearOnTop => 'Parādīt virspusē';

  @override
  String get appearOnTopDetails =>
      'Ļauj lietotnei parādīties virspusē (nav nepieciešams, ja FluffyChat jau ir iestatīts kā zvanīšanas konts)';

  @override
  String get otherCallingPermissions =>
      'Mikrofons, kamera un citas FluffyChat atļaujas';

  @override
  String get whyIsThisMessageEncrypted => 'Kādēļ šī ziņa ir nelasāma?';

  @override
  String get noKeyForThisMessage =>
      'Tā var notikt, ja ziņa tika nosūtīta, pirms pieteicies savā kontā šajā ierīcē.\n\nIr arī iespējams, ka sūtītājs noliedza Tavu ierīci vai kaut kas nogāja greizi ar interneta savienojumu.\n\nVai ziņas ir lasāmas citā sesijā? Tad Tu vari pārsūtīt ziņu no tās. Jādodas uz Iestatījumi > Ierīces un jāpārliecinās, ka ierīces viena otru ir apliecinājušas. Kad nākamreiz atvērsi istabu un abas sesijas būs priekšplānā, atslēgas tiks automātiski pārsūtītas.\n\nVai nevēlies zaudēt atslēgas, kad atsakies vai maini ierīces? Jāpārliecinās, ka iestatījumos ir iespējota tērzēšanu rezerves kopija.';

  @override
  String get newSpace => 'Jauna vieta';

  @override
  String get enterSpace => 'Ieiet vietā';

  @override
  String get enterRoom => 'Ieiet istabā';

  @override
  String get allSpaces => 'Visas vietas';

  @override
  String numChats(String number) {
    return '$number tērzēšanas';
  }

  @override
  String get hideUnimportantStateEvents =>
      'Paslēpt nebūtiskus stāvokļa notikumus';

  @override
  String get doNotShowAgain => 'Vairs nerādīt';

  @override
  String wasDirectChatDisplayName(String oldDisplayName) {
    return 'Tukša tērzēšana (bija $oldDisplayName)';
  }

  @override
  String get newSpaceDescription =>
      'Vietas ļauj apvienot tērzēšanas un būvēt privātas vai publiskas kopienas.';

  @override
  String get encryptThisChat => 'Šifrēt šo tērzēšanu';

  @override
  String get disableEncryptionWarning =>
      'Drošības iemeslu dēļ tērzēšanā nevar atspējot šifrēšanu, ja tā ir pirms tam ir bijusi iespējota.';

  @override
  String get sorryThatsNotPossible => 'Atvaino! Tas nav iespējams';

  @override
  String get deviceKeys => 'Ierīces atslēgas:';

  @override
  String get noBackupWarning =>
      'Uzmanību! Bez tērzēšanu rezerves kopiju veidošanas iespējošanas tiks zaudēta piekļuve savām šifrētajām ziņām. Ir ļoti ieteicams iespējot tērzēšanu rezerves kopiju veidošanu pirms atteikšanās.';

  @override
  String get noOtherDevicesFound => 'Netika atrastas citas ierīces';

  @override
  String fileIsTooBigForServer(String max) {
    return 'Nevar nosūtīt. Serveris nodrošina pielikums līdz $max.';
  }

  @override
  String fileHasBeenSavedAt(String path) {
    return 'Datne tika saglabāta $path';
  }

  @override
  String get readUpToHere => 'Izlasīts līdz šejienei';

  @override
  String get openLinkInBrowser => 'Atvērt saiti pārlūkā';

  @override
  String get reportErrorDescription =>
      '😭 Ak nē! Kaut kas nogāja greizi. Ja ir vēlēšanas, par šo nepilnību var ziņot izstrādātājiem.';

  @override
  String get signInWithPassword => 'Pieteikties ar paroli';

  @override
  String get pleaseTryAgainLaterOrChooseDifferentServer =>
      'Lūgums vēlāk mēģināt vēlreiz vai izvēlēties citu serveri.';

  @override
  String signInWith(String provider) {
    return 'Pieteikties ar $provider';
  }

  @override
  String get profileNotFound =>
      'Lietotāju serverī nevarēja atrast. Varbūt ir nebūšanas ar savienojumu vai lietotājs nepastāv.';

  @override
  String get setTheme => 'Iestatīt izskatu:';

  @override
  String get setColorTheme => 'Iestatīt krāsu izskatu:';

  @override
  String get invite => 'Uzaicināt';

  @override
  String get inviteGroupChat => '📨 Uzaicināt kopas tērzēšanu';

  @override
  String get invitePrivateChat => '📨 Uzaicināt privātu tērzēšanu';

  @override
  String get invalidInput => 'Nederīga ievade.';

  @override
  String get wrongPinEntered =>
      'Ievadīts nepareizs PIN. Lūgums mēģināt vēlreiz pēc null sekundēm...';

  @override
  String get pleaseEnterANumber => 'Lūgums ievadīt skaitli lielāku par 0';

  @override
  String get banUserDescription =>
      'Lietotājam tiks liegta piekļuve tērzēšanai, un vairs nevarēs vēlreiz pievienoties tērzēšanai, līdz liegums tiks atcelts.';

  @override
  String get unbanUserDescription =>
      'Lietotājs varēs atkal pievienoties tērzēšanai, ja mēģinās.';

  @override
  String get kickUserDescription =>
      'Lietotājs ir izmests no tērzēšanas, bet piekļuve nav liegta. Publiskās tērzēšanās lietotājs var atkārtoti pievienoties jebkurā laikā.';

  @override
  String get makeAdminDescription =>
      'Tiklīdz šis lietotājs tiks padarīts par pārvaldītāju, to vairs nevarēs atdarīt, jo tad tam būs tādas pašas atļaujas kā Tev.';

  @override
  String get pushNotificationsNotAvailable =>
      'Pašpiegādes paziņojumi nav pieejami';

  @override
  String get learnMore => 'Uzzināt vairāk';

  @override
  String get yourGlobalUserIdIs => 'Vispārējais lietotāja Id ir: ';

  @override
  String noUsersFoundWithQuery(String query) {
    return 'Diemžēl ar \"$query\" netika atrasts neviens lietotājs. Lūgums pārbaudīt, vai ir pieļauta drukas kļūda.';
  }

  @override
  String get knocking => 'Klauvē';

  @override
  String chatCanBeDiscoveredViaSearchOnServer(String server) {
    return 'Tērzēšana var tikt atklāta ar meklēšanu $server';
  }

  @override
  String get searchChatsRooms => 'Meklēt #tērzēšanas, @lietotājus...';

  @override
  String get nothingFound => 'Nekas netika atrasts...';

  @override
  String get createGroupAndInviteUsers =>
      'Izveidot kopu un uzaicināt lietotājus';

  @override
  String get groupCanBeFoundViaSearch => 'Kopu var atrast meklēšanā';

  @override
  String get startConversation => 'Uzsākt sarunu';

  @override
  String get commandHint_sendraw => 'Nosūtīt neapstrādātu JSON';

  @override
  String get databaseMigrationTitle => 'Datubāze ir optimizēta';

  @override
  String get databaseMigrationBody =>
      'Lūgums uzgaidīt. Tas var aizņemt kādu brīdi.';

  @override
  String get searchForUsers => 'Meklēt @lietotājus...';

  @override
  String get pleaseEnterYourCurrentPassword =>
      'Lūgums ievadīt savu pašreizējo paroli';

  @override
  String get newPassword => 'Jauna parole';

  @override
  String get pleaseChooseAStrongPassword => 'Lūgums izvēlēties spēcīgu paroli';

  @override
  String get passwordsDoNotMatch => 'Paroles nesakrīt';

  @override
  String get passwordIsWrong => 'Ievadītā parole ir nepareiza';

  @override
  String get publicLink => 'Publiska saite';

  @override
  String get publicChatAddresses => 'Publiskas tērzēšanas adreses';

  @override
  String get createNewAddress => 'Izveidot jaunu adresi';

  @override
  String get joinSpace => 'Pievienoties vietai';

  @override
  String get publicSpaces => 'Publiskas vietas';

  @override
  String get addChatOrSubSpace => 'Pievienot tērzēšanu vai apakšvietu';

  @override
  String get subspace => 'Apakšvieta';

  @override
  String get thisDevice => 'Šī ierīce:';

  @override
  String get initAppError => 'Atgadījās kļūda lietotnes sāknēšanas laikā';

  @override
  String get userRole => 'Lietotāja loma';

  @override
  String minimumPowerLevel(String level) {
    return '$level ir zemākais spēka līmenis.';
  }

  @override
  String searchIn(String chat) {
    return 'Meklēt tērzēšanā \"$chat\"...';
  }

  @override
  String get searchMore => 'Meklēt vairāk...';

  @override
  String databaseBuildErrorBody(String url, String error) {
    return 'Nebija iespējams izveidot SQlite datubāzi. Lietotne pagaidām mēģina izmantot iepriekšējo datubāzi. Lūgums ziņot par šo kļūdu izstrādātājiem $url. Kļūdas ziņojums ir: $error';
  }

  @override
  String sessionLostBody(String url, String error) {
    return 'Sesija ir zaudēta. Lūgums ziņot par šo kļūdu izstrādātājiem $url. Kļūdas ziņojums ir: $error';
  }

  @override
  String restoreSessionBody(String url, String error) {
    return 'Lietotne tagad mēģina atjaunot sesiju no rezerves kopijas. Lūgums ziņot par šo kļūdu izstrādātājiem $url. Kļūdas ziņojums ir: $error';
  }

  @override
  String forwardMessageTo(String roomName) {
    return 'Pārsūtīt ziņu uz $roomName?';
  }

  @override
  String get sendReadReceipts => 'Nosūtīt lasīšanas atskaites';

  @override
  String get sendTypingNotificationsDescription =>
      'Citi tērzēšanas dalībnieki var redzēt, kad raksti jaunu ziņu.';

  @override
  String get sendReadReceiptsDescription =>
      'Citi tērzēšanas dalībnieki var redzēt, kad izlasīji ziņu.';

  @override
  String get formattedMessages => 'Formatētas ziņas';

  @override
  String get formattedMessagesDescription =>
      'Attēlot bagātinātu ziņu saturu, piemēram, ar Markdown iezīmētu treknrakstu.';

  @override
  String get verifyOtherUser => '🔐 Apliecināt otru lietotāju';

  @override
  String get verifyOtherUserDescription =>
      'Ar cita lietotāja apliecināšanu vari pārliecināties, ka zini, kam Tu tiešām raksti. 💪\n\nKad uzsāc apliecināšanu, Tu un otrs lietotājs lietotnē redzēs uznirstošo logu. Tajā jūs redzēsiet dažādas emocijzīmes vai skaitļus, kas ir jāsalīdzina savā starpā.\n\nLabākais veids, kā to izdarīt, ir satikties vai uzsākt videozvanu. 👭';

  @override
  String acceptedKeyVerification(String sender) {
    return '$sender apstiprināja atslēgas apliecināšanu';
  }

  @override
  String canceledKeyVerification(String sender) {
    return '$sender atcēla atslēgas apliecināšanu';
  }

  @override
  String completedKeyVerification(String sender) {
    return '$sender pabeidza atslēgas apliecināšanu';
  }

  @override
  String isReadyForKeyVerification(String sender) {
    return '$sender ir gatavs atslēgas apliecināšanai';
  }

  @override
  String requestedKeyVerification(String sender) {
    return '$sender pieprasīja atslēgas apliecināšanu';
  }

  @override
  String startedKeyVerification(String sender) {
    return '$sender uzsāka atslēgas apliecināšanu';
  }

  @override
  String get transparent => 'Caurspīdīgs';

  @override
  String get incomingMessages => 'Ienākošās ziņas';

  @override
  String get stickers => 'Uzlīmes';

  @override
  String get discover => 'Atklāt';

  @override
  String get commandHint_ignore => 'Neņemt vērā norādīto Matrix Id';

  @override
  String get commandHint_unignore => 'Atcelt norādītā Matrix Id neņemšanu vērā';

  @override
  String unreadChatsInApp(String appname, String unread) {
    return '$appname: $unread nelasītas tērzēšanas';
  }

  @override
  String get noDatabaseEncryption =>
      'Šajā platformā datubāzes šifrēšana netiek nodrošināta';

  @override
  String thereAreCountUsersBlocked(Object count) {
    return 'Šobrīd ir izslēgti $count lietotāji.';
  }

  @override
  String goToSpace(Object space) {
    return 'Doties uz vietu: $space';
  }

  @override
  String get youDeletedThisMessage => 'You deleted this message';

  @override
  String get thisMessageWasDeleted => 'This message was deleted';

  @override
  String get refreshing => 'Refreshing...';

  @override
  String get markAsUnread => 'Atzīmēt kā nelasītu';

  @override
  String userLevel(int level) {
    return '$level - Lietotājs';
  }

  @override
  String moderatorLevel(int level) {
    return '$level - Moderators';
  }

  @override
  String adminLevel(int level) {
    return '$level - Pārvaldītājs';
  }

  @override
  String get changeGeneralChatSettings =>
      'Mainīt vispārējos tērzēšanas iestatījumus';

  @override
  String get inviteOtherUsers => 'Uzaicināt šajā tērzēšanā citus lietotājus';

  @override
  String get changeTheChatPermissions => 'Mainīt tērzēšanas atļaujas';

  @override
  String get changeTheVisibilityOfChatHistory =>
      'Mainīt tērzēšanas vēstures redzamību';

  @override
  String get changeTheCanonicalRoomAlias =>
      'Mainīt tērzēšanas galveno publisko adresi';

  @override
  String get sendRoomNotifications => 'Sūtīt @istaba paziņojumus';

  @override
  String get changeTheDescriptionOfTheGroup => 'Mainīt tērzēšanas aprakstu';

  @override
  String get chatPermissionsDescription =>
      'Noteikt, kurš spēka līmenis ir nepieciešams noteiktām darbībām šajā tērzēšanā. Spēka līmeņi 0, 50 un 100 parasti atbilst lietotājiem, moderatoriem un pārvaldītājiem, bet ir iespējams jebkāds iedalījums.';

  @override
  String updateInstalled(String version) {
    return '🎉 Atjauninājums $version uzstādīts.';
  }

  @override
  String get changelog => 'Izmaiņu žurnāls';

  @override
  String get sendCanceled => 'Sūtīšana atcelta';

  @override
  String get loginWithMatrixId => 'Pieteikties ar Matrix-Id';

  @override
  String get discoverHomeservers => 'Atklāt mājasserverus';

  @override
  String get whatIsAHomeserver => 'Kas ir mājasserveris?';

  @override
  String get homeserverDescription =>
      'Visi lietotāja dati tiek glabāti mājasserverī, gluži kā ar e-pasta nodrošinātāju. Ir iespējams izvēlēties, kuru mājasserveri izmantot, saglabājot iespēju sazināties ar ikvienu. Vairāk var uzzināt https://invitation.be-mindpower.net/.';

  @override
  String get doesNotSeemToBeAValidHomeserver =>
      'Neizskatās pēc saderīga mājasservera. Nepareizs URL?';

  @override
  String get calculatingFileSize => 'Aprēķina datnes lielumu...';

  @override
  String get prepareSendingAttachment => 'Sagatavo pielikuma nosūtīšanu...';

  @override
  String get sendingAttachment => 'Nosūta pielikumu...';

  @override
  String get generatingVideoThumbnail => 'Izveido video sīktēlu...';

  @override
  String get compressVideo => 'Saspiež video...';

  @override
  String sendingAttachmentCountOfCount(int index, int length) {
    return 'Nosūta $index. pielikumu no $length...';
  }

  @override
  String serverLimitReached(int seconds) {
    return 'Sasniegts servera ierobežojums. Gaida $seconds sekundes...';
  }

  @override
  String get oneOfYourDevicesIsNotVerified =>
      'Viena no ierīcēm nav apliecināta';

  @override
  String get noticeChatBackupDeviceVerification =>
      'Piezīme: kad visas ierīces tiek savienotas ar tērzēšanu rezerves kopiju, tās tiek automātiski apliecinātas.';

  @override
  String get continueText => 'Turpināt';

  @override
  String get welcomeText =>
      'Sveicieni! 👋 Šis ir FluffyChat. Tu vari pieteikties jebkurā mājasserverī, kas ir saderīgs ar https://invitation.be-mindpower.net/. Tad vari tērzēt ar ikvienu. Tas ir milzīgs decentralizētās saziņas tīkls.';

  @override
  String get blur => 'Aizmiglojums:';

  @override
  String get opacity => 'Necaurredzamība:';

  @override
  String get setWallpaper => 'Iestatīt ekrāntapeti';

  @override
  String get manageAccount => 'Pārvaldīt kontu';

  @override
  String get noContactInformationProvided =>
      'Serveris nesniedz nekādu derīgu saziņas informāciju';

  @override
  String get contactServerAdmin => 'Sazināties ar servera pārvaldītāju';

  @override
  String get contactServerSecurity =>
      'Sazināties ar servera drošības uzturētājiem';

  @override
  String get supportPage => 'Atbalsta lapa';

  @override
  String get serverInformation => 'Informācija par serveri:';

  @override
  String get name => 'Nosaukums';

  @override
  String get version => 'Versija';

  @override
  String get website => 'Tīmekļvietne';

  @override
  String get compress => 'Saspiest';

  @override
  String get boldText => 'Teksts treknrakstā';

  @override
  String get italicText => 'Teksts slīprakstā';

  @override
  String get strikeThrough => 'Pārsvītrots';

  @override
  String get invalidUrl => 'Nederīgs URL';

  @override
  String get addLink => 'Pievienot saiti';

  @override
  String get unableToJoinChat =>
      'Nevarēja pievienoties tērzēšanai. Varbūt otra puse jau ir aizvērusi sarunu.';

  @override
  String get previous => 'Iepriekšējais';

  @override
  String appWantsToUseForLogin(String server) {
    return 'Izmantot \'$server\', lai pieteiktos';
  }

  @override
  String get appWantsToUseForLoginDescription =>
      'Ar šo tiek ļauts lietotnei un tīmekļvietnei kopīgot informāciju par Tevi.';

  @override
  String get open => 'Atvērt';

  @override
  String get waitingForServer => 'Gaida serveri...';

  @override
  String get appIntroduction =>
      'FluffyChat ļauj tērzēt ar draugiem, kuri izmanto dažādas ziņojumapmaiņas lietotnes. Vairāk var uzzināt https://invitation.be-mindpower.net/ vai vienkārši piesitot *Turpināt*.';

  @override
  String get newChatRequest => '📩 Jauns tērzēšanas pieprasījums';

  @override
  String get contentNotificationSettings => 'Satura paziņojumu iestatījumi';

  @override
  String get generalNotificationSettings => 'Vispārēji paziņojumu iestatījumi';

  @override
  String get roomNotificationSettings => 'Istabu paziņojumu iestatījumi';

  @override
  String get userSpecificNotificationSettings =>
      'Lietotāja paziņojumu iestatījumi';

  @override
  String get otherNotificationSettings => 'Citi paziņojumu iestatījumi';

  @override
  String get notificationRuleContainsUserName => 'Saturs lietotāja vārdu';

  @override
  String get notificationRuleContainsUserNameDescription =>
      'Paziņo lietotājam, kad ziņa satur viņa lietotājvārdu.';

  @override
  String get notificationRuleMaster => 'Apklusināt visus paziņojumus';

  @override
  String get notificationRuleMasterDescription =>
      'Aizvieto visas pārējās kārtulas un atspējo visus paziņojumus.';

  @override
  String get notificationRuleSuppressNotices => 'Apspiest automātiskās ziņas';

  @override
  String get notificationRuleSuppressNoticesDescription =>
      'Apspiež paziņojumus no automatizētiem klientiem, piemēram, robotprogrammatūras.';

  @override
  String get notificationRuleInviteForMe => 'Uzaicinājums man';

  @override
  String get notificationRuleInviteForMeDescription =>
      'Paziņo lietotājam, kad viņš ir uzaicināts pievienoties istabai.';

  @override
  String get notificationRuleMemberEvent => 'Dalībnieka notikums';

  @override
  String get notificationRuleMemberEventDescription =>
      'Apspiež paziņojums par dalības notikumiem.';

  @override
  String get notificationRuleIsUserMention => 'Lietotāja pieminēšana';

  @override
  String get notificationRuleIsUserMentionDescription =>
      'Paziņo lietotājam, kad viņš ziņā ir tieši pieminēts.';

  @override
  String get notificationRuleContainsDisplayName => 'Satur attēlojamo vārdu';

  @override
  String get notificationRuleContainsDisplayNameDescription =>
      'Paziņo lietotājam, kad ziņa satur viņa attēlojamo vārdu.';

  @override
  String get notificationRuleIsRoomMention => 'Istabas pieminēšana';

  @override
  String get notificationRuleIsRoomMentionDescription =>
      'Paziņo lietotājam, kad tiek pieminēta istaba.';

  @override
  String get notificationRuleRoomnotif => 'Istabas paziņojums';

  @override
  String get notificationRuleRoomnotifDescription =>
      'Paziņo lietotājam, kad ziņa satur \"@istaba\".';

  @override
  String get notificationRuleTombstone => 'Kapakmens';

  @override
  String get notificationRuleTombstoneDescription =>
      'Paziņo lietotājam par istabu aizvēršanas ziņām.';

  @override
  String get notificationRuleReaction => 'Reakcija';

  @override
  String get notificationRuleReactionDescription =>
      'Apspiež paziņojums par reakcijām.';

  @override
  String get notificationRuleRoomServerAcl => 'Istabas servera ACL';

  @override
  String get notificationRuleRoomServerAclDescription =>
      'Apspiež paziņojumus par istabas servera piekļuves kontroles sarakstiem (ACL).';

  @override
  String get notificationRuleSuppressEdits => 'Apspiest labojumus';

  @override
  String get notificationRuleSuppressEditsDescription =>
      'Apspiež paziņojumus par labotām ziņām.';

  @override
  String get notificationRuleCall => 'Zvans';

  @override
  String get notificationRuleCallDescription =>
      'Paziņo lietotājam par zvaniem.';

  @override
  String get notificationRuleEncryptedRoomOneToOne =>
      'Šifrēta viens pret viens istaba';

  @override
  String get notificationRuleEncryptedRoomOneToOneDescription =>
      'Paziņo lietotājam par ziņām šifrētās viens pret viens istabās.';

  @override
  String get notificationRuleRoomOneToOne => 'Viens pret viens istaba';

  @override
  String get notificationRuleRoomOneToOneDescription =>
      'Paziņo lietotājam par ziņām viens pret viens istabās.';

  @override
  String get notificationRuleMessage => 'Ziņa';

  @override
  String get notificationRuleMessageDescription =>
      'Paziņo lietotājam par vispārējām ziņām.';

  @override
  String get notificationRuleEncrypted => 'Šifrēts';

  @override
  String get notificationRuleEncryptedDescription =>
      'Paziņo lietotājam par ziņām šifrētās istabās.';

  @override
  String get notificationRuleJitsi => 'Jitsi';

  @override
  String get notificationRuleJitsiDescription =>
      'Paziņo lietotājam par Jitsi logrīka notikumiem.';

  @override
  String get notificationRuleServerAcl => 'Apspiest servera ACL notikumus';

  @override
  String get notificationRuleServerAclDescription =>
      'Apspiež notikumus par servera ACL notikumiem.';

  @override
  String unknownPushRule(String rule) {
    return 'Nezināma pašpiegādes kārtula \'$rule\'';
  }

  @override
  String sentVoiceMessage(String sender, String duration) {
    return '🎙️ $duration - Balss ziņa no $sender';
  }

  @override
  String get deletePushRuleCanNotBeUndone =>
      'Ja tiek izdzēsts šis paziņojuma iestatījums, to nevar atsaukt.';

  @override
  String get more => 'Vairāk';

  @override
  String get shareKeysWith => 'Kopīgot atslēgas ar...';

  @override
  String get shareKeysWithDescription =>
      'Kurām ierīcēm vajadzētu uzticēties, lai tajās varētu lasīt ziņas šifrētajās tērzēšanās?';

  @override
  String get allDevices => 'Visas ierīces';

  @override
  String get crossVerifiedDevicesIfEnabled =>
      'Savstarpēji apliecinātas ierīces, ja iespējots';

  @override
  String get crossVerifiedDevices => 'Savstarpēji apliecinātas ierīces';

  @override
  String get verifiedDevicesOnly => 'Tikai apliecinātas ierīces';

  @override
  String get takeAPhoto => 'Uzņemt attēlu';

  @override
  String get recordAVideo => 'Ierakstīt video';

  @override
  String get optionalMessage => '(Pēc izvēles) Ziņojums...';

  @override
  String get notSupportedOnThisDevice => 'Šajā ierīcē nav atbalstīts';

  @override
  String get approve => 'Apstiprināt';

  @override
  String get youHaveKnocked => 'Tu pieklauvēji';

  @override
  String get pleaseWaitUntilInvited =>
      'Lūgums tagad uzgaidīt, līdz kāds no istabas uzaicinās Tevi.';

  @override
  String get commandHint_logout => 'Atteikties pašreizējā ierīcē';

  @override
  String get commandHint_logoutall => 'Atteikties visās izmantotajās ierīcēs';

  @override
  String get displayNavigationRail => 'Rādīt pārvietošanās sliedi viedierīcēs';

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
