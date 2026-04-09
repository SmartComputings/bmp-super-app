// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Ukrainian (`uk`).
class L10nUk extends L10n {
  L10nUk([String locale = 'uk']) : super(locale);

  @override
  String get alwaysUse24HourFormat => 'ні';

  @override
  String get repeatPassword => 'Повторіть пароль';

  @override
  String get notAnImage => 'Не файл зображення.';

  @override
  String get setCustomPermissionLevel =>
      'Встановити рівень користувацьких прав';

  @override
  String get setPermissionsLevelDescription =>
      'Будь ласка, виберіть заздалегідь визначену роль нижче або введіть користувацький рівень прав від 0 до 100.';

  @override
  String get ignoreUser => 'Ігнорувати користувача';

  @override
  String get normalUser => 'Звичайний користувач';

  @override
  String get remove => 'Вилучити';

  @override
  String get importNow => 'Імпортувати зараз';

  @override
  String get importEmojis => 'Імпорт емодзі';

  @override
  String get importFromZipFile => 'Імпорт з файлу .zip';

  @override
  String get exportEmotePack => 'Експортувати набір смайликів у форматі .zip';

  @override
  String get replace => 'Замінити';

  @override
  String get about => 'Про застосунок';

  @override
  String aboutHomeserver(String homeserver) {
    return 'Про $homeserver';
  }

  @override
  String get accept => 'Прийняти';

  @override
  String acceptedTheInvitation(String username) {
    return '👍 $username приймає запрошення';
  }

  @override
  String get account => 'Обліковий запис';

  @override
  String activatedEndToEndEncryption(String username) {
    return '🔐 $username активує наскрізне шифрування';
  }

  @override
  String get addEmail => 'Додати е-пошту';

  @override
  String get confirmMatrixId =>
      'Підтвердьте свій Matrix ID, щоб видалити свій обліковий запис.';

  @override
  String supposedMxid(String mxid) {
    return 'Це має бути $mxid';
  }

  @override
  String get addChatDescription => 'Додати опис бесіди...';

  @override
  String get addToSpace => 'Додати простір';

  @override
  String get admin => 'Адміністратор';

  @override
  String get alias => 'псевдонім';

  @override
  String get all => 'Усі';

  @override
  String get allChats => 'Усі бесіди';

  @override
  String get commandHint_roomupgrade =>
      'Оновити цю кімнату до версії даної кімнати';

  @override
  String get commandHint_googly => 'Надіслати кілька гугл-очей';

  @override
  String get commandHint_cuddle => 'Надіслати пригортайку';

  @override
  String get commandHint_hug => 'Надіслати обійми';

  @override
  String googlyEyesContent(String senderName) {
    return '$senderName надсилає вам гугл-очі';
  }

  @override
  String cuddleContent(String senderName) {
    return '$senderName пригортається до вас';
  }

  @override
  String hugContent(String senderName) {
    return '$senderName обіймає вас';
  }

  @override
  String answeredTheCall(String senderName) {
    return '$senderName відповідає на виклик';
  }

  @override
  String get anyoneCanJoin => 'Будь-хто може приєднатись';

  @override
  String get appLock => 'Блокування застосунку';

  @override
  String get appLockDescription =>
      'Блокувати застосунок, коли не використовується ПІН-код';

  @override
  String get archive => 'Архів';

  @override
  String get unArchive => 'Unarchive';

  @override
  String get areGuestsAllowedToJoin => 'Чи дозволено гостям приєднуватись';

  @override
  String get areYouSure => 'Ви впевнені?';

  @override
  String get areYouSureYouWantToLogout => 'Ви впевнені, що хочете вийти?';

  @override
  String get askSSSSSign =>
      'Для підпису ключа іншого користувача введіть свою парольну фразу або ключ відновлення.';

  @override
  String askVerificationRequest(String username) {
    return 'Прийняти цей запит на підтвердження від $username?';
  }

  @override
  String get autoplayImages =>
      'Автоматично відтворювати анімовані наліпки та емоджі';

  @override
  String badServerLoginTypesException(String serverVersions,
      String supportedVersions, Object suportedVersions) {
    return 'Домашній сервер підтримує такі типи входу:\n$serverVersions\nАле цей застосунок підтримує лише:\n$supportedVersions';
  }

  @override
  String get sendTypingNotifications => 'Надсилати сповіщення про ввід тексту';

  @override
  String get swipeRightToLeftToReply =>
      'Посунути праворуч або ліворуч, щоб відповісти';

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
  String get sendOnEnter => 'Надсилати натисканням Enter';

  @override
  String badServerVersionsException(
      String serverVersions,
      String supportedVersions,
      Object serverVerions,
      Object supoortedVersions,
      Object suportedVersions) {
    return 'Домашній сервер підтримує такі версії специфікацій:\n$serverVersions\nАле цей застосунок підтримує лише $supportedVersions';
  }

  @override
  String countChatsAndCountParticipants(int chats, int participants) {
    return '$chats чати та $participants учасників';
  }

  @override
  String countMembers(int count) {
    return '$count Members';
  }

  @override
  String get noMoreChatsFound => 'Більше чатів не знайдено...';

  @override
  String get noChatsFoundHere =>
      'Бесід ще немає. Розпочніть спілкування натиснувши кнопку нижче. ⤵️';

  @override
  String get joinedChats => 'Приєднані чати';

  @override
  String get unread => 'Непрочитані';

  @override
  String get space => 'Простір';

  @override
  String get spaces => 'Простори';

  @override
  String get banFromChat => 'Заблокувати в бесіді';

  @override
  String get banned => 'Заблоковано';

  @override
  String bannedUser(String username, String targetName) {
    return '$username блокує $targetName';
  }

  @override
  String get blockDevice => 'Заблокувати пристрій';

  @override
  String get blocked => 'Заблоковано';

  @override
  String get botMessages => 'Повідомлення ботів';

  @override
  String get cancel => 'Скасувати';

  @override
  String cantOpenUri(String uri) {
    return 'Не вдалося відкрити URI $uri';
  }

  @override
  String get changeDeviceName => 'Змінити назву пристрою';

  @override
  String changedTheChatAvatar(String username) {
    return '$username змінює аватар бесіди';
  }

  @override
  String changedTheChatDescriptionTo(String username, String description) {
    return '$username змінює опис бесіди на: \'$description\'';
  }

  @override
  String changedTheChatNameTo(String username, String chatname) {
    return '$username змінює назву бесіди на: \'$chatname\'';
  }

  @override
  String changedTheChatPermissions(String username) {
    return '$username змінює права доступу бесіди';
  }

  @override
  String changedTheDisplaynameTo(String username, String displayname) {
    return '$username змінює показуване ім\'я на: \'$displayname\'';
  }

  @override
  String changedTheGuestAccessRules(String username) {
    return '$username змінює правила гостьового доступу';
  }

  @override
  String changedTheGuestAccessRulesTo(String username, String rules) {
    return '$username змінює правила гостьового доступу на: $rules';
  }

  @override
  String changedTheHistoryVisibility(String username) {
    return '$username змінює видимість історії';
  }

  @override
  String changedTheHistoryVisibilityTo(String username, String rules) {
    return '$username змінює видимість історії на: $rules';
  }

  @override
  String changedTheJoinRules(String username) {
    return '$username змінює правила приєднання';
  }

  @override
  String changedTheJoinRulesTo(String username, String joinRules) {
    return '$username змінює правила приєднання на: $joinRules';
  }

  @override
  String changedTheProfileAvatar(String username) {
    return '$username змінює аватар';
  }

  @override
  String changedTheRoomAliases(String username) {
    return '$username змінює псевдоніми кімнати';
  }

  @override
  String changedTheRoomInvitationLink(String username) {
    return '$username змінює посилання для запрошення';
  }

  @override
  String get changePassword => 'Змінити пароль';

  @override
  String get changeTheHomeserver => 'Змінити домашній сервер';

  @override
  String get changeTheme => 'Змінити стиль';

  @override
  String get changeTheNameOfTheGroup => 'Змінити назву групи';

  @override
  String get changeYourAvatar => 'Змінити аватар';

  @override
  String get channelCorruptedDecryptError => 'Шифрування було пошкоджено';

  @override
  String get chat => 'Бесіда';

  @override
  String get yourChatBackupHasBeenSetUp => 'Рез. копію чату налаштовано.';

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
  String get chatDescription => 'Опис бесіди';

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
  String get tryAgain => 'Повторіть спробу';

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
  String get search => 'Пошук';

  @override
  String get select => 'Вибрати';

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
  String get logout => 'Вийти';

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
  String get group => 'Група';

  @override
  String get calls => 'Виклики';

  @override
  String get done => 'Done!';

  @override
  String get taskCompletedSuccessfully => 'Task is completed\nsuccessfully';

  @override
  String get goBack => 'Go Back';

  @override
  String get signupSuccessMessage => 'You\'ve signed up \nsuccessfully';

