// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Tamil (`ta`).
class L10nTa extends L10n {
  L10nTa([String locale = 'ta']) : super(locale);

  @override
  String get alwaysUse24HourFormat => 'தவறு';

  @override
  String get repeatPassword => 'கடவுச்சொல்லை மீண்டும் செய்யவும்';

  @override
  String get notAnImage => 'படக் கோப்பு அல்ல.';

  @override
  String get setCustomPermissionLevel => 'Set custom permission level';

  @override
  String get setPermissionsLevelDescription =>
      'Please choose a predefined role below or enter a custom permission level between 0 and 100.';

  @override
  String get ignoreUser => 'Ignore user';

  @override
  String get normalUser => 'Normal user';

  @override
  String get remove => 'அகற்று';

  @override
  String get importNow => 'இப்போது இறக்குமதி செய்யுங்கள்';

  @override
  String get importEmojis => 'ஈமோசிகளை இறக்குமதி செய்யுங்கள்';

  @override
  String get importFromZipFile => '.Zip கோப்பிலிருந்து இறக்குமதி செய்யுங்கள்';

  @override
  String get exportEmotePack => 'எமோட் பேக் .zip என ஏற்றுமதி செய்யுங்கள்';

  @override
  String get replace => 'மாற்றவும்';

  @override
  String get about => 'பற்றி';

  @override
  String aboutHomeserver(String homeserver) {
    return '$homeserver பற்றி';
  }

  @override
  String get accept => 'ஏற்றுக்கொள்';

  @override
  String acceptedTheInvitation(String username) {
    return '👍 $username அழைப்பை ஏற்றுக்கொண்டது';
  }

  @override
  String get account => 'கணக்கு';

  @override
  String activatedEndToEndEncryption(String username) {
    return '$username இறுதி குறியாக்கத்திற்கு செயல்படுத்தப்பட்ட முடிவு';
  }

  @override
  String get addEmail => 'மின்னஞ்சல் சேர்க்கவும்';

  @override
  String get confirmMatrixId =>
      'உங்கள் கணக்கை நீக்க உங்கள் மேட்ரிக்ச் ஐடியை உறுதிப்படுத்தவும்.';

  @override
  String supposedMxid(String mxid) {
    return 'இது $mxid be ஆக இருக்க வேண்டும்';
  }

  @override
  String get addChatDescription => 'அரட்டை விளக்கத்தைச் சேர்க்கவும் ...';

  @override
  String get addToSpace => 'விண்வெளியில் சேர்க்கவும்';

  @override
  String get admin => 'நிர்வாகி';

  @override
  String get alias => 'மாற்றுப்பெயர்';

  @override
  String get all => 'அனைத்தும்';

  @override
  String get allChats => 'அனைத்து அரட்டைகளும்';

  @override
  String get commandHint_roomupgrade =>
      'Upgrade this room to the given room version';

  @override
  String get commandHint_googly => 'சில கூகிள் கண்களை அனுப்பவும்';

  @override
  String get commandHint_cuddle => 'ஒரு கசப்பு அனுப்பவும்';

  @override
  String get commandHint_hug => 'கட்டிப்பிடிக்கவும்';

  @override
  String googlyEyesContent(String senderName) {
    return '$senderName உங்களுக்கு கூகிள் கண்களை அனுப்புகிறது';
  }

  @override
  String cuddleContent(String senderName) {
    return '$senderName பெயர் you உங்களை கசக்குகிறது';
  }

  @override
  String hugContent(String senderName) {
    return '$senderName உங்களை அணைத்துக்கொள்கிறது';
  }

  @override
  String answeredTheCall(String senderName) {
    return '$senderName அழைப்புக்கு பதிலளித்தார்';
  }

  @override
  String get anyoneCanJoin => 'யார் வேண்டுமானாலும் சேரலாம்';

  @override
  String get appLock => 'பயன்பாட்டு பூட்டு';

  @override
  String get appLockDescription =>
      'முள் குறியீட்டைக் கொண்டு பயன்படுத்தாதபோது பயன்பாட்டைப் பூட்டவும்';

  @override
  String get archive => 'காப்பகம்';

  @override
  String get unArchive => 'Unarchive';

  @override
  String get areGuestsAllowedToJoin =>
      'விருந்தினர் பயனர்கள் சேர அனுமதிக்கப்படுகிறார்களா';

  @override
  String get areYouSure => 'நீங்கள் உறுதியாக இருக்கிறீர்களா?';

  @override
  String get areYouSureYouWantToLogout =>
      'நீங்கள் நிச்சயமாக வெளியேற விரும்புகிறீர்களா?';

  @override
  String get askSSSSSign =>
      'மற்ற நபரில் கையெழுத்திட, தயவுசெய்து உங்கள் பாதுகாப்பான கடை பாச்ஃபிரேச் அல்லது மீட்பு விசையை உள்ளிடவும்.';

  @override
  String askVerificationRequest(String username) {
    return '$usernameபயனர்பெயர் இருந்து இலிருந்து இந்த சரிபார்ப்பு கோரிக்கையை ஏற்றுக்கொள்ளவா?';
  }

  @override
  String get autoplayImages =>
      'அனிமேசன் செய்யப்பட்ட ச்டிக்கர்கள் மற்றும் உணர்ச்சிகளை தானாக இயக்கவும்';

  @override
  String badServerLoginTypesException(String serverVersions,
      String supportedVersions, Object suportedVersions) {
    return 'உள்நாட்டு வகைகளை ஓம்சர்வர் ஆதரிக்கிறது:\n $serverVersions\n ஆனால் இந்த பயன்பாடு மட்டுமே ஆதரிக்கிறது:\n $supportedVersions';
  }

  @override
  String get sendTypingNotifications => 'தட்டச்சு அறிவிப்புகளை அனுப்பவும்';

  @override
  String get swipeRightToLeftToReply =>
      'பதிலளிக்க வலமிருந்து இடமாக ச்வைப் செய்யவும்';

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
  String get sendOnEnter => 'Enter ஐ அனுப்பவும்';

  @override
  String badServerVersionsException(
      String serverVersions,
      String supportedVersions,
      Object serverVerions,
      Object supoortedVersions,
      Object suportedVersions) {
    return 'ஓம்சர்வர் ச்பெக் பதிப்புகளை ஆதரிக்கிறது:\n $serverVersions\n ஆனால் இந்த பயன்பாடு $supportedVersions மட்டுமே ஆதரிக்கிறது';
  }

  @override
  String countChatsAndCountParticipants(int chats, int participants) {
    return '$chats அரட்டைகள் மற்றும் $participants பங்கேற்பாளர்கள்';
  }

  @override
  String countMembers(int count) {
    return '$count Members';
  }

  @override
  String get noMoreChatsFound => 'இனி அரட்டைகள் கிடைக்கவில்லை ...';

  @override
  String get noChatsFoundHere =>
      'இங்கே அரட்டைகள் எதுவும் காணப்படவில்லை. கீழே உள்ள பொத்தானைப் பயன்படுத்தி ஒருவருடன் புதிய அரட்டையைத் தொடங்கவும். .';

  @override
  String get joinedChats => 'இணைந்த அரட்டைகள்';

  @override
  String get unread => 'படிக்காதது';

  @override
  String get space => 'இடைவெளி';

  @override
  String get spaces => 'இடங்கள்';

  @override
  String get banFromChat => 'அரட்டையிலிருந்து தடை';

  @override
  String get banned => 'தடைசெய்யப்பட்டது';

  @override
  String bannedUser(String username, String targetName) {
    return '$username தடைசெய்யப்பட்ட $targetName';
  }

  @override
  String get blockDevice => 'தொகுதி சாதனம்';

  @override
  String get blocked => 'தடுக்கப்பட்டது';

  @override
  String get botMessages => 'போட் செய்திகள்';

  @override
  String get cancel => 'ரத்துசெய்';

  @override
  String cantOpenUri(String uri) {
    return 'யூரி $uri வேலை ஐ திறக்க முடியாது';
  }

  @override
  String get changeDeviceName => 'சாதனத்தின் பெயரை மாற்றவும்';

  @override
  String changedTheChatAvatar(String username) {
    return '$username அரட்டை அவதாரத்தை மாற்றியது';
  }

  @override
  String changedTheChatDescriptionTo(String username, String description) {
    return '$username பயனர்பெயர் the அரட்டை விளக்கத்தை மாற்றியது: \'$description\'';
  }

  @override
  String changedTheChatNameTo(String username, String chatname) {
    return '$username அரட்டை பெயரை மாற்றியது: \'$chatname\'';
  }

  @override
  String changedTheChatPermissions(String username) {
    return '$username அரட்டை அனுமதிகளை மாற்றியுள்ளார்';
  }

  @override
  String changedTheDisplaynameTo(String username, String displayname) {
    return '$username அவற்றின் காட்சி பெயர்: \'$displayname\'';
  }

  @override
  String changedTheGuestAccessRules(String username) {
    return '$username விருந்தினர் அணுகல் விதிகளை மாற்றியது';
  }

  @override
  String changedTheGuestAccessRulesTo(String username, String rules) {
    return '$username விருந்தினர் அணுகல் விதிகளை மாற்றியது: $rules';
  }

  @override
  String changedTheHistoryVisibility(String username) {
    return '$username வரலாற்று தெரிவுநிலையை மாற்றியது';
  }

  @override
  String changedTheHistoryVisibilityTo(String username, String rules) {
    return '$username வரலாற்று தெரிவுநிலையை மாற்றியது: $rules';
  }

  @override
  String changedTheJoinRules(String username) {
    return '$username சேர விதிகளை மாற்றியது';
  }

  @override
  String changedTheJoinRulesTo(String username, String joinRules) {
    return '$username சேர விதிகளை மாற்றியது: $joinRules';
  }

  @override
  String changedTheProfileAvatar(String username) {
    return '$username அவர்களின் அவதாரத்தை மாற்றியது';
  }

  @override
  String changedTheRoomAliases(String username) {
    return '$username அறை மாற்றுப்பெயர்களை மாற்றியது';
  }

  @override
  String changedTheRoomInvitationLink(String username) {
    return '$username அழைப்பிதழ் இணைப்பை மாற்றியது';
  }

  @override
  String get changePassword => 'கடவுச்சொல்லை மாற்றவும்';

  @override
  String get changeTheHomeserver => 'ஓம்சர்வரை மாற்றவும்';

  @override
  String get changeTheme => 'உங்கள் பாணியை மாற்றவும்';

  @override
  String get changeTheNameOfTheGroup => 'குழுவின் பெயரை மாற்றவும்';

  @override
  String get changeYourAvatar => 'உங்கள் அவதாரத்தை மாற்றவும்';

  @override
  String get channelCorruptedDecryptError => 'குறியாக்கம் சிதைந்துள்ளது';

  @override
  String get chat => 'அரட்டை';

  @override
  String get yourChatBackupHasBeenSetUp =>
      'உங்கள் அரட்டை காப்புப்பிரதி அமைக்கப்பட்டுள்ளது.';

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
  String get chatDescription => 'அரட்டை விளக்கம்';

  @override
  String get goToChat => 'Go to Chat';

  @override
  String get financeTitle => 'Finance';

  @override
  String get financeSubtitle => 'Your money, hassle-free.';

  @override
  String get financeDescription =>
      'Send, receive, convert, pay with QR, or add funds all in one place. No - hassle. No surprises.';

  @override
  String get goToWallet => 'Go to Wallet';

  @override
  String get marketplaceTitle => 'Marketplace';

  @override
  String get marketplaceSubtitle =>
      'Shop without searching, find what you need.';

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
      'Delivery, shipping, subscriptions, reservations… All in one tap. They\'re here, ready for you.';

  @override
  String get goToApps => 'Go to Apps';

  @override
  String get communitiesTitle => 'Communities';

  @override
  String get communitiesSubtitle => 'Connect, share and create.';

  @override
  String get communitiesDescription =>
      'Explore other people\'s content, post your own. This isn\'t just about social media… it\'s about your voice, it\'s about you in the digital world.';

  @override
  String get goToCommunity => 'Go to Community';

  @override
  String get music => 'Music';

  @override
  String get yourRhythmYourSpace => 'Your rhythm, your space';

  @override
  String get musicDescription =>
      'Discover, listen, and share music that moves you. Create playlists, follow artists, and let the rhythm be part of your daily experience.';

