// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class L10nEs extends L10n {
  L10nEs([String locale = 'es']) : super(locale);

  @override
  String get alwaysUse24HourFormat => 'falso';

  @override
  String get repeatPassword => 'Repite la contraseña';

  @override
  String get notAnImage => 'El archivo no es una imagen.';

  @override
  String get setCustomPermissionLevel =>
      'Agregar nivel personalizado de permiso';

  @override
  String get setPermissionsLevelDescription =>
      'Por favor elige un rol predeterminado o un nivel de permiso personalizado entre 0 a 100.';

  @override
  String get ignoreUser => 'Ignorar usuario';

  @override
  String get normalUser => 'Usuario normal';

  @override
  String get remove => 'Eliminar';

  @override
  String get importNow => 'Importar ahora';

  @override
  String get importEmojis => 'Importar emojis';

  @override
  String get importFromZipFile => 'Importar de un archivo .zip';

  @override
  String get exportEmotePack => 'Exportar paquete de emotes a .zip';

  @override
  String get replace => 'Reemplazar';

  @override
  String get about => 'Acerca de';

  @override
  String aboutHomeserver(String homeserver) {
    return 'Acerca de $homeserver';
  }

  @override
  String get accept => 'Aceptar';

  @override
  String acceptedTheInvitation(String username) {
    return '👍 $username aceptó la invitación';
  }

  @override
  String get account => 'Cuenta';

  @override
  String activatedEndToEndEncryption(String username) {
    return '🔐 $username activó el cifrado de extremo a extremo';
  }

  @override
  String get addEmail => 'Añadir dirección de correo';

  @override
  String get confirmMatrixId =>
      'Por favor confirma tu Matrix ID para borrar tu cuenta.';

  @override
  String supposedMxid(String mxid) {
    return 'Esto debería ser $mxid';
  }

  @override
  String get addChatDescription => 'Añadir una descripción del chat...';

  @override
  String get addToSpace => 'Agregar al espacio';

  @override
  String get admin => 'Administrador';

  @override
  String get alias => 'alias';

  @override
  String get all => 'Todo';

  @override
  String get allChats => 'Todos los chats';

  @override
  String get commandHint_roomupgrade =>
      'Actualizar este chat a la versión de chat dada';

  @override
  String get commandHint_googly => 'Enviar unos ojos saltones';

  @override
  String get commandHint_cuddle => 'Enviar un abrazo';

  @override
  String get commandHint_hug => 'Mandar un abrazo';

  @override
  String googlyEyesContent(String senderName) {
    return '$senderName te manda ojos saltones';
  }

  @override
  String cuddleContent(String senderName) {
    return '$senderName se acurruca contigo';
  }

  @override
  String hugContent(String senderName) {
    return '$senderName te abraza';
  }

  @override
  String answeredTheCall(String senderName) {
    return '$senderName respondió a la llamada';
  }

  @override
  String get anyoneCanJoin => 'Cualquiera puede unirse';

  @override
  String get appLock => 'Bloqueo de aplicación';

  @override
  String get appLockDescription =>
      'Bloquear la aplicación cuando no se use con código pin';

  @override
  String get archive => 'Archivo';

  @override
  String get unArchive => 'Unarchive';

  @override
  String get areGuestsAllowedToJoin => '¿Pueden unirse usuarios de visita?';

  @override
  String get areYouSure => '¿Estás seguro?';

  @override
  String get areYouSureYouWantToLogout => '¿Confirma que quiere cerrar sesión?';

  @override
  String get askSSSSSign =>
      'Para poder confirmar a la otra persona, ingrese su contraseña de almacenamiento segura o la clave de recuperación.';

  @override
  String askVerificationRequest(String username) {
    return '¿Aceptar esta solicitud de verificación de $username?';
  }

  @override
  String get autoplayImages =>
      'Reproducir emoticonos y stickers animados automáticamente';

  @override
  String badServerLoginTypesException(String serverVersions,
      String supportedVersions, Object suportedVersions) {
    return 'El servidor soporta los siguientes mecanismos para autenticación:\n$serverVersions\npero esta aplicación sólo soporta:\n$supportedVersions';
  }

  @override
  String get sendTypingNotifications =>
      'Enviar notificaciones \"está escribiendo\"';

  @override
  String get swipeRightToLeftToReply => 'Desliza a la izquierda para responder';

  @override
  String get alwaysShowMessageTimestamps =>
      'Mostrar siempre marcas de tiempo de mensajes';

  @override
  String get alwaysShowMessageTimestampsDescription =>
      'Mostrar marcas de tiempo para cada mensaje como WhatsApp';

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
  String get sendOnEnter => 'Enviar con enter';

  @override
  String badServerVersionsException(
      String serverVersions,
      String supportedVersions,
      Object serverVerions,
      Object supoortedVersions,
      Object suportedVersions) {
    return 'El servidor soporta las siguientes versiones de la especificación:\n$serverVersions\npero esta aplicación sólo soporta las versiones $supportedVersions';
  }

  @override
  String countChatsAndCountParticipants(int chats, int participants) {
    return '$chats chats y $participants participantes';
  }

  @override
  String countMembers(int count) {
    return '$count Members';
  }

  @override
  String get noMoreChatsFound => 'No se encontraron más chats...';

  @override
  String get noChatsFoundHere =>
      'No se han encontrado chats. Inicia un nuevo chat usando el botón de abajo. ⤵️';

  @override
  String get joinedChats => 'Chats Unidos';

  @override
  String get unread => 'No leídos';

  @override
  String get space => 'Espacio';

  @override
  String get spaces => 'Espacios';

  @override
  String get banFromChat => 'Vetar del chat';

  @override
  String get banned => 'Vetado';

  @override
  String bannedUser(String username, String targetName) {
    return '$username vetó a $targetName';
  }

  @override
  String get blockDevice => 'Bloquear dispositivo';

  @override
  String get blocked => 'Bloqueado';

  @override
  String get botMessages => 'Mensajes de bot';

  @override
  String get cancel => 'Cancelar';

  @override
  String cantOpenUri(String uri) {
    return 'No puedo abrir el URI $uri';
  }

  @override
  String get changeDeviceName => 'Cambiar el nombre del dispositivo';

  @override
  String changedTheChatAvatar(String username) {
    return '$username cambió el icono del chat';
  }

  @override
  String changedTheChatDescriptionTo(String username, String description) {
    return '$username cambió la descripción del chat a: \'$description\'';
  }

  @override
  String changedTheChatNameTo(String username, String chatname) {
    return '$username cambió el nombre del chat a: \'$chatname\'';
  }

  @override
  String changedTheChatPermissions(String username) {
    return '$username cambió los permisos del chat';
  }

  @override
  String changedTheDisplaynameTo(String username, String displayname) {
    return '$username cambió su nombre visible a: \'$displayname\'';
  }

  @override
  String changedTheGuestAccessRules(String username) {
    return '$username cambió las reglas de acceso de visitantes';
  }

  @override
  String changedTheGuestAccessRulesTo(String username, String rules) {
    return '$username cambió las reglas de acceso de visitantes a: $rules';
  }

  @override
  String changedTheHistoryVisibility(String username) {
    return '$username cambió la visibilidad del historial';
  }

  @override
  String changedTheHistoryVisibilityTo(String username, String rules) {
    return '$username cambió la visibilidad del historial a: $rules';
  }

  @override
  String changedTheJoinRules(String username) {
    return '$username cambió las reglas de ingreso';
  }

  @override
  String changedTheJoinRulesTo(String username, String joinRules) {
    return '$username cambió las reglas de ingreso a $joinRules';
  }

  @override
  String changedTheProfileAvatar(String username) {
    return '$username cambió su imagen de perfil';
  }

  @override
  String changedTheRoomAliases(String username) {
    return '$username cambió el alias de la sala';
  }

  @override
  String changedTheRoomInvitationLink(String username) {
    return '$username cambió el enlace de invitación';
  }

  @override
  String get changePassword => 'Cambiar la contraseña';

  @override
  String get changeTheHomeserver => 'Cambiar el servidor';

  @override
  String get changeTheme => 'Cambia tu estilo';

  @override
  String get changeTheNameOfTheGroup => 'Cambiar el nombre del grupo';

  @override
  String get changeYourAvatar => 'Cambiar tu avatar';

  @override
  String get channelCorruptedDecryptError => 'El cifrado se ha corrompido';

  @override
  String get chat => 'Chat';

  @override
  String get yourChatBackupHasBeenSetUp =>
      'Se ha configurado la copia de respaldo del chat.';

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
  String get chatDescription => 'Descripción del chat';

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
  String get tryAgain => 'Inténtelo de nuevo';

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
  String get search => 'Buscar';

  @override
  String get select => 'Elegir';

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
  String get logout => 'Cerrar sesión';

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
  String get group => 'Grupo';

  @override
  String get calls => 'Llamadas';

  @override
  String get done => 'Done!';

  @override
  String get taskCompletedSuccessfully => 'Task is completed\nsuccessfully';

  @override
  String get goBack => 'Go Back';

  @override
  String get signupSuccessMessage => 'You\'ve signed up \nsuccessfully';

  @override
  String get chatBackup => 'Copia de respaldo del chat';

  @override
  String get chatBackupDescription =>
      'La copia de respaldo del chat está protegida por una llave de seguridad. Procure no perderla.';

  @override
  String get chatDetails => 'Detalles del chat';

  @override
  String get chatHasBeenAddedToThisSpace =>
      'El chat se ha agregado a este espacio';

  @override
  String get chats => 'Conversaciones';

  @override
  String get chooseAStrongPassword => 'Elija una contraseña segura';

  @override
  String get clearArchive => 'Borrar archivo';

  @override
  String get close => 'Cerrar';

  @override
  String get commandHint_markasdm =>
      'Marcar como sala de mensajes directos para el ID de Matrix';

  @override
  String get commandHint_markasgroup => 'Marcar como grupo';

  @override
  String get commandHint_ban => 'Prohibir al usuario dado en esta sala';

  @override
  String get commandHint_clearcache => 'Limpiar cache';

  @override
  String get commandHint_create =>
      'Crear un chat grupal vacío\nUse --no-encryption para deshabilitar el cifrado';

  @override
  String get commandHint_discardsession => 'Descartar sesión';

  @override
  String get commandHint_dm =>
      'Iniciar un chat directo\nUse --no-encryption para deshabilitar el cifrado';

  @override
  String get commandHint_html => 'Enviar texto con formato HTML';

  @override
  String get commandHint_invite => 'Invitar al usuario indicado a esta sala';

  @override
  String get commandHint_join => 'Únete a la sala indicada';

  @override
  String get commandHint_kick => 'Eliminar el usuario indicado de esta sala';

  @override
  String get commandHint_leave => 'Deja esta sala';

  @override
  String get commandHint_me => 'Descríbete';

  @override
  String get commandHint_myroomavatar =>
      'Selecciona tu foto para esta sala (by mxc-uri)';

  @override
  String get commandHint_myroomnick =>
      'Establece tu nombre para mostrar para esta sala';

  @override
  String get commandHint_op =>
      'Establece el nivel de potencia del usuario dado (default: 50)';

  @override
  String get commandHint_plain => 'Enviar texto sin formato';

  @override
  String get commandHint_react => 'Enviar respuesta como reacción';

  @override
  String get commandHint_send => 'Enviar texto';

  @override
  String get commandHint_unban => 'Des banear al usuario dado en esta sala';

  @override
  String get commandInvalid => 'Comando inválido';

  @override
  String commandMissing(String command) {
    return '$command no es un comando.';
  }

  @override
  String get compareEmojiMatch => 'Por favor compare los emojis';

  @override
  String get compareNumbersMatch => 'Por favor compare los números';

  @override
  String get configureChat => 'Configurar chat';

  @override
  String get confirm => 'Confirmar';

  @override
  String get connect => 'Conectar';

  @override
  String get contactHasBeenInvitedToTheGroup =>
      'El contacto ha sido invitado al grupo';

  @override
  String get containsDisplayName => 'Contiene nombre para mostrar';

  @override
  String get containsUserName => 'Contiene nombre de usuario';

  @override
  String get contentHasBeenReported =>
      'El contenido ha sido reportado a los administradores del servidor';

  @override
  String get copiedToClipboard => 'Copiado al portapapeles';

  @override
  String get copy => 'Copiar';

  @override
  String get copyToClipboard => 'Copiar al portapapeles';

  @override
  String couldNotDecryptMessage(String error) {
    return 'No se pudo descifrar el mensaje: $error';
  }

  @override
  String get checkList => 'Lista de tareas';

  @override
  String countParticipants(int count) {
    return '$count participantes';
  }

  @override
  String countInvited(int count) {
    return '$count invitado';
  }

  @override
  String get create => 'Crear';

  @override
  String createdTheChat(String username) {
    return '💬$username creó el chat';
  }

  @override
  String get createGroup => 'Crear grupo';

  @override
  String get createNewSpace => 'Nuevo espacio';

  @override
  String get currentlyActive => 'Actualmente activo';

  @override
  String get darkTheme => 'Oscuro';

  @override
  String dateAndTimeOfDay(String date, String timeOfDay) {
    return '$date, $timeOfDay';
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
      'Se desactivará su cuenta de usuario. ¡La operación no se puede cancelar! ¿Está seguro?';

  @override
  String get defaultPermissionLevel =>
      'Nivel de permiso predeterminado para nuevo usuarios';

  @override
  String get delete => 'Eliminar';

  @override
  String get deleteAccount => 'Cancelar cuenta';

  @override
  String get deleteMessage => 'Eliminar mensaje';

  @override
  String get device => 'Dispositivo';

  @override
  String get deviceId => 'ID del dispositivo';

  @override
  String get devices => 'Dispositivos';

  @override
  String get directChats => 'Chat directo';

  @override
  String get allRooms => 'Todos los chats grupales';

  @override
  String get displaynameHasBeenChanged => 'El nombre visible ha cambiado';

  @override
  String get download => 'Download';

  @override
  String get downloadFile => 'Descargar archivo';

  @override
  String get edit => 'Editar';

  @override
  String get editBlockedServers => 'Editar servidores bloqueado';

  @override
  String get chatPermissions => 'Permisos del chat';

  @override
  String get editDisplayname => 'Editar nombre visible';

  @override
  String get editRoomAliases => 'Editar alias de la sala';

  @override
  String get editRoomAvatar => 'Editar avatar de sala';

  @override
  String get emoteExists => '¡El emote ya existe!';

  @override
  String get emoteInvalid => '¡El atajo del emote es inválido!';

  @override
  String get emoteKeyboardNoRecents =>
      'Los emotes usados recientemente aparecerán aquí...';

  @override
  String get emotePacks => 'Paquetes de emoticonos para la habitación';

  @override
  String get emoteSettings => 'Configuración de emotes';

  @override
  String get globalChatId => 'ID de chat Global';

  @override
  String get accessAndVisibility => 'Acceso y visibilidad';

  @override
  String get accessAndVisibilityDescription =>
      'A quién se le permite unirse a este chat y cómo se puede descubrir el chat.';

  @override
  String get customEmojisAndStickers => 'Emojis y stickers personalizados';

  @override
  String get customEmojisAndStickersBody =>
      'Agrega o comparte emojis y stickers personalizados que se pueden utilizar en cualquier chat.';

  @override
  String get emoteShortcode => 'Atajo de emote';

  @override
  String get emoteWarnNeedToPick =>
      '¡Debes elegir un atajo de emote y una imagen!';

  @override
  String get emptyChat => 'Chat vacío';

  @override
  String get enableEmotesGlobally =>
      'Habilitar paquete de emoticonos a nivel general';

  @override
  String get enableEncryption => 'Habilitar la encriptación';

  @override
  String get enableEncryptionWarning =>
      'Ya no podrá deshabilitar el cifrado. ¿Estás seguro?';

  @override
  String get encrypted => 'Encriptado';

  @override
  String get encryption => 'Cifrado';

  @override
  String get encryptionNotEnabled => 'El cifrado no está habilitado';

  @override
  String endedTheCall(String senderName) {
    return '$senderName terminó la llamada';
  }

  @override
  String get enterAnEmailAddress =>
      'Introducir una dirección de correo electrónico';

  @override
  String get homeserver => 'Servidor inicial';

  @override
  String get enterYourHomeserver => 'Ingrese su servidor';

  @override
  String errorObtainingLocation(String error) {
    return 'Error al obtener la ubicación: $error';
  }

  @override
  String get everythingReady => '¡Todo listo!';

  @override
  String get extremeOffensive => 'Extremadamente ofensivo';

  @override
  String get fileName => 'Nombre del archivo';

  @override
  String get fluffychat => 'BMP';

  @override
  String get fontSize => 'Tamaño de fuente';

  @override
  String get forward => 'Reenviar';

  @override
  String get fromJoining => 'Desde que se unió';

  @override
  String get fromTheInvitation => 'Desde la invitación';

  @override
  String get goToTheNewRoom => 'Ir a la nueva sala';

  @override
  String get chatDescriptionHasBeenChanged =>
      'Se ha cambiado la descripción del chat';

  @override
  String get groupIsPublic => 'El grupo es público';

  @override
  String get groups => 'Grupos';

  @override
  String groupWith(String displayname) {
    return 'Grupo con $displayname';
  }

  @override
  String get guestsAreForbidden => 'Los visitantes están prohibidos';

  @override
  String get guestsCanJoin => 'Los visitantes pueden unirse';

  @override
  String hasWithdrawnTheInvitationFor(String username, String targetName) {
    return '$username ha retirado la invitación para $targetName';
  }

  @override
  String get help => 'Ayuda';

  @override
  String get hideRedactedEvents => 'Ocultar sucesos censurados';

  @override
  String get hideRedactedMessages => 'Esconde mensajes eliminados';

  @override
  String get hideRedactedMessagesBody =>
      'Si alguien elimina un mensaje, este mensaje ya no será visible en el chat.';

  @override
  String get hideInvalidOrUnknownMessageFormats =>
      'Esconde formatos de mensajes inválidos o desconocidos';

  @override
  String get howOffensiveIsThisContent => '¿Cuán ofensivo es este contenido?';

  @override
  String get id => 'Identificación';

  @override
  String get identity => 'Identidad';

  @override
  String get block => 'Bloquear';

  @override
  String get blockedUsers => 'Usuarios bloqueados';

  @override
  String get blockListDescription =>
      'Puedes bloquear usuarios que te estén molestando. No podrás recibir mensajes ni invitaciones de chat de los usuarios de tu lista de bloqueo.';

  @override
  String get blockUsername => 'Ignorar nombre de usuario';

  @override
  String get iHaveClickedOnLink => 'He hecho clic en el enlace';

  @override
  String get incorrectPassphraseOrKey =>
      'Frase de contraseña o clave de recuperación incorrecta';

  @override
  String get inoffensive => 'Inofensivo';

  @override
  String get inviteContact => 'Invitar contacto';

  @override
  String inviteContactToGroupQuestion(Object contact, Object groupName) {
    return '¿Quieres invitar a $contact al chat $groupName?';
  }

  @override
  String inviteContactToGroup(String groupName) {
    return 'Invitar contacto a $groupName';
  }

  @override
  String get noChatDescriptionYet =>
      'No se ha creado una descripción del chat aún.';

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
      'Esta notificación aparece cuando el servicio en segundo plano se está ejecutando.';

  @override
  String get screenSharingTitle => 'Compartir la pantalla';

  @override
  String get screenSharingDetail =>
      'Usted está compartiendo su pantalla en BMP';

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
    return 'Archivos';
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
  String get setCustomEmotes => 'Establecer emoticonos personalizados';

  @override
  String get whoCanPerformWhichAction => 'Quién puede realizar qué acción';

  @override
  String get setting => 'Settings';

  @override
  String get financePersonalInfo => 'Información\npersonal';

  @override
  String get financeAddress => 'Dirección';

  @override
  String get financeID => 'Identificación';

  @override
  String get financeTermsOfService => 'Términos\nde servicio';

  @override
  String get financeBack => 'Atrás';

  @override
  String get financeCancel => 'Cancelar';

  @override
  String get financeCreate => 'Crear';

  @override
  String get financeNext => 'Siguiente';

  @override
  String get financeError => 'Error';

  @override
  String get financeFailedToAcceptToS =>
      'Error al aceptar los términos de servicio';

  @override
  String get financeTermsAcceptanceRequired =>
      'Por favor acepte los Términos de Servicio para continuar';

  @override
  String get financeIncompleteFields => 'Campos incompletos';

  @override
  String get financeValidEmail => 'Correo electrónico válido';

  @override
  String get financeBirthDate => 'Fecha de nacimiento';

  @override
  String get financeStreetAddress => 'Dirección';

  @override
  String get financeCity => 'Ciudad';

  @override
  String get financeCountry => 'Busca tu país';

  @override
  String get financeState => 'Busca tu estado';

  @override
  String get financePostalCode => 'Código postal';

  @override
  String get financePrimaryID => 'Identificación primaria';

  @override
  String get financePrimaryIDNumber => 'Número de identificación primaria';

  @override
  String get financeSecondaryID => 'Identificación secundaria';

  @override
  String get financeSecondaryIDNumber => 'Número de identificación secundaria';

  @override
  String get financeIDImages => 'Imágenes de identificación';

  @override
  String get financeIDType => 'Tipo de identificación';

  @override
  String get financeIDNumber => 'Número de identificación';

  @override
  String get financeSuccess => 'Éxito';

  @override
  String get financeAnErrorOccurred => 'Ocurrió un error';

  @override
  String get financeAnErrorOccurredTryAgain =>
      'Ocurrió un error. Por favor intente nuevamente.';

  @override
  String financeFailedToSetPIN(String message) {
    return 'Error al establecer PIN: $message';
  }

  @override
  String get financeCustomerUpdatedSuccess =>
      'Cliente actualizado exitosamente';

  @override
  String get financeFirstName => 'Nombre';

  @override
  String get financeLastName => 'Apellido';

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
  String get verificationCancelled =>
      'La verificación fue cancelada por el usuario';

  @override
  String get otherUserCancelledVerification =>
      'The other user cancelled the verification.';

  @override
  String get verificationTimeout =>
      'La verificación expiró. Por favor, inténtelo de nuevo.';

  @override
  String get verificationTimedOut =>
      'Verification timed out. Please try again.';

  @override
  String get unknownVerificationTransaction =>
      'Transacción de verificación desconocida. Por favor, inicie una nueva verificación.';

  @override
  String get methodNotSupported => 'Method Not Supported';

  @override
  String get verificationMethodNotSupported =>
      'Método de verificación no compatible. Por favor, pruebe un método diferente.';

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
  String get pleaseFillOut => 'Por favor, rellenar';

  @override
  String get newGroup => 'Nuevo grupo';

  @override
  String get imageGroup => 'Image group';

  @override
  String get groupName => 'Nombre de grupo';

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
  String get messages => 'Mensajes';

  @override
  String get decline => 'Declinar';

  @override
  String youInvitedBy(String user) {
    return '📩 Has sido invitado por $user';
  }

  @override
  String get invalidServerName => 'Nombre del servidor no válido';

  @override
  String get archiveRoomDescription =>
      'El chat se moverá al archivo. Otros usuarios podrán ver que has abandonado el chat.';

  @override
  String get hidePresences => '¿Esconder la lista de estado?';

  @override
  String get leaveEmptyToClearStatus => 'Deja vacío para limpiar tu estado.';

  @override
  String get removeFromBundle => 'Quitar de este paquete';

  @override
  String get encryptionSetupRequired =>
      'Encryption setup is required for secure messaging. Please complete the setup in Settings.';

  @override
  String get warning => '¡Advertencia!';

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
  String get verifyOtherDevice => '🔐 Verificar otro dispositivo';

  @override
  String get verifyOtherDeviceDescription =>
      'Cuando verificas otro dispositivo, esos dispositivos pueden intercambiar claves, incrementando tu seguridad global. 💪 Cuando inicias una verificación, aparece una ventana en la app en ambos dispositivos. En ella, verás una serie de emojis o números que tienes que comparar. Es mejor tener ambos dispositivos a mano antes de empezar la verificación. 🤳';

  @override
  String get removeDevicesDescription =>
      'Vas a salir en este dispositivo y ya no podrás recibir mensajes.';

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
  String get invited => 'Invitado';

  @override
  String get redactMessageDescription =>
      'El mensaje será censurado para todas las personas participantes en la conversación. Esto no se puede deshacer.';

  @override
  String get optionalRedactReason =>
      '(Opcional) Motivo para censurar este mensaje...';

  @override
  String invitedUser(String username, String targetName) {
    return '📩$username invitó a $targetName';
  }

  @override
  String get invitedUsersOnly => 'Sólo usuarios invitados';

  @override
  String get inviteForMe => 'Invitar por mí';

  @override
  String inviteText(String username, String link) {
    return '$username te invitó a BMP.\n1.instala la app\n2. Regístrate o inicia sesión\n3. Abre el enlace de invitación:\n$link';
  }

  @override
  String get gallery => 'Galería';

  @override
  String get document => 'Document';

  @override
  String get location => 'Location';

  @override
  String get contact => 'Contact';

  @override
  String get send => 'Enviar';

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
  String get recoveryKey => 'Clave de recuperación';

  @override
  String get storeInAndroidKeystore => 'Almacenar en la KeyStore de Android';

  @override
  String get storeInAppleKeyChain => 'Almacenar en la KeyChain de Apple';

  @override
  String get storeSecurlyOnThisDevice =>
      'Almacenar de forma segura en este dispositivo';

  @override
  String get storeInSecureStorageDescription =>
      'Almacenar la clave de recuperación en el almacenamiento seguro de este dispositivo.';

  @override
  String get saveKeyManuallyDescription =>
      'Compartir esta clave manualmente usando el diálogo de compartir del sistema o el portapapeles.';

  @override
  String get pleaseEnterRecoveryKeyDescription =>
      'Para desbloquear sus viejos mensajes, introduzca su clave de recuperación que se generó en una sesión anterior. Su clave de recuperación NO es su contraseña.';

  @override
  String get unlockOldMessages => 'Desbloquear mensajes viejos';

  @override
  String get wrongRecoveryKey =>
      'Lo siento... esta no parece ser la clave de recuperación correcta.';

  @override
  String get recoveryKeyLost => '¿Perdió su clave de recuperación?';

  @override
  String get wipeChatBackup =>
      '¿Limpiar la copia de seguridad de tu chat para crear una nueva clave de recuperación?';

  @override
  String get isTyping => 'está escribiendo…';

  @override
  String joinedTheChat(String username) {
    return '👋$username se unió al chat';
  }

  @override
  String get joinRoom => 'Unirse a la sala';

  @override
  String kicked(String username, String targetName) {
    return '👞$username echó a $targetName';
  }

  @override
  String kickedAndBanned(String username, String targetName) {
    return '🙅$username echó y vetó a $targetName';
  }

  @override
  String get kickFromChat => 'Echar del chat';

  @override
  String lastActiveAgo(String localizedTimeShort) {
    return 'Última vez activo: $localizedTimeShort';
  }

  @override
  String get leave => 'Abandonar';

  @override
  String get leftTheChat => 'Abandonó el chat';

  @override
  String get license => 'Licencia';

  @override
  String get lightTheme => 'Claro';

  @override
  String loadCountMoreParticipants(int count) {
    return 'Mostrar $count participantes más';
  }

  @override
  String get dehydrate => 'Exportar sesión y limpiar dispositivo';

  @override
  String get dehydrateWarning =>
      'Esta acción no se puede deshacer. Asegúrese de que ha almacenado de forma segura el fichero de copia de seguridad.';

  @override
  String get dehydrateTor => 'TOR: Exportar sesión';

  @override
  String get dehydrateTorLong =>
      'Si está usando TOR, es recomendable exportar la sesión antes de cerrar la ventana.';

  @override
  String get hydrateTor => 'TOR: Importar sesión exportada';

  @override
  String get hydrateTorLong =>
      '¿Exportó su sesión la última vez que estuvo en TOR? Impórtela rápidamente y continúe chateando.';

  @override
  String get hydrate => 'Restaurar desde fichero de copia de seguridad';

  @override
  String get loadingPleaseWait => 'Cargando… Por favor espere.';

  @override
  String get loadMore => 'Mostrar más…';

  @override
  String get locationDisabledNotice =>
      'Los servicios de ubicación están deshabilitado. Habilite para poder compartir su ubicación.';

  @override
  String get locationPermissionDeniedNotice =>
      'Permiso de ubicación denegado. Concédeles que puedan compartir tu ubicación.';

  @override
  String get login => 'Acceso';

  @override
  String logInTo(String homeserver) {
    return 'Iniciar sesión en $homeserver';
  }

  @override
  String get memberChanges => 'Cambios de miembros';

  @override
  String get mention => 'Mencionar';

  @override
  String get messagesStyle => 'Mensajes:';

  @override
  String get moderator => 'Moderador';

  @override
  String get muteChat => 'Silenciar chat';

  @override
  String get needPantalaimonWarning =>
      'Tenga en cuenta que necesita Pantalaimon para utilizar el cifrado de extremo a extremo por ahora.';

  @override
  String get newChat => 'Nuevo chat';

  @override
  String get newMessageInFluffyChat => ' New message in BMP';

  @override
  String get newVerificationRequest => '¡Nueva solicitud de verificación!';

  @override
  String get next => 'Siguiente';

  @override
  String get no => 'No';

  @override
  String get noConnectionToTheServer => 'Sin conexión al servidor';

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
  String get privacy => 'Privacidad';

  @override
  String get notification => 'Notification';

  @override
  String get wallet => 'Wallet';

  @override
  String get allCalls => 'All Calls';

  @override
  String get unreadCalls => 'Unread Calls';

  @override
  String get setChatDescription => 'Establecer descripción del chat';

  @override
  String get replaceRoomWithNewerVersion =>
      'Reemplazar habitación con una versión más nueva';

  @override
  String get roomUpgradeDescription =>
      'El chat se volverá a crear con la nueva versión de sala. Todos los participantes serán notificados de que tienen que cambiarse al nuevo chat. Puedes encontrar más información sobre versiones de salas en https://spec.matrix.org/latest/rooms/';

  @override
  String get usersMustKnock => 'Los usuarios han de avisar';

  @override
  String get noOneCanJoin => 'Nadie puede unirse';

  @override
  String get restricted => 'Restringido';

  @override
  String get knockRestricted => 'Aviso restringido';

  @override
  String get unknown => 'Unknown';

  @override
  String get openGallery => 'Abrir galería';

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
  String get unsupportedAndroidVersion => 'Versión de Android no compatible';

  @override
  String get unsupportedAndroidVersionLong =>
      'Esta característica requiere una versión más reciente de Android. Por favor, compruebe las actualizaciones o la compatibilidad de LineageOS.';

  @override
  String get available => 'Available';

  @override
  String get typeMessage => 'Type message..';

  @override
  String get report => 'informe';

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
  String get messageInfo => 'Información del mensaje';

  @override
  String get pinnMessage => 'Pin message';

  @override
  String get redactMessage => 'Censurar mensaje';

  @override
  String get reportMessage => 'Mensaje de informe';

  @override
  String get jumpToLastReadMessage => 'Saltar al último mensaje leído';

  @override
  String get jump => 'Saltar';

  @override
  String get enterNewChat => 'Ingresar a nuevo chat';

  @override
  String get reopenChat => 'Reabrir chat';

  @override
  String get reply => 'Responder';

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
      'La otra parte ahora mismo no está conectada y por tanto ¡no puede recibir mensajes!';

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
  String get sendAsText => 'Enviar como texto';

  @override
  String get whyDoYouWantToReportThis => '¿Por qué quieres denunciar esto?';

  @override
  String get reason => 'Razón';

  @override
  String get offensive => 'Ofensiva';

  @override
  String get confirmEventUnpin =>
      '¿Seguro que quiere desfijar permanentemente el evento?';

  @override
  String get noEmotesFound => 'Ningún emote encontrado. 😕';

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
      'Sólo se puede activar el cifrado en cuanto la sala deja de ser de acceso público.';

  @override
  String get noGoogleServicesWarning =>
      'Parece que no tienes servicios de Firebase Cloud Messaging en tu dispositivo. Para recibir de todas formas notificaciones, recomendamos instalar ntfy. Con ntfy o cualquier proveedor Unified Push, puedes recibir notificaciones manteniendo seguridad de datos. Puedes descargar ntfy de la PlayStore o de F-Droid.';

  @override
  String noMatrixServer(String server1, String server2) {
    return '$server1 no es un servidor matrix, usar $server2 en su lugar?';
  }

  @override
  String get shareInviteLink => 'Compartir enlace de invitación';

  @override
  String get scanQrCode => 'Escanear código QR';

  @override
  String get none => 'Ninguno';

  @override
  String get noPasswordRecoveryDescription =>
      'Aún no ha agregado una forma de recuperar su contraseña.';

  @override
  String get noPermission => 'Sin autorización';

  @override
  String get noRoomsFound => 'Ninguna sala encontrada…';

  @override
  String get notifications => 'Notificaciones';

  @override
  String get notificationsEnabledForThisAccount =>
      'Notificaciones habilitadas para esta cuenta';

  @override
  String numUsersTyping(int count) {
    return '$count usuarios están escribiendo…';
  }

  @override
  String get obtainingLocation => 'Obteniendo ubicación…';

  @override
  String get locationFound => 'Location Found';

  @override
  String get otherPartyCannotReceiveEncryptedMessages =>
      'Other party cannot receive encrypted messages';

  @override
  String get accuracy => 'Accuracy';

  @override
  String get offline => 'Desconectado';

  @override
  String get ok => 'Ok';

  @override
  String get online => 'Conectado';

  @override
  String get onlineKeyBackupEnabled =>
      'La copia de seguridad de la clave en línea está habilitada';

  @override
  String get oopsPushError =>
      '¡UPS¡ Desafortunadamente, se produjo un error al configurar las notificaciones push.';

  @override
  String get oopsSomethingWentWrong => 'Ups, algo salió mal…';

  @override
  String get openAppToReadMessages =>
      'Abrir la aplicación para leer los mensajes';

  @override
  String get openCamera => 'Abrir cámara';

  @override
  String get openVideoCamera => 'Abrir la cámara para un video';

  @override
  String get oneClientLoggedOut =>
      'Se ha cerrado en la sesión de uno de sus clientes';

  @override
  String get addAccount => 'Añadir cuenta';

  @override
  String get editBundlesForAccount => 'Editar paquetes para esta cuenta';

  @override
  String get addToBundle => 'Agregar al paquete';

  @override
  String get bundleName => 'Nombre del paquete';

  @override
  String get enableMultiAccounts =>
      '(BETA) habilite varias cuenta en este dispositivo';

  @override
  String get openInMaps => 'Abrir en maps';

  @override
  String get link => 'Link';

  @override
  String get serverRequiresEmail =>
      'Este servidor necesita validar su dirección de correo electrónico para registrarse.';

  @override
  String get or => 'O';

  @override
  String get participant => 'Participante';

  @override
  String get passphraseOrKey => 'contraseña o clave de recuperación';

  @override
  String get password => 'Contraseña';

  @override
  String get passwordForgotten => 'Contraseña olvidada';

  @override
  String get passwordHasBeenChanged => 'La contraseña ha sido cambiada';

  @override
  String get hideMemberChangesInPublicChats =>
      'Ocultar cambios de miembros en salas públicas';

  @override
  String get hideMemberChangesInPublicChatsBody =>
      'No mostrar en el chat que alguien entra o sale de una sala pública para mejorar la inteligibilidad.';

  @override
  String get overview => 'Vista general';

  @override
  String get notifyMeFor => 'Notificarme';

  @override
  String get passwordRecoverySettings => 'Ajustes de recuperación de clave';

  @override
  String get passwordRecovery => 'Recuperación de contraseña';

  @override
  String get people => 'Personas';

  @override
  String get pickImage => 'Elegir imagen';

  @override
  String get pin => 'Pin';

  @override
  String play(String fileName) {
    return 'Reproducir $fileName';
  }

  @override
  String get pleaseChoose => 'Por favor elija';

  @override
  String get pleaseChooseAPasscode => 'Elija un código de acceso';

  @override
  String get pleaseClickOnLink =>
      'Haga clic en el enlace del correo electrónico y luego continúe.';

  @override
  String get pleaseEnter4Digits =>
      'Ingrese 4 dígitos o déjelo en blanco para deshabilitar el bloqueo de la aplicación.';

  @override
  String get pleaseEnterRecoveryKey =>
      'Por favor, introduzca su clave de recuperación:';

  @override
  String get pleaseEnterYourPassword => 'Por favor ingrese su contraseña';

  @override
  String get pleaseEnterYourPin => 'Por favor ingrese su PIN';

  @override
  String get pleaseEnterYourUsername =>
      'Por favor ingrese su nombre de usuario';

  @override
  String get pleaseFollowInstructionsOnWeb =>
      'Por favor, siga las instrucciones del sitio web y presione \"siguiente\".';

  @override
  String get publicRooms => 'Salas públicas';

  @override
  String get pushRules => 'Regla de Push';

  @override
  String get recording => 'Grabando';

  @override
  String redactedBy(String username) {
    return 'Censurado por $username';
  }

  @override
  String get directChat => 'Chat directo';

  @override
  String redactedByBecause(String username, String reason) {
    return 'Censurado por $username porque: \"$reason\"';
  }

  @override
  String redactedAnEvent(String username) {
    return '$username censuró un suceso';
  }

  @override
  String get register => 'Registrarse';

  @override
  String get reject => 'Rechazar';

  @override
  String rejectedTheInvitation(String username) {
    return '$username rechazó la invitación';
  }

  @override
  String get rejoin => 'Volver a unirse';

  @override
  String get removeAllOtherDevices => 'Eliminar todos los otros dispositivos';

  @override
  String removedBy(String username) {
    return 'Eliminado por $username';
  }

  @override
  String get removeDevice => 'Eliminar dispositivo';

  @override
  String get unbanFromChat => 'Eliminar la expulsión';

  @override
  String get removeYourAvatar => 'Quitar tu avatar';

  @override
  String get requestPermission => 'Solicitar permiso';

  @override
  String get roomHasBeenUpgraded => 'La sala ha subido de categoría';

  @override
  String get roomVersion => 'Versión de sala';

  @override
  String get saveFile => 'Guardar el archivo';

  @override
  String get security => 'Seguridad';

  @override
  String seenByUser(String username) {
    return 'Visto por $username';
  }

  @override
  String get sendAMessage => 'Enviar un mensaje';

  @override
  String get sendAudio => 'Enviar audio';

  @override
  String get sendFile => 'Enviar un archivo';

  @override
  String get sendImage => 'Enviar una imagen';

  @override
  String sendImages(int count) {
    return 'Envío de la imagen $count';
  }

  @override
  String get sendMessages => 'Enviar mensajes';

  @override
  String get sendOriginal => 'Enviar el original';

  @override
  String get sendSticker => 'Enviar stickers';

  @override
  String get sendVideo => 'Enviar video';

  @override
  String sentAFile(String username) {
    return '$username envió un archivo';
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
    return '$username envió un audio';
  }

  @override
  String sentAPicture(String username) {
    return '$username envió una imagen';
  }

  @override
  String sentASticker(String username) {
    return '$username envió un sticker';
  }

  @override
  String sentAVideo(String username) {
    return '$username envió un video';
  }

  @override
  String sentCallInformations(String senderName) {
    return '$senderName envió información de la llamada';
  }

  @override
  String get separateChatTypes => 'Separar chats directos de grupos';

  @override
  String get setAsCanonicalAlias => 'Fijar alias principal';

  @override
  String get setInvitationLink => 'Establecer enlace de invitación';

  @override
  String get setPermissionsLevel => 'Establecer nivel de permisos';

  @override
  String get setStatus => 'Establecer estado';

  @override
  String get settings => 'Ajustes';

  @override
  String get share => 'Compartir';

  @override
  String sharedTheLocation(String username) {
    return '$username compartió la ubicación';
  }

  @override
  String get shareLocation => 'Compartir ubicación';

  @override
  String get showPassword => 'Mostrar contraseña';

  @override
  String get presenceStyle => 'Presencia:';

  @override
  String get presencesToggle => 'Mostrar mensajes de estado de otros usuarios';

  @override
  String get singlesignon => 'Inicio de sesión único';

  @override
  String get skip => 'Omitir';

  @override
  String get sourceCode => 'Código fuente';

  @override
  String get spaceIsPublic => 'El espacio es público';

  @override
  String get spaceName => 'Nombre del espacio';

  @override
  String startedACall(String senderName) {
    return '$senderName comenzó una llamada';
  }

  @override
  String get startFirstChat => 'Comience su primer chat';

  @override
  String get status => 'Estado';

  @override
  String get statusExampleMessage => '¿Cómo estás hoy?';

  @override
  String get submit => 'Enviar';

  @override
  String get synchronizingPleaseWait => 'Sincronizando... por favor espere.';

  @override
  String synchronizingPleaseWaitCounter(String percentage) {
    return ' Sincronizando… ($percentage%)';
  }

  @override
  String get systemTheme => 'Sistema';

  @override
  String get theyDontMatch => 'No coinciden';

  @override
  String get theyMatch => 'Coinciden';

  @override
  String get notFound => 'Not found';

  @override
  String get pinLimitMessage => 'You can only pin up to 3 chats';

  @override
  String get title => 'BMP';

  @override
  String get toggleFavorite => 'Alternar favorito';

  @override
  String get toggleMuted => 'Alternar silenciado';

  @override
  String get toggleUnread => 'Marcar como: leído / no leído';

  @override
  String get tooManyRequestsWarning =>
      'Demasiadas solicitudes. ¡Por favor inténtelo más tarde!';

  @override
  String get transferFromAnotherDevice => 'Transferir desde otro dispositivo';

  @override
  String get tryToSendAgain => 'Intentar enviar nuevamente';

  @override
  String get unavailable => 'Indisponible';

  @override
  String unbannedUser(String username, String targetName) {
    return '$username admitió a $targetName nuevamente';
  }

  @override
  String get unblockDevice => 'Desbloquear dispositivo';

  @override
  String get unknownDevice => 'Dispositivo desconocido';

  @override
  String get unknownEncryptionAlgorithm => 'Algoritmo de cifrado desconocido';

  @override
  String unknownEvent(String type) {
    return 'Evento desconocido \'$type\'';
  }

  @override
  String get unmuteChat => 'Dejar de silenciar el chat';

  @override
  String get unpin => 'Despinchar';

  @override
  String get unreadChats => 'null';

  @override
  String userAndOthersAreTyping(String username, int count) {
    return '$username y $count más están escribiendo…';
  }

  @override
  String userAndUserAreTyping(String username, String username2) {
    return '$username y $username2 están escribiendo…';
  }

  @override
  String userIsTyping(String username) {
    return '$username está escribiendo…';
  }

  @override
  String userLeftTheChat(String username) {
    return '$username abandonó el chat';
  }

  @override
  String get username => 'Nombre de usuario';

  @override
  String userSentUnknownEvent(String username, String type) {
    return '$username envió un evento $type';
  }

  @override
  String get unverified => 'No verificado';

  @override
  String get verified => 'Verificado';

  @override
  String get verify => 'Verificar';

  @override
  String get verifyStart => 'Comenzar verificación';

  @override
  String get verifySuccess => '¡Has verificado exitosamente!';

  @override
  String get verifyTitle => 'Verificando la otra cuenta';

  @override
  String get videoCall => 'Video llamada';

  @override
  String get visibilityOfTheChatHistory => 'Visibilidad del historial del chat';

  @override
  String get visibleForAllParticipants =>
      'Visible para todos los participantes';

  @override
  String get visibleForEveryone => 'Visible para todo el mundo';

  @override
  String get voiceMessage => 'Mensaje de voz';

  @override
  String get waitingPartnerAcceptRequest =>
      'Esperando a que el socio acepte la solicitud…';

  @override
  String get waitingPartnerEmoji =>
      'Esperando a que el socio acepte los emojis…';

  @override
  String get waitingPartnerNumbers =>
      'Esperando a que el socio acepte los números…';

  @override
  String get wallpaper => 'Fondo de pantalla:';

  @override
  String get weSentYouAnEmail => 'Te enviamos un correo electrónico';

  @override
  String get whoIsAllowedToJoinThisGroup =>
      'Quién tiene permitido unirse al grupo';

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
      'Con esta dirección puede recuperar su contraseña.';

  @override
  String get writeAMessage => 'Escribe un mensaje…';

  @override
  String get yes => 'Sí';

  @override
  String get you => 'Tú';

  @override
  String get youAreNoLongerParticipatingInThisChat =>
      'Ya no estás participando en este chat';

  @override
  String get youHaveBeenBannedFromThisChat => 'Has sido vetado de este chat';

  @override
  String get yourPublicKey => 'Tu clave pública';

  @override
  String get time => 'Tiempo';

  @override
  String get messageType => 'Tipo de Mensaje';

  @override
  String get sender => 'Remitente';

  @override
  String get removeFromSpace => 'Eliminar del espacio';

  @override
  String get addToSpaceDescription =>
      'Elige un espacio para añadirle este chat.';

  @override
  String get start => 'Iniciar';

  @override
  String get publish => 'Publicar';

  @override
  String videoWithSize(String size) {
    return 'Video ($size)';
  }

  @override
  String get openChat => 'Abrir chat';

  @override
  String get markAsRead => 'Marcar como leído';

  @override
  String get reportUser => 'Reportar usuario';

  @override
  String get dismiss => 'Descartar';

  @override
  String reactedWith(String sender, String reaction) {
    return '$sender reaccionó con $reaction';
  }

  @override
  String get pinMessage => 'Anclar a la sala';

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
  String get emojis => 'Emojis';

  @override
  String get placeCall => 'Llamar';

  @override
  String get voiceCall => 'Llamada de voz';

  @override
  String get videoCallsBetaWarning =>
      'Tenga en cuenta que las videollamadas están actualmente en fase beta. Es posible que no funcionen como se espera o que no funcionen de ninguna manera en algunas plataformas.';

  @override
  String get experimentalVideoCalls => 'Videollamadas experimentales';

  @override
  String get emailOrUsername => 'Correo electrónico o nombre de usuario';

  @override
  String get indexedDbErrorTitle => 'Problemas con el modo privado';

  @override
  String get indexedDbErrorLong =>
      'El almacenamiento de mensajes, por desgracia, no está habilitado en el modo privado por defecto.\nPor favor, visite\n - about:config\n - Establezca dom.indexedDB.privateBrowsing.enabled a true\nDe otra forma, no es posible usar BMP.';

  @override
  String switchToAccount(String number) {
    return 'Cambiar a la cuenta $number';
  }

  @override
  String get nextAccount => 'Siguiente cuenta';

  @override
  String get previousAccount => 'Cuenta anterior';

  @override
  String get addWidget => 'Añadir widget';

  @override
  String get widgetVideo => 'Vídeo';

  @override
  String get widgetEtherpad => 'Nota de texto';

  @override
  String get widgetJitsi => 'Jitsi Meet';

  @override
  String get widgetCustom => 'Personalizado';

  @override
  String get widgetName => 'Nombre';

  @override
  String get widgetUrlError => 'Esta no es una URL válida.';

  @override
  String get widgetNameError => 'Por favor proporciona un nombre para mostrar.';

  @override
  String get errorAddingWidget => 'Fallo al añadir el widget.';

  @override
  String get youRejectedTheInvitation => 'Rechazaste la invitación';

  @override
  String get youJoinedTheChat => 'Usted se ha unido al chat';

  @override
  String get youAcceptedTheInvitation => '👍 Aceptaste la invitación';

  @override
  String youBannedUser(String user) {
    return 'Usted prohibió el acceso a $user';
  }

  @override
  String youHaveWithdrawnTheInvitationFor(String user) {
    return 'Usted retiró la invitación a $user';
  }

  @override
  String youInvitedToBy(String alias) {
    return '📩 Te han invitado con un enlace a:\n$alias';
  }

  @override
  String invitedBy(String user) {
    return '📩 Invitado por $user';
  }

  @override
  String youInvitedUser(String user) {
    return '📩 Usted invitó a $user';
  }

  @override
  String youKicked(String user) {
    return '👞 Usted expulsó a $user';
  }

  @override
  String youKickedAndBanned(String user) {
    return '🙅 Usted expulsó y prohibió el acceso a $user';
  }

  @override
  String youUnbannedUser(String user) {
    return 'Usted volvió a permitir el acceso a $user';
  }

  @override
  String hasKnocked(String user) {
    return '🚪 $user ha avisado';
  }

  @override
  String userWouldLikeToChangeTheChat(String user) {
    return '$user quiere unirse al chat.';
  }

  @override
  String get noPublicLinkHasBeenCreatedYet =>
      'No se ha creado un enlace público aún';

  @override
  String get knock => 'Aviso';

  @override
  String get users => 'Usuarios';

  @override
  String countFiles(int count) {
    return '$count archivos';
  }

  @override
  String get user => 'Usuario';

  @override
  String get custom => 'Personalizado';

  @override
  String get callingPermissions => 'Permisos de llamadas';

  @override
  String get callingAccount => 'Llamando a cuenta';

  @override
  String get callingAccountDetails =>
      'Permite a BMPutilizar la aplicación de llamadas nativa de Android.';

  @override
  String get appearOnTop => 'Aparecer en la cima';

  @override
  String get appearOnTopDetails =>
      'Permite que la app aparezca delante (no hace falta si ya tienes BMPconfigurado como cuenta llamante)';

  @override
  String get otherCallingPermissions =>
      'Micrófono, cámara y otros permisos de BMP';

  @override
  String get whyIsThisMessageEncrypted =>
      '¿Por qué no se puede leer este mensaje?';

  @override
  String get noKeyForThisMessage =>
      'Esto puede ocurrir si el mensaje se envió antes de que entraras en tu cuenta en este dispositivo.\n\nTambién puede que el remitente haya bloqueado tu dispositivo o haya fallado algo en la conexión a Internet.\n\n¿Puedes leer el mensaje en otra sesión? Entonces, ¡puedes transferir el mensaje desde allí! Ve a Ajustes > Dispositivos y asegúrate de que tus dispositivos se han verificado mutuamente. Cuando abras la sala la próxima vez y ambas sesiones estén en primer plano, las claves se transmitirán automáticamente.\n\n¿No quieres perder las claves al salir o al cambiar de dispositivo? Asegúrate de que has habilitado la copia de seguridad del chat en los ajustes.';

  @override
  String get newSpace => 'Nuevo espacio';

  @override
  String get enterSpace => 'Unirse al espacio';

  @override
  String get enterRoom => 'Unirse a la sala';

  @override
  String get allSpaces => 'Todos los espacios';

  @override
  String numChats(String number) {
    return '$number chats';
  }

  @override
  String get hideUnimportantStateEvents =>
      'Ocultar eventos de estado no importantes';

  @override
  String get doNotShowAgain => 'No mostrar de nuevo';

  @override
  String wasDirectChatDisplayName(String oldDisplayName) {
    return 'Chat vacío (era $oldDisplayName)';
  }

  @override
  String get newSpaceDescription =>
      'Los espacios permiten consolidar los chats y montar comunidades privadas o públicas.';

  @override
  String get encryptThisChat => 'Cifrar este chat';

  @override
  String get disableEncryptionWarning =>
      'Por motivos de seguridad no es posible deshabilitar el cifrado en un chat si ha sido habilitado previamente.';

  @override
  String get sorryThatsNotPossible => 'Lo siento... eso no es posible';

  @override
  String get deviceKeys => 'Claves de dispositivo:';

  @override
  String get noBackupWarning =>
      '¡Cuidado! Si no se habilita la copia de seguridad del chat, perderás acceso a tus mensajes cifrados. Se recomienda encarecidamente habilitar la copia de seguridad del chat antes de salir.';

  @override
  String get noOtherDevicesFound => 'No se han encontrado otros dispositivos';

  @override
  String fileIsTooBigForServer(String max) {
    return '¡No se pudo mandar! El servidor solamente permite adjuntos de hasta $max.';
  }

  @override
  String fileHasBeenSavedAt(String path) {
    return 'Archivo guardado en $path';
  }

  @override
  String get readUpToHere => 'Leer hasta aquí';

  @override
  String get openLinkInBrowser => 'Abrir enlace en navegador';

  @override
  String get reportErrorDescription =>
      '😭 Oh, no. Algo ha salido mal. Si quieres, puedes informar de este fallo a los desarrolladores.';

  @override
  String get signInWithPassword => 'Entrar con clave';

  @override
  String get pleaseTryAgainLaterOrChooseDifferentServer =>
      'Por favor, intente luego o elija un servidor distinto.';

  @override
  String signInWith(String provider) {
    return 'Entrar con $provider';
  }

  @override
  String get profileNotFound =>
      'El usuario no se encontró en el servidor. Puede que haya un problema de conexión o el usuario no exista.';

  @override
  String get setTheme => 'Poner tema:';

  @override
  String get setColorTheme => 'Poner tema de color:';

  @override
  String get invite => 'Invitación';

  @override
  String get inviteGroupChat => '📨 Invitar a grupo de chat';

  @override
  String get invitePrivateChat => '📨 Invitar a chat privado';

  @override
  String get invalidInput => '¡Entrada no válida!';

  @override
  String wrongPinEntered(int seconds) {
    return '¡Pin erróneo! Vuelve a intenrarlo en $seconds segundos...';
  }

  @override
  String get pleaseEnterANumber => 'Por favor pon un número mayor que 0';

  @override
  String get banUserDescription =>
      'Se expulsará al usuario del chat y no podrá volver a entrar hasta que se le permita.';

  @override
  String get unbanUserDescription =>
      'El usuario podrá entrar al chat de nuevo si lo intenta.';

  @override
  String get kickUserDescription =>
      'Se expulsa al usuario del chat, pero no se le prohíbe volver a entrar. En chats públicos, el usuario podrá volver a entrar en cualquier momento.';

  @override
  String get makeAdminDescription =>
      'Una vez hagas que este usuario sea admin, puede que no puedas deshacerlo porque tendrá los mismos permisos que tú.';

  @override
  String get pushNotificationsNotAvailable =>
      'No están disponibles las notificaciones emergentes';

  @override
  String get learnMore => 'Aprender más';

  @override
  String get yourGlobalUserIdIs => 'Tu id de usuario global es: ';

  @override
  String noUsersFoundWithQuery(String query) {
    return 'Desgraciadamente, no se encontró ningún usuario con \"$query\". Por favor, revisa si cometiste un error.';
  }

  @override
  String get knocking => 'Avisando';

  @override
  String chatCanBeDiscoveredViaSearchOnServer(String server) {
    return 'El chat se puede descubrir buscando en $server';
  }

  @override
  String get searchChatsRooms => 'Buscar #chats, @usuarios...';

  @override
  String get nothingFound => 'No se encontró nada...';

  @override
  String get createGroupAndInviteUsers => 'Crear un grupo e invitar usuarios';

  @override
  String get groupCanBeFoundViaSearch =>
      'Los grupos se pueden encontrar buscando';

  @override
  String get startConversation => 'Iniciar conversación';

  @override
  String get commandHint_sendraw => 'Mandar json pelado';

  @override
  String get databaseMigrationTitle => 'La base de datos está optimizada';

  @override
  String get databaseMigrationBody =>
      'Por favor espera. Esto llevará un momento.';

  @override
  String get searchForUsers => 'Buscar @usuarios...';

  @override
  String get pleaseEnterYourCurrentPassword => 'Por favor, pon tu clave actual';

  @override
  String get newPassword => 'Nueva clave';

  @override
  String get pleaseChooseAStrongPassword => 'Por favor, pon una clave fuerte';

  @override
  String get passwordsDoNotMatch => 'Las claves no coinciden';

  @override
  String get passwordIsWrong => 'La clave que has puesto es incorrecta';

  @override
  String get publicLink => 'Enlace público';

  @override
  String get publicChatAddresses => 'Dirección de chat pública';

  @override
  String get createNewAddress => 'Crear nueva dirección';

  @override
  String get joinSpace => 'Unirse al espacio';

  @override
  String get publicSpaces => 'Espacios públicos';

  @override
  String get addChatOrSubSpace => 'Añadir chat o sub espacio';

  @override
  String get subspace => 'Sub espacio';

  @override
  String get thisDevice => 'Este dispositivo:';

  @override
  String get initAppError => 'Hubo un error al arrancar la app';

  @override
  String get userRole => 'Rol de usuario';

  @override
  String minimumPowerLevel(String level) {
    return '$level es el nivel mínimo.';
  }

  @override
  String searchIn(String chat) {
    return 'Buscar en chat \"$chat\"...';
  }

  @override
  String get searchMore => 'Buscar más...';

  @override
  String databaseBuildErrorBody(String url, String error) {
    return 'No pude crear la base de datos SQlite. La app intenta usar la base de datos heredada por ahora. Por favor, informa de este error a los desarrolladores en $url. El mensaje de error es: $error';
  }

  @override
  String sessionLostBody(String url, String error) {
    return 'Se perdió tu sesión. Por favor, informa de este error a los desarrolladores en $url. El mensaje de error es: $error';
  }

  @override
  String restoreSessionBody(String url, String error) {
    return 'La app ahora trata de recuperar tu sesión de la copia de seguridad. Por favor, informa de este error a los desarrolladores en $url. El mensaje de error es: $error';
  }

  @override
  String forwardMessageTo(String roomName) {
    return '¿Reenviar mensaje a $roomName?';
  }

  @override
  String get sendReadReceipts => 'Mandar recibos de lectura';

  @override
  String get sendTypingNotificationsDescription =>
      'Otros participantes en un chat pueden ver cuándo estás escribiendo un mensaje.';

  @override
  String get sendReadReceiptsDescription =>
      'Otros participantes en un chat pueden ver cuándo has leído un mensaje.';

  @override
  String get formattedMessages => 'Mensajes con formato';

  @override
  String get formattedMessagesDescription =>
      'Mostrar contenido de mensaje enriquecido, como texto en negrita, usando markdown.';

  @override
  String get verifyOtherUser => '🔐 Verificar a otro usuario';

  @override
  String get verifyOtherUserDescription =>
      'Si verificas a otro usuario, puedes estar seguro de a quién estás escribiendo realmente. 💪\n\nCuando empiezas una verificación, tú y el otro usuario veréis una ventana emergente en la app. En ella veréis una serie de emojiso números que tenéis que comparar.\n\nLa mejor forma de hacer esto es quedar o una videollamada. 👭';

  @override
  String acceptedKeyVerification(String sender) {
    return '$sender aceptó la verificación de clave';
  }

  @override
  String canceledKeyVerification(String sender) {
    return '$sender canceló la verificación de clave';
  }

  @override
  String completedKeyVerification(String sender) {
    return '$sender completó la verificación de clave';
  }

  @override
  String isReadyForKeyVerification(String sender) {
    return '$sender está preparado para verificación de clave';
  }

  @override
  String requestedKeyVerification(String sender) {
    return '$sender ha pedido verificación de clave';
  }

  @override
  String startedKeyVerification(String sender) {
    return '$sender ha comenzado verificación de clave';
  }

  @override
  String get transparent => 'Transparente';

  @override
  String get incomingMessages => 'Mensajes entrantes';

  @override
  String get stickers => 'Pegatinas';

  @override
  String get discover => 'Descubrir';

  @override
  String get commandHint_ignore => 'Ignorar la ID de matrix dada';

  @override
  String get commandHint_unignore => 'No ignorar la ID de matrix dada';

  @override
  String unreadChatsInApp(String appname, String unread) {
    return '$appname: $unread chats no leídos';
  }

  @override
  String get noDatabaseEncryption =>
      'En esta plataforma no hay cifrado de base de datos';

  @override
  String thereAreCountUsersBlocked(Object count) {
    return 'Ahora mismo, hay $count usuarios bloqueados.';
  }

  @override
  String goToSpace(Object space) {
    return 'Ir al espacio: $space';
  }

  @override
  String get youDeletedThisMessage => 'You deleted this message';

  @override
  String get thisMessageWasDeleted => 'This message was deleted';

  @override
  String get refreshing => 'Refreshing...';

  @override
  String get markAsUnread => 'Marcar no leído';

  @override
  String userLevel(int level) {
    return '$level - Usuario';
  }

  @override
  String moderatorLevel(int level) {
    return '$level - Moderador';
  }

  @override
  String adminLevel(int level) {
    return '$level - Administrador';
  }

  @override
  String get changeGeneralChatSettings =>
      'Cambiar los ajustes generales de chat';

  @override
  String get inviteOtherUsers => 'Invitar a otros usuarios a este chat';

  @override
  String get changeTheChatPermissions => 'Cambiar los permisos de chat';

  @override
  String get changeTheVisibilityOfChatHistory =>
      'Cambiar la visibilidad de la historia de chat';

  @override
  String get changeTheCanonicalRoomAlias =>
      'Cambiar la dirección pública principal de chat';

  @override
  String get sendRoomNotifications => 'Mandar notificación @sala';

  @override
  String get changeTheDescriptionOfTheGroup =>
      'Cambiar la descripción del chat';

  @override
  String get chatPermissionsDescription =>
      'Definir el nivel necesario para ciertas acciones en este chat. Los niveles 0, 50 y 100 habitualmente representan usuarios, moderadores y administradores, pero se puede establecer cualquier escala.';

  @override
  String updateInstalled(String version) {
    return '¡🎉 Actualización $version instalada!';
  }

  @override
  String get changelog => 'Cambios';

  @override
  String get sendCanceled => 'Envío cancelado';

  @override
  String get loginWithMatrixId => 'Entrar con un ID de Matrix';

  @override
  String get discoverHomeservers => 'Descubrir homeservers';

  @override
  String get whatIsAHomeserver => '¿Qué es un homeserver?';

  @override
  String get homeserverDescription =>
      'Todos tus datos se guardan en el homeserver, como en un proveedor de correo electrónico. Puedes elegir el homeserver que quieres usar, a la par que te puedes comunicar con todos. Más en https://invitation.be-mindpower.net/.';

  @override
  String get doesNotSeemToBeAValidHomeserver =>
      'No parece ser un homeserver compatible. ¿URL equivocada?';

  @override
  String get calculatingFileSize => 'Calculando tamaño de archivo...';

  @override
  String get prepareSendingAttachment => 'Prepara envío del adjunto...';

  @override
  String get sendingAttachment => 'Enviando adjunto...';

  @override
  String get generatingVideoThumbnail => 'Generando miniatura de vídeo...';

  @override
  String get compressVideo => 'Comprimiendo vídeo...';

  @override
  String sendingAttachmentCountOfCount(int index, int length) {
    return 'Enviando adjunto $index de $length...';
  }

  @override
  String serverLimitReached(int seconds) {
    return '¡Alcanzado límite del servidor! Esperando $seconds segundos...';
  }

  @override
  String get oneOfYourDevicesIsNotVerified =>
      'Uno de tus dispositivos no está verificado';

  @override
  String get noticeChatBackupDeviceVerification =>
      'Nota: Cuando conectas todos tus dispositivos a la copia de seguridad del chat, son verificados automáticamente.';

  @override
  String get continueText => 'Continuar';

  @override
  String get welcomeText =>
      'Eh, eh, 👋 Esto es BMP. Puedes acceder a cualquier homeserver, que sea compatible con https://invitation.be-mindpower.net/. Y luego chatear con cualquiera. ¡Es una red de mensajería descentralizada enorme!';

  @override
  String get blur => 'Difuminar:';

  @override
  String get opacity => 'Opacidad:';

  @override
  String get setWallpaper => 'Poner fondo';

  @override
  String get manageAccount => 'Gestionar cuenta';

  @override
  String get noContactInformationProvided =>
      'El servidor no suministra ninguna información de contacto válida';

  @override
  String get contactServerAdmin =>
      'Contactar con el administrador del servidor';

  @override
  String get contactServerSecurity => 'Contactar con seguridad del servidor';

  @override
  String get supportPage => 'Página de atención';

  @override
  String get serverInformation => 'Información del servidor:';

  @override
  String get name => 'Nombre';

  @override
  String get version => 'Versión';

  @override
  String get website => 'Web';

  @override
  String get compress => 'Comprimir';

  @override
  String get boldText => 'Texto en negrita';

  @override
  String get italicText => 'Texto en cursiva';

  @override
  String get strikeThrough => 'Tachado';

  @override
  String get invalidUrl => 'URL incorrecta';

  @override
  String get addLink => 'Añadir enlace';

  @override
  String get unableToJoinChat =>
      'No se puede entrar al chat. Puede que la otra parte ya haya cerrado la conversación.';

  @override
  String get previous => 'Anterior';

  @override
  String appWantsToUseForLogin(String server) {
    return 'Usar \'$server\' para entrar';
  }

  @override
  String get appWantsToUseForLoginDescription =>
      'Por la presente permites a la app y web compartir información sobre ti.';

  @override
  String get open => 'Abrir';

  @override
  String get waitingForServer => 'Esperando al servidor...';

  @override
  String get appIntroduction =>
      'BMPte permite chatear con tus amigos con diferentes mensajerías. Aprende más en https://invitation.be-mindpower.net/ o simplemente pincha *Continuar*.';

  @override
  String get newChatRequest => '📩 Nueva petición de chat';

  @override
  String get contentNotificationSettings =>
      'Ajustes de notificación de contenido';

  @override
  String get generalNotificationSettings => 'Ajustes de notificación generales';

  @override
  String get roomNotificationSettings => 'Ajustes de notificación de salas';

  @override
  String get userSpecificNotificationSettings =>
      'Ajustes de notificación por usuario';

  @override
  String get otherNotificationSettings => 'Otros ajustes de notificación';

  @override
  String get notificationRuleContainsUserName => 'Contiene nombre de usuario';

  @override
  String get notificationRuleContainsUserNameDescription =>
      'Notifica al usuario cuando un mensaje contiene su nombre de usuario.';

  @override
  String get notificationRuleMaster => 'Silenciar todas las notificaciones';

  @override
  String get notificationRuleMasterDescription =>
      'Anula todas las demás reglas y desactiva todas las notificaciones.';

  @override
  String get notificationRuleSuppressNotices =>
      'Suprimir los mensajes automáticos';

  @override
  String get notificationRuleSuppressNoticesDescription =>
      'Suprimir notificaciones de clientes automáticos, como bots.';

  @override
  String get notificationRuleInviteForMe => 'Invitación para mí';

  @override
  String get notificationRuleInviteForMeDescription =>
      'Notifica al usuario cuando se les invita a una sala.';

  @override
  String get notificationRuleMemberEvent => 'Evento para miembros';

  @override
  String get notificationRuleMemberEventDescription =>
      'Suprimir notificaciones de eventos para miembros.';

  @override
  String get notificationRuleIsUserMention => 'Mención al usuario';

  @override
  String get notificationRuleIsUserMentionDescription =>
      'Notifica al usuario cuando son mencionados directamente en un mensaje.';

  @override
  String get notificationRuleContainsDisplayName =>
      'Contiene el nombre visible';

  @override
  String get notificationRuleContainsDisplayNameDescription =>
      'Notifica al usuario cuando un mensaje contiene su nombre visible.';

  @override
  String get notificationRuleIsRoomMention => 'Mención de sala';

  @override
  String get notificationRuleIsRoomMentionDescription =>
      'Notifica al usuario cuando hay una mención de sala.';

  @override
  String get notificationRuleRoomnotif => 'Notificación de sala';

  @override
  String get notificationRuleRoomnotifDescription =>
      'Notifica al usuario cuando un mensaje contiene \'@sala\'.';

  @override
  String get notificationRuleTombstone => 'Lápida';

  @override
  String get notificationRuleTombstoneDescription =>
      'Notifica al usuario sobre mensajes de desactivación de sala.';

  @override
  String get notificationRuleReaction => 'Reacción';

  @override
  String get notificationRuleReactionDescription =>
      'Suprime notificaciones por reacciones.';

  @override
  String get notificationRuleRoomServerAcl => 'ACL de servidor de sala';

  @override
  String get notificationRuleRoomServerAclDescription =>
      'Suprime notificaciones de listas de control de acceso de servidores de sala.';

  @override
  String get notificationRuleSuppressEdits => 'Suprimir ediciones';

  @override
  String get notificationRuleSuppressEditsDescription =>
      'Suprime las notificaciones de mensajes editados.';

  @override
  String get notificationRuleCall => 'Llamar';

  @override
  String get notificationRuleCallDescription =>
      'Notifica al usuario de llamadas.';

  @override
  String get notificationRuleEncryptedRoomOneToOne => 'Sala cifrada uno a uno';

  @override
  String get notificationRuleEncryptedRoomOneToOneDescription =>
      'Notifica al usuario sobre mensajes en salas cifradas uno a uno.';

  @override
  String get notificationRuleRoomOneToOne => 'Sala uno a uno';

  @override
  String get notificationRuleRoomOneToOneDescription =>
      'Notifica al usuario sobre mensajes en salas uno a uno.';

  @override
  String get notificationRuleMessage => 'Mensaje';

  @override
  String get notificationRuleMessageDescription =>
      'Notifica al usuario sobre mensajes generales.';

  @override
  String get notificationRuleEncrypted => 'Cifrado';

  @override
  String get notificationRuleEncryptedDescription =>
      'Notifica al usuario sobre mensajes en salas cifradas.';

  @override
  String get notificationRuleJitsi => 'Jitsi';

  @override
  String get notificationRuleJitsiDescription =>
      'Notifica al usuario sobre eventos del componente de Jitsi.';

  @override
  String get notificationRuleServerAcl =>
      'Suprimir eventos de ACL del servidor';

  @override
  String get notificationRuleServerAclDescription =>
      'Suprime notificaciones de eventos de ACL del servidor.';

  @override
  String unknownPushRule(String rule) {
    return 'Regla de notificación desconocida \'$rule\'';
  }

  @override
  String sentVoiceMessage(String sender, String duration) {
    return '🎙️ $duration - Mensaje de voz de $sender';
  }

  @override
  String get deletePushRuleCanNotBeUndone =>
      'Si eliminas este ajuste de notificación, esto no se puede deshacer.';

  @override
  String get more => 'Más';

  @override
  String get shareKeysWith => 'Compartir claves con...';

  @override
  String get shareKeysWithDescription =>
      '¿Qué dispositivos deben ser de confianza para que puedan leer tus mensajes en chats cifrados?';

  @override
  String get allDevices => 'Todos los dispositivos';

  @override
  String get crossVerifiedDevicesIfEnabled =>
      'Dispositivos verificados si están habilitados';

  @override
  String get crossVerifiedDevices => 'Dispositivos verificados';

  @override
  String get verifiedDevicesOnly => 'Solo dispositivos verificados';

  @override
  String get takeAPhoto => 'Tomar foto';

  @override
  String get recordAVideo => 'Grabar video';

  @override
  String get optionalMessage => '(Opcional) mensaje...';

  @override
  String get notSupportedOnThisDevice =>
      'No es compatible con este dispositivo';

  @override
  String get approve => 'Aprobar';

  @override
  String get youHaveKnocked => 'Has sido golpeado';

  @override
  String get pleaseWaitUntilInvited =>
      'Por favor espera, hasta que alguien del chat te invite.';

  @override
  String get commandHint_logout => 'Salir del dispositivo actual';

  @override
  String get commandHint_logoutall => 'Salir de todos los dispositivos activos';

  @override
  String get displayNavigationRail => 'Mostrar carril de navegación en móvil';

  @override
  String get customReaction => 'Reacción personalizada';

  @override
  String get unexpectedVerificationMessage =>
      'Mensaje inesperado recibido durante la verificación.';

  @override
  String get financeLoading => 'Cargando...';

  @override
  String get financePleaseWaitLoadWallet =>
      'Por favor espere mientras cargamos su billetera';

  @override
  String get financeWelcome => 'Bienvenido';

  @override
  String get financeRegistrationCompleted =>
      '¡Registro completado exitosamente!';

  @override
  String financeFailedToUpdate(String error) {
    return 'Error al actualizar: $error';
  }

  @override
  String get financeStatusRefreshed => 'Estado actualizado exitosamente';

  @override
  String financeFailedToRefresh(String error) {
    return 'Error al actualizar: $error';
  }

  @override
  String get financeFailedToStartKYC => 'Error al iniciar reintento de KYC';

  @override
  String get financeAccountFullyVerified =>
      'Su cuenta está completamente verificada y activa';

  @override
  String get financeAccountVerificationFailed =>
      'La verificación de su cuenta no fue exitosa';

  @override
  String get financeAccountUnderReview => 'Su cuenta está bajo revisión';

  @override
  String get financeAdditionalVerificationRequired =>
      'Se requiere verificación adicional';

  @override
  String get financeManageWalletServices =>
      'Administre sus servicios de billetera';

  @override
  String get financeAccountRejected => 'Cuenta rechazada';

  @override
  String get financeAccountUnderReviewTitle => 'Cuenta bajo revisión';

  @override
  String get financeAccountIncomplete => 'Cuenta incompleta';

  @override
  String get financeFinishVerification => 'Complete su verificación';

  @override
  String get financeAccountIssues => 'Problemas de cuenta';

  @override
  String get financeBankAccounts => 'Cuentas bancarias';

  @override
  String get financeBankAccountsSubtitle =>
      'Cuenta bancaria virtual para recibir pagos';

  @override
  String get financeExternalAccount => 'Cuenta externa';

  @override
  String get financeExternalAccountSubtitle =>
      'Agregue sus cuentas bancarias para enviar dinero por ACH o Wire';

  @override
  String get financeDigitalWallets => 'Billeteras digitales';

  @override
  String get financeDigitalWalletsSubtitle =>
      'Acceda a sus billeteras digitales';

  @override
  String get financeDedicatedAddresses => 'Direcciones dedicadas';

  @override
  String get financeDedicatedAddressesSubtitle =>
      'Dirección para transferencias instantáneas';

  @override
  String get financeMainWallet => 'Billetera principal';

  @override
  String get financeTotalBalance => 'Saldo total';

  @override
  String get financeNoCardsAvailable => 'No hay tarjetas disponibles';

  @override
  String get financeCreateFirstCard => 'Cree su primera tarjeta para comenzar';

  @override
  String get financeViewCards => 'Ver tarjetas';

  @override
  String get financeMyCards => 'Tarjetas';

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
  String get financeViewAll => 'Ver todo';

  @override
  String get financeNoAccount => 'Sin cuenta';

  @override
  String get financeCreateNewAccountSubtitle =>
      'Cree una nueva cuenta para comenzar';

  @override
  String get financeCreateNewAccount => 'Crear una nueva cuenta';

  @override
  String get financeSourceOfFundsQuestionnaire =>
      'Complete el cuestionario de origen de fondos';

  @override
  String get financeSanctionsScreen => 'Complete la verificación de sanciones';

  @override
  String get financePEPScreen =>
      'Complete la verificación PEP (Persona Políticamente Expuesta)';

  @override
  String get financeBlocklistLookup =>
      'Complete la verificación de lista de bloqueo';

  @override
  String get financeAdverseMediaScreen =>
      'Complete la verificación de medios adversos';

  @override
  String get financeGovernmentIDVerification =>
      'Complete la verificación de identificación gubernamental';

  @override
  String get financeServiceNotAvailableInRegion =>
      'Este servicio no está disponible en su región actual';

  @override
  String get financeSSN => 'Número de Seguro Social (SSN)';

  @override
  String get financeTIN => 'Número de Identificación Fiscal (TIN)';

  @override
  String get financeSIN => 'Número de Seguro Social (SIN)';

  @override
  String get financeNIF => 'Número de Identificación Fiscal (NIF)';

  @override
  String get financePAN => 'Número de Cuenta Permanente (PAN)';

  @override
  String get financeCPF => 'Registro de Contribuyente Individual (CPF)';

  @override
  String get financeRFC => 'Registro Federal de Contribuyentes (RFC)';

  @override
  String get financeNINO => 'Número de Seguro Nacional (NINO)';

  @override
  String get financePassport => 'Pasaporte';

  @override
  String get financeNationalID => 'Número de Identificación Nacional';

  @override
  String get financeDriversLicense => 'Número de Licencia de Conducir';

  @override
  String get financeITIN => 'ID de Contribuyente Individual (ITIN)';

  @override
  String get financeCUIL => 'Código Único de Identificación Laboral (CUIL)';

  @override
  String get financeRUT => 'Rol Único Tributario (RUT)';

  @override
  String get financeNIT => 'Número de Identificación Tributaria (NIT)';

  @override
  String get financeCPR => 'Registro Personal Civil (CPR)';

  @override
  String get financeTFN => 'Número de Archivo Fiscal (TFN)';

  @override
  String get financeHETU => 'Código de Identidad Personal (HETU)';

  @override
  String get financePESEL => 'Sistema Electrónico Universal (PESEL)';

  @override
  String get financeVOEN => 'Número de Identificación Fiscal (VOEN)';

  @override
  String get financeOtherID => 'Otro número de identificación';

  @override
  String get financeSelectImageSource => 'Seleccionar fuente de imagen';

  @override
  String get financeCamera => 'Cámara';

  @override
  String get financeGallery => 'Galería';

  @override
  String get financeTermsError => 'Error de términos';

  @override
  String get financeTermOfService => 'Términos de servicio';

  @override
  String get financeTermsAcceptanceMessage =>
      'Debe aceptar los términos de servicio antes de actualizar la información del cliente.';

  @override
  String get financeAcceptTerms => 'Acepto los términos de servicio';

  @override
  String get financeTermsAccepted => 'Términos de servicio aceptados';

  @override
  String get financeCustomerType => 'Tipo de cliente';

  @override
  String get financeIndividual => 'Individual';

  @override
  String get financeCustomerTypeRequired => 'El tipo de cliente es requerido';

  @override
  String get financeEmail => 'Correo electrónico';

  @override
  String get financeBirthday => 'Fecha de nacimiento';

  @override
  String get financeBirthDateRequired => 'La fecha de nacimiento es requerida';

  @override
  String get financeMinimumAge => 'Debe tener al menos 18 años';

  @override
  String get financeUploadFrontID => 'Subir identificación frontal';

  @override
  String get financeUploadBackID => 'Subir identificación trasera';

  @override
  String get financeUploadBothImages =>
      'Por favor suba ambas imágenes de identificación frontal y trasera';

  @override
  String get financePrimaryIDRequired =>
      'Se requiere identificación primaria (SSN/ITIN)';

  @override
  String get financeSSNLabel => 'Número de Seguro Social (SSN)';

  @override
  String get financeITINLabel => 'ID de Contribuyente Individual (ITIN)';

  @override
  String get financePrimaryIDRequiredUSA =>
      'Se requiere identificación primaria para EE.UU.';

  @override
  String get financeSelectPrimaryIDType =>
      'Por favor seleccione un tipo de identificación primaria';

  @override
  String get financeSecondaryIDRequired =>
      'Se requiere identificación secundaria';

  @override
  String get financeDriversLicenseLabel => 'Licencia de conducir';

  @override
  String get financePassportLabel => 'Pasaporte';

  @override
  String get financeNationalIDLabel => 'Identificación nacional';

  @override
  String get financeSecondaryIDRequiredUSA =>
      'Se requiere identificación secundaria para EE.UU.';

  @override
  String get financeSelectSecondaryIDType =>
      'Por favor seleccione un tipo de identificación secundaria';

  @override
  String get financeIDTypeRequired => 'El tipo de identificación es requerido';

  @override
  String get financeSelectIDType =>
      'Por favor seleccione un tipo de identificación';

  @override
  String get financeNumber => 'Número';

  @override
  String get financeNumberRequired => 'el número es requerido';

  @override
  String get financeEditCustomer => 'Editar cliente';

  @override
  String get financePleaseWait => 'Por favor espere…';

  @override
  String get financeUpdate => 'Actualizar';

  @override
  String get financeChooseImageSource => 'Elija cómo desea agregar su imagen:';

  @override
  String get financeImageError => 'Error de imagen';

  @override
  String financeFailedToPickImage(String error) {
    return 'Error al seleccionar imagen: $error';
  }

  @override
  String get financeChoose => 'Choose';

  @override
  String get financeTermsRequired => 'Términos requeridos';

  @override
  String get financeAcceptToSBeforeUpdate =>
      'Por favor acepte los Términos de Servicio antes de actualizar';

  @override
  String get financeUpdateFailed => 'Actualización fallida';

  @override
  String financePleaseComplete(String fields) {
    return 'Por favor complete: $fields';
  }

  @override
  String get financeTakeNewPhoto => 'Tomar una nueva foto';

  @override
  String get financeChooseExistingPhotos => 'Elegir de fotos existentes';

  @override
  String get financeCameraAccessRequired =>
      'Se requiere acceso a la cámara para tomar fotos. Por favor permita el acceso a la cámara e intente nuevamente.';

  @override
  String get financeGalleryAccessRequired =>
      'Se requiere acceso a la galería para seleccionar imágenes. Por favor permita el acceso a fotos/almacenamiento e intente nuevamente.';

  @override
  String get financeCameraAccessDenied =>
      'El acceso a la cámara ha sido denegado permanentemente. Por favor habilite el permiso de cámara en la configuración de su dispositivo para tomar fotos.';

  @override
  String get financeGalleryAccessDenied =>
      'El acceso a la galería ha sido denegado permanentemente. Por favor habilite el permiso de fotos/almacenamiento en la configuración de su dispositivo para seleccionar imágenes.';

  @override
  String get financeCameraAccessRestricted =>
      'El acceso a la cámara está restringido en este dispositivo.';

  @override
  String get financeGalleryAccessRestricted =>
      'El acceso a la galería está restringido en este dispositivo.';

  @override
  String get financeCameraPermissionRequired =>
      'Se requiere permiso de cámara para tomar fotos.';

  @override
  String get financeGalleryPermissionRequired =>
      'Se requiere permiso de galería para seleccionar imágenes. Por favor habilite el permiso de fotos/almacenamiento en la configuración.';

  @override
  String get financeFailedToAccessImage => 'Error al acceder a la imagen';

  @override
  String get financeCameraAccessWasDenied =>
      'El acceso a la cámara fue denegado. Por favor habilite el permiso de cámara en la configuración.';

  @override
  String get financeGalleryAccessWasDenied =>
      'El acceso a la galería fue denegado. Por favor habilite el permiso de fotos/almacenamiento en la configuración.';

  @override
  String get financeNoCameraAvailable =>
      'No hay cámara disponible en este dispositivo.';

  @override
  String get financeInvalidImageFile =>
      'El archivo seleccionado no es una imagen válida. Por favor elija un archivo diferente.';

  @override
  String get financeUnableToTakePhoto =>
      'No se puede tomar la foto. Por favor intente nuevamente.';

  @override
  String get financeUnableToSelectImage =>
      'No se puede seleccionar la imagen. Por favor intente nuevamente.';

  @override
  String get financeFailedToCreateCustomer => 'Error al crear cliente';

  @override
  String financeFailedToSendOTP(String message) {
    return 'Error al enviar OTP: $message';
  }

  @override
  String financeInvalidOTP(String message) {
    return 'OTP inválido: $message';
  }

  @override
  String get financeCustomerCreatedSuccess => '¡Cliente creado exitosamente!';

  @override
  String get financeCountryRequired => 'El país es requerido';

  @override
  String get financeIdentificationtype => 'Tipo de identificación';

  @override
  String get financeUploadBothImagesSecondaryID =>
      'Por favor suba ambas imágenes frontal y trasera para la identificación secundaria';

  @override
  String get financeUploadBothIDImages =>
      'Por favor suba ambas imágenes de identificación frontal y trasera';

  @override
  String get financeAcceptToSBeforeCreating =>
      'Por favor acepte los Términos de Servicio antes de crear un cliente';

  @override
  String get financeWalletDashboard => 'Panel de billetera';

  @override
  String get financeVirtualCards => 'Tarjetas virtuales';

  @override
  String get financeCreateNewWallet => 'Crear nueva billetera';

  @override
  String get financeAllWalletsCreated =>
      'Todas las billeteras disponibles han sido creadas';

  @override
  String get financeCustomerIDNotFound =>
      'ID de cliente no encontrado. Por favor inicie sesión nuevamente.';

  @override
  String get financeFailedToCreateWallet => 'Error al crear billetera';

  @override
  String get financeWalletDetails => 'Detalles de billetera';

  @override
  String get financeLoadingWalletDetails => 'Cargando detalles de billetera...';

  @override
  String get financeWalletNotFound => 'Billetera no encontrada';

  @override
  String get financeWalletNotFoundMessage =>
      'No se pudo encontrar la billetera solicitada';

  @override
  String get financeGoBack => 'Volver';

  @override
  String get financeNoWalletsFound => 'No se encontraron billeteras';

  @override
  String get finanaceCreateAccountSubtitle =>
      'We need some information from you to set up your wallet';

  @override
  String get financeNoWalletsMessage =>
      'Aún no tiene billeteras. Cree su primera billetera para comenzar.';

  @override
  String get financeRetry => 'Reintentar';

  @override
  String get financeWalletOverview => 'Resumen de billetera';

  @override
  String get financeManageAssets =>
      'Administre sus activos digitales y transacciones';

  @override
  String get financeWalletInformation => 'Información de billetera';

  @override
  String get financeCreated => 'Creado';

  @override
  String get financeWalletAddress => 'Dirección de billetera';

  @override
  String get financeTokenBalances => 'Saldos de tokens';

  @override
  String get financeNoTokenBalances => 'No hay saldos de tokens disponibles';

  @override
  String get financeCopied => '¡Copiado!';

  @override
  String get financeAddressCopied => 'Dirección copiada al portapapeles';

  @override
  String get financeInvalidDestinationAddress =>
      'Dirección de destino o parámetros inválidos. Por favor verifique su entrada.';

  @override
  String get financeAuthenticationError =>
      'Error de autenticación. Por favor intente iniciar sesión nuevamente.';

  @override
  String get financeInsufficientBalance =>
      'Saldo insuficiente para esta transacción.';

  @override
  String get financeNetworkError =>
      'Error de red. Por favor verifique su conexión a internet.';

  @override
  String get financeRequestTimeout =>
      'Tiempo de espera agotado. Por favor intente nuevamente.';

  @override
  String get financeRecentTransactions => 'Transacciones recientes';

  @override
  String get financeNoTransactionsYet => 'Aún no hay transacciones y depósitos';

  @override
  String get financeTransactionsWillAppear =>
      'Sus transacciones y depósitos aparecerán aquí';

  @override
  String get financeTransactionReceipt => 'Recibo de transacción';

  @override
  String get financeTransactionID => 'ID de transacción';

  @override
  String get financeAmount => 'Monto';

  @override
  String get financeStatus => 'Estado';

  @override
  String get financeFromCurrency => 'Desde moneda';

  @override
  String get financeToCurrency => 'A moneda';

  @override
  String get financeToAddress => 'A dirección';

  @override
  String get financeNetwork => 'Red';

  @override
  String get financeDate => 'Fecha';

  @override
  String get financeTransactionCompleted =>
      'Transacción completada exitosamente';

  @override
  String get financeCopiedToClipboard => 'Copiado al portapapeles';

  @override
  String get financeVerifyAddress => 'Verifique la dirección antes de enviar';

  @override
  String get financeLoadingTransfers => 'Cargando transferencias...';

  @override
  String get financeNoTransfersYet => 'Aún no hay transferencias';

  @override
  String get financeTransfersWillAppear =>
      'Sus transferencias de criptomonedas aparecerán aquí';

  @override
  String get financeCryptoTransfer => 'Transferencia de criptomonedas';

  @override
  String get financeNoItemsFound => 'No se encontraron elementos';

  @override
  String get financePleaseEnterAmount => 'Por favor ingrese el monto';

  @override
  String get financePleaseEnterAllFields =>
      'Por favor complete todos los campos';

  @override
  String get financeCustomerNotFound =>
      'Cliente no encontrado. Por favor intente nuevamente.';

  @override
  String get financeInfo => 'Información';

  @override
  String get financeProcessingTransfer => 'Procesando transferencia...';

  @override
  String get financeTransferSuccessful => 'Transferencia exitosa';

  @override
  String get financeSentTo => 'enviado a';

  @override
  String get financeDone => 'Hecho';

  @override
  String get financeDepositInstructions => 'Instrucciones de depósito';

  @override
  String get financeImportantDepositMessage => 'Mensaje importante de depósito';

  @override
  String get financeAccountNumber => 'Número de cuenta';

  @override
  String get financeRoutingNumber => 'Número de ruta';

  @override
  String get financeBankName => 'Nombre del banco';

  @override
  String get financeBankAddress => 'Dirección del banco';

  @override
  String get financeBeneficiaryName => 'Nombre del beneficiario';

  @override
  String get financeAccountBlocked => 'Cuenta bloqueada';

  @override
  String get financePINVerificationFailed => 'Verificación de PIN fallida';

  @override
  String get financeOK => 'OK';

  @override
  String get financeTransferFailed => 'Transferencia fallida';

  @override
  String get financeDepositFailed => 'Depósito fallido';

  @override
  String get financeDestination => 'Destino';

  @override
  String get financeSelectBlockchain => 'Seleccione blockchain para su';

  @override
  String get financeNewWallet => 'nueva billetera';

  @override
  String get financeCryptocurrencySearch => 'Búsqueda de criptomonedas';

  @override
  String get financeSearch => 'Buscar';

  @override
  String get financeEthereumETH => 'Ethereum (ETH)';

  @override
  String get financeConfirm => 'Confirmar';

  @override
  String get financeRequired => 'Requerido';

  @override
  String get financeInvalidAmount => 'Monto inválido';

  @override
  String get financeMinAmount => 'Mín \$1';

  @override
  String get financeMaxAmount => 'Máx \$10,000';

  @override
  String get financeInvalidAddress => 'Dirección inválida';

  @override
  String get financeSelect => 'Seleccionar';

  @override
  String get financeStates => 'Estados';

  @override
  String get financeDateRange => '10 May - 30 Sept';

  @override
  String get financeIncome => 'Ingresos';

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
  String get financeOTPMust6Digits => 'El OTP debe tener 6 dígitos';

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
    return 'OTP enviado a: $email';
  }

  @override
  String get financeExpenses => 'Gastos';

  @override
  String get financeTransferOptions => 'Opciones de transferencia';

  @override
  String get financeDepositFounds => 'Depositar fondos';

  @override
  String get financeAddMoneyFromBank =>
      'Agregar dinero del banco a la billetera';

  @override
  String get financeTransfer => 'Transferir';

  @override
  String get financeTransferToWalletAddress =>
      'Transferir a otra dirección de billetera';

  @override
  String get financeWithdrawToExternalAccount => 'Retirar a cuenta externa';

  @override
  String get financeTransferToBankAccount => 'Transferir a su cuenta bancaria';

  @override
  String get financeWithdraw => 'retirar';

  @override
  String get financeLoadingWallets => 'Cargando billeteras...';

  @override
  String get financeZeroBalance => '0.00 usd';

  @override
  String get financeNoWallet => 'Sin billetera';

  @override
  String get financeCreateCardMessage =>
      '¡Cree una nueva tarjeta para comenzar!';

  @override
  String get financeCreateANewWallet => 'Crear una nueva billetera';

  @override
  String get financeSendCryptoToWallet =>
      'Enviar criptomonedas a otra dirección de billetera';

  @override
  String get financeHowMuch => '¿Cuánto?';

  @override
  String get financeTransfer_money_to_any_user =>
      'transferir dinero a cualquier usuario';

  @override
  String get financeCurrency => 'Moneda';

  @override
  String get financeDestinationChain => 'Cadena de destino';

  @override
  String get financeDestinationAddress => 'Dirección de destino';

  @override
  String get financeDepositFunds => 'Depositar fondos';

  @override
  String get financeSelectCurrency => 'Seleccionar moneda';

  @override
  String get financePaymentMethod => 'Método de pago';

  @override
  String get financeACHPush => 'ACH Push';

  @override
  String get financeDestinationCurrency => 'Moneda de destino';

  @override
  String get financeBankAccount => 'Cuenta bancaria';

  @override
  String get financeExternalAccountAdd => 'Agregar cuenta externa';

  @override
  String get financeExternalAccountEdit => 'Editar cuenta externa';

  @override
  String get financeExternalAccountStepBank => 'Información\nbancaria';

  @override
  String get financeExternalAccountStepPersonal => 'Información\npersonal';

  @override
  String get financeExternalAccountStepAccount => 'Detalle de\ncuenta';

  @override
  String get financeExternalAccountStepAddress => 'Dirección';

  @override
  String get financeExternalAccountAccountName => 'Nombre de cuenta';

  @override
  String get financeExternalAccountGetProfileInfo =>
      'Obtener información de su perfil';

  @override
  String get financeExternalAccountGoBackTitle => '¿Volver?';

  @override
  String get financeExternalAccountGoBackMessage =>
      '¿Está seguro de que desea volver? Toda la información ingresada se perderá.';

  @override
  String get financeExternalAccountAccountInfo => 'Información de cuenta';

  @override
  String get financeExternalAccountUpdateAddress => 'Actualizar dirección';

  @override
  String get financeExternalAccountAccountOwner => 'Propietario de cuenta';

  @override
  String get financeExternalAccountAccountType => 'Tipo de cuenta';

  @override
  String get financeExternalAccountActive => 'Activa';

  @override
  String get financeExternalAccountInactive => 'Inactiva';

  @override
  String get financeExternalAccountErrorLoading => 'Error al cargar cuenta';

  @override
  String get financeExternalAccountNotFound => 'Cuenta no encontrada';

  @override
  String get financeExternalAccountNotFoundMessage =>
      'No se pudo encontrar la cuenta externa';

  @override
  String get financeExternalAccountAddressUpdated =>
      '¡Dirección actualizada exitosamente!';

  @override
  String get financeExternalAccountNoCustomer => 'No se encontró cliente';

  @override
  String get financeExternalAccountNoCustomerMessage =>
      'Por favor cree un perfil de cliente primero para administrar cuentas externas';

  @override
  String get financeExternalAccountLoadingAccounts =>
      'Cargando cuentas externas...';

  @override
  String get financeExternalAccountLetsStart =>
      'Comencemos\nuna cuenta externa';

  @override
  String get financeExternalAccountSetupMessage =>
      'Necesitamos información de usted para configurar la cuenta externa';

  @override
  String get financeExternalAccountBankInfo => 'Información bancaria';

  @override
  String get financeExternalAccountAccountDetails => 'Detalles de cuenta';

  @override
  String get financeExternalAccountOwnerInfo => 'Información del propietario';

  @override
  String get financeExternalAccountTimestamps => 'Marcas de tiempo';

  @override
  String get financeExternalAccountOwnerType => 'Tipo de propietario';

  @override
  String get financeExternalAccountUpdated => 'Actualizado';

  @override
  String get financeExternalAccountNumberCopied => '¡Número de cuenta copiado!';

  @override
  String get financeExternalAccountOwnerTypeLabel =>
      'Tipo de propietario de cuenta';

  @override
  String get financeExternalAccountIndividual => 'Individual';

  @override
  String get financeExternalAccountChecking => 'Corriente';

  @override
  String get financeExternalAccountSavings => 'Ahorros';

  @override
  String get financeExternalAccountUnitedStates => 'Estados Unidos';

  @override
  String get financeExternalAccountRequired => 'Requerido';

  @override
  String get financeExternalAccountStreetAddressTooShort =>
      'Dirección demasiado corta';

  @override
  String get financeExternalAccountPleaseSelectState =>
      'Por favor seleccione un estado';

  @override
  String get financeExternalAccountPleaseEnterCity =>
      'Por favor ingrese la ciudad';

  @override
  String get financeExternalAccountCityNameTooShort =>
      'Nombre de ciudad demasiado corto';

  @override
  String get financeExternalAccountPleaseEnterZIP =>
      'Por favor ingrese el código postal';

  @override
  String get financeExternalAccountMustBe5Digits => 'Debe tener 5 dígitos';

  @override
  String get financeExternalAccountNumbersOnly => 'Solo números';

  @override
  String get financeExternalAccountBankNameRequired =>
      'El nombre del banco es requerido';

  @override
  String get financeExternalAccountBankNameMin =>
      'El nombre del banco debe tener al menos 3 caracteres';

  @override
  String get financeExternalAccountBankNameMax =>
      'Nombre del banco demasiado largo (máx 50 caracteres)';

  @override
  String get financeExternalAccountInvalidCharacters =>
      'Caracteres inválidos en el nombre del banco';

  @override
  String get financeExternalAccountAccountNameRequired =>
      'El nombre de cuenta es requerido';

  @override
  String get financeExternalAccountAccountNameMin =>
      'El nombre de cuenta debe tener al menos 2 caracteres';

  @override
  String get financeExternalAccountAccountNameMax =>
      'Nombre de cuenta demasiado largo (máx 40 caracteres)';

  @override
  String get financeExternalAccountOnlyLetters =>
      'Solo se permiten letras, espacios, puntos y guiones';

  @override
  String get financeExternalAccountOwnerTypeRequired =>
      'El tipo de propietario de cuenta es requerido';

  @override
  String get financeExternalAccountFirstNameRequired =>
      'El nombre es requerido';

  @override
  String get financeExternalAccountFirstNameTooShort =>
      'Nombre demasiado corto';

  @override
  String get financeExternalAccountLastNameRequired =>
      'El apellido es requerido';

  @override
  String get financeExternalAccountLastNameTooShort =>
      'Apellido demasiado corto';

  @override
  String get financeExternalAccountRoutingNumberRequired =>
      'El número de ruta es requerido';

  @override
  String get financeExternalAccountMustBe9Digits =>
      'Debe tener exactamente 9 dígitos';

  @override
  String get financeExternalAccountAccountNumberRequired =>
      'El número de cuenta es requerido';

  @override
  String get financeExternalAccountAccountNumberTooShort =>
      'Número de cuenta demasiado corto';

  @override
  String get financeExternalAccountAccountTypeRequired =>
      'El tipo de cuenta es requerido';

  @override
  String get financeExternalAccountStreetAddressRequired =>
      'La dirección es requerida';

  @override
  String get financeExternalAccountCountryRequired => 'El país es requerido';

  @override
  String get financeExternalAccountCityRequired => 'La ciudad es requerida';

  @override
  String get financeExternalAccountStateRequired => 'El estado es requerido';

  @override
  String get financeExternalAccountPostalCodeRequired =>
      'El código postal es requerido';

  @override
  String get financeExternalAccountNoCustomerFound =>
      'No se encontró cliente. Por favor cree un cliente primero.';

  @override
  String get financeExternalAccountFailedToUpdate =>
      'Error al actualizar dirección';

  @override
  String get financeExternalAccountSubmit => 'Enviar';

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
      'Por favor cree un perfil de cliente primero para administrar cuentas externas';

  @override
  String get financeExternalAccountWeNeedInfo =>
      'Necesitamos información de usted para configurar la cuenta externa';

  @override
  String get financeExternalAccountCreate => 'Crear';

  @override
  String get financeExternalAccountBankName => 'Nombre del banco';

  @override
  String get financeExternalAccountCreated => 'Creado';

  @override
  String get financeExternalAccountTitle => 'Cuentas externas';

  @override
  String get financeExternalAccountSingular => 'Cuenta externa';

  @override
  String get back => 'Atrás';

  @override
  String get financeLiquidationAddresses => 'Direcciones de liquidación';

  @override
  String get financeLiquidationAddressDetails =>
      'Detalles de dirección de liquidación';

  @override
  String get financeCreateLiquidationAddress =>
      'Crear dirección de liquidación';

  @override
  String get financeLetsStartLiquidation =>
      'Comencemos\nuna dirección de liquidación';

  @override
  String get financeWeNeedInfoLiquidation =>
      'Necesitamos información de usted para configurar una dirección de liquidación';

  @override
  String get financeManageLiquidationAddresses =>
      'Administre direcciones de liquidación de criptomonedas para conversiones automáticas';

  @override
  String get financeLoadingLiquidationAddresses =>
      'Cargando direcciones de liquidación...';

  @override
  String get financeClientReferenceID => 'ID de referencia del cliente';

  @override
  String get financeClientReferenceIDRequired =>
      'El ID de referencia del cliente es requerido';

  @override
  String get financeWireMessage => 'Mensaje de transferencia';

  @override
  String get financeWireMessageRequired =>
      'El mensaje de transferencia es requerido';

  @override
  String get financeSelectCurrencyLabel => 'Seleccionar moneda';

  @override
  String get financeCurrencyRequired => 'La moneda es requerida';

  @override
  String get financeChain => 'Cadena';

  @override
  String get financeSelectChain => 'Seleccionar cadena';

  @override
  String get financeChainRequired => 'La cadena es requerida';

  @override
  String get financeSelectExternalAccount => 'Seleccionar cuenta externa';

  @override
  String get financeAddressInvalidWarning =>
      'La dirección de esta cuenta externa es inválida';

  @override
  String get financeAddressInformation => 'Información de dirección';

  @override
  String get financeActiveBalance => 'Saldo activo';

  @override
  String get financePendingBalance => 'Saldo pendiente';

  @override
  String get financeBalanceNotAvailable => 'Información de saldo no disponible';

  @override
  String get financeTransactionHistory => 'Historial de transacciones';

  @override
  String get financeNoTransactions => 'Sin transacciones';

  @override
  String get financeNoDrainTransactions =>
      'No se encontraron transacciones de drenaje para esta dirección';

  @override
  String get financePaymentRail => 'Riel de pago';

  @override
  String get financeDestinationCurrencyLabel => 'Moneda de destino';

  @override
  String get financeViewLiquidationInfo =>
      'Ver información de dirección de liquidación e historial de transacciones';

  @override
  String get financeCouldNotLoadDetails =>
      'No se pudieron cargar los detalles de la dirección de liquidación';

  @override
  String get financeBalance => 'Saldo';

  @override
  String get financeFailedToLoad => 'Error al cargar';

  @override
  String get financeVirtualAccounts => 'Cuentas virtuales';

  @override
  String get financeLoadingVirtualAccount => 'Cargando cuenta virtual...';

  @override
  String get financeCreateVirtualAccount => 'Crear cuenta virtual';

  @override
  String get financeCustomerRequired => 'Cliente requerido';

  @override
  String get financePleaseCreateCustomerFirst =>
      'Por favor cree una cuenta de cliente primero';

  @override
  String get financeCreateVirtualAddress => 'Crear dirección virtual';

  @override
  String get financeDestinationAddressRequired =>
      'La dirección de destino es requerida';

  @override
  String get financeAddressTooShort => 'Dirección demasiado corta';

  @override
  String get financeSelectSourceCurrency => 'Seleccionar moneda de origen';

  @override
  String get financeSelectCurrencyRequired => 'Seleccionar moneda es requerido';

  @override
  String get financeSelectDestinationChain => 'Seleccionar cadena de destino';

  @override
  String get financeDestinationChainRequired =>
      'La cadena de destino es requerida';

  @override
  String get financeSelectDestinationCurrency =>
      'Seleccionar moneda de destino';

  @override
  String get financeDestinationCurrencyRequired =>
      'La moneda de destino es requerida';

  @override
  String get financeFailedToCreateVirtualAccount =>
      'Error al crear cuenta virtual';

  @override
  String get financeInvalidPINTryAgain =>
      'PIN inválido. Por favor intente nuevamente.';

  @override
  String get financePINVerificationFailedTryAgain =>
      'Verificación de PIN fallida. Por favor intente nuevamente.';

  @override
  String get financeDetails => 'Detalles';

  @override
  String get financeAccountNumberCopiedShort => 'Número de cuenta copiado';

  @override
  String get financeAccountNumberCopied =>
      'Número de cuenta copiado al portapapeles';

  @override
  String get financeVirtualAccountDetails => 'Detalles de cuenta virtual';

  @override
  String get financeBankInformation => 'Información bancaria';

  @override
  String get financeBeneficiaryInformation => 'Información del beneficiario';

  @override
  String get financeBeneficiaryAddress => 'Dirección del beneficiario';

  @override
  String get financeDestinationDetails => 'Detalles de destino';

  @override
  String get financeLetsStartVirtualAccount => 'Comencemos\nuna cuenta virtual';

  @override
  String get financeWeNeedInfoVirtualAccount =>
      'Necesitamos información de usted\npara configurar la cuenta virtual';

  @override
  String get financePayCryptoCardActivationUnderReview =>
      'La activación de la tarjeta está bajo revisión';

  @override
  String get financePayCryptoCardVerificationFailed =>
      'La verificación de la tarjeta falló';

  @override
  String get financePayCryptoCardCreationFailed =>
      'La creación de la tarjeta falló';

  @override
  String get financePayCryptoCardReadyActivation =>
      'Su tarjeta está lista para activación';

  @override
  String get financePayCryptoActivateToAccess =>
      'Active su tarjeta para acceder a todas las funciones';

  @override
  String get financePayCryptoKYCCompletedSuccess =>
      '¡KYC completado exitosamente!';

  @override
  String get financePayCryptoFailedToCreateCard => 'Error al crear tarjeta';

  @override
  String get financePayCryptoErrorLoadingCard => 'Error al cargar tarjeta';

  @override
  String get financePayCryptoAccountNotFound =>
      'Número de cuenta no encontrado';

  @override
  String get financeMain_Wallet => 'Billetera ';

  @override
  String get financeResetYourPIN => 'Restablecer su PIN';

  @override
  String get financeEnterOTPAndNewPIN =>
      'Ingrese el OTP enviado a su correo electrónico y establezca su nuevo PIN';

  @override
  String get financeEnterNewPINToReset =>
      'Ingrese su nuevo PIN para restablecerlo.';

  @override
  String get financeOTPCode => 'Código OTP';

  @override
  String get financeEnter6DigitOTP => 'Ingrese OTP de 6 dígitos';

  @override
  String get financeNewPIN => 'Nuevo PIN';

  @override
  String get financeConfirmPIN => 'Confirmar PIN';

  @override
  String get financePINMust4Digits => 'El PIN debe tener 4 dígitos';

  @override
  String get financePINsDoNotMatch => 'Los PINs no coinciden';

  @override
  String get financeOTPSentToEmail => 'OTP enviado a su correo electrónico';

  @override
  String get subscriptionInformation => 'Información de suscripción';

  @override
  String get subscriptionMessage =>
      'Está a punto de descargar la versión beta de Be-MindPower. Después de probar la cuenta bancaria, billetera y servicios de tarjeta de débito, se aplicará un cargo inicial de 30 USD. Si decide continuar, la suscripción será de 17.5 USD por mes. Si está de acuerdo, presione para continuar.';

  @override
  String get noItemsFound => 'No se encontraron elementos';

  @override
  String get uploaded => 'Subido';

  @override
  String get uploadImage => 'Subir imagen';

  @override
  String get addressCopiedToClipboard => 'Dirección copiada al portapapeles';

  @override
  String get recentTransactions => 'Transacciones recientes';

  @override
  String get attention => 'Atención';

  @override
  String get usdcPaymentWarning =>
      'Para garantizar que tu pago se reciba correctamente, solo aceptamos transferencias en USDC (USD Coin). Los pagos enviados en otras criptomonedas no pueden ser acreditados ni procesados.';

  @override
  String get iAgree => 'Estoy de acuerdo';

  @override
  String get noCountriesAvailable => 'No hay países disponibles';

  @override
  String get noCountriesFound => 'No se encontraron países';

  @override
  String get january => 'Enero';

  @override
  String get february => 'Febrero';

  @override
  String get march => 'Marzo';

  @override
  String get april => 'Abril';

  @override
  String get may => 'Mayo';

  @override
  String get june => 'Junio';

  @override
  String get july => 'Julio';

  @override
  String get august => 'Agosto';

  @override
  String get september => 'Septiembre';

  @override
  String get october => 'Octubre';

  @override
  String get november => 'Noviembre';

  @override
  String get december => 'Diciembre';

  @override
  String get selectMonth => 'Seleccionar mes';

  @override
  String get selectYear => 'Seleccionar año';

  @override
  String get birthday => 'Cumpleaños';

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
  String get virtualCard => 'Tarjeta virtual';

  @override
  String get cardType => 'Tipo de tarjeta';

  @override
  String get financeErrorCountryLoadFailed => 'Error al cargar datos de países';

  @override
  String get financeErrorRegistrationFailed =>
      'Error al registrar cliente después de reintentos';

  @override
  String get financeErrorOTPVerificationFailed =>
      'Error al verificar OTP después de reintentos';

  @override
  String get financeErrorCustomerStatusFailed =>
      'Error al obtener estado del cliente';

  @override
  String get financeErrorKYCLinkFailed => 'Error al obtener enlace KYC';

  @override
  String get financeErrorTermsAcceptFailed =>
      'Error al aceptar términos de servicio';

  @override
  String get financeErrorUsernameCheckFailed =>
      'Error al verificar nombre de usuario';

  @override
  String get financeErrorVerificationStatusFailed =>
      'Error al obtener estado de verificación del cliente';

  @override
  String get financeErrorCustomerUpdateFailed => 'Error al actualizar cliente';

  @override
  String get financeErrorKYCCreateFailed => 'Error al crear enlace KYC';

  @override
  String get financeErrorKYCStatusFailed => 'Error al obtener estado KYC';

  @override
  String get financeErrorCustomerDeleteFailed => 'Error al eliminar cliente';

  @override
  String get financeErrorCustomerIDNotFound =>
      'ID de cliente no encontrado. Por favor inicie sesión nuevamente.';

  @override
  String get financeErrorNoCustomerID =>
      'No hay ID de cliente disponible. Por favor asegúrese de haber iniciado sesión.';

  @override
  String get financeErrorPINVerificationFailed => 'Verificación de PIN fallida';

  @override
  String get financeErrorInvalidPIN => 'PIN inválido';

  @override
  String get financeErrorWalletCreateFailed => 'Error al crear billetera';

  @override
  String get financeErrorWalletDetailsFailed =>
      'Error al obtener detalles de billetera';

  @override
  String get financeErrorWalletLoadFailed =>
      'Error al cargar billeteras del cliente';

  @override
  String get financeErrorTransferFailed => 'Transferencia fallida';

  @override
  String get financeErrorExternalTransferFailed =>
      'Transferencia de cuenta externa fallida';

  @override
  String get financeErrorNoTransferHistory =>
      'No hay historial de transferencias disponible';

  @override
  String get financeErrorDepositFailed => 'Depósito fallido';

  @override
  String get financeErrorCustomerIDRequired =>
      'Se requiere ID de cliente para transferencia';

  @override
  String get financeErrorCustomerIDRequiredDeposit =>
      'Se requiere ID de cliente para depósito';

  @override
  String get financeErrorNetworkUnavailable => 'Conexión de red no disponible';

  @override
  String get financeErrorInstitutionBalanceFailed =>
      'Error al obtener saldo de institución';

  @override
  String get financeErrorCardTypesFailed => 'Error al obtener tipos de tarjeta';

  @override
  String get financeErrorExchangeRatesFailed =>
      'Error al obtener tasas de cambio';

  @override
  String get financeErrorCurrencyEstimationFailed =>
      'Error al calcular estimación de moneda';

  @override
  String get financeErrorCryptoEstimationFailed =>
      'Error al calcular estimación de cripto';

  @override
  String get financeErrorKYCSubmitFailed => 'Error al enviar KYC';

  @override
  String get financeErrorCardCreateFailed => 'Error al crear tarjeta';

  @override
  String get financeErrorCardBalanceFailed =>
      'Error al obtener saldo de tarjeta';

  @override
  String get financeErrorTransactionHistoryFailed =>
      'Error al obtener historial de transacciones';

  @override
  String get financeErrorDepositUSDTFailed => 'Error al depositar USDT';

  @override
  String get financeErrorDepositCryptoFailed => 'Error al depositar cripto';

  @override
  String get financeErrorDepositFiatFailed => 'Error al depositar monto fiat';

  @override
  String get financeErrorDepositStatusFailed =>
      'Error al obtener estado de depósito';

  @override
  String get financeErrorDepositTransactionsFailed =>
      'Error al obtener transacciones de depósito';

  @override
  String get financeSecurityPINSetSuccess => 'PIN establecido exitosamente';

  @override
  String get financeSecurityPINResetSuccess => 'PIN restablecido exitosamente';

  @override
  String get financeSecurityCustomerIDNotFound =>
      'ID de cliente no encontrado. Por favor inicie sesión nuevamente.';

  @override
  String get financeSecurityPINVerificationCompleted =>
      'Verificación de PIN completada';

  @override
  String get financeSecurityPINVerificationFailed =>
      'Verificación de PIN fallida';

  @override
  String get financeSecurityOTPSentSuccess => 'OTP enviado exitosamente';

  @override
  String get financeSecurityOTPVerifiedSuccess => 'OTP verificado exitosamente';

  @override
  String get financeSecurityTokenGeneratedSuccess =>
      'Token generado exitosamente';

  @override
  String get financeSecurityTokenGenerationFailed => 'Error al generar token';

  @override
  String get financeSecurityRequestTimeout =>
      'Tiempo de espera agotado - por favor verifique su conexión de red';

  @override
  String get financeSecurityNetworkError =>
      'Error de red - no se puede conectar al servidor';

  @override
  String get financeSecurityNoTokenFound =>
      'No se encontró token de seguridad. Por favor genere el token primero.';

  @override
  String get financeSecurityCSRFRetrievedSuccess =>
      'Token CSRF recuperado exitosamente';

  @override
  String get financeSecurityCSRFRetrievalFailed =>
      'Error al obtener token CSRF';

  @override
  String get financeSecurityJWTExpiredRefreshFailed =>
      'Token JWT expirado y actualización fallida';

  @override
  String get financeSecurityMissingJWTToken =>
      'Falta token JWT. Por favor genere el token de seguridad primero.';

  @override
  String get financeSecuritySignatureGeneratedSuccess =>
      'Firma generada exitosamente';

  @override
  String get financeErrorServiceUnavailable =>
      'Servicio temporalmente no disponible. Por favor intente nuevamente.';

  @override
  String get financeErrorInvalidRequest =>
      'Solicitud inválida. Por favor verifique su información e intente nuevamente.';

  @override
  String get financeUnknownError => 'An unknown error occurred';

  @override
  String get financeErrorAuthenticationFailed =>
      'Autenticación fallida. Por favor inicie sesión nuevamente.';

  @override
  String get financeErrorAccessDenied =>
      'Acceso denegado. Por favor contacte a soporte.';

  @override
  String get financeErrorToSLinkFailed =>
      'No se puede generar enlace de términos de servicio. Por favor intente nuevamente.';

  @override
  String get financeErrorToSError => 'Error de términos de servicio';

  @override
  String get financeLoadingToS => 'Cargando términos de servicio...';

  @override
  String get financeVerification => 'Verification';

  @override
  String get financeLoadingKycVerification => 'Loading KYC Verification...';

  @override
  String get financeCompleted => 'Completado';

  @override
  String get financeSubmitted => 'Enviado';

  @override
  String get financeInReview => 'En Revisión';

  @override
  String get financeReceived => 'Recibido';

  @override
  String get financeScheduled => 'Programado';

  @override
  String get financeAwaiting => 'En Espera';

  @override
  String get financeFailed => 'Fallido';

  @override
  String get financeReturned => 'Devuelto';

  @override
  String get financeRefunded => 'Reembolsado';

  @override
  String get financeCanceled => 'Cancelado';

  @override
  String get financeUnknown => 'Desconocido';

  @override
  String get financeTransactionInfo => 'Información de Transacción';

  @override
  String get financeType => 'Tipo';

  @override
  String get financeReceipt => 'Recibo';

  @override
  String get financeInitialAmount => 'Monto Inicial';

  @override
  String get financeFinalAmount => 'Monto Final';

  @override
  String get financeSource => 'Fuente';

  @override
  String get financeSender => 'Remitente';

  @override
  String get financeBlockchain => 'Blockchain';

  @override
  String get financeTxHash => 'Hash de Tx';

  @override
  String get financeTransactionDetails => 'Detalles de Transacción';

  @override
  String get financeStreetAddressRequired => 'La dirección es requerida';

  @override
  String get financeCityRequired => 'La ciudad es requerida';

  @override
  String get financePleaseSelectCountry => 'Por favor seleccione un país';

  @override
  String get financeStateRequired => 'El estado es requerido';

  @override
  String get financePleaseSelectCountryFirst =>
      'Por favor seleccione un país primero';

  @override
  String get financeRequirementAddressOfIncorporation =>
      '(negocio) registered_address no ha sido proporcionada';

  @override
  String get financeRequirementAddressOfOperation =>
      '(negocio) physical_address no ha sido proporcionada';

  @override
  String get financeRequirementAddressOfResidence =>
      '(individual, persona asociada) physical_address no ha sido proporcionada';

  @override
  String get financeRequirementBusinessDescription =>
      '(negocio) business_description no ha sido proporcionada';

  @override
  String get financeRequirementBusinessFormationDocument =>
      '(negocio) no se ha proporcionado documento incluyendo business_formation como propósito';

  @override
  String get financeRequirementBusinessIndustry =>
      '(negocio) business_industry no ha sido proporcionada';

  @override
  String get financeRequirementBusinessName =>
      '(negocio) business_legal_name no ha sido proporcionado';

  @override
  String get financeRequirementBusinessOwnershipDocument =>
      '(negocio) no se ha proporcionado documento incluyendo ownership_information como propósito';

  @override
  String get financeRequirementBusinessWebsite =>
      '(negocio) primary_website no ha sido proporcionado';

  @override
  String get financeRequirementControlPerson =>
      '(negocio) nadie en associated_persons tiene has_control establecido como verdadero';

  @override
  String get financeRequirementDateOfBirth =>
      '(individual, persona asociada) birth_date no ha sido proporcionada';

  @override
  String get financeRequirementEmailAddress => 'email no ha sido proporcionado';

  @override
  String get financeRequirementFirstName =>
      '(individual, persona asociada) first_name no ha sido proporcionado';

  @override
  String get financeRequirementHasBase =>
      'indica que otro endoso necesita ser aprobado para desbloquear el actual';

  @override
  String get financeRequirementHasSepa =>
      'indica que otro endoso necesita ser aprobado para desbloquear el actual';

  @override
  String get financeRequirementIsDao =>
      '(negocio) is_dao no ha sido proporcionado';

  @override
  String get financeRequirementLastName =>
      '(individual, persona asociada) last-name no ha sido proporcionado';

  @override
  String get financeRequirementMinAge18 =>
      '(individual, persona asociada) no hemos podido confirmar que una persona cumple los requisitos de edad';

  @override
  String get financeRequirementMinAge60 =>
      '(individual, persona asociada) no hemos podido confirmar que una persona cumple los requisitos de edad';

  @override
  String get financeRequirementMinimalSourceOfFundsData =>
      '(negocio) account_purpose y source_of_funds no han sido proporcionados';

  @override
  String get financeRequirementOwnershipStructureAttestation =>
      '(negocio) nadie en associated_persons ha proporcionado attested_ownership_structure_at';

  @override
  String get financeRequirementPersonaSanctionsScreen =>
      'no se ha realizado la verificación de sanciones';

  @override
  String get financeRequirementProofOfAddressDocument =>
      '(negocio) no se ha proporcionado documento incluyendo proof_of_address como propósito';

  @override
  String get financeRequirementProofOfNatureOfBusinessDocument =>
      '(negocio) no se ha proporcionado documento incluyendo proof_of_nature_of_business como propósito';

  @override
  String get financeRequirementProofOfNatureOfBusinessDocumentInPersona =>
      '(negocio) no se ha proporcionado documento incluyendo proof_of_nature_of_business como propósito';

  @override
  String get financeRequirementSourceOfFundsQuestionnaire =>
      'el cliente ha sido marcado como que requiere SoF pero no ha enviado el cuestionario completo';

  @override
  String get financeRequirementSubdivisionNotAkUsa =>
      'no hemos podido confirmar la ubicación del cliente';

  @override
  String get financeRequirementSubdivisionNotNyUsa =>
      'no hemos podido confirmar la ubicación del cliente';

  @override
  String get financeRequirementTaxIdentificationNumber =>
      'no se ha proporcionado un número de identificación fiscal adecuado para el país de residencia/operación';

  @override
  String get financeRequirementTermsOfServiceV1 =>
      'el cliente no ha aceptado la versión mínima requerida de los términos de servicio de Bridge';

  @override
  String get financeRequirementTermsOfServiceV2 =>
      'el cliente no ha aceptado la versión mínima requerida de los términos de servicio de Bridge';

  @override
  String get financeIssueBeneficialOwnerTooYoung =>
      'el individuo está por debajo de la edad mínima requerida (18 años)';

  @override
  String get financeIssueCustomerTooYoung =>
      'el individuo está por debajo de la edad mínima requerida (18 años)';

  @override
  String get financeIssueBeneficialOwnerOverAge =>
      'el individuo excede la edad máxima';

  @override
  String get financeIssueCustomerOverAge =>
      'el individuo excede la edad máxima';

  @override
  String get financeIssueDeveloperNotCompatible =>
      'la cuenta de desarrollador no es compatible con el endoso';

  @override
  String get financeIssueCustomerNotCompatible =>
      'el perfil del cliente no es compatible con los requisitos';

  @override
  String get financeIssueTaxIdentificationNumberNotCompatible =>
      'el formato del TIN no pasó la validación';

  @override
  String get financeIssueEndorsementNotAvailableInCustomersRegion =>
      'endoso no disponible en la región geográfica del cliente';

  @override
  String get financeIssueResidenceAddressInvalidCity =>
      'La ciudad de la dirección de residencia es inválida';

  @override
  String get financeIssueResidenceAddressInvalidAddressLine1 =>
      'La línea 1 de la dirección de residencia es inválida';

  @override
  String get financeIssueResidenceAddressInvalidAddressLine2 =>
      'La línea 2 de la dirección de residencia es inválida';

  @override
  String get financeIssueResidenceAddressInvalidPostalCode =>
      'El código postal de la dirección de residencia es inválido';

  @override
  String get financeIssueResidenceAddressInvalidSubdivisionCode =>
      'El código de subdivisión de la dirección de residencia es inválido';

  @override
  String get financeIssueAdverseMediaReportMatch =>
      'se encontró una posible coincidencia de medios adversos; el cliente necesitará una revisión manual';

  @override
  String get financeIssueWatchlistReportMatch =>
      'se encontró una posible coincidencia en la lista de vigilancia de sanciones; el cliente necesitará una revisión manual';

  @override
  String get financeIssueBusinessFormationDocumentVerificationFailed =>
      'La verificación del documento de formación empresarial falló';

  @override
  String get financeIssueBusinessOwnershipDocumentVerificationFailed =>
      'La verificación del documento de propiedad empresarial falló';

  @override
  String get financeIssueGovernmentIdVerificationFailed =>
      'la verificación de identificación gubernamental falló';

  @override
  String get financeIssueFundsSourcedPensionOrRetirement =>
      'fondos provenientes de pensión/jubilación (marcado)';

  @override
  String get financeIssueHighExpectedMonthlyPayments =>
      'altos pagos mensuales esperados (marcado)';

  @override
  String get financeIssueHighRiskBusinessActivities =>
      'el cliente se dedica a actividades comerciales de alto riesgo';

  @override
  String get financeIssueOperatesInProhibitedCountries =>
      'el cliente opera en países prohibidos';

  @override
  String get financeIssuePoaInvalidDocumentType =>
      'El tipo de documento de Comprobante de Domicilio no es aceptado';

  @override
  String get financeIssuePoaManipulated =>
      'El documento de Comprobante de Domicilio parece estar manipulado';

  @override
  String get financeIssuePoaNameMismatch =>
      'El nombre en el documento de Comprobante de Domicilio no coincide con el nombre del cliente';

  @override
  String get financeIssuePoaPast90Days =>
      'El documento de Comprobante de Domicilio tiene más de 90 días';

  @override
  String get financeIssuePoaVirtualOrPoBox =>
      'el Comprobante de Domicilio es una dirección virtual o apartado postal (no permitido)';

  @override
  String get financeIssueProofOfNatureOfBusinessDocumentVerificationFailed =>
      'La verificación del documento de comprobante de naturaleza del negocio falló';

  @override
  String get financeIssueSuspiciousPrimaryPurpose =>
      'el propósito principal parece sospechoso';

  @override
  String get financeIssueSuspiciousSourceOfFunds =>
      'la fuente de fondos parece sospechosa';

  @override
  String get financeIssueUnemployedUsingSalary =>
      'persona desempleada reclamando ingresos por salario (marcado)';

  @override
  String get financeIssueBusinessLookupNoMatch =>
      'no se encontraron coincidencias en el registro empresarial; el cliente necesitará una revisión manual';

  @override
  String get financeIssueBusinessRegistryNoMatch =>
      'no se encontraron coincidencias en el registro empresarial; el cliente necesitará una revisión manual';

  @override
  String get financeIssueBusinessEinNoMatch => 'la validación del EIN falló';

  @override
  String get financeIssueBusinessWebsiteFailure =>
      'la validación del sitio web proporcionado falló; el cliente necesitará una revisión manual';

  @override
  String get financeIssueDatabaseCheckFailedOnNameLast =>
      'la verificación de base de datos falló en el apellido';

  @override
  String get financeIssueDatabaseCheckFailedOnSocialSecurityNumber =>
      'la verificación de base de datos falló en el SSN';

  @override
  String get financeIssueDatabaseCheckFailedOnTinValidation =>
      'la verificación de base de datos falló en la validación del TIN';

  @override
  String get financeIssueDatabaseCheckFailedOnHouseNumber =>
      'la verificación de base de datos falló en el número de casa';

  @override
  String get financeIssueDatabaseCheckFailedOnStreetName =>
      'la verificación de base de datos falló en el nombre de la calle';

  @override
  String get financeIssueDatabaseCheckFailedOnStreetType =>
      'la verificación de base de datos falló en el tipo de calle';

  @override
  String get financeIssueDatabaseCheckFailedOnCity =>
      'la verificación de base de datos falló en la ciudad';

  @override
  String get financeIssueDatabaseCheckFailedOnPostalCode =>
      'la verificación de base de datos falló en el código postal';

  @override
  String get financeIssueDatabaseCheckFailedOnSubdivision =>
      'la verificación de base de datos falló en la subdivisión';

  @override
  String get financeIssueDatabaseCheckFailedOnCountryCode =>
      'la verificación de base de datos falló en el código de país';

  @override
  String get financeIssuePoaFailed =>
      'la verificación del Comprobante de Domicilio falló';

  @override
  String get financeIssueBlocklistCheckFailed =>
      'la información de identificación proporcionada es de una persona que Bridge no apoyará';

  @override
  String get financeIssueManualReviewRejected =>
      'la revisión manual fue rechazada';

  @override
  String get financeIssuePendingRfi =>
      'la Solicitud de Información (RFI) está pendiente';

  @override
  String get financeIssueRejectedDueToUnsupportedGeo =>
      'rechazado debido a geografía no soportada';

  @override
  String get financeIssueRejectedDueToUnsupportedBusinessActivities =>
      'rechazado debido a actividades comerciales no soportadas';

  @override
  String get financeIssueRejectedDueToInaccurateOnboardingDetails =>
      'rechazado debido a detalles de incorporación inexactos';

  @override
  String get financeIssueRejectedDueToUnidentifiableBusinessEntity =>
      'rechazado debido a entidad comercial no identificable';

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