  @override
  String get chatBackup => 'Резервне копіювання бесіди';

  @override
  String get chatBackupDescription =>
      'Ваші старі повідомлення захищені ключем відновлення. Переконайтеся, що ви не втратите його.';

  @override
  String get chatDetails => 'Подробиці бесіди';

  @override
  String get chatHasBeenAddedToThisSpace => 'Бесіду додано до цього простору';

  @override
  String get chats => 'Бесіди';

  @override
  String get chooseAStrongPassword => 'Виберіть надійний пароль';

  @override
  String get clearArchive => 'Очистити архів';

  @override
  String get close => 'Закрити';

  @override
  String get commandHint_markasdm =>
      'Позначити кімнатою особистого спілкування для надання Matrix ID';

  @override
  String get commandHint_markasgroup => 'Позначити групою';

  @override
  String get commandHint_ban => 'Заблокувати цього користувача кімнати';

  @override
  String get commandHint_clearcache => 'Очистити кеш';

  @override
  String get commandHint_create =>
      'Створіть порожню групову бесіду\nВикористовуйте --no-encryption, щоб вимкнути шифрування';

  @override
  String get commandHint_discardsession => 'Відкинути сеанс';

  @override
  String get commandHint_dm =>
      'Початок особистої бесіди\nВикористовуйте --no-encryption, що вимкнути шифрування';

  @override
  String get commandHint_html => 'Надіслати текст у форматі HTML';

  @override
  String get commandHint_invite =>
      'Запросіть цього користувача до цієї кімнати';

  @override
  String get commandHint_join => 'Приєднатися до цієї кімнати';

  @override
  String get commandHint_kick => 'Вилучити цього користувача з цієї кімнати';

  @override
  String get commandHint_leave => 'Вийти з цієї кімнати';

  @override
  String get commandHint_me => 'Опишіть себе';

  @override
  String get commandHint_myroomavatar =>
      'Встановіть зображення для цієї кімнати (від mxc-uri)';

  @override
  String get commandHint_myroomnick =>
      'Укажіть показуване ім\'я для цієї кімнати';

  @override
  String get commandHint_op =>
      'Укажіть рівень повноважень цього користувача (типово: 50)';

  @override
  String get commandHint_plain => 'Надіслати неформатований текст';

  @override
  String get commandHint_react => 'Надіслати відповідь як реакцію';

  @override
  String get commandHint_send => 'Надіслати текст';

  @override
  String get commandHint_unban =>
      'Розблокувати цього користувача у цій кімнаті';

  @override
  String get commandInvalid => 'Неприпустима команда';

  @override
  String commandMissing(String command) {
    return '$command не є командою.';
  }

  @override
  String get compareEmojiMatch => 'Порівняйте емодзі';

  @override
  String get compareNumbersMatch => 'Порівняйте цифри';

  @override
  String get configureChat => 'Налаштувати бесіду';

  @override
  String get confirm => 'Підтвердити';

  @override
  String get connect => 'Під\'єднатись';

  @override
  String get contactHasBeenInvitedToTheGroup =>
      'Контакт був запрошений в групу';

  @override
  String get containsDisplayName => 'Містить показуване ім’я';

  @override
  String get containsUserName => 'Містить ім’я користувача';

  @override
  String get contentHasBeenReported =>
      'Скаргу на вміст надіслано адміністраторам сервера';

  @override
  String get copiedToClipboard => 'Скопійовано в буфер обміну';

  @override
  String get copy => 'Копіювати';

  @override
  String get copyToClipboard => 'Копіювати до буфера обміну';

  @override
  String couldNotDecryptMessage(String error) {
    return 'Помилка розшифрування повідомлення: $error';
  }

  @override
  String get checkList => 'Контрольний список';

  @override
  String countParticipants(int count) {
    return 'Учасників: $count';
  }

  @override
  String countInvited(int count) {
    return 'Запрошено $count';
  }

  @override
  String get create => 'Створити';

  @override
  String createdTheChat(String username) {
    return '💬 $username створює бесіду';
  }

  @override
  String get createGroup => 'Створити групу';

  @override
  String get createNewSpace => 'Новий простір';

  @override
  String get currentlyActive => 'Зараз у мережі';

  @override
  String get darkTheme => 'Темний';

  @override
  String dateAndTimeOfDay(String date, String timeOfDay) {
    return '$timeOfDay, $date';
  }

  @override
  String dateWithoutYear(String month, String day) {
    return '$day-$month';
  }

  @override
  String dateWithYear(String year, String month, String day) {
    return '$day-$month-$year';
  }

  @override
  String get deactivateAccountWarning =>
      'Це деактивує ваш обліковий запис. Це неможливо скасувати! Ви впевнені?';

  @override
  String get defaultPermissionLevel =>
      'Типовий рівень дозволів для нових користувачів';

  @override
  String get delete => 'Видалити';

  @override
  String get deleteAccount => 'Видалити обліковий запис';

  @override
  String get deleteMessage => 'Видалити повідомлення';

  @override
  String get device => 'Пристрій';

  @override
  String get deviceId => 'ID пристрою';

  @override
  String get devices => 'Пристрої';

  @override
  String get directChats => 'Особисті бесіди';

  @override
  String get allRooms => 'Усі групові бесіди';

  @override
  String get displaynameHasBeenChanged => 'Показуване ім\'я було змінено';

  @override
  String get download => 'Download';

  @override
  String get downloadFile => 'Завантажити файл';

  @override
  String get edit => 'Редагувати';

  @override
  String get editBlockedServers => 'Редагувати заблоковані сервери';

  @override
  String get chatPermissions => 'Дозволи бесіди';

  @override
  String get editDisplayname => 'Змінити показуване ім\'я';

  @override
  String get editRoomAliases => 'Змінити псевдоніми кімнати';

  @override
  String get editRoomAvatar => 'Змінити аватар кімнати';

  @override
  String get emoteExists => 'Емодзі вже існує!';

  @override
  String get emoteInvalid => 'Неприпустимий короткий код емодзі!';

  @override
  String get emoteKeyboardNoRecents =>
      'Тут з\'являться нещодавно використані смайлики...';

  @override
  String get emotePacks => 'Набори емоджі для кімнати';

  @override
  String get emoteSettings => 'Налаштування емодзі';

  @override
  String get globalChatId => 'Глобальний ID бесіди';

  @override
  String get accessAndVisibility => 'Доступ і видимість';

  @override
  String get accessAndVisibilityDescription =>
      'Хто може приєднатися до цієї бесіди і як її можна знайти.';

  @override
  String get customEmojisAndStickers => 'Власні емоджі та наліпки';

  @override
  String get customEmojisAndStickersBody =>
      'Додавайте або діліться власними емоджі або наліпками, які можна використовувати в будь-якій бесіді.';

  @override
  String get emoteShortcode => 'Короткий код для емодзі';

  @override
  String get emoteWarnNeedToPick =>
      'Укажіть короткий код емодзі та зображення!';

  @override
  String get emptyChat => 'Порожня бесіда';

  @override
  String get enableEmotesGlobally => 'Увімкнути пакунок емоджі глобально';

  @override
  String get enableEncryption => 'Увімкнути шифрування';

  @override
  String get enableEncryptionWarning =>
      'Ви більше не зможете вимкнути шифрування. Ви впевнені?';

  @override
  String get encrypted => 'Зашифровано';

  @override
  String get encryption => 'Шифрування';

  @override
  String get encryptionNotEnabled => 'Шифрування вимкнено';

  @override
  String endedTheCall(String senderName) {
    return '$senderName завершує виклик';
  }

  @override
  String get enterAnEmailAddress => 'Введіть адресу е-пошти';

  @override
  String get homeserver => 'Домашній сервер';

  @override
  String get enterYourHomeserver => 'Введіть адресу домашнього сервера';

  @override
  String errorObtainingLocation(String error) {
    return 'Помилка під час отримання розташування: $error';
  }

  @override
  String get everythingReady => 'Усе готово!';

  @override
  String get extremeOffensive => 'Украй образливий';

  @override
  String get fileName => 'Назва файлу';

  @override
  String get fluffychat => 'FluffyChat';

  @override
  String get fontSize => 'Розмір шрифту';

  @override
  String get forward => 'Переслати';

  @override
  String get fromJoining => 'З моменту приєднання';

  @override
  String get fromTheInvitation => 'З моменту запрошення';

  @override
  String get goToTheNewRoom => 'Перейти до нової кімнати';

  @override
  String get chatDescriptionHasBeenChanged => 'Опис бесіди змінено';

  @override
  String get groupIsPublic => 'Загальнодоступна група';

  @override
  String get groups => 'Групи';

  @override
  String groupWith(String displayname) {
    return 'Група з $displayname';
  }

  @override
  String get guestsAreForbidden => 'Гості не можуть приєднуватись';

  @override
  String get guestsCanJoin => 'Гості можуть приєднуватись';