  @override
  String get mentalHealth => 'Mental Health';

  @override
  String get yourPeaceAlsoMatters => 'Your peace also matters';

  @override
  String get mentalHealthDescription =>
      'Tools and resources for your emotional well-being. Meditation, mindfulness exercises, and professional support when you need it most.';

  @override
  String get aiFinance => 'AI Finance';

  @override
  String get letMoneyThinkToo => 'Let money think too';

  @override
  String get aiFinanceDescription =>
      'Artificial intelligence that helps you make smarter financial decisions. Automatic analysis, personalized recommendations, and predictive insights.';

  @override
  String get nutrition => 'Nutrition';

  @override
  String get eatWithoutComplications => 'Eat without complications';

  @override
  String get nutritionDescription =>
      'Personalized meal plans, nutritional tracking, and healthy recipes. Take care of your body with smart, simple nutrition.';

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
  String get tryAgain => 'மீண்டும் முயற்சிக்கவும்';

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
  String get search => 'தேடல்';

  @override
  String get select => 'தேர்ந்தெடு';

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
  String get logout => 'வெளியேற்றம்';

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
  String get group => 'குழு';

  @override
  String get calls => 'அழைப்புகள்';

  @override
  String get done => 'Done!';

  @override
  String get taskCompletedSuccessfully => 'Task is completed\nsuccessfully';

  @override
  String get goBack => 'Go Back';

  @override
  String get signupSuccessMessage => 'You\'ve signed up \nsuccessfully';

  @override
  String get chatBackup => 'அரட்டை காப்புப்பிரதி';

  @override
  String get chatBackupDescription =>
      'உங்கள் பழைய செய்திகள் மீட்பு விசையுடன் பாதுகாக்கப்படுகின்றன. நீங்கள் அதை இழக்கவில்லை என்பதை உறுதிப்படுத்திக் கொள்ளுங்கள்.';

  @override
  String get chatDetails => 'அரட்டை விவரங்கள்';

  @override
  String get chatHasBeenAddedToThisSpace =>
      'இந்த இடத்தில் அரட்டை சேர்க்கப்பட்டுள்ளது';

  @override
  String get chats => 'அரட்டைகள்';

  @override
  String get chooseAStrongPassword => 'வலுவான கடவுச்சொல்லைத் தேர்வுசெய்க';

  @override
  String get clearArchive => 'தெளிவான காப்பகம்';

  @override
  String get close => 'மூடு';

  @override
  String get commandHint_markasdm =>
      'கொடுக்கப்பட்ட மேட்ரிக்சிற்கான நேரடி செய்தி அறையாக குறிக்கவும்';

  @override
  String get commandHint_markasgroup => 'குழுவாக குறி';

  @override
  String get commandHint_ban =>
      'கொடுக்கப்பட்ட பயனரை இந்த அறையிலிருந்து தடை செய்யுங்கள்';

  @override
  String get commandHint_clearcache => 'தெளிவான தற்காலிக சேமிப்பு';

  @override
  String get commandHint_create =>
      'வெற்று குழு அரட்டையை உருவாக்கவும்\n குறியாக்கத்தை முடக்க-இல்லை-குறியாக்கத்தைப் பயன்படுத்தவும்';

  @override
  String get commandHint_discardsession => 'அமர்வை நிராகரிக்கவும்';

  @override
  String get commandHint_dm =>
      'நேரடி அரட்டையைத் தொடங்கவும்\n குறியாக்கத்தை முடக்க-இல்லை-குறியாக்கத்தைப் பயன்படுத்தவும்';

  @override
  String get commandHint_html => 'உஉகுமொ வடிவமைக்கப்பட்ட உரையை அனுப்பவும்';

  @override
  String get commandHint_invite =>
      'கொடுக்கப்பட்ட பயனரை இந்த அறைக்கு அழைக்கவும்';

  @override
  String get commandHint_join => 'கொடுக்கப்பட்ட அறையில் சேரவும்';

  @override
  String get commandHint_kick =>
      'இந்த அறையிலிருந்து கொடுக்கப்பட்ட பயனரை அகற்றவும்';

  @override
  String get commandHint_leave => 'இந்த அறையை விட்டு விடுங்கள்';

  @override
  String get commandHint_me => 'உங்களை விவரிக்கவும்';

  @override
  String get commandHint_myroomavatar =>
      'இந்த அறைக்கு உங்கள் படத்தை அமைக்கவும் (MXC-URI எழுதியது)';

  @override
  String get commandHint_myroomnick =>
      'இந்த அறைக்கு உங்கள் காட்சி பெயரை அமைக்கவும்';

  @override
  String get commandHint_op =>
      'கொடுக்கப்பட்ட பயனரின் ஆற்றல் மட்டத்தை அமைக்கவும் (இயல்புநிலை: 50)';

  @override
  String get commandHint_plain => 'வடிவமைக்கப்படாத உரையை அனுப்பவும்';

  @override
  String get commandHint_react => 'ஒரு எதிர்வினையாக பதிலை அனுப்பவும்';

  @override
  String get commandHint_send => 'உரையை அனுப்பவும்';

  @override
  String get commandHint_unban =>
      'இந்த அறையிலிருந்து கொடுக்கப்பட்ட பயனரைத் தடுக்கிறது';

  @override
  String get commandInvalid => 'கட்டளை தவறானது';

  @override
  String commandMissing(String command) {
    return '$command என்பது கட்டளை அல்ல.';
  }

  @override
  String get compareEmojiMatch => 'தயவுசெய்து ஈமோசிகளை ஒப்பிடுக';

  @override
  String get compareNumbersMatch => 'எண்களை ஒப்பிடுக';

  @override
  String get configureChat => 'அரட்டையை உள்ளமைக்கவும்';

  @override
  String get confirm => 'உறுதிப்படுத்தவும்';

  @override
  String get connect => 'இணை';

  @override
  String get contactHasBeenInvitedToTheGroup =>
      'குழுவிற்கு தொடர்பு அழைக்கப்பட்டுள்ளது';

  @override
  String get containsDisplayName => 'காட்சி பெயரைக் கொண்டுள்ளது';

  @override
  String get containsUserName => 'பயனர்பெயர் உள்ளது';

  @override
  String get contentHasBeenReported =>
      'உள்ளடக்கம் சேவையக நிர்வாகிகளுக்கு தெரிவிக்கப்பட்டுள்ளது';

  @override
  String get copiedToClipboard => 'இடைநிலைப்பலகைக்கு நகலெடுக்கப்பட்டது';

  @override
  String get copy => 'நகலெடு';

  @override
  String get copyToClipboard => 'இடைநிலைப்பலகைக்கு நகலெடுக்கவும்';

  @override
  String couldNotDecryptMessage(String error) {
    return 'செய்தியை மறைகுறியாக்க முடியவில்லை: $error';
  }

  @override
  String get checkList => 'Check list';

  @override
  String countParticipants(int count) {
    return '$count பங்கேற்பாளர்கள்';
  }

  @override
  String countInvited(int count) {
    return '$count invited';
  }

  @override
  String get create => 'உருவாக்கு';

  @override
  String createdTheChat(String username) {
    return '💬 $username அரட்டையை உருவாக்கினார்';
  }

  @override
  String get createGroup => 'குழுவை உருவாக்கவும்';

  @override
  String get createNewSpace => 'புதிய இடம்';

  @override
  String get currentlyActive => 'தற்போது செயலில் உள்ளது';

  @override
  String get darkTheme => 'இருண்ட';

  @override
  String dateAndTimeOfDay(String date, String timeOfDay) {
    return '$date, $timeOfDay';
  }

  @override
  String dateWithoutYear(String month, String day) {
    return '$month-$day';
  }

  @override
  String dateWithYear(String year, String month, String day) {
    return '$year-$month-$day';
  }

  @override
  String get deactivateAccountWarning =>
      'இது உங்கள் பயனர் கணக்கை செயலிழக்கச் செய்யும். இதை செயல்தவிர்க்க முடியாது! நீங்கள் உறுதியாக இருக்கிறீர்களா?';

  @override
  String get defaultPermissionLevel =>
      'புதிய பயனர்களுக்கான இயல்புநிலை இசைவு நிலை';

  @override
  String get delete => 'நீக்கு';

  @override
  String get deleteAccount => 'கணக்கை நீக்கு';

  @override
  String get deleteMessage => 'செய்தியை நீக்கு';

  @override
  String get device => 'சாதனம்';

  @override
  String get deviceId => 'சாதன ஐடி';

  @override
  String get devices => 'சாதனங்கள்';

  @override
  String get directChats => 'நேரடி அரட்டைகள்';

  @override
  String get allRooms => 'அனைத்து குழு அரட்டைகளும்';

  @override
  String get displaynameHasBeenChanged => 'காட்சி பெயர் மாற்றப்பட்டுள்ளது';

  @override
  String get download => 'Download';

  @override
  String get downloadFile => 'கோப்பைப் பதிவிறக்கவும்';

  @override
  String get edit => 'தொகு';

  @override
  String get editBlockedServers => 'தடுக்கப்பட்ட சேவையகங்களைத் திருத்து';

  @override
  String get chatPermissions => 'அரட்டை அனுமதிகள்';

  @override
  String get editDisplayname => 'காட்சி பெயர் திருத்து';

  @override
  String get editRoomAliases => 'அறை மாற்றுப்பெயர்களைத் திருத்து';

  @override
  String get editRoomAvatar => 'அறை அவதார் திருத்து';

  @override
  String get emoteExists => 'எமோட் ஏற்கனவே உள்ளது!';

  @override
  String get emoteInvalid => 'தவறான எமோட் சார்ட்கோட்!';

  @override
  String get emoteKeyboardNoRecents =>
      'அண்மைக் காலத்தில் பயன்படுத்தப்பட்ட உணர்ச்சிகள் இங்கே தோன்றும் ...';

  @override
  String get emotePacks => 'அறைக்கு எமோட் பொதிகள்';

  @override
  String get emoteSettings => 'எமோட் அமைப்புகள்';

  @override
  String get globalChatId => 'உலகளாவிய அரட்டை ஐடி';

  @override
  String get accessAndVisibility => 'அணுகல் மற்றும் தெரிவுநிலை';

  @override
  String get accessAndVisibilityDescription =>
      'இந்த அரட்டையில் யார் சேர அனுமதிக்கப்படுகிறார்கள், அரட்டையை எவ்வாறு கண்டுபிடிப்பது.';

  @override
  String get customEmojisAndStickers =>
      'தனிப்பயன் ஈமோசிகள் மற்றும் ச்டிக்கர்கள்';

  @override
  String get customEmojisAndStickersBody =>
      'எந்தவொரு அரட்டையிலும் பயன்படுத்தக்கூடிய தனிப்பயன் ஈமோசிகள் அல்லது ச்டிக்கர்களைச் சேர்க்கவும் அல்லது பகிரவும்.';

  @override
  String get emoteShortcode => 'சார்ட்கோட் எமோட்';

  @override
  String get emoteWarnNeedToPick =>
      'நீங்கள் ஒரு எமோட் சார்ட்கோட் மற்றும் ஒரு படத்தை எடுக்க வேண்டும்!';

  @override
  String get emptyChat => 'வெற்று அரட்டை';

  @override
  String get enableEmotesGlobally => 'உலகளவில் எமோட் பேக்கை இயக்கவும்';

  @override
  String get enableEncryption => 'குறியாக்கத்தை இயக்கவும்';

  @override
  String get enableEncryptionWarning =>
      'நீங்கள் இனி குறியாக்கத்தை முடக்க முடியாது. நீங்கள் உறுதியாக இருக்கிறீர்களா?';

  @override
  String get encrypted => 'குறியாக்கப்பட்டது';

  @override
  String get encryption => 'குறியாக்கம்';

  @override
  String get encryptionNotEnabled => 'குறியாக்கம் இயக்கப்படவில்லை';

  @override
  String endedTheCall(String senderName) {
    return '$senderName அழைப்பை முடித்தார்';
  }

  @override
  String get enterAnEmailAddress => 'மின்னஞ்சல் முகவரியை உள்ளிடவும்';

  @override
  String get homeserver => 'ஓம்சர்வர்';

  @override
  String get enterYourHomeserver => 'உங்கள் ஓம்சர்வரை உள்ளிடவும்';

