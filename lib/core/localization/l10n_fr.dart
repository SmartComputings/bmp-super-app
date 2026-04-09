// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class L10nFr extends L10n {
  L10nFr([String locale = 'fr']) : super(locale);

  @override
  String get alwaysUse24HourFormat => 'true';

  @override
  String get repeatPassword => 'Répétez le mot de passe';

  @override
  String get notAnImage => 'Pas un fichier image.';

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
  String get remove => 'Supprimer';

  @override
  String get importNow => 'Importer maintenant';

  @override
  String get importEmojis => 'Importer des Emojis';

  @override
  String get importFromZipFile => 'Importer depuis un fichier .zip';

  @override
  String get exportEmotePack => 'Exporter le pack d\'émoticônes au format .zip';

  @override
  String get replace => 'Remplacer';

  @override
  String get about => 'À propos';

  @override
  String aboutHomeserver(String homeserver) {
    return 'À propos de $homeserver';
  }

  @override
  String get accept => 'Accepter';

  @override
  String acceptedTheInvitation(String username) {
    return '👍 $username a accepté l\'invitation';
  }

  @override
  String get account => 'Compte';

  @override
  String activatedEndToEndEncryption(String username) {
    return '🔐 $username a activé le chiffrement de bout en bout';
  }

  @override
  String get addEmail => 'Ajouter un courriel';

  @override
  String get confirmMatrixId =>
      'Veuillez confirmer votre identifiant utilisateur afin de supprimer votre compte.';

  @override
  String supposedMxid(String mxid) {
    return 'Cela devrait être $mxid';
  }

  @override
  String get addChatDescription => 'Ajouter une description à la discussion...';

  @override
  String get addToSpace => 'Ajouter à l\'espace';

  @override
  String get admin => 'Administrateur';

  @override
  String get alias => 'adresse';

  @override
  String get all => 'Tout';

  @override
  String get allChats => 'Toutes les discussions';

  @override
  String get commandHint_roomupgrade =>
      'Upgrade this room to the given room version';

  @override
  String get commandHint_googly => 'Envoyer des yeux écarquillés';

  @override
  String get commandHint_cuddle => 'Envoyer un câlin';

  @override
  String get commandHint_hug => 'Envoyer une accolade';

  @override
  String googlyEyesContent(String senderName) {
    return '$senderName vous envoie des yeux écarquillés';
  }

  @override
  String cuddleContent(String senderName) {
    return '$senderName vous fait un câlin';
  }

  @override
  String hugContent(String senderName) {
    return '$senderName vous fait une accolade';
  }

  @override
  String answeredTheCall(String senderName) {
    return '$senderName a répondu à l\'appel';
  }

  @override
  String get anyoneCanJoin => 'Tout le monde peut rejoindre';

  @override
  String get appLock => 'Verrouillage de l’application';

  @override
  String get appLockDescription =>
      'Verrouiller l\'application avec un code PIN lorsqu\'elle n\'est pas utilisée';

  @override
  String get archive => 'Archiver';

  @override
  String get unArchive => 'Unarchive';

  @override
  String get areGuestsAllowedToJoin => 'Les invités peuvent-i·e·ls rejoindre';

  @override
  String get areYouSure => 'Êtes-vous sûr·e ?';

  @override
  String get areYouSureYouWantToLogout =>
      'Voulez-vous vraiment vous déconnecter ?';

  @override
  String get askSSSSSign =>
      'Pour pouvoir faire signer l\'autre personne, veuillez entrer la phrase de passe de votre trousseau sécurisé ou votre clé de récupération.';

  @override
  String askVerificationRequest(String username) {
    return 'Accepter cette demande de vérification de la part de $username ?';
  }

  @override
  String get autoplayImages =>
      'Lire automatiquement les autocollants et les émojis animés';

  @override
  String badServerLoginTypesException(String serverVersions,
      String supportedVersions, Object suportedVersions) {
    return 'Le serveur d\'accueil prend en charge les types de connexion :\n$serverVersions\nMais cette application ne prend en charge que :\n$supportedVersions';
  }

  @override
  String get sendTypingNotifications => 'Envoyer des notifications de frappe';

  @override
  String get swipeRightToLeftToReply =>
      'Glisser de droite à gauche pour répondre';

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
  String get sendOnEnter => 'Envoyer avec Entrée';

  @override
  String badServerVersionsException(
      String serverVersions,
      String supportedVersions,
      Object serverVerions,
      Object supoortedVersions,
      Object suportedVersions) {
    return 'Le serveur d\'accueil prend en charge les versions des spécifications :\n$serverVersions\nMais cette application ne prend en charge que $supportedVersions';
  }

  @override
  String countChatsAndCountParticipants(int chats, int participants) {
    return '$chats discussions et $participants participants';
  }

  @override
  String countMembers(int count) {
    return '$count Members';
  }

  @override
  String get noMoreChatsFound => 'Aucune autre discussion trouvée...';

  @override
  String get noChatsFoundHere =>
      'Aucune discussion trouvée. Utilisez le bouton ci-dessous pour commencer une nouvelle discussion. ⤵️';

  @override
  String get joinedChats => 'Discussions rejointes';

  @override
  String get unread => 'Non lu';

  @override
  String get space => 'Espace';

  @override
  String get spaces => 'Espaces';

  @override
  String get banFromChat => 'Bannir de la discussion';

  @override
  String get banned => 'Banni';

  @override
  String bannedUser(String username, String targetName) {
    return '$username a banni $targetName';
  }

  @override
  String get blockDevice => 'Bloquer l\'appareil';

  @override
  String get blocked => 'Bloqué';

  @override
  String get botMessages => 'Messages de bot';

  @override
  String get cancel => 'Annuler';

  @override
  String cantOpenUri(String uri) {
    return 'Impossible d\'ouvrir l\'URI $uri';
  }

  @override
  String get changeDeviceName => 'Modifier le nom de l\'appareil';

  @override
  String changedTheChatAvatar(String username) {
    return '$username a changé l\'image de la discussion';
  }

  @override
  String changedTheChatDescriptionTo(String username, String description) {
    return '$username a changé la description de la discussion en : \'$description\'';
  }

  @override
  String changedTheChatNameTo(String username, String chatname) {
    return '$username a renommé la discussion en : \'$chatname\'';
  }

  @override
  String changedTheChatPermissions(String username) {
    return '$username a changé les permissions de la discussion';
  }

  @override
  String changedTheDisplaynameTo(String username, String displayname) {
    return '$username a changé son nom en : \'$displayname\'';
  }

  @override
  String changedTheGuestAccessRules(String username) {
    return '$username a changé les règles d\'accès à la discussion pour les invités';
  }

  @override
  String changedTheGuestAccessRulesTo(String username, String rules) {
    return '$username a changé les règles d\'accès à la discussion pour les invités en : $rules';
  }

  @override
  String changedTheHistoryVisibility(String username) {
    return '$username a changé la visibilité de l\'historique de la discussion';
  }

  @override
  String changedTheHistoryVisibilityTo(String username, String rules) {
    return '$username a changé la visibilité de l\'historique de la discussion en : $rules';
  }

  @override
  String changedTheJoinRules(String username) {
    return '$username a changé les règles d\'accès à la discussion';
  }

  @override
  String changedTheJoinRulesTo(String username, String joinRules) {
    return '$username a changé les règles d\'accès à la discussion en : $joinRules';
  }

  @override
  String changedTheProfileAvatar(String username) {
    return '$username a changé son avatar';
  }

  @override
  String changedTheRoomAliases(String username) {
    return '$username a changé les adresses du salon';
  }

  @override
  String changedTheRoomInvitationLink(String username) {
    return '$username a changé le lien d\'invitation';
  }

  @override
  String get changePassword => 'Changer de mot de passe';

  @override
  String get changeTheHomeserver => 'Changer le serveur d\'accueil';

  @override
  String get changeTheme => 'Changez votre style';

  @override
  String get changeTheNameOfTheGroup => 'Changer le nom du groupe';

  @override
  String get changeYourAvatar => 'Changer votre avatar';

  @override
  String get channelCorruptedDecryptError => 'Le chiffrement a été corrompu';

  @override
  String get chat => 'Discussion';

  @override
  String get yourChatBackupHasBeenSetUp =>
      'Votre sauvegarde de la discussion a été mise en place.';

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
  String get chatDescription => 'Description de la discussion';

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
  String get tryAgain => 'Nouvelle tentative';

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
  String get search => 'Rechercher';

  @override
  String get select => 'Sélectionner';

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
  String get logout => 'Se déconnecter';

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
  String get group => 'Groupe';

  @override
  String get calls => 'Appels';

  @override
  String get done => 'Done!';

  @override
  String get taskCompletedSuccessfully => 'Task is completed\nsuccessfully';

  @override
  String get goBack => 'Go Back';

  @override
  String get signupSuccessMessage => 'You\'ve signed up \nsuccessfully';

  @override
  String get chatBackup => 'Sauvegarde des discussions';

  @override
  String get chatBackupDescription =>
      'Vos anciens messages sont sécurisés par une clé de récupération. Veillez à ne pas la perdre.';

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
  String get chatDetails => 'Détails de la discussion';

  @override
  String get chatHasBeenAddedToThisSpace =>
      'La discussion a été ajoutée à cet espace';

  @override
  String get chats => 'Discussions';

  @override
  String get chooseAStrongPassword => 'Choisissez un mot de passe fort';

  @override
  String get clearArchive => 'Effacer les archives';

  @override
  String get close => 'Fermer';

  @override
  String get commandHint_markasdm =>
      'Marquer comme salon de messages directs pour l\'identifiant Matrix indiqué';

  @override
  String get commandHint_markasgroup => 'Marquer comme groupe';

  @override
  String get commandHint_ban =>
      'Bannir l\'utilisateur/trice donné(e) de ce salon';

  @override
  String get commandHint_clearcache => 'Vider le cache';

  @override
  String get commandHint_create =>
      'Créer un groupe de discussion vide\nUtilisez --no-encryption pour désactiver le chiffrement';

  @override
  String get commandHint_discardsession => 'Abandonner la session';

  @override
  String get commandHint_dm =>
      'Commencer une discussion directe\nUtilisez --no-encryption pour désactiver le chiffrement';

  @override
  String get commandHint_html => 'Envoyer du texte au format HTML';

  @override
  String get commandHint_invite =>
      'Inviter l\'utilisateur/trice donné(e) dans ce salon';

  @override
  String get commandHint_join => 'Rejoindre le salon donné';

  @override
  String get commandHint_kick =>
      'Supprime l\'utilisateur/trice donné(e) de ce salon';

  @override
  String get commandHint_leave => 'Quitter ce salon';

  @override
  String get commandHint_me => 'Décrivez-vous';

  @override
  String get commandHint_myroomavatar =>
      'Définir votre image pour ce salon (par mxc-uri)';

  @override
  String get commandHint_myroomnick =>
      'Définir votre nom d\'affichage pour ce salon';

  @override
  String get commandHint_op =>
      'Définir le niveau de puissance de l\'utilisateur/trice donné(e) (par défaut : 50)';

  @override
  String get commandHint_plain => 'Envoyer du texte non formaté';

  @override
  String get commandHint_react => 'Envoyer une réponse en tant que réaction';

  @override
  String get commandHint_send => 'Envoyer du texte';

  @override
  String get commandHint_unban =>
      'Débannir l\'utilisateur/trice donné(e) de ce salon';

  @override
  String get commandInvalid => 'Commande invalide';

  @override
  String commandMissing(String command) {
    return '$command n\'est pas une commande.';
  }

  @override
  String get compareEmojiMatch => 'Veuillez comparer les émojis';

  @override
  String get compareNumbersMatch => 'Veuillez comparer les chiffres';

  @override
  String get configureChat => 'Configurer la discussion';

  @override
  String get confirm => 'Confirmer';

  @override
  String get connect => 'Se connecter';

  @override
  String get contactHasBeenInvitedToTheGroup =>
      'Le contact a été invité au groupe';

  @override
  String get containsDisplayName => 'Contient un nom d\'affichage';

  @override
  String get containsUserName => 'Contient un nom d\'utilisateur·ice';

  @override
  String get contentHasBeenReported =>
      'Le contenu a été signalé aux administrateurs du serveur';

  @override
  String get copiedToClipboard => 'Copié dans le presse-papier';

  @override
  String get copy => 'Copier';

  @override
  String get copyToClipboard => 'Copier dans le presse-papiers';

  @override
  String couldNotDecryptMessage(String error) {
    return 'Impossible de déchiffrer le message : $error';
  }

  @override
  String get checkList => 'Check list';

  @override
  String countParticipants(int count) {
    return '$count participant(s)';
  }

  @override
  String countInvited(int count) {
    return '$count invited';
  }

  @override
  String get create => 'Créer';

  @override
  String createdTheChat(String username) {
    return '💬 $username a créé la discussion';
  }

  @override
  String get createGroup => 'Créer un groupe';

  @override
  String get createNewSpace => 'Nouvel espace';

  @override
  String get currentlyActive => 'Actif en ce moment';

  @override
  String get darkTheme => 'Sombre';

  @override
  String dateAndTimeOfDay(String date, String timeOfDay) {
    return '$date, $timeOfDay';
  }

  @override
  String dateWithoutYear(String month, String day) {
    return '$day/$month';
  }

  @override
  String dateWithYear(String year, String month, String day) {
    return '$day/$month/$year';
  }

  @override
  String get deactivateAccountWarning =>
      'Cette opération va désactiver votre compte. Une fois cette action effectuée, aucun retour en arrière n\'est possible ! Êtes-vous sûr·e ?';

  @override
  String get defaultPermissionLevel =>
      'Niveau d\'autorisation par défaut pour les arrivants';

  @override
  String get delete => 'Supprimer';

  @override
  String get deleteAccount => 'Supprimer le compte';

  @override
  String get deleteMessage => 'Supprimer le message';

  @override
  String get device => 'Appareil';

  @override
  String get deviceId => 'Identifiant de l\'appareil';

  @override
  String get devices => 'Appareils';

  @override
  String get directChats => 'Discussions directes';

  @override
  String get allRooms => 'Tous les groupes de discussion';

  @override
  String get displaynameHasBeenChanged => 'Renommage effectué';

  @override
  String get download => 'Download';

  @override
  String get downloadFile => 'Télécharger le fichier';

  @override
  String get edit => 'Modifier';

  @override
  String get editBlockedServers => 'Modifier les serveurs bloqués';

  @override
  String get chatPermissions => 'Permissions du salon';

  @override
  String get editDisplayname => 'Changer de nom d\'affichage';

  @override
  String get editRoomAliases => 'Modifier les adresses du salon';

  @override
  String get editRoomAvatar => 'Modifier l\'avatar du salon';

  @override
  String get emoteExists => 'Cette émoticône existe déjà !';

  @override
  String get emoteInvalid => 'Raccourci d\'émoticône invalide !';

  @override
  String get emoteKeyboardNoRecents =>
      'Les émoticônes récemment utilisées apparaîtront ici...';

  @override
  String get emotePacks => 'Packs d\'émoticônes pour le salon';

  @override
  String get emoteSettings => 'Paramètre des émoticônes';

  @override
  String get globalChatId => 'Identifiant global de la discussion';

  @override
  String get accessAndVisibility => 'Accès et visibilité';

  @override
  String get accessAndVisibilityDescription =>
      'Qui est autorisé à rejoindre cette discussion et comment la discussion peut être découverte.';

  @override
  String get customEmojisAndStickers =>
      'Émoticônes et autocollants personnalisés';

  @override
  String get customEmojisAndStickersBody =>
      'Ajoutez ou partagez des émoticônes ou autocollants personnalisés qui peuvent être utilisés dans n\'importe quelle discussion.';

  @override
  String get emoteShortcode => 'Raccourci de l\'émoticône';

  @override
  String get emoteWarnNeedToPick =>
      'Vous devez sélectionner un raccourci d\'émoticône et une image !';

  @override
  String get emptyChat => 'Discussion vide';

  @override
  String get enableEmotesGlobally =>
      'Activer globalement le pack d\'émoticônes';

  @override
  String get enableEncryption => 'Activer le chiffrement';

  @override
  String get enableEncryptionWarning =>
      'Vous ne pourrez plus désactiver le chiffrement. Êtes-vous sûr(e) ?';

  @override
  String get encrypted => 'Chiffré';

  @override
  String get encryption => 'Chiffrement';

  @override
  String get encryptionNotEnabled => 'Le chiffrement n\'est pas activé';

  @override
  String endedTheCall(String senderName) {
    return '$senderName a mis fin à l\'appel';
  }

  @override
  String get enterAnEmailAddress => 'Saisissez une adresse de courriel';

  @override
  String get homeserver => 'Serveur d\'accueil';

  @override
  String get enterYourHomeserver => 'Renseignez votre serveur d\'accueil';

  @override
  String errorObtainingLocation(String error) {
    return 'Erreur lors de l\'obtention de la localisation : $error';
  }

  @override
  String get everythingReady => 'Tout est prêt !';

  @override
  String get extremeOffensive => 'Extrêmement offensant';

  @override
  String get fileName => 'Nom du ficher';

  @override
  String get fluffychat => 'FluffyChat';

  @override
  String get fontSize => 'Taille de la police';

  @override
  String get forward => 'Transférer';

  @override
  String get fromJoining => 'À partir de l\'entrée dans le salon';

  @override
  String get fromTheInvitation => 'À partir de l\'invitation';

  @override
  String get goToTheNewRoom => 'Aller dans le nouveau salon';

  @override
  String get chatDescriptionHasBeenChanged =>
      'La description du salon a changé';

  @override
  String get groupIsPublic => 'Le groupe est public';

  @override
  String get groups => 'Groupes';

  @override
  String groupWith(String displayname) {
    return 'Groupe avec $displayname';
  }

  @override
  String get guestsAreForbidden => 'Les invités ne peuvent pas rejoindre';

  @override
  String get guestsCanJoin => 'Les invités peuvent rejoindre';

  @override
  String hasWithdrawnTheInvitationFor(String username, String targetName) {
    return '$username a annulé l\'invitation de $targetName';
  }

  @override
  String get help => 'Aide';

  @override
  String get hideRedactedEvents => 'Cacher les évènements supprimés';

  @override
  String get hideRedactedMessages => 'Cacher les messages édités';

  @override
  String get hideRedactedMessagesBody =>
      'Si quelqu\'un modifie un message, celui-ci ne sera plus visible dans la discussion.';

  @override
  String get hideInvalidOrUnknownMessageFormats =>
      'Masquer les formats de message invalides ou inconnus';

  @override
  String get howOffensiveIsThisContent =>
      'À quel point ce contenu est-il offensant ?';

  @override
  String get id => 'Identifiant';

  @override
  String get identity => 'Identité';

  @override
  String get block => 'Bloquer';

  @override
  String get blockedUsers => 'Utilisateurs/trices bloqués';

  @override
  String get blockListDescription =>
      'Vous pouvez bloquer des utilisateurs/trices qui vous dérangent. Vous ne pourrez plus recevoir aucun message ou invitation à un salon d\'utilisateurs/trices figurant sur votre liste de blocage personnelle.';

  @override
  String get blockUsername => 'Ignorer le nom d\'utilisateur/trice';

  @override
  String get iHaveClickedOnLink => 'J\'ai cliqué sur le lien';

  @override
  String get incorrectPassphraseOrKey =>
      'Phrase de passe ou clé de récupération incorrecte';

  @override
  String get inoffensive => 'Non offensant';

  @override
  String get inviteContact => 'Inviter un contact';

  @override
  String inviteContactToGroupQuestion(Object contact, Object groupName) {
    return 'Voulez-vous inviter $contact au salon \"$groupName\" ?';
  }

  @override
  String inviteContactToGroup(String groupName) {
    return 'Inviter un contact dans $groupName';
  }

  @override
  String get noChatDescriptionYet =>
      'Aucune description de discussion n\'a encore été créée.';

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
      'Cette notification s’affiche lorsque le service au premier plan est en cours d’exécution.';

  @override
  String get screenSharingTitle => 'Partage d\'écran';

  @override
  String get screenSharingDetail => 'Vous partagez votre écran dans FuffyChat';

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
    return 'Fichiers';
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
  String get setCustomEmotes => 'Définir des émoticônes personnalisées';

  @override
  String get whoCanPerformWhichAction => 'Qui peut faire quelle action';

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
  String get pleaseFillOut => 'Please fill out';

  @override
  String get newGroup => 'Nouveau groupe';

  @override
  String get imageGroup => 'Image group';

  @override
  String get groupName => 'Nom du groupe';

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
  String get messages => 'Messages';

  @override
  String get decline => 'Refuser';

  @override
  String youInvitedBy(String user) {
    return '📩 Vous avez été invité par $user';
  }

  @override
  String get invalidServerName => 'Nom de serveur invalide';

  @override
  String get archiveRoomDescription =>
      'La discussion sera déplacée dans les archives. Les autres utilisateurs/trices pourront voir que vous avez quitté la discussion.';

  @override
  String get hidePresences => 'Cacher la liste des statuts ?';

  @override
  String get leaveEmptyToClearStatus =>
      'Laisser vide pour effacer votre statut.';

  @override
  String get removeFromBundle => 'Retirer de ce groupe';

  @override
  String get encryptionSetupRequired =>
      'Encryption setup is required for secure messaging. Please complete the setup in Settings.';

  @override
  String get warning => 'Attention !';

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
  String get verifyOtherDevice => '🔐 Vérifier l\'autre appareil';

  @override
  String get verifyOtherDeviceDescription =>
      'Lorsque vous vérifiez un autre appareil, ces appareils peuvent échanger des clés, ce qui augmente votre sécurité globale. 💪 Lorsque vous lancez une vérification, une fenêtre contextuelle s\'affiche dans l\'application sur les deux appareils. Vous y verrez alors une série d\'émoticônes ou de chiffres que vous devrez comparer. Il est préférable d\'avoir les deux appareils à portée de main avant de lancer la vérification. 🤳';

  @override
  String get removeDevicesDescription =>
      'Vous serez déconnecté de cet appareil et ne pourrez plus recevoir de messages.';

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
  String get invited => 'Invité·e';

  @override
  String get redactMessageDescription =>
      'Le message sera modifié pour tous les participants de cette conversation. Il n\'est pas possible de revenir en arrière.';

  @override
  String get optionalRedactReason =>
      '(Facultatif) Raison de la modification de ce message...';

  @override
  String invitedUser(String username, String targetName) {
    return '📩 $username a invité $targetName';
  }

  @override
  String get invitedUsersOnly => 'Uniquement les utilisateur·ices invité·es';

  @override
  String get inviteForMe => 'Inviter pour moi';

  @override
  String inviteText(String username, String link) {
    return '$username vous a invité·e sur \n1. Inscrivez-vous ou connectez-vous\n2. Ouvrez le lien d\'invitation :\n$link';
  }

  @override
  String get gallery => 'Galerie';

  @override
  String get document => 'Document';

  @override
  String get location => 'Location';

  @override
  String get contact => 'Contact';

  @override
  String get send => 'Envoyer';

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
  String get recoveryKey => 'Clé de récupération';

  @override
  String get storeInAndroidKeystore => 'Stocker dans Android KeyStore';

  @override
  String get storeInAppleKeyChain => 'Stocker dans Apple KeyChain';

  @override
  String get storeSecurlyOnThisDevice =>
      'Stocker de manière sécurisé sur cet appareil';

  @override
  String get storeInSecureStorageDescription =>
      'Stocker la clé de récupération dans un espace sécurisé de cet appareil.';

  @override
  String get saveKeyManuallyDescription =>
      'Enregistrer cette clé manuellement en déclenchant la boîte de dialogue de partage du système ou le presse-papiers.';

  @override
  String get pleaseEnterRecoveryKeyDescription =>
      'Pour déverrouiller vos anciens messages, veuillez entrer votre clé de récupération qui a été générée lors d\'une session précédente. Votre clé de récupération n\'est PAS votre mot de passe.';

  @override
  String get unlockOldMessages => 'Déverrouiller les anciens messages';

  @override
  String get wrongRecoveryKey =>
      'Désolé... il ne semble pas s\'agir de la bonne clé de récupération.';

  @override
  String get recoveryKeyLost => 'Clé de récupération perdue ?';

  @override
  String get wipeChatBackup =>
      'Effacer la sauvegarde de votre discussion pour créer une nouvelle clé de récupération ?';

  @override
  String get isTyping => 'est en train d\'écrire…';

  @override
  String joinedTheChat(String username) {
    return '👋 $username a rejoint la discussion';
  }

  @override
  String get joinRoom => 'Rejoindre le salon';

  @override
  String kicked(String username, String targetName) {
    return '👞 $username a expulsé $targetName';
  }

  @override
  String kickedAndBanned(String username, String targetName) {
    return '🙅 $username a expulsé et banni $targetName';
  }

  @override
  String get kickFromChat => 'Expulser de la discussion';

  @override
  String lastActiveAgo(String localizedTimeShort) {
    return 'Vu·e pour la dernière fois : $localizedTimeShort';
  }

  @override
  String get leave => 'Partir';

  @override
  String get leftTheChat => 'A quitté la discussion';

  @override
  String get license => 'Licence';

  @override
  String get lightTheme => 'Clair';

  @override
  String loadCountMoreParticipants(int count) {
    return 'Charger $count participant·es de plus';
  }

  @override
  String get dehydrate => 'Exporter la session et effacer l\'appareil';

  @override
  String get dehydrateWarning =>
      'Cette action ne peut pas être annulée. Assurez-vous d\'enregistrer convenablement le fichier de sauvegarde.';

  @override
  String get dehydrateTor => 'Utilisateurs/trices de TOR : Exporter la session';

  @override
  String get dehydrateTorLong =>
      'Pour les utilisateurs/trices de TOR, il est recommandé d\'exporter la session avant de fermer la fenêtre.';

  @override
  String get hydrateTor =>
      'Utilisateurs/trices de TOR : Importer une session exportée';

  @override
  String get hydrateTorLong =>
      'Vous avez exporté votre session la dernière fois sur TOR ? Importez-la rapidement et continuez à discuter.';

  @override
  String get hydrate => 'Restaurer à partir du fichier de sauvegarde';

  @override
  String get loadingPleaseWait => 'Chargement… Veuillez patienter.';

  @override
  String get loadMore => 'Charger plus…';

  @override
  String get locationDisabledNotice =>
      'Les services de localisation sont désactivés. Il est nécessaire de les activer avant de pouvoir partager votre localisation.';

  @override
  String get locationPermissionDeniedNotice =>
      'L\'application n\'a pas la permission d\'accéder à votre localisation. Merci de l\'accorder afin de pouvoir partager votre localisation.';

  @override
  String get login => 'Se connecter';

  @override
  String logInTo(String homeserver) {
    return 'Se connecter à $homeserver';
  }

  @override
  String get memberChanges => 'Changements de membres';

  @override
  String get mention => 'Mentionner';

  @override
  String get messagesStyle => 'Messages :';

  @override
  String get moderator => 'Modérateur·rice';

  @override
  String get muteChat => 'Mettre la discussion en sourdine';

  @override
  String get needPantalaimonWarning =>
      'Pour l\'instant, vous avez besoin de Pantalaimon pour utiliser le chiffrement de bout en bout.';

  @override
  String get newChat => 'Nouvelle discussion';

  @override
  String get newMessageInFluffyChat => '💬 Nouveau message dans FluffyChat';

  @override
  String get newVerificationRequest => 'Nouvelle demande de vérification !';

  @override
  String get next => 'Suivant';

  @override
  String get no => 'Non';

  @override
  String get noConnectionToTheServer => 'Aucune connexion au serveur';

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
  String get privacy => 'Vie privée';

  @override
  String get notification => 'Notification';

  @override
  String get wallet => 'Wallet';

  @override
  String get allCalls => 'All Calls';

  @override
  String get unreadCalls => 'Unread Calls';

  @override
  String get setChatDescription => 'Définir la description de la discussion';

  @override
  String get replaceRoomWithNewerVersion =>
      'Remplacer le salon par une nouvelle version';

  @override
  String get roomUpgradeDescription =>
      'La discussion sera alors recréé avec la nouvelle version de salon. Tous les participants seront informés qu\'ils doivent passer à la nouvelle discussion. Pour en savoir plus sur les versions des salons, consultez le site https://spec.matrix.org/latest/rooms/';

  @override
  String get usersMustKnock => 'Les utilisateurs/trices doivent frapper';

  @override
  String get noOneCanJoin => 'Personne ne peut rejoindre';

  @override
  String get restricted => 'Limité';

  @override
  String get knockRestricted => 'Frapper à la porte limité';

  @override
  String get unknown => 'Unknown';

  @override
  String get openGallery => 'Ouvrir dans la Galerie';

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
  String get unsupportedAndroidVersion =>
      'Version d\'Android non prise en charge';

  @override
  String get unsupportedAndroidVersionLong =>
      'Cette fonctionnalité nécessite une nouvelle version d\'Android. Veuillez vérifier les mises à jour ou la prise en charge de Lineage OS.';

  @override
  String get available => 'Available';

  @override
  String get typeMessage => 'Type message..';

  @override
  String get report => 'signaler';

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
  String get messageInfo => 'Informations sur le message';

  @override
  String get pinnMessage => 'Pin message';

  @override
  String get redactMessage => 'Supprimer un message';

  @override
  String get reportMessage => 'Signaler un message';

  @override
  String get jumpToLastReadMessage => 'Aller au dernier message lu';

  @override
  String get jump => 'Sauter';

  @override
  String get enterNewChat => 'Enter new chat';

  @override
  String get reopenChat => 'Rouvrir la discussion';

  @override
  String get reply => 'Répondre';

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
  String get sendAsText => 'Envoyer un texte';

  @override
  String get whyDoYouWantToReportThis => 'Pourquoi voulez-vous le signaler ?';

  @override
  String get reason => 'Motif';

  @override
  String get offensive => 'Offensant';

  @override
  String get confirmEventUnpin =>
      'Voulez-vous vraiment désépingler définitivement l\'événement ?';

  @override
  String get noEmotesFound => 'Aucune émoticône trouvée. 😕';

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
      'Vous pouvez activer le chiffrement seulement quand le salon n\'est plus accessible au public.';

  @override
  String get noGoogleServicesWarning =>
      'Firebase Cloud Messaging ne semble pas être disponible sur votre appareil. Pour continuer à recevoir des notifications poussées, nous vous recommandons d\'installer ntfy. Avec ntfy ou un autre fournisseur Unified Push, vous pouvez recevoir des notifications poussées de manière sécurisée. Vous pouvez télécharger ntfy sur le PlayStore ou sur F-Droid.';

  @override
  String noMatrixServer(String server1, String server2) {
    return '$server1 n\'est pas un serveur Matrix, souhaitez-vous utiliser $server2 à la place ?';
  }

  @override
  String get shareInviteLink => 'Partager un lien d\'invitation';

  @override
  String get scanQrCode => 'Scanner un code QR';

  @override
  String get none => 'Aucun';

  @override
  String get noPasswordRecoveryDescription =>
      'Vous n\'avez pas encore ajouté de moyen pour récupérer votre mot de passe.';

  @override
  String get noPermission => 'Aucune permission';

  @override
  String get noRoomsFound => 'Aucun salon trouvé…';

  @override
  String get notifications => 'Notifications';

  @override
  String get notificationsEnabledForThisAccount =>
      'Notifications activées pour ce compte';

  @override
  String numUsersTyping(int count) {
    return '$count utilisateur·ices écrivent…';
  }

  @override
  String get obtainingLocation => 'Obtention de la localisation…';

  @override
  String get locationFound => 'Location Found';

  @override
  String get otherPartyCannotReceiveEncryptedMessages =>
      'Other party cannot receive encrypted messages';

  @override
  String get accuracy => 'Accuracy';

  @override
  String get offline => 'Hors ligne';

  @override
  String get ok => 'Valider';

  @override
  String get online => 'En ligne';

  @override
  String get onlineKeyBackupEnabled =>
      'La sauvegarde en ligne des clés est activée';

  @override
  String get oopsPushError =>
      'Oups ! Une erreur s\'est malheureusement produite lors du réglage des notifications.';

  @override
  String get oopsSomethingWentWrong => 'Oups, un problème est survenu…';

  @override
  String get openAppToReadMessages =>
      'Ouvrez l\'application pour lire le message';

  @override
  String get openCamera => 'Ouvrir l\'appareil photo';

  @override
  String get openVideoCamera => 'Ouvrir la caméra pour une vidéo';

  @override
  String get oneClientLoggedOut => 'Un de vos clients a été déconnecté';

  @override
  String get addAccount => 'Ajouter un compte';

  @override
  String get editBundlesForAccount => 'Modifier les groupes pour ce compte';

  @override
  String get addToBundle => 'Ajouter au groupe';

  @override
  String get bundleName => 'Nom du groupe';

  @override
  String get enableMultiAccounts =>
      '(BETA) Activer les comptes multiples sur cet appareil';

  @override
  String get openInMaps => 'Ouvrir dans maps';

  @override
  String get link => 'Lien';

  @override
  String get serverRequiresEmail =>
      'Ce serveur doit valider votre adresse électronique pour l\'inscription.';

  @override
  String get or => 'Ou';

  @override
  String get participant => 'Participant(e)';

  @override
  String get passphraseOrKey => 'Phrase de passe ou clé de récupération';

  @override
  String get password => 'Mot de passe';

  @override
  String get passwordForgotten => 'Mot de passe oublié';

  @override
  String get passwordHasBeenChanged => 'Le mot de passe a été modifié';

  @override
  String get hideMemberChangesInPublicChats =>
      'Masquer les modifications de membres dans les discussions publiques';

  @override
  String get hideMemberChangesInPublicChatsBody =>
      'Ne pas afficher dans la chronologie de la discussion si quelqu\'un rejoint ou quitte une discussion publique afin d\'améliorer la lisibilité.';

  @override
  String get overview => 'Aperçu';

  @override
  String get notifyMeFor => 'Me notifier pour';

  @override
  String get passwordRecoverySettings =>
      'Paramètres de récupération de mot de passe';

  @override
  String get passwordRecovery => 'Récupération du mot de passe';

  @override
  String get people => 'Personnes';

  @override
  String get pickImage => 'Choisir une image';

  @override
  String get pin => 'Épingler';

  @override
  String play(String fileName) {
    return 'Lire $fileName';
  }

  @override
  String get pleaseChoose => 'Veuillez choisir';

  @override
  String get pleaseChooseAPasscode => 'Veuillez choisir un code d’accès';

  @override
  String get pleaseClickOnLink =>
      'Veuillez cliquer sur le lien contenu dans le courriel puis continuez.';

  @override
  String get pleaseEnter4Digits =>
      'Veuillez saisir 4 chiffres ou laisser vide pour désactiver le verrouillage de l’application.';

  @override
  String get pleaseEnterRecoveryKey =>
      'Veuillez saisir votre clé de récupération :';

  @override
  String get pleaseEnterYourPassword => 'Renseignez votre mot de passe';

  @override
  String get pleaseEnterYourPin => 'Veuillez saisir votre code PIN';

  @override
  String get pleaseEnterYourUsername =>
      'Renseignez votre nom d\'utilisateur·ice';

  @override
  String get pleaseFollowInstructionsOnWeb =>
      'Veuillez suivre les instructions sur le site et appuyer sur Suivant.';

  @override
  String get publicRooms => 'Salons publics';

  @override
  String get pushRules => 'Règles de notifications';

  @override
  String get recording => 'Enregistrement';

  @override
  String redactedBy(String username) {
    return 'Modifié par $username';
  }

  @override
  String get directChat => 'Discussion directe';

  @override
  String redactedByBecause(String username, String reason) {
    return 'Modifié par $username car : \"$reason\"';
  }

  @override
  String redactedAnEvent(String username) {
    return '$username a supprimé un évènement';
  }

  @override
  String get register => 'S\'inscrire';

  @override
  String get reject => 'Refuser';

  @override
  String rejectedTheInvitation(String username) {
    return '$username a refusé l\'invitation';
  }

  @override
  String get rejoin => 'Rejoindre de nouveau';

  @override
  String get removeAllOtherDevices => 'Supprimer tous les autres appareils';

  @override
  String removedBy(String username) {
    return 'Supprimé par $username';
  }

  @override
  String get removeDevice => 'Supprimer l\'appareil';

  @override
  String get unbanFromChat => 'Débannissement de la discussion';

  @override
  String get removeYourAvatar => 'Supprimer votre avatar';

  @override
  String get requestPermission => 'Demander la permission';

  @override
  String get roomHasBeenUpgraded => 'Le salon a été mis à niveau';

  @override
  String get roomVersion => 'Version du salon';

  @override
  String get saveFile => 'Enregistrer le fichier';

  @override
  String get security => 'Sécurité';

  @override
  String seenByUser(String username) {
    return 'Vu par $username';
  }

  @override
  String get sendAMessage => 'Envoyer un message';

  @override
  String get sendAudio => 'Envoyer un fichier audio';

  @override
  String get sendFile => 'Envoyer un fichier';

  @override
  String get sendImage => 'Envoyer une image';

  @override
  String sendImages(int count) {
    return 'Send $count image';
  }

  @override
  String get sendMessages => 'Envoyer des messages';

  @override
  String get sendOriginal => 'Envoyer le fichier original';

  @override
  String get sendSticker => 'Envoyer un autocollant';

  @override
  String get sendVideo => 'Envoyer une vidéo';

  @override
  String sentAFile(String username) {
    return '📁 $username a envoyé un fichier';
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
    return '🎤 $username a envoyé un fichier audio';
  }

  @override
  String sentAPicture(String username) {
    return '🖼️ $username a envoyé une image';
  }

  @override
  String sentASticker(String username) {
    return '😊 $username a envoyé un autocollant';
  }

  @override
  String sentAVideo(String username) {
    return '🎥 $username a envoyé une vidéo';
  }

  @override
  String sentCallInformations(String senderName) {
    return '$senderName a envoyé des informations sur l\'appel';
  }

  @override
  String get separateChatTypes =>
      'Séparer les discussions directes et les groupes';

  @override
  String get setAsCanonicalAlias => 'Définir comme adresse principale';

  @override
  String get setInvitationLink => 'Créer un lien d\'invitation';

  @override
  String get setPermissionsLevel => 'Définir le niveau de permissions';

  @override
  String get setStatus => 'Définir le statut';

  @override
  String get settings => 'Paramètres';

  @override
  String get share => 'Partager';

  @override
  String sharedTheLocation(String username) {
    return '$username a partagé sa position';
  }

  @override
  String get shareLocation => 'Partager la localisation';

  @override
  String get showPassword => 'Afficher le mot de passe';

  @override
  String get presenceStyle => 'Statut :';

  @override
  String get presencesToggle =>
      'Afficher les messages de statut des autres utilisateurs/trices';

  @override
  String get singlesignon => 'Authentification unique';

  @override
  String get skip => 'Ignorer';

  @override
  String get sourceCode => 'Code source';

  @override
  String get spaceIsPublic => 'L\'espace est public';

  @override
  String get spaceName => 'Nom de l\'espace';

  @override
  String startedACall(String senderName) {
    return '$senderName a démarré un appel';
  }

  @override
  String get startFirstChat => 'Commencez votre première discussion';

  @override
  String get status => 'Statut';

  @override
  String get statusExampleMessage => 'Comment allez-vous aujourd\'hui ?';

  @override
  String get submit => 'Soumettre';

  @override
  String get synchronizingPleaseWait =>
      'Synchronisation... Veuillez patienter.';

  @override
  String synchronizingPleaseWaitCounter(String percentage) {
    return ' Synchronisation… ($percentage %)';
  }

  @override
  String get systemTheme => 'Système';

  @override
  String get theyDontMatch => 'Elles ne correspondent pas';

  @override
  String get theyMatch => 'Elles correspondent';

  @override
  String get notFound => 'Not found';

  @override
  String get pinLimitMessage => 'You can only pin up to 3 chats';

  @override
  String get title => 'FluffyChat';

  @override
  String get toggleFavorite => 'Activer/désactiver en favori';

  @override
  String get toggleMuted => 'Activer/désactiver la sourdine';

  @override
  String get toggleUnread => 'Marquer comme lu / non lu';

  @override
  String get tooManyRequestsWarning =>
      'Trop de requêtes. Veuillez réessayer plus tard !';

  @override
  String get transferFromAnotherDevice =>
      'Transfert à partir d\'un autre appareil';

  @override
  String get tryToSendAgain => 'Retenter l\'envoi';

  @override
  String get unavailable => 'Indisponible';

  @override
  String unbannedUser(String username, String targetName) {
    return '$username a annulé le bannissement de $targetName';
  }

  @override
  String get unblockDevice => 'Retirer le blocage sur l\'appareil';

  @override
  String get unknownDevice => 'Appareil inconnu';

  @override
  String get unknownEncryptionAlgorithm => 'Algorithme de chiffrement inconnu';

  @override
  String unknownEvent(String type) {
    return 'Événement de type inconnu : \'$type\'';
  }

  @override
  String get unmuteChat => 'Retirer la sourdine de la discussion';

  @override
  String get unpin => 'Désépingler';

  @override
  String get unreadChats => 'null';

  @override
  String userAndOthersAreTyping(String username, int count) {
    return '$username et $count autres sont en train d\'écrire…';
  }

  @override
  String userAndUserAreTyping(String username, String username2) {
    return '$username et $username2 sont en train d\'écrire…';
  }

  @override
  String userIsTyping(String username) {
    return '$username est en train d\'écrire…';
  }

  @override
  String userLeftTheChat(String username) {
    return '🚪 $username a quitté la discussion';
  }

  @override
  String get username => 'Nom d\'utilisateur·ice';

  @override
  String userSentUnknownEvent(String username, String type) {
    return '$username a envoyé un évènement de type $type';
  }

  @override
  String get unverified => 'Non vérifié';

  @override
  String get verified => 'Vérifié';

  @override
  String get verify => 'Vérifier';

  @override
  String get verifyStart => 'Commencer la vérification';

  @override
  String get verifySuccess => 'La vérification a été effectuée avec succès !';

  @override
  String get verifyTitle => 'Vérification de l\'autre compte';

  @override
  String get videoCall => 'Appel vidéo';

  @override
  String get visibilityOfTheChatHistory =>
      'Visibilité de l\'historique de la discussion';

  @override
  String get visibleForAllParticipants =>
      'Visible pour tous les participant·es';

  @override
  String get visibleForEveryone => 'Visible pour tout le monde';

  @override
  String get voiceMessage => 'Message vocal';

  @override
  String get waitingPartnerAcceptRequest =>
      'En attente de l\'acceptation de la demande par le partenaire…';

  @override
  String get waitingPartnerEmoji =>
      'En attente de l\'acceptation de l\'émoji par le partenaire…';

  @override
  String get waitingPartnerNumbers =>
      'En attente de l\'acceptation des nombres par le partenaire…';

  @override
  String get wallpaper => 'Image de fond :';

  @override
  String get weSentYouAnEmail => 'Nous vous avons envoyé un courriel';

  @override
  String get whoIsAllowedToJoinThisGroup =>
      'Qui est autorisé·e à rejoindre ce groupe';

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
      'Grâce à ces adresses, vous pouvez récupérer votre mot de passe si vous en avez besoin.';

  @override
  String get writeAMessage => 'Écrivez un message…';

  @override
  String get yes => 'Oui';

  @override
  String get you => 'Vous';

  @override
  String get youAreNoLongerParticipatingInThisChat =>
      'Vous ne participez plus à cette discussion';

  @override
  String get youHaveBeenBannedFromThisChat =>
      'Vous avez été banni·e de cette discussion';

  @override
  String get yourPublicKey => 'Votre clé publique';

  @override
  String get time => 'Heure';

  @override
  String get messageType => 'Type de message';

  @override
  String get sender => 'Expéditeur/trice';

  @override
  String get removeFromSpace => 'Supprimer de l’espace';

  @override
  String get addToSpaceDescription =>
      'Sélectionnez un espace pour y ajouter cette discussion.';

  @override
  String get start => 'Commencer';

  @override
  String get publish => 'Publier';

  @override
  String videoWithSize(String size) {
    return 'Vidéo ($size)';
  }

  @override
  String get openChat => 'Ouvrir la discussion';

  @override
  String get markAsRead => 'Marquer comme lu';

  @override
  String get reportUser => 'Signaler l\'utilisateur/trice';

  @override
  String get dismiss => 'Rejeter';

  @override
  String reactedWith(String sender, String reaction) {
    return '$sender a réagi avec $reaction';
  }

  @override
  String get pinMessage => 'Épingler au salon';

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
  String get emojis => 'Émojis';

  @override
  String get placeCall => 'Passer un appel';

  @override
  String get voiceCall => 'Appel vocal';

  @override
  String get videoCallsBetaWarning =>
      'Veuillez noter que les appels vidéo sont actuellement en version bêta. Ils peuvent ne pas fonctionner comme prévu ou ne oas fonctionner du tout sur toutes les plateformes.';

  @override
  String get experimentalVideoCalls => 'Appels vidéo expérimentaux';

  @override
  String get emailOrUsername => 'Courriel ou identifiant';

  @override
  String get indexedDbErrorTitle => 'Problèmes relatifs au mode privé';

  @override
  String get indexedDbErrorLong =>
      'Le stockage des messages n\'est malheureusement pas activé par défaut en mode privé.\nVeuillez consulter :\n - about:config\n - Définir dom.indexedDB.privateBrowsing.enabled à « vrai ».\nSinon, il n\'est pas possible d\'exécuter FluffyChat.';

  @override
  String switchToAccount(String number) {
    return 'Passer au compte $number';
  }

  @override
  String get nextAccount => 'Compte suivant';

  @override
  String get previousAccount => 'Compte précédent';

  @override
  String get addWidget => 'Ajouter un widget';

  @override
  String get widgetVideo => 'Vidéo';

  @override
  String get widgetEtherpad => 'Note textuelle';

  @override
  String get widgetJitsi => 'Jitsi Meet';

  @override
  String get widgetCustom => 'Personnalisé';

  @override
  String get widgetName => 'Nom';

  @override
  String get widgetUrlError => 'Ceci n\'est pas un lien valide.';

  @override
  String get widgetNameError => 'Veuillez fournir un nom d\'affichage.';

  @override
  String get errorAddingWidget => 'Erreur lors de l\'ajout du widget.';

  @override
  String get youRejectedTheInvitation => 'Vous avez rejeté l\'invitation';

  @override
  String get youJoinedTheChat => 'Vous avez rejoint la discussion';

  @override
  String get youAcceptedTheInvitation => '👍 Vous avez accepté l\'invitation';

  @override
  String youBannedUser(String user) {
    return 'Vous avez banni $user';
  }

  @override
  String youHaveWithdrawnTheInvitationFor(String user) {
    return 'Vous avez retiré l\'invitation pour $user';
  }

  @override
  String youInvitedToBy(String alias) {
    return '📩 Vous avez été invité par lien à :\n$alias';
  }

  @override
  String invitedBy(String user) {
    return '📩 Invitation par $user';
  }

  @override
  String youInvitedUser(String user) {
    return '📩 Vous avez invité $user';
  }

  @override
  String youKicked(String user) {
    return '👞 Vous avez dégagé $user';
  }

  @override
  String youKickedAndBanned(String user) {
    return '🙅 Vous avez dégagé et banni $user';
  }

  @override
  String youUnbannedUser(String user) {
    return 'Vous avez débanni $user';
  }

  @override
  String hasKnocked(String user) {
    return '🚪 $user a frappé';
  }

  @override
  String userWouldLikeToChangeTheChat(String user) {
    return '$user souhaite rejoindre la discussion.';
  }

  @override
  String get noPublicLinkHasBeenCreatedYet =>
      'Aucun lien public n\'a encore été crée';

  @override
  String get knock => 'Frapper à la porte';

  @override
  String get users => 'Utilisateurs/trices';

  @override
  String countFiles(int count) {
    return '$count fichiers';
  }

  @override
  String get user => 'Utilisateur/trice';

  @override
  String get custom => 'Personnalisé';

  @override
  String get callingPermissions => 'Permissions d\'appel';

  @override
  String get callingAccount => 'Compte d\'appel';

  @override
  String get callingAccountDetails =>
      'Permet à FluffyChat d\'utiliser l\'application de numérotation native d\'Android.';

  @override
  String get appearOnTop => 'Apparaître en haut';

  @override
  String get appearOnTopDetails =>
      'Permet à l\'application d\'apparaître en haut de l\'écran (non nécessaire si vous avez déjà configuré Fluffychat comme compte d\'appel)';

  @override
  String get otherCallingPermissions =>
      'Microphone, caméra et autres autorisations de FluffyChat';

  @override
  String get whyIsThisMessageEncrypted =>
      'Pourquoi ce message est-il illisible ?';

  @override
  String get noKeyForThisMessage =>
      'Cela peut se produire si le message a été envoyé avant que vous ne vous soyez connecté à votre compte sur cet appareil.\n\nIl est également possible que l\'expéditeur ait bloqué votre appareil ou qu\'un problème de connexion Internet se soit produit.\n\nÊtes-vous capable de lire le message sur une autre session ? Vous pouvez alors transférer le message à partir de celle-ci ! Allez dans Paramètres > Appareils et assurez-vous que vos appareils se sont vérifiés mutuellement. Lorsque vous ouvrirez le salon la fois suivante et que les deux sessions seront au premier plan, les clés seront transmises automatiquement.\n\nVous ne voulez pas perdre les clés en vous déconnectant ou en changeant d\'appareil ? Assurez-vous que vous avez activé la sauvegarde de la discussion dans les paramètres.';

  @override
  String get newSpace => 'Nouvel espace';

  @override
  String get enterSpace => 'Entrer dans l’espace';

  @override
  String get enterRoom => 'Entrer dans le salon';

  @override
  String get allSpaces => 'Tous les espaces';

  @override
  String numChats(String number) {
    return '$number discussions';
  }

  @override
  String get hideUnimportantStateEvents =>
      'Masquer les événements d\'état sans importance';

  @override
  String get doNotShowAgain => 'Ne plus afficher';

  @override
  String wasDirectChatDisplayName(String oldDisplayName) {
    return 'Discussion vide (était $oldDisplayName)';
  }

  @override
  String get newSpaceDescription =>
      'Les espaces vous permettent de consolider vos conversations et de construire des communautés privées ou publiques.';

  @override
  String get encryptThisChat => 'Chiffrer cette discussion';

  @override
  String get disableEncryptionWarning =>
      'Pour des raisons de sécurité, vous ne pouvez pas désactiver le chiffrement dans une discussion s\'il a été activé avant.';

  @override
  String get sorryThatsNotPossible => 'Désolé, ce n\'est pas possible';

  @override
  String get deviceKeys => 'Clés de l’appareil :';

  @override
  String get noBackupWarning =>
      'Attention ! Sans l\'activation de la sauvegarde de la discussion, vous perdrez l\'accès à vos messages chiffrés. Il est fortement recommandé d\'activer la sauvegarde de la discussion avant de se déconnecter.';

  @override
  String get noOtherDevicesFound => 'Aucun autre appareil trouvé';

  @override
  String fileIsTooBigForServer(String max) {
    return 'Impossible d\'envoyer ! Le serveur accepte uniquement les pièces jointes jusqu\'à $max.';
  }

  @override
  String fileHasBeenSavedAt(String path) {
    return 'Le fichier a été enregistré dans $path';
  }

  @override
  String get readUpToHere => 'Lisez jusqu’ici';

  @override
  String get openLinkInBrowser => 'Ouvrir le lien dans le navigateur';

  @override
  String get reportErrorDescription =>
      '😭 Oh non. Quelque chose s\'est mal passé. Si vous le souhaitez, vous pouvez signaler ce bogue aux développeurs.';

  @override
  String get signInWithPassword => 'Se connecter avec mot de passe';

  @override
  String get pleaseTryAgainLaterOrChooseDifferentServer =>
      'Veuillez réessayer plus tard ou choisir un autre serveur.';

  @override
  String signInWith(String provider) {
    return 'Se connecter avec $provider';
  }

  @override
  String get profileNotFound =>
      'Cet utilisateur/trice n\'a pu être trouvé sur le serveur. Peut-être est-ce un problème de connexion ou l\'utilisateur/trice n\'existe pas.';

  @override
  String get setTheme => 'Définir le thème :';

  @override
  String get setColorTheme => 'Définir la couleur du thème :';

  @override
  String get invite => 'Inviter';

  @override
  String get inviteGroupChat => '📨 Inviter à une discussion de groupe';

  @override
  String get invitePrivateChat => '📨 Inviter à une discussion privée';

  @override
  String get invalidInput => 'Entrée invalide !';

  @override
  String get wrongPinEntered =>
      'Mauvais code PIN saisi ! Veuillez réessayer dans null secondes...';

  @override
  String get pleaseEnterANumber => 'Veuillez saisir un nombre supérieur à 0';

  @override
  String get banUserDescription =>
      'L\'utilisateur/trice sera banni de la discussion et ne pourra plus y accéder jusqu\'à ce qu\'il/elle soit débanni.';

  @override
  String get unbanUserDescription =>
      'L\'utilisateur/trice pourra entrer à nouveau dans la discussion si il/elle le souhaite.';

  @override
  String get kickUserDescription =>
      'L\'utilisateur/trice est expulsé de la discussion mais n\'est pas banni. Dans les discussions publiques, l\'utilisateur/trice peut revenir à tout moment.';

  @override
  String get makeAdminDescription =>
      'Une fois que vous aurez nommé cet utilisateur/trice administrateur, vous ne pourrez peut-être plus annuler cette opération, car il disposera alors des mêmes autorisations que vous.';

  @override
  String get pushNotificationsNotAvailable =>
      'Notifications poussées indisponibles';

  @override
  String get learnMore => 'En savoir plus';

  @override
  String get yourGlobalUserIdIs =>
      'Votre identifiant utilisateur global est : ';

  @override
  String noUsersFoundWithQuery(String query) {
    return 'Malheureusement, aucun utilisateur/trice n\'a pu être trouvé avec \"$query\". Veuillez vérifier si vous n\'avez pas fait de faute de frappe.';
  }

  @override
  String get knocking => 'Frapper';

  @override
  String chatCanBeDiscoveredViaSearchOnServer(String server) {
    return 'La discussion peut être découverte via la recherche sur $server';
  }

  @override
  String get searchChatsRooms =>
      'Rechercher des #discussions, @utilisateurs/trices...';

  @override
  String get nothingFound => 'Rien n\'a été trouvé...';

  @override
  String get createGroupAndInviteUsers =>
      'Créer un groupe et inviter des utilisateurs/trices';

  @override
  String get groupCanBeFoundViaSearch =>
      'Le groupe peut être trouvé via la recherche';

  @override
  String get startConversation => 'Démarrer la conversation';

  @override
  String get commandHint_sendraw => 'Envoyer du JSON brut';

  @override
  String get databaseMigrationTitle => 'La base de données est optimisée';

  @override
  String get databaseMigrationBody =>
      'Veuillez patienter. Cela peut prendre un moment.';

  @override
  String get searchForUsers => 'Rechercher des @utilisateurs/trices...';

  @override
  String get pleaseEnterYourCurrentPassword =>
      'Veuillez saisir votre mot de passe actuel';

  @override
  String get newPassword => 'Nouveau mot de passe';

  @override
  String get pleaseChooseAStrongPassword =>
      'Veuillez choisir un mot de passe fort';

  @override
  String get passwordsDoNotMatch => 'Les mots de passe ne correspondent pas';

  @override
  String get passwordIsWrong => 'Votre mot de passe saisi est erroné';

  @override
  String get publicLink => 'Lien public';

  @override
  String get publicChatAddresses => 'Addresses de discussion publiques';

  @override
  String get createNewAddress => 'Créer une nouvelle adresse';

  @override
  String get joinSpace => 'Rejoindre l\'espace';

  @override
  String get publicSpaces => 'Espaces publics';

  @override
  String get addChatOrSubSpace => 'Ajouter une discussion ou un sous-espace';

  @override
  String get subspace => 'Sous-espace';

  @override
  String get thisDevice => 'Cet appareil :';

  @override
  String get initAppError =>
      'Une erreur est survenue pendant l\'initialisation de l\'application';

  @override
  String get userRole => 'Rôle de l\'utilisateur/trice';

  @override
  String minimumPowerLevel(String level) {
    return '$level est le niveau minimum de droits.';
  }

  @override
  String searchIn(String chat) {
    return 'Rechercher dans la discussion \"$chat\"...';
  }

  @override
  String get searchMore => 'Rechercher davantage...';

  @override
  String databaseBuildErrorBody(String url, String error) {
    return 'La base de données SQlite ne peut pas être créée. L\'application essaie d\'utiliser la base de données existante pour le moment. Veuillez signaler cette erreur aux développeurs à $url. Le message d\'erreur est le suivant : $error';
  }

  @override
  String sessionLostBody(String url, String error) {
    return 'Votre session est perdue. Veuillez signaler cette erreur aux développeurs à $url. Le message d\'erreur est le suivant : $error';
  }

  @override
  String restoreSessionBody(String url, String error) {
    return 'L\'application tente maintenant de restaurer votre session depuis la sauvegarde. Veuillez signaler cette erreur aux développeurs à $url. Le message d\'erreur est le suivant : $error';
  }

  @override
  String forwardMessageTo(String roomName) {
    return 'Transférer le message à $roomName ?';
  }

  @override
  String get sendReadReceipts => 'Envoyer des accusés de réception';

  @override
  String get sendTypingNotificationsDescription =>
      'Les autres participants à une discussion peuvent voir que vous êtes en train de taper un nouveau message.';

  @override
  String get sendReadReceiptsDescription =>
      'Les autres participants à une discussion peuvent voir si vous avez lu un message.';

  @override
  String get formattedMessages => 'Messages formatés';

  @override
  String get formattedMessagesDescription =>
      'Affichez le contenu formaté des messages comme du texte en gras à l\'aide de markdown.';

  @override
  String get verifyOtherUser => '🔐 Vérifier l\'autre utilisateur/trice';

  @override
  String get verifyOtherUserDescription =>
      'Si vous vérifiez un autre utilisateur/trice, vous pouvez être sûr de savoir à qui vous écrivez réellement. 💪\n\nLorsque vous lancez une vérification, vous et l\'autre utilisateur/trice verrez une fenêtre contextuelle dans l\'application. Vous y verrez alors une série d\'émoticônes ou de chiffres que vous devrez comparer.\n\nLa meilleure façon de procéder est de se rencontrer ou de lancer un appel vidéo. 👭';

  @override
  String acceptedKeyVerification(String sender) {
    return '$sender a accepté la vérification de clé';
  }

  @override
  String canceledKeyVerification(String sender) {
    return '$sender a annulé la vérification de clé';
  }

  @override
  String completedKeyVerification(String sender) {
    return '$sender a terminé la vérification de clé';
  }

  @override
  String isReadyForKeyVerification(String sender) {
    return '$sender est prêt pour la vérification de clé';
  }

  @override
  String requestedKeyVerification(String sender) {
    return '$sender a demandé une vérification de clé';
  }

  @override
  String startedKeyVerification(String sender) {
    return '$sender a lancé la vérification de clé';
  }

  @override
  String get transparent => 'Transparent';

  @override
  String get incomingMessages => 'Messages entrants';

  @override
  String get stickers => 'Autocollants';

  @override
  String get discover => 'Découvrir';

  @override
  String get commandHint_ignore => 'Ignorer l\'identifiant Matrix indiqué';

  @override
  String get commandHint_unignore =>
      'Ne plus ignorer l\'identifiant Matrix indiqué';

  @override
  String unreadChatsInApp(String appname, String unread) {
    return '$appname : $unread discussions non lus';
  }

  @override
  String get noDatabaseEncryption =>
      'Le chiffrement de la base de données n\'est pas supporté sur cette plateforme';

  @override
  String thereAreCountUsersBlocked(Object count) {
    return 'Actuellement, il y a $count utilisateurs/trices bloqués.';
  }

  @override
  String goToSpace(Object space) {
    return 'Aller dans l\'espace : $space';
  }

  @override
  String get youDeletedThisMessage => 'You deleted this message';

  @override
  String get thisMessageWasDeleted => 'This message was deleted';

  @override
  String get refreshing => 'Refreshing...';

  @override
  String get markAsUnread => 'Marquer comme non lu';

  @override
  String userLevel(int level) {
    return '$level — Membre';
  }

  @override
  String moderatorLevel(int level) {
    return '$level — Modération';
  }

  @override
  String adminLevel(int level) {
    return '$level — Administration';
  }

  @override
  String get changeGeneralChatSettings =>
      'Modifier les paramètres généraux de la discussion';

  @override
  String get inviteOtherUsers =>
      'Inviter d\'autres membres dans cette discussion';

  @override
  String get changeTheChatPermissions =>
      'Modifier les autorisations de cette discussion';

  @override
  String get changeTheVisibilityOfChatHistory =>
      'Modifier la visibilité de l\'historique de la discussion';

  @override
  String get changeTheCanonicalRoomAlias =>
      'Modifier l\'adresse publique principale de la discussion';

  @override
  String get sendRoomNotifications => 'Send a @room notifications';

  @override
  String get changeTheDescriptionOfTheGroup =>
      'Modifier la description de la discussion';

  @override
  String get chatPermissionsDescription =>
      'Définir quel niveau de pouvoir est nécessaires pour certaines actions dans cette discussion. Les niveaux de pouvoir 0, 50 et 100 représentent généralement les membres, la modération et l\'administration, mais toute gradation est possible.';

  @override
  String updateInstalled(String version) {
    return '🎉 La mise à niveau $version est installée !';
  }

  @override
  String get changelog => 'Journal des modifications';

  @override
  String get sendCanceled => 'Envoi annulé';

  @override
  String get loginWithMatrixId => 'Connexion avec l\'identifiant Matrix';

  @override
  String get discoverHomeservers => 'Discover homeservers';

  @override
  String get whatIsAHomeserver => 'What is a homeserver?';

  @override
  String get homeserverDescription =>
      'All your data is stored on the homeserver, just like an email provider. You can choose which homeserver you want to use, while you can still communicate with everyone. Learn more at at https://invitation.be-mindpower.net/.';

  @override
  String get doesNotSeemToBeAValidHomeserver =>
      'Doesn\'t seem to be a compatible homeserver. Wrong URL?';

  @override
  String get calculatingFileSize => 'Calculating file size...';

  @override
  String get prepareSendingAttachment => 'Prepare sending attachment...';

  @override
  String get sendingAttachment => 'Sending attachment...';

  @override
  String get generatingVideoThumbnail => 'Generating video thumbnail...';

  @override
  String get compressVideo => 'Compressing video...';

  @override
  String sendingAttachmentCountOfCount(int index, int length) {
    return 'Sending attachment $index of $length...';
  }

  @override
  String serverLimitReached(int seconds) {
    return 'Server limit reached! Waiting $seconds seconds...';
  }

  @override
  String get oneOfYourDevicesIsNotVerified =>
      'One of your devices is not verified';

  @override
  String get noticeChatBackupDeviceVerification =>
      'Note: When you connect all your devices to the chat backup, they are automatically verified.';

  @override
  String get continueText => 'Continue';

  @override
  String get welcomeText =>
      'Hey Hey This is BMP. You can sign in to any homeserver, which is compatible with https://invitation.be-mindpower.net/. And then chat with anyone. It\'s a huge decentralized messaging network!';

  @override
  String get blur => 'Blur:';

  @override
  String get opacity => 'Opacity:';

  @override
  String get setWallpaper => 'Set wallpaper';

  @override
  String get manageAccount => 'Manage account';

  @override
  String get noContactInformationProvided =>
      'Server does not provide any valid contact information';

  @override
  String get contactServerAdmin => 'Contact server admin';

  @override
  String get contactServerSecurity => 'Contact server security';

  @override
  String get supportPage => 'Support page';

  @override
  String get serverInformation => 'Server information:';

  @override
  String get name => 'Name';

  @override
  String get version => 'Version';

  @override
  String get website => 'Website';

  @override
  String get compress => 'Compress';

  @override
  String get boldText => 'Bold text';

  @override
  String get italicText => 'Italic text';

  @override
  String get strikeThrough => 'Strikethrough';

  @override
  String get invalidUrl => 'Invalid url';

  @override
  String get addLink => 'Add link';

  @override
  String get unableToJoinChat =>
      'Unable to join chat. Maybe the other party has already closed the conversation.';

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