  @override
  String hasWithdrawnTheInvitationFor(String username, String targetName) {
    return '$username відкликає запрошення для $targetName';
  }

  @override
  String get help => 'Довідка';

  @override
  String get hideRedactedEvents => 'Сховати змінені події';

  @override
  String get hideRedactedMessages => 'Сховати змінені повідомлення';

  @override
  String get hideRedactedMessagesBody =>
      'Якщо хтось змінить повідомлення, його більше не буде видно в бесіді.';

  @override
  String get hideInvalidOrUnknownMessageFormats =>
      'Сховати недійсні або невідомі формати повідомлень';

  @override
  String get howOffensiveIsThisContent => 'Наскільки образливий цей вміст?';

  @override
  String get id => 'ID';

  @override
  String get identity => 'Ідентифікація';

  @override
  String get block => 'Заблокувати';

  @override
  String get blockedUsers => 'Заблоковані користувачі';

  @override
  String get blockListDescription =>
      'Ви можете заблокувати користувачів, які вас турбують. Ви не зможете отримувати жодних повідомлень або запрошень до кімнати від користувачів з вашого персонального списку блокування.';

  @override
  String get blockUsername => 'Ігнорувати ім\'я користувача';

  @override
  String get iHaveClickedOnLink => 'Мною виконано перехід за посиланням';

  @override
  String get incorrectPassphraseOrKey =>
      'Неправильна парольна фраза або ключ відновлення';

  @override
  String get inoffensive => 'Необразливий';

  @override
  String get inviteContact => 'Запросити контакт';

  @override
  String inviteContactToGroupQuestion(Object contact, Object groupName) {
    return 'Хочете запросити $contact до бесіди \"$groupName\"?';
  }

  @override
  String inviteContactToGroup(String groupName) {
    return 'Запросити контакт до $groupName';
  }

  @override
  String get noChatDescriptionYet => 'Опис бесіди ще не створено.';

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
      'Це сповіщення з\'являється під час роботи основної служби.';

  @override
  String get screenSharingTitle => 'спільний доступ до екрана';

  @override
  String get screenSharingDetail => 'Ви ділитеся своїм екраном FuffyChat';

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
    return 'Файли';
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
  String get setCustomEmotes => 'Установити користувацькі емоджі';

  @override
  String get whoCanPerformWhichAction => 'Хто і яку дію може виконувати';

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
  String get pleaseFillOut => 'Будь ласка, заповніть';

  @override
  String get newGroup => 'Нова група';

  @override
  String get imageGroup => 'Image group';

  @override
  String get groupName => 'Назва групи';

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
  String get messages => 'Повідомлення';

  @override
  String get decline => 'Відхилити';

  @override
  String youInvitedBy(String user) {
    return '📩 Ви були запрошені $user';
  }

  @override
  String get invalidServerName => 'Недійсна назва сервера';

  @override
  String get archiveRoomDescription =>
      'Бесіду буде переміщено до архіву. Інші користувачі зможуть побачити, що ви вийшли з неї.';

  @override
  String get hidePresences => 'Сховати список станів?';

  @override
  String get leaveEmptyToClearStatus => 'Лишіть порожнім, щоб оновити статус.';

  @override
  String get removeFromBundle => 'Вилучити з цього вузла';

  @override
  String get encryptionSetupRequired =>
      'Encryption setup is required for secure messaging. Please complete the setup in Settings.';

  @override
  String get warning => 'Попередження!';

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
  String get verifyOtherDevice => '🔐 Звірити інший пристрій';

  @override
  String get verifyOtherDeviceDescription =>
      'Коли ви звіряєте інший пристрій, ці пристрої можуть обмінюватися ключами, підвищуючи вашу загальну безпеку. 💪 Коли ви розпочнете звірення, в застосунку на обох пристроях з\'явиться спливне вікно. Там ви побачите набір смайликів або чисел, які вам потрібно буде порівняти між собою. Найкраще мати обидва пристрої під рукою перед початком звірення. 🤳';

  @override
  String get removeDevicesDescription =>
      'Ви вийдете з цього пристрою і більше не зможете отримувати повідомлення.';

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
  String get invited => 'Запрошено';

  @override
  String get redactMessageDescription =>
      'Повідомлення буде відредаговано для всіх учасників цієї розмови. Це не можна скасувати.';

  @override
  String get optionalRedactReason =>
      '(Необов\'язково) Причина редагування цього повідомлення...';

  @override
  String invitedUser(String username, String targetName) {
    return '📩 $username запрошує $targetName';
  }

  @override
  String get invitedUsersOnly => 'Лише запрошені користувачі';

  @override
  String get inviteForMe => 'Запрошення для мене';

  @override
  String inviteText(String username, String link) {
    return '$username запрошує вас у BMP. \n1. Зареєструйтесь або ввійдіть \n2. Відкрийте запрошувальне посилання:\n $link';
  }

  @override
  String get gallery => 'Галерея';

  @override
  String get document => 'Document';

  @override
  String get location => 'Location';

  @override
  String get contact => 'Contact';

  @override
  String get send => 'Надіслати';

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
  String get recoveryKey => 'Ключ відновлення';

  @override
  String get storeInAndroidKeystore => 'Зберегти в Android KeyStore';

  @override
  String get storeInAppleKeyChain => 'Зберегти в Apple KeyChain';

  @override
  String get storeSecurlyOnThisDevice => 'Зберегти безпечно на цей пристрій';

  @override
  String get storeInSecureStorageDescription =>
      'Збережіть ключ відновлення в безпечному сховищі цього пристрою.';

  @override
  String get saveKeyManuallyDescription =>
      'Збережіть цей ключ вручну, запустивши діалогове вікно спільного доступу до системи або буфер обміну.';

  @override
  String get pleaseEnterRecoveryKeyDescription =>
      'Щоб розблокувати старі повідомлення, введіть ключ відновлення, згенерований у попередньому сеансі. Ваш ключ відновлення це НЕ ваш пароль.';

  @override
  String get unlockOldMessages => 'Розблокувати старі повідомлення';

  @override
  String get wrongRecoveryKey =>
      'Вибачте... схоже, це неправильний ключ відновлення.';

  @override
  String get recoveryKeyLost => 'Ключ відновлення втрачено?';

  @override
  String get wipeChatBackup =>
      'Стерти резервну копію бесіди, щоб створити новий ключ відновлення?';

  @override
  String get isTyping => 'пише…';

  @override
  String joinedTheChat(String username) {
    return '👋 $username приєднується до бесіди';
  }

  @override
  String get joinRoom => 'Приєднатися до кімнати';

  @override
  String kicked(String username, String targetName) {
    return '👞 $username вилучає $targetName';
  }

  @override
  String kickedAndBanned(String username, String targetName) {
    return '🙅 $username вилучає та блокує $targetName';
  }

  @override
  String get kickFromChat => 'Вилучити з бесіди';

  @override
  String lastActiveAgo(String localizedTimeShort) {
    return 'Остання активність: $localizedTimeShort';
  }

  @override
  String get leave => 'Вийти';

  @override
  String get leftTheChat => 'Виходить з бесіди';

  @override
  String get license => 'Ліцензія';

  @override
  String get lightTheme => 'Світлий';

  @override
  String loadCountMoreParticipants(int count) {
    return 'Завантажити ще $count учасників';
  }

  @override
  String get dehydrate => 'Експортувати сеанс та очистити пристрій';

  @override
  String get dehydrateWarning =>
      'Цю дію не можна скасувати. Переконайтеся, що ви безпечно зберігаєте файл резервної копії.';

  @override
  String get dehydrateTor => 'Користувачі TOR: експорт сеансу';

  @override
  String get dehydrateTorLong =>
      'Для користувачів TOR рекомендується експортувати сеанс перед закриттям вікна.';

  @override
  String get hydrateTor => 'Користувачі TOR: імпорт експортованого сеансу';

  @override
  String get hydrateTorLong =>
      'Минулого разу ви експортували свій сеанс із TOR? Швидко імпортуйте його та продовжуйте спілкування.';

  @override
  String get hydrate => 'Відновлення з файлу резервної копії';

  @override
  String get loadingPleaseWait => 'Завантаження… Будь ласка, зачекайте.';

  @override
  String get loadMore => 'Завантажити ще…';

  @override
  String get locationDisabledNotice =>
      'Служби визначення розташування вимкнені. Увімкніть їх, щоб мати змогу ділитися своїм розташуванням.';

  @override
  String get locationPermissionDeniedNotice =>
      'Дозвіл на розташування відхилено. Надайте можливість ділитися своїм розташуванням.';

  @override
  String get login => 'Увійти';

  @override
  String logInTo(String homeserver) {
    return 'Увійти до $homeserver';
  }

  @override
  String get memberChanges => 'Зміни учасників';

  @override
  String get mention => 'Згадати';

  @override
  String get messagesStyle => 'Повідомлення:';

  @override
  String get moderator => 'Модератор';

  @override
  String get muteChat => 'Вимкнути сповіщення';