  @override
  String errorObtainingLocation(String error) {
    return 'இருப்பிடத்தைப் பெறுவதில் பிழை: $error';
  }

  @override
  String get everythingReady => 'எல்லாம் தயாராக!';

  @override
  String get extremeOffensive => 'மிகவும் தாக்குதல்';

  @override
  String get fileName => 'கோப்பு பெயர்';

  @override
  String get fluffychat => 'பஞ்சுபோன்ற';

  @override
  String get fontSize => 'எழுத்துரு அளவு';

  @override
  String get forward => 'முன்னோக்கி';

  @override
  String get fromJoining => 'சேருவதிலிருந்து';

  @override
  String get fromTheInvitation => 'அழைப்பிலிருந்து';

  @override
  String get goToTheNewRoom => 'புதிய அறைக்குச் செல்லுங்கள்';

  @override
  String get chatDescriptionHasBeenChanged => 'அரட்டை விளக்கம் மாற்றப்பட்டது';

  @override
  String get groupIsPublic => 'குழு பொது';

  @override
  String get groups => 'குழுக்கள்';

  @override
  String groupWith(String displayname) {
    return '$displayname உடன் குழு';
  }

  @override
  String get guestsAreForbidden => 'விருந்தினர்கள் தடைசெய்யப்பட்டுள்ளனர்';

  @override
  String get guestsCanJoin => 'விருந்தினர்கள் சேரலாம்';

  @override
  String hasWithdrawnTheInvitationFor(String username, String targetName) {
    return '$targetName க்கான அழைப்பை $username திரும்பப் பெற்றுள்ளார்';
  }

  @override
  String get help => 'உதவி';

  @override
  String get hideRedactedEvents => 'திருத்தப்பட்ட நிகழ்வுகளை மறைக்கவும்';

  @override
  String get hideRedactedMessages => 'சரிசெய்யப்பட்ட செய்திகளை மறைக்கவும்';

  @override
  String get hideRedactedMessagesBody =>
      'யாராவது ஒரு செய்தியை மாற்றியமைத்தால், இந்த செய்தி இனி அரட்டையில் காணப்படாது.';

  @override
  String get hideInvalidOrUnknownMessageFormats =>
      'தவறான அல்லது அறியப்படாத செய்தி வடிவங்களை மறைக்கவும்';

  @override
  String get howOffensiveIsThisContent => 'இந்த உள்ளடக்கம் எவ்வளவு ஆபத்தானது?';

  @override
  String get id => 'ஐடி';

  @override
  String get identity => 'முற்றொருமை';

  @override
  String get block => 'தொகுதி';

  @override
  String get blockedUsers => 'தடுக்கப்பட்ட பயனர்கள்';

  @override
  String get blockListDescription =>
      'உங்களை தொந்தரவு செய்யும் பயனர்களைத் தடுக்கலாம். உங்கள் தனிப்பட்ட தொகுதி பட்டியலில் பயனர்களிடமிருந்து எந்த செய்திகளையும் அல்லது அறை அழைப்புகளையும் நீங்கள் பெற முடியாது.';

  @override
  String get blockUsername => 'பயனர்பெயரை புறக்கணிக்கவும்';

  @override
  String get iHaveClickedOnLink => 'நான் இணைப்பைக் சொடுக்கு செய்துள்ளேன்';

  @override
  String get incorrectPassphraseOrKey => 'தவறான கடவுச்சொல் அல்லது மீட்பு விசை';

  @override
  String get inoffensive => 'செயலற்றது';

  @override
  String get inviteContact => 'தொடர்பை அழைக்கவும்';

  @override
  String inviteContactToGroupQuestion(Object contact, Object groupName) {
    return '\"$groupName\" அரட்டைக்கு $contact ஐ அழைக்க விரும்புகிறீர்களா?';
  }

  @override
  String inviteContactToGroup(String groupName) {
    return '$groupName க்கு தொடர்பை அழை';
  }

  @override
  String get noChatDescriptionYet =>
      'அரட்டை விளக்கம் இதுவரை உருவாக்கப்படவில்லை.';

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
      'முன்புற பணி இயங்கும்போது இந்த அறிவிப்பு தோன்றும்.';

  @override
  String get screenSharingTitle => 'திரை பகிர்வு';

  @override
  String get screenSharingDetail =>
      'உங்கள் திரையை FUFFYCHAT இல் பகிர்கிறீர்கள்';

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
    return 'கோப்புகள்';
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
  String get renameChannel => 'Rename channel';

  @override
  String get renameGroupChannel => 'Rename group/channel';

  @override
  String get renameGroup => 'Rename group';

  @override
  String get changeGroupName => 'Change the group name';

  @override
  String get setCustomEmotes => 'தனிப்பயன் உணர்ச்சிகளை அமைக்கவும்';

  @override
  String get whoCanPerformWhichAction => 'எந்த செயலைச் செய்ய முடியும்';

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
  String get pleaseFillOut => 'தயவுசெய்து நிரப்பவும்';

  @override
  String get newGroup => 'புதிய குழு';

  @override
  String get imageGroup => 'Image group';

  @override
  String get groupName => 'குழு பெயர்';

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
  String get messages => 'செய்திகள்';

  @override
  String get decline => 'வீழ்ச்சி';

  @override
  String youInvitedBy(String user) {
    return '📩 நீங்கள் $user ஆல் அழைக்கப்பட்டுள்ளீர்கள்';
  }

  @override
  String get invalidServerName => 'தவறான சேவையக பெயர்';

  @override
  String get archiveRoomDescription =>
      'அரட்டை காப்பகத்திற்கு நகர்த்தப்படும். மற்ற பயனர்கள் நீங்கள் அரட்டையை விட்டுவிட்டீர்கள் என்பதைக் காண முடியும்.';

  @override
  String get hidePresences => 'நிலை பட்டியலை மறைக்கவா?';

  @override
  String get leaveEmptyToClearStatus => 'உங்கள் நிலையை அழிக்க காலியாக விடவும்.';

  @override
  String get removeFromBundle => 'இந்த மூட்டையிலிருந்து அகற்றவும்';

  @override
  String get encryptionSetupRequired =>
      'Encryption setup is required for secure messaging. Please complete the setup in Settings.';

  @override
  String get warning => 'எச்சரிக்கை!';

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
  String get verifyOtherDevice => 'Sevice பிற சாதனத்தை சரிபார்க்கவும்';

  @override
  String get verifyOtherDeviceDescription =>
      'நீங்கள் மற்றொரு சாதனத்தை சரிபார்க்கும்போது, அந்த சாதனங்கள் விசைகளை பரிமாறிக்கொள்ளலாம், உங்கள் ஒட்டுமொத்த பாதுகாப்பை அதிகரிக்கும். So நீங்கள் ஒரு சரிபார்ப்பைத் தொடங்கும்போது, இரண்டு சாதனங்களிலும் பயன்பாட்டில் ஒரு பாப்அப் தோன்றும். நீங்கள் ஒருவருக்கொருவர் ஒப்பிட வேண்டிய தொடர்ச்சியான ஈமோசிகள் அல்லது எண்களைக் காண்பீர்கள். நீங்கள் சரிபார்ப்பைத் தொடங்குவதற்கு முன்பு இரண்டு சாதனங்களையும் எளிதில் வைத்திருப்பது நல்லது. .';

  @override
  String get removeDevicesDescription =>
      'நீங்கள் இந்த சாதனத்திலிருந்து வெளியேறுவீர்கள், இனி செய்திகளைப் பெற முடியாது.';

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
  String get transferSuccessful =>
      'Transfer successful! Transaction details sent to chat.';

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
  String get invited => 'அழைக்கப்பட்டார்';

  @override
  String get redactMessageDescription =>
      'இந்த உரையாடலில் பங்கேற்பாளர்கள் அனைவருக்கும் செய்தி திருத்தப்படும். இதை செயல்தவிர்க்க முடியாது.';

  @override
  String get optionalRedactReason =>
      '(விரும்பினால்) இந்த செய்தியை மாற்றியமைப்பதற்கான காரணம் ...';

  @override
  String invitedUser(String username, String targetName) {
    return '📩 $username $targetName அழைக்கப்பட்டார்';
  }

  @override
  String get invitedUsersOnly => 'பயனர்களை மட்டுமே அழைத்தது';

  @override
  String get inviteForMe => 'எனக்கு அழைக்கவும்';

  @override
  String inviteText(String username, String link) {
    return '$username உங்களை பஞ்சுபோன்றதாக அழைத்தது.\n 1. BMP ஐப் பார்வையிட்டு பயன்பாட்டை நிறுவவும்\n 2. பதிவு செய்யுங்கள் அல்லது உள்நுழைக\n 3. அழைப்பிதழ் இணைப்பைத் திறக்கவும்:\n $link';
  }

  @override
  String get gallery => 'கேலரி';

  @override
  String get document => 'Document';

  @override
  String get location => 'Location';

  @override
  String get contact => 'Contact';

  @override
  String get send => 'அனுப்பு';

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
  String get recoveryKey => 'மீட்பு விசை';

  @override
  String get storeInAndroidKeystore => 'ஆண்ட்ராய்டு கீச்டோரில் சேமிக்கவும்';

  @override
  String get storeInAppleKeyChain => 'ஆப்பிள் கீச்சினில் சேமிக்கவும்';

  @override
  String get storeSecurlyOnThisDevice =>
      'இந்த சாதனத்தில் பாதுகாப்பாக சேமிக்கவும்';

  @override
  String get storeInSecureStorageDescription =>
      'மீட்பு விசையை இந்த சாதனத்தின் பாதுகாப்பான சேமிப்பகத்தில் சேமிக்கவும்.';

  @override
  String get saveKeyManuallyDescription =>
      'கணினி பகிர்வு உரையாடல் அல்லது கிளிப்போர்டைத் தூண்டுவதன் மூலம் இந்த விசையை கைமுறையாக சேமிக்கவும்.';

  @override
  String get pleaseEnterRecoveryKeyDescription =>
      'உங்கள் பழைய செய்திகளைத் திறக்க, முந்தைய அமர்வில் உருவாக்கப்பட்ட உங்கள் மீட்பு விசையை உள்ளிடவும். உங்கள் மீட்பு விசை உங்கள் கடவுச்சொல் அல்ல.';

  @override
  String get unlockOldMessages => 'பழைய செய்திகளைத் திறக்கவும்';

  @override
  String get wrongRecoveryKey =>
      'மன்னிக்கவும் ... இது சரியான மீட்பு விசையாகத் தெரியவில்லை.';

  @override
  String get recoveryKeyLost => 'மீட்பு விசை இழந்ததா?';

  @override
  String get wipeChatBackup =>
      'புதிய மீட்பு விசையை உருவாக்க உங்கள் அரட்டை காப்புப்பிரதியைத் துடைக்கவா?';

  @override
  String get isTyping => 'தட்டச்சு செய்கிறது…';

  @override
  String joinedTheChat(String username) {
    return '👋 $username அரட்டையில் சேர்ந்தார்';
  }

  @override
  String get joinRoom => 'அறையில் சேரவும்';

  @override
  String kicked(String username, String targetName) {
    return '👞 $username $targetName ஐ உதைத்தார்';
  }

  @override
  String kickedAndBanned(String username, String targetName) {
    return '🙅 $username உதைத்து $targetName ஐத் தடை செய்தார்';
  }

  @override
  String get kickFromChat => 'அரட்டையிலிருந்து கிக்';

  @override
  String lastActiveAgo(String localizedTimeShort) {
    return 'கடைசியாக செயலில்: $localizedTimeShort';
  }

  @override
  String get leave => 'விடுப்பு';

  @override
  String get leftTheChat => 'அரட்டையை விட்டு வெளியேறினார்';

  @override
  String get license => 'உரிமம்';

  @override
  String get lightTheme => 'ஒளி';

  @override
  String loadCountMoreParticipants(int count) {
    return 'ஏற்றவும் $count மேலும் பங்கேற்பாளர்கள்';
  }

  @override
  String get dehydrate => 'ஏற்றுமதி அமர்வு மற்றும் சாதனத்தை துடைக்கவும்';

  @override
  String get dehydrateWarning =>
      'இந்த செயலை செயல்தவிர்க்க முடியாது. காப்புப்பிரதி கோப்பை பாதுகாப்பாக சேமித்து வைக்கவும்.';

  @override
  String get dehydrateTor => 'டோர் பயனர்கள்: ஏற்றுமதி அமர்வு';

  @override
  String get dehydrateTorLong =>
      'TOR பயனர்களுக்கு, சாளரத்தை மூடுவதற்கு முன் அமர்வை ஏற்றுமதி செய்ய பரிந்துரைக்கப்படுகிறது.';

  @override
  String get hydrateTor => 'டோர் பயனர்கள்: இறக்குமதி அமர்வு ஏற்றுமதி';

  @override
  String get hydrateTorLong =>
      'உங்கள் அமர்வை கடைசியாக டோரில் ஏற்றுமதி செய்தீர்களா? விரைவாக அதை இறக்குமதி செய்து அரட்டையடிக்கவும்.';

  @override
  String get hydrate => 'காப்பு கோப்பிலிருந்து மீட்டமைக்கவும்';

  @override
  String get loadingPleaseWait => 'ஏற்றுகிறது… தயவுசெய்து காத்திருங்கள்.';

  @override
  String get loadMore => 'மேலும் ஏற்றவும்…';

  @override
  String get locationDisabledNotice =>
      'இருப்பிட சேவைகள் முடக்கப்பட்டுள்ளன. தயவுசெய்து உங்கள் இருப்பிடத்தைப் பகிர்ந்து கொள்ள அவர்களுக்கு உதவவும்.';

  @override
  String get locationPermissionDeniedNotice =>
      'இருப்பிட இசைவு மறுக்கப்பட்டது. உங்கள் இருப்பிடத்தைப் பகிர்ந்து கொள்ள தயவுசெய்து அவர்களுக்கு வழங்குங்கள்.';

  @override
  String get login => 'புகுபதிவு';

  @override
  String logInTo(String homeserver) {
    return '$homeserver இல் உள்நுழைக';
  }

  @override
  String get memberChanges => 'உறுப்பினர் மாற்றங்கள்';

  @override
  String get mention => 'குறிப்பு';

  @override
  String get messagesStyle => 'செய்திகள்:';

  @override
  String get moderator => 'மதிப்பீட்டாளர்';

  @override
  String get muteChat => 'முடக்கு அரட்டை';

  @override
  String get needPantalaimonWarning =>
      'இப்போதைக்கு இறுதி முதல் இறுதி குறியாக்கத்தைப் பயன்படுத்த உங்களுக்கு பாண்டலாயமன் தேவை என்பதை நினைவில் கொள்க.';

  @override
  String get newChat => 'புதிய அரட்டை';

  @override
  String get newMessageInFluffyChat => 'Fuf பஞ்சுபோன்ற புதிய செய்தி';

  @override
  String get newVerificationRequest => 'புதிய சரிபார்ப்பு கோரிக்கை!';

  @override
  String get next => 'அடுத்தது';

  @override
  String get no => 'இல்லை';

  @override
  String get noConnectionToTheServer => 'சேவையகத்துடன் எந்த தொடர்பும் இல்லை';

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
  String get privacy => 'தனியுரிமை';

  @override
  String get notification => 'Notification';

  @override
  String get wallet => 'Wallet';

  @override
  String get allCalls => 'All Calls';

  @override
  String get unreadCalls => 'Unread Calls';

  @override
  String get setChatDescription => 'அரட்டை விளக்கத்தை அமைக்கவும்';

  @override
  String get replaceRoomWithNewerVersion => 'புதிய பதிப்போடு அறையை மாற்றவும்';

  @override
  String get roomUpgradeDescription =>
      'அரட்டை பின்னர் புதிய அறை பதிப்பில் மீண்டும் உருவாக்கப்படும். பங்கேற்பாளர்கள் அனைவருக்கும் புதிய அரட்டைக்கு மாற வேண்டும் என்று அறிவிக்கப்படும். அறை பதிப்புகள் பற்றி மேலும் அறிய https://spec.matrix.org/latest/rooms/';

  @override
  String get usersMustKnock => 'பயனர்கள் தட்ட வேண்டும்';

  @override
  String get noOneCanJoin => 'யாரும் சேர முடியாது';

  @override
  String get restricted => 'தடைசெய்யப்பட்டது';

  @override
  String get knockRestricted => 'நாக் தடை';

  @override
  String get unknown => 'Unknown';

  @override
  String get openGallery => 'திறந்த கேலரி';

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
  String get unsupportedAndroidVersion => 'ஆதரிக்கப்படாத ஆண்ட்ராய்டு பதிப்பு';

  @override
  String get unsupportedAndroidVersionLong =>
      'இந்த அம்சத்திற்கு புதிய ஆண்ட்ராய்டு பதிப்பு தேவைப்படுகிறது. புதுப்பிப்புகள் அல்லது பரம்பரை OS ஆதரவை சரிபார்க்கவும்.';

  @override
  String get available => 'Available';

  @override
  String get typeMessage => 'Type message..';

  @override
  String get report => 'அறிக்கை';

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
  String get messageInfo => 'செய்தி செய்தி';

  @override
  String get pinnMessage => 'Pin message';

  @override
  String get redactMessage => 'திருத்தும் செய்தி';

  @override
  String get reportMessage => 'செய்தி அறிக்கை';

  @override
  String get jumpToLastReadMessage => 'கடைசி வாசிப்பு செய்திக்கு செல்லவும்';

  @override
  String get jump => 'தாவு';

  @override
  String get enterNewChat => 'Enter new chat';

  @override
  String get reopenChat => 'அரட்டையை மீண்டும் திறக்கவும்';

  @override
  String get reply => 'பதில்';

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
  String transferFailed(String error) {
    return 'Transfer failed: $error';
  }

  @override
  String get otherPartyNotLoggedIn =>
      'The other party is currently not logged in and therefore cannot receive messages!';

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
  String get sendAsText => 'உரையாக அனுப்பவும்';

  @override
  String get whyDoYouWantToReportThis =>
      'இதை ஏன் புகாரளிக்க விரும்புகிறீர்கள்?';

  @override
  String get reason => 'காரணம்';

  @override
  String get offensive => 'தாக்குதல்';

  @override
  String get confirmEventUnpin => 'நிகழ்வை நிரந்தரமாக அவிழ்ப்பது உறுதி?';

  @override
  String get noEmotesFound => 'உணர்ச்சிகள் எதுவும் காணப்படவில்லை. .';

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
      'அறை இனி பகிரங்கமாக அணுக முடியாதவுடன் மட்டுமே நீங்கள் குறியாக்கத்தை செயல்படுத்த முடியும்.';

  @override
  String get noGoogleServicesWarning =>
      'ஃபயர்பேச் முகில் செய்தி உங்கள் சாதனத்தில் கிடைக்கவில்லை. இன்னும் புச் அறிவிப்புகளைப் பெற, NTFY ஐ நிறுவ பரிந்துரைக்கிறோம். NTFY அல்லது மற்றொரு ஒருங்கிணைந்த புச் வழங்குநருடன் நீங்கள் தரவு பாதுகாப்பான வழியில் புச் அறிவிப்புகளைப் பெறலாம். நீங்கள் பிளேச்டோரிலிருந்து அல்லது எஃப்-டிராய்டிலிருந்து NTFY ஐ பதிவிறக்கம் செய்யலாம்.';

  @override
  String noMatrixServer(String server1, String server2) {
    return '$server1 என்பது மேட்ரிக்ஸ் சர்வர் இல்லை, அதற்கு பதிலாக $server2 ஐ பயன்படுத்தவா?';
  }

  @override
  String get shareInviteLink => 'இணைப்பைப் பகிரவும்';

  @override
  String get scanQrCode => 'QR குறியீட்டை ச்கேன் செய்யுங்கள்';

  @override
  String get none => 'எதுவுமில்லை';

  @override
  String get noPasswordRecoveryDescription =>
      'உங்கள் கடவுச்சொல்லை மீட்டெடுப்பதற்கான வழியை நீங்கள் இன்னும் சேர்க்கவில்லை.';

  @override
  String get noPermission => 'இசைவு இல்லை';

  @override
  String get noRoomsFound => 'அறைகள் எதுவும் கிடைக்கவில்லை…';

  @override
  String get notifications => 'அறிவிப்புகள்';

  @override
  String get notificationsEnabledForThisAccount =>
      'இந்த கணக்கிற்கு அறிவிப்புகள் இயக்கப்பட்டன';

  @override
  String numUsersTyping(int count) {
    return '$count பயனர்கள் தட்டச்சு செய்கிறார்கள்…';
  }

  @override
  String get obtainingLocation => 'இருப்பிடத்தைப் பெறுதல்…';

  @override
  String get locationFound => 'Location Found';

  @override
  String get otherPartyCannotReceiveEncryptedMessages =>
      'Other party cannot receive encrypted messages';

  @override
  String get accuracy => 'Accuracy';

  @override
  String get offline => 'இணையமில்லாமல்';

  @override
  String get ok => 'சரி';

  @override
  String get online => 'ஆன்லைனில்';

  @override
  String get onlineKeyBackupEnabled =>
      'நிகழ்நிலை விசை காப்புப்பிரதி இயக்கப்பட்டது';

  @override
  String get oopsPushError =>
      'அச்சச்சோ! துரதிர்ச்டவசமாக, புச் அறிவிப்புகளை அமைக்கும் போது பிழை ஏற்பட்டது.';

  @override
  String get oopsSomethingWentWrong => 'அச்சச்சோ, ஏதோ தவறு நடந்தது…';

  @override
  String get openAppToReadMessages =>
      'செய்திகளைப் படிக்க பயன்பாட்டைத் திறக்கவும்';

  @override
  String get openCamera => 'திறந்த கேமரா';

  @override
  String get openVideoCamera => 'வீடியோவுக்கு கேமரா திறக்கவும்';

  @override
  String get oneClientLoggedOut =>
      'உங்கள் வாடிக்கையாளர்களில் ஒருவர் உள்நுழைந்துள்ளார்';

  @override
  String get addAccount => 'கணக்கைச் சேர்க்கவும்';

  @override
  String get editBundlesForAccount =>
      'இந்த கணக்கிற்கான மூட்டைகளைத் திருத்தவும்';

  @override
  String get addToBundle => 'மூட்டையில் சேர்க்கவும்';

  @override
  String get bundleName => 'மூட்டை பெயர்';

  @override
  String get enableMultiAccounts =>
      '(பீட்டா) இந்த சாதனத்தில் பல கணக்குகளை இயக்கவும்';

  @override
  String get openInMaps => 'வரைபடங்களில் திறந்திருக்கும்';

  @override
  String get link => 'இணைப்பு';

  @override
  String get serverRequiresEmail =>
      'இந்த சேவையகம் பதிவுக்கு உங்கள் மின்னஞ்சல் முகவரியை சரிபார்க்க வேண்டும்.';

  @override
  String get or => 'அல்லது';

  @override
  String get participant => 'பங்கேற்பாளர்';

  @override
  String get passphraseOrKey => 'கடவுச்சொல் அல்லது மீட்பு விசை';

  @override
  String get password => 'கடவுச்சொல்';

  @override
  String get passwordForgotten => 'கடவுச்சொல் மறந்துவிட்டது';

  @override
  String get passwordHasBeenChanged => 'கடவுச்சொல் மாற்றப்பட்டுள்ளது';

  @override
  String get hideMemberChangesInPublicChats =>
      'பொது அரட்டைகளில் உறுப்பினர் மாற்றங்களை மறைக்கவும்';

  @override
  String get hideMemberChangesInPublicChatsBody =>
      'வாசிப்புத்திறனை மேம்படுத்த யாராவது ஒரு பொது அரட்டையில் சேர்ந்தால் அல்லது விட்டுவிட்டால் அரட்டை காலவரிசையில் காட்ட வேண்டாம்.';

  @override
  String get overview => 'கண்ணோட்டம்';

  @override
  String get notifyMeFor => 'எனக்கு அறிவிக்கவும்';

  @override
  String get passwordRecoverySettings => 'கடவுச்சொல் மீட்பு அமைப்புகள்';

  @override
  String get passwordRecovery => 'கடவுச்சொல் மீட்பு';

  @override
  String get people => 'மக்கள்';