  @override
  String get needPantalaimonWarning =>
      'Майте на увазі, що на цей час вам потрібен Pantalaimon, щоб використовувати наскрізне шифрування.';

  @override
  String get newChat => 'Нова бесіда';

  @override
  String get newMessageInFluffyChat => '💬 Нове повідомлення у FluffyChat';

  @override
  String get newVerificationRequest => 'Новий запит перевірки!';

  @override
  String get next => 'Далі';

  @override
  String get no => 'Ні';

  @override
  String get noConnectionToTheServer => 'Немає з\'єднання з сервером';

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
  String get privacy => 'Приватність';

  @override
  String get notification => 'Notification';

  @override
  String get wallet => 'Wallet';

  @override
  String get allCalls => 'All Calls';

  @override
  String get unreadCalls => 'Unread Calls';

  @override
  String get setChatDescription => 'Налаштувати опис бесіди';

  @override
  String get replaceRoomWithNewerVersion => 'Замінити кімнату новішою версією';

  @override
  String get roomUpgradeDescription =>
      'Після цього бесіду буде відтворено з новою версією кімнати. Усі учасники отримають сповіщення, що їм потрібно перейти до нової бесіди. Ви можете дізнатися більше про версії кімнат на https://spec.matrix.org/latest/rooms/';

  @override
  String get usersMustKnock => 'Користувачі повинні постукатись';

  @override
  String get noOneCanJoin => 'Ніхто не може приєднатись';

  @override
  String get restricted => 'Обмежено';

  @override
  String get knockRestricted => 'Стук обмежено';

  @override
  String get unknown => 'Unknown';

  @override
  String get openGallery => 'Відкрити галерею';

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
  String get unsupportedAndroidVersion => 'Непідтримувана версія Android';

  @override
  String get unsupportedAndroidVersionLong =>
      'Для цієї функції потрібна новіша версія Android. Перевірте наявність оновлень або підтримку Lineage OS.';

  @override
  String get available => 'Available';

  @override
  String get typeMessage => 'Type message..';

  @override
  String get report => 'повідомити';

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
  String get messageInfo => 'Відомості про повідомлення';

  @override
  String get pinnMessage => 'Pin message';

  @override
  String get redactMessage => 'Редагувати повідомлення';

  @override
  String get reportMessage => 'Поскаржитися на повідомлення';

  @override
  String get jumpToLastReadMessage =>
      'Перейти до останнього прочитаного повідомлення';

  @override
  String get jump => 'Перейти';

  @override
  String get enterNewChat => 'Створити новий чат';

  @override
  String get reopenChat => 'Відновити бесіду';

  @override
  String get reply => 'Відповісти';

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
      'Інша сторона наразі не увійшла в систему, тому не може отримувати повідомлення!';

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
  String get sendAsText => 'Надіслати як текст';

  @override
  String get whyDoYouWantToReportThis => 'Чому ви хочете поскаржитися?';

  @override
  String get reason => 'Причина';

  @override
  String get offensive => 'Образливий';

  @override
  String get confirmEventUnpin =>
      'Ви впевнені, що бажаєте назавжди відкріпите подію?';

  @override
  String get noEmotesFound => 'Емоджі не знайдено. 😕';

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
      'Активувати шифрування можна лише тоді, коли кімната більше не буде загальнодоступною.';

  @override
  String get noGoogleServicesWarning =>
      'Схоже, Firebase Cloud Messaging недоступна на вашому пристрої. Щоб отримувати push-сповіщення, радимо встановити ntfy. За допомогою ntfy або іншого постачальника Unified Push ви можете отримувати push-сповіщення у безпечний спосіб. Ви можете завантажити ntfy з PlayStore або з F-Droid.';

  @override
  String noMatrixServer(String server1, String server2) {
    return '$server1 не є сервером matrix, використовувати $server2 натомість?';
  }

  @override
  String get shareInviteLink => 'Надіслати запрошувальне посилання';

  @override
  String get scanQrCode => 'Сканувати QR-код';

  @override
  String get none => 'Нічого';

  @override
  String get noPasswordRecoveryDescription =>
      'Ви ще не додали спосіб відновлення пароля.';

  @override
  String get noPermission => 'Немає прав доступу';

  @override
  String get noRoomsFound => 'Кімнат не знайдено…';

  @override
  String get notifications => 'Сповіщення';

  @override
  String get notificationsEnabledForThisAccount =>
      'Сповіщення ввімкнені для цього облікового запису';

  @override
  String numUsersTyping(int count) {
    return '$count користувачів пишуть…';
  }

  @override
  String get obtainingLocation => 'Отримання розташування…';

  @override
  String get locationFound => 'Location Found';

  @override
  String get otherPartyCannotReceiveEncryptedMessages =>
      'Other party cannot receive encrypted messages';

  @override
  String get accuracy => 'Accuracy';

  @override
  String get offline => 'Офлайн';

  @override
  String get ok => 'Гаразд';

  @override
  String get online => 'Онлайн';

  @override
  String get onlineKeyBackupEnabled =>
      'Резервне онлайн-копіювання ключів увімкнено';

  @override
  String get oopsPushError =>
      'Дідько! На жаль, сталася помилка під час налаштування push-сповіщень.';

  @override
  String get oopsSomethingWentWrong => 'Халепа, щось пішло не так…';

  @override
  String get openAppToReadMessages =>
      'Відкрийте застосунок читання повідомлень';

  @override
  String get openCamera => 'Відкрити камеру';

  @override
  String get openVideoCamera => 'Відкрити камеру для відео';

  @override
  String get oneClientLoggedOut =>
      'На одному з ваших клієнтів виконано вихід із системи';

  @override
  String get addAccount => 'Додати обліковий запис';

  @override
  String get editBundlesForAccount =>
      'Змінити вузол для цього облікового запису';

  @override
  String get addToBundle => 'Додати до вузлів';

  @override
  String get bundleName => 'Назва вузла';

  @override
  String get enableMultiAccounts =>
      '(БЕТА) Увімкнути кілька облікових записів на цьому пристрої';

  @override
  String get openInMaps => 'Відкрити в картах';

  @override
  String get link => 'Посилання';

  @override
  String get serverRequiresEmail =>
      'Цей сервер потребує перевірки вашої адресу е-пошти для реєстрації.';

  @override
  String get or => 'Або';

  @override
  String get participant => 'Учасник';

  @override
  String get passphraseOrKey => 'парольна фраза або ключ відновлення';

  @override
  String get password => 'Пароль';

  @override
  String get passwordForgotten => 'Забули пароль';

  @override
  String get passwordHasBeenChanged => 'Пароль змінено';

  @override
  String get hideMemberChangesInPublicChats =>
      'Сховати зміни користувачів у загальнодоступних бесідах';

  @override
  String get hideMemberChangesInPublicChatsBody =>
      'Не показувати в хронології бесіди, якщо хтось приєднується до загальнодоступної бесіди або виходить з неї, щоб покращити її читабельність.';

  @override
  String get overview => 'Огляд';

  @override
  String get notifyMeFor => 'Сповіщати мене про';

  @override
  String get passwordRecoverySettings => 'Налаштування відновлення пароля';

  @override
  String get passwordRecovery => 'Відновлення пароля';

  @override
  String get people => 'Люди';

  @override
  String get pickImage => 'Вибрати зображення';

  @override
  String get pin => 'Закріпити';

  @override
  String play(String fileName) {
    return 'Відтворити $fileName';
  }

  @override
  String get pleaseChoose => 'Виберіть';

  @override
  String get pleaseChooseAPasscode => 'Виберіть код доступу';

  @override
  String get pleaseClickOnLink =>
      'Натисніть на посилання в електронному листі, а потім продовжуйте.';

  @override
  String get pleaseEnter4Digits =>
      'Введіть 4 цифри або залиште порожнім, щоб вимкнути блокування застосунку.';

  @override
  String get pleaseEnterRecoveryKey => 'Введіть ключ відновлення:';

  @override
  String get pleaseEnterYourPassword => 'Введіть свій пароль';

  @override
  String get pleaseEnterYourPin => 'Введіть свій PIN-код';

  @override
  String get pleaseEnterYourUsername => 'Введіть своє ім\'я користувача';

  @override
  String get pleaseFollowInstructionsOnWeb =>
      'Виконайте вказівки вебсайту та торкніться далі.';

  @override
  String get publicRooms => 'Загальнодоступні кімнати';

  @override
  String get pushRules => 'Правила сповіщень';

  @override
  String get recording => 'Запис';

  @override
  String redactedBy(String username) {
    return 'Відредаговано $username';
  }

  @override
  String get directChat => 'Особисте повідомлення';

  @override
  String redactedByBecause(String username, String reason) {
    return 'Відредаговано $username, тому що: \"$reason\"';
  }

  @override
  String redactedAnEvent(String username) {
    return '$username змінює подію';
  }

  @override
  String get register => 'Зареєструватися';