  @override
  String get pickImage => 'ஒரு படத்தைத் தேர்ந்தெடுக்கவும்';

  @override
  String get pin => 'முள்';

  @override
  String play(String fileName) {
    return 'Play $fileName';
  }

  @override
  String get pleaseChoose => 'தயவுசெய்து தேர்வு செய்யவும்';

  @override
  String get pleaseChooseAPasscode => 'பாச் குறியீட்டைத் தேர்வுசெய்க';

  @override
  String get pleaseClickOnLink =>
      'மின்னஞ்சலில் உள்ள இணைப்பைக் சொடுக்கு செய்து தொடரவும்.';

  @override
  String get pleaseEnter4Digits =>
      'பயன்பாட்டு பூட்டை முடக்க 4 இலக்கங்களை உள்ளிடவும் அல்லது காலியாக விடவும்.';

  @override
  String get pleaseEnterRecoveryKey => 'உங்கள் மீட்பு விசையை உள்ளிடவும்:';

  @override
  String get pleaseEnterYourPassword => 'உங்கள் கடவுச்சொல்லை உள்ளிடவும்';

  @override
  String get pleaseEnterYourPin => 'உங்கள் முள் உள்ளிடவும்';

  @override
  String get pleaseEnterYourUsername => 'உங்கள் பயனர்பெயரை உள்ளிடவும்';

  @override
  String get pleaseFollowInstructionsOnWeb =>
      'வலைத்தளத்தின் வழிமுறைகளைப் பின்பற்றி அடுத்து தட்டவும்.';

  @override
  String get publicRooms => 'பொது அறைகள்';

  @override
  String get pushRules => 'தள்ளி விதிகள்';

  @override
  String get recording => 'பதிவு';

  @override
  String redactedBy(String username) {
    return '$username ஆல் திருத்தப்பட்டது';
  }

  @override
  String get directChat => 'நேரடி அரட்டை';

  @override
  String redactedByBecause(String username, String reason) {
    return '$username ஆல் திருத்தப்பட்டது ஏனெனில்: \"$reason\"';
  }

  @override
  String redactedAnEvent(String username) {
    return '$username ஒரு நிகழ்வை மறுவடிவமைத்தது';
  }

  @override
  String get register => 'பதிவு செய்யுங்கள்';

  @override
  String get reject => 'நிராகரிக்கவும்';

  @override
  String rejectedTheInvitation(String username) {
    return '$username அழைப்பை நிராகரித்தது';
  }

  @override
  String get rejoin => 'மீண்டும் சேரவும்';

  @override
  String get removeAllOtherDevices => 'மற்ற எல்லா சாதனங்களையும் அகற்றவும்';

  @override
  String removedBy(String username) {
    return '$username ஆல் அகற்றப்பட்டது';
  }

  @override
  String get removeDevice => 'சாதனத்தை அகற்று';

  @override
  String get unbanFromChat => 'அரட்டையிலிருந்து தடையின்றி';

  @override
  String get removeYourAvatar => 'உங்கள் அவதாரத்தை அகற்று';

  @override
  String get requestPermission => 'இசைவு கோருங்கள்';

  @override
  String get roomHasBeenUpgraded => 'அறை மேம்படுத்தப்பட்டுள்ளது';

  @override
  String get roomVersion => 'அறை பதிப்பு';

  @override
  String get saveFile => 'கோப்பை சேமி';

  @override
  String get security => 'பாதுகாப்பு';

  @override
  String seenByUser(String username) {
    return '$username ஆல் பார்த்தது';
  }

  @override
  String get sendAMessage => 'ஒரு செய்தியை அனுப்பவும்';

  @override
  String get sendAudio => 'ஆடியோ அனுப்பவும்';

  @override
  String get sendFile => 'கோப்பு அனுப்பவும்';

  @override
  String get sendImage => 'படத்தை அனுப்பு';

  @override
  String sendImages(int count) {
    return '$count படத்தை அனுப்பு';
  }

  @override
  String get sendMessages => 'செய்திகளை அனுப்பவும்';

  @override
  String get sendOriginal => 'அசல் அனுப்பு';

  @override
  String get sendSticker => 'ச்டிக்கரை அனுப்பவும்';

  @override
  String get sendVideo => 'வீடியோ அனுப்பவும்';

  @override
  String sentAFile(String username) {
    return '📁 $username கோப்பை அனுப்பியுள்ளார்';
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
    return '🎤 $username ஆடியோவை அனுப்பியுள்ளார்';
  }

  @override
  String sentAPicture(String username) {
    return '🖼️ $username படத்தை அனுப்பியுள்ளார்';
  }

  @override
  String sentASticker(String username) {
    return '😊 $username ஒரு ச்டிக்கரை அனுப்பியது';
  }

  @override
  String sentAVideo(String username) {
    return '🎥 $username ஒரு வீடியோவை அனுப்பியுள்ளார்';
  }

  @override
  String sentCallInformations(String senderName) {
    return '$senderName அனுப்பப்பட்ட அழைப்பு செய்தி';
  }

  @override
  String get separateChatTypes =>
      'நேரடி அரட்டைகள் மற்றும் குழுக்களை பிரிக்கவும்';

  @override
  String get setAsCanonicalAlias => 'முதன்மையான மாற்றுப்பெயராக அமைக்கவும்';

  @override
  String get setInvitationLink => 'அழைப்பிதழ் இணைப்பை அமைக்கவும்';

  @override
  String get setPermissionsLevel => 'இசைவு அளவை அமைக்கவும்';

  @override
  String get setStatus => 'நிலையை அமைக்கவும்';

  @override
  String get settings => 'அமைப்புகள்';

  @override
  String get share => 'பங்கு';

  @override
  String sharedTheLocation(String username) {
    return '$username அவற்றின் இருப்பிடத்தைப் பகிர்ந்து கொண்டது';
  }

  @override
  String get shareLocation => 'இருப்பிடத்தைப் பகிரவும்';

  @override
  String get showPassword => 'கடவுச்சொல்லைக் காட்டு';

  @override
  String get presenceStyle => 'இருப்பு:';

  @override
  String get presencesToggle => 'பிற பயனர்களிடமிருந்து நிலை செய்திகளைக் காட்டு';

  @override
  String get singlesignon => 'ஒற்றை அடையாளம்';

  @override
  String get skip => 'தவிர்';

  @override
  String get sourceCode => 'மூலக் குறியீடு';

  @override
  String get spaceIsPublic => 'இடம் பொது';

  @override
  String get spaceName => 'விண்வெளி பெயர்';

  @override
  String startedACall(String senderName) {
    return '$senderName அழைப்பைத் தொடங்கினார்';
  }

  @override
  String get startFirstChat => 'உங்கள் முதல் அரட்டையைத் தொடங்கவும்';

  @override
  String get status => 'நிலை';

  @override
  String get statusExampleMessage => 'இன்று நீங்கள் எப்படி இருக்கிறீர்கள்?';

  @override
  String get submit => 'சமர்ப்பிக்கவும்';

  @override
  String get synchronizingPleaseWait =>
      'ஒத்திசைத்தல்… தயவுசெய்து காத்திருங்கள்.';

  @override
  String synchronizingPleaseWaitCounter(String percentage) {
    return ' Synchronizing  ($percentage%)';
  }

  @override
  String get systemTheme => 'மண்டலம்';

  @override
  String get theyDontMatch => 'அவர்கள் பொருந்தவில்லை';

  @override
  String get theyMatch => 'அவர்கள் பொருந்துகிறார்கள்';

  @override
  String get notFound => 'Not found';

  @override
  String get pinLimitMessage => 'You can only pin up to 3 chats';

  @override
  String get title => 'பஞ்சுபோன்ற';

  @override
  String get toggleFavorite => 'பிடித்ததை மாற்றவும்';

  @override
  String get toggleMuted => 'முடக்கியது';

  @override
  String get toggleUnread => 'மார்க் படிக்க/படிக்கவில்லை';

  @override
  String get tooManyRequestsWarning =>
      'பல கோரிக்கைகள். தயவுசெய்து பின்னர் மீண்டும் முயற்சிக்கவும்!';

  @override
  String get transferFromAnotherDevice => 'மற்றொரு சாதனத்திலிருந்து மாற்றவும்';

  @override
  String get tryToSendAgain => 'மீண்டும் அனுப்ப முயற்சிக்கவும்';

  @override
  String get unavailable => 'கிடைக்கவில்லை';

  @override
  String unbannedUser(String username, String targetName) {
    return '$username தடைசெய்யப்படாத $targetName';
  }

  @override
  String get unblockDevice => 'சாதனத்தைத் தடைசெய்க';

  @override
  String get unknownDevice => 'தெரியாத சாதனம்';

  @override
  String get unknownEncryptionAlgorithm => 'அறியப்படாத குறியாக்க வழிமுறை';

  @override
  String unknownEvent(String type) {
    return 'அறியப்படாத நிகழ்வு \'$type\'';
  }

  @override
  String get unmuteChat => 'மாறுதல் அரட்டை';

  @override
  String get unpin => 'Unpin';

  @override
  String get unreadChats => 'null';

  @override
  String userAndOthersAreTyping(String username, int count) {
    return '$username மற்றும் $count மற்றவர்கள் தட்டச்சு செய்கிறார்கள்…';
  }

  @override
  String userAndUserAreTyping(String username, String username2) {
    return '$username மற்றும் $username2 தட்டச்சு செய்கின்றன…';
  }

  @override
  String userIsTyping(String username) {
    return '$username தட்டச்சு செய்கிறது…';
  }

  @override
  String userLeftTheChat(String username) {
    return '🚪 $username அரட்டையை விட்டு வெளியேறினார்';
  }

  @override
  String get username => 'பயனர்பெயர்';

  @override
  String userSentUnknownEvent(String username, String type) {
    return '$username ஒரு $type நிகழ்வை அனுப்பியது';
  }

  @override
  String get unverified => 'சரிபார்க்கப்படாதது';

  @override
  String get verified => 'சரிபார்க்கப்பட்டது';

  @override
  String get verify => 'சரிபார்க்கவும்';

  @override
  String get verifyStart => 'சரிபார்ப்பைத் தொடங்கவும்';

  @override
  String get verifySuccess => 'நீங்கள் வெற்றிகரமாக சரிபார்த்தீர்கள்!';

  @override
  String get verifyTitle => 'பிற கணக்கை சரிபார்க்கிறது';

  @override
  String get videoCall => 'வீடியோ அழைப்பு';

  @override
  String get visibilityOfTheChatHistory => 'அரட்டை வரலாற்றின் தெரிவுநிலை';

  @override
  String get visibleForAllParticipants =>
      'பங்கேற்பாளர்கள் அனைவருக்கும் தெரியும்';

  @override
  String get visibleForEveryone => 'அனைவருக்கும் தெரியும்';

  @override
  String get voiceMessage => 'குரல் செய்தி';

  @override
  String get waitingPartnerAcceptRequest =>
      'கூட்டாளர் கோரிக்கையை ஏற்றுக்கொள்வதற்காக காத்திருக்கிறார்…';

  @override
  String get waitingPartnerEmoji =>
      'பங்குதாரர் ஈமோசியை ஏற்றுக்கொள்வதற்காக காத்திருக்கிறார்…';

  @override
  String get waitingPartnerNumbers =>
      'பங்குதாரர் எண்களை ஏற்றுக்கொள்வதற்காக காத்திருக்கிறார்…';

  @override
  String get wallpaper => 'வால்பேப்பர்:';

  @override
  String get weSentYouAnEmail =>
      'நாங்கள் உங்களுக்கு ஒரு மின்னஞ்சல் அனுப்பினோம்';

  @override
  String get whoIsAllowedToJoinThisGroup =>
      'இந்த குழுவில் சேர யார் அனுமதிக்கப்படுகிறார்கள்';

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
      'இந்த முகவரிகள் மூலம் உங்கள் கடவுச்சொல்லை மீட்டெடுக்கலாம்.';

  @override
  String get writeAMessage => 'ஒரு செய்தியை எழுதுங்கள்…';

  @override
  String get yes => 'ஆம்';

  @override
  String get you => 'நீங்கள்';

  @override
  String get youAreNoLongerParticipatingInThisChat =>
      'இந்த அரட்டையில் நீங்கள் இனி பங்கேற்கவில்லை';

  @override
  String get youHaveBeenBannedFromThisChat =>
      'இந்த அரட்டையிலிருந்து உங்களுக்கு தடை விதிக்கப்பட்டுள்ளது';

  @override
  String get yourPublicKey => 'உங்கள் பொது விசை';

  @override
  String get time => 'நேரம்';

  @override
  String get messageType => 'செய்தி வகை';

  @override
  String get sender => 'அனுப்புநர்';

  @override
  String get removeFromSpace => 'இடத்திலிருந்து அகற்று';

  @override
  String get addToSpaceDescription =>
      'இந்த அரட்டையைச் சேர்க்க ஒரு இடத்தைத் தேர்ந்தெடுக்கவும்.';

  @override
  String get start => 'தொடங்கு';

  @override
  String get publish => 'வெளியிடுங்கள்';

  @override
  String videoWithSize(String size) {
    return 'வீடியோ ($size)';
  }

  @override
  String get openChat => 'திறந்த அரட்டை';

  @override
  String get markAsRead => 'படித்தபடி குறி';

  @override
  String get reportUser => 'பயனர் புகாரளிக்கவும்';

  @override
  String get dismiss => 'தள்ளுபடி';

  @override
  String reactedWith(String sender, String reaction) {
    return '$sender $reaction உடன் பதிலளித்தார்';
  }

  @override
  String get pinMessage => 'அறைக்கு முள்';

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
  String get emojis => 'ஈமோசிகள்';

  @override
  String get placeCall => 'அழைப்பு அழைப்பு';

  @override
  String get voiceCall => 'குரல் அழைப்பு';

  @override
  String get videoCallsBetaWarning =>
      'வீடியோ அழைப்புகள் தற்போது பீட்டாவில் உள்ளன என்பதை நினைவில் கொள்க. அவர்கள் எதிர்பார்த்தபடி வேலை செய்யக்கூடாது அல்லது எல்லா தளங்களிலும் வேலை செய்யக்கூடாது.';

  @override
  String get experimentalVideoCalls => 'சோதனை வீடியோ அழைப்புகள்';

  @override
  String get emailOrUsername => 'மின்னஞ்சல் அல்லது பயனர்பெயர்';

  @override
  String get indexedDbErrorTitle => 'தனியார் பயன்முறை சிக்கல்கள்';

  @override
  String get indexedDbErrorLong =>
      'செய்தி சேமிப்பு துரதிர்ச்டவசமாக இயல்புநிலையாக தனிப்பட்ட பயன்முறையில் இயக்கப்படவில்லை.\n தயவுசெய்து பார்வையிடவும்\n - பற்றி: கட்டமைப்பு\n - கணம் dom.indexedDB.privateBrowsing.enabled பெறுநர் true\n இல்லையெனில், பஞ்சுபோன்றவை இயக்க முடியாது.';

  @override
  String switchToAccount(String number) {
    return 'கணக்குக்கு மாறவும் $number';
  }

  @override
  String get nextAccount => 'அடுத்த கணக்கு';

  @override
  String get previousAccount => 'முந்தைய கணக்கு';

  @override
  String get addWidget => 'விட்செட்டைச் சேர்க்கவும்';

  @override
  String get widgetVideo => 'ஒளிதோற்றம்';

  @override
  String get widgetEtherpad => 'உரை குறிப்பு';

  @override
  String get widgetJitsi => 'சிட்சி சந்திக்கிறார்';

  @override
  String get widgetCustom => 'தனிப்பயன்';

  @override
  String get widgetName => 'பெயர்';

  @override
  String get widgetUrlError => 'இது சரியான முகவரி அல்ல.';

  @override
  String get widgetNameError => 'காட்சி பெயரை வழங்கவும்.';

  @override
  String get errorAddingWidget => 'விட்செட்டைச் சேர்ப்பதில் பிழை.';

  @override
  String get youRejectedTheInvitation => 'நீங்கள் அழைப்பை நிராகரித்தீர்கள்';

  @override
  String get youJoinedTheChat => 'நீங்கள் அரட்டையில் சேர்ந்தீர்கள்';

  @override
  String get youAcceptedTheInvitation =>
      '👍 நீங்கள் அழைப்பை ஏற்றுக்கொண்டீர்கள்';

  @override
  String youBannedUser(String user) {
    return 'நீங்கள் $user தடை செய்தீர்கள்';
  }

  @override
  String youHaveWithdrawnTheInvitationFor(String user) {
    return '$userக்கான அழைப்பை திரும்பப் பெற்றுவிட்டீர்கள்';
  }

  @override
  String youInvitedToBy(String alias) {
    return 'In இணைப்பு வழியாக நீங்கள் அழைக்கப்பட்டுள்ளீர்கள்:\n $alias';
  }

  @override
  String invitedBy(String user) {
    return '$user அழைத்தார்';
  }

  @override
  String youInvitedUser(String user) {
    return '📩 $user ஐ அழைத்தீர்கள்';
  }

  @override
  String youKicked(String user) {
    return '👞 $userஐ உதைத்துள்ளீர்கள்';
  }

  @override
  String youKickedAndBanned(String user) {
    return '🙅 நீங்கள் உதைத்து தடைசெய்துள்ளீர்கள் $user';
  }

  @override
  String youUnbannedUser(String user) {
    return 'நீங்கள் $user தடைசெய்யவில்லை';
  }

  @override
  String hasKnocked(String user) {
    return '🚪 $user தட்டியது';
  }

  @override
  String userWouldLikeToChangeTheChat(String user) {
    return '$user அரட்டையில் சேர விரும்புகிறார்.';
  }

  @override
  String get noPublicLinkHasBeenCreatedYet =>
      'பொது இணைப்பு இதுவரை உருவாக்கப்படவில்லை';

  @override
  String get knock => 'தட்டவும்';

  @override
  String get users => 'பயனர்கள்';

  @override
  String countFiles(int count) {
    return '$count கோப்புகள்';
  }

  @override
  String get user => 'பயனர்';

  @override
  String get custom => 'தனிப்பயன்';

  @override
  String get callingPermissions => 'அழைப்பு அனுமதிகள்';

  @override
  String get callingAccount => 'அழைப்பு கணக்கு';

  @override
  String get callingAccountDetails =>
      'சொந்த ஆண்ட்ராய்டு டயலர் பயன்பாட்டைப் பயன்படுத்த பஞ்சுபோன்றது அனுமதிக்கிறது.';

  @override
  String get appearOnTop => 'மேலே தோன்றும்';

  @override
  String get appearOnTopDetails =>
      'பயன்பாடு மேலே தோன்ற அனுமதிக்கிறது (நீங்கள் ஏற்கனவே ஒரு அழைப்பு கணக்காக பஞ்சுபோன்ற அமைப்பைக் கொண்டிருந்தால் தேவையில்லை)';

  @override
  String get otherCallingPermissions =>
      'மைக்ரோஃபோன், கேமரா மற்றும் பிற பஞ்சுபோன்ற அனுமதிகள்';

  @override
  String get whyIsThisMessageEncrypted => 'இந்த செய்தி ஏன் படிக்க முடியாதது?';

  @override
  String get noKeyForThisMessage =>
      'இந்த சாதனத்தில் உங்கள் கணக்கில் கையொப்பமிடுவதற்கு முன்பு செய்தி அனுப்பப்பட்டால் இது நிகழலாம்.\n\n அனுப்புநர் உங்கள் சாதனத்தைத் தடுத்துள்ளார் அல்லது இணைய இணைப்பில் ஏதேனும் தவறு ஏற்பட்டுள்ளது.\n\n மற்றொரு அமர்வில் செய்தியைப் படிக்க முடியுமா? அதிலிருந்து செய்தியை மாற்றலாம்! அமைப்புகள்> சாதனங்களுக்குச் சென்று, உங்கள் சாதனங்கள் ஒருவருக்கொருவர் சரிபார்த்துள்ளன என்பதை உறுதிப்படுத்தவும். அடுத்த முறை நீங்கள் அறையைத் திறக்கும்போது, இரண்டு அமர்வுகளும் முன்னணியில் இருக்கும்போது, விசைகள் தானாகவே அனுப்பப்படும்.\n\n வெளியேறும்போது அல்லது சாதனங்களை மாற்றும்போது விசைகளை இழக்க நீங்கள் விரும்பவில்லையா? அமைப்புகளில் அரட்டை காப்புப்பிரதியை நீங்கள் இயக்கியுள்ளீர்கள் என்பதை உறுதிப்படுத்திக் கொள்ளுங்கள்.';

  @override
  String get newSpace => 'புதிய இடம்';

  @override
  String get enterSpace => 'இடத்தை உள்ளிடவும்';

  @override
  String get enterRoom => 'அறையை உள்ளிடவும்';

  @override
  String get allSpaces => 'அனைத்து இடங்களும்';

  @override
  String numChats(String number) {
    return '$number அரட்டைகள்';
  }

  @override
  String get hideUnimportantStateEvents =>
      'முக்கியமற்ற மாநில நிகழ்வுகளை மறைக்கவும்';

  @override
  String get doNotShowAgain => 'மீண்டும் காட்ட வேண்டாம்';

  @override
  String wasDirectChatDisplayName(String oldDisplayName) {
    return 'வெற்று அரட்டை ($oldDisplayName)';
  }

  @override
  String get newSpaceDescription =>
      'உங்கள் அரட்டைகளை ஒருங்கிணைத்து தனியார் அல்லது பொது சமூகங்களை உருவாக்க இடைவெளிகள் உங்களை அனுமதிக்கிறது.';

  @override
  String get encryptThisChat => 'இந்த அரட்டையை குறியாக்கவும்';

  @override
  String get disableEncryptionWarning =>
      'பாதுகாப்பு காரணங்களுக்காக நீங்கள் ஒரு அரட்டையில் குறியாக்கத்தை முடக்க முடியாது, அது இதற்கு முன்பு இயக்கப்பட்டிருக்கிறது.';

  @override
  String get sorryThatsNotPossible => 'மன்னிக்கவும் ... அது சாத்தியமில்லை';

  @override
  String get deviceKeys => 'சாதன விசைகள்:';

  @override
  String get noBackupWarning =>
      'எச்சரிக்கை! அரட்டை காப்புப்பிரதியை இயக்காமல், உங்கள் மறைகுறியாக்கப்பட்ட செய்திகளுக்கான அணுகலை இழப்பீர்கள். வெளியேறுவதற்கு முன் முதலில் அரட்டை காப்புப்பிரதியை இயக்க மிகவும் பரிந்துரைக்கப்படுகிறது.';

  @override
  String get noOtherDevicesFound => 'வேறு சாதனங்கள் எதுவும் கிடைக்கவில்லை';

  @override
  String fileIsTooBigForServer(String max) {
    return 'அனுப்ப முடியவில்லை! சேவையகம் $max வரை இணைப்புகளை மட்டுமே ஆதரிக்கிறது.';
  }

  @override
  String fileHasBeenSavedAt(String path) {
    return 'கோப்பு $path';
  }

  @override
  String get readUpToHere => 'இங்கே படிக்கவும்';

  @override
  String get openLinkInBrowser => 'உலாவியில் திறந்த இணைப்பை திறக்கவும்';

  @override
  String get reportErrorDescription =>
      '😭 ஓ இல்லை. ஏதோ தவறு நடந்தது. நீங்கள் விரும்பினால், இந்த பிழையை டெவலப்பர்களிடம் புகாரளிக்கலாம்.';

  @override
  String get signInWithPassword => 'கடவுச்சொல்லுடன் உள்நுழைக';

  @override
  String get pleaseTryAgainLaterOrChooseDifferentServer =>
      'தயவுசெய்து பின்னர் மீண்டும் முயற்சிக்கவும் அல்லது வேறு சேவையகத்தைத் தேர்வுசெய்க.';

  @override
  String signInWith(String provider) {
    return '$provider மூலம் உள்நுழையவும்';
  }

  @override
  String get profileNotFound =>
      'பயனரை சேவையகத்தில் காண முடியவில்லை. ஒரு இணைப்பு சிக்கல் இருக்கலாம் அல்லது பயனர் இல்லை.';

  @override
  String get setTheme => 'கருப்பொருள் அமைக்கவும்:';

  @override
  String get setColorTheme => 'வண்ண கருப்பொருள் அமைக்கவும்:';