  @override
  String get reject => 'Відхилити';

  @override
  String rejectedTheInvitation(String username) {
    return '$username відхиляє запрошення';
  }

  @override
  String get rejoin => 'Приєднатися знову';

  @override
  String get removeAllOtherDevices => 'Вилучити всі інші пристрої';

  @override
  String removedBy(String username) {
    return 'Вилучено користувачем $username';
  }

  @override
  String get removeDevice => 'Вилучити пристрій';

  @override
  String get unbanFromChat => 'Розблокувати у бесіді';

  @override
  String get removeYourAvatar => 'Вилучити свій аватар';

  @override
  String get requestPermission => 'Запит дозволу';

  @override
  String get roomHasBeenUpgraded => 'Кімнату було оновлено';

  @override
  String get roomVersion => 'Версія кімнати';

  @override
  String get saveFile => 'Зберегти файл';

  @override
  String get security => 'Безпека';

  @override
  String seenByUser(String username) {
    return 'Переглянуто $username';
  }

  @override
  String get sendAMessage => 'Надіслати повідомлення';

  @override
  String get sendAudio => 'Надіслати аудіо';

  @override
  String get sendFile => 'Надіслати файл';

  @override
  String get sendImage => 'Надіслати зображення';

  @override
  String sendImages(int count) {
    return 'Надіслати $count зображення';
  }

  @override
  String get sendMessages => 'Надсилати повідомлення';

  @override
  String get sendOriginal => 'Надіслати оригінал';

  @override
  String get sendSticker => 'Надіслати наліпку';

  @override
  String get sendVideo => 'Надіслати відео';

  @override
  String sentAFile(String username) {
    return '📁 $username надсилає файл';
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
    return '🎤 $username надсилає аудіо';
  }

  @override
  String sentAPicture(String username) {
    return '🖼️ $username надсилає зображення';
  }

  @override
  String sentASticker(String username) {
    return '😊 $username надсилає наліпку';
  }

  @override
  String sentAVideo(String username) {
    return '🎥 $username надсилає відео';
  }

  @override
  String sentCallInformations(String senderName) {
    return '$senderName надсилає відомості про виклик';
  }

  @override
  String get separateChatTypes => 'Розділіть особисті бесіди та групи';

  @override
  String get setAsCanonicalAlias => 'Установити основним псевдонімом';

  @override
  String get setInvitationLink => 'Указати посилання для запрошення';

  @override
  String get setPermissionsLevel => 'Указати рівні дозволів';

  @override
  String get setStatus => 'Указати статус';

  @override
  String get settings => 'Налаштування';

  @override
  String get share => 'Поділитися';

  @override
  String sharedTheLocation(String username) {
    return '$username ділиться своїм місцеперебуванням';
  }

  @override
  String get shareLocation => 'Поділитися місцеперебуванням';

  @override
  String get showPassword => 'Показати пароль';

  @override
  String get presenceStyle => 'Присутність:';

  @override
  String get presencesToggle =>
      'Показувати повідомлення про стан від інших користувачів';

  @override
  String get singlesignon => 'Єдиний вхід';

  @override
  String get skip => 'Пропустити';

  @override
  String get sourceCode => 'Джерельний код';

  @override
  String get spaceIsPublic => 'Простір загальнодоступний';

  @override
  String get spaceName => 'Назва простору';

  @override
  String startedACall(String senderName) {
    return '$senderName розпочинає виклик';
  }

  @override
  String get startFirstChat => 'Розпочніть свою першу бесіду';

  @override
  String get status => 'Статус';

  @override
  String get statusExampleMessage => 'Як справи сьогодні?';

  @override
  String get submit => 'Надіслати';

  @override
  String get synchronizingPleaseWait => 'Синхронізація… Будь ласка, зачекайте.';

  @override
  String synchronizingPleaseWaitCounter(String percentage) {
    return ' Синхронізація… ($percentage%)';
  }

  @override
  String get systemTheme => 'Системна';

  @override
  String get theyDontMatch => 'Вони відрізняються';

  @override
  String get theyMatch => 'Вони збігаються';

  @override
  String get notFound => 'Not found';

  @override
  String get pinLimitMessage => 'You can only pin up to 3 chats';

  @override
  String get title => 'FluffyChat';

  @override
  String get toggleFavorite => 'Перемикнути вибране';

  @override
  String get toggleMuted => 'Увімкнути/вимкнути звук';

  @override
  String get toggleUnread => 'Позначити прочитаним/непрочитаним';

  @override
  String get tooManyRequestsWarning => 'Забагато запитів. Спробуйте пізніше!';

  @override
  String get transferFromAnotherDevice => 'Перенесення з іншого пристрою';

  @override
  String get tryToSendAgain => 'Спробуйте надіслати ще раз';

  @override
  String get unavailable => 'Недоступний';

  @override
  String unbannedUser(String username, String targetName) {
    return '$username розблоковує $targetName';
  }

  @override
  String get unblockDevice => 'Розблокувати пристрій';

  @override
  String get unknownDevice => 'Невідомий пристрій';

  @override
  String get unknownEncryptionAlgorithm => 'Невідомий алгоритм шифрування';

  @override
  String unknownEvent(String type) {
    return 'Невідома подія \'$type\'';
  }

  @override
  String get unmuteChat => 'Увімкнути сповіщення';

  @override
  String get unpin => 'Відкріпити';

  @override
  String get unreadChats => 'null';

  @override
  String userAndOthersAreTyping(String username, int count) {
    return '$username та $count інших пишуть…';
  }

  @override
  String userAndUserAreTyping(String username, String username2) {
    return '$username і $username2 пишуть…';
  }

  @override
  String userIsTyping(String username) {
    return '$username пише…';
  }

  @override
  String userLeftTheChat(String username) {
    return '🚪 $username виходить з бесіди';
  }

  @override
  String get username => 'Ім\'я користувача';

  @override
  String userSentUnknownEvent(String username, String type) {
    return '$username надсилає подію $type';
  }

  @override
  String get unverified => 'Неперевірений';

  @override
  String get verified => 'Перевірений';

  @override
  String get verify => 'Перевірити';

  @override
  String get verifyStart => 'Почати перевірку';

  @override
  String get verifySuccess => 'Ви успішно перевірені!';

  @override
  String get verifyTitle => 'Перевірка іншого облікового запису';

  @override
  String get videoCall => 'Відеовиклик';

  @override
  String get visibilityOfTheChatHistory => 'Видимість історії бесіди';

  @override
  String get visibleForAllParticipants => 'Видима для всіх учасників';

  @override
  String get visibleForEveryone => 'Видима для всіх';

  @override
  String get voiceMessage => 'Голосове повідомлення';

  @override
  String get waitingPartnerAcceptRequest =>
      'Очікування прийняття запиту партнером…';

  @override
  String get waitingPartnerEmoji => 'Очікування прийняття емоджі партнером…';

  @override
  String get waitingPartnerNumbers => 'Очікування прийняття чисел партнером…';

  @override
  String get wallpaper => 'Шпалери:';

  @override
  String get weSentYouAnEmail => 'Ми надіслали вам електронний лист';

  @override
  String get whoIsAllowedToJoinThisGroup =>
      'Кому дозволено приєднуватися до цієї групи';

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
      'За допомогою цих адрес ви можете відновити свій пароль.';

  @override
  String get writeAMessage => 'Написати повідомлення…';

  @override
  String get yes => 'Так';

  @override
  String get you => 'Ви';

  @override
  String get youAreNoLongerParticipatingInThisChat =>
      'Ви більше не берете участь у цій бесіді';

  @override
  String get youHaveBeenBannedFromThisChat =>
      'Ви були заблоковані у цій бесіді';

  @override
  String get yourPublicKey => 'Ваш відкритий ключ';

  @override
  String get time => 'Час';

  @override
  String get messageType => 'Тип повідомлення';

  @override
  String get sender => 'Відправник';

  @override
  String get removeFromSpace => 'Вилучити з простору';

  @override
  String get addToSpaceDescription =>
      'Виберіть простір, щоб додати до нього цю бесіду.';

  @override
  String get start => 'Почати';

  @override
  String get publish => 'Опублікувати';

  @override
  String videoWithSize(String size) {
    return 'Відео ($size)';
  }

  @override
  String get openChat => 'Відкрити бесіду';

  @override
  String get markAsRead => 'Позначити прочитаним';

  @override
  String get reportUser => 'Поскаржився на користувача';

  @override
  String get dismiss => 'Відхилити';

  @override
  String reactedWith(String sender, String reaction) {
    return '$sender реагує з $reaction';
  }

  @override
  String get pinMessage => 'Прикріпити в кімнаті';

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
  String get emojis => 'Емоджі';

  @override
  String get placeCall => 'Здійснити виклик';

  @override
  String get voiceCall => 'Голосовий виклик';

  @override
  String get videoCallsBetaWarning =>
      'Зауважте, що відеовиклики на ранньому етапі розробки. Вони можуть працювати не так, як очікувалося, або взагалі не працювати на всіх платформах.';

  @override
  String get experimentalVideoCalls => 'Експериментальні відеовиклики';

  @override
  String get emailOrUsername => 'Електронна адреса або ім’я користувача';

  @override
  String get indexedDbErrorTitle => 'Проблеми приватного режиму';

  @override
  String get indexedDbErrorLong =>
      'На жаль, сховище повідомлень не ввімкнуто у приватному режимі типово.\nВідкрийте\n - about:config\n - установіть для dom.indexedDB.privateBrowsing.enabled значення true\nІнакше запустити FluffyChat буде неможливо.';

  @override
  String switchToAccount(String number) {
    return 'Перемкнутися на обліковий запис $number';
  }

  @override
  String get nextAccount => 'Наступний обліковий запис';

  @override
  String get previousAccount => 'Попередній обліковий запис';

  @override
  String get addWidget => 'Додати віджет';

  @override
  String get widgetVideo => 'Відео';

  @override
  String get widgetEtherpad => 'Текстова примітка';

  @override
  String get widgetJitsi => 'Jitsi Meet';

  @override
  String get widgetCustom => 'Користувацький';

  @override
  String get widgetName => 'Назва';

  @override
  String get widgetUrlError => 'Це недійсна URL-адреса.';

  @override
  String get widgetNameError => 'Укажіть коротку назву.';

  @override
  String get errorAddingWidget => 'Помилка додавання віджета.';

  @override
  String get youRejectedTheInvitation => 'Ви відхилили запрошення';

  @override
  String get youJoinedTheChat => 'Ви приєдналися до бесіди';

  @override
  String get youAcceptedTheInvitation => '👍 Ви погодилися на запрошення';

  @override
  String youBannedUser(String user) {
    return 'Ви заблокували $user';
  }

  @override
  String youHaveWithdrawnTheInvitationFor(String user) {
    return 'Ви відкликали запрошення для $user';
  }

  @override
  String youInvitedToBy(String alias) {
    return '📩 Вас запрошено за посиланням на:\n$alias';
  }

  @override
  String invitedBy(String user) {
    return '📩 Запрошений $user';
  }

  @override
  String youInvitedUser(String user) {
    return '📩 Ви запросили $user';
  }

  @override
  String youKicked(String user) {
    return '👞 Ви вилучили $user';
  }

  @override
  String youKickedAndBanned(String user) {
    return '🙅 Ви вилучили й заблокували $user';
  }

  @override
  String youUnbannedUser(String user) {
    return 'Ви розблокували $user';
  }

  @override
  String hasKnocked(String user) {
    return '🚪$user стукає до вас';
  }

  @override
  String userWouldLikeToChangeTheChat(String user) {
    return '$user хоче приєднатися до бесіди.';
  }

  @override
  String get noPublicLinkHasBeenCreatedYet =>
      'Загальнодоступне посилання ще не створено';

  @override
  String get knock => 'Постукатись';

  @override
  String get users => 'Користувачі';

  @override
  String countFiles(int count) {
    return '$count файлів';
  }

  @override
  String get user => 'Користувач';

  @override
  String get custom => 'Користувацький';

  @override
  String get callingPermissions => 'Дозволи на виклик';

  @override
  String get callingAccount => 'Обліковий запис для виклику';

  @override
  String get callingAccountDetails =>
      'Дозволяє FluffyChat використовувати основний застосунок Android для набору номера.';

  @override
  String get appearOnTop => 'З\'являтися зверху';

  @override
  String get appearOnTopDetails =>
      'Дозволяє застосунку показуватися зверху (не потрібно, якщо Fluffychat вже налаштований обліковим записом для викликів)';

  @override
  String get otherCallingPermissions =>
      'Мікрофон, камера та інші дозволи FluffyChat';

  @override
  String get whyIsThisMessageEncrypted => 'Чому це повідомлення нечитабельне?';

  @override
  String get noKeyForThisMessage =>
      'Це може статися, якщо повідомлення було надіслано до того, як ви ввійшли у свій обліковий запис на цьому пристрої.\n\nТакож можливо, що відправник заблокував ваш пристрій або щось пішло не так з під\'єднанням до інтернету.\n\nЧи можете ви прочитати повідомлення на іншому сеансі? Тоді ви зможете перенести повідомлення з нього! Перейдіть до Налаштування > Пристрої та переконайтеся, що ваші пристрої перевірили один одного. Коли ви відкриєте кімнату наступного разу й обидва сеанси будуть на активні, ключі будуть передані автоматично.\n\nВи ж не хочете втрачати ключі після виходу або зміни пристроїв? Переконайтеся, що ви ввімкнули резервне копіювання бесід у налаштуваннях.';

  @override
  String get newSpace => 'Новий простір';

  @override
  String get enterSpace => 'Увійти в простір';

  @override
  String get enterRoom => 'Увійти в кімнату';

  @override
  String get allSpaces => 'Усі простори';

  @override
  String numChats(String number) {
    return '$number бесід';
  }

  @override
  String get hideUnimportantStateEvents => 'Сховати неважливі державні свята';

  @override
  String get doNotShowAgain => 'Не показувати знову';

  @override
  String wasDirectChatDisplayName(String oldDisplayName) {
    return 'Порожня бесіда (раніше $oldDisplayName)';
  }

  @override
  String get newSpaceDescription =>
      'Простори дозволяють об\'єднувати ваші бесіди та створювати приватні або загальнодоступні спільноти.';

  @override
  String get encryptThisChat => 'Зашифрувати цю бесіду';

  @override
  String get disableEncryptionWarning =>
      'З міркувань безпеки ви не можете вимкнути шифрування в бесіді, ув якій воно було ввімкнене раніше.';

  @override
  String get sorryThatsNotPossible => 'Вибачте... це неможливо';

  @override
  String get deviceKeys => 'Ключі пристрою:';

  @override
  String get noBackupWarning =>
      'Увага! Якщо ви не ввімкнете резервне копіювання бесіди, ви втратите доступ до своїх зашифрованих повідомлень. Наполегливо радимо ввімкнути резервне копіювання бесіди перед виходом.';

  @override
  String get noOtherDevicesFound => 'Інших пристроїв не знайдено';

  @override
  String fileIsTooBigForServer(String max) {
    return 'Не вдалося надіслати! Сервер підтримує вкладення розміром до $max.';
  }

  @override
  String fileHasBeenSavedAt(String path) {
    return 'Файл збережено в $path';
  }

  @override
  String get readUpToHere => 'Читати тут';

  @override
  String get openLinkInBrowser => 'Відкрити посилання у браузері';

  @override
  String get reportErrorDescription =>
      'О, ні. Щось пішло не так. Якщо хочете, можете повідомити про помилку розробникам.';

  @override
  String get signInWithPassword => 'Увійти за допомогою пароля';

  @override
  String get pleaseTryAgainLaterOrChooseDifferentServer =>
      'Спробуйте пізніше або виберіть інший сервер.';

  @override
  String signInWith(String provider) {
    return 'Увійти через $provider';
  }

  @override
  String get profileNotFound =>
      'Не вдалося знайти користувача на сервері. Можливо, проблема зі з\'єднанням або користувач не існує.';

  @override
  String get setTheme => 'Налаштувати тему:';

  @override
  String get setColorTheme => 'Налаштувати колірну тему:';

  @override
  String get invite => 'Запросити';

  @override
  String get inviteGroupChat => '📨 Запросити до групової бесіди';

  @override
  String get invitePrivateChat => '📨 Запросити до приватної бесіди';

  @override
  String get invalidInput => 'Недійсний ввід!';

  @override
  String wrongPinEntered(int seconds) {
    return 'Введено неправильний PIN! Повторіть спробу за $seconds секунд...';
  }

  @override
  String get pleaseEnterANumber => 'Введіть число більше ніж 0';

  @override
  String get banUserDescription =>
      'Користувача буде заблоковано в бесіді, і він не зможе знову увійти в неї, поки його не буде розблоковано.';

  @override
  String get unbanUserDescription =>
      'Користувач зможе знову увійти в бесіду, якщо спробує.';

  @override
  String get kickUserDescription =>
      'Користувача вигнали з бесіди, але не заблокували. До загальнодоступних бесід користувач може приєднатися будь-коли.';

  @override
  String get makeAdminDescription =>
      'Після того, як ви зробите цього користувача адміністратором, ви, можливо, не зможете це скасувати, оскільки він матиме ті самі права, що й ви.';

  @override
  String get pushNotificationsNotAvailable => 'Push-сповіщення недоступні';

  @override
  String get learnMore => 'Докладніше';

  @override
  String get yourGlobalUserIdIs => 'Ваш глобальний ID користувача: ';

  @override
  String noUsersFoundWithQuery(String query) {
    return 'На жаль, не знайдено жодного користувача з запитом \"$query\".Перевірте, чи не було допущено помилки.';
  }

  @override
  String get knocking => 'Стукаються';