  @override
  String get invite => 'அழைக்கவும்';

  @override
  String get inviteGroupChat => 'Compect குழு அரட்டையை அழைக்கவும்';

  @override
  String get invitePrivateChat => 'தனிப்பட்ட தனியார் அரட்டையை அழைக்கவும்';

  @override
  String get invalidInput => 'தவறான உள்ளீடு!';

  @override
  String wrongPinEntered(int seconds) {
    return 'தவறான முள் நுழைந்தது! $seconds விநாடிகளில் மீண்டும் முயற்சிக்கவும் ...';
  }

  @override
  String get pleaseEnterANumber =>
      'தயவுசெய்து 0 ஐ விட அதிகமான எண்ணை உள்ளிடவும்';

  @override
  String get banUserDescription =>
      'பயனர் அரட்டையிலிருந்து தடைசெய்யப்படுவார், மேலும் அவை தடைசெய்யப்படாத வரை மீண்டும் அரட்டையில் நுழைய முடியாது.';

  @override
  String get unbanUserDescription =>
      'அவர்கள் முயற்சித்தால் பயனர் மீண்டும் அரட்டையை உள்ளிட முடியும்.';

  @override
  String get kickUserDescription =>
      'பயனர் அரட்டையிலிருந்து வெளியேற்றப்படுகிறார், ஆனால் தடை செய்யப்படவில்லை. பொது அரட்டைகளில், பயனர் எந்த நேரத்திலும் மீண்டும் சேரலாம்.';

  @override
  String get makeAdminDescription =>
      'இந்த பயனர் நிர்வாகியை நீங்கள் செய்தவுடன், இதை நீங்கள் செயல்தவிர்க்க முடியாமல் போகலாம், ஏனெனில் அவை உங்களைப் போன்ற அதே அனுமதிகளைக் கொண்டிருக்கும்.';

  @override
  String get pushNotificationsNotAvailable => 'புச் அறிவிப்புகள் கிடைக்கவில்லை';

  @override
  String get learnMore => 'மேலும் அறிக';

  @override
  String get yourGlobalUserIdIs => 'உங்கள் உலகளாவிய பயனர் ஐடி: ';

  @override
  String noUsersFoundWithQuery(String query) {
    return 'துரதிர்ச்டவசமாக \"$query\" உடன் எந்த பயனரையும் காண முடியவில்லை. நீங்கள் ஒரு எழுத்துப்பிழை செய்தீர்களா என்பதை சரிபார்க்கவும்.';
  }

  @override
  String get knocking => 'தட்டுதல்';

  @override
  String chatCanBeDiscoveredViaSearchOnServer(String server) {
    return '$server';
  }

  @override
  String get searchChatsRooms => '#Chats, Us பயனர்களைத் தேடுங்கள் ...';

  @override
  String get nothingFound => 'எதுவும் கிடைக்கவில்லை ...';

  @override
  String get createGroupAndInviteUsers =>
      'ஒரு குழுவை உருவாக்கி பயனர்களை அழைக்கவும்';

  @override
  String get groupCanBeFoundViaSearch => 'தேடல் வழியாக குழுவை காணலாம்';

  @override
  String get startConversation => 'உரையாடலைத் தொடங்குங்கள்';

  @override
  String get commandHint_sendraw => 'மூல சாதொபொகு ஐ அனுப்புங்கள்';

  @override
  String get databaseMigrationTitle => 'தரவுத்தளம் உகந்ததாக உள்ளது';

  @override
  String get databaseMigrationBody =>
      'தயவுசெய்து காத்திருங்கள். இது ஒரு கணம் ஆகலாம்.';

  @override
  String get searchForUsers => '@Users ஐத் தேடுங்கள் ...';

  @override
  String get pleaseEnterYourCurrentPassword =>
      'உங்கள் தற்போதைய கடவுச்சொல்லை உள்ளிடவும்';

  @override
  String get newPassword => 'புதிய கடவுச்சொல்';

  @override
  String get pleaseChooseAStrongPassword => 'வலுவான கடவுச்சொல்லைத் தேர்வுசெய்க';

  @override
  String get passwordsDoNotMatch => 'கடவுச்சொற்கள் பொருந்தவில்லை';

  @override
  String get passwordIsWrong => 'நீங்கள் உள்ளிட்ட கடவுச்சொல் தவறு';

  @override
  String get publicLink => 'பொது இணைப்பு';

  @override
  String get publicChatAddresses => 'பொது அரட்டை முகவரிகள்';

  @override
  String get createNewAddress => 'புதிய முகவரியை உருவாக்கவும்';

  @override
  String get joinSpace => 'விண்வெளியில் சேரவும்';

  @override
  String get publicSpaces => 'பொது இடங்கள்';

  @override
  String get addChatOrSubSpace => 'அரட்டை அல்லது துணை இடத்தைச் சேர்க்கவும்';

  @override
  String get subspace => 'துணை';

  @override
  String get thisDevice => 'இந்த சாதனம்:';

  @override
  String get initAppError => 'பயன்பாட்டைத் தொடங்கும்போது பிழை ஏற்பட்டது';

  @override
  String get userRole => 'பயனர் பங்கு';

  @override
  String minimumPowerLevel(String level) {
    return '$level என்பது குறைந்தபட்ச ஆற்றல் நிலை.';
  }

  @override
  String searchIn(String chat) {
    return 'அரட்டையில் தேடு \"$chat\" ...';
  }

  @override
  String get searchMore => 'மேலும் தேடுங்கள் ...';

  @override
  String databaseBuildErrorBody(String url, String error) {
    return 'SQlite தரவுத்தளத்தை உருவாக்க முடியவில்லை. ஆப்ஸ் தற்போதைக்கு மரபு தரவுத்தளத்தைப் பயன்படுத்த முயற்சிக்கிறது. $url இல் டெவலப்பர்களிடம் இந்தப் பிழையைப் புகாரளிக்கவும். பிழை செய்தி: $error';
  }

  @override
  String sessionLostBody(String url, String error) {
    return 'உங்கள் அமர்வு தொலைந்துவிட்டது. $url இல் டெவலப்பர்களிடம் இந்தப் பிழையைப் புகாரளிக்கவும். பிழை செய்தி: $error';
  }

  @override
  String restoreSessionBody(String url, String error) {
    return 'ஆப்ஸ் இப்போது உங்கள் அமர்வை காப்புப்பிரதியிலிருந்து மீட்டெடுக்க முயற்சிக்கிறது. $url இல் டெவலப்பர்களிடம் இந்தப் பிழையைப் புகாரளிக்கவும். பிழை செய்தி: $error';
  }

  @override
  String forwardMessageTo(String roomName) {
    return 'செய்தியை $roomNameக்கு அனுப்பவா?';
  }

  @override
  String get sendReadReceipts => 'வாசிப்பு ரசீதுகளை அனுப்பவும்';

  @override
  String get sendTypingNotificationsDescription =>
      'அரட்டையில் பங்கேற்பாளர்கள் நீங்கள் ஒரு புதிய செய்தியைத் தட்டச்சு செய்யும் போது காணலாம்.';

  @override
  String get sendReadReceiptsDescription =>
      'அரட்டையில் பங்கேற்பாளர்கள் நீங்கள் ஒரு செய்தியைப் படிக்கும்போது பார்க்கலாம்.';

  @override
  String get formattedMessages => 'வடிவமைக்கப்பட்ட செய்திகள்';

  @override
  String get formattedMessagesDescription =>
      'மார்க் டவுனைப் பயன்படுத்தி தைரியமான உரை போன்ற பணக்கார செய்தி உள்ளடக்கத்தைக் காண்பி.';

  @override
  String get verifyOtherUser => 'Poser மற்ற பயனரை சரிபார்க்கவும்';

  @override
  String get verifyOtherUserDescription =>
      'நீங்கள் மற்றொரு பயனரைச் சரிபார்த்தால், நீங்கள் உண்மையில் யாருக்கு எழுதுகிறீர்கள் என்பது உங்களுக்குத் தெரியும் என்பதை நீங்கள் உறுதியாக நம்பலாம். .\n\n நீங்கள் ஒரு சரிபார்ப்பைத் தொடங்கும்போது, நீங்களும் மற்ற பயனரும் பயன்பாட்டில் ஒரு பாப்அப்பைக் காண்பீர்கள். நீங்கள் ஒருவருக்கொருவர் ஒப்பிட வேண்டிய தொடர்ச்சியான ஈமோசிகள் அல்லது எண்களைக் காண்பீர்கள்.\n\n இதைச் செய்வதற்கான சிறந்த வழி வீடியோ அழைப்பைச் சந்திப்பது அல்லது தொடங்குவது. .';

  @override
  String acceptedKeyVerification(String sender) {
    return '$sender ஏற்றுக்கொள்ளப்பட்ட விசை சரிபார்ப்பு';
  }

  @override
  String canceledKeyVerification(String sender) {
    return '$sender ரத்து செய்யப்பட்ட விசை சரிபார்ப்பு';
  }

  @override
  String completedKeyVerification(String sender) {
    return '$sender நிறைவு செய்யப்பட்ட விசை சரிபார்ப்பு';
  }

  @override
  String isReadyForKeyVerification(String sender) {
    return 'விசை சரிபார்ப்பிற்கு $sender தயாராக உள்ளார்';
  }

  @override
  String requestedKeyVerification(String sender) {
    return '$sender கோரப்பட்ட விசை சரிபார்ப்பு';
  }

  @override
  String startedKeyVerification(String sender) {
    return '$sender விசை சரிபார்ப்பைத் தொடங்கினார்';
  }

  @override
  String get transparent => 'வெளிப்படையானது';

  @override
  String get incomingMessages => 'உள்வரும் செய்திகள்';

  @override
  String get stickers => 'ச்டிக்கர்கள்';

  @override
  String get discover => 'கண்டுபிடி';

  @override
  String get commandHint_ignore =>
      'கொடுக்கப்பட்ட மேட்ரிக்ச் ஐடியை புறக்கணிக்கவும்';

  @override
  String get commandHint_unignore =>
      'கொடுக்கப்பட்ட மேட்ரிக்ச் ஐடியை இணைக்கவும்';

  @override
  String unreadChatsInApp(String appname, String unread) {
    return '$appname: $unread படிக்காத அரட்டைகள்';
  }

  @override
  String get noDatabaseEncryption =>
      'இந்த மேடையில் தரவுத்தள குறியாக்கம் ஆதரிக்கப்படவில்லை';

  @override
  String thereAreCountUsersBlocked(Object count) {
    return 'இப்போது $count பயனர்கள் தடுக்கப்பட்டுள்ளனர்.';
  }

  @override
  String goToSpace(Object space) {
    return 'விண்வெளிக்குச் செல்லுங்கள்: $space';
  }

  @override
  String get youDeletedThisMessage => 'You deleted this message';

  @override
  String get thisMessageWasDeleted => 'This message was deleted';

  @override
  String get refreshing => 'Refreshing...';

  @override
  String get markAsUnread => 'படிக்காத எனக் குறிக்கவும்';

  @override
  String userLevel(int level) {
    return '$level - பயனர்';
  }

  @override
  String moderatorLevel(int level) {
    return '$level - மதிப்பீட்டாளர்';
  }

  @override
  String adminLevel(int level) {
    return '$level - நிர்வாகி';
  }

  @override
  String get changeGeneralChatSettings => 'பொது அரட்டை அமைப்புகளை மாற்றவும்';

  @override
  String get inviteOtherUsers => 'இந்த அரட்டைக்கு மற்ற பயனர்களை அழைக்கவும்';

  @override
  String get changeTheChatPermissions => 'அரட்டை அனுமதிகளை மாற்றவும்';

  @override
  String get changeTheVisibilityOfChatHistory =>
      'அரட்டை வரலாற்றின் தெரிவுநிலையை மாற்றவும்';

  @override
  String get changeTheCanonicalRoomAlias =>
      'முக்கிய பொது அரட்டை முகவரியை மாற்றவும்';

  @override
  String get sendRoomNotifications => 'ஒரு @ROOM அறிவிப்புகளை அனுப்பவும்';

  @override
  String get changeTheDescriptionOfTheGroup =>
      'அரட்டையின் விளக்கத்தை மாற்றவும்';