  @override
  String chatCanBeDiscoveredViaSearchOnServer(String server) {
    return 'Бесіду можна знайти за допомогою пошуку на $server';
  }

  @override
  String get searchChatsRooms => 'Пошук для #chats, @users...';

  @override
  String get nothingFound => 'Нічого не знайдено...';

  @override
  String get createGroupAndInviteUsers =>
      'Створити групу та запросити користувачів';

  @override
  String get groupCanBeFoundViaSearch => 'Групу можна знайти через пошук';

  @override
  String get startConversation => 'Розпочати розмову';

  @override
  String get commandHint_sendraw => 'Надіслати необроблений json';

  @override
  String get databaseMigrationTitle => 'Базу даних оптимізовано';

  @override
  String get databaseMigrationBody =>
      'Зачекайте, будь ласка. Це може тривати деякий час.';

  @override
  String get searchForUsers => 'Пошук @користувачів...';

  @override
  String get pleaseEnterYourCurrentPassword => 'Введіть поточний пароль';

  @override
  String get newPassword => 'Новий пароль';

  @override
  String get pleaseChooseAStrongPassword => 'Виберіть надійний пароль';

  @override
  String get passwordsDoNotMatch => 'Паролі відрізняються';

  @override
  String get passwordIsWrong => 'Введений пароль неправильний';

  @override
  String get publicLink => 'Загальнодоступне посилання';

  @override
  String get publicChatAddresses => 'Адреси загальнодоступної бесіди';

  @override
  String get createNewAddress => 'Створити нову адресу';

  @override
  String get joinSpace => 'Приєднатися до простору';

  @override
  String get publicSpaces => 'Загальнодоступний простір';

  @override
  String get addChatOrSubSpace => 'Додати бесіду або підпростір';

  @override
  String get subspace => 'Підпростір';

  @override
  String get thisDevice => 'Цей пристрій:';

  @override
  String get initAppError => 'Виникла помилка під час запуску застосунку';

  @override
  String get userRole => 'Роль користувача';

  @override
  String minimumPowerLevel(String level) {
    return '$level — це найнижчий рівень повноважень.';
  }

  @override
  String searchIn(String chat) {
    return 'Пошук у бесіді \"$chat\"...';
  }

  @override
  String get searchMore => 'Шукати ще...';

  @override
  String databaseBuildErrorBody(String url, String error) {
    return 'Не вдалося створити базу даних SQlite. Застосунок намагається використовувати стару базу даних. Будь ласка, повідомте про цю помилку розробникам за адресою $url. Текст помилки: $error';
  }

  @override
  String sessionLostBody(String url, String error) {
    return 'Ваш сеанс втрачено. Будь ласка, повідомте про цю помилку розробникам за адресою $url. Текст помилки: $error';
  }

  @override
  String restoreSessionBody(String url, String error) {
    return 'Наразі застосунок намагається відновити ваш сеанс з резервної копії. Будь ласка, повідомте про цю помилку розробникам за адресою $url. Текст помилки: $error';
  }

  @override
  String forwardMessageTo(String roomName) {
    return 'Переслати повідомлення до $roomName?';
  }

  @override
  String get sendReadReceipts => 'Надіслати підтвердження прочитання';

  @override
  String get sendTypingNotificationsDescription =>
      'Інші учасники бесіди бачитимуть, коли ви набираєте нове повідомлення.';

  @override
  String get sendReadReceiptsDescription =>
      'Інші учасники бесіди бачитимуть, що ви прочитали повідомлення.';

  @override
  String get formattedMessages => 'Форматовані повідомлення';

  @override
  String get formattedMessagesDescription =>
      'Показувати розширений вміст повідомлень, наприклад, жирний текст, використовуючи markdown.';

  @override
  String get verifyOtherUser => '🔐 Звірити іншого користувача';

  @override
  String get verifyOtherUserDescription =>
      'Якщо ви звіряєте іншого користувача, ви можете бути впевнені, що знаєте, кому ви насправді пишете. 💪\n\nКоли ви почнете звірення, ви та інший користувач побачите спливне вікно в застосунку. Там ви побачите набір смайликів або чисел, які вам потрібно буде порівняти між собою.\n\nНайкращий спосіб зробити це — зустрітися або розпочати відеовиклик. 👭';

  @override
  String acceptedKeyVerification(String sender) {
    return '$sender погоджується звірити ключі';
  }

  @override
  String canceledKeyVerification(String sender) {
    return '$sender скасовує звірення ключів';
  }

  @override
  String completedKeyVerification(String sender) {
    return '$sender завершує звірення ключів';
  }

  @override
  String isReadyForKeyVerification(String sender) {
    return '$sender готовий до звірення ключів';
  }

  @override
  String requestedKeyVerification(String sender) {
    return '$sender просить звірити ключі';
  }

  @override
  String startedKeyVerification(String sender) {
    return '$sender розпочинає звірення ключів';
  }

  @override
  String get transparent => 'Прозорий';

  @override
  String get incomingMessages => 'Вхідні повідомлення';

  @override
  String get stickers => 'Наліпки';

  @override
  String get discover => 'Огляд';

  @override
  String get commandHint_ignore => 'Ігнорувати цей Matrix ID';

  @override
  String get commandHint_unignore => 'Не ігнорувати цей Matrix ID';

  @override
  String unreadChatsInApp(String appname, String unread) {
    return '$appname: $unread непрочитаних бесід';
  }

  @override
  String get noDatabaseEncryption =>
      'Шифрування бази даних не підтримується на цій платформі';

  @override
  String thereAreCountUsersBlocked(Object count) {
    return 'Наразі заблоковано $count користувачів.';
  }

  @override
  String goToSpace(Object space) {
    return 'Перейти до простору: $space';
  }

  @override
  String get youDeletedThisMessage => 'You deleted this message';

  @override
  String get thisMessageWasDeleted => 'This message was deleted';

  @override
  String get refreshing => 'Refreshing...';

  @override
  String get markAsUnread => 'Позначити непрочитаним';

  @override
  String userLevel(int level) {
    return '$level - Користувач';
  }

  @override
  String moderatorLevel(int level) {
    return '$level - Модератор';
  }

  @override
  String adminLevel(int level) {
    return '$level - Адміністратор';
  }

  @override
  String get changeGeneralChatSettings => 'Змінити загальні налаштування чату';

  @override
  String get inviteOtherUsers => 'Запросити інших користувачів до цього чату';

  @override
  String get changeTheChatPermissions => 'Змінити права доступу до чату';

  @override
  String get changeTheVisibilityOfChatHistory =>
      'Змінити видимість історії чату';

  @override
  String get changeTheCanonicalRoomAlias =>
      'Змінити основну адресу загальнодоступного чату';

  @override
  String get sendRoomNotifications => 'Надсилати сповіщення @room';

  @override
  String get changeTheDescriptionOfTheGroup => 'Змінити опис чату';

  @override
  String get chatPermissionsDescription =>
      'Визначте, який рівень повноважень необхідний для певних дій у цьому чаті. Рівні повноважень 0, 50 і 100 зазвичай представляють користувачів, модераторів та адміністраторів, але можливі будь-які градації.';

  @override
  String updateInstalled(String version) {
    return '🎉 Оновлення $version встановлено!';
  }

  @override
  String get changelog => 'Зміни';

  @override
  String get sendCanceled => 'Надсилання скасовано';

  @override
  String get loginWithMatrixId => 'Увійти за допомогою Matrix-ID';

  @override
  String get discoverHomeservers => 'Знайти домашні сервери';

  @override
  String get whatIsAHomeserver => 'Що таке домашній сервер?';

  @override
  String get homeserverDescription =>
      'Усі ваші дані зберігаються на домашньому сервері, так само як у постачальника послуг електронної пошти. Ви можете вибрати, який домашній сервер ви хочете використовувати, водночас ви можете спілкуватися з усіма. Докладніше на https://invitation.be-mindpower.net/.';

  @override
  String get doesNotSeemToBeAValidHomeserver =>
      'Здається, це несумісний домашній сервер. Неправильна URL-адреса?';

  @override
  String get calculatingFileSize => 'Обчислення розміру файлу...';

  @override
  String get prepareSendingAttachment =>
      'Підготовка до надсилання вкладення...';

  @override
  String get sendingAttachment => 'Надсилання вкладення...';

  @override
  String get generatingVideoThumbnail => 'Генерування мініатюри відео...';

  @override
  String get compressVideo => 'Стиснення відео...';

  @override
  String sendingAttachmentCountOfCount(int index, int length) {
    return 'Надсилання вкладення $index з $length...';
  }

  @override
  String serverLimitReached(int seconds) {
    return 'Досягнуто ліміту сервера! Очікування $seconds секунд...';
  }

  @override
  String get oneOfYourDevicesIsNotVerified =>
      'Один із ваших пристроїв не верифікований';