  @override
  String get chatPermissionsDescription =>
      'இந்த அரட்டையில் சில செயல்களுக்கு எந்த ஆற்றல் நிலை தேவை என்பதை வரையறுக்கவும். 0, 50 மற்றும் 100 ஆற்றல் நிலைகள் பொதுவாக பயனர்கள், மதிப்பீட்டாளர்கள் மற்றும் நிர்வாகிகளைக் குறிக்கின்றன, ஆனால் எந்த தரமும் சாத்தியமாகும்.';

  @override
  String updateInstalled(String version) {
    return '🎉 புதுப்பிப்பு $version நிறுவப்பட்டது!';
  }

  @override
  String get changelog => 'மாற்றபதிவு';

  @override
  String get sendCanceled => 'அனுப்பப்பட்டது ரத்து செய்யப்பட்டது';

  @override
  String get loginWithMatrixId => 'மேட்ரிக்ச்-ஐடியுடன் உள்நுழைக';

  @override
  String get discoverHomeservers => 'ஓம்சர்சர்களைக் கண்டறியவும்';

  @override
  String get whatIsAHomeserver => 'ஓம்சர்வர் என்றால் என்ன?';

  @override
  String get homeserverDescription =>
      'உங்கள் எல்லா தரவுகளும் ஒரு மின்னஞ்சல் வழங்குநரைப் போலவே ஓம்சர்வரில் சேமிக்கப்படுகின்றன. நீங்கள் எந்த ஓம்சர்வரை பயன்படுத்த விரும்புகிறீர்கள் என்பதை நீங்கள் தேர்வு செய்யலாம், அதே நேரத்தில் நீங்கள் எல்லோரிடமும் தொடர்பு கொள்ளலாம். https://invitation.be-mindpower.net/ இல் மேலும் அறிக.';

  @override
  String get doesNotSeemToBeAValidHomeserver =>
      'இணக்கமான ஓம்சர்வர் என்று தெரியவில்லை. தவறான URL?';

  @override
  String get calculatingFileSize => 'கோப்பு அளவைக் கணக்கிடுகிறது ...';

  @override
  String get prepareSendingAttachment => 'அனுப்பும் இணைப்பைத் தயாரிக்கவும் ...';

  @override
  String get sendingAttachment => 'இணைப்பை அனுப்புகிறது ...';

  @override
  String get generatingVideoThumbnail =>
      'வீடியோ சிறு உருவத்தை உருவாக்குதல் ...';

  @override
  String get compressVideo => 'அமைக்கும் வீடியோ ...';

  @override
  String sendingAttachmentCountOfCount(int index, int length) {
    return '$length இன் இணைப்பு $indexஐ அனுப்புகிறது...';
  }

  @override
  String serverLimitReached(int seconds) {
    return 'சேவையக வரம்பு அடைந்தது! $seconds விநாடிகள் காத்திருக்கிறது ...';
  }

  @override
  String get oneOfYourDevicesIsNotVerified =>
      'உங்கள் சாதனங்களில் ஒன்று சரிபார்க்கப்படவில்லை';

  @override
  String get noticeChatBackupDeviceVerification =>
      'குறிப்பு: உங்கள் எல்லா சாதனங்களையும் அரட்டை காப்புப்பிரதியுடன் இணைக்கும்போது, அவை தானாகவே சரிபார்க்கப்படும்.';

  @override
  String get continueText => 'தொடரவும்';

  @override
  String get welcomeText =>
      'ஏய் ஏய் 👋 இது பஞ்சுபோன்றது. https://invitation.be-mindpower.net/ உடன் இணக்கமான எந்த ஓம்சர்வரில் நீங்கள் உள்நுழையலாம். பின்னர் யாருடனும் அரட்டையடிக்கவும். இது ஒரு பெரிய பரவலாக்கப்பட்ட செய்தியிடல் நெட்வொர்க்!';

  @override
  String get blur => 'மங்கலானது:';

  @override
  String get opacity => 'ஒளிபுகாநிலை:';

  @override
  String get setWallpaper => 'வால்பேப்பரை அமைக்கவும்';

  @override
  String get manageAccount => 'கணக்கை நிர்வகிக்கவும்';

  @override
  String get noContactInformationProvided =>
      'சேவையகம் எந்த சரியான தொடர்பு தகவலையும் வழங்காது';

  @override
  String get contactServerAdmin => 'சேவையக நிர்வாகி தொடர்பு';

  @override
  String get contactServerSecurity => 'சேவையக பாதுகாப்பைத் தொடர்பு கொள்ளுங்கள்';

  @override
  String get supportPage => 'உதவி பக்கம்';

  @override
  String get serverInformation => 'சேவையக தகவல்:';

  @override
  String get name => 'பெயர்';

  @override
  String get version => 'பதிப்பு';

  @override
  String get website => 'வலைத்தளம்';

  @override
  String get compress => 'சுருக்க';

  @override
  String get boldText => 'தைரியமான உரை';

  @override
  String get italicText => 'சாய்வு உரை';

  @override
  String get strikeThrough => 'ச்ட்ரைகெத்ரோ';

  @override
  String get invalidUrl => 'தவறான முகவரி';

  @override
  String get addLink => 'இணைப்பைச் சேர்க்கவும்';

  @override
  String get unableToJoinChat =>
      'அரட்டையில் சேர முடியவில்லை. ஒருவேளை மற்ற கட்சி ஏற்கனவே உரையாடலை மூடியிருக்கலாம்.';

  @override
  String get previous => 'Previous';

  @override
  String appWantsToUseForLogin(String server) {
    return 'Use \'$server\' to log in';
  }

  @override
  String get appWantsToUseForLoginDescription =>
      'You hereby allow the app and website to share information about you.';

  @override
  String get open => 'Open';

  @override
  String get waitingForServer => 'Waiting for server...';

  @override
  String get appIntroduction =>
      'BMP lets you chat with your friends across different messengers.';

  @override
  String get newChatRequest => ' New chat request';

  @override
  String get contentNotificationSettings => 'Content notification settings';

  @override
  String get generalNotificationSettings => 'General notification settings';

  @override
  String get roomNotificationSettings => 'Room notification settings';

  @override
  String get userSpecificNotificationSettings =>
      'User specific notification settings';

  @override
  String get otherNotificationSettings => 'Other notification settings';

  @override
  String get notificationRuleContainsUserName => 'Contains User Name';

  @override
  String get notificationRuleContainsUserNameDescription =>
      'Notifies the user when a message contains their username.';

  @override
  String get notificationRuleMaster => 'Mute all notifications';

  @override
  String get notificationRuleMasterDescription =>
      'Overrides all other rules and disables all notifications.';

  @override
  String get notificationRuleSuppressNotices => 'Suppress Automated Messages';

  @override
  String get notificationRuleSuppressNoticesDescription =>
      'Suppresses notifications from automated clients like bots.';

  @override
  String get notificationRuleInviteForMe => 'Invite for Me';

  @override
  String get notificationRuleInviteForMeDescription =>
      'Notifies the user when they are invited to a room.';

  @override
  String get notificationRuleMemberEvent => 'Member Event';

  @override
  String get notificationRuleMemberEventDescription =>
      'Suppresses notifications for membership events.';

  @override
  String get notificationRuleIsUserMention => 'User Mention';

  @override
  String get notificationRuleIsUserMentionDescription =>
      'Notifies the user when they are directly mentioned in a message.';

  @override
  String get notificationRuleContainsDisplayName => 'Contains Display Name';

  @override
  String get notificationRuleContainsDisplayNameDescription =>
      'Notifies the user when a message contains their display name.';

  @override
  String get notificationRuleIsRoomMention => 'Room Mention';

  @override
  String get notificationRuleIsRoomMentionDescription =>
      'Notifies the user when there is a room mention.';

  @override
  String get notificationRuleRoomnotif => 'Room Notification';

  @override
  String get notificationRuleRoomnotifDescription =>
      'Notifies the user when a message contains \'@room\'.';

  @override
  String get notificationRuleTombstone => 'Tombstone';

  @override
  String get notificationRuleTombstoneDescription =>
      'Notifies the user about room deactivation messages.';

  @override
  String get notificationRuleReaction => 'Reaction';

  @override
  String get notificationRuleReactionDescription =>
      'Suppresses notifications for reactions.';

  @override
  String get notificationRuleRoomServerAcl => 'Room Server ACL';

  @override
  String get notificationRuleRoomServerAclDescription =>
      'Suppresses notifications for room server access control lists (ACL).';

  @override
  String get notificationRuleSuppressEdits => 'Suppress Edits';

  @override
  String get notificationRuleSuppressEditsDescription =>
      'Suppresses notifications for edited messages.';

  @override
  String get notificationRuleCall => 'Call';

  @override
  String get notificationRuleCallDescription =>
      'Notifies the user about calls.';

  @override
  String get notificationRuleEncryptedRoomOneToOne =>
      'Encrypted Room One-to-One';

  @override
  String get notificationRuleEncryptedRoomOneToOneDescription =>
      'Notifies the user about messages in encrypted one-to-one rooms.';

  @override
  String get notificationRuleRoomOneToOne => 'Room One-to-One';

  @override
  String get notificationRuleRoomOneToOneDescription =>
      'Notifies the user about messages in one-to-one rooms.';

  @override
  String get notificationRuleMessage => 'Message';

  @override
  String get notificationRuleMessageDescription =>
      'Notifies the user about general messages.';

  @override
  String get notificationRuleEncrypted => 'Encrypted';

  @override
  String get notificationRuleEncryptedDescription =>
      'Notifies the user about messages in encrypted rooms.';

  @override
  String get notificationRuleJitsi => 'Jitsi';

  @override
  String get notificationRuleJitsiDescription =>
      'Notifies the user about Jitsi widget events.';

  @override
  String get notificationRuleServerAcl => 'Suppress Server ACL Events';

  @override
  String get notificationRuleServerAclDescription =>
      'Suppresses notifications for Server ACL events.';

  @override
  String unknownPushRule(String rule) {
    return 'Unknown push rule \'$rule\'';
  }

  @override
  String sentVoiceMessage(String sender, String duration) {
    return ' $duration - Voice message from $sender';
  }

  @override
  String get deletePushRuleCanNotBeUndone =>
      'If you delete this notification setting, this can not be undone.';

  @override
  String get more => 'More';

  @override
  String get shareKeysWith => 'Share keys with...';

  @override
  String get shareKeysWithDescription =>
      'Which devices should be trusted so that they can read along your messages in encrypted chats?';

  @override
  String get allDevices => 'All devices';

  @override
  String get crossVerifiedDevicesIfEnabled =>
      'Cross verified devices if enabled';

  @override
  String get crossVerifiedDevices => 'Cross verified devices';

  @override
  String get verifiedDevicesOnly => 'Verified devices only';

  @override
  String get takeAPhoto => 'Take a photo';

  @override
  String get recordAVideo => 'Record a video';

  @override
  String get optionalMessage => '(Optional) message...';

  @override
  String get notSupportedOnThisDevice => 'Not supported on this device';

  @override
  String get approve => 'Approve';

  @override
  String get youHaveKnocked => 'You have knocked';

  @override
  String get pleaseWaitUntilInvited =>
      'Please wait now, until someone from the room invites you.';

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
  String get financeDepositFounds => 'Deposit Founds';

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
      'Let\'s start\n an external account';

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
      'We need some information from you to set up the external account';

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
  String get financePINsDoNotMatch => 'PINs do not match';

  @override
  String get financeOTPSentToEmail => 'OTP sent to your email';

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
  String get fullName => 'Full name';

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
  String get incomingCall => 'Incoming call...';

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
  String get enter4DigitPin => 'Enter a 4-digit PIN';

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
  String get ageRestrictionMessage =>
      'You must be at least 16 years old to register. Learn more about how BMP works.';

  @override
  String get enterPhoneNumberError => 'Please enter a phone number';

  @override
  String get pinSetSuccessfully => 'PIN set successfully';

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
  String phoneNumberMustBeDigits(Object requiredLength) {
    return 'Phone number must be $requiredLength digits';
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
  String get initiateKycProcess => 'Initiate KYC Process';

  @override
  String get acceptTermsAndConditions => 'Accept Terms & Conditions';

  @override
  String get setTransactionPin => 'Set Transaction PIN';

  @override
  String get createFourDigitPin => 'Create a 4-digit PIN for transactions';
}