  @override
  String get noticeChatBackupDeviceVerification =>
      'Примітка: Коли ви під\'єднуєте всі свої пристрої до резервної копії бесіди, вони автоматично верифікуються.';

  @override
  String get continueText => 'Продовжити';

  @override
  String get welcomeText =>
      'Привіт-привіт 👋 Це FluffyChat. Ви можете увійти на будь-який сервер, сумісний із https://invitation.be-mindpower.net/. А потім спілкуватися з будь-ким. Це величезна децентралізована мережа для обміну повідомленнями!';

  @override
  String get blur => 'Розмиття:';

  @override
  String get opacity => 'Прозорість:';

  @override
  String get setWallpaper => 'Встановити шпалери';

  @override
  String get manageAccount => 'Керувати обліковим записом';

  @override
  String get noContactInformationProvided =>
      'Сервер не надає жодної дійсної контактної інформації';

  @override
  String get contactServerAdmin => 'Зв’язатися з адміністратором сервера';

  @override
  String get contactServerSecurity => 'Зв’язатися з відділом безпеки сервера';

  @override
  String get supportPage => 'Сторінка підтримки';

  @override
  String get serverInformation => 'Інформація про сервер:';

  @override
  String get name => 'Ім\'я';

  @override
  String get version => 'Версія';

  @override
  String get website => 'Вебсайт';

  @override
  String get compress => 'Стиснути';

  @override
  String get boldText => 'Жирний текст';

  @override
  String get italicText => 'Курсивний текст';

  @override
  String get strikeThrough => 'Перекреслений текст';

  @override
  String get invalidUrl => 'Недійсний URL';

  @override
  String get addLink => 'Додати посилання';

  @override
  String get unableToJoinChat =>
      'Неможливо приєднатися до бесіди. Можливо, інша сторона вже закрила розмову.';

  @override
  String get previous => 'Попередній';

  @override
  String appWantsToUseForLogin(String server) {
    return 'Використати \'$server\', щоб увійти';
  }

  @override
  String get appWantsToUseForLoginDescription =>
      'Цим ви дозволяєте застосунку та вебсайту ділитися інформацією про вас.';

  @override
  String get open => 'Відкрити';

  @override
  String get waitingForServer => 'Очікування сервера...';

  @override
  String get appIntroduction =>
      'FluffyChat дає змогу спілкуватися з друзями у різних месенджерах. Дізнайтеся більше на https://invitation.be-mindpower.net/ або просто натисніть *Продовжити*.';

  @override
  String get newChatRequest => '📩 Новий запит на спілкування';

  @override
  String get contentNotificationSettings => 'Налаштування сповіщень про вміст';

  @override
  String get generalNotificationSettings => 'Загальні налаштування сповіщень';

  @override
  String get roomNotificationSettings => 'Налаштування сповіщень кімнати';

  @override
  String get userSpecificNotificationSettings =>
      'Налаштування сповіщень для користувача';

  @override
  String get otherNotificationSettings => 'Інші налаштування сповіщень';

  @override
  String get notificationRuleContainsUserName => 'Містить ім\'я користувача';

  @override
  String get notificationRuleContainsUserNameDescription =>
      'Сповіщає користувача, коли повідомлення містить його ім\'я користувача.';

  @override
  String get notificationRuleMaster => 'Вимкнути всі сповіщення';

  @override
  String get notificationRuleMasterDescription =>
      'Перевизначає всі інші правила і вимикає всі сповіщення.';

  @override
  String get notificationRuleSuppressNotices =>
      'Заборонити автоматичні повідомлення';

  @override
  String get notificationRuleSuppressNoticesDescription =>
      'Забороняє сповіщення від автоматизованих клієнтів, таких як боти.';

  @override
  String get notificationRuleInviteForMe => 'Запрошення мене';

  @override
  String get notificationRuleInviteForMeDescription =>
      'Сповіщає користувача, коли його запрошують до кімнати.';

  @override
  String get notificationRuleMemberEvent => 'Події участі';

  @override
  String get notificationRuleMemberEventDescription =>
      'Забороняє сповіщення про події учасників.';

  @override
  String get notificationRuleIsUserMention => 'Згадки користувачів';

  @override
  String get notificationRuleIsUserMentionDescription =>
      'Сповіщає користувачів, коли безпосередньо їх згадують у повідомленні.';

  @override
  String get notificationRuleContainsDisplayName => 'Містить показуване ім’я';

  @override
  String get notificationRuleContainsDisplayNameDescription =>
      'Сповіщає користувача, коли повідомлення містить показуване ім\'я.';

  @override
  String get notificationRuleIsRoomMention => 'Згадки кімнати';

  @override
  String get notificationRuleIsRoomMentionDescription =>
      'Сповіщає користувача, коли є згадка всієї кімнати.';

  @override
  String get notificationRuleRoomnotif => 'Сповіщення кімнати';

  @override
  String get notificationRuleRoomnotifDescription =>
      'Сповіщає користувача, коли повідомлення містить \'@room\'.';

  @override
  String get notificationRuleTombstone => 'Могильний камінь';

  @override
  String get notificationRuleTombstoneDescription =>
      'Повідомляє користувача про повідомлення деактивації кімнати.';

  @override
  String get notificationRuleReaction => 'Реакція';

  @override
  String get notificationRuleReactionDescription =>
      'Приховує сповіщення про реакції.';

  @override
  String get notificationRuleRoomServerAcl => 'ACL сервера кімнати';

  @override
  String get notificationRuleRoomServerAclDescription =>
      'Приховує сповіщення про списки контролю доступу (ACL) сервера кімнати.';

  @override
  String get notificationRuleSuppressEdits => 'Приховує редагування';

  @override
  String get notificationRuleSuppressEditsDescription =>
      'Приховує сповіщення про відредаговані повідомлення.';

  @override
  String get notificationRuleCall => 'Виклик';

  @override
  String get notificationRuleCallDescription =>
      'Повідомляє користувача про виклики.';

  @override
  String get notificationRuleEncryptedRoomOneToOne =>
      'Зашифрована кімната \"Один на один\"';

  @override
  String get notificationRuleEncryptedRoomOneToOneDescription =>
      'Повідомляє користувача про повідомлення в зашифрованих кімнатах \"Один на один\".';

  @override
  String get notificationRuleRoomOneToOne => 'Кімната \"Один на один\"';

  @override
  String get notificationRuleRoomOneToOneDescription =>
      'Повідомляє користувача про повідомлення в кімнатах \"Один на один\".';

  @override
  String get notificationRuleMessage => 'Повідомлення';

  @override
  String get notificationRuleMessageDescription =>
      'Повідомляє користувача про загальні повідомлення.';

  @override
  String get notificationRuleEncrypted => 'Зашифровано';

  @override
  String get notificationRuleEncryptedDescription =>
      'Повідомляє користувача про повідомлення в зашифрованих кімнатах.';

  @override
  String get notificationRuleJitsi => 'Jitsi';

  @override
  String get notificationRuleJitsiDescription =>
      'Повідомляє користувача про події віджетів Jitsi.';

  @override
  String get notificationRuleServerAcl => 'Приховує події сервера ACL';

  @override
  String get notificationRuleServerAclDescription =>
      'Приховує сповіщення про події Server ACL.';

  @override
  String unknownPushRule(String rule) {
    return 'Невідоме правило сповіщення \'$rule\'';
  }

  @override
  String sentVoiceMessage(String sender, String duration) {
    return '🎙️ $duration - $sender - Голосове повідомлення від $sender';
  }

  @override
  String get deletePushRuleCanNotBeUndone =>
      'Якщо ви видалите це налаштування сповіщень, відновити його буде неможливо.';

  @override
  String get more => 'Більше';

  @override
  String get shareKeysWith => 'Поділитися ключами з...';

  @override
  String get shareKeysWithDescription =>
      'Яким пристроям довіряти, щоб вони могли читати ваші повідомлення в зашифрованих бесідах?';

  @override
  String get allDevices => 'Усім пристроям';

  @override
  String get crossVerifiedDevicesIfEnabled =>
      'З перехресною верифікацією пристроїв, якщо ввімкнено';

  @override
  String get crossVerifiedDevices => 'З перехресною верифікацією пристроїв';

  @override
  String get verifiedDevicesOnly => 'Лише верифіковані пристрої';

  @override
  String get takeAPhoto => 'Зробити фото';

  @override
  String get recordAVideo => 'Записати відео';

  @override
  String get optionalMessage => '(Необов\'язково) повідомлення...';

  @override
  String get notSupportedOnThisDevice => 'Не підтримується на цьому пристрої';

  @override
  String get approve => 'Схвалити';

  @override
  String get youHaveKnocked => 'Ви постукали';

  @override
  String get pleaseWaitUntilInvited =>
      'Будь ласка, зачекайте, поки хтось з кімнати запросить вас.';

  @override
  String get commandHint_logout => 'Вийти на цьому пристрої';

  @override
  String get commandHint_logoutall => 'Вийти на всіх активних пристроях';

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
