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
      'Por favor confirma tu ID de usuario para borrar tu cuenta.';

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
  String get unArchive => 'Desarchivar';

  @override
  String get areGuestsAllowedToJoin => 'Pueden unirse usuarios de visita?';

  @override
  String get areYouSure => 'Estás seguro?';

  @override
  String get areYouSureYouWantToLogout => 'Confirma que quiere cerrar sesión?';

  @override
  String get askSSSSSign =>
      'Para poder confirmar a la otra persona, ingrese su contraseña de almacenamiento segura o la clave de recuperación.';

  @override
  String askVerificationRequest(String username) {
    return 'Aceptar esta solicitud de verificación de $username?';
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
    return '$chats charlas y $participants Los participantes';
  }

  @override
  String countMembers(int count) {
    return '$count Miembros';
  }

  @override
  String get noMoreChatsFound => 'No se encontraron más charlas...';

  @override
  String get noChatsFoundHere =>
      'No se han encontrado chats. Inicia un nuevo chat usando el botón de abajo. ⤵️';

  @override
  String get joinedChats => 'chats Unidos';

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
  String get welcome => 'Te damos la\nBienvenida';

  @override
  String get welcomeSubtitle => 'A una experiencia sin precedentes';

  @override
  String get welcomeDescription =>
      'Aquí no solo tienes una app. Tienes tu mundo en la palma de la mano: conecta, compra, paga, explora y transforma tu día… sin salir de Bemind';

  @override
  String get getStarted => 'Comenzar';

  @override
  String get chatTitle => 'Chat';

  @override
  String get chatSubtitle => 'Chat, comparte y paga en un solo lugar.';

  @override
  String get chatDescription =>
      'Habla, comparte y paga, todo en un solo lugar.\nEnvía mensajes, comparte archivos, haz llamadas e incluso paga directamente en el chat.';

  @override
  String get goToChat => 'Ir al Chat';

  @override
  String get financeTitle => 'Finanzas';

  @override
  String get financeSubtitle => 'Tu dinero, hecho simple.';

  @override
  String get financeDescription =>
      'Envía, recibe, convierte, paga con QR o agrega fondos, todo en un solo lugar. Sin complicaciones. Sin sorpresas.';

  @override
  String get goToWallet => 'Ir a la Billetera';

  @override
  String get marketplaceTitle => 'Marketplace';

  @override
  String get marketplaceSubtitle =>
      'Compra sin buscar - encuentra lo que necesitas.';

  @override
  String get marketplaceDescription =>
      'Productos, servicios y experiencias seleccionados para ti. Precios reales, sin compromisos, y todo pagado con tu billetera, directamente desde la app.';

  @override
  String get goToMarketplace => 'Ir al Marketplace';

  @override
  String get appsTitle => 'Apps';

  @override
  String get appsSubtitle => 'Tus apps favoritas, ya integradas.';

  @override
  String get appsDescription =>
      'Desde delivery y viajes hasta suscripciones y reservas - todo está a solo un toque de distancia.';

  @override
  String get goToApps => 'Ir a Apps';

  @override
  String get communitiesTitle => 'Comunidades';

  @override
  String get communitiesSubtitle => 'Conecta, comparte y crea.';

  @override
  String get communitiesDescription =>
      'Descubre lo que otros comparten - o comparte lo tuyo. Esto no es solo redes sociales... es tu espacio, tu voz, tu lugar en el mundo digital.';

  @override
  String get goToCommunity => 'Ir a Comunidad';

  @override
  String get music => 'Música';

  @override
  String get yourRhythmYourSpace => 'Tu ritmo, tu espacio';

  @override
  String get musicDescription =>
      'Escucha tus canciones favoritas mientras chateas, compras o exploras - todo en un solo lugar. Dale play a lo que te hace sentir bien.';

  @override
  String get mentalHealth => 'Salud Mental';

  @override
  String get yourPeaceAlsoMatters => 'Tu paz también importa';

  @override
  String get mentalHealthDescription =>
      'Herramientas y recursos para tu bienestar emocional. Meditación, ejercicios de mindfulness y apoyo profesional cuando más lo necesites.';

  @override
  String get aiFinance => 'I.A: Finanzas';

  @override
  String get letMoneyThinkToo => 'Deja que tu dinero piense por ti';

  @override
  String get aiFinanceDescription =>
      'Inteligencia artificial que te ayuda a tomar decisiones financieras más inteligentes. Análisis automático, recomendaciones personalizadas e insights predictivos.';

  @override
  String get nutrition => 'Nutrición';

  @override
  String get eatWithoutComplications => 'Come sin complicaciones';

  @override
  String get nutritionDescription =>
      'Obtén recetas personalizadas basadas en lo que tienes en tu nevera, menús personalizados, alertas útiles - y consejos diarios para ayudarte a sentirte mejor.';

  @override
  String get accessDenied => 'Acceso Denegado';

  @override
  String get searchError => 'Error de Búsqueda';

  @override
  String get accessRequired => 'Acceso Requerido';

  @override
  String get cameraAccessRequired =>
      'Se requiere acceso a la cámara para la verificación de documentos KYC. Por favor, habilite el permiso de cámara en la configuración de la aplicación.';

  @override
  String get openSettings => 'Abrir Configuración';

  @override
  String get success => 'Éxito';

  @override
  String get info => 'Información';

  @override
  String get loading => 'Cargando...';

  @override
  String get joinMeOnBeMindPower => '¡Únete a mí en Be MindPower!';

  @override
  String inviteMessageBody(String displayName) {
    return 'Hola, soy $displayName y me gustaría invitarte a chatear conmigo en Be MindPower.';
  }

  @override
  String downloadTheApp(String url) {
    return 'Descarga la aplicación: $url';
  }

  @override
  String get beMindPowerTagline =>
      'Be MindPower - ¡Conecta, Chatea y Crece Juntos!';

  @override
  String failedToCreateInvite(String error) {
    return 'Error al crear invitación: $error';
  }

  @override
  String get emailVerification => 'Verificación de Correo';

  @override
  String get verifyingYourEmail => 'Verificando tu correo...';

  @override
  String get pleaseWaitWhileWeCompleteRegistration =>
      'Por favor espera mientras completamos tu registro.';

  @override
  String get registrationComplete => '¡Registro Completo!';

  @override
  String get emailVerifiedAndAutoLoginSuccessful =>
      'Correo verificado e inicio de sesión automático exitoso.\nRedirigiendo a tu panel...';

  @override
  String get verificationFailed => 'La verificación falló';

  @override
  String get tryAgain => 'Inténtelo de nuevo';

  @override
  String get emailVerifiedRedirecting =>
      '¡Correo verificado! Redirigiendo al inicio de sesión...';

  @override
  String get emailVerificationFailedTryAgain =>
      'La verificación de correo falló. Por favor intenta de nuevo.';

  @override
  String get verificationError => 'Error de Verificación';

  @override
  String get goToLogin => 'Ir al Inicio de Sesión';

  @override
  String get pleaseLogInToAccessArchive =>
      'Por favor inicia sesión para acceder al archivo';

  @override
  String get error => 'Error';

  @override
  String get errorAccessingArchive => 'Error al acceder al archivo';

  @override
  String get contacts => 'Contactos';

  @override
  String get filter => 'Filtro';

  @override
  String get unreadChat => 'Chat No Leído';

  @override
  String get noResultsFound => 'No se encontraron resultados';

  @override
  String get search => 'Buscar';

  @override
  String get select => 'Seleccionar';

  @override
  String get markRead => 'Marcar como Leído';

  @override
  String get markUnread => 'Marcar como No Leído';

  @override
  String get blockUser => 'Bloquear Usuario';

  @override
  String get read => 'Leer';

  @override
  String get myWallet => 'Mi Billetera';

  @override
  String get myBank => 'Mi Banco';

  @override
  String get home => 'Inicio';

  @override
  String get logout => 'Cerrar Sesión';

  @override
  String get favorites => 'Favoritos';

  @override
  String get unfavorite => 'Quitar de\nfavoritos';

  @override
  String get noFavoritesYet => 'Aún no hay favoritos';

  @override
  String get starMessagesToAddFavorites =>
      'Marca mensajes con estrella para añadirlos a favoritos';

  @override
  String get removedFromFavorites => 'Eliminado de favoritos';

  @override
  String get unknownRoom => 'Sala desconocida';

  @override
  String get unknownTime => 'Hora desconocida';

  @override
  String errorWithMessage(String message) {
    return 'Error: $message';
  }

  @override
  String get newMessage => 'Nuevo Mensaje';

  @override
  String get searchUsers => 'Buscar @usuarios...';

  @override
  String yourGlobalUsernameIs(String username) {
    return 'Tu nombre de usuario global es: @$username';
  }

  @override
  String get invitationLink => 'Enlace de invitación';

  @override
  String get sendLinkToChat => 'Envía un enlace para chat.';

  @override
  String get createGroupChat => 'Crear un chat grupal.';

  @override
  String get scanQRCode => 'Escanear QR';

  @override
  String get scanQRCodeDescription => 'Escanear un código QR.';

  @override
  String get errorSearchingUsers => 'Error buscando usuarios';

  @override
  String get noUsersFound => 'No se encontraron usuarios';

  @override
  String get permissionDenied => 'Permiso Denegado';

  @override
  String get searchContact => 'Buscar contacto';

  @override
  String get noContactsFound => 'No se encontraron contactos';

  @override
  String get group => 'Grupo';

  @override
  String get calls => 'Llamadas';

  @override
  String get done => '¡Listo!';

  @override
  String get taskCompletedSuccessfully => 'Tarea completada\nexitosamente';

  @override
  String get goBack => 'Volver';

  @override
  String get signupSuccessMessage => 'Te has registrado \nexitosamente';

  @override
  String get chatBackup => 'Copia de respaldo del chat';

  @override
  String get chatBackupDescription =>
      'La copia de respaldo del chat está protegida por una llave de seguridad. Procure no perderla.';

  @override
  String get paywallTitle => 'Premium BM';

  @override
  String get paywallSubtitle =>
      'Desbloquea el verdadero potencial de tu comunidad';

  @override
  String get firstMonthLabel => 'Primer mes gratis';

  @override
  String get thenEnjoyMemberPriceLabel =>
      'Luego disfruta de nuestro precio de miembro';

  @override
  String get usdMonthLabel => 'USD/mes';

  @override
  String get yearlyPlanOfferLabel => 'Plan anual, 1 mes gratis incluido';

  @override
  String get annualLabel => 'Anual';

  @override
  String get confirmSelectionLabel => 'Por favor confirma tu selección';

  @override
  String get confirmButton => 'Confirmar';

  @override
  String get thisMonthIsOnUs => 'Este mes es por nuestra cuenta';

  @override
  String get ifYouLoveItContinueFor => 'Si te encanta, continúa por';

  @override
  String get thenEnjoyMemberPriceForJust =>
      'Luego disfruta de un precio de miembro por solo';

  @override
  String get usdMonth => 'USD mes';

  @override
  String get yearlyPlanOfferText =>
      'También puedes obtener nuestro plan anual por solo:';

  @override
  String get confirmYourSelection => 'Confirma tu selección';

  @override
  String get addPaymentMethod => 'Agregar método de pago';

  @override
  String get applePay => 'Apple Pay';

  @override
  String get googlePay => 'Google Pay';

  @override
  String get orPayWithCard => 'O PAGAR CON TARJETA';

  @override
  String get quickPay => 'Pago rápido';

  @override
  String get creditOrDebitCard => 'Tarjeta de crédito o débito';

  @override
  String get invalidCardDetails =>
      'Detalles de tarjeta inválidos. Por favor revisa e intenta de nuevo.';

  @override
  String get subscriptionActivated => '¡Suscripción activada con éxito!';

  @override
  String get chatDetails => 'Detalles del chat';

  @override
  String get chatHasBeenAddedToThisSpace =>
      'El chat se ha agregado a este espacio';

  @override
  String get chats => 'Chats';

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
  String get createGroup => 'Crear Grupo';

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
      'Se desactivará su cuenta de usuario. ¡La operación no se puede cancelar! Está seguro?';

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
  String get directChats => 'chats directo';

  @override
  String get allRooms => 'Todos los charlas grupales';

  @override
  String get displaynameHasBeenChanged => 'El nombre visible ha cambiado';

  @override
  String get download => 'Descargar';

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
      'Ya no podrá deshabilitar el cifrado. Estás seguro?';

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
  String get howOffensiveIsThisContent => 'Cuán ofensivo es este contenido?';

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
    return 'Quieres invitar a $contact al chat $groupName?';
  }

  @override
  String inviteContactToGroup(String groupName) {
    return 'Invitar contacto a $groupName';
  }

  @override
  String get noChatDescriptionYet =>
      'No se ha creado una descripción del chat aún.';

  @override
  String get hangup => 'Colgar';

  @override
  String get logoutConfirmTitle => 'Cerrar sesión';

  @override
  String get logoutConfirmMessage =>
      'Estás seguro de que quieres cerrar sesión?';

  @override
  String get logoutButton => 'Cerrar sesión';

  @override
  String get comingSoon => 'Próximamente';

  @override
  String get searchApps => 'Buscar aplicaciones...';

  @override
  String get education => 'Educación';

  @override
  String get game => 'Juego';

  @override
  String get sport => 'Deporte';

  @override
  String get animal => 'Animal';

  @override
  String get love => 'Amor';

  @override
  String get traveling => 'Viajes';

  @override
  String get automotive => 'Automotriz';

  @override
  String get popular => 'Popular';

  @override
  String get food => 'Comida';

  @override
  String get health => 'Salud';

  @override
  String get shopping => 'Compras';

  @override
  String get art => 'Arte';

  @override
  String get spiritual => 'Espiritual';

  @override
  String get maintenance => 'Mantenimiento';

  @override
  String get lifestyle => 'Estilo de vida';

  @override
  String get construction => 'Construcción';

  @override
  String get camera => 'Cámara';

  @override
  String get comingSoonEllipsis => 'Próximamente...';

  @override
  String get exploreFeatures => 'Explorar funciones';

  @override
  String get welcomeToBeMindPower => 'Bienvenido a \n BeMind Power';

  @override
  String get signUpForAnAccount => 'Registrarse para una cuenta';

  @override
  String get whatTypeOfAccountDoYouWantToOpen =>
      'Qué tipo de cuenta deseas abrir?';

  @override
  String get naturalPerson => 'Persona natural';

  @override
  String get verificationEmailSent => '¡Correo de verificación enviado!';

  @override
  String get pleaseCheckEmailAndVerify =>
      'Por favor revisa tu correo y haz clic en el enlace de verificación, luego haz clic en \"Completar registro\" a continuación.';

  @override
  String get clickCompleteAfterVerifying =>
      'Haz clic en \"Completar registro\" después de verificar tu correo.';

  @override
  String get completeRegistration => 'Completar registro';

  @override
  String get startOver => 'Empezar de nuevo';

  @override
  String get successfullyRegistered => '¡Registrado exitosamente!';

  @override
  String get emailVerificationRequired => 'Verificación de correo requerida';

  @override
  String get pleaseVerifyEmailFirst =>
      'Por favor revisa tu correo y haz clic en el enlace de verificación primero, luego intenta de nuevo.';

  @override
  String get sessionExpiredStartOver =>
      'Tu sesión ha expirado. Por favor inicia el proceso de registro nuevamente.';

  @override
  String get pleaseVerifyEmailBeforeCompleting =>
      'Por favor verifica tu dirección de correo antes de completar el registro.';

  @override
  String get gotIt => 'Entendido';

  @override
  String get createPassword => 'Crear contraseña';

  @override
  String get enterYourPassword => 'Ingresa tu contraseña';

  @override
  String get confirmPassword => 'Confirmar contraseña';

  @override
  String get alreadyHaveAccount => 'Ya tienes una cuenta?';

  @override
  String get logIn => 'Iniciar sesión';

  @override
  String get federationBaseURL => 'URL Base de Federación';

  @override
  String get clientWellKnownInformation => 'Información Client-Well-Known:';

  @override
  String get baseURL => 'URL Base';

  @override
  String get identityServer => 'Servidor de Identidad:';

  @override
  String get defaultPack => 'Paquete Predeterminado';

  @override
  String get pushError => 'Error de Push';

  @override
  String get deleteError => 'Error al Eliminar';

  @override
  String get answer => 'Responder';

  @override
  String heldTheCall(String displayName) {
    return '$displayName puso la llamada en espera.';
  }

  @override
  String get youHeldTheCall => 'Pusiste la llamada en espera.';

  @override
  String get foregroundServiceRunning =>
      'Esta notificación aparece cuando el servicio en segundo plano se está ejecutando.';

  @override
  String get screenSharingTitle => 'Compartir la pantalla';

  @override
  String get screenSharingDetail =>
      'Usted está compartiendo su pantalla en BMP';

  @override
  String get emailVerificationFailed =>
      'La verificación del correo electrónico falló';

  @override
  String get unableToGetSession =>
      'No se pudo obtener la sesión para el registro';

  @override
  String get registrationFailed => 'El registro falló';

  @override
  String get networkError =>
      'Error de red. Por favor verifica tu conexión e intenta de nuevo.';

  @override
  String emailVerificationFailedWithError(String error) {
    return 'La verificación del correo electrónico falló: $error';
  }

  @override
  String get registrationDataNotFound =>
      'Datos de registro no encontrados. Por favor, inicie el registro nuevamente.';

  @override
  String get usernameAlreadyExists => 'El nombre de usuario ya existe';

  @override
  String get unableToGetSessionTryAgain =>
      'No se pudo obtener la sesión. Por favor, inténtelo de nuevo.';

  @override
  String get emailNotVerifiedYet =>
      'Correo electrónico aún no verificado. Por favor, revise su bandeja de entrada y haga clic en el enlace de verificación.';

  @override
  String get usernameAlreadyExistsChooseDifferent =>
      'El nombre de usuario ya existe. Por favor, elija un nombre de usuario diferente.';

  @override
  String get emailAlreadyRegistered =>
      'Correo electrónico ya registrado. Por favor, use una dirección de correo electrónico diferente.';

  @override
  String get emailAlreadyExist => 'Correo electrónico ya registrado';

  @override
  String get networkErrorCheckConnection =>
      'Error de red. Por favor, verifique su conexión e inténtelo de nuevo.';

  @override
  String get bmpDescription =>
      'BMP te permite chatear con tus amigos a través de diferentes mensajerías.';

  @override
  String get signUp => 'Registrarse';

  @override
  String photos(int count) {
    return '$count Fotos';
  }

  @override
  String videos(int count) {
    return '$count Vídeos';
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
  String get sharedMedia => 'Medios Compartidos';

  @override
  String items(int count) {
    return '$count elementos';
  }

  @override
  String get noMediaToShow => 'No hay medios para mostrar';

  @override
  String get beTheFirstToShareAMoment =>
      'Sé el primero en compartir un momento';

  @override
  String get file => 'Archivo';

  @override
  String opening(String fileName) {
    return 'Abriendo $fileName';
  }

  @override
  String get renameChannel => 'Renombrar canal';

  @override
  String get renameGroupChannel => 'Renombrar canal del grupo';

  @override
  String get renameGroup => 'Renombrar grupo';

  @override
  String get changeGroupName => 'Cambiar el nombre del grupo';

  @override
  String get setCustomEmotes => 'Establecer emoticonos personalizados';

  @override
  String get whoCanPerformWhichAction => 'Quién puede realizar qué acción';

  @override
  String get setting => 'Configuración';

  @override
  String get financePersonalInfo => 'Información Personal';

  @override
  String get financeAddress => 'Dirección';

  @override
  String get financeID => 'Identificación';

  @override
  String get financeTermsOfService => 'Términos de Servicio';

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
      'Error al aceptar los Términos de Servicio';

  @override
  String get financeTermsAcceptanceRequired =>
      'Se requiere aceptar los términos';

  @override
  String get financeIncompleteFields =>
      'Por favor complete todos los campos requeridos';

  @override
  String get financeValidEmail => 'Correo electrónico válido';

  @override
  String get financeBirthDate => 'Fecha de nacimiento';

  @override
  String get financeStreetAddress => 'Dirección';

  @override
  String get financeCity => 'Ciudad';

  @override
  String get financeCountry => 'País';

  @override
  String get financeState => 'Estado';

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
      'Ocurrió un error. Por favor, inténtelo de nuevo.';

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
  String get unableToPlayVideo => 'No se puede reproducir el video';

  @override
  String get notImplemented => 'No implementado';

  @override
  String get loadingEmojiVerification => 'Cargando verificación de emoji...';

  @override
  String get preparingEmojiVerification =>
      'Preparando verificación de emoji...';

  @override
  String get verificationCodesDontMatch =>
      'Los códigos de verificación no coinciden. Por favor, inténtelo de nuevo.';

  @override
  String get verificationCancelled => 'Verificación Cancelada';

  @override
  String get otherUserCancelledVerification =>
      'El otro usuario canceló la verificación.';

  @override
  String get verificationTimeout => 'Tiempo de Verificación Agotado';

  @override
  String get verificationTimedOut =>
      'Se agotó el tiempo de verificación. Por favor, inténtelo de nuevo.';

  @override
  String get unknownVerificationTransaction =>
      'Transacción de verificación desconocida.';

  @override
  String get methodNotSupported => 'Método No Soportado';

  @override
  String get verificationMethodNotSupported =>
      'Este método de verificación no es compatible.';

  @override
  String get unexpectedMessageReceived =>
      'Se recibió un mensaje inesperado durante la verificación.';

  @override
  String get keyVerificationFailed => 'Verificación de Clave Fallida';

  @override
  String get keysCouldNotBeVerified =>
      'Las claves no pudieron ser verificadas.';

  @override
  String get userVerificationFailed => 'Verificación de Usuario Fallida';

  @override
  String get userIdentityCouldNotBeVerified =>
      'La identidad del usuario no pudo ser verificada.';

  @override
  String get invalidMessage => 'Mensaje Inválido';

  @override
  String get invalidMessageReceived =>
      'Se recibió un mensaje inválido durante la verificación.';

  @override
  String get alreadyVerified => 'Ya Verificado';

  @override
  String get verificationAlreadyAccepted =>
      'Esta verificación ya fue aceptada en otro dispositivo.';

  @override
  String get verificationCancelledByOtherUser =>
      'La verificación fue cancelada por el otro usuario.';

  @override
  String get tourGuide => 'Guía Turística';

  @override
  String get finance => 'Finanzas';

  @override
  String get marketplace => 'Mercado';

  @override
  String get community => 'Comunidad';

  @override
  String get apps => 'Aplicaciones';

  @override
  String get addContacts => 'Agregar Contactos';

  @override
  String get goBackToAllChats => 'Volver a todos los chats';

  @override
  String failedToInviteUser(String roomId) {
    return 'Error al invitar usuario de la sala $roomId';
  }

  @override
  String get unableToCreateGroup => 'No se pudo crear el grupo';

  @override
  String get pleaseFillOut => 'Por favor complete';

  @override
  String get newGroup => 'Nuevo Grupo';

  @override
  String get imageGroup => 'Imagen del grupo';

  @override
  String get groupName => 'Nombre del grupo';

  @override
  String get enterGroupName => 'Ingrese el nombre del grupo';

  @override
  String get changeNameGroup => 'Cambiar Nombre del Grupo';

  @override
  String get publicGroup => 'Grupo Público';

  @override
  String get privateGroup => 'Grupo Privado';

  @override
  String get anyoneCanFindAndJoin =>
      'Cualquiera puede encontrar y unirse a este grupo';

  @override
  String get onlyInvitedMembersCanJoin =>
      'Solo los miembros invitados pueden unirse a este grupo';

  @override
  String get endToEndEncryption => 'Cifrado de Extremo a Extremo';

  @override
  String get messagesWillBeEncrypted =>
      'Los mensajes serán cifrados por seguridad';

  @override
  String get messagesWillNotBeEncrypted => 'Los mensajes no serán cifrados';

  @override
  String get pleaseEnterGroupNameFirst =>
      'Por favor ingrese el nombre del grupo primero';

  @override
  String get selectFromYourContacts => 'Seleccione de sus contactos';

  @override
  String get contactsInGroup => 'Contactos en el grupo';

  @override
  String get unsupportedVersion => 'Versión No Soportada';

  @override
  String get copied => 'Copiado';

  @override
  String qrCodeScanned(String link) {
    return 'Código QR Escaneado: $link';
  }

  @override
  String usernameServer(String username, String server) {
    return 'Usuario: $username, Servidor: $server';
  }

  @override
  String extractedUserId(String userId) {
    return 'ID de Usuario Extraído: $userId';
  }

  @override
  String get matrixUrlDetected => 'URL de Matrix.to u otro formato detectado';

  @override
  String get addCaption => 'Agrega un título...';

  @override
  String get selectContact => 'Seleccionar Contacto';

  @override
  String get scanQR => 'Escanear QR';

  @override
  String get messages => 'Mensajes';

  @override
  String get decline => 'Rechazar';

  @override
  String youInvitedBy(String user) {
    return 'Te invitó $username';
  }

  @override
  String get invalidServerName => 'Nombre de servidor inválido';

  @override
  String get archiveRoomDescription =>
      'Estás seguro de que quieres archivar esta sala?';

  @override
  String get hidePresences => 'Ocultar presencias';

  @override
  String get leaveEmptyToClearStatus => 'Deja vacío para borrar el estado';

  @override
  String get removeFromBundle => 'Eliminar del paquete';

  @override
  String get encryptionSetupRequired =>
      'Se requiere configuración de cifrado para mensajería segura. Por favor complete la configuración en Ajustes.';

  @override
  String get warning => '¡Advertencia!';

  @override
  String get noDevicesSelectedForRemoval =>
      'No hay dispositivos seleccionados para eliminar';

  @override
  String get deviceDeletionNotAllowed =>
      'Eliminación de dispositivo no permitida: Estos dispositivos pueden estar protegidos, activos recientemente, o requerir permisos adicionales del administrador del servidor. Este mensaje no aparecerá de nuevo.';

  @override
  String get deviceDeletionFailed =>
      'Eliminación de dispositivo fallida: El servidor rechazó la solicitud.';

  @override
  String failedToRemoveDevices(String error) {
    return 'Error al eliminar dispositivos: $error';
  }

  @override
  String get devicesRemovedSuccessfully =>
      'Dispositivos eliminados exitosamente';

  @override
  String errorRemovingDevices(String error) {
    return 'Error eliminando dispositivos: $error';
  }

  @override
  String get verifyOtherDevice => 'Verificar otro dispositivo';

  @override
  String get verifyOtherDeviceDescription =>
      'Quieres verificar este dispositivo?';

  @override
  String get removeDevicesDescription =>
      'Estás seguro de que quieres eliminar los dispositivos seleccionados?';

  @override
  String get failedToLoadChat =>
      'Error al cargar el chat. Por favor, inténtalo de nuevo.';

  @override
  String get encryptionIssue => 'Problema de cifrado';

  @override
  String get encryptionStatus => 'Estado del cifrado';

  @override
  String get room => 'Sala';

  @override
  String get clientReady => 'Cliente listo';

  @override
  String get roomReady => 'Sala lista';

  @override
  String get canReceive => 'Puede recibir';

  @override
  String get recommendations => 'Recomendaciones';

  @override
  String get fixEncryption => 'Arreglar Cifrado';

  @override
  String get addedToFavorites => 'Agregado a favoritos';

  @override
  String get transferOnlyDirectChats =>
      'Las transferencias solo están disponibles en charlas directos';

  @override
  String get transferSuccessful => 'Transferencia exitosa:';

  @override
  String get messageForwardedSuccessfully => 'Mensaje reenviado exitosamente';

  @override
  String get callsOnlyDirectChats =>
      'Las llamadas solo están disponibles en charlas directos.';

  @override
  String get mustBeMemberToCall =>
      'Debes ser miembro de esta sala para iniciar una llamada.';

  @override
  String get cannotDetermineCallRecipient =>
      'No se puede determinar el destinatario de la llamada.';

  @override
  String get voiceVideoCallsNotAvailable =>
      'Las llamadas de voz y video no están disponibles. Por favor, habilítalas en configuración.';

  @override
  String get failedToStartCall => 'Error al iniciar llamada';

  @override
  String get startGroupCall => 'Iniciar llamada grupal';

  @override
  String get chooseGroupCallType => 'Elige el tipo de llamada grupal:';

  @override
  String get voiceGroupCall => 'Llamada grupal de voz';

  @override
  String get videoGroupCall => 'Videollamada grupal';

  @override
  String get startCall => 'Iniciar llamada';

  @override
  String get chooseCallType => 'Elige el tipo de llamada que quieres hacer:';

  @override
  String get makeYourFirstCall => 'Haz tu primera llamada';

  @override
  String get checkBackLater => 'o vuelve más tarde para ver nueva actividad';

  @override
  String get startAConversation => 'Inicia una\nConversación';

  @override
  String get sendMessageToGetStarted => 'Envía un mensaje para comenzar';

  @override
  String get noParticipantsGroupCall =>
      'No hay participantes disponibles para la llamada grupal.';

  @override
  String get groupCallsInDevelopmentDirectOnly =>
      'Las llamadas grupales están en desarrollo. Por favor, usa llamadas directas por ahora.';

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
  String get document => 'Documento';

  @override
  String get location => 'Ubicación';

  @override
  String get contact => 'Contacto';

  @override
  String get send => 'Enviar';

  @override
  String get request => 'Solicitar';

  @override
  String get qr => 'Código QR';

  @override
  String get replaceOldestPin => '¿Reemplazar el pin más antiguo?';

  @override
  String get yourNewPinWillReplace =>
      'Tu nuevo pin reemplazará el más antiguo.';

  @override
  String get gift => 'Regalo';

  @override
  String get favorite => 'Favorito';

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
  String get recoveryKeyLost => 'Perdió su clave de recuperación?';

  @override
  String get wipeChatBackup =>
      'Limpiar la copia de seguridad de tu chat para crear una nueva clave de recuperación?';

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
      'Exportó su sesión la última vez que estuvo en TOR? Impórtela rápidamente y continúe chateando.';

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
  String get members => 'Miembros';

  @override
  String get welcomeToMindPower => '¡Bienvenido a MindPower!';

  @override
  String get accountSuccessfullyCreated =>
      'Su cuenta ha sido creada y verificada exitosamente.';

  @override
  String get takingYouToDashboard => 'Llevándote a tu panel de control...';

  @override
  String get continueToApp => 'Continuar a la App';

  @override
  String get quickAccess => 'Acceso rápido';

  @override
  String get cards => 'Tarjetas';

  @override
  String get privacy => 'Privacidad';

  @override
  String get notification => 'Notificación';

  @override
  String get wallet => 'Billetera';

  @override
  String get allCalls => 'Todas las Llamadas';

  @override
  String get unreadCalls => 'Llamadas No Leídas';

  @override
  String get setChatDescription => 'Establecer descripción del chat';

  @override
  String get replaceRoomWithNewerVersion =>
      'Reemplazar sala con versión más nueva';

  @override
  String get roomUpgradeDescription =>
      'Esto actualizará la sala a una versión más nueva. Esta acción no se puede deshacer.';

  @override
  String get usersMustKnock => 'Los usuarios deben tocar';

  @override
  String get noOneCanJoin => 'Nadie puede unirse';

  @override
  String get restricted => 'Restringido';

  @override
  String get knockRestricted => 'Toque restringido';

  @override
  String get unknown => 'Desconocido';

  @override
  String get openGallery => 'Abrir galería';

  @override
  String get voiceCallsOnlyDirectChats =>
      'Las llamadas de voz solo están disponibles en charlas directos';

  @override
  String get videoCallsOnlyDirectChats =>
      'Las videollamadas solo están disponibles en charlas directos';

  @override
  String get voiceCallsNotAvailable =>
      'Las llamadas de voz no están disponibles';

  @override
  String get videoCallsNotAvailable => 'Las videollamadas no están disponibles';

  @override
  String failedToStartVoiceCall(String error) {
    return 'Error al iniciar llamada de voz: $error';
  }

  @override
  String failedToStartVideoCall(String error) {
    return 'Error al iniciar videollamada: $error';
  }

  @override
  String get unsupportedAndroidVersion => 'Versión de Android no compatible';

  @override
  String get unsupportedAndroidVersionLong =>
      'Esta función requiere Android 5.0 o superior';

  @override
  String get available => 'Disponible';

  @override
  String get typeMessage => 'Escribe un mensaje..';

  @override
  String get report => 'Reportar';

  @override
  String get selectPhotos => 'Seleccionar Fotos';

  @override
  String selectPhotosWithCount(int count) {
    return 'Seleccionar Fotos ($count)';
  }

  @override
  String get galleryAccessRequired => 'Se Requiere Acceso a la Galería';

  @override
  String get grantPermission => 'Conceder Permiso';

  @override
  String get messageInfo => 'Información del mensaje';

  @override
  String get pinnMessage => 'Fijar mensaje';

  @override
  String get redactMessage => 'Eliminar mensaje';

  @override
  String get reportMessage => 'Reportar mensaje';

  @override
  String get jumpToLastReadMessage => 'Ir al último mensaje leído';

  @override
  String get jump => 'Ir';

  @override
  String get enterNewChat => 'Entrar al nuevo chat';

  @override
  String get reopenChat => 'Reabrir chat';

  @override
  String get reply => 'Responder';

  @override
  String get shareContact => 'Compartir Contacto';

  @override
  String get searchContacts => 'Buscar contactos';

  @override
  String get loadingContacts => 'Cargando contactos...';

  @override
  String get accessYourContacts => 'Acceder a Tus Contactos';

  @override
  String get contactsPermissionMessage =>
      'Para compartir contactos con tus amigos, por favor permite el acceso a los contactos de tu dispositivo.';

  @override
  String get allowAccess => 'Permitir Acceso';

  @override
  String contactsSelected(int count, String plural) {
    return '$count contacto$plural seleccionado$plural';
  }

  @override
  String get sending => 'Enviando...';

  @override
  String sendCount(int count) {
    return 'Enviar ($count)';
  }

  @override
  String contactsSharedSuccessfully(int count, String plural) {
    return '$count contacto$plural compartido$plural exitosamente';
  }

  @override
  String failedToSendContacts(String error) {
    return 'Error al enviar contactos: $error';
  }

  @override
  String get encryptionEnabledButIncomplete =>
      'El cifrado está habilitado pero la verificación del dispositivo está incompleta.';

  @override
  String get recreateChatError =>
      'Intentar recrear una sala que no es un chat directo. ¡Esto no debería ser posible desde la interfaz!';

  @override
  String get transferFunds => 'Transferir Fondos';

  @override
  String get checkingRecipient => 'Verificando destinatario...';

  @override
  String get transferNotAvailable => 'Transferencia No Disponible';

  @override
  String get recipientNoEthereumWallet =>
      'El destinatario no tiene billetera Ethereum. Por favor pídale que cree una billetera Ethereum primero.';

  @override
  String get createEthereumWalletFirst =>
      'Necesita crear una billetera Ethereum primero para hacer transferencias.';

  @override
  String get createCustomerAccountFirstChat =>
      'Por favor crea primero una cuenta de cliente';

  @override
  String get createCustomerAccountFirst =>
      'Por favor cree una cuenta de cliente primero para hacer transferencias.';

  @override
  String get retry => 'Reintentar';

  @override
  String get createCustomer => 'Crear Cliente';

  @override
  String get loadingWallets => 'Cargando billeteras...';

  @override
  String get createWallet => 'Crear Billetera';

  @override
  String get loadingRecipientWallets => 'Loading recipient wallets...';

  @override
  String transferPaymentTo(String recipient) {
    return 'Transferir Pago a $recipient';
  }

  @override
  String get amount => 'Cantidad';

  @override
  String get pleaseEnterAmount => 'Por favor ingrese la cantidad';

  @override
  String get pleaseEnterValidAmount => 'Por favor ingrese una cantidad válida';

  @override
  String get minimumAmount => 'La cantidad mínima es \$1';

  @override
  String get maximumAmount => 'La cantidad máxima es \$10,000';

  @override
  String get currency => 'Moneda';

  @override
  String get sourceWallet => 'Billetera de origen';

  @override
  String recipientWallets(int count) {
    return 'Billeteras del Destinatario ($count)';
  }

  @override
  String get transfer => 'Transferir';

  @override
  String get pleaseSelectSourceWallet =>
      'Por favor seleccione una billetera de origen';

  @override
  String get createWalletAccountFirst =>
      'Por favor cree una cuenta de billetera primero';

  @override
  String get unableToVerifyAccount =>
      'No se puede verificar su cuenta. Por favor intente nuevamente.';

  @override
  String get unableToFindRecipientAccount =>
      'No se puede encontrar la cuenta del destinatario';

  @override
  String get transferFailed => 'Transferencia fallida';

  @override
  String get otherPartyNotLoggedIn =>
      'La otra parte ahora mismo no está conectada y por tanto ¡no puede recibir mensajes!';

  @override
  String get transferOnlyInDirectChats =>
      'Transfer is only available in direct chats';

  @override
  String get transferCompleted => 'Transferencia completada';

  @override
  String get transferProcessedSuccessfully =>
      'La transferencia se ha procesado exitosamente.';

  @override
  String get failedToSendTransferMessage =>
      'Error al enviar mensaje de transferencia';

  @override
  String get voiceCallStarted => 'Llamada de voz iniciada...';

  @override
  String get videoCallStarted => 'Videollamada iniciada...';

  @override
  String get callsOnlyInDirectChats =>
      'Las llamadas solo están disponibles en charlas directos.';

  @override
  String get noParticipantsForGroupCall =>
      'No hay participantes disponibles para la llamada grupal.';

  @override
  String get groupCallsInDevelopment =>
      'Las llamadas grupales están en desarrollo. Por favor, usa llamadas directas por ahora.';

  @override
  String get to => 'a';

  @override
  String get chain => 'Cadena';

  @override
  String get transactionId => 'ID de transacción';

  @override
  String get sendAsText => 'Enviar como texto';

  @override
  String get whyDoYouWantToReportThis => 'Por qué quieres denunciar esto?';

  @override
  String get reason => 'Razón';

  @override
  String get offensive => 'Ofensiva';

  @override
  String get confirmEventUnpin =>
      'Seguro que quiere desfijar permanentemente el evento?';

  @override
  String get noEmotesFound => 'Ningún emote encontrado. 😕';

  @override
  String get addNewEmote => 'Agregar Nuevo Emote';

  @override
  String get shortcode => 'Código corto';

  @override
  String get image => 'Imagen';

  @override
  String get addEmote => 'Agregar Emote';

  @override
  String get chooseImage => 'Elegir Imagen';

  @override
  String get imageSelected => 'Imagen Seleccionada';

  @override
  String get deleteEmote => 'Eliminar Emote';

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
  String get locationFound => 'Ubicación Encontrada';

  @override
  String get otherPartyCannotReceiveEncryptedMessages =>
      'La otra parte no puede recibir mensajes encriptados';

  @override
  String get accuracy => 'Precisión';

  @override
  String get offline => 'Desconectado';

  @override
  String get ok => 'Aceptar';

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
  String get pin => 'Fijar';

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
  String get pickFiles => 'Seleccionar archivos';

  @override
  String get allFiles => 'Todos los archivos';

  @override
  String get documents => 'Documentos';

  @override
  String get spreadsheets => 'Hojas de cálculo';

  @override
  String get pdf => 'PDF';

  @override
  String get twitterLoginComingSoon =>
      '¡El inicio de sesión con Twitter estará disponible pronto!';

  @override
  String get googleLoginComingSoon =>
      '¡El inicio de sesión con Google estará disponible pronto!';

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
  String get separateChatTypes => 'Separar charlas directos de grupos';

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
  String get statusExampleMessage => 'Cómo estás hoy?';

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
  String get notFound => 'No encontrado';

  @override
  String get pinLimitMessage => 'Solo puedes fijar hasta 3 chats';

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
  String get unreadChats => 'Chats no leídos';

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
  String get unableToPlayAudioMessage =>
      'No se puede reproducir el mensaje de audio';

  @override
  String get message => 'Mensaje';

  @override
  String get call => 'Llamar';

  @override
  String get save => 'Guardar';

  @override
  String get edited => 'editado';

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
  String get pinMessage => 'Fijar mensaje';

  @override
  String get shareItemsValidationError => 'Ruta de archivo inválida';

  @override
  String get voiceRecordingPermissionDenied =>
      'Permiso de grabación de voz denegado';

  @override
  String get noEventsSelected => 'No hay eventos seleccionados';

  @override
  String actionFailed(String action, String error) {
    return '$action falló: $error';
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
      'Por qué no se puede leer este mensaje?';

  @override
  String get noKeyForThisMessage =>
      'Esto puede ocurrir si el mensaje se envió antes de que entraras en tu cuenta en este dispositivo.\n\nTambién puede que el remitente haya bloqueado tu dispositivo o haya fallado algo en la conexión a Internet.\n\nPuedes leer el mensaje en otra sesión? Entonces, ¡puedes transferir el mensaje desde allí! Ve a Ajustes > Dispositivos y asegúrate de que tus dispositivos se han verificado mutuamente. Cuando abras la sala la próxima vez y ambas sesiones estén en primer plano, las claves se transmitirán automáticamente.\n\nNo quieres perder las claves al salir o al cambiar de dispositivo? Asegúrate de que has habilitado la copia de seguridad del chat en los ajustes.';

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
      'Los espacios permiten consolidar los charlas y montar comunidades privadas o públicas.';

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
  String get wrongPinEntered => 'PIN incorrecto';

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
      'Se expulsa al usuario del chat, pero no se le prohíbe volver a entrar. En charlas públicos, el usuario podrá volver a entrar en cualquier momento.';

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
    return 'Reenviar mensaje a $roomName?';
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
  String get youDeletedThisMessage => 'Eliminaste este mensaje';

  @override
  String get thisMessageWasDeleted => 'Este mensaje fue eliminado';

  @override
  String get refreshing => 'Actualizando...';

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
  String get whatIsAHomeserver => 'Qué es un homeserver?';

  @override
  String get homeserverDescription =>
      'Todos tus datos se guardan en el homeserver, como en un proveedor de correo electrónico. Puedes elegir el homeserver que quieres usar, a la par que te puedes comunicar con todos. Más en https://invitation.be-mindpower.net/.';

  @override
  String get doesNotSeemToBeAValidHomeserver =>
      'No parece ser un homeserver compatible. URL equivocada?';

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
      'Qué dispositivos deben ser de confianza para que puedan leer tus mensajes en chats cifrados?';

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
  String get financeNoCards => 'Sin Tarjetas';

  @override
  String get financeCreateCardToGetStarted =>
      'Crea una nueva tarjeta para comenzar';

  @override
  String get financeCreateNewCard => 'Crear Nueva Tarjeta';

  @override
  String get financeVirtualCard => 'Tarjeta Virtual';

  @override
  String get financeActivatingCard => 'Activando Tarjeta';

  @override
  String get financeAlmostReady => 'Ya casi está listo';

  @override
  String get financeCardActivationInProgress =>
      'Activación de tarjeta en progreso...';

  @override
  String get financeCardActivationUnderReview =>
      'La activación de la tarjeta está en revisión. Por favor espere.';

  @override
  String get financeCardVerificationFailed =>
      'Error en la verificación de la tarjeta. Por favor contacte a soporte.';

  @override
  String get financeCardCreationFailed =>
      'Error al crear la tarjeta. Por favor intente nuevamente.';

  @override
  String get financeCardActivationSuccess => '¡Tarjeta activada exitosamente!';

  @override
  String get financeCardActivationError =>
      'Error al activar la tarjeta. Por favor intente nuevamente.';

  @override
  String get financeCardActivationInfo =>
      'Your card is being activated. This may take a few moments. Please do not close the app.';

  @override
  String get financeCompleteIdentityVerification =>
      'Complete su verificación de identidad para crear y administrar tarjetas virtuales.';

  @override
  String get financeKYCVerificationRequired => 'Verificación KYC Requerida';

  @override
  String get financeStartKYCVerification => 'Start KYC Verification';

  @override
  String get financeKYCActivationInProgress =>
      'Activación de tarjeta en progreso...';

  @override
  String get financeKYCUnderReview =>
      'La activación de la tarjeta está en revisión. Por favor espere.';

  @override
  String get financeKYCVerificationFailed =>
      'Error en la verificación de la tarjeta. Por favor contacte a soporte.';

  @override
  String get financeKYCCardCreationFailed =>
      'Error al crear la tarjeta. Por favor intente nuevamente.';

  @override
  String get financeKYCFailedToActivate => 'Error al activar la tarjeta';

  @override
  String get financeKYCRejected => 'KYC Rechazado';

  @override
  String get financeKYCRejectedMessage =>
      'Su verificación de identidad ha sido rechazada. Por favor revise sus datos e intente nuevamente.';

  @override
  String get financeKYCCommonIssues => 'Problemas comunes:';

  @override
  String get financeKYCUnderReviewTitle => 'En Revisión';

  @override
  String get financeKYCUnderReviewMessage =>
      'Su solicitud KYC está siendo revisada. Esto normalmente toma de 1 a 3 días hábiles.';

  @override
  String get financeKYCPendingTitle => 'Verificación en Progreso';

  @override
  String get financeKYCPendingMessage =>
      'Estamos revisando sus documentos. Será notificado una vez que se complete la verificación.';

  @override
  String get financeKYCDocumentUploaded => 'Documento Cargado';

  @override
  String get financeKYCIdentityVerified => 'Identidad Verificada';

  @override
  String get financeKYCPersonalInfoVerified =>
      'Información Personal Verificada';

  @override
  String get financeKYCAddressVerified => 'Dirección Verificada';

  @override
  String get financeKYCStartVerification => 'Iniciar Verificación';

  @override
  String get financeKYCContinueVerification => 'Continuar Verificación';

  @override
  String get financeKYCCheckStatus => 'Verificar Estado';

  @override
  String get financeKYCTryAgain => 'Intentar Nuevamente';

  @override
  String get financeCardStatusActive => 'Activa';

  @override
  String get financeCardStatusInactive => 'Inactiva';

  @override
  String get financeCardStatusFrozen => 'Congelada';

  @override
  String get financeCardStatusUnderReview => 'En Revisión';

  @override
  String get financeCardStatusFailed => 'Error de Verificación';

  @override
  String get financeCardActivationTitle => 'Activando Tarjeta';

  @override
  String get financeCardAlmostReady => 'Ya casi está lista';

  @override
  String get financeCardActivationMessage =>
      'Su tarjeta se está activando. Esto puede tomar unos momentos. Por favor no cierre la aplicación.';

  @override
  String get financeCardActivationCancel => 'Cancelar';

  @override
  String get financeCardActivationActivate => 'Activar Ahora';

  @override
  String get financeCardUnderReview =>
      'La activación de la tarjeta está en revisión. Por favor espere.';

  @override
  String get financeUSD => 'USD';

  @override
  String get financeViewAll => 'Ver Todo';

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
  String get financeIndividual => 'Persona natural';

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
  String get financeChoose => 'Elige';

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
      'Necesitamos información tuya para configurar tu billetera';

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
  String get financeAccountBlocked => 'Account Blocked';

  @override
  String get financePINVerificationFailed => 'PIN Verification';

  @override
  String get financeOK => 'OK';

  @override
  String get financeTransferFailed => 'Transferencia fallida';

  @override
  String get financeDepositFailed => 'Depósito fallido';

  @override
  String get financeDepositSuccessful => 'Deposit successful';

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
  String get financeEnterCode => 'Ingrese Código';

  @override
  String get financeEnter4DigitCode =>
      'Ingrese su código de transacción de 4 dígitos para continuar';

  @override
  String get financeForgotPIN => 'Olvidó su PIN?';

  @override
  String get financeVerifyOTP => 'Verificar OTP';

  @override
  String get financeEnter6DigitCodeSent =>
      'Ingrese el código de 6 dígitos enviado a';

  @override
  String get financeVerify => 'Verificar';

  @override
  String get financeDidntReceiveCode => 'No recibió el código? ';

  @override
  String get financeResend => 'Reenviar';

  @override
  String financeResendIn(Object seconds) {
    return 'Reenviar en ${seconds}s';
  }

  @override
  String get financeOTPMust6Digits => 'El OTP debe tener 6 dígitos';

  @override
  String get financeWrongOTP =>
      'OTP incorrecto. Por favor ingrese el OTP correcto nuevamente.';

  @override
  String get financeInvalidOTPRestart =>
      'OTP inválido. Por favor inicie el registro nuevamente.';

  @override
  String get financeSendingOTP => 'Enviando OTP';

  @override
  String get financePleaseWaitSendingCode =>
      'Por favor espere mientras enviamos el código de verificación a su correo electrónico';

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
  String get financeHowMuch => 'Cuánto?';

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
  String get financeExternalAccountStepBank => 'Info\nbancaria';

  @override
  String get financeExternalAccountStepPersonal => 'Info\npersonal';

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
  String get financeExternalAccountGoBackTitle => 'Volver?';

  @override
  String get financeExternalAccountGoBackMessage =>
      'Está seguro de que desea volver? Toda la información ingresada se perderá.';

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
      'Comencemos una\n cuenta externa';

  @override
  String get financeExternalAccountSetupMessage =>
      'Necesitamos información de usted para configurar la cuenta externa';

  @override
  String get financeExternalAccountBankInfo => 'Info bancaria';

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
  String get financePayCryptoCardDetails => 'Detalles de la tarjeta';

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
  String get financePayCryptoBalanceOverview => 'Resumen de saldo';

  @override
  String get financePayCryptoCurrentBalance => 'Saldo actual';

  @override
  String get financePayCryptoAvailableBalance => 'Saldo disponible';

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
  String get financePayCryptoFreezeCard => 'Congelar tarjeta';

  @override
  String get financePayCryptoEnterReason => 'Ingresa el motivo para congelar';

  @override
  String get financePayCryptoConfirmFreeze =>
      '¿Estás seguro de que deseas congelar esta tarjeta?';

  @override
  String get financePayCryptoFreeze => 'Congelar';

  @override
  String get financePayCryptoUnfreeze => 'Descongelar';

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
  String get financePayCryptoDeposit => 'Depósito';

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
  String get financePayCryptoCopyNumber => 'Copiar número';

  @override
  String get financePayCryptoCopyAll => 'Copiar todo';

  @override
  String get financePayCryptoSecurityTips => 'Consejos de seguridad';

  @override
  String get financePayCryptoSecurityMessage =>
      'Do not share your PIN or card details.\nOnly shop on secure sites (https).\nEnable alerts and blocking from the app.\nCheck your transactions regularly.';

  @override
  String get financePayCryptoCardNumberCopied =>
      'Número de tarjeta copiado al portapapeles';

  @override
  String get financePayCryptoAllDetailsCopied =>
      'Todos los detalles de la tarjeta copiados al portapapeles';

  @override
  String get financePayCryptoSeeCardDetails => 'see your card details';

  @override
  String get financePayCryptoNoCards => 'Sin tarjetas';

  @override
  String get financePayCryptoCreateNewCard =>
      'Crea una nueva tarjeta para comenzar';

  @override
  String get financePayCryptoCreateANewCard => 'Crear una nueva tarjeta';

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
  String get financePayCryptoHistory => 'Historial';

  @override
  String get financePayCryptoTransferMoney => 'transfer money to any user';

  @override
  String get financePayCryptoNoHistoryYet => 'No History Yet';

  @override
  String get financePayCryptoTransactionsWillAppear =>
      'Your transactions will appear here';

  @override
  String get financePayCryptoKYCVerification => 'Verificación KYC';

  @override
  String get financeKYCSectionPersonalInfo => 'Información\nPersonal';

  @override
  String get financeKYCSectionAddress => 'Dirección';

  @override
  String get financeKYCSectionDocuments => 'Documentos';

  @override
  String get financeKYCSectionReview => 'Revisar y Enviar';

  @override
  String get financeKYCBtnPrevious => 'Anterior';

  @override
  String get financeKYCBtnNext => 'Siguiente';

  @override
  String get financeKYCBtnSubmit => 'Enviar KYC';

  @override
  String get financeKYCBtnCancel => 'Cancelar';

  @override
  String get financePayCryptoPersonalInfo => 'Información Personal';

  @override
  String get financePayCryptoAddress => 'Dirección';

  @override
  String get financePayCryptoDocument => 'Documento';

  @override
  String get financePayCryptoReview => 'Revisión';

  @override
  String get financePayCryptoFirstName => 'Nombre';

  @override
  String get financePayCryptoLastName => 'Apellido';

  @override
  String get financePayCryptoFirstNameRequired => 'Por favor ingrese su nombre';

  @override
  String get financePayCryptoFirstNameMinLength =>
      'El nombre debe tener al menos 3 caracteres';

  @override
  String get financePayCryptoLastNameRequired =>
      'Por favor ingrese su apellido';

  @override
  String get financePayCryptoLastNameMinLength =>
      'El apellido debe tener al menos 3 caracteres';

  @override
  String get financePayCryptoZipMinLength =>
      'El código postal debe tener al menos 4 caracteres';

  @override
  String get financePayCryptoFixFollowingIssues =>
      'Please fix the following issues';

  @override
  String get financePayCryptoPleaseEnterFirstName =>
      'Por favor ingrese su nombre';

  @override
  String get financePayCryptoPleaseEnterLastName =>
      'Por favor ingrese su apellido';

  @override
  String get financePayCryptoPleaseEnterEmail =>
      'Por favor ingrese su correo electrónico';

  @override
  String get financePayCryptoPleaseEnterValidEmail =>
      'Por favor ingrese un correo electrónico válido';

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
  String get financePayCryptoEmail => 'Correo Electrónico';

  @override
  String get financePayCryptoEmailRequired =>
      'Por favor ingrese su correo electrónico';

  @override
  String get financePayCryptoEmailInvalid =>
      'Por favor ingrese un correo electrónico válido';

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
  String get financePayCryptoCountryRequired => 'El país es requerido';

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
  String get financePayCryptoCountryCode => 'Código de País';

  @override
  String get financePayCryptoPhoneNumber => 'Número de Teléfono';

  @override
  String get financePayCryptoPhoneRequired =>
      'Por favor ingrese su número de teléfono';

  @override
  String get financePayCryptoPhoneMinLength =>
      'El número de teléfono debe tener al menos 5 dígitos';

  @override
  String get financePayCryptoGender => 'Género';

  @override
  String get financePayCryptoMale => 'Masculino';

  @override
  String get financePayCryptoFemale => 'Femenino';

  @override
  String get financePayCryptoDateOfBirth => 'Fecha de Nacimiento';

  @override
  String get financePayCryptoDobRequired =>
      'La fecha de nacimiento es requerida';

  @override
  String get financePayCryptoAddressRequired => 'La dirección es requerida';

  @override
  String get financePayCryptoAddressMinLength =>
      'La dirección debe tener al menos 5 caracteres';

  @override
  String get financePayCryptoCity => 'Ciudad';

  @override
  String get financePayCryptoCityRequired => 'La ciudad es requerida';

  @override
  String get financePayCryptoCountry => 'País';

  @override
  String get financePayCryptoState => 'State/Province';

  @override
  String get financePayCryptoStateRequired =>
      'El estado/provincia es requerido';

  @override
  String get financePayCryptoStateProvince => 'Estado/Provincia';

  @override
  String get financePayCryptoSelectCountryFirst => 'Seleccione un país primero';

  @override
  String get financePayCryptoZipCode => 'Código Postal';

  @override
  String get financePayCryptoZipRequired => 'El código postal es requerido';

  @override
  String get financePayCryptoDocumentType => 'Tipo de Documento';

  @override
  String get financePayCryptoPassport => 'Pasaporte';

  @override
  String get financePayCryptoIdCard => 'Cédula de Identidad';

  @override
  String get financePayCryptoDriversLicense => 'Licencia de Conducir';

  @override
  String get financePayCryptoDocumentNumber => 'Número de Documento';

  @override
  String get financePayCryptoDocumentNumberRequired =>
      'Por favor ingrese el número de documento';

  @override
  String get financePayCryptoFrontDocument => 'Frente del Documento';

  @override
  String get financePayCryptoBackDocument => 'Reverso del Documento';

  @override
  String get financePayCryptoSelfieWithDocument => 'Selfie con Documento';

  @override
  String get financePayCryptoUploadPhoto => 'Subir Foto';

  @override
  String get financePayCryptoTakePhoto => 'Tomar Foto';

  @override
  String get financePayCryptoChooseFromGallery => 'Elegir de la Galería';

  @override
  String get financePayCryptoCancel => 'Cancelar';

  @override
  String get financePayCryptoNext => 'Siguiente';

  @override
  String get financePayCryptoPrevious => 'Anterior';

  @override
  String get financePayCryptoSubmit => 'Enviar';

  @override
  String get financePayCryptoReviewYourInfo => 'Revise su Información';

  @override
  String get financePayCryptoPleaseReview =>
      'Por favor revise su información antes de enviar.';

  @override
  String financePayCryptoDocumentRequired(Object documentType) {
    return '$documentType es requerido';
  }

  @override
  String get financePayCryptoKYCSubmitConfirmTitle => 'Enviar Información KYC';

  @override
  String get financePayCryptoKYCSubmitConfirmMessage =>
      'Está seguro de que desea enviar su información KYC? No podrá realizar cambios después del envío.';

  @override
  String get financePayCryptoKYCSubmitSuccess =>
      '¡Información KYC enviada exitosamente!';

  @override
  String get financePayCryptoKYCSubmitError =>
      'Error al enviar la información KYC. Por favor intente nuevamente.';

  @override
  String get financePayCryptoKYCProcessing =>
      'Procesando su información KYC. Esto puede tomar unos minutos...';

  @override
  String get financePayCryptoKYCUnderReviewTitle => 'En Revisión';

  @override
  String get financePayCryptoKYCUnderReviewMessage =>
      'Su información KYC está siendo revisada. Le notificaremos una vez que sea aprobada.';

  @override
  String get financePayCryptoKYCAwaitingApproval => 'Esperando Aprobación';

  @override
  String get financePayCryptoKYCDocumentsReceived => 'Documentos Recibidos';

  @override
  String get financePayCryptoKYCDocumentsUnderReview =>
      'Documentos en Revisión';

  @override
  String get financePayCryptoKYCApprovalPending => 'Aprobación Pendiente';

  @override
  String get financePayCryptoKYCCheckStatus => 'Verificar Estado';

  @override
  String get financePayCryptoKYCBackToHome => 'Volver al Inicio';

  @override
  String get financeKYCFirstName => 'Nombre';

  @override
  String get financeKYCLastName => 'Apellido';

  @override
  String get financeKYCEmail => 'Correo Electrónico';

  @override
  String get financeKYCCountryCode => 'Código de País';

  @override
  String get financeKYCPhoneNumber => 'Número de Teléfono';

  @override
  String get financeKYCGender => 'Género';

  @override
  String get financeKYCMale => 'Masculino';

  @override
  String get financeKYCFemale => 'Femenino';

  @override
  String get financeKYCDateOfBirth => 'Fecha de Nacimiento';

  @override
  String get financeKYCAddress => 'Dirección';

  @override
  String get financeKYCCity => 'Ciudad';

  @override
  String get financeKYCState => 'Estado/Provincia';

  @override
  String get financeKYCZipCode => 'Código Postal';

  @override
  String get financeKYCSelectCountryFirst => 'Seleccione un país primero';

  @override
  String get financePayCryptoPleaseEnterCountryCode =>
      'Por favor ingrese el código de país';

  @override
  String get financePayCryptoPleaseEnterPhoneNumber =>
      'Por favor ingrese su número de teléfono';

  @override
  String get financePayCryptoKYCUnderReview => 'KYC en Revisión';

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
  String get financePayCryptoDefaultCard => 'Tarjeta predeterminada';

  @override
  String get financePayCryptoUseAsDefault =>
      'Usar esta tarjeta como predeterminada';

  @override
  String get financePayCryptoContactlessPayment => 'Pago sin contacto';

  @override
  String get financePayCryptoEnableContactless =>
      'Habilitar pagos sin contacto';

  @override
  String get financePayCryptoPINCode => 'Código PIN';

  @override
  String get financePayCryptoAskPINWhenPaying =>
      'Solicitar código PIN al pagar';

  @override
  String get financePayCryptoSpending => 'Gasto';

  @override
  String get financePayCryptoTransactionHistory => 'Transacción';

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
      'Necesitamos información tuya\npara configurar la cuenta externa';

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
  String get financeTransferDetails => 'Detalles de la transferencia';

  @override
  String get financeVirtualAccount => 'Cuenta Virtual';

  @override
  String get financeDepositReceived => 'Depósito Recibido';

  @override
  String get financeBankInformation => 'Info bancaria';

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
  String get financeOTPExpired =>
      'El OTP ha expirado. Por favor solicite un nuevo OTP.';

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
  String get sunday => 'Do';

  @override
  String get monday => 'Lu';

  @override
  String get tuesday => 'Ma';

  @override
  String get wednesday => 'Mi';

  @override
  String get thursday => 'Ju';

  @override
  String get friday => 'Vi';

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
  String get financeUnknownError => 'Ocurrió un error desconocido';

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
  String get youAreConnected => '¡Estás conectado!';

  @override
  String youCanNowTalkTo(String contactName) {
    return 'Ahora puedes hablar con @$contactName';
  }

  @override
  String get goChat => 'ir al chat';

  @override
  String get verifyingOtherAccount => 'Verificando la \n otra cuenta';

  @override
  String waitingForContactToAccept(String contactName) {
    return 'Esperando a que $contactName \n acepte la invitación.';
  }

  @override
  String get creatingGroup => 'Creando grupo';

  @override
  String settingUpYourGroup(String groupName) {
    return 'Configurando tu grupo $groupName';
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
  String get noInternetConnection => '¡Sin conexión a internet!';

  @override
  String get pleaseCheckYourInternetConnection =>
      'Por favor verifica tu conexión\na internet';

  @override
  String get enableWiFi => 'Activar WiFi';

  @override
  String get testingExternalAccountCreationAPI =>
      'Probando API de Creación de Cuenta Externa';

  @override
  String get payload => 'Carga útil';

  @override
  String get responseStatus => 'Estado de Respuesta';

  @override
  String get responseHeaders => 'Encabezados de Respuesta';

  @override
  String get responseBody => 'Cuerpo de Respuesta';

  @override
  String get successExternalAccountCreated =>
      '¡Éxito! Cuenta externa creada exitosamente';

  @override
  String get responseStructure => 'Estructura de respuesta';

  @override
  String get errorDetails => 'Detalles del error';

  @override
  String get rawError => 'Error sin procesar';

  @override
  String get exception => 'Excepción';

  @override
  String get testingCustomerVerificationStatus =>
      'Probando Estado de Verificación del Cliente';

  @override
  String get customerID => 'ID del Cliente';

  @override
  String get customerFound => 'Cliente encontrado';

  @override
  String get hasAcceptedTerms => 'Ha aceptado términos';

  @override
  String get rejectionReasons => 'Razones de rechazo';

  @override
  String get requirementsDue => 'Requisitos pendientes';

  @override
  String get canCreateExternalAccounts => 'Puede crear cuentas externas';

  @override
  String get issuesPreventingExternalAccountCreation =>
      'Problemas que impiden la creación de cuenta externa:';

  @override
  String get termsOfServiceNotAccepted => 'Términos de servicio no aceptados';

  @override
  String get accountHasRejectionReasons => 'La cuenta tiene razones de rechazo';

  @override
  String get authFixCheckingClient => 'AuthFix: Verificando cliente';

  @override
  String get isLogged => 'está conectado';

  @override
  String get userID => 'ID de usuario';

  @override
  String get authFixStoredMatrixId => 'AuthFix: matrix_id almacenado';

  @override
  String get authFixFixingMatrixId => 'AuthFix: Corrigiendo matrix_id desde';

  @override
  String get authFixGeneratingTokens =>
      'AuthFix: Generando tokens para usuario';

  @override
  String get authFixJwtTokenGenerated =>
      'AuthFix: Token JWT generado y almacenado';

  @override
  String get authFixCsrfTokenGenerated =>
      'AuthFix: Token CSRF generado y actualización inicializada';

  @override
  String get authFixCsrfTokenFailed =>
      'AuthFix: Generación de token CSRF falló';

  @override
  String get authFixJwtTokenFailed => 'AuthFix: Generación de token JWT falló';

  @override
  String get authFixMatrixIdCorrect =>
      'AuthFix: Matrix ID ya es correcto, no se necesita corrección';

  @override
  String get authFixClientNotLoggedIn =>
      'AuthFix: Cliente no conectado o sin userID';

  @override
  String get authFixException => 'AuthFix: Excepción';

  @override
  String get autoEncryptionSetupFailed =>
      'Configuración automática de encriptación falló';

  @override
  String get autoDeviceVerificationFailed =>
      'Verificación automática de dispositivo falló';

  @override
  String get autoRoomEncryptionFailed =>
      'Encriptación automática de sala falló';

  @override
  String get messageSentToRoom => 'Mensaje enviado a la sala';

  @override
  String get roomNotFound => 'Sala no encontrada';

  @override
  String get errorSendingMessage => 'Error al enviar mensaje';

  @override
  String get messageSentToRoomAlias => 'Mensaje enviado al alias de sala';

  @override
  String get errorSendingMessageToAlias => 'Error al enviar mensaje al alias';

  @override
  String get directMessageSentTo => 'Mensaje directo enviado a';

  @override
  String get errorSendingDirectMessage => 'Error al enviar mensaje directo';

  @override
  String get passwordMinLength =>
      'La contraseña debe tener al menos 6 caracteres';

  @override
  String get contactSearch => 'Búsqueda de Contactos';

  @override
  String get noChatsFound => 'No se encontraron charlas';

  @override
  String get emoji => 'Emojis';

  @override
  String get contactsAccessRequired => 'Se Requiere Acceso a Contactos';

  @override
  String get myCard => 'Mi Tarjeta';

  @override
  String get favoriteMessage => 'Mensaje favorito';

  @override
  String get messageContentUnavailable => 'Contenido del mensaje no disponible';

  @override
  String get storageAccessRequired => 'Se Requiere Acceso al Almacenamiento';

  @override
  String get searchFiles => 'Buscar archivos';

  @override
  String get noFilesFound => 'No se encontraron archivos';

  @override
  String get refresh => 'Actualizar';

  @override
  String sendPhotos(int count, String plural) {
    return 'Enviar $count Foto$plural';
  }

  @override
  String get locationAccessRequired => 'Se Requiere Acceso a la Ubicación';

  @override
  String get failedToGetLocation => 'Error al obtener la ubicación';

  @override
  String get tapToGetCurrentLocation => 'Toca para obtener la ubicación actual';

  @override
  String get getLocation => 'Obtener Ubicación';

  @override
  String get currentLocation => 'Ubicación Actual';

  @override
  String get sendCurrentLocation => 'Enviar Ubicación Actual';

  @override
  String get chooseOnMap => 'Elegir en el Mapa';

  @override
  String get refreshLocation => 'Actualizar Ubicación';

  @override
  String get debug => 'Depurar';

  @override
  String get weak => 'Débil';

  @override
  String get medium => 'Media';

  @override
  String get good => 'Buena';

  @override
  String get strong => 'Fuerte';

  @override
  String get confirmGoBack => 'Confirmar';

  @override
  String get goBackProgressLost =>
      'Estás seguro de que quieres volver? Tu progreso se perderá.';

  @override
  String get createAccount => 'Crear Cuenta';

  @override
  String get verifyPhone => 'Verifiquemos tu número de teléfono.';

  @override
  String get isItCorrectOrModify => '¿Es correcto o deseas modificarlo?';

  @override
  String get waitingToDetectSms =>
      'Esperando para detectar automáticamente el SMS enviado a';

  @override
  String get verificationCode => 'Código de verificación';

  @override
  String get resendCode => 'Reenviar código';

  @override
  String get sendAgain => 'Enviar de nuevo';

  @override
  String get fullName => 'Nombre completo';

  @override
  String get exampleEmail => 'ejemplo@correo.com';

  @override
  String get continueButton => 'Continuar';

  @override
  String get atLeast6Characters => 'al menos 6 caracteres';

  @override
  String get backToLogin => 'Volver al Inicio de Sesión';

  @override
  String get usernameOrEmailRequired => 'Usuario o correo es requerido';

  @override
  String get invalidEmailOrPassword => 'Correo o contraseña inválidos';

  @override
  String get invalidUsernameOrPassword => 'Usuario o contraseña inválidos';

  @override
  String get emailNotFoundSignUp =>
      'Correo no encontrado. Por favor verifica tu correo o regístrate primero.';

  @override
  String get tooManyLoginAttempts =>
      'Demasiados intentos de inicio de sesión. Por favor intenta más tarde.';

  @override
  String get serverErrorTryAgain =>
      'Error del servidor. Por favor intenta más tarde.';

  @override
  String loginFailed(Object loginError) {
    return 'Inicio de sesión fallido: $loginError';
  }

  @override
  String get serverConfigError =>
      'Error de configuración del servidor. Por favor contacta soporte.';

  @override
  String get serverError =>
      'Error del servidor. El servicio de correo puede no estar configurado.';

  @override
  String get requestTimeout =>
      'Tiempo de espera agotado. Por favor intenta de nuevo.';

  @override
  String get emailServiceNotAvailable =>
      'Servicio de correo no disponible. Por favor contacta soporte.';

  @override
  String get serverErrorTryLater =>
      'Error del servidor. Por favor intenta más tarde.';

  @override
  String get passwordIsRequired => 'La contraseña es requerida';

  @override
  String get confirmPasswordRequired => 'Confirmar contraseña es requerido';

  @override
  String get emailNotVerified =>
      'Aún no has verificado tu correo.\\nPor favor revisa tu correo y haz clic en el enlace de verificación primero.';

  @override
  String weSentResetLink(String email) {
    return 'Enviamos un enlace de restablecimiento a $email';
  }

  @override
  String get verificationWarning =>
      'Aún no verificado. Por favor haz clic en el enlace de verificación en tu correo, luego ingresa tu nueva contraseña abajo.';

  @override
  String get enterNewPassword => 'Ingresa nueva contraseña';

  @override
  String get confirmNewPassword => 'Confirma nueva contraseña';

  @override
  String get connectionError =>
      'Error de conexión. Por favor verifica tu conexión a internet.';

  @override
  String get enterEmail => 'Ingresa correo';

  @override
  String get enterEmailOrUsername => 'Ingresa correo o nombre de usuario';

  @override
  String get forgotYourPassword => 'Olvidaste tu Contraseña?';

  @override
  String get orLoginWith => 'o Inicia sesión con';

  @override
  String get doYouHaveAccount => 'Tienes una cuenta?';

  @override
  String get usernameMinLength =>
      'El nombre de usuario debe tener al menos 3 caracteres';

  @override
  String get usernameMaxLength =>
      'El nombre de usuario debe tener 20 caracteres o menos';

  @override
  String get usernameInvalidFormat =>
      'El nombre de usuario solo puede contener letras minúsculas, números, guión bajo (_) y punto (.)';

  @override
  String get usernameCannotStartWith =>
      'El nombre de usuario no puede comenzar con guión bajo (_) o punto (.)';

  @override
  String get usernameCannotEndWith =>
      'El nombre de usuario no puede terminar con guión bajo (_) o punto (.)';

  @override
  String get usernameConsecutiveChars =>
      'El nombre de usuario no puede tener caracteres especiales consecutivos';

  @override
  String get usernameMustContainLetter =>
      'El nombre de usuario debe contener al menos una letra';

  @override
  String get fullNameIsRequired => 'El nombre completo es obligatorio';

  @override
  String get usernameAlreadyTaken => 'Nombre de Usuario Ya Tomado';

  @override
  String get usernameAlreadyInUse =>
      'Este nombre de usuario ya está en uso. Por favor elige un nombre de usuario diferente.';

  @override
  String get emailAlreadyInUse => 'Este correo ya está en uso.';

  @override
  String get langEnglish => 'Inglés';

  @override
  String get langSpanish => 'Español';

  @override
  String get countrySpain => 'España';

  @override
  String get countryUS => 'NOSOTROS';

  @override
  String get countryUnitedStates => 'Estados Unidos';

  @override
  String get countryFrance => 'Francia';

  @override
  String get countryGermany => 'Alemania';

  @override
  String get countryItaly => 'Italia';

  @override
  String get countryAustralia => 'Australia';

  @override
  String get countryBrazil => 'Brasil';

  @override
  String get enterText => 'Ingresar texto';

  @override
  String get recordingFailed => '¡La grabación falló!';

  @override
  String get rememberMe => 'Recuérdame';

  @override
  String get otpVerificationFailed => 'Falló la verificación de OTP';

  @override
  String get customerNotFound => 'Cliente no encontrado';

  @override
  String get failedToGetCustomerStatus =>
      'Error al obtener el estado del cliente';

  @override
  String get failedToGetCustomerStatusAfterCsrfRefresh =>
      'Error al obtener el estado del cliente después de actualizar CSRF';

  @override
  String get failedToUpdateCustomer => 'Error al actualizar el cliente';

  @override
  String get failedToCreateKycLink => 'Error al crear el enlace KYC';

  @override
  String get failedToGetKycStatus => 'Error al obtener el estado KYC';

  @override
  String get usernameCheckFailed =>
      'Falló la verificación del nombre de usuario';

  @override
  String get failedToRegisterCustomerAfterRetries =>
      'Error al registrar el cliente después de todos los intentos de reintento';

  @override
  String get failedToVerifyOtpAfterRetries =>
      'Error al verificar OTP después de todos los intentos de reintento';

  @override
  String get fullNameRequired => 'El nombre completo es requerido';

  @override
  String get usernameRequired => 'El nombre de usuario es requerido';

  @override
  String get usernameCannotContainSpaces =>
      'El nombre de usuario no puede contener espacios';

  @override
  String get apiErrorTitle => 'Error';

  @override
  String get apiErrorDefaultMessage => 'Ocurrió un error';

  @override
  String get apiErrorInvalidField => 'Campo inválido';

  @override
  String get financeKYCAgeRestrictionError =>
      'Debes tener al menos 18 años para registrarte';

  @override
  String get financeKYCDocumentUpload => 'Subir imagen';

  @override
  String get financeKYCPreviousButton => 'Anterior';

  @override
  String get financeKYCCancelButton => 'Cancelar';

  @override
  String get financeKYCNextButton => 'Siguiente';

  @override
  String get financeKYCSubmitButton => 'Enviar KYC';

  @override
  String get financeKYCPersonalInfoStep => 'Información Personal';

  @override
  String get financeKYCAddressStep => 'Dirección';

  @override
  String get financeKYCDocumentStep => 'Documento';

  @override
  String get financeKYCReviewStep => 'Revisar';

  @override
  String get financeKYCFrontDocument => 'Frente del Documento';

  @override
  String get financeKYCBackDocument => 'Reverso del Documento';

  @override
  String get financeKYCSelfieWithDocument => 'Selfie con Documento';

  @override
  String get financeKYCErrorTitle => 'Error';

  @override
  String get financeKYCProcessingMessage =>
      'Tu solicitud de KYC está siendo procesada. Te notificaremos una vez que esté completa.';

  @override
  String get financeKYCDocumentsReceived => 'Documentos Recibidos';

  @override
  String get financeKYCUnderReviewStatus => 'En Revisión';

  @override
  String get financeKYCApprovalPending => 'Aprobación Pendiente';

  @override
  String get createStory => 'Crear Historia';

  @override
  String get text => 'Texto';

  @override
  String get photo => 'Foto';

  @override
  String get video => 'Video';

  @override
  String get typeYourStory => 'Escribe tu historia...';

  @override
  String get videoSelected => 'Video Seleccionado';

  @override
  String get tapToSelectPhoto => 'Toca para seleccionar foto';

  @override
  String get tapToSelectVideo => 'Toca para seleccionar video';

  @override
  String get storyCreatedSuccessfully => '¡Historia creada exitosamente!';

  @override
  String get pleaseEnterSomeText => 'Por favor ingrese algún texto';

  @override
  String get pleaseSelectAPhoto => 'Por favor seleccione una foto';

  @override
  String get pleaseSelectAVideo => 'Por favor seleccione un video';

  @override
  String errorPickingMedia(String error) {
    return 'Error al seleccionar medio: $error';
  }

  @override
  String errorCreatingStory(String error) {
    return 'Error al crear historia: $error';
  }

  @override
  String get storyViews => 'Vistas de Historia';

  @override
  String views(int count) {
    return '$count vistas';
  }

  @override
  String get noViewsYet => 'Aún no hay vistas';

  @override
  String get videoStory => 'Historia de Video';

  @override
  String get justNow => 'Justo ahora';

  @override
  String minutesAgo(int minutes) {
    return 'hace ${minutes}m';
  }

  @override
  String hoursAgo(int hours) {
    return 'hace ${hours}h';
  }

  @override
  String get couldNotOpenFile => 'No se pudo abrir el archivo';

  @override
  String get noStoriesAvailable => 'No hay historias disponibles';

  @override
  String get mediaUploadIssue => 'Problema de Carga de Medios';

  @override
  String get checkSynapseMediaConfiguration =>
      'Verificar configuración de medios de Synapse';

  @override
  String get replyToStory => 'Responder a la historia...';

  @override
  String get view => 'Ver';

  @override
  String get mapUnavailable => 'Mapa no disponible';

  @override
  String get locationPreview => 'Vista previa de la ubicación';

  @override
  String get selectFilesUsingButtonsAbove =>
      'Selecciona archivos usando los botones de arriba';

  @override
  String viewedBy(int count) {
    return 'Visto por $count';
  }

  @override
  String get replySent => '¡Respuesta enviada!';

  @override
  String get deleteStory => 'Eliminar Historia';

  @override
  String get areYouSureDeleteStory =>
      'Estás seguro de que quieres eliminar esta historia?';

  @override
  String get noBlockedUsers => 'No hay usuarios bloqueados';

  @override
  String get incomingCall => 'Llamada entrante';

  @override
  String get profileSettings => 'Configuración de Perfil';

  @override
  String get flightMode => 'Modo Avión';

  @override
  String get manageYourFlightMode => 'Administrar tu modo avión';

  @override
  String get passwordAndSecurity => 'Contraseña y Seguridad';

  @override
  String get twoFactorAuthentication => 'Autenticación de dos factores';

  @override
  String get enableTwoFactorAuthentication =>
      'Habilitar autenticación de dos factores';

  @override
  String get viewActiveSessions => 'Ver sesiones activas';

  @override
  String get signingIn => 'Iniciando sesión';

  @override
  String get usernameInvalidCharacters =>
      'El nombre de usuario solo puede contener letras, números, puntos, guiones bajos y guiones';

  @override
  String get emailRequired => 'El correo electrónico es requerido';

  @override
  String get pleaseEnterValidEmail => 'Por favor ingresa un correo válido';

  @override
  String get passwordRequired => 'La contraseña es requerida';

  @override
  String get passwordMustContainUppercase =>
      'La contraseña debe contener al menos 1 letra mayúscula (A-Z)';

  @override
  String get passwordMustContainLowercase =>
      'La contraseña debe contener al menos 1 letra minúscula (a-z)';

  @override
  String get passwordMustContainNumber =>
      'La contraseña debe contener al menos 1 número (0-9)';

  @override
  String get passwordMustContainSpecialChar =>
      'La contraseña debe contener al menos 1 carácter especial (!@#\$%^&*?)';

  @override
  String get passwordCannotContainUsername =>
      'La contraseña no puede contener tu nombre de usuario';

  @override
  String get passwordCannotContainCommonWords =>
      'La contraseña no puede contener palabras comunes';

  @override
  String get passwordCannotContainSequences =>
      'La contraseña no puede contener secuencias simples';

  @override
  String get noPendingVerification =>
      'No se encontró verificación pendiente. Por favor inicia el proceso de registro nuevamente.';

  @override
  String get emailVerificationRequiredMessage =>
      'Verificación de correo requerida. Por favor revisa tu correo y haz clic en el enlace de verificación. Asegúrate de hacer clic en el enlace del correo antes de intentar completar el registro.';

  @override
  String get failedToStartEmailVerification =>
      'Fallo al iniciar la verificación de correo';

  @override
  String get personalAccount => 'Cuenta Personal';

  @override
  String get provideIdentificationDetails =>
      'Por favor proporciona tus detalles de identificación en el espacio a continuación.';

  @override
  String get processingData => 'Procesando Datos';

  @override
  String get firstName => 'Nombre';

  @override
  String get pleaseEnterFirstName => 'Por favor ingresa tu nombre';

  @override
  String get middleNameOptional => 'Segundo Nombre (opcional)';

  @override
  String get lastName => 'Apellido';

  @override
  String get pleaseEnterLastName => 'Por favor ingresa tu apellido';

  @override
  String get idOrPassportType => 'Tipo de ID o Pasaporte';

  @override
  String get pleaseSelectDocumentType =>
      'Por favor selecciona un tipo de documento';

  @override
  String get dni => 'DNI';

  @override
  String get passport => 'Pasaporte';

  @override
  String get driverLicense => 'Licencia de Conducir';

  @override
  String get otherId => 'Otro ID';

  @override
  String get documentNumber => 'Número de Documento';

  @override
  String get pleaseEnterDocumentNumber =>
      'Por favor ingresa tu número de documento';

  @override
  String get resetPassword => 'Restablecer Contraseña';

  @override
  String get checkYourEmail => 'Revisa Tu Correo';

  @override
  String get enterYourEmail => 'Ingresa tu correo electrónico';

  @override
  String get emailIsRequired => 'El correo electrónico es obligatorio';

  @override
  String get sendResetLink => 'Enviar Enlace de Restablecimiento';

  @override
  String get failedToSendResetEmail =>
      'Error al enviar correo de restablecimiento';

  @override
  String get emailNotFound =>
      'Correo no encontrado. Por favor verifica tu correo o regístrate primero.';

  @override
  String get myStory => 'Mi Historia';

  @override
  String get today => 'Hoy';

  @override
  String get yesterday => 'Ayer';

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
  String get financeKycNotStarted => 'KYC No Iniciado';

  @override
  String get financeKycIncomplete => 'KYC Incompleto';

  @override
  String get financeKycQuestionnaireRequired => 'Cuestionario Requerido';

  @override
  String get financeKycUboDetailsRequired => 'Detalles UBO Requeridos';

  @override
  String get financeKycUnderReview => 'En Revisión';

  @override
  String get financeKycApproved => 'KYC Aprobado';

  @override
  String get financeKycRejected => 'KYC Rechazado';

  @override
  String get financeKycAccountPaused => 'Cuenta Pausada';

  @override
  String get financeKycAccountClosed => 'Cuenta Cerrada';

  @override
  String get financeKycStatusUnknown => 'Estado Desconocido';

  @override
  String get financeKycNotStartedDesc =>
      'La verificación de identidad aún no ha comenzado';

  @override
  String get financeKycIncompleteDesc =>
      'Por favor completa todos los pasos de verificación requeridos';

  @override
  String get financeKycQuestionnaireRequiredDesc =>
      'Se debe completar un cuestionario adicional';

  @override
  String get financeKycUboDetailsRequiredDesc =>
      'Se requieren detalles del Beneficiario Final Último';

  @override
  String get financeKycUnderReviewDesc =>
      'Tu verificación está siendo revisada actualmente';

  @override
  String get financeKycApprovedDesc =>
      'Tu identidad ha sido verificada exitosamente';

  @override
  String get financeKycRejectedDesc =>
      'La verificación fue rechazada. Por favor revisa y vuelve a enviar';

  @override
  String get financeKycAccountPausedDesc =>
      'Tu cuenta ha sido pausada temporalmente';

  @override
  String get financeKycAccountClosedDesc => 'Tu cuenta ha sido cerrada';

  @override
  String get financeKycUnknownStatusDesc =>
      'No se puede determinar el estado de verificación';

  @override
  String get financeKycStartVerification => 'Iniciar Verificación';

  @override
  String get financeKycCompleteVerification => 'Completar Verificación';

  @override
  String get financeKycCompleteQuestionnaire => 'Completar Cuestionario';

  @override
  String get financeKycProvideUboDetails => 'Proporcionar Detalles UBO';

  @override
  String get financeKycRetryVerification => 'Reintentar Verificación';

  @override
  String get financeKycContinueVerification => 'Continuar Verificación';

  @override
  String get financeKycLoadingStatus => 'Cargando Estado...';

  @override
  String get financeKycOpenLink => 'Abrir Enlace';

  @override
  String get financeKycViewTerms => 'Ver Términos';

  @override
  String get financeKycRefreshStatus => 'Actualizar Estado';

  @override
  String get financeKycCannotOpenLink => 'No Se Puede Abrir Enlace';

  @override
  String get financeKycFailedToOpenLink =>
      'Error al abrir enlace de verificación';

  @override
  String get financeKycTosAcceptedSuccess =>
      'Términos de servicio aceptados exitosamente';

  @override
  String get customerKycLoadingUserInfo =>
      'Cargando información del usuario...';

  @override
  String get customerKycCreateCustomerAccount => 'Crear Cuenta de Cliente';

  @override
  String get customerKycCompleteKycSubtitle =>
      'Completa la verificación KYC para acceder a servicios financieros';

  @override
  String get customerKycCustomerType => 'Tipo de Cliente';

  @override
  String get customerKycIndividual => 'Individual';

  @override
  String get customerKycCompany => 'Empresa';

  @override
  String get customerKycFullName => 'Nombre Completo';

  @override
  String get customerKycEmail => 'Correo Electrónico';

  @override
  String get customerKycGenerateKycLink => 'Generar Enlace KYC';

  @override
  String get customerKycNameRequired => 'El nombre es requerido';

  @override
  String get customerKycEmailRequired => 'El correo electrónico es requerido';

  @override
  String get customerKycInvalidEmailFormat =>
      'Formato de correo electrónico inválido';

  @override
  String get customerKycSelectEndorsement =>
      'Por favor selecciona al menos un respaldo';

  @override
  String get customerKycSelectPaymentService =>
      'Por favor selecciona al menos un servicio de pago';

  @override
  String get customerKycUsernameNotFound =>
      'Nombre de usuario no encontrado. Por favor inicia sesión nuevamente.';

  @override
  String get customerKycFailedSendOtp => 'Error al enviar OTP';

  @override
  String get customerKycVerificationFailed => 'Verificación fallida';

  @override
  String get customerKycFailedCreateLink => 'Error al crear enlace KYC';

  @override
  String get customerKycCustomerIdNotFound =>
      'ID de cliente no encontrado en la respuesta';

  @override
  String get customerKycLinkAlreadyExists =>
      'Ya existe un enlace KYC para este correo electrónico';

  @override
  String get customerKycCannotOpenLink => 'No se puede abrir este enlace';

  @override
  String get customerKycFailedOpenLink => 'Error al abrir enlace';

  @override
  String get customerKycLinkGeneratedSuccess =>
      'Enlace KYC generado exitosamente';

  @override
  String get customerKycVerification => 'Verificación KYC';

  @override
  String get customerKycOpenKycLink => 'Abrir Enlace KYC';

  @override
  String get customerKycViewTermsOfService => 'Ver Términos de Servicio';

  @override
  String get customerKycCreateAccount => 'Crear Cuenta';

  @override
  String get customerKycPaymentServices => 'Servicios de Pago';

  @override
  String get customerKycPaymentServicesSubtitle =>
      'Selecciona los métodos de pago y monedas que deseas usar. Puedes elegir múltiples opciones.';

  @override
  String get customerKycAllServices => 'Todos los Servicios';

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
      'Admite pagos en USD mediante transferencias ACH o Wire para transacciones en dólares estadounidenses.';

  @override
  String get customerKycEurTooltip =>
      'Proporciona pagos en EUR a través de SEPA para transacciones europeas.';

  @override
  String get customerKycMxnTooltip =>
      'Habilita pagos en MXN mediante SPEI para transacciones en pesos mexicanos.';

  @override
  String get customerKycBrlTooltip =>
      'Permite pagos en BRL mediante Pix para transacciones en reales brasileños.';

  @override
  String get customerKycStatusNotStarted =>
      'KYC no iniciado. Por favor inicia la verificación.';

  @override
  String get customerKycStatusInProgress =>
      'KYC en progreso. Por favor completa la verificación.';

  @override
  String get customerKycStatusApproved =>
      '¡KYC aprobado! Ahora puedes crear tu cuenta.';

  @override
  String get customerKycStatusRejected =>
      'KYC rechazado. Por favor revisa e inténtalo nuevamente.';

  @override
  String get customerKycStatusUnderReview =>
      'KYC en revisión. Por favor espera la aprobación.';

  @override
  String get customerKycStatusUnknown => 'Estado desconocido';

  @override
  String get customerKycDialogGotIt => 'Entendido';

  @override
  String get exit => 'salida';

  @override
  String get doYouWantToExitTheApp => '¿Quieres salir de la aplicación?';

  @override
  String get newChatRequests => 'Nuevas solicitudes de chat';

  @override
  String get changeLanguageTitle => 'Cambiar idioma';

  @override
  String get selectLanguage => 'Seleccionar idioma';

  @override
  String get messageQuestionWillBeAvailable =>
      '¡La pregunta del mensaje estará disponible pronto!';

  @override
  String get enter4DigitPin => 'Ingresa tu PIN de 4 dígitos';

  @override
  String get createPinCode => 'Crea tu código PIN';

  @override
  String get welcomeTo => 'Bienvenido a';

  @override
  String get enjoyFullExperience =>
      'Disfruta de la experiencia completa que BMP te ofrece';

  @override
  String get signUpForAccount => 'Regístrate para una\ncuenta';

  @override
  String get enterYourPhoneNumber => 'Ingresa tu número de teléfono';

  @override
  String get verificationSMSMessage =>
      'BMP te enviará un mensaje SMS para verificar tu número de teléfono.';

  @override
  String get phoneNumber => 'Número de teléfono';

  @override
  String get loginOnboardingNote =>
      '• Los usuarios que ya tienen una cuenta con correo electrónico deben iniciar sesión primero con su correo y luego vincular su número de teléfono.\n\n• Los nuevos usuarios deben registrarse directamente usando su número de teléfono';

  @override
  String get note => 'Nota';

  @override
  String get enterEmailOrUsernameToContinue =>
      'Ingresa tu correo o usuario y contraseña para continuar';

  @override
  String get securityUpdateRequired => 'Actualización de seguridad requerida';

  @override
  String get linkPhoneToSecureAccount =>
      'Vincula tu número de teléfono para proteger tu cuenta y continuar.';

  @override
  String get ageRestrictionMessage =>
      'Debes tener al menos 16 años para registrarte. Aprende más sobre cómo funciona BMP.';

  @override
  String get enterPhoneNumberError => 'Por favor ingresa un número de teléfono';

  @override
  String get pinSetSuccessfully => '¡PIN establecido con éxito!';

  @override
  String get selectCountry => 'Selecciona tu país';

  @override
  String get searchYourCountry => 'Busca tu país';

  @override
  String get groupChats => 'Chats de grupo';

  @override
  String get myQR => 'Mi QR';

  @override
  String get tapToStartConversation => 'Toca para iniciar la conversación';

  @override
  String get changeProfilePicture => 'Cambiar foto de perfil';

  @override
  String get displayName => 'Nombre para mostrar';

  @override
  String get editContact => 'Editar contacto';

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
  String get ibanNumber => 'Número IBAN';

  @override
  String get bicSwift => 'BIC / SWIFT';

  @override
  String get encryptionSetupTitle => 'Se requiere configuración de cifrado';

  @override
  String get encryptionSetupMessage =>
      'El cifrado de su dispositivo no está configurado correctamente. Esto es necesario para la mensajería segura.\n\n¿Desea completar la configuración de cifrado ahora?';

  @override
  String get encryptionSetupOk => 'Completar configuración';

  @override
  String get encryptionDisableNotAllowed =>
      'No puede desactivar el cifrado en una sala. Si desea desactivar el cifrado, cree una nueva sala sin cifrado.';

  @override
  String get publicRoomEncryptionNotAllowed =>
      'Las salas públicas no pueden estar cifradas.';

  @override
  String get encryptionPermissionDenied =>
      'No tiene permiso para cambiar esto.';

  @override
  String get encryptionSetupCompleted =>
      '¡La configuración del cifrado se completó correctamente! Ahora puede habilitar el cifrado.';

  @override
  String enableEncryptionFailed(Object error) {
    return 'No se pudo habilitar el cifrado: $error';
  }

  @override
  String completeEncryptionSetupFailed(Object error) {
    return 'No se pudo completar la configuración del cifrado: $error. Inténtelo de nuevo o contacte al soporte.';
  }

  @override
  String get encryptionIrreversibleWarning =>
      '¡Habilitar el cifrado en esta sala es irreversible! ¿Está seguro?';

  @override
  String get encryptionEnabledSuccess =>
      '¡El cifrado se habilitó correctamente!';

  @override
  String get encryptionError => 'Error de cifrado';

  @override
  String get encryptionSetupFailedTitle => 'Falló la configuración del cifrado';

  @override
  String get noTransactionHistoryAvailable =>
      'No hay historial de transacciones disponible';

  @override
  String get approved => 'Aprobado';

  @override
  String get active => 'Activo';

  @override
  String get rejected => 'Rechazado';

  @override
  String get pending => 'Pendiente';

  @override
  String get under_review => 'En revisión';

  @override
  String get incomplete => 'Incompleto';

  @override
  String get not_started => 'No iniciado';

  @override
  String get awaiting_questionnaire => 'En espera del cuestionario';

  @override
  String get awaiting_ubo => 'En espera de UBO';

  @override
  String get paused => 'Pausado';

  @override
  String get offboarded => 'Dado de baja';

  @override
  String get virtual => 'Virtual';

  @override
  String get physical => 'Físico';

  @override
  String get selectCardType => 'Seleccionar Tipo de Tarjeta';

  @override
  String get chooseCardTypeDescription =>
      'Choose the type of card you want to create';

  @override
  String get chooseVirtualAccountType =>
      'Elija el tipo de cuenta virtual que desea crear';

  @override
  String get noStoriesToShow => 'No hay historias para mostrar';

  @override
  String get noExternalAccountsAvailable =>
      'No hay cuentas externas disponibles';

  @override
  String get noExternalAccountAdded => 'No External account added';

  @override
  String get editAddress => 'Editar dirección';

  @override
  String get inactive => 'Inactivo';

  @override
  String get activated => 'Activado';

  @override
  String get editAccount => 'Editar cuenta';

  @override
  String get networkConnectionFailed =>
      'La conexión de red falló. Por favor, asegúrate de estar conectado a internet.';

  @override
  String get networkErrorTitle => 'Error de red';

  @override
  String get maxTwoVideos => 'Solo puedes seleccionar hasta 2 videos';

  @override
  String get maxEightImages => 'Solo puedes seleccionar hasta 8 imágenes';

  @override
  String get createChannel => 'Crear canal';

  @override
  String get channelCreatedSuccess => 'El canal se ha creado correctamente';

  @override
  String get channelCreatedFailed => 'Error al crear el canal';

  @override
  String get channelNameEmpty => 'El nombre del canal no puede estar vacío';

  @override
  String get channelNameExists => 'El nombre del canal ya existe en este grupo';

  @override
  String get enterChannelName => 'Ingresa el nombre del canal';

  @override
  String get createGroupChannel => 'Crear canal de grupo';

  @override
  String get initiateKycProcess => 'Iniciar Proceso KYC';

  @override
  String get acceptTermsAndConditions => 'Aceptar Términos y Condiciones';

  @override
  String get setTransactionPin => 'Establecer PIN de Transacción';

  @override
  String get createFourDigitPin =>
      'Crea un PIN de 4 dígitos para transacciones';

  @override
  String loadLiquidationAddressFailed(Object error) {
    return 'Error al cargar los detalles de la dirección de liquidación: $error';
  }

  @override
  String get invalidExternalAccountAddress =>
      'La dirección de esta cuenta externa no es válida';

  @override
  String get customerIdCheck => 'Verificación de ID del cliente';

  @override
  String get customerIdNotFound =>
      'ID del cliente no encontrado. Por favor intenta de nuevo.';

  @override
  String get enterPin => 'Ingresar PIN';

  @override
  String get enterFourDigitPin =>
      'Ingresa tu PIN de 4 dígitos para crear la dirección de liquidación';

  @override
  String get liquidationAddressPayload =>
      'Carga útil de la dirección de liquidación';

  @override
  String get failedToCreateLiquidationAddress =>
      'No se pudo crear la dirección de liquidación';

  @override
  String get liquidationCreationFailed => 'La creación de la liquidación falló';

  @override
  String networkErrorWithMessage(Object error) {
    return 'Error de red: $error';
  }

  @override
  String createLiquidationAddressFailedWithMessage(Object error) {
    return 'Error al crear la dirección de liquidación: $error';
  }

  @override
  String get completeRequiredFields =>
      'Por favor completa todos los campos requeridos:';

  @override
  String get noRecentTransactions => 'Aún no hay transacciones recientes';

  @override
  String wrongPinEnteredWithCooldown(int seconds) {
    return 'PIN incorrecto. Intenta nuevamente en $seconds segundos.';
  }

  @override
  String get pinsDoNotMatch => 'Los PIN no coinciden';

  @override
  String get reEnter4DigitPin => 'Vuelve a ingresar tu PIN de 4 dígitos';

  @override
  String get enterPinToUnlock => 'Ingresa tu PIN para desbloquear';

  @override
  String get enterCurrentPinToChange => 'Ingresa el PIN actual para cambiarlo';

  @override
  String get dialerConnecting => 'Conectando...';

  @override
  String get dialerReconnecting => 'Reconectando...';

  @override
  String get dialerReconnectingMessage =>
      'Por favor espera mientras restauramos la conexión';

  @override
  String get dialerRinging => 'Sonando...';

  @override
  String get dialerCalling => 'Llamando...';

  @override
  String get dialerVideoCalling => 'Videollamada...';

  @override
  String get dialerIncomingVoiceCall => 'Llamada de voz entrante...';

  @override
  String get dialerIncomingVideoCall => 'Videollamada entrante...';

  @override
  String get dialerIncomingCall => 'Llamada entrante';

  @override
  String get dialerMuted => 'Silenciado';

  @override
  String get dialerUnknown => 'Desconocido';

  @override
  String get networkQualityExcellent => 'Excelente';

  @override
  String get networkQualityGood => 'Bueno';

  @override
  String get networkQualityFair => 'Regular';

  @override
  String get networkQualityPoor => 'Malo';

  @override
  String get networkQualityDisconnected => 'Desconectado';

  @override
  String get videoQuality => 'Calidad de video';

  @override
  String get uploadSpeedLabel => 'Subida';

  @override
  String get downloadSpeedLabel => 'Bajada';

  @override
  String get outgoingCalls => 'Llamadas salientes';

  @override
  String get outgoing => 'Saliente';

  @override
  String durationMinutes(int minutes) {
    return '$minutes min';
  }

  @override
  String get subscriptionActivating =>
      'Tu suscripción se está activando. Esto puede tardar unos momentos.';

  @override
  String get subscriptionPaymentPending =>
      'Pago pendiente. Por favor completa tu pago para activar la suscripción.';

  @override
  String get subscriptionPaymentFailed =>
      'El pago falló. Por favor actualiza tu método de pago.';

  @override
  String get completeYourProfile => 'Completa tu perfil';

  @override
  String get provideDetailsToContinu =>
      'Por favor proporciona tus datos para continuar';

  @override
  String get enterValidEmail => 'Ingresa un correo válido';

  @override
  String get enterYourName => 'Ingresa tu nombre';

  @override
  String get nameIsRequired => 'El nombre es obligatorio';

  @override
  String get phoneOptional => 'Teléfono (Opcional)';

  @override
  String get phone => 'Teléfono';

  @override
  String get enterPhoneNumber => 'Ingresa número de teléfono';

  @override
  String get continueBtn => 'Continuar';

  @override
  String get noPricingPlansAvailable => 'No hay planes de precios disponibles';

  @override
  String get failedToLoadPricingPlans => 'Error al cargar planes de precios';

  @override
  String unlockFeature(String feature) {
    return 'Desbloquear $feature';
  }

  @override
  String subscribeToUnlock(String feature) {
    return 'Suscríbete para desbloquear $feature y todas las demás funciones premium.';
  }

  @override
  String get subscribeNow => 'Suscribirse ahora';

  @override
  String get cancelAnyTimeRecurringBilling =>
      'Cancela en cualquier momento. Facturación recurrente.';

  @override
  String get actions => 'Acciones';

  @override
  String get cancelSubscription => 'Cancelar suscripción';

  @override
  String get cancelSubscriptionSubtitle =>
      'Mantendrás el acceso hasta el final de tu período de facturación';

  @override
  String get reactivateSubscription => 'Reactivar suscripción';

  @override
  String get reactivateSubscriptionSubtitle =>
      'Cancela la cancelación programada y mantén tu suscripción';

  @override
  String get subscribeToPremium => 'Suscribirse a Premium';

  @override
  String get unlockPremiumFeatures => 'Desbloquea todas las funciones premium';

  @override
  String get noActiveSubscriptionToCancel =>
      'No se encontró ninguna suscripción activa para cancelar';

  @override
  String get subscriptionCancelledAtPeriodEnd =>
      'Tu suscripción se cancelará al final de tu período de facturación.';

  @override
  String get subscriptionCancelled => 'Tu suscripción ha sido cancelada.';

  @override
  String get failedToCancelSubscription => 'Error al cancelar la suscripción';

  @override
  String get noSubscriptionToReactivate =>
      'No se encontró ninguna suscripción para reactivar';

  @override
  String get subscriptionReactivated => '¡Tu suscripción ha sido reactivada!';

  @override
  String get failedToReactivateSubscription =>
      'Error al reactivar la suscripción';

  @override
  String get cancelSubscriptionQuestion => '¿Cancelar suscripción?';

  @override
  String subscriptionWillEndOn(String date) {
    return 'Tu suscripción terminará el $date. Tendrás acceso a las funciones premium hasta entonces. Después de eso, perderás el acceso a las funciones premium.';
  }

  @override
  String get keepSubscription => 'Mantener suscripción';

  @override
  String get subscriptionWillContinue =>
      'Tu suscripción continuará normalmente. No habrá cargos adicionales hasta tu próximo ciclo de facturación.';

  @override
  String get keepCancelled => 'Mantener cancelada';

  @override
  String get reactivate => 'Reactivar';

  @override
  String get premiumPlan => 'Plan Premium';

  @override
  String get cancelledOn => 'Cancelada el';

  @override
  String get accessEndsOn => 'El acceso termina el';

  @override
  String get nextBillingDate => 'Próxima fecha de facturación';

  @override
  String get subscriptionStatusCancelling => 'Cancelando';

  @override
  String get subscriptionStatusActive => 'Activa';

  @override
  String get subscriptionStatusTrial => 'Prueba';

  @override
  String get subscriptionStatusCancelled => 'Cancelada';

  @override
  String get subscriptionStatusExpired => 'Expirada';

  @override
  String get subscriptionStatusPaymentPending => 'Pago pendiente';

  @override
  String get subscriptionStatusPaymentOverdue => 'Pago vencido';

  @override
  String get subscriptionStatusNone => 'Sin suscripción';

  @override
  String subscriptionDescCancelling(int days) {
    return 'Tu suscripción está programada para cancelarse. Aún tienes acceso por $days días más. Puedes reactivarla en cualquier momento antes de que termine.';
  }

  @override
  String get subscriptionDescActive =>
      'Tienes acceso completo a todas las funciones premium. ¡Disfruta tu suscripción!';

  @override
  String get subscriptionDescTrial =>
      'Actualmente estás en una prueba gratuita. Suscríbete a premium para desbloquear todas las funciones.';

  @override
  String get subscriptionDescCancelled =>
      'Cancelaste tu suscripción. Tu suscripción anterior ha terminado. Suscríbete de nuevo para recuperar el acceso a las funciones premium.';

  @override
  String get subscriptionDescExpired =>
      'Tu suscripción ha expirado debido a un problema de pago. Por favor suscríbete de nuevo con un método de pago actualizado para continuar disfrutando de las funciones premium.';

  @override
  String get subscriptionDescIncomplete =>
      'Tu pago está siendo procesado. Por favor espera la confirmación, o intenta suscribirte de nuevo.';

  @override
  String get subscriptionDescPastDue =>
      'Tu pago está vencido. Por favor actualiza tu método de pago inmediatamente para evitar perder el acceso a las funciones premium.';

  @override
  String get subscriptionDescDefault =>
      'Suscríbete para desbloquear funciones premium y aprovechar al máximo tu experiencia.';

  @override
  String get failedToInitiateRegistration => 'Error al iniciar el registro';

  @override
  String get paymentFailed => 'El pago falló';

  @override
  String get supportPageTitle => 'Enviar ticket de soporte';

  @override
  String get supportPageSubtitle =>
      'Cuéntanos sobre el problema que estás enfrentando.';

  @override
  String get supportSubjectLabel => 'Asunto';

  @override
  String get supportDescriptionLabel => 'Descripción';

  @override
  String get supportSubjectHint =>
      'Ingresa el asunto (ej.: Problemas de inicio de sesión, Problema de pago, etc.)';

  @override
  String get supportDescriptionHint => 'Ingresa la descripción aquí...';

  @override
  String get logInToYourAccount => 'Inicia sesión en tu cuenta';

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
  String get missedCalls => 'Llamadas perdidas';

  @override
  String get selectAtLeastOneMember =>
      'Selecciona al menos un miembro para crear un grupo';

  @override
  String get chatSupportComingSoon =>
      'El soporte por chat estará disponible próximamente';

  @override
  String get selectStartDate => 'Seleccionar fecha de inicio';

  @override
  String get selectEndDate => 'Seleccionar fecha de fin';

  @override
  String get recentContacts => 'Contactos recientes';

  @override
  String get sortZA => 'Ordenar de Z a A';

  @override
  String get sortAZ => 'Ordenar de A a Z';

  @override
  String get selectYourCardType => 'Selecciona tu tipo de tarjeta';

  @override
  String get selectCards => 'Seleccionar tarjetas';

  @override
  String get confirmCardSelection => 'Confirmar selección de tarjeta';

  @override
  String get reviewYourSelection => 'Revisar tu selección';

  @override
  String get mastercard => 'Mastercard';

  @override
  String get mastercardDescription =>
      'Una red de pagos global aceptada en todo el mundo, que ofrece transacciones seguras y rápidas con amplia cobertura de comercios.';

  @override
  String get visa => 'Visa';

  @override
  String get visaDescription =>
      'Una red mundial de pagos digitales que permite pagos con tarjeta rápidos, confiables y seguros casi en cualquier lugar.';

  @override
  String get selectVisaType => 'Seleccionar tipo de Visa';

  @override
  String get selectMastercardType => 'Seleccionar tipo de Mastercard';

  @override
  String get selectCardTypeForNewCard =>
      'Selecciona el tipo de tarjeta para tu nueva tarjeta';

  @override
  String get noCardTypesAvailable => 'No hay tipos de tarjeta disponibles';

  @override
  String get allCardTypesAlreadyCreated =>
      'Ya has creado todas las tarjetas disponibles de este tipo';

  @override
  String get errorCheckingKycStatus => 'Error al verificar el estado de KYC';

  @override
  String get financePayCryptoAccountRequired =>
      'Se requiere una cuenta de PayCrypto';

  @override
  String get pleaseEnter6DigitCode =>
      'Por favor ingresa el código de 6 dígitos';

  @override
  String get cameraAccessDenied =>
      'Acceso a la cámara denegado. Por favor, habilita el permiso de la cámara en la configuración.';

  @override
  String get pinChangedSuccessfully => '¡PIN cambiado con éxito!';

  @override
  String get notAValidQrCode => 'Código QR no válido';

  @override
  String get errorScanningImage => 'Error al escanear la imagen';

  @override
  String get cardSetAsDefault =>
      'Esta tarjeta ahora es tu tarjeta predeterminada';

  @override
  String get failedToSetDefaultCard =>
      'No se pudo establecer la tarjeta predeterminada.';

  @override
  String get allContacts => 'Todos los contactos';

  @override
  String get outgoingCall => 'Llamada saliente';

  @override
  String get makeDefaultCard => 'Establecer como tarjeta predeterminada';

  @override
  String get enterPinToViewBalance => 'Ingresa tu PIN para ver el saldo';

  @override
  String get verifyPin => 'Verificar PIN';

  @override
  String get unlockPremiumAccess => 'Desbloquear acceso premium';

  @override
  String get subscribeToAccessAllFeatures =>
      'Suscríbete ahora para acceder a todas las funciones sin límites.';

  @override
  String get monthly => 'Mensual';

  @override
  String get supportDescriptionTooShort => 'La descripción es demasiado corta';

  @override
  String get supportDescriptionMinLength =>
      'La descripción debe tener al menos 20 caracteres';

  @override
  String get paymentsSecurelyProcessedBy =>
      'Pagos procesados de forma segura por';

  @override
  String get sessionExpired => 'Sesión expirada';

  @override
  String get sessionExpiredMessage =>
      'Tu sesión ha expirado o ya no es válida. Se cerrará la sesión por seguridad.';

  @override
  String get activeCards => 'Tarjetas activas';

  @override
  String get inactiveCards => 'Tarjetas inactivas';

  @override
  String get freezeCards => 'Congelar tarjetas';

  @override
  String depositInstructionSendOnly(Object currency, Object chain) {
    return 'Envía solo $currency en $chain a esta dirección';
  }

  @override
  String get depositInstructionProcessingTime =>
      'Tiempo de procesamiento: 2–15 minutos según la blockchain';

  @override
  String get depositInstructionMinimum =>
      'Depósito mínimo: equivalente a \$10 USD';

  @override
  String get depositInstructionAutoLoad =>
      'Tu tarjeta se cargará automáticamente';

  @override
  String get depositInstructionPushNotification =>
      'Recibirás una notificación cuando se complete';

  @override
  String get shareQr => 'Compartir QR';

  @override
  String get copyQr => 'Copiar QR';

  @override
  String get importantInformation => 'Información importante';

  @override
  String get errorLoadingAddress => 'Error al cargar la dirección';

  @override
  String get deposit => 'Depósito';

  @override
  String get copiedTitle => '¡Copiado!';

  @override
  String get addressCopiedMessage => 'Dirección copiada al portapapeles';

  @override
  String get selectBlockchain => 'Seleccionar blockchain';

  @override
  String get noChainsAvailableTitle => 'No hay redes disponibles';

  @override
  String get noChainsAvailableMessage =>
      'No se encontraron redes compatibles para tu cuenta';

  @override
  String get processing => 'Procesando...';

  @override
  String get noCardInformationAvailable =>
      'No hay información de la tarjeta disponible';

  @override
  String get cardDetailsTitle => 'Detalles de la tarjeta';

  @override
  String get seeYourCardInfo => 'Ver la información de tu tarjeta';

  @override
  String get securityTipDoNotSharePin =>
      'No compartas tu PIN ni los datos de tu tarjeta.';

  @override
  String get securityTipShopSecureSites =>
      'Compra solo en sitios seguros (https).';

  @override
  String get securityTipEnableAlerts =>
      'Activa las alertas y el bloqueo desde la app.';

  @override
  String get securityTipCheckTransactions =>
      'Revisa tus transacciones regularmente.';

  @override
  String get onlyAdminsCanEditGroup =>
      'Solo los administradores pueden editar el nombre y el ícono del grupo';

  @override
  String get profileUpdatedSuccessfully => 'Perfil actualizado correctamente';

  @override
  String get groupEditPermissionDenied =>
      'No tienes permiso para editar este grupo. Solo los administradores pueden editar los detalles del grupo.';

  @override
  String get insufficientGroupPermissions =>
      'Permisos insuficientes. Solo los administradores pueden editar los detalles del grupo.';

  @override
  String get failedToUpdateProfile => 'Error al actualizar el perfil';

  @override
  String get unableToDetermineEmail =>
      'No se pudo determinar tu correo electrónico. Inténtalo de nuevo.';

  @override
  String get transferInitiated => 'Transferencia iniciada';

  @override
  String get transferInitiatedSuccess =>
      '¡Tu transferencia ha sido iniciada con éxito!';

  @override
  String get invitationSent => 'Invitación enviada';

  @override
  String get invitationSentTo => 'Invitación enviada a';

  @override
  String get inviteFailed => 'Error al enviar la invitación';

  @override
  String get failedToSendInvitation => 'No se pudo enviar la invitación';

  @override
  String get inviteToBMP => 'Invitar a BMP';

  @override
  String inviteDescription(Object email) {
    return 'Envía una invitación a $email para unirse a BMP y recibir pagos en USDC';
  }

  @override
  String get sendInvite => 'Enviar invitación';

  @override
  String get sendMoney => 'Enviar dinero';

  @override
  String get transferUsdcViaEmail => 'Transferir USDC por correo electrónico';

  @override
  String get from => 'Desde';

  @override
  String get recipientEmail => 'Correo del destinatario';

  @override
  String get enterRecipientEmail =>
      'Por favor, ingresa el correo del destinatario';

  @override
  String get validRecipientEmail => 'Por favor, ingresa un correo válido';

  @override
  String get cannotSendToYourself => 'No puedes enviarte dinero a ti mismo';

  @override
  String get enterAmount => 'Por favor, ingresa una cantidad';

  @override
  String get validAmount => 'Por favor, ingresa una cantidad válida mayor a 0';

  @override
  String get insufficientBalance =>
      'No tienes suficiente saldo. Recarga tu billetera.';

  @override
  String get recipientNotOnBMP => 'El destinatario aún no está en BMP.';

  @override
  String get recipientNeedsWallet =>
      'El destinatario necesita configurar su billetera.';

  @override
  String incorrectPinAttempts(Object attempts) {
    return 'PIN incorrecto. Quedan $attempts intentos.';
  }

  @override
  String get tooManyAttempts =>
      'Demasiados intentos. Inténtalo de nuevo en 1 hora.';

  @override
  String get accountBlocked =>
      'Tu cuenta está bloqueada. Contacta con soporte.';

  @override
  String get createWalletToProceed =>
      'Crea una billetera para continuar con los pagos';

  @override
  String get selectSourceWallet =>
      'Por favor, selecciona una billetera de origen.';

  @override
  String get selectDestinationWallet =>
      'Por favor, selecciona una billetera de destino.';

  @override
  String get shareFailed => 'Error al compartir';

  @override
  String get failedToOpenShareDialog =>
      'No se pudo abrir el diálogo de compartir';

  @override
  String get reviewAndConfirmTransfer => 'Revisa y confirma tu transferencia';

  @override
  String get transferSummary => 'Resumen de la transferencia';

  @override
  String get destinationWallet => 'Billetera de destino';

  @override
  String get paymentProcessed =>
      'Pago procesado con éxito. Recibirás un correo de confirmación en breve.';

  @override
  String get phoneNumberAlreadyInUse =>
      'El número de teléfono ya existe. Por favor, usa un número diferente.';

  @override
  String get phoneNumberNotFound =>
      'Número de teléfono no encontrado. Por favor, verifique su número o regístrese primero.';

  @override
  String get linkEmailTitle => 'Vincular correo electrónico';

  @override
  String get linkEmailSubtitle =>
      'Por favor, ingresa una dirección de correo electrónico para vincular a tu cuenta para mayor seguridad.';

  @override
  String get emailHint => 'Correo electrónico';

  @override
  String get enterOtpEmail => 'Ingresa el código OTP enviado al correo';

  @override
  String get enterOtpSms => 'Ingresa el código OTP enviado por SMS';
}

/// The translations for Spanish Castilian, as used in Colombia (`es_CO`).
class L10nEsCo extends L10nEs {
  L10nEsCo() : super('es_CO');

  @override
  String get alwaysUse24HourFormat => 'falso';

  @override
  String get repeatPassword => 'Repetir contraseña';

  @override
  String get notAnImage => 'El archivo no es una imagen.';

  @override
  String get setCustomPermissionLevel =>
      'Agregar nivel de permiso personalizado';

  @override
  String get setPermissionsLevelDescription =>
      'Por favor selecciona un rol predeterminado o un nivel de permiso personalizado entre 0 y 100.';

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
  String get importFromZipFile => 'Importar desde un archivo .zip';

  @override
  String get exportEmotePack => 'Exportar paquete de emojis a .zip';

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
  String get addEmail => 'Agregar correo electrónico';

  @override
  String get confirmMatrixId =>
      'Por favor confirma tu ID de user para borrar tu cuenta.';

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
  String get alias => 'Alias';

  @override
  String get all => 'Todo';

  @override
  String get allChats => 'Todos los chats';

  @override
  String get commandHint_roomupgrade =>
      'Actualizar este chat a la versión indicada';

  @override
  String get commandHint_googly => 'Enviar unos ojos saltones';

  @override
  String get commandHint_cuddle => 'Enviar un abrazo';

  @override
  String get commandHint_hug => 'Enviar un abrazo';

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
    return '$senderName respondió la llamada';
  }

  @override
  String get anyoneCanJoin => 'Cualquiera puede unirse';

  @override
  String get appLock => 'Bloqueo de aplicación';

  @override
  String get appLockDescription =>
      'Bloquear la app cuando no se use mediante PIN';

  @override
  String get archive => 'Archivo';

  @override
  String get unArchive => 'Desarchivar';

  @override
  String get areGuestsAllowedToJoin => 'Los invitados pueden unirse?';

  @override
  String get areYouSure => 'Estás seguro?';

  @override
  String get areYouSureYouWantToLogout => 'Seguro que quieres cerrar sesión?';

  @override
  String get askSSSSSign =>
      'Para confirmar a la otra persona, ingresa tu contraseña de almacenamiento seguro o tu clave de recuperación.';

  @override
  String askVerificationRequest(String username) {
    return 'Aceptar esta solicitud de verificación de $username?';
  }

  @override
  String get autoplayImages =>
      'Reproducir automáticamente emoticonos y stickers animados';

  @override
  String badServerLoginTypesException(String serverVersions,
      String supportedVersions, Object suportedVersions) {
    return 'El servidor soporta los siguientes métodos de autenticación:\n$serverVersions\npero esta aplicación sólo soporta:\n$supportedVersions';
  }

  @override
  String get sendTypingNotifications =>
      'Enviar notificaciones de \"está escribiendo\"';

  @override
  String get swipeRightToLeftToReply => 'Desliza a la izquierda para responder';

  @override
  String get alwaysShowMessageTimestamps =>
      'Mostrar siempre la hora de los mensajes';

  @override
  String get alwaysShowMessageTimestampsDescription =>
      'Mostrar la hora de cada mensaje, como WhatsApp';

  @override
  String get sendOnEnter => 'Enviar con Enter';

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
    return '$chats charlas y $participants Los participantes';
  }

  @override
  String countMembers(int count) {
    return '$count Miembros';
  }

  @override
  String get noMoreChatsFound => 'No se encontraron más charlas...';

  @override
  String get noChatsFoundHere =>
      'No se encontraron charlas. Inicia uno nuevo usando el botón de abajo. ⤵️';

  @override
  String get joinedChats => 'chats unidos';

  @override
  String get unread => 'No leídos';

  @override
  String get space => 'Espacio';

  @override
  String get spaces => 'Espacios';

  @override
  String get banFromChat => 'Bloquear del chat';

  @override
  String get banned => 'Bloqueado';

  @override
  String bannedUser(String username, String targetName) {
    return '$username bloqueó a $targetName';
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
    return 'No se puede abrir el URI $uri';
  }

  @override
  String get changeDeviceName => 'Cambiar nombre del dispositivo';

  @override
  String changedTheChatAvatar(String username) {
    return '$username cambió el avatar del chat';
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
    return '$username modificó los permisos del chat';
  }

  @override
  String changedTheDisplaynameTo(String username, String displayname) {
    return '$username cambió su nombre visible a: \'$displayname\'';
  }

  @override
  String changedTheGuestAccessRules(String username) {
    return '$username cambió las reglas de acceso para invitados';
  }

  @override
  String changedTheGuestAccessRulesTo(String username, String rules) {
    return '$username cambió las reglas de acceso para invitados a: $rules';
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
    return '$username cambió las reglas de ingreso a: $joinRules';
  }

  @override
  String changedTheProfileAvatar(String username) {
    return '$username cambió su foto de perfil';
  }

  @override
  String changedTheRoomAliases(String username) {
    return '$username cambió el alias de la sala';
  }

  @override
  String changedTheRoomInvitationLink(String username) {
    return '$username cambió el enlace de invitación de la sala';
  }

  @override
  String get changePassword => 'Cambiar contraseña';

  @override
  String get changeTheHomeserver => 'Cambiar servidor';

  @override
  String get changeTheme => 'Cambiar tema';

  @override
  String get changeTheNameOfTheGroup => 'Cambiar nombre del grupo';

  @override
  String get changeYourAvatar => 'Cambiar tu avatar';

  @override
  String get channelCorruptedDecryptError => 'El cifrado se ha corrompido';

  @override
  String get chat => 'Chat';

  @override
  String get yourChatBackupHasBeenSetUp =>
      'Se ha configurado la copia de seguridad del chat.';

  @override
  String get welcome => 'Te damos la\nBienvenida';

  @override
  String get welcomeSubtitle => 'A una experiencia que no te imaginas';

  @override
  String get welcomeDescription =>
      'Aquí no solo tienes una app. Tienes tu mundo en la palma de la mano: conecta, compra, paga, explora y transforma tu día… sin salir de Bemind.';

  @override
  String get getStarted => 'Empezar';

  @override
  String get chatTitle => 'Chat';

  @override
  String get chatSubtitle => 'Chat, comparte y paga en un solo lugar.';

  @override
  String get chatDescription =>
      'Habla, comparte y paga, todo en un mismo lugar.\nEnvía mensajes, comparte archivos, haz llamadas e incluso paga directamente desde el chat.';

  @override
  String get goToChat => 'Ir al Chat';

  @override
  String get financeTitle => 'Finanzas';

  @override
  String get financeSubtitle => 'Tu plata, hecha simple.';

  @override
  String get financeDescription =>
      'Envía, recibe, convierte, paga con QR o recarga fondos, todo en un solo lugar. Fácil, rápido y sin líos.';

  @override
  String get goToWallet => 'Ir a la Billetera';

  @override
  String get marketplaceTitle => 'Marketplace';

  @override
  String get marketplaceSubtitle =>
      'Compra sin buscar - encuentra lo que necesitas.';

  @override
  String get marketplaceDescription =>
      'Productos, servicios y experiencias pensados para ti. Precios reales, sin compromisos, y todo pagado con tu billetera directamente desde la app.';

  @override
  String get goToMarketplace => 'Ir al Marketplace';

  @override
  String get appsTitle => 'Apps';

  @override
  String get appsSubtitle => 'Tus apps favoritas, ya integradas.';

  @override
  String get appsDescription =>
      'Desde domicilios y viajes hasta suscripciones y reservas - todo está a solo un toque de distancia.';

  @override
  String get goToApps => 'Ir a Apps';

  @override
  String get communitiesTitle => 'Comunidades';

  @override
  String get communitiesSubtitle => 'Conecta, comparte y crea.';

  @override
  String get communitiesDescription =>
      'Descubre lo que otros comparten - o comparte lo tuyo. Esto no es solo redes sociales... es tu espacio, tu voz, tu lugar en el mundo digital.';

  @override
  String get goToCommunity => 'Ir a Comunidad';

  @override
  String get music => 'Música';

  @override
  String get yourRhythmYourSpace => 'Tu ritmo, tu espacio';

  @override
  String get musicDescription =>
      'Escucha tus canciones favoritas mientras chateas, compras o exploras - todo en un solo lugar. Dale play a lo que te hace sentir bien.';

  @override
  String get mentalHealth => 'Salud Mental';

  @override
  String get yourPeaceAlsoMatters => 'Tu tranquilidad también importa';

  @override
  String get mentalHealthDescription =>
      'Herramientas y recursos para tu bienestar emocional. Meditación, ejercicios de mindfulness y apoyo profesional cuando lo necesites.';

  @override
  String get aiFinance => 'I.A: Finanzas';

  @override
  String get letMoneyThinkToo => 'Deja que tu plata también piense';

  @override
  String get aiFinanceDescription =>
      'Inteligencia artificial para ayudarte a tomar mejores decisiones financieras. Análisis automático, recomendaciones personalizadas y proyecciones inteligentes.';

  @override
  String get nutrition => 'Nutrición';

  @override
  String get eatWithoutComplications => 'Come sin complicaciones';

  @override
  String get nutritionDescription =>
      'Obtén recetas personalizadas basadas en lo que tienes en tu nevera, menús personalizados, alertas útiles - y consejos diarios para ayudarte a sentirte mejor.';

  @override
  String get accessDenied => 'Acceso Denegado';

  @override
  String get searchError => 'Error de Búsqueda';

  @override
  String get accessRequired => 'Acceso Requerido';

  @override
  String get cameraAccessRequired =>
      'Se requiere acceso a la cámara para la verificación KYC. Por favor, habilita el permiso en la configuración de la aplicación.';

  @override
  String get openSettings => 'Abrir configuración';

  @override
  String get success => 'Éxito';

  @override
  String get info => 'Información';

  @override
  String get loading => 'Cargando...';

  @override
  String get joinMeOnBeMindPower => '¡Únete a mí en Be MindPower!';

  @override
  String inviteMessageBody(String displayName) {
    return 'Hola, soy $displayName y me gustaría invitarte a chatear conmigo en Be MindPower.';
  }

  @override
  String downloadTheApp(String url) {
    return 'Descarga la aplicación: $url';
  }

  @override
  String get beMindPowerTagline =>
      'Be MindPower - ¡Conecta, Chatea y Crece Juntos!';

  @override
  String failedToCreateInvite(String error) {
    return 'Error al crear invitación: $error';
  }

  @override
  String get emailVerification => 'Verificación de correo';

  @override
  String get verifyingYourEmail => 'Verificando tu correo...';

  @override
  String get pleaseWaitWhileWeCompleteRegistration =>
      'Por favor espera mientras completamos tu registro.';

  @override
  String get registrationComplete => '¡Registro completo!';

  @override
  String get emailVerifiedAndAutoLoginSuccessful =>
      'Correo verificado e inicio de sesión automático exitoso.\nRedirigiendo a tu panel...';

  @override
  String get verificationFailed => 'La verificación falló';

  @override
  String get tryAgain => 'Inténtalo de nuevo';

  @override
  String get emailVerifiedRedirecting =>
      '¡Correo verificado! Redirigiendo al inicio de sesión...';

  @override
  String get emailVerificationFailedTryAgain =>
      'La verificación de correo falló. Por favor intenta de nuevo.';

  @override
  String get verificationError => 'Error de Verificación';

  @override
  String get goToLogin => 'Ir al inicio de sesión';

  @override
  String get pleaseLogInToAccessArchive =>
      'Por favor inicia sesión para acceder al archivo';

  @override
  String get error => 'Error';

  @override
  String get errorAccessingArchive => 'Error al acceder al archivo';

  @override
  String get contacts => 'Contactos';

  @override
  String get filter => 'Filtro';

  @override
  String get unreadChat => 'Chat No Leído';

  @override
  String get noResultsFound => 'No se encontraron resultados';

  @override
  String get search => 'Buscar';

  @override
  String get select => 'Seleccionar';

  @override
  String get markRead => 'Marcar como Leído';

  @override
  String get markUnread => 'Marcar como No Leído';

  @override
  String get blockUser => 'Bloquear Usuario';

  @override
  String get read => 'Leer';

  @override
  String get myWallet => 'Mi Billetera';

  @override
  String get myBank => 'Mi Banco';

  @override
  String get home => 'Inicio';

  @override
  String get logout => 'Cerrar Sesión';

  @override
  String get favorites => 'Favoritos';

  @override
  String get unfavorite => 'Quitar de\nfavoritos';

  @override
  String get noFavoritesYet => 'Aún no hay favoritos';

  @override
  String get starMessagesToAddFavorites =>
      'Marca mensajes con estrella para añadirlos a favoritos';

  @override
  String get removedFromFavorites => 'Eliminado de favoritos';

  @override
  String get unknownRoom => 'Sala desconocida';

  @override
  String get unknownTime => 'Hora desconocida';

  @override
  String errorWithMessage(String message) {
    return 'Error: $message';
  }

  @override
  String get newMessage => 'Nuevo Mensaje';

  @override
  String get searchUsers => 'Buscar @usuarios...';

  @override
  String yourGlobalUsernameIs(String username) {
    return 'Tu nombre de usuario global es: @$username';
  }

  @override
  String get invitationLink => 'Enlace de invitación';

  @override
  String get sendLinkToChat => 'Envía un enlace para chatear.';

  @override
  String get createGroupChat => 'Crear un chat grupal.';

  @override
  String get scanQRCode => 'Escanear QR';

  @override
  String get scanQRCodeDescription => 'Escanear un código QR.';

  @override
  String get errorSearchingUsers => 'Error buscando usuarios';

  @override
  String get noUsersFound => 'No se encontraron usuarios';

  @override
  String get permissionDenied => 'Permiso Denegado';

  @override
  String get searchContact => 'Buscar contacto';

  @override
  String get noContactsFound => 'No se encontraron contactos';

  @override
  String get group => 'Grupo';

  @override
  String get calls => 'Llamadas';

  @override
  String get done => '¡Listo!';

  @override
  String get taskCompletedSuccessfully => 'Tarea completada\nexitosamente';

  @override
  String get goBack => 'Volver';

  @override
  String get signupSuccessMessage => 'Te has registrado \nexitosamente';

  @override
  String get chatBackup => 'Copia de seguridad del chat';

  @override
  String get chatBackupDescription =>
      'La copia de seguridad del chat está protegida con una llave de seguridad. Procura no perderla.';

  @override
  String get thisMonthIsOnUs => 'Este mes es por nuestra cuenta';

  @override
  String get ifYouLoveItContinueFor => 'Si te encanta, continúa por';

  @override
  String get thenEnjoyMemberPriceForJust =>
      'Luego disfruta de un precio de miembro por solo';

  @override
  String get usdMonth => 'USD mes';

  @override
  String get yearlyPlanOfferText =>
      'También puedes obtener nuestro plan anual por solo:';

  @override
  String get confirmYourSelection => 'Confirma tu selección';

  @override
  String get subscriptionActivated => '¡Suscripción activada!';

  @override
  String get chatDetails => 'Detalles del chat';

  @override
  String get chatHasBeenAddedToThisSpace =>
      'El chat se ha agregado a este espacio';

  @override
  String get chats => 'Chats';

  @override
  String get chooseAStrongPassword => 'Elige una contraseña segura';

  @override
  String get clearArchive => 'Limpiar archivo';

  @override
  String get close => 'Cerrar';

  @override
  String get commandHint_markasdm =>
      'Marcar como sala de mensajes directos para el ID de Matrix';

  @override
  String get commandHint_markasgroup => 'Marcar como grupo';

  @override
  String get commandHint_ban => 'Prohibir al usuario indicado en esta sala';

  @override
  String get commandHint_clearcache => 'Limpiar caché';

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
  String get commandHint_join => 'Unirse a la sala indicada';

  @override
  String get commandHint_kick => 'Eliminar al usuario indicado de esta sala';

  @override
  String get commandHint_leave => 'Salir de esta sala';

  @override
  String get commandHint_me => 'Descríbete';

  @override
  String get commandHint_myroomavatar =>
      'Selecciona tu foto para esta sala (por mxc-uri)';

  @override
  String get commandHint_myroomnick =>
      'Establece tu nombre para mostrar en esta sala';

  @override
  String get commandHint_op =>
      'Establece el nivel de poder del usuario dado (predeterminado: 50)';

  @override
  String get commandHint_plain => 'Enviar texto sin formato';

  @override
  String get commandHint_react => 'Enviar respuesta como reacción';

  @override
  String get commandHint_send => 'Enviar texto';

  @override
  String get commandHint_unban => 'Desbanear al usuario indicado en esta sala';

  @override
  String get commandInvalid => 'Comando inválido';

  @override
  String commandMissing(String command) {
    return '$command no es un comando.';
  }

  @override
  String get compareEmojiMatch => 'Por favor compara los emojis';

  @override
  String get compareNumbersMatch => 'Por favor compara los números';

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
  String get containsDisplayName => 'Contiene nombre visible';

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
    return '💬 $username creó el chat';
  }

  @override
  String get createGroup => 'Crear Grupo';

  @override
  String get createNewSpace => 'Nuevo espacio';

  @override
  String get currentlyActive => 'Actualmente activo';

  @override
  String get darkTheme => 'Tema oscuro';

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
      'Tu cuenta será desactivada. ¡Esta acción no se puede revertir! Estás seguro?';

  @override
  String get defaultPermissionLevel =>
      'Nivel de permiso predeterminado para nuevos usuarios';

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
  String get directChats => 'chats directo';

  @override
  String get allRooms => 'Todos los charlas grupales';

  @override
  String get displaynameHasBeenChanged => 'El nombre visible ha sido cambiado';

  @override
  String get download => 'Descargar';

  @override
  String get downloadFile => 'Descargar archivo';

  @override
  String get edit => 'Editar';

  @override
  String get editBlockedServers => 'Editar servidores bloqueados';

  @override
  String get chatPermissions => 'Permisos del chat';

  @override
  String get editDisplayname => 'Editar nombre visible';

  @override
  String get editRoomAliases => 'Editar alias de la sala';

  @override
  String get editRoomAvatar => 'Editar avatar de la sala';

  @override
  String get emoteExists => '¡El emoticono ya existe!';

  @override
  String get emoteInvalid => '¡El atajo del emoticono es inválido!';

  @override
  String get emoteKeyboardNoRecents =>
      'Los emojis usados recientemente aparecerán aquí...';

  @override
  String get emotePacks => 'Paquetes de emoticonos de la sala';

  @override
  String get emoteSettings => 'Configuración de emoticonos';

  @override
  String get globalChatId => 'ID de chat global';

  @override
  String get accessAndVisibility => 'Acceso y visibilidad';

  @override
  String get accessAndVisibilityDescription =>
      'Quién puede unirse a este chat y cómo puede ser descubierto.';

  @override
  String get customEmojisAndStickers => 'Emojis y stickers personalizados';

  @override
  String get customEmojisAndStickersBody =>
      'Agrega o comparte emojis y stickers personalizados que se pueden usar en cualquier chat.';

  @override
  String get emoteShortcode => 'Atajo de emoticono';

  @override
  String get emoteWarnNeedToPick =>
      '¡Debes seleccionar un atajo de emoticono y una imagen!';

  @override
  String get emptyChat => 'Chat vacío';

  @override
  String get enableEmotesGlobally =>
      'Habilitar paquete de emoticonos a nivel global';

  @override
  String get enableEncryption => 'Habilitar encriptación';

  @override
  String get enableEncryptionWarning =>
      'Ya no podrás desactivar el cifrado. Estás seguro?';

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
  String get enterAnEmailAddress => 'Ingresa una dirección de correo';

  @override
  String get homeserver => 'Servidor principal';

  @override
  String get enterYourHomeserver => 'Ingresa tu servidor';

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
  String get fontSize => 'Tamaño de letra';

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
      'La descripción del chat ha sido modificada';

  @override
  String get groupIsPublic => 'El grupo es público';

  @override
  String get groups => 'Grupos';

  @override
  String groupWith(String displayname) {
    return 'Grupo con $displayname';
  }

  @override
  String get guestsAreForbidden => 'Los invitados no pueden unirse';

  @override
  String get guestsCanJoin => 'Los invitados pueden unirse';

  @override
  String hasWithdrawnTheInvitationFor(String username, String targetName) {
    return '$username retiró la invitación para $targetName';
  }

  @override
  String get help => 'Ayuda';

  @override
  String get hideRedactedEvents => 'Ocultar eventos censurados';

  @override
  String get hideRedactedMessages => 'Ocultar mensajes eliminados';

  @override
  String get hideRedactedMessagesBody =>
      'Si alguien elimina un mensaje, ya no será visible en el chat.';

  @override
  String get hideInvalidOrUnknownMessageFormats =>
      'Ocultar formatos de mensaje inválidos o desconocidos';

  @override
  String get howOffensiveIsThisContent => 'Qué tan ofensivo es este contenido?';

  @override
  String get id => 'ID';

  @override
  String get identity => 'Identidad';

  @override
  String get block => 'Bloquear';

  @override
  String get blockedUsers => 'Usuarios bloqueados';

  @override
  String get blockListDescription =>
      'Puedes bloquear usuarios que te estén molestando. No recibirás mensajes ni invitaciones de chat de los usuarios bloqueados.';

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
    return 'Deseas invitar a $contact al chat $groupName?';
  }

  @override
  String inviteContactToGroup(String groupName) {
    return 'Invitar contacto a $groupName';
  }

  @override
  String get noChatDescriptionYet =>
      'No se ha creado una descripción del chat aún.';

  @override
  String get hangup => 'Colgar';

  @override
  String get logoutConfirmTitle => 'Cerrar sesión';

  @override
  String get logoutConfirmMessage =>
      'Estás seguro de que deseas cerrar sesión?';

  @override
  String get logoutButton => 'Cerrar sesión';

  @override
  String get comingSoon => 'Próximamente';

  @override
  String get searchApps => 'Buscar aplicaciones...';

  @override
  String get education => 'Educación';

  @override
  String get game => 'Juego';

  @override
  String get sport => 'Deporte';

  @override
  String get animal => 'Animal';

  @override
  String get love => 'Amor';

  @override
  String get traveling => 'Viajes';

  @override
  String get automotive => 'Automotriz';

  @override
  String get popular => 'Popular';

  @override
  String get food => 'Comida';

  @override
  String get health => 'Salud';

  @override
  String get shopping => 'Compras';

  @override
  String get art => 'Arte';

  @override
  String get spiritual => 'Espiritual';

  @override
  String get maintenance => 'Mantenimiento';

  @override
  String get lifestyle => 'Estilo de vida';

  @override
  String get construction => 'Construcción';

  @override
  String get camera => 'Cámara';

  @override
  String get comingSoonEllipsis => 'Próximamente...';

  @override
  String get exploreFeatures => 'Explorar funciones';

  @override
  String get welcomeToBeMindPower => 'Bienvenido a \nBeMind Power';

  @override
  String get signUpForAnAccount => 'Registrarse';

  @override
  String get whatTypeOfAccountDoYouWantToOpen =>
      'Qué tipo de cuenta deseas abrir?';

  @override
  String get naturalPerson => 'Persona natural';

  @override
  String get verificationEmailSent => '¡Correo de verificación enviado!';

  @override
  String get pleaseCheckEmailAndVerify =>
      'Por favor, revisa tu correo y haz clic en el enlace de verificación, luego presiona \"Completar registro\".';

  @override
  String get clickCompleteAfterVerifying =>
      'Haz clic en \"Completar registro\" después de verificar tu correo.';

  @override
  String get completeRegistration => 'Completar registro';

  @override
  String get startOver => 'Empezar de nuevo';

  @override
  String get successfullyRegistered => '¡Registrado exitosamente!';

  @override
  String get emailVerificationRequired => 'Se requiere verificación de correo';

  @override
  String get pleaseVerifyEmailFirst =>
      'Por favor verifica tu correo antes de continuar y luego intenta de nuevo.';

  @override
  String get sessionExpiredStartOver =>
      'Tu sesión ha expirado. Por favor, inicia el registro nuevamente.';

  @override
  String get pleaseVerifyEmailBeforeCompleting =>
      'Por favor verifica tu correo antes de completar el registro.';

  @override
  String get gotIt => 'Entendido';

  @override
  String get createPassword => 'Crear contraseña';

  @override
  String get enterYourPassword => 'Ingresa tu contraseña';

  @override
  String get confirmPassword => 'Confirmar contraseña';

  @override
  String get alreadyHaveAccount => 'Ya tienes una cuenta?';

  @override
  String get logIn => 'Iniciar sesión';

  @override
  String get federationBaseURL => 'URL Base de Federación';

  @override
  String get clientWellKnownInformation => 'Información Client-Well-Known:';

  @override
  String get baseURL => 'URL Base';

  @override
  String get identityServer => 'Servidor de Identidad:';

  @override
  String get defaultPack => 'Paquete Predeterminado';

  @override
  String get pushError => 'Error de Push';

  @override
  String get deleteError => 'Error al Eliminar';

  @override
  String get answer => 'Responder';

  @override
  String heldTheCall(String displayName) {
    return '$displayName puso la llamada en espera.';
  }

  @override
  String get youHeldTheCall => 'Pusiste la llamada en espera.';

  @override
  String get foregroundServiceRunning =>
      'Esta notificación aparece cuando el servicio en segundo plano está activo.';

  @override
  String get screenSharingTitle => 'Compartir pantalla';

  @override
  String get screenSharingDetail => 'Estás compartiendo tu pantalla en BMP';

  @override
  String get emailVerificationFailed =>
      'La verificación del correo electrónico falló';

  @override
  String get unableToGetSession =>
      'No se pudo obtener la sesión para el registro';

  @override
  String get registrationFailed => 'El registro falló';

  @override
  String get networkError =>
      'Error de red. Por favor verifica tu conexión e intenta de nuevo.';

  @override
  String emailVerificationFailedWithError(String error) {
    return 'La verificación del correo electrónico falló: $error';
  }

  @override
  String get registrationDataNotFound =>
      'Datos de registro no encontrados. Por favor, inicie el registro nuevamente.';

  @override
  String get usernameAlreadyExists => 'El nombre de usuario ya existe';

  @override
  String get unableToGetSessionTryAgain =>
      'No se pudo obtener la sesión. Por favor, inténtelo de nuevo.';

  @override
  String get emailNotVerifiedYet =>
      'Correo electrónico aún no verificado. Por favor, revise su bandeja de entrada y haga clic en el enlace de verificación.';

  @override
  String get usernameAlreadyExistsChooseDifferent =>
      'El nombre de usuario ya existe. Por favor, elija un nombre de usuario diferente.';

  @override
  String get emailAlreadyRegistered =>
      'Correo electrónico ya registrado. Usa una dirección diferente.';

  @override
  String get emailAlreadyExist => 'Correo electrónico ya registrado';

  @override
  String get networkErrorCheckConnection =>
      'Error de red. Por favor, verifique su conexión e inténtelo de nuevo.';

  @override
  String get bmpDescription =>
      'BMP te permite chatear con tus amigos a través de diferentes mensajerías.';

  @override
  String get signUp => 'Registrarse';

  @override
  String photos(int count) {
    return '$count Fotos';
  }

  @override
  String videos(int count) {
    return '$count Vídeos';
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
  String get sharedMedia => 'Medios Compartidos';

  @override
  String items(int count) {
    return '$count elementos';
  }

  @override
  String get noMediaToShow => 'No hay medios para mostrar';

  @override
  String get beTheFirstToShareAMoment =>
      'Sé el primero en compartir un momento';

  @override
  String get file => 'Archivo';

  @override
  String opening(String fileName) {
    return 'Abriendo $fileName';
  }

  @override
  String get renameChannel => 'Renombrar canal';

  @override
  String get renameGroupChannel => 'Renombrar canal del grupo';

  @override
  String get renameGroup => 'Renombrar grupo';

  @override
  String get changeGroupName => 'Cambiar el nombre del grupo';

  @override
  String get setCustomEmotes => 'Establecer emoticones personalizados';

  @override
  String get whoCanPerformWhichAction => 'Quién puede realizar qué acción';

  @override
  String get setting => 'Configuración';

  @override
  String get financePersonalInfo => 'Información Personal';

  @override
  String get financeAddress => 'Dirección';

  @override
  String get financeID => 'Identificación';

  @override
  String get financeTermsOfService => 'Términos de Servicio';

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
      'Error al aceptar los Términos de Servicio';

  @override
  String get financeTermsAcceptanceRequired =>
      'Se requiere aceptar los términos';

  @override
  String get financeIncompleteFields =>
      'Por favor complete todos los campos requeridos';

  @override
  String get financeValidEmail => 'Correo electrónico válido';

  @override
  String get financeBirthDate => 'Fecha de nacimiento';

  @override
  String get financeStreetAddress => 'Dirección';

  @override
  String get financeCity => 'Ciudad';

  @override
  String get financeCountry => 'País';

  @override
  String get financeState => 'Estado';

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
      'Ocurrió un error. Por favor, inténtelo de nuevo.';

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
  String get unableToPlayVideo => 'No se puede reproducir el video';

  @override
  String get notImplemented => 'No implementado';

  @override
  String get loadingEmojiVerification => 'Cargando verificación de emoji...';

  @override
  String get preparingEmojiVerification =>
      'Preparando verificación de emoji...';

  @override
  String get verificationCodesDontMatch =>
      'Los códigos de verificación no coinciden. Por favor, inténtelo de nuevo.';

  @override
  String get verificationCancelled => 'Verificación Cancelada';

  @override
  String get otherUserCancelledVerification =>
      'El otro usuario canceló la verificación.';

  @override
  String get verificationTimeout => 'Tiempo de Verificación Agotado';

  @override
  String get verificationTimedOut =>
      'Se agotó el tiempo de verificación. Por favor, inténtelo de nuevo.';

  @override
  String get unknownVerificationTransaction =>
      'Transacción de verificación desconocida.';

  @override
  String get methodNotSupported => 'Método No Soportado';

  @override
  String get verificationMethodNotSupported =>
      'Este método de verificación no es compatible.';

  @override
  String get unexpectedMessageReceived =>
      'Se recibió un mensaje inesperado durante la verificación.';

  @override
  String get keyVerificationFailed => 'Verificación de Clave Fallida';

  @override
  String get keysCouldNotBeVerified =>
      'Las claves no pudieron ser verificadas.';

  @override
  String get userVerificationFailed => 'Verificación de Usuario Fallida';

  @override
  String get userIdentityCouldNotBeVerified =>
      'La identidad del usuario no pudo ser verificada.';

  @override
  String get invalidMessage => 'Mensaje Inválido';

  @override
  String get invalidMessageReceived =>
      'Se recibió un mensaje inválido durante la verificación.';

  @override
  String get alreadyVerified => 'Ya Verificado';

  @override
  String get verificationAlreadyAccepted =>
      'Esta verificación ya fue aceptada en otro dispositivo.';

  @override
  String get verificationCancelledByOtherUser =>
      'La verificación fue cancelada por el otro usuario.';

  @override
  String get tourGuide => 'Guía Turística';

  @override
  String get finance => 'Finanzas';

  @override
  String get marketplace => 'Mercado';

  @override
  String get community => 'Comunidad';

  @override
  String get apps => 'Aplicaciones';

  @override
  String get addContacts => 'Agregar Contactos';

  @override
  String get goBackToAllChats => 'Volver a todos los chats';

  @override
  String failedToInviteUser(String roomId) {
    return 'Error al invitar usuario de la sala $roomId';
  }

  @override
  String get unableToCreateGroup => 'No se pudo crear el grupo';

  @override
  String get pleaseFillOut => 'Por favor complete';

  @override
  String get newGroup => 'Nuevo Grupo';

  @override
  String get imageGroup => 'Imagen del grupo';

  @override
  String get groupName => 'Nombre del grupo';

  @override
  String get enterGroupName => 'Ingrese el nombre del grupo';

  @override
  String get changeNameGroup => 'Cambiar Nombre del Grupo';

  @override
  String get publicGroup => 'Grupo Público';

  @override
  String get privateGroup => 'Grupo Privado';

  @override
  String get anyoneCanFindAndJoin =>
      'Cualquiera puede encontrar y unirse a este grupo';

  @override
  String get onlyInvitedMembersCanJoin =>
      'Solo los miembros invitados pueden unirse a este grupo';

  @override
  String get endToEndEncryption => 'Cifrado de Extremo a Extremo';

  @override
  String get messagesWillBeEncrypted =>
      'Los mensajes serán cifrados por seguridad';

  @override
  String get messagesWillNotBeEncrypted => 'Los mensajes no serán cifrados';

  @override
  String get pleaseEnterGroupNameFirst =>
      'Por favor ingrese el nombre del grupo primero';

  @override
  String get selectFromYourContacts => 'Seleccione de sus contactos';

  @override
  String get contactsInGroup => 'Contactos en el grupo';

  @override
  String get unsupportedVersion => 'Versión No Soportada';

  @override
  String get copied => 'Copiado';

  @override
  String qrCodeScanned(String link) {
    return 'Código QR Escaneado: $link';
  }

  @override
  String usernameServer(String username, String server) {
    return 'Usuario: $username, Servidor: $server';
  }

  @override
  String extractedUserId(String userId) {
    return 'ID de Usuario Extraído: $userId';
  }

  @override
  String get matrixUrlDetected => 'URL de Matrix.to u otro formato detectado';

  @override
  String get addCaption => 'Agrega un título...';

  @override
  String get selectContact => 'Seleccionar Contacto';

  @override
  String get scanQR => 'Escanear QR';

  @override
  String get messages => 'Mensajes';

  @override
  String get decline => 'Rechazar';

  @override
  String youInvitedBy(String user) {
    return 'Te invitó $username';
  }

  @override
  String get invalidServerName => 'Nombre de servidor inválido';

  @override
  String get archiveRoomDescription =>
      'Estás seguro de que quieres archivar esta sala?';

  @override
  String get hidePresences => 'Ocultar presencias';

  @override
  String get leaveEmptyToClearStatus => 'Deja vacío para borrar el estado';

  @override
  String get removeFromBundle => 'Eliminar del paquete';

  @override
  String get encryptionSetupRequired =>
      'Se requiere configuración de cifrado para mensajería segura. Por favor complete la configuración en Ajustes.';

  @override
  String get warning => '¡Advertencia!';

  @override
  String get noDevicesSelectedForRemoval =>
      'No hay dispositivos seleccionados para eliminar';

  @override
  String get deviceDeletionNotAllowed =>
      'Eliminación de dispositivo no permitida: Estos dispositivos pueden estar protegidos, activos recientemente, o requerir permisos adicionales del administrador del servidor. Este mensaje no aparecerá de nuevo.';

  @override
  String get deviceDeletionFailed =>
      'Eliminación de dispositivo fallida: El servidor rechazó la solicitud.';

  @override
  String failedToRemoveDevices(String error) {
    return 'Error al eliminar dispositivos: $error';
  }

  @override
  String get devicesRemovedSuccessfully =>
      'Dispositivos eliminados exitosamente';

  @override
  String errorRemovingDevices(String error) {
    return 'Error eliminando dispositivos: $error';
  }

  @override
  String get verifyOtherDevice => 'Verificar otro dispositivo';

  @override
  String get verifyOtherDeviceDescription =>
      'Quieres verificar este dispositivo?';

  @override
  String get removeDevicesDescription =>
      'Estás seguro de que quieres eliminar los dispositivos seleccionados?';

  @override
  String get failedToLoadChat =>
      'Error al cargar el chat. Por favor, inténtalo de nuevo.';

  @override
  String get encryptionIssue => 'Problema de cifrado';

  @override
  String get encryptionStatus => 'Estado del cifrado';

  @override
  String get room => 'Sala';

  @override
  String get clientReady => 'Cliente listo';

  @override
  String get roomReady => 'Sala lista';

  @override
  String get canReceive => 'Puede recibir';

  @override
  String get recommendations => 'Recomendaciones';

  @override
  String get fixEncryption => 'Arreglar Cifrado';

  @override
  String get addedToFavorites => 'Agregado a favoritos';

  @override
  String get transferOnlyDirectChats =>
      'Las transferencias solo están disponibles en charlas directos';

  @override
  String get transferSuccessful => 'Transferencia exitosa:';

  @override
  String get messageForwardedSuccessfully => 'Mensaje reenviado exitosamente';

  @override
  String get callsOnlyDirectChats =>
      'Las llamadas solo están disponibles en charlas directos.';

  @override
  String get mustBeMemberToCall =>
      'Debes ser miembro de esta sala para iniciar una llamada.';

  @override
  String get cannotDetermineCallRecipient =>
      'No se puede determinar quién recibirá la llamada.';

  @override
  String get voiceVideoCallsNotAvailable =>
      'Las llamadas de voz y video no están disponibles. Por favor, actívalas en configuración.';

  @override
  String get failedToStartCall => 'Error al iniciar la llamada';

  @override
  String get startGroupCall => 'Iniciar llamada grupal';

  @override
  String get chooseGroupCallType => 'Elige el tipo de llamada grupal:';

  @override
  String get voiceGroupCall => 'Llamada grupal de voz';

  @override
  String get videoGroupCall => 'Videollamada grupal';

  @override
  String get startCall => 'Iniciar llamada';

  @override
  String get chooseCallType => 'Elige el tipo de llamada que quieres realizar:';

  @override
  String get makeYourFirstCall => 'Haz tu primera llamada';

  @override
  String get checkBackLater => 'o vuelve más tarde para ver nueva actividad';

  @override
  String get startAConversation => 'Inicia una\nConversación';

  @override
  String get sendMessageToGetStarted => 'Envía un mensaje para comenzar';

  @override
  String get noParticipantsGroupCall =>
      'No hay participantes disponibles para la llamada grupal.';

  @override
  String get groupCallsInDevelopmentDirectOnly =>
      'Las llamadas grupales están en desarrollo. Por ahora, usa llamadas directas.';

  @override
  String get invited => 'Invitado';

  @override
  String get redactMessageDescription =>
      'El mensaje será censurado para todos los participantes de la conversación. Esto no se puede deshacer.';

  @override
  String get optionalRedactReason =>
      '(Opcional) Motivo para censurar este mensaje...';

  @override
  String invitedUser(String username, String targetName) {
    return '📩 $username invitó a $targetName';
  }

  @override
  String get invitedUsersOnly => 'Solo usuarios invitados';

  @override
  String get inviteForMe => 'Invitar en mi nombre';

  @override
  String inviteText(String username, String link) {
    return '$username te invitó a BMP.\n1. Instala la app\n2. Regístrate o inicia sesión\n3. Abre el enlace de invitación:\n$link';
  }

  @override
  String get gallery => 'Galería';

  @override
  String get document => 'Documento';

  @override
  String get location => 'Ubicación';

  @override
  String get contact => 'Contacto';

  @override
  String get send => 'Enviar';

  @override
  String get request => 'Solicitar';

  @override
  String get qr => 'Código QR';

  @override
  String get replaceOldestPin => '¿Reemplazar el pin más antiguo?';

  @override
  String get yourNewPinWillReplace =>
      'Tu nuevo pin reemplazará el más antiguo.';

  @override
  String get gift => 'Regalo';

  @override
  String get favorite => 'Favorito';

  @override
  String get recoveryKey => 'Clave de recuperación';

  @override
  String get storeInAndroidKeystore => 'Almacenar en el KeyStore de Android';

  @override
  String get storeInAppleKeyChain => 'Almacenar en el KeyChain de Apple';

  @override
  String get storeSecurlyOnThisDevice =>
      'Almacenar de forma segura en este dispositivo';

  @override
  String get storeInSecureStorageDescription =>
      'Guardar la clave de recuperación en el almacenamiento seguro de este dispositivo.';

  @override
  String get saveKeyManuallyDescription =>
      'Comparte esta clave manualmente usando el diálogo de compartir del sistema o el portapapeles.';

  @override
  String get pleaseEnterRecoveryKeyDescription =>
      'Para desbloquear tus mensajes antiguos, ingresa la clave de recuperación generada en una sesión anterior. Tu clave de recuperación NO es tu contraseña.';

  @override
  String get unlockOldMessages => 'Desbloquear mensajes antiguos';

  @override
  String get wrongRecoveryKey =>
      'Lo sentimos... esta no parece ser la clave de recuperación correcta.';

  @override
  String get recoveryKeyLost => 'Perdiste tu clave de recuperación?';

  @override
  String get wipeChatBackup =>
      'Limpiar la copia de seguridad de tu chat para crear una nueva clave de recuperación?';

  @override
  String get isTyping => 'está escribiendo…';

  @override
  String joinedTheChat(String username) {
    return '👋 $username se unió al chat';
  }

  @override
  String get joinRoom => 'Unirse a la sala';

  @override
  String kicked(String username, String targetName) {
    return '👞 $username expulsó a $targetName';
  }

  @override
  String kickedAndBanned(String username, String targetName) {
    return '🙅 $username expulsó y vetó a $targetName';
  }

  @override
  String get kickFromChat => 'Expulsar del chat';

  @override
  String lastActiveAgo(String localizedTimeShort) {
    return 'Última vez activo: $localizedTimeShort';
  }

  @override
  String get leave => 'Salir';

  @override
  String get leftTheChat => 'Salió del chat';

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
      'Esta acción no se puede deshacer. Asegúrate de haber guardado de forma segura el archivo de copia de seguridad.';

  @override
  String get dehydrateTor => 'TOR: Exportar sesión';

  @override
  String get dehydrateTorLong =>
      'Si usas TOR, se recomienda exportar la sesión antes de cerrar la ventana.';

  @override
  String get hydrateTor => 'TOR: Importar sesión exportada';

  @override
  String get hydrateTorLong =>
      'Exportaste tu sesión la última vez en TOR? Impórtala rápidamente y sigue chateando.';

  @override
  String get hydrate => 'Restaurar desde archivo de copia de seguridad';

  @override
  String get loadingPleaseWait => 'Cargando… Por favor espera.';

  @override
  String get loadMore => 'Ver más…';

  @override
  String get locationDisabledNotice =>
      'Los servicios de ubicación están desactivados. Habilítalos para poder compartir tu ubicación.';

  @override
  String get locationPermissionDeniedNotice =>
      'Permiso de ubicación denegado. Habilita para compartir tu ubicación.';

  @override
  String get login => 'Iniciar sesión';

  @override
  String logInTo(String homeserver) {
    return 'Inicia sesión en $homeserver';
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
      'Ten en cuenta que necesitas Pantalaimon para usar cifrado de extremo a extremo por ahora.';

  @override
  String get newChat => 'Nuevo chat';

  @override
  String get newVerificationRequest => '¡Nueva solicitud de verificación!';

  @override
  String get next => 'Siguiente';

  @override
  String get no => 'No';

  @override
  String get noConnectionToTheServer => 'Sin conexión al servidor';

  @override
  String get members => 'Miembros';

  @override
  String get welcomeToMindPower => '¡Bienvenido a MindPower!';

  @override
  String get accountSuccessfullyCreated =>
      'Tu cuenta ha sido creada y verificada exitosamente';

  @override
  String get takingYouToDashboard => 'Llevándote a tu panel de control...';

  @override
  String get continueToApp => 'Continuar a la App';

  @override
  String get quickAccess => 'Acceso rápido';

  @override
  String get cards => 'Tarjetas';

  @override
  String get privacy => 'Privacidad';

  @override
  String get notification => 'Notificación';

  @override
  String get wallet => 'Billetera';

  @override
  String get allCalls => 'Todas las Llamadas';

  @override
  String get unreadCalls => 'Llamadas No Leídas';

  @override
  String get setChatDescription => 'Establecer descripción del chat';

  @override
  String get replaceRoomWithNewerVersion =>
      'Reemplazar sala con versión más nueva';

  @override
  String get roomUpgradeDescription =>
      'Esto actualizará la sala a una versión más nueva. Esta acción no se puede deshacer.';

  @override
  String get usersMustKnock => 'Los usuarios deben tocar';

  @override
  String get noOneCanJoin => 'Nadie puede unirse';

  @override
  String get restricted => 'Restringido';

  @override
  String get knockRestricted => 'Toque restringido';

  @override
  String get unknown => 'Desconocido';

  @override
  String get openGallery => 'Abrir galería';

  @override
  String get voiceCallsOnlyDirectChats =>
      'Las llamadas de voz solo están disponibles en charlas directos';

  @override
  String get videoCallsOnlyDirectChats =>
      'Las videollamadas solo están disponibles en charlas directos';

  @override
  String get voiceCallsNotAvailable =>
      'Las llamadas de voz no están disponibles';

  @override
  String get videoCallsNotAvailable => 'Las videollamadas no están disponibles';

  @override
  String failedToStartVoiceCall(String error) {
    return 'Error al iniciar llamada de voz: $error';
  }

  @override
  String failedToStartVideoCall(String error) {
    return 'Error al iniciar videollamada: $error';
  }

  @override
  String get unsupportedAndroidVersion => 'Versión de Android no compatible';

  @override
  String get unsupportedAndroidVersionLong =>
      'Esta función requiere Android 5.0 o superior';

  @override
  String get available => 'Disponible';

  @override
  String get typeMessage => 'Escribe un mensaje..';

  @override
  String get report => 'Reportar';

  @override
  String get selectPhotos => 'Seleccionar Fotos';

  @override
  String selectPhotosWithCount(int count) {
    return 'Seleccionar Fotos ($count)';
  }

  @override
  String get galleryAccessRequired => 'Se Requiere Acceso a la Galería';

  @override
  String get grantPermission => 'Conceder Permiso';

  @override
  String get messageInfo => 'Información del mensaje';

  @override
  String get pinnMessage => 'Fijar mensaje';

  @override
  String get redactMessage => 'Eliminar mensaje';

  @override
  String get reportMessage => 'Reportar mensaje';

  @override
  String get jumpToLastReadMessage => 'Ir al último mensaje leído';

  @override
  String get jump => 'Ir';

  @override
  String get enterNewChat => 'Entrar al nuevo chat';

  @override
  String get reopenChat => 'Reabrir chat';

  @override
  String get reply => 'Responder';

  @override
  String get shareContact => 'Compartir Contacto';

  @override
  String get searchContacts => 'Buscar contactos';

  @override
  String get loadingContacts => 'Cargando contactos...';

  @override
  String get accessYourContacts => 'Acceder a Tus Contactos';

  @override
  String get contactsPermissionMessage =>
      'Para compartir contactos con tus amigos, por favor permite el acceso a los contactos de tu dispositivo.';

  @override
  String get allowAccess => 'Permitir Acceso';

  @override
  String contactsSelected(int count, String plural) {
    return '$count contacto$plural seleccionado$plural';
  }

  @override
  String get sending => 'Enviando...';

  @override
  String sendCount(int count) {
    return 'Enviar ($count)';
  }

  @override
  String contactsSharedSuccessfully(int count, String plural) {
    return '$count contacto$plural compartido$plural exitosamente';
  }

  @override
  String failedToSendContacts(String error) {
    return 'Error al enviar contactos: $error';
  }

  @override
  String get encryptionEnabledButIncomplete =>
      'El cifrado está habilitado pero la verificación del dispositivo está incompleta.';

  @override
  String get recreateChatError =>
      'Intentar recrear una sala que no es un chat directo. ¡Esto no debería ser posible desde la interfaz!';

  @override
  String get transferFunds => 'Transferir Fondos';

  @override
  String get checkingRecipient => 'Verificando destinatario...';

  @override
  String get transferNotAvailable => 'Transferencia No Disponible';

  @override
  String get recipientNoEthereumWallet =>
      'El destinatario no tiene billetera Ethereum. Por favor pídele que primero cree una billetera Ethereum.';

  @override
  String get createEthereumWalletFirst =>
      'Necesita crear una billetera Ethereum primero para hacer transferencias.';

  @override
  String get createCustomerAccountFirstChat =>
      'Por favor crea primero una cuenta de cliente';

  @override
  String get createCustomerAccountFirst =>
      'Por favor cree una cuenta de cliente primero para hacer transferencias.';

  @override
  String get retry => 'Reintentar';

  @override
  String get createCustomer => 'Crear Cliente';

  @override
  String get loadingWallets => 'Cargando billeteras...';

  @override
  String get createWallet => 'Crear Billetera';

  @override
  String get loadingRecipientWallets =>
      'Cargando billeteras del destinatario...';

  @override
  String transferPaymentTo(String recipient) {
    return 'Transferir Pago a $recipient';
  }

  @override
  String get amount => 'Cantidad';

  @override
  String get pleaseEnterAmount => 'Por favor ingresa la cantidad';

  @override
  String get pleaseEnterValidAmount => 'Por favor ingresa una cantidad válida';

  @override
  String get minimumAmount => 'La cantidad mínima es \$1';

  @override
  String get maximumAmount => 'La cantidad máxima es \$10,000';

  @override
  String get currency => 'Moneda';

  @override
  String get sourceWallet => 'Billetera de origen';

  @override
  String recipientWallets(int count) {
    return 'Billeteras del Destinatario ($count)';
  }

  @override
  String get transfer => 'Transferir';

  @override
  String get pleaseSelectSourceWallet =>
      'Por favor selecciona una billetera de origen';

  @override
  String get createWalletAccountFirst =>
      'Por favor crea primero una cuenta de billetera';

  @override
  String get unableToVerifyAccount =>
      'No se puede verificar tu cuenta. Por favor intenta de nuevo.';

  @override
  String get unableToFindRecipientAccount =>
      'No se puede encontrar la cuenta del destinatario';

  @override
  String get transferFailed => 'Transferencia fallida';

  @override
  String get otherPartyNotLoggedIn =>
      'La otra persona no está conectada en este momento y por eso ¡no puede recibir mensajes!';

  @override
  String get transferCompleted => 'Transferencia completada';

  @override
  String get transferProcessedSuccessfully =>
      'La transferencia se procesó exitosamente.';

  @override
  String get failedToSendTransferMessage =>
      'Error al enviar mensaje de transferencia';

  @override
  String get voiceCallStarted => 'Llamada de voz iniciada...';

  @override
  String get videoCallStarted => 'Videollamada iniciada...';

  @override
  String get callsOnlyInDirectChats =>
      'Las llamadas solo están disponibles en charlas directos.';

  @override
  String get noParticipantsForGroupCall =>
      'No hay participantes disponibles para la llamada grupal.';

  @override
  String get groupCallsInDevelopment =>
      'Las llamadas grupales están en desarrollo. Por ahora, usa llamadas directas.';

  @override
  String get to => 'a';

  @override
  String get chain => 'Cadena';

  @override
  String get transactionId => 'ID de transacción';

  @override
  String get sendAsText => 'Enviar como texto';

  @override
  String get whyDoYouWantToReportThis => 'Por qué quieres reportar esto?';

  @override
  String get reason => 'Razón';

  @override
  String get offensive => 'Ofensivo';

  @override
  String get confirmEventUnpin =>
      'Seguro que quieres desfijar permanentemente el evento?';

  @override
  String get noEmotesFound => 'No se encontró ningún emote 😕';

  @override
  String get addNewEmote => 'Agregar nuevo emote';

  @override
  String get shortcode => 'Código corto';

  @override
  String get image => 'Imagen';

  @override
  String get addEmote => 'Agregar emote';

  @override
  String get chooseImage => 'Seleccionar imagen';

  @override
  String get imageSelected => 'Imagen seleccionada';

  @override
  String get deleteEmote => 'Eliminar emote';

  @override
  String get noEncryptionForPublicRooms =>
      'Solo se puede activar el cifrado cuando la sala deja de ser pública.';

  @override
  String get noGoogleServicesWarning =>
      'Parece que no tienes servicios de Firebase Cloud Messaging en tu dispositivo. Para recibir notificaciones de todas formas, recomendamos instalar ntfy. Con ntfy o cualquier proveedor Unified Push, puedes recibir notificaciones manteniendo la seguridad de tus datos. Puedes descargar ntfy desde PlayStore o F-Droid.';

  @override
  String noMatrixServer(String server1, String server2) {
    return '$server1 no es un servidor Matrix, usar $server2 en su lugar?';
  }

  @override
  String get shareInviteLink => 'Compartir enlace de invitación';

  @override
  String get scanQrCode => 'Escanear código QR';

  @override
  String get none => 'Ninguno';

  @override
  String get noPasswordRecoveryDescription =>
      'Aún no has agregado un método de recuperación de contraseña.';

  @override
  String get noPermission => 'Sin permisos';

  @override
  String get noRoomsFound => 'No se encontraron salas…';

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
  String get locationFound => 'Ubicación Encontrada';

  @override
  String get otherPartyCannotReceiveEncryptedMessages =>
      'La otra persona no puede recibir mensajes cifrados';

  @override
  String get accuracy => 'Precisión';

  @override
  String get offline => 'Desconectado';

  @override
  String get ok => 'Aceptar';

  @override
  String get online => 'Conectado';

  @override
  String get onlineKeyBackupEnabled =>
      'La copia de seguridad de clave en línea está activada';

  @override
  String get oopsPushError =>
      '¡UPS! Se produjo un error al configurar las notificaciones push.';

  @override
  String get oopsSomethingWentWrong => 'Ups, algo salió mal…';

  @override
  String get openAppToReadMessages =>
      'Abre la aplicación para leer los mensajes';

  @override
  String get openCamera => 'Abrir cámara';

  @override
  String get openVideoCamera => 'Abrir cámara para video';

  @override
  String get oneClientLoggedOut => 'Se cerró sesión en uno de tus clientes';

  @override
  String get addAccount => 'Agregar cuenta';

  @override
  String get editBundlesForAccount => 'Editar paquetes de esta cuenta';

  @override
  String get addToBundle => 'Agregar al paquete';

  @override
  String get bundleName => 'Nombre del paquete';

  @override
  String get enableMultiAccounts =>
      '(BETA) habilitar varias cuentas en este dispositivo';

  @override
  String get openInMaps => 'Abrir en Maps';

  @override
  String get link => 'Enlace';

  @override
  String get serverRequiresEmail =>
      'Este servidor requiere validar tu correo electrónico para registrarte.';

  @override
  String get or => 'O';

  @override
  String get participant => 'Participante';

  @override
  String get passphraseOrKey => 'contraseña o clave de recuperación';

  @override
  String get password => 'Contraseña';

  @override
  String get passwordForgotten => 'Olvidaste tu contraseña';

  @override
  String get passwordHasBeenChanged => 'La contraseña ha sido cambiada';

  @override
  String get hideMemberChangesInPublicChats =>
      'Ocultar cambios de miembros en salas públicas';

  @override
  String get hideMemberChangesInPublicChatsBody =>
      'No mostrar en el chat que alguien entra o sale de una sala pública para mejorar la comprensión.';

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
  String get pickImage => 'Seleccionar imagen';

  @override
  String get pin => 'Fijar';

  @override
  String play(String fileName) {
    return 'Reproducir $fileName';
  }

  @override
  String get pleaseChoose => 'Por favor elige';

  @override
  String get pleaseChooseAPasscode => 'Elija un código de acceso';

  @override
  String get pleaseClickOnLink =>
      'Haz clic en el enlace del correo y luego continúa.';

  @override
  String get pleaseEnter4Digits =>
      'Ingrese 4 dígitos o déjelo en blanco para desactivar el bloqueo de la app.';

  @override
  String get pleaseEnterRecoveryKey =>
      'Por favor, introduce tu clave de recuperación:';

  @override
  String get pleaseEnterYourPassword => 'Por favor ingresa tu contraseña';

  @override
  String get pleaseEnterYourPin => 'Por favor ingrese su PIN';

  @override
  String get pleaseEnterYourUsername =>
      'Por favor ingresa tu nombre de usuario';

  @override
  String get pleaseFollowInstructionsOnWeb =>
      'Por favor sigue las instrucciones en el sitio web y presiona \"Siguiente\".';

  @override
  String get publicRooms => 'Salas públicas';

  @override
  String get pushRules => 'Reglas de Push';

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
    return '$username censuró un evento';
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
  String get removeAllOtherDevices => 'Eliminar todos los demás dispositivos';

  @override
  String removedBy(String username) {
    return 'Eliminado por $username';
  }

  @override
  String get removeDevice => 'Eliminar dispositivo';

  @override
  String get unbanFromChat => 'Quitar expulsión';

  @override
  String get removeYourAvatar => 'Quitar tu avatar';

  @override
  String get requestPermission => 'Solicitar permiso';

  @override
  String get roomHasBeenUpgraded => 'La sala ha sido actualizada';

  @override
  String get roomVersion => 'Versión de sala';

  @override
  String get saveFile => 'Guardar archivo';

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
  String get sendOriginal => 'Enviar original';

  @override
  String get sendSticker => 'Enviar sticker';

  @override
  String get sendVideo => 'Enviar video';

  @override
  String sentAFile(String username) {
    return '$username envió un archivo';
  }

  @override
  String get pickFiles => 'Seleccionar archivos';

  @override
  String get allFiles => 'Todos los archivos';

  @override
  String get documents => 'Documentos';

  @override
  String get spreadsheets => 'Hojas de cálculo';

  @override
  String get pdf => 'PDF';

  @override
  String get twitterLoginComingSoon =>
      '¡Pronto podrás iniciar sesión con Twitter!';

  @override
  String get googleLoginComingSoon =>
      '¡Pronto podrás iniciar sesión con Google!';

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
  String get separateChatTypes => 'Separar charlas directos de grupos';

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
    return '$username compartió su ubicación';
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
    return '$senderName inició una llamada';
  }

  @override
  String get startFirstChat => 'Comienza tu primer chat';

  @override
  String get status => 'Estado';

  @override
  String get statusExampleMessage => 'Cómo estás hoy?';

  @override
  String get submit => 'Enviar';

  @override
  String get synchronizingPleaseWait => 'Sincronizando... por favor espera.';

  @override
  String synchronizingPleaseWaitCounter(String percentage) {
    return 'Sincronizando… ($percentage%)';
  }

  @override
  String get systemTheme => 'Sistema';

  @override
  String get theyDontMatch => 'No coinciden';

  @override
  String get theyMatch => 'Coinciden';

  @override
  String get notFound => 'No encontrado';

  @override
  String get pinLimitMessage => 'Solo puedes fijar hasta 3 chats';

  @override
  String get title => 'BMP';

  @override
  String get toggleFavorite => 'Alternar favorito';

  @override
  String get toggleMuted => 'Alternar silenciado';

  @override
  String get toggleUnread => 'Marcar como leído / no leído';

  @override
  String get tooManyRequestsWarning =>
      'Demasiadas solicitudes. ¡Intenta de nuevo más tarde!';

  @override
  String get transferFromAnotherDevice => 'Transferir desde otro dispositivo';

  @override
  String get tryToSendAgain => 'Intentar enviar nuevamente';

  @override
  String get unavailable => 'Indisponible';

  @override
  String unbannedUser(String username, String targetName) {
    return '$username volvió a admitir a $targetName';
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
  String get unmuteChat => 'Activar chat';

  @override
  String get unpin => 'Desanclar';

  @override
  String get unreadChats => 'Chats no leídos';

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
  String get verifyStart => 'Iniciar verificación';

  @override
  String get verifySuccess => '¡Verificación exitosa!';

  @override
  String get verifyTitle => 'Verificando la otra cuenta';

  @override
  String get videoCall => 'Videollamada';

  @override
  String get visibilityOfTheChatHistory => 'Visibilidad del historial del chat';

  @override
  String get visibleForAllParticipants =>
      'Visible para todos los participantes';

  @override
  String get visibleForEveryone => 'Visible para todos';

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
  String get weSentYouAnEmail => 'Te hemos enviado un correo electrónico';

  @override
  String get whoIsAllowedToJoinThisGroup => 'Quién puede unirse al grupo';

  @override
  String get unableToPlayAudioMessage =>
      'No se puede reproducir el mensaje de audio';

  @override
  String get message => 'Mensaje';

  @override
  String get call => 'Llamar';

  @override
  String get save => 'Guardar';

  @override
  String get edited => 'editado';

  @override
  String get withTheseAddressesRecoveryDescription =>
      'Con esta dirección puedes recuperar tu contraseña.';

  @override
  String get writeAMessage => 'Escribe un mensaje…';

  @override
  String get yes => 'Sí';

  @override
  String get you => 'Tú';

  @override
  String get youAreNoLongerParticipatingInThisChat =>
      'Ya no participas en este chat';

  @override
  String get youHaveBeenBannedFromThisChat => 'Has sido bloqueado de este chat';

  @override
  String get yourPublicKey => 'Tu clave pública';

  @override
  String get time => 'Tiempo';

  @override
  String get messageType => 'Tipo de mensaje';

  @override
  String get sender => 'Remitente';

  @override
  String get removeFromSpace => 'Eliminar del espacio';

  @override
  String get addToSpaceDescription => 'Elige un espacio para añadir este chat.';

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
  String get pinMessage => 'Fijar mensaje';

  @override
  String get shareItemsValidationError => 'Ruta de archivo inválida';

  @override
  String get voiceRecordingPermissionDenied =>
      'Permiso para grabar voz denegado';

  @override
  String get noEventsSelected => 'No hay eventos seleccionados';

  @override
  String actionFailed(String action, String error) {
    return '$action falló: $error';
  }

  @override
  String get emojis => 'Emojis';

  @override
  String get placeCall => 'Llamar';

  @override
  String get voiceCall => 'Llamada de voz';

  @override
  String get videoCallsBetaWarning =>
      'Las videollamadas están actualmente en fase beta. Es posible que no funcionen como se espera en algunas plataformas.';

  @override
  String get experimentalVideoCalls => 'Videollamadas experimentales';

  @override
  String get emailOrUsername => 'Correo electrónico o nombre de usuario';

  @override
  String get indexedDbErrorTitle => 'Problemas con el modo privado';

  @override
  String get indexedDbErrorLong =>
      'El almacenamiento de mensajes no está habilitado en modo privado por defecto.\nPor favor, visite\n - about:config\n - Establezca dom.indexedDB.privateBrowsing.enabled en true\nDe lo contrario, no es posible usar BMP.';

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
  String get widgetNameError => 'Por favor proporciona un nombre.';

  @override
  String get errorAddingWidget => 'Error al añadir el widget.';

  @override
  String get youRejectedTheInvitation => 'Rechazaste la invitación';

  @override
  String get youJoinedTheChat => 'Te has unido al chat';

  @override
  String get youAcceptedTheInvitation => '👍 Aceptaste la invitación';

  @override
  String youBannedUser(String user) {
    return 'Prohibiste el acceso a $user';
  }

  @override
  String youHaveWithdrawnTheInvitationFor(String user) {
    return 'Retiraste la invitación a $user';
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
    return '📩 Invitaste a $user';
  }

  @override
  String youKicked(String user) {
    return '👞 Expulsaste a $user';
  }

  @override
  String youKickedAndBanned(String user) {
    return '🙅 Expulsaste y prohibiste el acceso a $user';
  }

  @override
  String youUnbannedUser(String user) {
    return 'Volviste a permitir el acceso a $user';
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
      'Aún no se ha creado un enlace público';

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
  String get callingAccount => 'Cuenta desde la que llamas';

  @override
  String get callingAccountDetails =>
      'Permite que BMP use la aplicación nativa de llamadas de Android.';

  @override
  String get appearOnTop => 'Aparecer encima';

  @override
  String get appearOnTopDetails =>
      'Permite que la app aparezca encima (no es necesario si BMP ya está configurado como cuenta de llamadas)';

  @override
  String get otherCallingPermissions =>
      'Micrófono, cámara y otros permisos de BMP';

  @override
  String get whyIsThisMessageEncrypted =>
      'Por qué no se puede leer este mensaje?';

  @override
  String get noKeyForThisMessage =>
      'Esto puede pasar si el mensaje se envió antes de que ingresaras a tu cuenta en este dispositivo.\n\nTambién puede ser que el remitente haya bloqueado tu dispositivo o que haya habido un problema con la conexión a Internet.\n\nPuedes leer el mensaje en otra sesión? Entonces, ¡puedes transferirlo desde allí! Ve a Ajustes > Dispositivos y verifica que tus dispositivos estén validados entre sí. Cuando abras la sala la próxima vez y ambas sesiones estén activas, las claves se transferirán automáticamente.\n\nNo quieres perder las claves al salir o cambiar de dispositivo? Asegúrate de tener activada la copia de seguridad del chat en los ajustes.';

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
      'Los espacios permiten consolidar los charlas y crear comunidades privadas o públicas.';

  @override
  String get encryptThisChat => 'Cifrar este chat';

  @override
  String get disableEncryptionWarning =>
      'Por seguridad no es posible deshabilitar el cifrado si ya ha sido activado en este chat.';

  @override
  String get sorryThatsNotPossible => 'Lo siento... eso no es posible';

  @override
  String get deviceKeys => 'Claves de dispositivo:';

  @override
  String get noBackupWarning =>
      '¡Cuidado! Si no habilitas la copia de seguridad del chat, perderás acceso a tus mensajes cifrados. Se recomienda habilitarla antes de salir.';

  @override
  String get noOtherDevicesFound => 'No se han encontrado otros dispositivos';

  @override
  String fileIsTooBigForServer(String max) {
    return '¡No se pudo enviar! El servidor solo permite adjuntos de hasta $max.';
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
      '😭 Oh, no. Algo salió mal. Puedes informar de este fallo a los desarrolladores.';

  @override
  String get signInWithPassword => 'Entrar con clave';

  @override
  String get pleaseTryAgainLaterOrChooseDifferentServer =>
      'Por favor, intenta de nuevo más tarde o elige un servidor diferente.';

  @override
  String signInWith(String provider) {
    return 'Entrar con $provider';
  }

  @override
  String get profileNotFound =>
      'No se encontró al usuario en el servidor. Puede haber un problema de conexión o el usuario no exista.';

  @override
  String get setTheme => 'Poner tema:';

  @override
  String get setColorTheme => 'Establecer tema de color:';

  @override
  String get invite => 'Invitación';

  @override
  String get inviteGroupChat => '📨 Invitar a grupo de chat';

  @override
  String get invitePrivateChat => '📨 Invitar a chat privado';

  @override
  String get invalidInput => '¡Entrada no válida!';

  @override
  String get wrongPinEntered => 'PIN incorrecto';

  @override
  String get pleaseEnterANumber => 'Por favor ingresa un número mayor que 0';

  @override
  String get banUserDescription =>
      'El usuario será expulsado del chat y no podrá volver hasta que se le permita.';

  @override
  String get unbanUserDescription =>
      'El usuario podrá volver a entrar al chat si lo intenta.';

  @override
  String get kickUserDescription =>
      'Expulsa al usuario del chat, pero no se le prohíbe volver a entrar. En charlas públicos, podrá reingresar en cualquier momento.';

  @override
  String get makeAdminDescription =>
      'Una vez hagas admin a este usuario, puede que no puedas deshacerlo porque tendrá los mismos permisos que tú.';

  @override
  String get pushNotificationsNotAvailable =>
      'Las notificaciones emergentes no están disponibles';

  @override
  String get learnMore => 'Aprender más';

  @override
  String get yourGlobalUserIdIs => 'Tu ID de usuario global es: ';

  @override
  String noUsersFoundWithQuery(String query) {
    return 'Lamentablemente, no se encontró ningún usuario con \"$query\". Por favor, verifica que no haya errores.';
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
  String get commandHint_sendraw => 'Enviar JSON crudo';

  @override
  String get databaseMigrationTitle => 'La base de datos está optimizada';

  @override
  String get databaseMigrationBody =>
      'Por favor espera. Esto tomará un momento.';

  @override
  String get searchForUsers => 'Buscar @usuarios...';

  @override
  String get pleaseEnterYourCurrentPassword =>
      'Por favor, ingresa tu clave actual';

  @override
  String get newPassword => 'Nueva contraseña';

  @override
  String get pleaseChooseAStrongPassword => 'Por favor, elige una clave fuerte';

  @override
  String get passwordsDoNotMatch => 'Las claves no coinciden';

  @override
  String get passwordIsWrong => 'La clave ingresada es incorrecta';

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
  String get addChatOrSubSpace => 'Añadir chat o subespacio';

  @override
  String get subspace => 'Subespacio';

  @override
  String get thisDevice => 'Este dispositivo:';

  @override
  String get initAppError => 'Hubo un error al iniciar la app';

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
    return 'No se pudo crear la base de datos SQLite. La app usará la base de datos heredada por ahora. Por favor informa de este error a los desarrolladores en $url. El mensaje de error es: $error';
  }

  @override
  String sessionLostBody(String url, String error) {
    return 'Se perdió tu sesión. Por favor, informa de este error a los desarrolladores en $url. El mensaje de error es: $error';
  }

  @override
  String restoreSessionBody(String url, String error) {
    return 'La app intenta recuperar tu sesión desde la copia de seguridad. Por favor informa de este error a los desarrolladores en $url. El mensaje de error es: $error';
  }

  @override
  String forwardMessageTo(String roomName) {
    return 'Reenviar mensaje a $roomName?';
  }

  @override
  String get sendReadReceipts => 'Enviar recibos de lectura';

  @override
  String get sendTypingNotificationsDescription =>
      'Otros participantes del chat pueden ver cuándo estás escribiendo un mensaje.';

  @override
  String get sendReadReceiptsDescription =>
      'Otros participantes del chat pueden ver cuándo has leído un mensaje.';

  @override
  String get formattedMessages => 'Mensajes con formato';

  @override
  String get formattedMessagesDescription =>
      'Mostrar contenido enriquecido del mensaje, como texto en negrita usando markdown.';

  @override
  String get verifyOtherUser => '🔐 Verificar a otro usuario';

  @override
  String get verifyOtherUserDescription =>
      'Si verificas a otro usuario, puedes estar seguro de a quién estás escribiendo realmente. 💪\n\nCuando empiezas una verificación, tú y el otro usuario verán una ventana emergente en la app con una serie de emojis o números que deben comparar.\n\nLa mejor manera de hacerlo es mediante un encuentro presencial o una videollamada. 👭';

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
    return '$sender está listo para verificación de clave';
  }

  @override
  String requestedKeyVerification(String sender) {
    return '$sender ha pedido verificación de clave';
  }

  @override
  String startedKeyVerification(String sender) {
    return '$sender ha comenzado la verificación de clave';
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
  String get commandHint_ignore => 'Ignorar la ID de Matrix dada';

  @override
  String get commandHint_unignore => 'No ignorar la ID de Matrix dada';

  @override
  String unreadChatsInApp(String appname, String unread) {
    return '$appname: $unread charlas no leídos';
  }

  @override
  String get noDatabaseEncryption =>
      'En esta plataforma no hay cifrado de base de datos';

  @override
  String thereAreCountUsersBlocked(Object count) {
    return 'Actualmente hay $count usuarios bloqueados.';
  }

  @override
  String goToSpace(Object space) {
    return 'Ir al espacio: $space';
  }

  @override
  String get youDeletedThisMessage => 'Eliminaste este mensaje';

  @override
  String get thisMessageWasDeleted => 'Este mensaje fue eliminado';

  @override
  String get refreshing => 'Actualizando...';

  @override
  String get markAsUnread => 'Marcar como no leído';

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
      'Cambiar visibilidad del historial del chat';

  @override
  String get changeTheCanonicalRoomAlias =>
      'Cambiar la dirección pública principal del chat';

  @override
  String get sendRoomNotifications => 'Mandar notificación @sala';

  @override
  String get changeTheDescriptionOfTheGroup =>
      'Cambiar la descripción del chat';

  @override
  String get chatPermissionsDescription =>
      'Define el nivel necesario para ciertas acciones en este chat. Los niveles 0, 50 y 100 normalmente representan usuarios, moderadores y administradores, pero se puede usar cualquier escala.';

  @override
  String updateInstalled(String version) {
    return '¡🎉 Actualización $version instalada!';
  }

  @override
  String get changelog => 'Cambios';

  @override
  String get sendCanceled => 'Envío cancelado';

  @override
  String get loginWithMatrixId => 'Iniciar sesión con un ID de Matrix';

  @override
  String get discoverHomeservers => 'Descubrir homeservers';

  @override
  String get whatIsAHomeserver => 'Qué es un homeserver?';

  @override
  String get homeserverDescription =>
      'Todos tus datos se guardan en el homeserver, igual que en un proveedor de correo electrónico. Puedes elegir el homeserver que quieras usar y comunicarte con todos. Más info en https://invitation.be-mindpower.net/.';

  @override
  String get doesNotSeemToBeAValidHomeserver =>
      'No parece ser un homeserver válido. URL incorrecta?';

  @override
  String get calculatingFileSize => 'Calculando tamaño de archivo...';

  @override
  String get prepareSendingAttachment => 'Preparando envío del adjunto...';

  @override
  String get sendingAttachment => 'Enviando adjunto...';

  @override
  String get generatingVideoThumbnail => 'Generando miniatura del video...';

  @override
  String get compressVideo => 'Comprimiendo video...';

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
      'Nota: Cuando conectas todos tus dispositivos a la copia de seguridad del chat, se verifican automáticamente.';

  @override
  String get continueText => 'Continuar';

  @override
  String get welcomeText =>
      'Eh, eh, 👋 Esto es BMP. Puedes acceder a cualquier homeserver compatible con https://invitation.be-mindpower.net/ y luego chatear con cualquiera. ¡Es una red de mensajería descentralizada enorme!';

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
      'El servidor no proporciona información de contacto válida';

  @override
  String get contactServerAdmin => 'Contactar al administrador del servidor';

  @override
  String get contactServerSecurity => 'Contactar con seguridad del servidor';

  @override
  String get supportPage => 'Página de soporte';

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
  String get invalidUrl => 'URL inválida';

  @override
  String get addLink => 'Añadir enlace';

  @override
  String get unableToJoinChat =>
      'No se puede acceder al chat. Puede que la otra parte haya cerrado la conversación.';

  @override
  String get previous => 'Anterior';

  @override
  String appWantsToUseForLogin(String server) {
    return 'Usar \'$server\' para iniciar sesión';
  }

  @override
  String get appWantsToUseForLoginDescription =>
      'Permites que la app y web compartan información sobre ti.';

  @override
  String get open => 'Abrir';

  @override
  String get waitingForServer => 'Esperando al servidor...';

  @override
  String get appIntroduction =>
      'BMPte te permite chatear con tus amigos usando diferentes servicios de mensajería. Aprende más en https://invitation.be-mindpower.net/ o simplemente toca *Continuar*.';

  @override
  String get newChatRequest => '📩 Nueva solicitud de chat';

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
      'Si eliminas este ajuste de notificación, no se puede deshacer.';

  @override
  String get more => 'Más';

  @override
  String get shareKeysWith => 'Compartir claves con...';

  @override
  String get shareKeysWithDescription =>
      'Qué dispositivos deben ser de confianza para que puedan leer tus mensajes en chats cifrados?';

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
  String get recordAVideo => 'Grabar un video';

  @override
  String get optionalMessage => '(Opcional) mensaje...';

  @override
  String get notSupportedOnThisDevice => 'No compatible con este dispositivo';

  @override
  String get approve => 'Aprobar';

  @override
  String get youHaveKnocked => 'Has llamado';

  @override
  String get pleaseWaitUntilInvited =>
      'Por favor espera hasta que alguien del chat te invite.';

  @override
  String get commandHint_logout => 'Cerrar sesión en este dispositivo';

  @override
  String get commandHint_logoutall => 'Cerrar sesión en todos los dispositivos';

  @override
  String get displayNavigationRail => 'Mostrar barra de navegación en móvil';

  @override
  String get customReaction => 'Reacción personalizada';

  @override
  String get unexpectedVerificationMessage =>
      'Se recibió un mensaje inesperado durante la verificación.';

  @override
  String get financeLoading => 'Cargando...';

  @override
  String get financePleaseWaitLoadWallet =>
      'Por favor espera mientras cargamos tu billetera';

  @override
  String get financeWelcome => 'Bienvenido';

  @override
  String get financeRegistrationCompleted => '¡Registro completado con éxito!';

  @override
  String financeFailedToUpdate(String error) {
    return 'Error al actualizar: $error';
  }

  @override
  String get financeStatusRefreshed => 'Estado actualizado correctamente';

  @override
  String financeFailedToRefresh(String error) {
    return 'Error al actualizar: $error';
  }

  @override
  String get financeFailedToStartKYC => 'Error al iniciar el reintento de KYC';

  @override
  String get financeAccountFullyVerified =>
      'Tu cuenta está completamente verificada y activa';

  @override
  String get financeAccountVerificationFailed =>
      'La verificación de tu cuenta no fue exitosa';

  @override
  String get financeAccountUnderReview => 'Tu cuenta está en revisión';

  @override
  String get financeAdditionalVerificationRequired =>
      'Se requiere verificación adicional';

  @override
  String get financeManageWalletServices =>
      'Administra tus servicios de billetera';

  @override
  String get financeAccountRejected => 'Cuenta rechazada';

  @override
  String get financeAccountUnderReviewTitle => 'Cuenta en revisión';

  @override
  String get financeAccountIncomplete => 'Cuenta incompleta';

  @override
  String get financeFinishVerification => 'Completa tu verificación';

  @override
  String get financeAccountIssues => 'Problemas con la cuenta';

  @override
  String get financeBankAccounts => 'Cuentas bancarias';

  @override
  String get financeBankAccountsSubtitle =>
      'Cuenta bancaria virtual para recibir pagos';

  @override
  String get financeExternalAccount => 'Cuenta externa';

  @override
  String get financeExternalAccountSubtitle =>
      'Agrega tus cuentas bancarias para enviar dinero por ACH transferencia';

  @override
  String get financeDigitalWallets => 'Billeteras digitales';

  @override
  String get financeDigitalWalletsSubtitle =>
      'Accede a tus billeteras digitales';

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
  String get financeCreateFirstCard => 'Crea tu primera tarjeta para comenzar';

  @override
  String get financeViewCards => 'Ver tarjetas';

  @override
  String get financeMyCards => 'Mis tarjetas';

  @override
  String get financeNoCards => 'Sin Tarjetas';

  @override
  String get financeCreateCardToGetStarted =>
      'Crea una nueva tarjeta para comenzar';

  @override
  String get financeCreateNewCard => 'Crear Nueva Tarjeta';

  @override
  String get financeVirtualCard => 'Tarjeta Virtual';

  @override
  String get financeActivatingCard => 'Activando Tarjeta';

  @override
  String get financeAlmostReady => 'Ya casi está lista';

  @override
  String get financeCardActivationInProgress =>
      'Activación de tarjeta en progreso...';

  @override
  String get financeCardActivationUnderReview =>
      'La activación de la tarjeta está en revisión. Por favor espera.';

  @override
  String get financeCardVerificationFailed =>
      'Error en la verificación de la tarjeta. Por favor contacta a soporte.';

  @override
  String get financeCardCreationFailed =>
      'Error al crear la tarjeta. Por favor intenta nuevamente.';

  @override
  String get financeCardActivationSuccess => '¡Tarjeta activada con éxito!';

  @override
  String get financeCardActivationError =>
      'Error al activar la tarjeta. Por favor intenta nuevamente.';

  @override
  String get financeCompleteIdentityVerification =>
      'Completa tu verificación de identidad para crear y administrar tarjetas virtuales.';

  @override
  String get financeKYCVerificationRequired => 'Verificación KYC requerida';

  @override
  String get financeKYCActivationInProgress =>
      'Activación de tarjeta en progreso...';

  @override
  String get financeKYCUnderReview =>
      'La activación de la tarjeta está en revisión. Por favor espera.';

  @override
  String get financeKYCVerificationFailed =>
      'Error en la verificación de la tarjeta. Contacta a soporte.';

  @override
  String get financeKYCCardCreationFailed =>
      'Error al crear la tarjeta. Por favor intenta nuevamente.';

  @override
  String get financeKYCFailedToActivate => 'Error al activar la tarjeta';

  @override
  String get financeKYCRejected => 'KYC Rechazado';

  @override
  String get financeKYCRejectedMessage =>
      'Tu verificación de identidad ha sido rechazada. Por favor revisa tus datos e intenta nuevamente.';

  @override
  String get financeKYCCommonIssues => 'Problemas comunes:';

  @override
  String get financeKYCUnderReviewTitle => 'En revisión';

  @override
  String get financeKYCUnderReviewMessage =>
      'Tu solicitud KYC está siendo revisada. Esto normalmente toma de 1 a 3 días hábiles.';

  @override
  String get financeKYCPendingTitle => 'Verificación en Progreso';

  @override
  String get financeKYCPendingMessage =>
      'Estamos revisando tus documentos. Serás notificado cuando se complete la verificación.';

  @override
  String get financeKYCDocumentUploaded => 'Documento cargado';

  @override
  String get financeKYCIdentityVerified => 'Identidad Verificada';

  @override
  String get financeKYCPersonalInfoVerified =>
      'Información Personal Verificada';

  @override
  String get financeKYCAddressVerified => 'Dirección Verificada';

  @override
  String get financeKYCStartVerification => 'Iniciar Verificación';

  @override
  String get financeKYCContinueVerification => 'Continuar Verificación';

  @override
  String get financeKYCCheckStatus => 'Verificar estado';

  @override
  String get financeKYCTryAgain => 'Intentar Nuevamente';

  @override
  String get financeCardStatusActive => 'Activa';

  @override
  String get financeCardStatusInactive => 'Inactiva';

  @override
  String get financeCardStatusFrozen => 'Congelada';

  @override
  String get financeCardStatusUnderReview => 'En Revisión';

  @override
  String get financeCardStatusFailed => 'Error de Verificación';

  @override
  String get financeCardActivationTitle => 'Activando Tarjeta';

  @override
  String get financeCardAlmostReady => 'Ya casi está lista';

  @override
  String get financeCardActivationMessage =>
      'Su tarjeta se está activando. Esto puede tardar unos momentos. Por favor no cierre la aplicación.';

  @override
  String get financeCardActivationCancel => 'Cancelar';

  @override
  String get financeCardActivationActivate => 'Activar Ahora';

  @override
  String get financeCardUnderReview =>
      'La activación de la tarjeta está en revisión. Por favor espera.';

  @override
  String get financeUSD => 'USD';

  @override
  String get financeViewAll => 'Ver todo';

  @override
  String get financeNoAccount => 'Sin cuenta';

  @override
  String get financeCreateNewAccountSubtitle =>
      'Crea una nueva cuenta para empezar';

  @override
  String get financeCreateNewAccount => 'Crear nueva cuenta';

  @override
  String get financeSourceOfFundsQuestionnaire =>
      'Completa el cuestionario de origen de fondos';

  @override
  String get financeSanctionsScreen => 'Completa la verificación de sanciones';

  @override
  String get financePEPScreen =>
      'Completa la verificación PEP (Persona Políticamente Expuesta)';

  @override
  String get financeBlocklistLookup =>
      'Completa la verificación de lista de bloqueo';

  @override
  String get financeAdverseMediaScreen =>
      'Completa la verificación de medios adversos';

  @override
  String get financeGovernmentIDVerification =>
      'Completa la verificación de identificación oficial';

  @override
  String get financeServiceNotAvailableInRegion =>
      'Este servicio no está disponible en tu región';

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
  String get financeNationalID => 'Número de identificación nacional';

  @override
  String get financeDriversLicense => 'Licencia de conducir';

  @override
  String get financeITIN => 'ID de contribuyente individual (ITIN)';

  @override
  String get financeCUIL => 'Código Único de Identificación Laboral (CUIL)';

  @override
  String get financeRUT => 'Rol Único Tributario (RUT)';

  @override
  String get financeNIT => 'Número de Identificación Tributaria (NIT)';

  @override
  String get financeCPR => 'Registro Civil Personal (CPR)';

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
  String get financeSelectImageSource => 'Selecciona la fuente de la imagen';

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
      'Debes aceptar los términos de servicio antes de actualizar la información del cliente.';

  @override
  String get financeAcceptTerms => 'Acepto los términos de servicio';

  @override
  String get financeTermsAccepted => 'Términos de servicio aceptados';

  @override
  String get financeCustomerType => 'Tipo de Cliente';

  @override
  String get financeIndividual => 'Individual';

  @override
  String get financeCustomerTypeRequired => 'El tipo de cliente es obligatorio';

  @override
  String get financeEmail => 'Correo electrónico';

  @override
  String get financeBirthday => 'Fecha de nacimiento';

  @override
  String get financeBirthDateRequired =>
      'La fecha de nacimiento es obligatoria';

  @override
  String get financeMinimumAge => 'Debes tener al menos 18 años';

  @override
  String get financeUploadFrontID => 'Subir identificación frontal';

  @override
  String get financeUploadBackID => 'Subir identificación trasera';

  @override
  String get financeUploadBothImages =>
      'Por favor sube ambas imágenes: frontal y trasera';

  @override
  String get financePrimaryIDRequired =>
      'Se requiere identificación principal (SSN/ITIN)';

  @override
  String get financeSSNLabel => 'Número de Seguro Social (SSN)';

  @override
  String get financeITINLabel => 'ID de contribuyente individual (ITIN)';

  @override
  String get financePrimaryIDRequiredUSA =>
      'Se requiere identificación principal para EE.UU.';

  @override
  String get financeSelectPrimaryIDType =>
      'Por favor selecciona un tipo de identificación principal';

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
      'Por favor selecciona un tipo de identificación secundaria';

  @override
  String get financeIDTypeRequired =>
      'El tipo de identificación es obligatorio';

  @override
  String get financeSelectIDType =>
      'Por favor selecciona un tipo de identificación';

  @override
  String get financeNumber => 'Número';

  @override
  String get financeNumberRequired => 'El número es obligatorio';

  @override
  String get financeEditCustomer => 'Editar cliente';

  @override
  String get financePleaseWait => 'Por favor espera…';

  @override
  String get financeUpdate => 'Actualizar';

  @override
  String get financeChooseImageSource => 'Elige cómo deseas agregar tu imagen:';

  @override
  String get financeImageError => 'Error en la imagen';

  @override
  String financeFailedToPickImage(String error) {
    return 'Error al seleccionar imagen: $error';
  }

  @override
  String get financeChoose => 'Elige';

  @override
  String get financeTermsRequired => 'Términos requeridos';

  @override
  String get financeAcceptToSBeforeUpdate =>
      'Por favor acepta los Términos de Servicio antes de actualizar';

  @override
  String get financeUpdateFailed => 'Actualización fallida';

  @override
  String financePleaseComplete(String fields) {
    return 'Por favor completa: $fields';
  }

  @override
  String get financeTakeNewPhoto => 'Tomar una nueva foto';

  @override
  String get financeChooseExistingPhotos => 'Elegir de fotos existentes';

  @override
  String get financeCameraAccessRequired =>
      'Se requiere acceso a la cámara para tomar fotos. Por favor habilita el acceso e inténtalo de nuevo.';

  @override
  String get financeGalleryAccessRequired =>
      'Se requiere acceso a la galería para seleccionar imágenes. Por favor habilita el acceso e inténtalo de nuevo.';

  @override
  String get financeCameraAccessDenied =>
      'El acceso a la cámara fue denegado permanentemente. Por favor habilita el permiso de cámara en la configuración del dispositivo.';

  @override
  String get financeGalleryAccessDenied =>
      'El acceso a la galería fue denegado permanentemente. Por favor habilita el permiso de fotos/almacenamiento en la configuración del dispositivo.';

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
      'Se requiere permiso de galería para seleccionar imágenes. Habilita el permiso en la configuración del dispositivo.';

  @override
  String get financeFailedToAccessImage => 'Error al acceder a la imagen';

  @override
  String get financeCameraAccessWasDenied =>
      'El acceso a la cámara fue denegado. Habilita el permiso de cámara en la configuración.';

  @override
  String get financeGalleryAccessWasDenied =>
      'El acceso a la galería fue denegado. Habilita el permiso de fotos/almacenamiento en la configuración.';

  @override
  String get financeNoCameraAvailable =>
      'No hay cámara disponible en este dispositivo.';

  @override
  String get financeInvalidImageFile =>
      'El archivo seleccionado no es una imagen válida. Por favor elige otro archivo.';

  @override
  String get financeUnableToTakePhoto =>
      'No se pudo tomar la foto. Intenta nuevamente.';

  @override
  String get financeUnableToSelectImage =>
      'No se pudo seleccionar la imagen. Intenta nuevamente.';

  @override
  String get financeFailedToCreateCustomer => 'Error al crear el cliente';

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
  String get financeCountryRequired => 'El país es obligatorio';

  @override
  String get financeIdentificationtype => 'Tipo de identificación';

  @override
  String get financeUploadBothImagesSecondaryID =>
      'Por favor sube ambas imágenes: frontal y trasera de la identificación secundaria';

  @override
  String get financeUploadBothIDImages =>
      'Por favor sube ambas imágenes de identificación: frontal y trasera';

  @override
  String get financeAcceptToSBeforeCreating =>
      'Por favor acepta los Términos de Servicio antes de crear un cliente';

  @override
  String get financeWalletDashboard => 'Panel de billetera';

  @override
  String get financeVirtualCards => 'Tarjetas virtuales';

  @override
  String get financeCreateNewWallet => 'Crear nueva billetera';

  @override
  String get financeAllWalletsCreated =>
      'Todas las billeteras disponibles ya han sido creadas';

  @override
  String get financeCustomerIDNotFound =>
      'ID de cliente no encontrado. Por favor inicia sesión nuevamente.';

  @override
  String get financeFailedToCreateWallet => 'Error al crear la billetera';

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
      'Necesitamos información tuya para configurar tu billetera';

  @override
  String get financeNoWalletsMessage =>
      'Aún no tienes billeteras. Crea tu primera billetera para comenzar.';

  @override
  String get financeRetry => 'Reintentar';

  @override
  String get financeWalletOverview => 'Resumen de billetera';

  @override
  String get financeManageAssets =>
      'Administra tus activos digitales y transacciones';

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
      'Dirección de destino o parámetros inválidos. Por favor verifica tu entrada.';

  @override
  String get financeAuthenticationError =>
      'Error de autenticación. Intenta iniciar sesión nuevamente.';

  @override
  String get financeInsufficientBalance =>
      'Saldo insuficiente para esta transacción.';

  @override
  String get financeNetworkError =>
      'Error de red. Verifica tu conexión a internet.';

  @override
  String get financeRequestTimeout =>
      'Tiempo de espera agotado. Por favor intenta nuevamente.';

  @override
  String get financeRecentTransactions => 'Transacciones recientes';

  @override
  String get financeNoTransactionsYet => 'Aún no hay transacciones o depósitos';

  @override
  String get financeTransactionsWillAppear =>
      'Tus transacciones y depósitos aparecerán aquí';

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
  String get financeVerifyAddress => 'Verifica la dirección antes de enviar';

  @override
  String get financeLoadingTransfers => 'Cargando transferencias...';

  @override
  String get financeNoTransfersYet => 'Aún no hay transferencias';

  @override
  String get financeTransfersWillAppear =>
      'Tus transferencias de criptomonedas aparecerán aquí';

  @override
  String get financeCryptoTransfer => 'Transferencia de criptomonedas';

  @override
  String get financeNoItemsFound => 'No se encontraron elementos';

  @override
  String get financePleaseEnterAmount => 'Por favor ingresa el monto';

  @override
  String get financePleaseEnterAllFields =>
      'Por favor completa todos los campos';

  @override
  String get financeCustomerNotFound =>
      'Cliente no encontrado. Por favor intenta nuevamente.';

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
  String get financeImportantDepositMessage =>
      'Mensaje importante sobre depósito';

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
  String get financeOK => 'OK';

  @override
  String get financeTransferFailed => 'Transferencia fallida';

  @override
  String get financeDepositFailed => 'Depósito fallido';

  @override
  String get financeDestination => 'Destino';

  @override
  String get financeSelectBlockchain => 'Seleccione la blockchain para su';

  @override
  String get financeNewWallet => 'nueva billetera';

  @override
  String get financeCryptocurrencySearch => 'Buscar criptomonedas';

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
  String get financeEnterCode => 'Ingrese Código';

  @override
  String get financeEnter4DigitCode =>
      'Ingrese su código de transacción de 4 dígitos para continuar';

  @override
  String get financeForgotPIN => 'Olvidó su PIN?';

  @override
  String get financeVerifyOTP => 'Verificar OTP';

  @override
  String get financeEnter6DigitCodeSent =>
      'Ingrese el código de 6 dígitos enviado a';

  @override
  String get financeVerify => 'Verificar';

  @override
  String get financeDidntReceiveCode => 'No recibió el código? ';

  @override
  String get financeResend => 'Reenviar';

  @override
  String financeResendIn(Object seconds) {
    return 'Reenviar en ${seconds}s';
  }

  @override
  String get financeOTPMust6Digits => 'El OTP debe tener 6 dígitos';

  @override
  String get financeWrongOTP =>
      'OTP incorrecto. Por favor ingrese el OTP correcto nuevamente.';

  @override
  String get financeInvalidOTPRestart =>
      'OTP inválido. Por favor inicie el registro nuevamente.';

  @override
  String get financeSendingOTP => 'Enviando OTP';

  @override
  String get financePleaseWaitSendingCode =>
      'Por favor espere mientras enviamos el código de verificación a su correo electrónico';

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
      'Agregar dinero desde el banco a la billetera';

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
  String get financeWithdraw => 'Retirar';

  @override
  String get financeLoadingWallets => 'Cargando billeteras...';

  @override
  String get financeZeroBalance => '0.00 USD';

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
  String get financeHowMuch => 'Cuánto?';

  @override
  String get financeTransfer_money_to_any_user =>
      'Transferir dinero a cualquier usuario';

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
  String get financeExternalAccountStepBank => 'Info\nbancaria';

  @override
  String get financeExternalAccountStepPersonal => 'Info\npersonal';

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
  String get financeExternalAccountGoBackTitle => 'Volver?';

  @override
  String get financeExternalAccountGoBackMessage =>
      'Está seguro de que desea volver? Toda la información ingresada se perderá.';

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
      '¡Dirección actualizada con éxito!';

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
      'Comencemos una\n cuenta externa';

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
  String get financePayCryptoCardDetails => 'Detalles de la tarjeta';

  @override
  String get financePayCryptoBalanceOverview => 'Resumen de saldo';

  @override
  String get financePayCryptoCurrentBalance => 'Saldo actual';

  @override
  String get financePayCryptoAvailableBalance => 'Saldo disponible';

  @override
  String get financePayCryptoFreezeCard => 'Congelar tarjeta';

  @override
  String get financePayCryptoEnterReason => 'Ingresa el motivo para congelarla';

  @override
  String get financePayCryptoConfirmFreeze =>
      '¿Estás seguro de que deseas congelar esta tarjeta?';

  @override
  String get financePayCryptoFreeze => 'Congelar';

  @override
  String get financePayCryptoUnfreeze => 'Descongelar';

  @override
  String get financePayCryptoDeposit => 'Depósito';

  @override
  String get financePayCryptoCopyNumber => 'Copiar número';

  @override
  String get financePayCryptoCopyAll => 'Copiar todo';

  @override
  String get financePayCryptoSecurityTips => 'Consejos de seguridad';

  @override
  String get financePayCryptoCardNumberCopied =>
      'Número de tarjeta copiado al portapapeles';

  @override
  String get financePayCryptoAllDetailsCopied =>
      'Todos los detalles de la tarjeta copiados al portapapeles';

  @override
  String get financePayCryptoNoCards => 'Sin tarjetas';

  @override
  String get financePayCryptoCreateNewCard =>
      'Crea una nueva tarjeta para comenzar';

  @override
  String get financePayCryptoCreateANewCard => 'Crear una nueva tarjeta';

  @override
  String get financePayCryptoHistory => 'Historial';

  @override
  String get financePayCryptoKYCVerification => 'Verificación KYC';

  @override
  String get financeKYCSectionPersonalInfo => 'Info\nPersonal';

  @override
  String get financeKYCSectionAddress => 'Dirección';

  @override
  String get financeKYCSectionDocuments => 'Documentos';

  @override
  String get financeKYCSectionReview => 'Revisar y enviar';

  @override
  String get financeKYCBtnPrevious => 'Anterior';

  @override
  String get financeKYCBtnNext => 'Siguiente';

  @override
  String get financeKYCBtnSubmit => 'Enviar KYC';

  @override
  String get financeKYCBtnCancel => 'Cancelar';

  @override
  String get financePayCryptoPersonalInfo => 'Información Personal';

  @override
  String get financePayCryptoAddress => 'Dirección';

  @override
  String get financePayCryptoDocument => 'Documento';

  @override
  String get financePayCryptoReview => 'Revisión';

  @override
  String get financePayCryptoFirstName => 'Nombre';

  @override
  String get financePayCryptoLastName => 'Apellido';

  @override
  String get financePayCryptoFirstNameRequired => 'Por favor ingresa tu nombre';

  @override
  String get financePayCryptoFirstNameMinLength =>
      'El nombre debe tener al menos 3 caracteres';

  @override
  String get financePayCryptoLastNameRequired =>
      'Por favor ingresa tu apellido';

  @override
  String get financePayCryptoLastNameMinLength =>
      'El apellido debe tener al menos 3 caracteres';

  @override
  String get financePayCryptoZipMinLength =>
      'El código postal debe tener al menos 4 caracteres';

  @override
  String get financePayCryptoPleaseEnterFirstName =>
      'Por favor ingresa tu nombre';

  @override
  String get financePayCryptoPleaseEnterLastName =>
      'Por favor ingresa tu apellido';

  @override
  String get financePayCryptoPleaseEnterEmail =>
      'Por favor ingresa tu correo electrónico';

  @override
  String get financePayCryptoPleaseEnterValidEmail =>
      'Por favor ingresa un correo electrónico válido';

  @override
  String get financePayCryptoDocNumberMinLength =>
      'El número de documento debe tener al menos 4 caracteres';

  @override
  String get financePayCryptoEmail => 'Correo Electrónico';

  @override
  String get financePayCryptoEmailRequired =>
      'Por favor ingresa tu correo electrónico';

  @override
  String get financePayCryptoEmailInvalid =>
      'Por favor ingresa un correo electrónico válido';

  @override
  String get financePayCryptoCountryRequired => 'El país es obligatorio';

  @override
  String get financePayCryptoCountryCode => 'Código de País';

  @override
  String get financePayCryptoPhoneNumber => 'Número de Teléfono';

  @override
  String get financePayCryptoPhoneRequired =>
      'Por favor ingresa tu número de teléfono';

  @override
  String get financePayCryptoPhoneMinLength =>
      'El número de teléfono debe tener al menos 5 dígitos';

  @override
  String get financePayCryptoGender => 'Género';

  @override
  String get financePayCryptoMale => 'Masculino';

  @override
  String get financePayCryptoFemale => 'Femenino';

  @override
  String get financePayCryptoDateOfBirth => 'Fecha de Nacimiento';

  @override
  String get financePayCryptoDobRequired =>
      'La fecha de nacimiento es obligatoria';

  @override
  String get financePayCryptoAddressRequired => 'La dirección es obligatoria';

  @override
  String get financePayCryptoAddressMinLength =>
      'La dirección debe tener al menos 5 caracteres';

  @override
  String get financePayCryptoCity => 'Ciudad';

  @override
  String get financePayCryptoCityRequired => 'La ciudad es obligatoria';

  @override
  String get financePayCryptoCountry => 'País';

  @override
  String get financePayCryptoStateRequired =>
      'El estado/provincia es obligatorio';

  @override
  String get financePayCryptoStateProvince => 'Estado/Provincia';

  @override
  String get financePayCryptoSelectCountryFirst => 'Primero selecciona un país';

  @override
  String get financePayCryptoZipCode => 'Código Postal';

  @override
  String get financePayCryptoZipRequired => 'El código postal es obligatorio';

  @override
  String get financePayCryptoDocumentType => 'Tipo de Documento';

  @override
  String get financePayCryptoPassport => 'Pasaporte';

  @override
  String get financePayCryptoIdCard => 'Cédula de Ciudadanía';

  @override
  String get financePayCryptoDriversLicense => 'Licencia de Conducir';

  @override
  String get financePayCryptoDocumentNumber => 'Número de Documento';

  @override
  String get financePayCryptoDocumentNumberRequired =>
      'Por favor ingresa el número de documento';

  @override
  String get financePayCryptoFrontDocument => 'Frente del Documento';

  @override
  String get financePayCryptoBackDocument => 'Reverso del Documento';

  @override
  String get financePayCryptoSelfieWithDocument => 'Selfie con Documento';

  @override
  String get financePayCryptoUploadPhoto => 'Subir Foto';

  @override
  String get financePayCryptoTakePhoto => 'Tomar Foto';

  @override
  String get financePayCryptoChooseFromGallery => 'Elegir de la Galería';

  @override
  String get financePayCryptoCancel => 'Cancelar';

  @override
  String get financePayCryptoNext => 'Siguiente';

  @override
  String get financePayCryptoPrevious => 'Anterior';

  @override
  String get financePayCryptoSubmit => 'Enviar';

  @override
  String get financePayCryptoReviewYourInfo => 'Revisa tu Información';

  @override
  String get financePayCryptoPleaseReview =>
      'Por favor revisa tu información antes de enviar.';

  @override
  String financePayCryptoDocumentRequired(Object documentType) {
    return '$documentType es obligatorio';
  }

  @override
  String get financePayCryptoKYCSubmitConfirmTitle => 'Enviar Información KYC';

  @override
  String get financePayCryptoKYCSubmitConfirmMessage =>
      'Estás seguro de que deseas enviar tu información KYC? No podrás hacer cambios después del envío.';

  @override
  String get financePayCryptoKYCSubmitSuccess =>
      '¡Información KYC enviada con éxito!';

  @override
  String get financePayCryptoKYCSubmitError =>
      'Error al enviar la información KYC. Por favor intenta nuevamente.';

  @override
  String get financePayCryptoKYCProcessing =>
      'Procesando tu información KYC. Esto puede tardar unos minutos...';

  @override
  String get financePayCryptoKYCUnderReviewTitle => 'En Revisión';

  @override
  String get financePayCryptoKYCUnderReviewMessage =>
      'Tu información KYC está siendo revisada. Te notificaremos cuando sea aprobada.';

  @override
  String get financePayCryptoKYCAwaitingApproval => 'Esperando Aprobación';

  @override
  String get financePayCryptoKYCDocumentsReceived => 'Documentos Recibidos';

  @override
  String get financePayCryptoKYCDocumentsUnderReview =>
      'Documentos en Revisión';

  @override
  String get financePayCryptoKYCApprovalPending => 'Aprobación Pendiente';

  @override
  String get financePayCryptoKYCCheckStatus => 'Verificar Estado';

  @override
  String get financePayCryptoKYCBackToHome => 'Volver al Inicio';

  @override
  String get financeKYCFirstName => 'Nombre';

  @override
  String get financeKYCLastName => 'Apellido';

  @override
  String get financeKYCEmail => 'Correo Electrónico';

  @override
  String get financeKYCCountryCode => 'Código de País';

  @override
  String get financeKYCPhoneNumber => 'Número de Teléfono';

  @override
  String get financeKYCGender => 'Género';

  @override
  String get financeKYCMale => 'Masculino';

  @override
  String get financeKYCFemale => 'Femenino';

  @override
  String get financeKYCDateOfBirth => 'Fecha de Nacimiento';

  @override
  String get financeKYCAddress => 'Dirección';

  @override
  String get financeKYCCity => 'Ciudad';

  @override
  String get financeKYCState => 'Estado/Provincia';

  @override
  String get financeKYCZipCode => 'Código Postal';

  @override
  String get financeKYCSelectCountryFirst => 'Primero selecciona un país';

  @override
  String get financePayCryptoPleaseEnterCountryCode =>
      'Por favor ingresa el código de país';

  @override
  String get financePayCryptoPleaseEnterPhoneNumber =>
      'Por favor ingresa tu número de teléfono';

  @override
  String get financePayCryptoKYCUnderReview => 'KYC en Revisión';

  @override
  String get financePayCryptoDefaultCard => 'Tarjeta predeterminada';

  @override
  String get financePayCryptoUseAsDefault =>
      'Usar esta tarjeta como predeterminada';

  @override
  String get financePayCryptoContactlessPayment => 'Pago sin contacto';

  @override
  String get financePayCryptoEnableContactless =>
      'Habilitar pagos sin contacto';

  @override
  String get financePayCryptoPINCode => 'Código PIN';

  @override
  String get financePayCryptoAskPINWhenPaying =>
      'Solicitar código PIN al pagar';

  @override
  String get financePayCryptoSpending => 'Gasto';

  @override
  String get financePayCryptoTransactionHistory => 'Transacción';

  @override
  String get financeExternalAccountPleaseCreateCustomer =>
      'Por favor, crea un perfil de cliente primero para manejar cuentas externas';

  @override
  String get financeExternalAccountWeNeedInfo =>
      'Necesitamos información tuya\npara configurar la cuenta externa';

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
      'Detalles de la dirección de liquidación';

  @override
  String get financeCreateLiquidationAddress =>
      'Crear dirección de liquidación';

  @override
  String get financeLetsStartLiquidation =>
      'Empecemos\nuna dirección de liquidación';

  @override
  String get financeWeNeedInfoLiquidation =>
      'Necesitamos tu información para configurar una dirección de liquidación';

  @override
  String get financeManageLiquidationAddresses =>
      'Administra direcciones de liquidación de criptomonedas para conversiones automáticas';

  @override
  String get financeLoadingLiquidationAddresses =>
      'Cargando direcciones de liquidación...';

  @override
  String get financeClientReferenceID => 'ID de referencia del cliente';

  @override
  String get financeClientReferenceIDRequired =>
      'El ID de referencia del cliente es obligatorio';

  @override
  String get financeWireMessage => 'Mensaje de transferencia';

  @override
  String get financeWireMessageRequired =>
      'El mensaje de transferencia es obligatorio';

  @override
  String get financeSelectCurrencyLabel => 'Seleccionar moneda';

  @override
  String get financeCurrencyRequired => 'La moneda es obligatoria';

  @override
  String get financeChain => 'Cadena';

  @override
  String get financeSelectChain => 'Seleccionar cadena';

  @override
  String get financeChainRequired => 'La cadena es obligatoria';

  @override
  String get financeSelectExternalAccount => 'Seleccionar cuenta externa';

  @override
  String get financeAddressInvalidWarning =>
      'La dirección de esta cuenta externa no es válida';

  @override
  String get financeAddressInformation => 'Información de la dirección';

  @override
  String get financeActiveBalance => 'Saldo activo';

  @override
  String get financePendingBalance => 'Saldo pendiente';

  @override
  String get financeBalanceNotAvailable =>
      'Información del saldo no disponible';

  @override
  String get financeTransactionHistory => 'Historial de transacciones';

  @override
  String get financeNoTransactions => 'Sin transacciones';

  @override
  String get financeNoDrainTransactions =>
      'No se encontraron transacciones de retiro para esta dirección';

  @override
  String get financePaymentRail => 'Riel de pago';

  @override
  String get financeDestinationCurrencyLabel => 'Moneda de destino';

  @override
  String get financeViewLiquidationInfo =>
      'Ver información de la dirección de liquidación e historial de transacciones';

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
  String get financeCustomerRequired => 'Cliente obligatorio';

  @override
  String get financePleaseCreateCustomerFirst =>
      'Por favor, crea primero una cuenta de cliente';

  @override
  String get financeCreateVirtualAddress => 'Crear dirección virtual';

  @override
  String get financeDestinationAddressRequired =>
      'La dirección de destino es obligatoria';

  @override
  String get financeAddressTooShort => 'Dirección muy corta';

  @override
  String get financeSelectSourceCurrency => 'Seleccionar moneda de origen';

  @override
  String get financeSelectCurrencyRequired =>
      'Seleccionar moneda es obligatorio';

  @override
  String get financeSelectDestinationChain => 'Seleccionar cadena de destino';

  @override
  String get financeDestinationChainRequired =>
      'La cadena de destino es obligatoria';

  @override
  String get financeSelectDestinationCurrency =>
      'Seleccionar moneda de destino';

  @override
  String get financeDestinationCurrencyRequired =>
      'La moneda de destino es obligatoria';

  @override
  String get financeFailedToCreateVirtualAccount =>
      'Error al crear cuenta virtual';

  @override
  String get financeInvalidPINTryAgain =>
      'PIN inválido. Por favor, intenta de nuevo.';

  @override
  String get financePINVerificationFailedTryAgain =>
      'Falló la verificación del PIN. Por favor, intenta de nuevo.';

  @override
  String get financeDetails => 'Detalles';

  @override
  String get financeAccountNumberCopiedShort => 'Número de cuenta copiado';

  @override
  String get financeAccountNumberCopied =>
      'Número de cuenta copiado al portapapeles';

  @override
  String get financeVirtualAccountDetails => 'Detalles de la cuenta virtual';

  @override
  String get financeTransferDetails => 'Detalles de la transferencia';

  @override
  String get financeVirtualAccount => 'Cuenta Virtual';

  @override
  String get financeDepositReceived => 'Depósito Recibido';

  @override
  String get financeBankInformation => 'Información bancaria';

  @override
  String get financeBeneficiaryInformation => 'Información del beneficiario';

  @override
  String get financeBeneficiaryAddress => 'Dirección del beneficiario';

  @override
  String get financeDestinationDetails => 'Detalles de destino';

  @override
  String get financeLetsStartVirtualAccount => 'Empecemos\nuna cuenta virtual';

  @override
  String get financeWeNeedInfoVirtualAccount =>
      'Necesitamos tu información\npara configurar la cuenta virtual';

  @override
  String get financePayCryptoCardActivationUnderReview =>
      'La activación de la tarjeta está en revisión';

  @override
  String get financePayCryptoCardVerificationFailed =>
      'Falló la verificación de la tarjeta';

  @override
  String get financePayCryptoCardCreationFailed =>
      'Falló la creación de la tarjeta';

  @override
  String get financePayCryptoCardReadyActivation =>
      'Tu tarjeta está lista para activación';

  @override
  String get financePayCryptoActivateToAccess =>
      'Activa tu tarjeta para acceder a todas las funciones';

  @override
  String get financePayCryptoKYCCompletedSuccess =>
      '¡KYC completado exitosamente!';

  @override
  String get financePayCryptoFailedToCreateCard => 'Error al crear la tarjeta';

  @override
  String get financePayCryptoErrorLoadingCard => 'Error al cargar la tarjeta';

  @override
  String get financePayCryptoAccountNotFound =>
      'Número de cuenta no encontrado';

  @override
  String get financeMain_Wallet => 'Billetera';

  @override
  String get financeResetYourPIN => 'Restablecer tu PIN';

  @override
  String get financeEnterOTPAndNewPIN =>
      'Ingresa el OTP enviado a tu correo y establece tu nuevo PIN';

  @override
  String get financeEnterNewPINToReset =>
      'Ingresa tu nuevo PIN para restablecerlo';

  @override
  String get financeOTPCode => 'Código OTP';

  @override
  String get financeEnter6DigitOTP => 'Ingresa el OTP de 6 dígitos';

  @override
  String get financeNewPIN => 'Nuevo PIN';

  @override
  String get financeConfirmPIN => 'Confirmar PIN';

  @override
  String get financePINMust4Digits => 'El PIN debe tener 4 dígitos';

  @override
  String get financePINsDoNotMatch => 'Los PIN no coinciden';

  @override
  String get financeOTPSentToEmail => 'OTP enviado a tu correo electrónico';

  @override
  String get subscriptionInformation => 'Información de suscripción';

  @override
  String get subscriptionMessage =>
      'Estás a punto de descargar la versión beta de Be-MindPower. Después de probar la cuenta bancaria, billetera y servicios de tarjeta de débito, se aplicará un cargo inicial de 30 USD. Si decides continuar, la suscripción será de 17,5 USD por mes. Si estás de acuerdo, presiona para continuar.';

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
      'Para garantizar que tu pago se reciba correctamente, solo aceptamos transferencias en USDC (USD Coin). Los pagos enviados en otras criptomonedas no podrán ser acreditados ni procesados.';

  @override
  String get iAgree => 'Acepto';

  @override
  String get noCountriesAvailable => 'No hay países disponibles';

  @override
  String get noCountriesFound => 'No se han encontrado países';

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
  String get birthday => 'Fecha de nacimiento';

  @override
  String get sunday => 'Do';

  @override
  String get monday => 'Lu';

  @override
  String get tuesday => 'Ma';

  @override
  String get wednesday => 'Mi';

  @override
  String get thursday => 'Ju';

  @override
  String get friday => 'Vi';

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
      'Error al registrar el cliente después de varios intentos';

  @override
  String get financeErrorOTPVerificationFailed =>
      'Error al verificar el OTP después de varios intentos';

  @override
  String get financeErrorCustomerStatusFailed =>
      'Error al obtener el estado del cliente';

  @override
  String get financeErrorKYCLinkFailed => 'Error al obtener el enlace KYC';

  @override
  String get financeErrorTermsAcceptFailed =>
      'Error al aceptar los términos de servicio';

  @override
  String get financeErrorUsernameCheckFailed =>
      'Error al verificar el nombre de usuario';

  @override
  String get financeErrorVerificationStatusFailed =>
      'Error al obtener el estado de verificación del cliente';

  @override
  String get financeErrorCustomerUpdateFailed =>
      'Error al actualizar el cliente';

  @override
  String get financeErrorKYCCreateFailed => 'Error al crear el enlace KYC';

  @override
  String get financeErrorKYCStatusFailed => 'Error al obtener el estado KYC';

  @override
  String get financeErrorCustomerDeleteFailed => 'Error al eliminar el cliente';

  @override
  String get financeErrorCustomerIDNotFound =>
      'ID de cliente no encontrado. Por favor inicia sesión nuevamente.';

  @override
  String get financeErrorNoCustomerID =>
      'No hay ID de cliente disponible. Por favor asegúrate de haber iniciado sesión.';

  @override
  String get financeErrorPINVerificationFailed => 'Verificación de PIN fallida';

  @override
  String get financeErrorInvalidPIN => 'PIN inválido';

  @override
  String get financeErrorWalletCreateFailed => 'Error al crear la billetera';

  @override
  String get financeErrorWalletDetailsFailed =>
      'Error al obtener detalles de la billetera';

  @override
  String get financeErrorWalletLoadFailed =>
      'Error al cargar billeteras del cliente';

  @override
  String get financeErrorTransferFailed => 'Transferencia fallida';

  @override
  String get financeErrorExternalTransferFailed =>
      'Transferencia desde cuenta externa fallida';

  @override
  String get financeErrorNoTransferHistory =>
      'No hay historial de transferencias disponible';

  @override
  String get financeErrorDepositFailed => 'Depósito fallido';

  @override
  String get financeErrorCustomerIDRequired =>
      'Se requiere ID de cliente para la transferencia';

  @override
  String get financeErrorCustomerIDRequiredDeposit =>
      'Se requiere ID de cliente para depósito';

  @override
  String get financeErrorNetworkUnavailable => 'Conexión de red no disponible';

  @override
  String get financeErrorInstitutionBalanceFailed =>
      'Error al obtener saldo de la institución';

  @override
  String get financeErrorCardTypesFailed => 'Error al obtener tipos de tarjeta';

  @override
  String get financeErrorExchangeRatesFailed =>
      'Error al obtener tasas de cambio';

  @override
  String get financeErrorCurrencyEstimationFailed =>
      'Error al calcular la estimación de moneda';

  @override
  String get financeErrorCryptoEstimationFailed =>
      'Error al calcular la estimación de criptomoneda';

  @override
  String get financeErrorKYCSubmitFailed => 'Error al enviar KYC';

  @override
  String get financeErrorCardCreateFailed => 'Error al crear la tarjeta';

  @override
  String get financeErrorCardBalanceFailed =>
      'Error al obtener saldo de la tarjeta';

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
      'Error al obtener estado del depósito';

  @override
  String get financeErrorDepositTransactionsFailed =>
      'Error al obtener transacciones de depósito';

  @override
  String get financeSecurityPINSetSuccess => 'PIN configurado correctamente';

  @override
  String get financeSecurityPINResetSuccess => 'PIN restablecido correctamente';

  @override
  String get financeSecurityCustomerIDNotFound =>
      'ID de cliente no encontrado. Por favor inicia sesión nuevamente.';

  @override
  String get financeSecurityPINVerificationCompleted =>
      'Verificación de PIN completada';

  @override
  String get financeSecurityPINVerificationFailed =>
      'Verificación de PIN fallida';

  @override
  String get financeSecurityOTPSentSuccess => 'OTP enviado correctamente';

  @override
  String get financeSecurityOTPVerifiedSuccess =>
      'OTP verificado correctamente';

  @override
  String get financeSecurityTokenGeneratedSuccess =>
      'Token generado correctamente';

  @override
  String get financeSecurityTokenGenerationFailed =>
      'Error al generar el token';

  @override
  String get financeSecurityRequestTimeout =>
      'Tiempo de espera agotado. Por favor verifica tu conexión de red';

  @override
  String get financeSecurityNetworkError =>
      'Error de red. No se puede conectar al servidor';

  @override
  String get financeSecurityNoTokenFound =>
      'No se encontró token de seguridad. Por favor genera el token primero.';

  @override
  String get financeSecurityCSRFRetrievedSuccess =>
      'Token CSRF recuperado correctamente';

  @override
  String get financeSecurityCSRFRetrievalFailed =>
      'Error al obtener el token CSRF';

  @override
  String get financeSecurityJWTExpiredRefreshFailed =>
      'Token JWT expirado y actualización fallida';

  @override
  String get financeSecurityMissingJWTToken =>
      'Falta token JWT. Por favor genera el token de seguridad primero.';

  @override
  String get financeSecuritySignatureGeneratedSuccess =>
      'Firma generada correctamente';

  @override
  String get financeErrorServiceUnavailable =>
      'Servicio temporalmente no disponible. Por favor intenta nuevamente.';

  @override
  String get financeErrorInvalidRequest =>
      'Solicitud inválida. Por favor verifica tu información e intenta nuevamente.';

  @override
  String get financeUnknownError => 'Ocurrió un error desconocido';

  @override
  String get financeErrorAuthenticationFailed =>
      'Autenticación fallida. Por favor inicia sesión nuevamente.';

  @override
  String get financeErrorAccessDenied =>
      'Acceso denegado. Por favor contacta al soporte.';

  @override
  String get financeErrorToSLinkFailed =>
      'No se pudo generar el enlace de términos de servicio. Por favor intenta nuevamente.';

  @override
  String get financeErrorToSError => 'Error de términos de servicio';

  @override
  String get financeLoadingToS => 'Cargando términos de servicio...';

  @override
  String get financeCompleted => 'Completado';

  @override
  String get financeSubmitted => 'Enviado';

  @override
  String get financeInReview => 'En revisión';

  @override
  String get financeReceived => 'Recibido';

  @override
  String get financeScheduled => 'Programado';

  @override
  String get financeAwaiting => 'En espera';

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
  String get financeTransactionInfo => 'Información de la transacción';

  @override
  String get financeType => 'Tipo';

  @override
  String get financeReceipt => 'Recibo';

  @override
  String get financeInitialAmount => 'Monto inicial';

  @override
  String get financeFinalAmount => 'Monto final';

  @override
  String get financeSource => 'Fuente';

  @override
  String get financeSender => 'Remitente';

  @override
  String get financeBlockchain => 'Blockchain';

  @override
  String get financeTxHash => 'Hash de la transacción';

  @override
  String get financeTransactionDetails => 'Detalles de la transacción';

  @override
  String get financeStreetAddressRequired => 'La dirección es obligatoria';

  @override
  String get financeCityRequired => 'La ciudad es obligatoria';

  @override
  String get financePleaseSelectCountry => 'Por favor selecciona un país';

  @override
  String get financeStateRequired => 'El estado es obligatorio';

  @override
  String get financePleaseSelectCountryFirst =>
      'Por favor selecciona un país primero';

  @override
  String get financeRequirementAddressOfIncorporation =>
      '(negocio) no se ha proporcionado la dirección registrada';

  @override
  String get financeRequirementAddressOfOperation =>
      '(negocio) no se ha proporcionado la dirección física';

  @override
  String get financeRequirementAddressOfResidence =>
      '(persona individual o asociada) no se ha proporcionado la dirección física';

  @override
  String get financeRequirementBusinessDescription =>
      '(negocio) no se ha proporcionado la descripción del negocio';

  @override
  String get financeRequirementBusinessFormationDocument =>
      '(negocio) no se ha proporcionado el documento de constitución incluyendo el propósito de formación';

  @override
  String get financeRequirementBusinessIndustry =>
      '(negocio) no se ha proporcionado el sector de la industria';

  @override
  String get financeRequirementBusinessName =>
      '(negocio) no se ha proporcionado el nombre legal del negocio';

  @override
  String get financeRequirementBusinessOwnershipDocument =>
      '(negocio) no se ha proporcionado documento que incluya información de propiedad';

  @override
  String get financeRequirementBusinessWebsite =>
      '(negocio) no se ha proporcionado el sitio web principal';

  @override
  String get financeRequirementControlPerson =>
      '(negocio) ninguna persona asociada tiene control definido como verdadero';

  @override
  String get financeRequirementDateOfBirth =>
      '(persona individual o asociada) no se ha proporcionado la fecha de nacimiento';

  @override
  String get financeRequirementEmailAddress =>
      'No se ha proporcionado correo electrónico';

  @override
  String get financeRequirementFirstName =>
      '(persona individual o asociada) no se ha proporcionado el nombre';

  @override
  String get financeRequirementHasBase =>
      'indica que otro endoso necesita ser aprobado para desbloquear el actual';

  @override
  String get financeRequirementHasSepa =>
      'indica que otro endoso necesita ser aprobado para desbloquear el actual';

  @override
  String get financeRequirementIsDao => '(negocio) no se ha indicado si es DAO';

  @override
  String get financeRequirementLastName =>
      '(persona individual o asociada) no se ha proporcionado el apellido';

  @override
  String get financeRequirementMinAge18 =>
      '(persona individual o asociada) no se ha podido confirmar que cumpla con la edad mínima requerida';

  @override
  String get financeRequirementMinAge60 =>
      '(persona individual o asociada) no se ha podido confirmar que cumpla con la edad mínima requerida';

  @override
  String get financeRequirementMinimalSourceOfFundsData =>
      '(negocio) no se ha proporcionado account_purpose ni source_of_funds';

  @override
  String get financeRequirementOwnershipStructureAttestation =>
      '(negocio) ninguna persona asociada ha proporcionado attested_ownership_structure_at';

  @override
  String get financeRequirementPersonaSanctionsScreen =>
      'no se ha realizado la verificación de sanciones';

  @override
  String get financeRequirementProofOfAddressDocument =>
      '(negocio) no se ha proporcionado documento que incluya proof_of_address como propósito';

  @override
  String get financeRequirementProofOfNatureOfBusinessDocument =>
      '(negocio) no se ha proporcionado documento que incluya proof_of_nature_of_business como propósito';

  @override
  String get financeRequirementProofOfNatureOfBusinessDocumentInPersona =>
      '(negocio) no se ha proporcionado documento que incluya proof_of_nature_of_business como propósito';

  @override
  String get financeRequirementSourceOfFundsQuestionnaire =>
      'el cliente requiere SoF pero no ha enviado el cuestionario completo';

  @override
  String get financeRequirementSubdivisionNotAkUsa =>
      'no se pudo confirmar la ubicación del cliente';

  @override
  String get financeRequirementSubdivisionNotNyUsa =>
      'no se pudo confirmar la ubicación del cliente';

  @override
  String get financeRequirementTaxIdentificationNumber =>
      'no se ha proporcionado un número de identificación fiscal válido para el país de residencia/operación';

  @override
  String get financeRequirementTermsOfServiceV1 =>
      'el cliente no ha aceptado la versión mínima requerida de los términos de servicio de Bridge';

  @override
  String get financeRequirementTermsOfServiceV2 =>
      'el cliente no ha aceptado la versión mínima requerida de los términos de servicio de Bridge';

  @override
  String get financeIssueBeneficialOwnerTooYoung =>
      'el individuo es menor de la edad mínima requerida (18 años)';

  @override
  String get financeIssueCustomerTooYoung =>
      'el individuo es menor de la edad mínima requerida (18 años)';

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
      'el perfil del cliente no cumple con los requisitos';

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
      'posible coincidencia en medios adversos; se requiere revisión manual';

  @override
  String get financeIssueWatchlistReportMatch =>
      'posible coincidencia en lista de vigilancia de sanciones; se requiere revisión manual';

  @override
  String get financeIssueBusinessFormationDocumentVerificationFailed =>
      'falló la verificación del documento de formación empresarial';

  @override
  String get financeIssueBusinessOwnershipDocumentVerificationFailed =>
      'falló la verificación del documento de propiedad empresarial';

  @override
  String get financeIssueGovernmentIdVerificationFailed =>
      'falló la verificación de identificación gubernamental';

  @override
  String get financeIssueFundsSourcedPensionOrRetirement =>
      'fondos provenientes de pensión/jubilación (marcado)';

  @override
  String get financeIssueHighExpectedMonthlyPayments =>
      'altos pagos mensuales esperados (marcado)';

  @override
  String get financeIssueHighRiskBusinessActivities =>
      'el cliente realiza actividades comerciales de alto riesgo';

  @override
  String get financeIssueOperatesInProhibitedCountries =>
      'el cliente opera en países prohibidos';

  @override
  String get financeIssuePoaInvalidDocumentType =>
      'tipo de documento de comprobante de domicilio no aceptado';

  @override
  String get financeIssuePoaManipulated =>
      'el comprobante de domicilio parece manipulado';

  @override
  String get financeIssuePoaNameMismatch =>
      'el nombre en el comprobante de domicilio no coincide con el del cliente';

  @override
  String get financeIssuePoaPast90Days =>
      'el comprobante de domicilio tiene más de 90 días';

  @override
  String get financeIssuePoaVirtualOrPoBox =>
      'el comprobante de domicilio es una dirección virtual o apartado postal (no permitido)';

  @override
  String get financeIssueProofOfNatureOfBusinessDocumentVerificationFailed =>
      'falló la verificación del comprobante de naturaleza del negocio';

  @override
  String get financeIssueSuspiciousPrimaryPurpose =>
      'el propósito principal parece sospechoso';

  @override
  String get financeIssueSuspiciousSourceOfFunds =>
      'la fuente de fondos parece sospechosa';

  @override
  String get financeIssueUnemployedUsingSalary =>
      'persona desempleada declarando ingresos por salario (marcado)';

  @override
  String get financeIssueBusinessLookupNoMatch =>
      'no se encontraron coincidencias en registros empresariales; se requiere revisión manual';

  @override
  String get financeIssueBusinessRegistryNoMatch =>
      'no se encontraron coincidencias en registros empresariales; se requiere revisión manual';

  @override
  String get financeIssueBusinessEinNoMatch => 'falló la validación del EIN';

  @override
  String get financeIssueBusinessWebsiteFailure =>
      'la validación del sitio web proporcionado falló; se requiere revisión manual';

  @override
  String get financeIssueDatabaseCheckFailedOnNameLast =>
      'la verificación en la base de datos falló en el apellido';

  @override
  String get financeIssueDatabaseCheckFailedOnSocialSecurityNumber =>
      'la verificación en la base de datos falló en el SSN';

  @override
  String get financeIssueDatabaseCheckFailedOnTinValidation =>
      'la verificación en la base de datos falló en la validación del TIN';

  @override
  String get financeIssueDatabaseCheckFailedOnHouseNumber =>
      'la verificación en la base de datos falló en el número de casa';

  @override
  String get financeIssueDatabaseCheckFailedOnStreetName =>
      'la verificación en la base de datos falló en el nombre de la calle';

  @override
  String get financeIssueDatabaseCheckFailedOnStreetType =>
      'la verificación en la base de datos falló en el tipo de calle';

  @override
  String get financeIssueDatabaseCheckFailedOnCity =>
      'la verificación en la base de datos falló en la ciudad';

  @override
  String get financeIssueDatabaseCheckFailedOnPostalCode =>
      'la verificación en la base de datos falló en el código postal';

  @override
  String get financeIssueDatabaseCheckFailedOnSubdivision =>
      'la verificación en la base de datos falló en la subdivisión';

  @override
  String get financeIssueDatabaseCheckFailedOnCountryCode =>
      'la verificación en la base de datos falló en el código de país';

  @override
  String get financeIssuePoaFailed =>
      'falló la verificación del comprobante de domicilio';

  @override
  String get financeIssueBlocklistCheckFailed =>
      'la información proporcionada corresponde a una persona que Bridge no apoyará';

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
  String get youAreConnected => '¡Estás conectado!';

  @override
  String youCanNowTalkTo(String contactName) {
    return 'Ahora puedes hablar con @$contactName';
  }

  @override
  String get goChat => 'ir al chat';

  @override
  String get verifyingOtherAccount => 'Verificando la \n otra cuenta';

  @override
  String waitingForContactToAccept(String contactName) {
    return 'Esperando a que $contactName \n acepte la invitación.';
  }

  @override
  String get creatingGroup => 'Creando grupo';

  @override
  String settingUpYourGroup(String groupName) {
    return 'Configurando tu grupo $groupName';
  }

  @override
  String get noInternetConnection => '¡Sin conexión a internet!';

  @override
  String get pleaseCheckYourInternetConnection =>
      'Por favor verifica tu conexión\na internet';

  @override
  String get enableWiFi => 'Activar WiFi';

  @override
  String get testingExternalAccountCreationAPI =>
      'Probando API de creación de cuenta externa';

  @override
  String get payload => 'Carga útil';

  @override
  String get responseStatus => 'Estado de respuesta';

  @override
  String get responseHeaders => 'Encabezados de respuesta';

  @override
  String get responseBody => 'Cuerpo de respuesta';

  @override
  String get successExternalAccountCreated =>
      '¡Éxito! Cuenta externa creada correctamente';

  @override
  String get responseStructure => 'Estructura de respuesta';

  @override
  String get errorDetails => 'Detalles del error';

  @override
  String get rawError => 'Error sin procesar';

  @override
  String get exception => 'Excepción';

  @override
  String get testingCustomerVerificationStatus =>
      'Probando estado de verificación del cliente';

  @override
  String get customerID => 'ID del cliente';

  @override
  String get customerFound => 'Cliente encontrado';

  @override
  String get hasAcceptedTerms => 'Términos aceptados';

  @override
  String get rejectionReasons => 'Razones de rechazo';

  @override
  String get requirementsDue => 'Requisitos pendientes';

  @override
  String get canCreateExternalAccounts => 'Puede crear cuentas externas';

  @override
  String get issuesPreventingExternalAccountCreation =>
      'Problemas que impiden la creación de cuenta externa:';

  @override
  String get termsOfServiceNotAccepted => 'Términos de servicio no aceptados';

  @override
  String get accountHasRejectionReasons => 'La cuenta tiene razones de rechazo';

  @override
  String get authFixCheckingClient => 'AuthFix: Verificando cliente';

  @override
  String get isLogged => 'está conectado';

  @override
  String get userID => 'ID de usuario';

  @override
  String get authFixStoredMatrixId => 'AuthFix: matrix_id almacenado';

  @override
  String get authFixFixingMatrixId => 'AuthFix: Corrigiendo matrix_id desde';

  @override
  String get authFixGeneratingTokens =>
      'AuthFix: Generando tokens para usuario';

  @override
  String get authFixJwtTokenGenerated =>
      'AuthFix: Token JWT generado y almacenado';

  @override
  String get authFixCsrfTokenGenerated =>
      'AuthFix: Token CSRF generado y actualización inicializada';

  @override
  String get authFixCsrfTokenFailed =>
      'AuthFix: Generación de token CSRF falló';

  @override
  String get authFixJwtTokenFailed => 'AuthFix: Generación de token JWT falló';

  @override
  String get authFixMatrixIdCorrect =>
      'AuthFix: Matrix ID correcto, no requiere corrección';

  @override
  String get authFixClientNotLoggedIn =>
      'AuthFix: Cliente no conectado o sin userID';

  @override
  String get authFixException => 'AuthFix: Excepción';

  @override
  String get autoEncryptionSetupFailed =>
      'Configuración automática de encriptación falló';

  @override
  String get autoDeviceVerificationFailed =>
      'Verificación automática de dispositivo falló';

  @override
  String get autoRoomEncryptionFailed =>
      'Encriptación automática de sala falló';

  @override
  String get messageSentToRoom => 'Mensaje enviado a la sala';

  @override
  String get roomNotFound => 'Sala no encontrada';

  @override
  String get errorSendingMessage => 'Error al enviar mensaje';

  @override
  String get messageSentToRoomAlias => 'Mensaje enviado al alias de sala';

  @override
  String get errorSendingMessageToAlias => 'Error al enviar mensaje al alias';

  @override
  String get directMessageSentTo => 'Mensaje directo enviado a';

  @override
  String get errorSendingDirectMessage => 'Error al enviar mensaje directo';

  @override
  String get passwordMinLength =>
      'La contraseña debe tener al menos 6 caracteres';

  @override
  String get contactSearch => 'Búsqueda de Contactos';

  @override
  String get noChatsFound => 'No se encontraron charlas';

  @override
  String get emoji => 'Emojis';

  @override
  String get contactsAccessRequired => 'Se requiere acceso a contactos';

  @override
  String get myCard => 'Mi tarjeta';

  @override
  String get favoriteMessage => 'Mensaje favorito';

  @override
  String get messageContentUnavailable => 'Contenido del mensaje no disponible';

  @override
  String get storageAccessRequired => 'Se requiere acceso al almacenamiento';

  @override
  String get searchFiles => 'Buscar archivos';

  @override
  String get noFilesFound => 'No se encontraron archivos';

  @override
  String get refresh => 'Actualizar';

  @override
  String sendPhotos(int count, String plural) {
    return 'Enviar $count foto$plural';
  }

  @override
  String get locationAccessRequired => 'Se requiere acceso a la ubicación';

  @override
  String get failedToGetLocation => 'Error al obtener la ubicación';

  @override
  String get tapToGetCurrentLocation => 'Toca para obtener la ubicación actual';

  @override
  String get getLocation => 'Obtener ubicación';

  @override
  String get currentLocation => 'Ubicación actual';

  @override
  String get sendCurrentLocation => 'Enviar ubicación actual';

  @override
  String get chooseOnMap => 'Elegir en el mapa';

  @override
  String get refreshLocation => 'Actualizar ubicación';

  @override
  String get debug => 'Depurar';

  @override
  String get weak => 'Débil';

  @override
  String get medium => 'Media';

  @override
  String get good => 'Buena';

  @override
  String get strong => 'Fuerte';

  @override
  String get confirmGoBack => 'Confirmar';

  @override
  String get goBackProgressLost =>
      'Estás seguro de que deseas volver? Tu progreso se perderá.';

  @override
  String get createAccount => 'Crear cuenta';

  @override
  String get verifyPhone => 'Verifiquemos tu número de celular.';

  @override
  String get isItCorrectOrModify => '¿Es correcto o quieres modificarlo?';

  @override
  String get waitingToDetectSms =>
      'Esperando detectar automáticamente el SMS enviado a';

  @override
  String get verificationCode => 'Código de verificación';

  @override
  String get resendCode => 'Reenviar código';

  @override
  String get sendAgain => 'Enviar de nuevo';

  @override
  String get fullName => 'Nombre completo';

  @override
  String get exampleEmail => 'ejemplo@correo.com';

  @override
  String get continueButton => 'Continuar';

  @override
  String get atLeast6Characters => 'Al menos 6 caracteres';

  @override
  String get backToLogin => 'Volver al inicio de sesión';

  @override
  String get usernameOrEmailRequired =>
      'Se requiere nombre de usuario o correo electrónico';

  @override
  String get invalidEmailOrPassword => 'Correo o contraseña inválidos';

  @override
  String get invalidUsernameOrPassword => 'Usuario o contraseña inválidos';

  @override
  String get emailNotFoundSignUp =>
      'Correo no encontrado. Verifica tu correo o regístrate primero.';

  @override
  String get tooManyLoginAttempts =>
      'Demasiados intentos de inicio de sesión. Intenta más tarde.';

  @override
  String get serverErrorTryAgain => 'Error del servidor. Intenta más tarde.';

  @override
  String loginFailed(Object loginError) {
    return 'Inicio de sesión fallido: $loginError';
  }

  @override
  String get serverConfigError =>
      'Error de configuración del servidor. Contacta soporte.';

  @override
  String get serverError =>
      'Error del servidor. Servicio de correo puede no estar disponible.';

  @override
  String get requestTimeout => 'Tiempo de espera agotado. Intenta nuevamente.';

  @override
  String get emailServiceNotAvailable =>
      'Servicio de correo no disponible. Contacta soporte.';

  @override
  String get serverErrorTryLater => 'Error del servidor. Intenta más tarde.';

  @override
  String get passwordIsRequired => 'La contraseña es requerida';

  @override
  String get confirmPasswordRequired => 'Confirmar contraseña es requerido';

  @override
  String get emailNotVerified =>
      'Aún no has verificado tu correo.\nRevisa tu correo y haz clic en el enlace de verificación.';

  @override
  String weSentResetLink(String email) {
    return 'Enviamos un enlace de restablecimiento a $email';
  }

  @override
  String get verificationWarning =>
      'Aún no verificado. Por favor haz clic en el enlace de verificación en tu correo, luego ingresa tu nueva contraseña abajo.';

  @override
  String get enterNewPassword => 'Ingresa nueva contraseña';

  @override
  String get confirmNewPassword => 'Confirma nueva contraseña';

  @override
  String get connectionError =>
      'Error de conexión. Verifica tu conexión a internet';

  @override
  String get enterEmail => 'Ingresa correo electrónico';

  @override
  String get enterEmailOrUsername => 'Ingresa correo o nombre de usuario';

  @override
  String get forgotYourPassword => 'Olvidaste tu contraseña?';

  @override
  String get orLoginWith => 'O inicia sesión con';

  @override
  String get doYouHaveAccount => 'Tienes una cuenta?';

  @override
  String get usernameMinLength =>
      'El nombre de usuario debe tener al menos 3 caracteres';

  @override
  String get usernameMaxLength =>
      'El nombre de usuario debe tener 20 caracteres o menos';

  @override
  String get usernameInvalidFormat =>
      'El nombre de usuario solo puede contener letras minúsculas, números, guión bajo (_) y punto (.)';

  @override
  String get usernameCannotStartWith =>
      'El nombre de usuario no puede comenzar con guión bajo (_) o punto (.)';

  @override
  String get usernameCannotEndWith =>
      'El nombre de usuario no puede terminar con guión bajo (_) o punto (.)';

  @override
  String get usernameConsecutiveChars =>
      'El nombre de usuario no puede tener caracteres especiales consecutivos';

  @override
  String get usernameMustContainLetter =>
      'El nombre de usuario debe contener al menos una letra';

  @override
  String get fullNameIsRequired => 'El nombre completo es obligatorio';

  @override
  String get usernameAlreadyTaken => 'Nombre de usuario ya tomado';

  @override
  String get usernameAlreadyInUse =>
      'Este nombre de usuario ya está en uso. Por favor elige otro.';

  @override
  String get emailAlreadyInUse => 'Este correo ya está en uso';

  @override
  String get langEnglish => 'Inglés';

  @override
  String get langSpanish => 'Español';

  @override
  String get countrySpain => 'España';

  @override
  String get countryUS => 'Estados Unidos';

  @override
  String get countryUnitedStates => 'Estados Unidos';

  @override
  String get countryFrance => 'Francia';

  @override
  String get countryGermany => 'Alemania';

  @override
  String get countryItaly => 'Italia';

  @override
  String get countryAustralia => 'Australia';

  @override
  String get countryBrazil => 'Brasil';

  @override
  String get enterText => 'Ingresar texto';

  @override
  String get recordingFailed => '¡La grabación falló!';

  @override
  String get rememberMe => 'Recuérdame';

  @override
  String get otpVerificationFailed => 'Falló la verificación del OTP';

  @override
  String get customerNotFound => 'Cliente no encontrado';

  @override
  String get failedToGetCustomerStatus =>
      'Error al obtener el estado del cliente';

  @override
  String get failedToGetCustomerStatusAfterCsrfRefresh =>
      'Error al obtener el estado del cliente después de actualizar CSRF';

  @override
  String get failedToUpdateCustomer => 'Error al actualizar el cliente';

  @override
  String get failedToCreateKycLink => 'Error al crear el enlace KYC';

  @override
  String get failedToGetKycStatus => 'Error al obtener el estado KYC';

  @override
  String get usernameCheckFailed =>
      'Falló la verificación del nombre de usuario';

  @override
  String get failedToRegisterCustomerAfterRetries =>
      'Error al registrar el cliente después de varios intentos';

  @override
  String get failedToVerifyOtpAfterRetries =>
      'Error al verificar OTP después de varios intentos';

  @override
  String get fullNameRequired => 'El nombre completo es requerido';

  @override
  String get usernameRequired => 'El nombre de usuario es requerido';

  @override
  String get usernameCannotContainSpaces =>
      'El nombre de usuario no puede contener espacios';

  @override
  String get apiErrorTitle => 'Error';

  @override
  String get apiErrorDefaultMessage => 'Ocurrió un error';

  @override
  String get apiErrorInvalidField => 'Campo inválido';

  @override
  String get financeKYCAgeRestrictionError =>
      'Debes tener al menos 18 años para registrarte';

  @override
  String get financeKYCDocumentUpload => 'Subir imagen';

  @override
  String get financeKYCPreviousButton => 'Anterior';

  @override
  String get financeKYCCancelButton => 'Cancelar';

  @override
  String get financeKYCNextButton => 'Siguiente';

  @override
  String get financeKYCSubmitButton => 'Enviar KYC';

  @override
  String get financeKYCPersonalInfoStep => 'Información personal';

  @override
  String get financeKYCAddressStep => 'Dirección';

  @override
  String get financeKYCDocumentStep => 'Documento';

  @override
  String get financeKYCReviewStep => 'Revisar';

  @override
  String get financeKYCFrontDocument => 'Frente del documento';

  @override
  String get financeKYCBackDocument => 'Reverso del documento';

  @override
  String get financeKYCSelfieWithDocument => 'Selfie con documento';

  @override
  String get financeKYCErrorTitle => 'Error';

  @override
  String get financeKYCProcessingMessage =>
      'Tu solicitud de KYC está en proceso. Te notificaremos cuando se complete.';

  @override
  String get financeKYCDocumentsReceived => 'Documentos recibidos';

  @override
  String get financeKYCUnderReviewStatus => 'En revisión';

  @override
  String get financeKYCApprovalPending => 'Aprobación pendiente';

  @override
  String get createStory => 'Crear Historia';

  @override
  String get text => 'Texto';

  @override
  String get photo => 'Foto';

  @override
  String get video => 'Video';

  @override
  String get typeYourStory => 'Escribe tu historia...';

  @override
  String get videoSelected => 'Video seleccionado';

  @override
  String get tapToSelectPhoto => 'Toca para seleccionar foto';

  @override
  String get tapToSelectVideo => 'Toca para seleccionar video';

  @override
  String get storyCreatedSuccessfully => '¡Historia creada exitosamente!';

  @override
  String get pleaseEnterSomeText => 'Por favor ingresa algún texto';

  @override
  String get pleaseSelectAPhoto => 'Por favor selecciona una foto';

  @override
  String get pleaseSelectAVideo => 'Por favor selecciona un video';

  @override
  String errorPickingMedia(String error) {
    return 'Error al seleccionar medio: $error';
  }

  @override
  String errorCreatingStory(String error) {
    return 'Error al crear historia: $error';
  }

  @override
  String get storyViews => 'Vistas de historia';

  @override
  String views(int count) {
    return '$count vistas';
  }

  @override
  String get noViewsYet => 'Aún no hay vistas';

  @override
  String get videoStory => 'Historia en video';

  @override
  String get justNow => 'Justo ahora';

  @override
  String minutesAgo(int minutes) {
    return 'hace ${minutes}m';
  }

  @override
  String hoursAgo(int hours) {
    return 'hace ${hours}h';
  }

  @override
  String get couldNotOpenFile => 'No se pudo abrir el archivo';

  @override
  String get noStoriesAvailable => 'No hay historias disponibles';

  @override
  String get mediaUploadIssue => 'Problema al cargar medios';

  @override
  String get checkSynapseMediaConfiguration =>
      'Verificar configuración de medios de Synapse';

  @override
  String get replyToStory => 'Responder a la historia...';

  @override
  String get view => 'Ver';

  @override
  String get mapUnavailable => 'Mapa no disponible';

  @override
  String get locationPreview => 'Vista previa de la ubicación';

  @override
  String get selectFilesUsingButtonsAbove =>
      'Selecciona archivos usando los botones de arriba';

  @override
  String viewedBy(int count) {
    return 'Visto por $count';
  }

  @override
  String get replySent => '¡Respuesta enviada!';

  @override
  String get deleteStory => 'Eliminar historia';

  @override
  String get areYouSureDeleteStory =>
      'Estás seguro de que quieres eliminar esta historia?';

  @override
  String get noBlockedUsers => 'No hay usuarios bloqueados';

  @override
  String get incomingCall => 'Llamada entrante';

  @override
  String get profileSettings => 'Configuración de perfil';

  @override
  String get flightMode => 'Modo avión';

  @override
  String get manageYourFlightMode => 'Administrar modo avión';

  @override
  String get passwordAndSecurity => 'Contraseña y seguridad';

  @override
  String get twoFactorAuthentication => 'Autenticación de dos factores';

  @override
  String get enableTwoFactorAuthentication =>
      'Habilitar autenticación de dos factores';

  @override
  String get viewActiveSessions => 'Ver sesiones activas';

  @override
  String get signingIn => 'Iniciando sesión';

  @override
  String get usernameInvalidCharacters =>
      'El nombre de usuario solo puede contener letras, números, puntos, guiones bajos y guiones';

  @override
  String get emailRequired => 'El correo electrónico es requerido';

  @override
  String get pleaseEnterValidEmail => 'Por favor ingresa un correo válido';

  @override
  String get passwordRequired => 'La contraseña es requerida';

  @override
  String get passwordMustContainUppercase =>
      'La contraseña debe contener al menos 1 letra mayúscula (A-Z)';

  @override
  String get passwordMustContainLowercase =>
      'La contraseña debe contener al menos 1 letra minúscula (a-z)';

  @override
  String get passwordMustContainNumber =>
      'La contraseña debe contener al menos 1 número (0-9)';

  @override
  String get passwordMustContainSpecialChar =>
      'La contraseña debe contener al menos 1 carácter especial (!@#\$%^&*?)';

  @override
  String get passwordCannotContainUsername =>
      'La contraseña no puede contener tu nombre de usuario';

  @override
  String get passwordCannotContainCommonWords =>
      'La contraseña no puede contener palabras comunes';

  @override
  String get passwordCannotContainSequences =>
      'La contraseña no puede contener secuencias simples';

  @override
  String get noPendingVerification =>
      'No se encontró verificación pendiente. Por favor inicia el registro nuevamente';

  @override
  String get emailVerificationRequiredMessage =>
      'Se requiere verificación de correo. Revisa tu correo y haz clic en el enlace de verificación antes de completar el registro';

  @override
  String get failedToStartEmailVerification =>
      'Fallo al iniciar la verificación de correo';

  @override
  String get personalAccount => 'Cuenta personal';

  @override
  String get provideIdentificationDetails =>
      'Por favor proporciona tus detalles de identificación abajo.';

  @override
  String get processingData => 'Procesando datos';

  @override
  String get firstName => 'Nombre';

  @override
  String get pleaseEnterFirstName => 'Por favor ingresa tu nombre';

  @override
  String get middleNameOptional => 'Segundo nombre (opcional)';

  @override
  String get lastName => 'Apellido';

  @override
  String get pleaseEnterLastName => 'Por favor ingresa tu apellido';

  @override
  String get idOrPassportType => 'Tipo de ID o pasaporte';

  @override
  String get pleaseSelectDocumentType =>
      'Por favor selecciona un tipo de documento';

  @override
  String get dni => 'DNI';

  @override
  String get passport => 'Pasaporte';

  @override
  String get driverLicense => 'Licencia de conducir';

  @override
  String get otherId => 'Otro ID';

  @override
  String get documentNumber => 'Número de documento';

  @override
  String get pleaseEnterDocumentNumber =>
      'Por favor ingresa tu número de documento';

  @override
  String get resetPassword => 'Restablecer contraseña';

  @override
  String get checkYourEmail => 'Revisa tu correo';

  @override
  String get enterYourEmail => 'Ingresa tu correo electrónico';

  @override
  String get emailIsRequired => 'El correo electrónico es obligatorio';

  @override
  String get sendResetLink => 'Enviar enlace de restablecimiento';

  @override
  String get failedToSendResetEmail =>
      'Error al enviar correo de restablecimiento';

  @override
  String get emailNotFound =>
      'Correo no encontrado. Verifica tu correo o regístrate primero.';

  @override
  String get myStory => 'Mi Historia';

  @override
  String get today => 'Hoy';

  @override
  String get yesterday => 'Ayer';

  @override
  String get financeDeleteAccount => 'Eliminar Cuenta Externa';

  @override
  String get financeDeleteAccountConfirmation =>
      'Estás seguro de que deseas eliminar esta cuenta externa? Esta acción no se puede deshacer.';

  @override
  String get financeAccountDeleted => 'Cuenta externa eliminada exitosamente';

  @override
  String get financeKYCStepPersonalInfo => 'Info\nPersonal';

  @override
  String get financeKYCStepAddress => 'Dirección';

  @override
  String get financeKYCStepDocument => 'Documento';

  @override
  String get financeKYCStepReview => 'Revisar';

  @override
  String get financeKYCDocumentType => 'Tipo de Documento';

  @override
  String get financeKYCPassport => 'Pasaporte';

  @override
  String get financeKYCDocumentNumber => 'Número de Documento';

  @override
  String get financePayCryptoDocNumberRequired =>
      'Por favor ingrese su número de documento';

  @override
  String get financeKYCMotherMaidenName => 'Apellido Materno';

  @override
  String get financePayCryptoMaidenNameRequired =>
      'Por favor ingrese el apellido materno';

  @override
  String get financeKYCUploadFrontID => 'Subir Frente del ID';

  @override
  String get financeKYCUploadBackID => 'Subir Reverso del ID';

  @override
  String get financeKYCUploadSelfieWithDoc => 'Subir Selfie con Documento';

  @override
  String get financeKYCReviewName => 'Nombre';

  @override
  String get financeKYCReviewEmail => 'Correo';

  @override
  String get financeKYCReviewPhone => 'Teléfono';

  @override
  String get financeKYCReviewAddress => 'Dirección';

  @override
  String get financeKYCReviewDocumentType => 'Tipo de Documento';

  @override
  String get financeKYCReviewDocumentNumber => 'Número de Documento';

  @override
  String get financeKYCReviewFrontImage => 'Imagen Frontal';

  @override
  String get financeKYCReviewBackImage => 'Imagen Trasera';

  @override
  String get financeKYCReviewMixedImage => 'Imagen Mixta';

  @override
  String get financeKYCReviewUploaded => 'Subido';

  @override
  String get financeKYCReviewNotUploaded => 'No subido';

  @override
  String get financeKYCUploadImage => 'Subir imagen';

  @override
  String get financeKYCMustBe18 =>
      'Debes tener al menos 18 años para registrarte';

  @override
  String get financeKYCPleaseFixIssues =>
      'Por favor corrija los siguientes problemas:';

  @override
  String get financeKYCPleaseSelectStateProvince =>
      'Por favor seleccione su estado/provincia';

  @override
  String get financePayCryptoMaidenNameMinLength =>
      'El apellido materno debe tener al menos 2 caracteres';

  @override
  String get financeKYCUploadFrontDoc =>
      'Por favor suba el frente de su documento';

  @override
  String get financeKYCUploadBackDoc =>
      'Por favor suba el reverso de su documento';

  @override
  String get financeKYCUploadSelfieWithDocClear =>
      'Por favor suba una selfie sosteniendo su documento claramente visible';

  @override
  String get financeKYCSubmissionFailed => 'El envío de KYC falló';

  @override
  String get financeKYCSubmissionFailedCheckDocs =>
      'El envío de KYC falló. Por favor verifique sus documentos e intente nuevamente.';

  @override
  String get financeKYCFailedToSubmit => 'Error al enviar KYC';

  @override
  String financeKYCErrorProcessingImages(String error) {
    return 'Error al procesar imágenes: $error';
  }

  @override
  String get financeKycNotStarted => 'KYC No Iniciado';

  @override
  String get financeKycIncomplete => 'KYC Incompleto';

  @override
  String get financeKycQuestionnaireRequired => 'Cuestionario Requerido';

  @override
  String get financeKycUboDetailsRequired => 'Detalles UBO Requeridos';

  @override
  String get financeKycUnderReview => 'En Revisión';

  @override
  String get financeKycApproved => 'KYC Aprobado';

  @override
  String get financeKycRejected => 'KYC Rechazado';

  @override
  String get financeKycAccountPaused => 'Cuenta Pausada';

  @override
  String get financeKycAccountClosed => 'Cuenta Cerrada';

  @override
  String get financeKycStatusUnknown => 'Estado Desconocido';

  @override
  String get financeKycNotStartedDesc =>
      'La verificación de identidad aún no ha comenzado';

  @override
  String get financeKycIncompleteDesc =>
      'Por favor completa todos los pasos de verificación requeridos';

  @override
  String get financeKycQuestionnaireRequiredDesc =>
      'Se debe completar un cuestionario adicional';

  @override
  String get financeKycUboDetailsRequiredDesc =>
      'Se requieren detalles del Beneficiario Final Último';

  @override
  String get financeKycUnderReviewDesc =>
      'Tu verificación está siendo revisada actualmente';

  @override
  String get financeKycApprovedDesc =>
      'Tu identidad ha sido verificada exitosamente';

  @override
  String get financeKycRejectedDesc =>
      'La verificación fue rechazada. Por favor revisa y vuelve a enviar';

  @override
  String get financeKycAccountPausedDesc =>
      'Tu cuenta ha sido pausada temporalmente';

  @override
  String get financeKycAccountClosedDesc => 'Tu cuenta ha sido cerrada';

  @override
  String get financeKycUnknownStatusDesc =>
      'No se puede determinar el estado de verificación';

  @override
  String get financeKycStartVerification => 'Iniciar Verificación';

  @override
  String get financeKycCompleteVerification => 'Completar Verificación';

  @override
  String get financeKycCompleteQuestionnaire => 'Completar Cuestionario';

  @override
  String get financeKycProvideUboDetails => 'Proporcionar Detalles UBO';

  @override
  String get financeKycRetryVerification => 'Reintentar Verificación';

  @override
  String get financeKycContinueVerification => 'Continuar Verificación';

  @override
  String get financeKycLoadingStatus => 'Cargando Estado...';

  @override
  String get financeKycOpenLink => 'Abrir Enlace';

  @override
  String get financeKycViewTerms => 'Ver Términos';

  @override
  String get financeKycRefreshStatus => 'Actualizar Estado';

  @override
  String get financeKycCannotOpenLink => 'No Se Puede Abrir Enlace';

  @override
  String get financeKycFailedToOpenLink =>
      'Error al abrir enlace de verificación';

  @override
  String get financeKycTosAcceptedSuccess =>
      'Términos de servicio aceptados exitosamente';

  @override
  String get customerKycLoadingUserInfo =>
      'Cargando información del usuario...';

  @override
  String get customerKycCreateCustomerAccount => 'Crear Cuenta de Cliente';

  @override
  String get customerKycCompleteKycSubtitle =>
      'Completa la verificación KYC para acceder a servicios financieros';

  @override
  String get customerKycCustomerType => 'Tipo de Cliente';

  @override
  String get customerKycIndividual => 'Individual';

  @override
  String get customerKycCompany => 'Empresa';

  @override
  String get customerKycFullName => 'Nombre Completo';

  @override
  String get customerKycEmail => 'Correo Electrónico';

  @override
  String get customerKycGenerateKycLink => 'Generar Enlace KYC';

  @override
  String get customerKycNameRequired => 'El nombre es requerido';

  @override
  String get customerKycEmailRequired => 'El correo electrónico es requerido';

  @override
  String get customerKycInvalidEmailFormat =>
      'Formato de correo electrónico inválido';

  @override
  String get customerKycSelectEndorsement =>
      'Por favor selecciona al menos un respaldo';

  @override
  String get customerKycSelectPaymentService =>
      'Por favor selecciona al menos un servicio de pago';

  @override
  String get customerKycUsernameNotFound =>
      'Nombre de usuario no encontrado. Por favor inicia sesión nuevamente.';

  @override
  String get customerKycFailedSendOtp => 'Error al enviar OTP';

  @override
  String get customerKycVerificationFailed => 'Verificación fallida';

  @override
  String get customerKycFailedCreateLink => 'Error al crear enlace KYC';

  @override
  String get customerKycCustomerIdNotFound =>
      'ID de cliente no encontrado en la respuesta';

  @override
  String get customerKycLinkAlreadyExists =>
      'Ya existe un enlace KYC para este correo electrónico';

  @override
  String get customerKycCannotOpenLink => 'No se puede abrir este enlace';

  @override
  String get customerKycFailedOpenLink => 'Error al abrir enlace';

  @override
  String get customerKycLinkGeneratedSuccess =>
      'Enlace KYC generado exitosamente';

  @override
  String get customerKycVerification => 'Verificación KYC';

  @override
  String get customerKycOpenKycLink => 'Abrir Enlace KYC';

  @override
  String get customerKycViewTermsOfService => 'Ver Términos de Servicio';

  @override
  String get customerKycCreateAccount => 'Crear Cuenta';

  @override
  String get customerKycPaymentServices => 'Servicios de Pago';

  @override
  String get customerKycPaymentServicesSubtitle =>
      'Selecciona los métodos de pago y monedas que deseas usar. Puedes elegir múltiples opciones.';

  @override
  String get customerKycAllServices => 'Todos los Servicios';

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
      'Admite pagos en USD mediante transferencias ACH o Wire para transacciones en dólares estadounidenses.';

  @override
  String get customerKycEurTooltip =>
      'Proporciona pagos en EUR a través de SEPA para transacciones europeas.';

  @override
  String get customerKycMxnTooltip =>
      'Habilita pagos en MXN mediante SPEI para transacciones en pesos mexicanos.';

  @override
  String get customerKycBrlTooltip =>
      'Permite pagos en BRL mediante Pix para transacciones en reales brasileños.';

  @override
  String get customerKycStatusNotStarted =>
      'KYC no iniciado. Por favor inicia la verificación.';

  @override
  String get customerKycStatusInProgress =>
      'KYC en progreso. Por favor completa la verificación.';

  @override
  String get customerKycStatusApproved =>
      '¡KYC aprobado! Ahora puedes crear tu cuenta.';

  @override
  String get customerKycStatusRejected =>
      'KYC rechazado. Por favor revisa e inténtalo nuevamente.';

  @override
  String get customerKycStatusUnderReview =>
      'KYC en revisión. Por favor espera la aprobación.';

  @override
  String get customerKycStatusUnknown => 'Estado desconocido';

  @override
  String get customerKycDialogGotIt => 'Entendido';

  @override
  String get exit => 'salida';

  @override
  String get doYouWantToExitTheApp => '¿Quieres salir de la aplicación?';

  @override
  String get newChatRequests => 'Nuevas solicitudes de chat';

  @override
  String get changeLanguageTitle => 'Cambiar idioma';

  @override
  String get selectLanguage => 'Seleccionar idioma';

  @override
  String get messageQuestionWillBeAvailable =>
      '¡La pregunta del mensaje estará disponible pronto!';

  @override
  String get enter4DigitPin => 'Ingresa tu PIN de 4 dígitos';

  @override
  String get createPinCode => 'Crea tu código PIN';

  @override
  String get welcomeTo => 'Bienvenido a';

  @override
  String get enjoyFullExperience =>
      'Disfruta de la experiencia completa que BMP te ofrece';

  @override
  String get signUpForAccount => 'Regístrate para una cuenta';

  @override
  String get enterYourPhoneNumber => 'Ingresa tu número de celular';

  @override
  String get verificationSMSMessage =>
      'BMP te enviará un mensaje SMS para verificar tu número de celular.';

  @override
  String get phoneNumber => 'Número de celular';

  @override
  String get loginOnboardingNote =>
      '•Los usuarios que ya tienen una cuenta con correo electrónico deben iniciar sesión primero con su correo y luego vincular su número de teléfono.\n\n• Los nuevos usuarios pueden registrarse directamente usando su número de teléfono.';

  @override
  String get note => 'Nota';

  @override
  String get enterEmailOrUsernameToContinue =>
      'Ingresa tu correo o usuario y contraseña para continuar';

  @override
  String get securityUpdateRequired => 'Actualización de seguridad requerida';

  @override
  String get linkPhoneToSecureAccount =>
      'Vincula tu número de celular para proteger tu cuenta y continuar.';

  @override
  String get ageRestrictionMessage =>
      'Debes tener al menos 16 años para registrarte. Aprende más sobre cómo funciona BMP.';

  @override
  String get enterPhoneNumberError => 'Por favor ingresa un número de celular';

  @override
  String get pinSetSuccessfully => '¡PIN establecido con éxito!';

  @override
  String get selectCountry => 'Selecciona un país';

  @override
  String get searchYourCountry => 'Busca tu país';

  @override
  String get groupChats => 'Chats de grupo';

  @override
  String get myQR => 'Mi QR';

  @override
  String get tapToStartConversation => 'Toca para iniciar la conversación';

  @override
  String get changeProfilePicture => 'Cambiar foto de perfil';

  @override
  String get displayName => 'Nombre para mostrar';

  @override
  String get editContact => 'Editar contacto';

  @override
  String phoneNumberMustBeDigits(int requiredLength) {
    return 'El número de teléfono debe tener al menos $requiredLength dígitos';
  }

  @override
  String get ibanNumber => 'Número de IBAN';

  @override
  String get bicSwift => 'BIC / SWIFT';

  @override
  String get encryptionSetupTitle => 'Se requiere configuración de cifrado';

  @override
  String get encryptionSetupMessage =>
      'El cifrado de su dispositivo no está configurado correctamente. Esto es necesario para la mensajería segura.\n\n¿Desea completar la configuración del cifrado ahora?';

  @override
  String get encryptionSetupOk => 'Completar configuración';

  @override
  String get encryptionDisableNotAllowed =>
      'No puede desactivar el cifrado en una sala. Si desea desactivar el cifrado, cree una nueva sala sin cifrado.';

  @override
  String get publicRoomEncryptionNotAllowed =>
      'Las salas públicas no pueden estar cifradas.';

  @override
  String get encryptionPermissionDenied =>
      'No tiene permiso para cambiar esto.';

  @override
  String get encryptionSetupCompleted =>
      '¡La configuración del cifrado se completó correctamente! Ahora puede habilitar el cifrado.';

  @override
  String enableEncryptionFailed(Object error) {
    return 'No se pudo habilitar el cifrado: $error';
  }

  @override
  String completeEncryptionSetupFailed(Object error) {
    return 'No se pudo completar la configuración del cifrado: $error. Inténtelo de nuevo o contacte al soporte.';
  }

  @override
  String get encryptionIrreversibleWarning =>
      '¡Habilitar el cifrado en esta sala es irreversible! ¿Está seguro?';

  @override
  String get encryptionEnabledSuccess =>
      '¡El cifrado se habilitó correctamente!';

  @override
  String get encryptionError => 'Error de cifrado';

  @override
  String get encryptionSetupFailedTitle => 'Falló la configuración de cifrado';

  @override
  String get noTransactionHistoryAvailable =>
      'No hay historial de transacciones disponible';

  @override
  String get approved => 'Aprobado';

  @override
  String get active => 'Activo';

  @override
  String get rejected => 'Rechazado';

  @override
  String get pending => 'Pendiente';

  @override
  String get under_review => 'En revisión';

  @override
  String get incomplete => 'Incompleto';

  @override
  String get not_started => 'No iniciado';

  @override
  String get awaiting_questionnaire => 'En espera del cuestionario';

  @override
  String get awaiting_ubo => 'En espera de UBO';

  @override
  String get paused => 'Pausado';

  @override
  String get offboarded => 'Dado de baja';

  @override
  String get virtual => 'Virtual';

  @override
  String get physical => 'Físico';

  @override
  String get selectCardType => 'Seleccionar Tipo de Tarjeta';

  @override
  String get chooseVirtualAccountType =>
      'Elija el tipo de cuenta virtual que desea crear';

  @override
  String get noStoriesToShow => 'No hay historias para mostrar';

  @override
  String get noExternalAccountsAvailable =>
      'No hay cuentas externas disponibles';

  @override
  String get editAddress => 'Editar dirección';

  @override
  String get inactive => 'Inactivo';

  @override
  String get activated => 'Activado';

  @override
  String get editAccount => 'Editar cuenta';

  @override
  String get networkConnectionFailed =>
      'La conexión de red falló. Por favor, asegúrate de estar conectado a internet.';

  @override
  String get networkErrorTitle => 'Error de red';

  @override
  String get maxTwoVideos => 'Solo puedes seleccionar hasta 2 videos';

  @override
  String get maxEightImages => 'Solo puedes seleccionar hasta 8 imágenes';

  @override
  String get createChannel => 'Crear canal';

  @override
  String get channelCreatedSuccess => 'El canal se ha creado correctamente';

  @override
  String get channelCreatedFailed => 'Error al crear el canal';

  @override
  String get channelNameEmpty => 'El nombre del canal no puede estar vacío';

  @override
  String get channelNameExists => 'El nombre del canal ya existe en este grupo';

  @override
  String get enterChannelName => 'Ingresa el nombre del canal';

  @override
  String get createGroupChannel => 'Crear canal de grupo';

  @override
  String get initiateKycProcess => 'Iniciar Proceso KYC';

  @override
  String get acceptTermsAndConditions => 'Aceptar Términos y Condiciones';

  @override
  String get setTransactionPin => 'Establecer PIN de Transacción';

  @override
  String get createFourDigitPin =>
      'Crea un PIN de 4 dígitos para transacciones';

  @override
  String loadLiquidationAddressFailed(Object error) {
    return 'Error al cargar los detalles de la dirección de liquidación: $error';
  }

  @override
  String get invalidExternalAccountAddress =>
      'La dirección de esta cuenta externa no es válida';

  @override
  String get customerIdCheck => 'Verificación del ID del cliente';

  @override
  String get customerIdNotFound =>
      'ID del cliente no encontrado. Por favor intenta nuevamente.';

  @override
  String get enterPin => 'Ingresar PIN';

  @override
  String get enterFourDigitPin =>
      'Ingresa tu PIN de 4 dígitos para crear la dirección de liquidación';

  @override
  String get liquidationAddressPayload =>
      'Información de la dirección de liquidación';

  @override
  String get failedToCreateLiquidationAddress =>
      'No se pudo crear la dirección de liquidación';

  @override
  String get liquidationCreationFailed => 'La creación de la liquidación falló';

  @override
  String networkErrorWithMessage(Object error) {
    return 'Error de red: $error';
  }

  @override
  String createLiquidationAddressFailedWithMessage(Object error) {
    return 'Error al crear la dirección de liquidación: $error';
  }

  @override
  String get completeRequiredFields =>
      'Por favor completa todos los campos requeridos:';

  @override
  String get noRecentTransactions => 'Aún no hay transacciones recientes';

  @override
  String wrongPinEnteredWithCooldown(int seconds) {
    return 'PIN incorrecto. Intenta nuevamente en $seconds segundos.';
  }

  @override
  String get pinsDoNotMatch => 'Los PIN no coinciden';

  @override
  String get reEnter4DigitPin => 'Vuelve a ingresar tu PIN de 4 dígitos';

  @override
  String get enterPinToUnlock => 'Ingresa tu PIN para desbloquear';

  @override
  String get enterCurrentPinToChange => 'Ingresa el PIN actual para cambiarlo';

  @override
  String get dialerConnecting => 'Conectando...';

  @override
  String get dialerReconnecting => 'Reconectando...';

  @override
  String get dialerReconnectingMessage =>
      'Por favor espera mientras restauramos la conexión';

  @override
  String get dialerRinging => 'Sonando...';

  @override
  String get dialerCalling => 'Llamando...';

  @override
  String get dialerVideoCalling => 'Videollamada...';

  @override
  String get dialerIncomingVoiceCall => 'Llamada de voz entrante...';

  @override
  String get dialerIncomingVideoCall => 'Videollamada entrante...';

  @override
  String get dialerIncomingCall => 'Llamada entrante';

  @override
  String get dialerMuted => 'Silenciado';

  @override
  String get dialerUnknown => 'Desconocido';

  @override
  String get networkQualityExcellent => 'Excelente';

  @override
  String get networkQualityGood => 'Bueno';

  @override
  String get networkQualityFair => 'Regular';

  @override
  String get networkQualityPoor => 'Malo';

  @override
  String get networkQualityDisconnected => 'Desconectado';

  @override
  String get videoQuality => 'Calidad de video';

  @override
  String get uploadSpeedLabel => 'Subida';

  @override
  String get downloadSpeedLabel => 'Bajada';

  @override
  String get outgoingCalls => 'Llamadas salientes';

  @override
  String get outgoing => 'Saliente';

  @override
  String durationMinutes(int minutes) {
    return '$minutes min';
  }

  @override
  String get subscriptionActivating =>
      'Tu suscripción se está activando. Esto puede tardar unos momentos.';

  @override
  String get subscriptionPaymentPending =>
      'Pago pendiente. Por favor completa tu pago para activar la suscripción.';

  @override
  String get subscriptionPaymentFailed =>
      'El pago falló. Por favor actualiza tu método de pago.';

  @override
  String get completeYourProfile => 'Completa tu perfil';

  @override
  String get provideDetailsToContinu =>
      'Por favor proporciona tus datos para continuar';

  @override
  String get enterValidEmail => 'Ingresa un correo válido';

  @override
  String get enterYourName => 'Ingresa tu nombre';

  @override
  String get nameIsRequired => 'El nombre es obligatorio';

  @override
  String get phoneOptional => 'Celular (Opcional)';

  @override
  String get phone => 'Celular';

  @override
  String get enterPhoneNumber => 'Ingresa número de celular';

  @override
  String get continueBtn => 'Continuar';

  @override
  String get noPricingPlansAvailable => 'No hay planes de precios disponibles';

  @override
  String get failedToLoadPricingPlans => 'Error al cargar planes de precios';

  @override
  String unlockFeature(String feature) {
    return 'Desbloquear $feature';
  }

  @override
  String subscribeToUnlock(String feature) {
    return 'Suscríbete para desbloquear $feature y todas las demás funciones premium.';
  }

  @override
  String get subscribeNow => 'Suscribirse ahora';

  @override
  String get cancelAnyTimeRecurringBilling =>
      'Cancela en cualquier momento. Facturación recurrente.';

  @override
  String get actions => 'Acciones';

  @override
  String get cancelSubscription => 'Cancelar suscripción';

  @override
  String get cancelSubscriptionSubtitle =>
      'Mantendrás el acceso hasta el final de tu período de facturación';

  @override
  String get reactivateSubscription => 'Reactivar suscripción';

  @override
  String get reactivateSubscriptionSubtitle =>
      'Cancela la cancelación programada y mantén tu suscripción';

  @override
  String get subscribeToPremium => 'Suscribirse a Premium';

  @override
  String get unlockPremiumFeatures => 'Desbloquea todas las funciones premium';

  @override
  String get noActiveSubscriptionToCancel =>
      'No se encontró ninguna suscripción activa para cancelar';

  @override
  String get subscriptionCancelledAtPeriodEnd =>
      'Tu suscripción se cancelará al final de tu período de facturación.';

  @override
  String get subscriptionCancelled => 'Tu suscripción ha sido cancelada.';

  @override
  String get failedToCancelSubscription => 'Error al cancelar la suscripción';

  @override
  String get noSubscriptionToReactivate =>
      'No se encontró ninguna suscripción para reactivar';

  @override
  String get subscriptionReactivated => '¡Tu suscripción ha sido reactivada!';

  @override
  String get failedToReactivateSubscription =>
      'Error al reactivar la suscripción';

  @override
  String get cancelSubscriptionQuestion => '¿Cancelar suscripción?';

  @override
  String subscriptionWillEndOn(String date) {
    return 'Tu suscripción terminará el $date. Tendrás acceso a las funciones premium hasta entonces. Después de eso, perderás el acceso a las funciones premium.';
  }

  @override
  String get keepSubscription => 'Mantener suscripción';

  @override
  String get subscriptionWillContinue =>
      'Tu suscripción continuará normalmente. No habrá cargos adicionales hasta tu próximo ciclo de facturación.';

  @override
  String get keepCancelled => 'Mantener cancelada';

  @override
  String get reactivate => 'Reactivar';

  @override
  String get premiumPlan => 'Plan Premium';

  @override
  String get cancelledOn => 'Cancelada el';

  @override
  String get accessEndsOn => 'El acceso termina el';

  @override
  String get nextBillingDate => 'Próxima fecha de facturación';

  @override
  String get subscriptionStatusCancelling => 'Cancelando';

  @override
  String get subscriptionStatusActive => 'Activa';

  @override
  String get subscriptionStatusTrial => 'Prueba';

  @override
  String get subscriptionStatusCancelled => 'Cancelada';

  @override
  String get subscriptionStatusExpired => 'Expirada';

  @override
  String get subscriptionStatusPaymentPending => 'Pago pendiente';

  @override
  String get subscriptionStatusPaymentOverdue => 'Pago vencido';

  @override
  String get subscriptionStatusNone => 'Sin suscripción';

  @override
  String subscriptionDescCancelling(int days) {
    return 'Tu suscripción está programada para cancelarse. Aún tienes acceso por $days días más. Puedes reactivarla en cualquier momento antes de que termine.';
  }

  @override
  String get subscriptionDescActive =>
      'Tienes acceso completo a todas las funciones premium. ¡Disfruta tu suscripción!';

  @override
  String get subscriptionDescTrial =>
      'Actualmente estás en una prueba gratuita. Suscríbete a premium para desbloquear todas las funciones.';

  @override
  String get subscriptionDescCancelled =>
      'Cancelaste tu suscripción. Tu suscripción anterior ha terminado. Suscríbete de nuevo para recuperar el acceso a las funciones premium.';

  @override
  String get subscriptionDescExpired =>
      'Tu suscripción ha expirado debido a un problema de pago. Por favor suscríbete de nuevo con un método de pago actualizado para continuar disfrutando de las funciones premium.';

  @override
  String get subscriptionDescIncomplete =>
      'Tu pago está siendo procesado. Por favor espera la confirmación, o intenta suscribirte de nuevo.';

  @override
  String get subscriptionDescPastDue =>
      'Tu pago está vencido. Por favor actualiza tu método de pago inmediatamente para evitar perder el acceso a las funciones premium.';

  @override
  String get subscriptionDescDefault =>
      'Suscríbete para desbloquear funciones premium y aprovechar al máximo tu experiencia.';

  @override
  String get failedToInitiateRegistration => 'Error al iniciar el registro';

  @override
  String get paymentFailed => 'El pago falló';

  @override
  String get supportPageTitle => 'Enviar ticket de soporte';

  @override
  String get supportPageSubtitle =>
      'Cuéntanos sobre el problema que estás enfrentando.';

  @override
  String get supportSubjectLabel => 'Asunto';

  @override
  String get supportDescriptionLabel => 'Descripción';

  @override
  String get supportSubjectHint =>
      'Ingresa el asunto (ej.: Problemas de inicio de sesión, Problema de pago, etc.)';

  @override
  String get supportDescriptionHint => 'Ingresa la descripción aquí...';

  @override
  String get logInToYourAccount => 'Inicia sesión en tu cuenta';

  @override
  String get missedCalls => 'Llamadas perdidas';

  @override
  String get selectAtLeastOneMember =>
      'Selecciona al menos un miembro para crear un grupo';

  @override
  String get chatSupportComingSoon =>
      'El soporte por chat estará disponible pronto';

  @override
  String get selectStartDate => 'Seleccionar fecha de inicio';

  @override
  String get selectEndDate => 'Seleccionar fecha de fin';

  @override
  String get recentContacts => 'Contactos recientes';

  @override
  String get sortZA => 'Ordenar de Z a A';

  @override
  String get sortAZ => 'Ordenar de A a Z';

  @override
  String get selectYourCardType => 'Selecciona el tipo de tarjeta';

  @override
  String get selectCards => 'Seleccionar tarjetas';

  @override
  String get confirmCardSelection => 'Confirmar selección de la tarjeta';

  @override
  String get reviewYourSelection => 'Revisa tu selección';

  @override
  String get mastercard => 'Mastercard';

  @override
  String get mastercardDescription =>
      'Una red de pagos global aceptada a nivel mundial, que ofrece transacciones rápidas y seguras con amplia cobertura de comercios.';

  @override
  String get visa => 'Visa';

  @override
  String get visaDescription =>
      'Una red mundial de pagos digitales que permite realizar pagos con tarjeta de manera rápida, segura y confiable en casi cualquier lugar.';

  @override
  String get selectVisaType => 'Seleccionar tipo de Visa';

  @override
  String get selectMastercardType => 'Seleccionar tipo de Mastercard';

  @override
  String get selectCardTypeForNewCard =>
      'Selecciona el tipo de tarjeta para tu nueva tarjeta';

  @override
  String get noCardTypesAvailable => 'No hay tipos de tarjeta disponibles';

  @override
  String get allCardTypesAlreadyCreated =>
      'Ya has creado todas las tarjetas disponibles de este tipo';

  @override
  String get errorCheckingKycStatus => 'Error al consultar el estado de KYC';

  @override
  String get financePayCryptoAccountRequired =>
      'Se requiere una cuenta de PayCrypto';

  @override
  String get pleaseEnter6DigitCode => 'Ingresa el código de 6 dígitos';

  @override
  String get cameraAccessDenied =>
      'Acceso a la cámara denegado. Por favor, habilita el permiso de la cámara en la configuración.';

  @override
  String get pinChangedSuccessfully => '¡PIN cambiado con éxito!';

  @override
  String get notAValidQrCode => 'Código QR no válido';

  @override
  String get errorScanningImage => 'Error al escanear la imagen';

  @override
  String get cardSetAsDefault =>
      'Esta tarjeta ahora es tu tarjeta predeterminada';

  @override
  String get failedToSetDefaultCard =>
      'No se pudo establecer la tarjeta predeterminada.';

  @override
  String get allContacts => 'Todos los contactos';

  @override
  String get outgoingCall => 'Llamada saliente';

  @override
  String get makeDefaultCard => 'Establecer como tarjeta predeterminada';

  @override
  String get enterPinToViewBalance => 'Ingresa tu PIN para ver el saldo';

  @override
  String get verifyPin => 'Verificar PIN';

  @override
  String get unlockPremiumAccess => 'Desbloquear acceso premium';

  @override
  String get subscribeToAccessAllFeatures =>
      'Suscríbete ahora para acceder a todas las funciones sin límites.';

  @override
  String get monthly => 'Mensual';

  @override
  String get supportDescriptionTooShort => 'La descripción es demasiado corta';

  @override
  String get supportDescriptionMinLength =>
      'La descripción debe tener al menos 20 caracteres';

  @override
  String get paymentsSecurelyProcessedBy =>
      'Pagos procesados de forma segura por';

  @override
  String get sessionExpired => 'Sesión expirada';

  @override
  String get sessionExpiredMessage =>
      'Tu sesión ha expirado o ya no es válida. Se cerrará la sesión por seguridad.';

  @override
  String get activeCards => 'Tarjetas activas';

  @override
  String get inactiveCards => 'Tarjetas inactivas';

  @override
  String get freezeCards => 'Congelar tarjetas';

  @override
  String depositInstructionSendOnly(Object currency, Object chain) {
    return 'Envía solo $currency en $chain a esta dirección';
  }

  @override
  String get depositInstructionProcessingTime =>
      'Tiempo de procesamiento: 2–15 minutos según la blockchain';

  @override
  String get depositInstructionMinimum =>
      'Depósito mínimo: equivalente a \$10 USD';

  @override
  String get depositInstructionAutoLoad =>
      'Tu tarjeta se cargará automáticamente';

  @override
  String get depositInstructionPushNotification =>
      'Recibirás una notificación cuando se complete';

  @override
  String get shareQr => 'Compartir QR';

  @override
  String get copyQr => 'Copiar QR';

  @override
  String get importantInformation => 'Información importante';

  @override
  String get errorLoadingAddress => 'Error al cargar la dirección';

  @override
  String get deposit => 'Depósito';

  @override
  String get copiedTitle => '¡Copiado!';

  @override
  String get addressCopiedMessage => 'Dirección copiada al portapapeles';

  @override
  String get selectBlockchain => 'Seleccionar blockchain';

  @override
  String get noChainsAvailableTitle => 'No hay redes disponibles';

  @override
  String get noChainsAvailableMessage =>
      'No se encontraron redes compatibles para tu cuenta';

  @override
  String get processing => 'Procesando...';

  @override
  String get noCardInformationAvailable =>
      'No hay información de la tarjeta disponible';

  @override
  String get cardDetailsTitle => 'Detalles de la tarjeta';

  @override
  String get seeYourCardInfo => 'Ver la información de tu tarjeta';

  @override
  String get securityTipDoNotSharePin =>
      'No compartas tu PIN ni los datos de tu tarjeta.';

  @override
  String get securityTipShopSecureSites =>
      'Compra solo en sitios seguros (https).';

  @override
  String get securityTipEnableAlerts =>
      'Activa las alertas y el bloqueo desde la app.';

  @override
  String get securityTipCheckTransactions =>
      'Revisa tus transacciones regularmente.';

  @override
  String get onlyAdminsCanEditGroup =>
      'Solo los administradores pueden editar el nombre y el ícono del grupo';

  @override
  String get profileUpdatedSuccessfully => 'Perfil actualizado correctamente';

  @override
  String get groupEditPermissionDenied =>
      'No tienes permiso para editar este grupo. Solo los administradores pueden editar los detalles del grupo.';

  @override
  String get insufficientGroupPermissions =>
      'Permisos insuficientes. Solo los administradores pueden editar los detalles del grupo.';

  @override
  String get failedToUpdateProfile => 'Error al actualizar el perfil';

  @override
  String get unableToDetermineEmail =>
      'No se pudo determinar tu correo electrónico. Inténtalo de nuevo.';

  @override
  String get transferInitiated => 'Transferencia iniciada';

  @override
  String get transferInitiatedSuccess =>
      '¡Tu transferencia ha sido iniciada con éxito!';

  @override
  String get invitationSent => 'Invitación enviada';

  @override
  String get invitationSentTo => 'Invitación enviada a';

  @override
  String get inviteFailed => 'Error al enviar la invitación';

  @override
  String get failedToSendInvitation => 'No se pudo enviar la invitación';

  @override
  String get inviteToBMP => 'Invitar a BMP';

  @override
  String inviteDescription(Object email) {
    return 'Envía una invitación a $email para unirse a BMP y recibir pagos en USDC';
  }

  @override
  String get sendInvite => 'Enviar invitación';

  @override
  String get sendMoney => 'Enviar dinero';

  @override
  String get transferUsdcViaEmail => 'Transferir USDC por correo electrónico';

  @override
  String get from => 'Desde';

  @override
  String get recipientEmail => 'Correo del destinatario';

  @override
  String get enterRecipientEmail =>
      'Por favor, ingresa el correo del destinatario';

  @override
  String get validRecipientEmail => 'Por favor, ingresa un correo válido';

  @override
  String get cannotSendToYourself => 'No puedes enviarte dinero a ti mismo';

  @override
  String get enterAmount => 'Por favor, ingresa una cantidad';

  @override
  String get validAmount => 'Por favor, ingresa una cantidad válida mayor a 0';

  @override
  String get insufficientBalance =>
      'No tienes suficiente saldo. Recarga tu billetera.';

  @override
  String get recipientNotOnBMP => 'El destinatario aún no está en BMP.';

  @override
  String get recipientNeedsWallet =>
      'El destinatario necesita configurar su billetera.';

  @override
  String incorrectPinAttempts(Object attempts) {
    return 'PIN incorrecto. Quedan $attempts intentos.';
  }

  @override
  String get tooManyAttempts =>
      'Demasiados intentos. Inténtalo de nuevo en 1 hora.';

  @override
  String get accountBlocked =>
      'Tu cuenta está bloqueada. Contacta con soporte.';

  @override
  String get createWalletToProceed =>
      'Crea una billetera para continuar con los pagos';

  @override
  String get selectSourceWallet =>
      'Por favor, selecciona una billetera de origen.';

  @override
  String get selectDestinationWallet =>
      'Por favor, selecciona una billetera de destino.';

  @override
  String get shareFailed => 'Error al compartir';

  @override
  String get failedToOpenShareDialog =>
      'No se pudo abrir el diálogo de compartir';

  @override
  String get reviewAndConfirmTransfer => 'Revisa y confirma tu transferencia';

  @override
  String get transferSummary => 'Resumen de la transferencia';

  @override
  String get destinationWallet => 'Billetera de destino';

  @override
  String get paymentProcessed =>
      'Pago procesado con éxito. Recibirás un correo de confirmación en breve.';

  @override
  String get phoneNumberAlreadyInUse =>
      'El número de teléfono ya existe. Por favor, usa un número diferente.';

  @override
  String get phoneNumberNotFound =>
      'Número de celular no encontrado. Por favor, verifique su número o regístrese primero.';

  @override
  String get linkEmailTitle => 'Vincular correo electrónico';

  @override
  String get linkEmailSubtitle =>
      'Por favor, ingresa una dirección de correo electrónico para vincular a tu cuenta para mayor seguridad.';

  @override
  String get emailHint => 'Correo electrónico';

  @override
  String get enterOtpEmail => 'Ingresa el código OTP enviado al correo';

  @override
  String get enterOtpSms => 'Ingresa el código OTP enviado por SMS';
}

/// The translations for Spanish Castilian, as used in Mexico (`es_MX`).
class L10nEsMx extends L10nEs {
  L10nEsMx() : super('es_MX');

  @override
  String get alwaysUse24HourFormat => 'falso';

  @override
  String get repeatPassword => 'Repetir contraseña';

  @override
  String get notAnImage => 'No es un archivo de imagen.';

  @override
  String get setCustomPermissionLevel =>
      'Establecer nivel de permiso personalizado';

  @override
  String get setPermissionsLevelDescription =>
      'Elige un rol predefinido abajo o ingresa un nivel de permiso personalizado entre 0 y 100.';

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
  String get addEmail => 'Agregar correo electrónico';

  @override
  String get confirmMatrixId =>
      'Por favor confirma tu ID de usuario para borrar tu cuenta.';

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
  String get alias => 'Alias';

  @override
  String get all => 'Todo';

  @override
  String get allChats => 'Todos los chats';

  @override
  String get commandHint_roomupgrade =>
      'Actualizar este chat a la versión indicada';

  @override
  String get commandHint_googly => 'Enviar unos ojos locos';

  @override
  String get commandHint_cuddle => 'Enviar un abrazo';

  @override
  String get commandHint_hug => 'Mandar un abrazo';

  @override
  String googlyEyesContent(String senderName) {
    return '$senderName te manda ojos locos';
  }

  @override
  String cuddleContent(String senderName) {
    return '$senderName se acurruca contigo 💕';
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
  String get appLock => 'Bloqueo de la app';

  @override
  String get appLockDescription =>
      'Bloquea la app con un PIN cuando no la estés usando';

  @override
  String get archive => 'Archivo';

  @override
  String get unArchive => 'Desarchivar';

  @override
  String get areGuestsAllowedToJoin =>
      'Se permite que los usuarios invitados se unan?';

  @override
  String get areYouSure => 'Estás seguro?';

  @override
  String get areYouSureYouWantToLogout =>
      'Estás seguro de que quieres cerrar sesión?';

  @override
  String get askSSSSSign =>
      'Para poder firmar a la otra persona, por favor ingresa tu frase de seguridad o clave de recuperación.';

  @override
  String askVerificationRequest(String username) {
    return 'Aceptar esta solicitud de verificación de $username?';
  }

  @override
  String get autoplayImages =>
      'Reproducir automáticamente emoticonos y stickers animados';

  @override
  String badServerLoginTypesException(String serverVersions,
      String supportedVersions, Object suportedVersions) {
    return 'El servidor principal admite los tipos de inicio de sesión:\n$serverVersions\nPero esta app solo admite:\n$supportedVersions';
  }

  @override
  String get sendTypingNotifications =>
      'Enviar notificaciones \"está escribiendo\"';

  @override
  String get swipeRightToLeftToReply =>
      'Desliza hacia la izquierda para responder';

  @override
  String get alwaysShowMessageTimestamps =>
      'Mostrar siempre la hora de los mensajes';

  @override
  String get alwaysShowMessageTimestampsDescription =>
      'Mostrar la hora en cada mensaje, como en WhatsApp';

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
    return '$chats charlas y $participants Los participantes';
  }

  @override
  String countMembers(int count) {
    return '$count Miembros';
  }

  @override
  String get noMoreChatsFound => 'Ya no se encontraron más charlas...';

  @override
  String get noChatsFoundHere =>
      'No se encontraron charlas. Inicia uno nuevo con el botón de abajo. ⤵️';

  @override
  String get joinedChats => 'chats unidos';

  @override
  String get unread => 'No leídos';

  @override
  String get space => 'Espacio';

  @override
  String get spaces => 'Espacios';

  @override
  String get banFromChat => 'Prohibir del chat';

  @override
  String get banned => 'Prohibido';

  @override
  String bannedUser(String username, String targetName) {
    return '$username prohibió a $targetName';
  }

  @override
  String get blockDevice => 'Bloquear dispositivo';

  @override
  String get blocked => 'Bloqueado';

  @override
  String get botMessages => 'Mensajes del bot';

  @override
  String get cancel => 'Cancelar';

  @override
  String cantOpenUri(String uri) {
    return 'No se puede abrir el URI $uri';
  }

  @override
  String get changeDeviceName => 'Cambiar nombre del dispositivo';

  @override
  String changedTheChatAvatar(String username) {
    return '$username cambió el avatar del chat';
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
    return '$username cambió su nombre para mostrar a: \'$displayname\'';
  }

  @override
  String changedTheGuestAccessRules(String username) {
    return '$username cambió las reglas de acceso para invitados';
  }

  @override
  String changedTheGuestAccessRulesTo(String username, String rules) {
    return '$username cambió las reglas de acceso para invitados a: $rules';
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
    return '$username cambió su avatar';
  }

  @override
  String changedTheRoomAliases(String username) {
    return '$username cambió los alias de la sala';
  }

  @override
  String changedTheRoomInvitationLink(String username) {
    return '$username cambió el enlace de invitación';
  }

  @override
  String get changePassword => 'Cambiar contraseña';

  @override
  String get changeTheHomeserver => 'Cambiar el servidor principal';

  @override
  String get changeTheme => 'Cambia tu estilo';

  @override
  String get changeTheNameOfTheGroup => 'Cambiar el nombre del grupo';

  @override
  String get changeYourAvatar => 'Cambiar tu avatar';

  @override
  String get channelCorruptedDecryptError => 'El cifrado se ha dañado';

  @override
  String get chat => 'Chat';

  @override
  String get yourChatBackupHasBeenSetUp =>
      'Se ha configurado la copia de respaldo del chat.';

  @override
  String get welcome => 'Te damos la\nBienvenida';

  @override
  String get welcomeSubtitle => 'A una experiencia sin precedentes';

  @override
  String get welcomeDescription =>
      'Aquí no solo tienes una app. Tienes tu mundo en la palma de la mano: conecta, compra, paga, explora y transforma tu día… sin salir de Bemind';

  @override
  String get getStarted => 'Comenzar';

  @override
  String get chatTitle => 'Chat';

  @override
  String get chatSubtitle => 'Chat, comparte y paga todo en un solo lugar.';

  @override
  String get chatDescription =>
      'Habla, comparte y paga, todo en un solo lugar.\nEnvía mensajes, comparte archivos, haz llamadas e incluso paga directamente dentro del chat.';

  @override
  String get goToChat => 'Ir al Chat';

  @override
  String get financeTitle => 'Finanzas';

  @override
  String get financeSubtitle => 'Tu dinero, hecho simple.';

  @override
  String get financeDescription =>
      'Envía, recibe, convierte, paga con QR o agrega fondos, todo en un solo lugar. Sin complicaciones. Sin sorpresas.';

  @override
  String get goToWallet => 'Ir a la Billetera';

  @override
  String get marketplaceTitle => 'Marketplace';

  @override
  String get marketplaceSubtitle =>
      'Compra sin buscar - encuentra lo que necesitas.';

  @override
  String get marketplaceDescription =>
      'Productos, servicios y experiencias seleccionados para ti. Precios reales, sin compromisos, y todo pagado con tu billetera, directamente desde la app.';

  @override
  String get goToMarketplace => 'Ir al Marketplace';

  @override
  String get appsTitle => 'Apps';

  @override
  String get appsSubtitle => 'Tus apps favoritas, ya integradas.';

  @override
  String get appsDescription =>
      'Desde delivery y viajes hasta suscripciones y reservas - todo está a solo un toque de distancia.';

  @override
  String get goToApps => 'Ir a Apps';

  @override
  String get communitiesTitle => 'Comunidades';

  @override
  String get communitiesSubtitle => 'Conecta, comparte y crea.';

  @override
  String get communitiesDescription =>
      'Descubre lo que otros comparten - o comparte lo tuyo. Esto no es solo redes sociales... es tu espacio, tu voz, tu lugar en el mundo digital.';

  @override
  String get goToCommunity => 'Ir a Comunidad';

  @override
  String get music => 'Música';

  @override
  String get yourRhythmYourSpace => 'Tu ritmo, tu espacio';

  @override
  String get musicDescription =>
      'Escucha tus canciones favoritas mientras chateas, compras o exploras - todo en un solo lugar. Dale play a lo que te hace sentir bien.';

  @override
  String get mentalHealth => 'Salud Mental';

  @override
  String get yourPeaceAlsoMatters => 'Tu paz también importa';

  @override
  String get mentalHealthDescription =>
      'Herramientas y recursos para tu bienestar emocional. Meditación, ejercicios de mindfulness y apoyo profesional cuando más lo necesites.';

  @override
  String get aiFinance => 'I.A: Finanzas';

  @override
  String get letMoneyThinkToo => 'Deja que el dinero también piense';

  @override
  String get aiFinanceDescription =>
      'Inteligencia artificial que te ayuda a tomar decisiones financieras más inteligentes. Análisis automático, recomendaciones personalizadas e insights predictivos.';

  @override
  String get nutrition => 'Nutrición';

  @override
  String get eatWithoutComplications => 'Come sin complicaciones';

  @override
  String get nutritionDescription =>
      'Obtén recetas personalizadas basadas en lo que tienes en tu nevera, menús personalizados, alertas útiles - y consejos diarios para ayudarte a sentirte mejor.';

  @override
  String get accessDenied => 'Acceso Denegado';

  @override
  String get searchError => 'Error de Búsqueda';

  @override
  String get accessRequired => 'Acceso Requerido';

  @override
  String get cameraAccessRequired =>
      'Se necesita acceso a la cámara para la verificación de documentos KYC. Por favor, habilita el permiso de cámara en la configuración de la app.';

  @override
  String get openSettings => 'Abrir Configuración';

  @override
  String get success => 'Éxito';

  @override
  String get info => 'Información';

  @override
  String get loading => 'Cargando...';

  @override
  String get joinMeOnBeMindPower => '¡Únete a mí en Be MindPower!';

  @override
  String inviteMessageBody(String displayName) {
    return 'Hola, soy $displayName y me gustaría invitarte a chatear conmigo en Be MindPower.';
  }

  @override
  String downloadTheApp(String url) {
    return 'Descarga la app: $url';
  }

  @override
  String get beMindPowerTagline =>
      'Be MindPower - ¡Conéctate, Chatea y Crece Juntos!';

  @override
  String failedToCreateInvite(String error) {
    return 'Error al crear invitación: $error';
  }

  @override
  String get emailVerification => 'Verificación de correo';

  @override
  String get verifyingYourEmail => 'Verificando tu correo...';

  @override
  String get pleaseWaitWhileWeCompleteRegistration =>
      'Por favor espera mientras completamos tu registro.';

  @override
  String get registrationComplete => '¡Registro completo!';

  @override
  String get emailVerifiedAndAutoLoginSuccessful =>
      'Correo verificado e inicio de sesión automático exitoso.\nRedirigiendo a tu panel...';

  @override
  String get verificationFailed => 'La verificación falló';

  @override
  String get tryAgain => 'Inténtelo de nuevo';

  @override
  String get emailVerifiedRedirecting =>
      '¡Correo verificado! Redirigiendo al inicio de sesión...';

  @override
  String get emailVerificationFailedTryAgain =>
      'La verificación de correo falló. Por favor intenta nuevamente.';

  @override
  String get verificationError => 'Error de verificación';

  @override
  String get goToLogin => 'Ir al inicio de sesión';

  @override
  String get pleaseLogInToAccessArchive =>
      'Por favor inicia sesión para acceder al archivo';

  @override
  String get error => 'Error';

  @override
  String get errorAccessingArchive => 'Error al acceder al archivo';

  @override
  String get contacts => 'Contactos';

  @override
  String get filter => 'Filtro';

  @override
  String get unreadChat => 'Chat No Leído';

  @override
  String get noResultsFound => 'No se encontraron resultados';

  @override
  String get search => 'Buscar';

  @override
  String get select => 'Seleccionar';

  @override
  String get markRead => 'Marcar como Leído';

  @override
  String get markUnread => 'Marcar como No Leído';

  @override
  String get blockUser => 'Bloquear Usuario';

  @override
  String get read => 'Leer';

  @override
  String get myWallet => 'Mi Billetera';

  @override
  String get myBank => 'Mi Banco';

  @override
  String get home => 'Inicio';

  @override
  String get logout => 'Cerrar Sesión';

  @override
  String get favorites => 'Favoritos';

  @override
  String get unfavorite => 'Quitar de\nfavoritos';

  @override
  String get noFavoritesYet => 'Aún no hay favoritos';

  @override
  String get starMessagesToAddFavorites =>
      'Marca mensajes con estrella para añadirlos a favoritos';

  @override
  String get removedFromFavorites => 'Eliminado de favoritos';

  @override
  String get unknownRoom => 'Sala desconocida';

  @override
  String get unknownTime => 'Hora desconocida';

  @override
  String errorWithMessage(String message) {
    return 'Error: $message';
  }

  @override
  String get newMessage => 'Nuevo mensaje';

  @override
  String get searchUsers => 'Buscar @usuarios...';

  @override
  String yourGlobalUsernameIs(String username) {
    return 'Tu nombre de usuario global es: @$username';
  }

  @override
  String get invitationLink => 'Enlace de invitación';

  @override
  String get sendLinkToChat => 'Envía un enlace para chatear.';

  @override
  String get createGroupChat => 'Crear chat grupal.';

  @override
  String get scanQRCode => 'Escanear QR';

  @override
  String get scanQRCodeDescription => 'Escanear un código QR.';

  @override
  String get errorSearchingUsers => 'Error buscando usuarios';

  @override
  String get noUsersFound => 'No se encontraron usuarios';

  @override
  String get permissionDenied => 'Permiso Denegado';

  @override
  String get searchContact => 'Buscar contacto';

  @override
  String get noContactsFound => 'No se encontraron contactos';

  @override
  String get group => 'Grupo';

  @override
  String get calls => 'Llamadas';

  @override
  String get done => '¡Listo!';

  @override
  String get taskCompletedSuccessfully => 'Tarea completada\nexitosamente';

  @override
  String get goBack => 'Volver';

  @override
  String get signupSuccessMessage => 'Te has registrado \nexitosamente';

  @override
  String get chatBackup => 'Copia de seguridad del chat';

  @override
  String get chatBackupDescription =>
      'Tus mensajes antiguos están protegidos con una clave de recuperación. Asegúrate de no perderla.';

  @override
  String get thisMonthIsOnUs => 'Este mes es por nuestra cuenta';

  @override
  String get ifYouLoveItContinueFor => 'Si te encanta, continúa por';

  @override
  String get thenEnjoyMemberPriceForJust =>
      'Luego disfruta de un precio de miembro por solo';

  @override
  String get usdMonth => 'USD mes';

  @override
  String get yearlyPlanOfferText =>
      'También puedes obtener nuestro plan anual por solo:';

  @override
  String get confirmYourSelection => 'Confirma tu selección';

  @override
  String get subscriptionActivated => '¡Suscripción activada!';

  @override
  String get chatDetails => 'Detalles del chat';

  @override
  String get chatHasBeenAddedToThisSpace =>
      'El chat ha sido agregado a este espacio';

  @override
  String get chats => 'Chats';

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
  String get commandHint_clearcache => 'Limpiar caché';

  @override
  String get commandHint_create =>
      'Crear un chat grupal vacío\nUse --no-encryption para deshabilitar el cifrado';

  @override
  String get commandHint_discardsession => 'Descartar sesión';

  @override
  String get commandHint_dm =>
      'Inicia un chat directo\nUsa --no-encryption para desactivar el cifrado';

  @override
  String get commandHint_html => 'Enviar texto con formato HTML';

  @override
  String get commandHint_invite => 'Invitar al usuario indicado a esta sala';

  @override
  String get commandHint_join => 'Únete a la sala indicada';

  @override
  String get commandHint_kick => 'Eliminar al usuario indicado de esta sala';

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
  String get commandHint_unban => 'Desbanear al usuario dado en esta sala';

  @override
  String get commandInvalid => 'Comando inválido';

  @override
  String commandMissing(String command) {
    return '$command no es un comando.';
  }

  @override
  String get compareEmojiMatch => 'Por favor, compara los emojis';

  @override
  String get compareNumbersMatch => 'Por favor, compara los números';

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
    return '$count invitado(s)';
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
      'Esto desactivará tu cuenta de usuario. ¡No se puede deshacer! Estás seguro?';

  @override
  String get defaultPermissionLevel =>
      'Nivel de permiso predeterminado para nuevos usuarios';

  @override
  String get delete => 'Eliminar';

  @override
  String get deleteAccount => 'Eliminar cuenta';

  @override
  String get deleteMessage => 'Eliminar mensaje';

  @override
  String get device => 'Dispositivo';

  @override
  String get deviceId => 'ID del dispositivo';

  @override
  String get devices => 'Dispositivos';

  @override
  String get directChats => 'chats directos';

  @override
  String get allRooms => 'Todos los charlas grupales';

  @override
  String get displaynameHasBeenChanged => 'El nombre mostrado ha sido cambiado';

  @override
  String get downloadFile => 'Descargar archivo';

  @override
  String get edit => 'Editar';

  @override
  String get editBlockedServers => 'Editar servidores bloqueados';

  @override
  String get chatPermissions => 'Permisos del chat';

  @override
  String get editDisplayname => 'Editar nombre mostrado';

  @override
  String get editRoomAliases => 'Editar alias de sala';

  @override
  String get editRoomAvatar => 'Editar avatar de sala';

  @override
  String get emoteExists => '¡El emoticón ya existe!';

  @override
  String get emoteInvalid => '¡Código corto de emoticón inválido!';

  @override
  String get emoteKeyboardNoRecents => 'Los emotes que uses aparecerán aquí...';

  @override
  String get emotePacks => 'Paquetes de emoticones para la sala';

  @override
  String get emoteSettings => 'Configuración de emoticones';

  @override
  String get globalChatId => 'ID de chat global';

  @override
  String get accessAndVisibility => 'Acceso y visibilidad';

  @override
  String get accessAndVisibilityDescription =>
      'Define quién puede unirse a este chat y cómo puede ser encontrado.';

  @override
  String get customEmojisAndStickers => 'Emojis y stickers personalizados';

  @override
  String get customEmojisAndStickersBody =>
      'Agrega o comparte emojis y stickers personalizados que podrás usar en cualquier chat.';

  @override
  String get emoteShortcode => 'Código corto del emoticón';

  @override
  String get emoteWarnNeedToPick =>
      '¡Debes elegir un código corto y una imagen para el emoticón!';

  @override
  String get emptyChat => 'Chat vacío';

  @override
  String get enableEmotesGlobally =>
      'Habilitar paquete de emoticones globalmente';

  @override
  String get enableEncryption => 'Habilitar la encriptación';

  @override
  String get enableEncryptionWarning =>
      'Ya no podrás desactivar el cifrado. Estás seguro?';

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
      'Ingresa una dirección de correo electrónico';

  @override
  String get homeserver => 'Servidor inicial';

  @override
  String get enterYourHomeserver => 'Ingresa tu servidor principal';

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
      'La descripción del chat fue actualizada';

  @override
  String get groupIsPublic => 'El grupo es público';

  @override
  String get groups => 'Grupos';

  @override
  String groupWith(String displayname) {
    return 'Grupo con $displayname';
  }

  @override
  String get guestsAreForbidden => 'Los invitados están prohibidos';

  @override
  String get guestsCanJoin => 'Los invitados pueden unirse';

  @override
  String hasWithdrawnTheInvitationFor(String username, String targetName) {
    return '$username ha retirado la invitación para $targetName';
  }

  @override
  String get help => 'Ayuda';

  @override
  String get hideRedactedEvents => 'Ocultar eventos redactados';

  @override
  String get hideRedactedMessages => 'Ocultar mensajes eliminados';

  @override
  String get hideRedactedMessagesBody =>
      'Si alguien borra un mensaje, ya no se mostrará en el chat.';

  @override
  String get hideInvalidOrUnknownMessageFormats =>
      'Ocultar mensajes con formato inválido o desconocido';

  @override
  String get howOffensiveIsThisContent => 'Qué tan ofensivo es este contenido?';

  @override
  String get id => 'ID';

  @override
  String get identity => 'Identidad';

  @override
  String get block => 'Bloquear';

  @override
  String get blockedUsers => 'Usuarios bloqueados';

  @override
  String get blockListDescription =>
      'Puedes bloquear a los usuarios que te estén molestando. No recibirás mensajes ni invitaciones de chat de quienes estén en tu lista de bloqueados.';

  @override
  String get blockUsername => 'Ignorar nombre de usuario';

  @override
  String get iHaveClickedOnLink => 'He hecho clic en el enlace';

  @override
  String get incorrectPassphraseOrKey =>
      'Frase de seguridad o clave de recuperación incorrecta';

  @override
  String get inoffensive => 'Inofensivo';

  @override
  String get inviteContact => 'Invitar contacto';

  @override
  String inviteContactToGroupQuestion(Object contact, Object groupName) {
    return 'Quieres invitar a $contact al chat $groupName?';
  }

  @override
  String inviteContactToGroup(String groupName) {
    return 'Invitar contacto a $groupName';
  }

  @override
  String get noChatDescriptionYet =>
      'Aún no se ha agregado una descripción del chat.';

  @override
  String get hangup => 'Colgar';

  @override
  String get logoutConfirmTitle => 'Cerrar sesión';

  @override
  String get logoutConfirmMessage => 'Seguro que quieres cerrar sesión?';

  @override
  String get logoutButton => 'Cerrar sesión';

  @override
  String get comingSoon => 'Próximamente';

  @override
  String get searchApps => 'Buscar aplicaciones...';

  @override
  String get education => 'Educación';

  @override
  String get game => 'Juegos';

  @override
  String get sport => 'Deportes';

  @override
  String get animal => 'Animales';

  @override
  String get love => 'Amor';

  @override
  String get traveling => 'Viajes';

  @override
  String get automotive => 'Automotriz';

  @override
  String get popular => 'Popular';

  @override
  String get food => 'Comida';

  @override
  String get health => 'Salud';

  @override
  String get shopping => 'Compras';

  @override
  String get art => 'Arte';

  @override
  String get spiritual => 'Espiritual';

  @override
  String get maintenance => 'Mantenimiento';

  @override
  String get lifestyle => 'Estilo de vida';

  @override
  String get construction => 'Construcción';

  @override
  String get camera => 'Cámara';

  @override
  String get comingSoonEllipsis => 'Próximamente...';

  @override
  String get exploreFeatures => 'Explorar funciones';

  @override
  String get welcomeToBeMindPower => 'Bienvenido a \n Be MindPower';

  @override
  String get signUpForAnAccount => 'Regístrate para obtener una cuenta';

  @override
  String get whatTypeOfAccountDoYouWantToOpen =>
      'Qué tipo de cuenta quieres abrir?';

  @override
  String get naturalPerson => 'Persona física';

  @override
  String get verificationEmailSent => '¡Correo de verificación enviado!';

  @override
  String get pleaseCheckEmailAndVerify =>
      'Por favor revisa tu correo y haz clic en el enlace de verificación, luego presiona \"Completar registro\".';

  @override
  String get clickCompleteAfterVerifying =>
      'Haz clic en \"Completar registro\" después de verificar tu correo.';

  @override
  String get completeRegistration => 'Completar registro';

  @override
  String get startOver => 'Empezar de nuevo';

  @override
  String get successfullyRegistered => '¡Registro exitoso!';

  @override
  String get emailVerificationRequired => 'Se requiere verificación de correo';

  @override
  String get pleaseVerifyEmailFirst =>
      'Por favor verifica tu correo primero haciendo clic en el enlace de verificación, luego inténtalo de nuevo.';

  @override
  String get sessionExpiredStartOver =>
      'Tu sesión ha expirado. Por favor, inicia el registro nuevamente.';

  @override
  String get pleaseVerifyEmailBeforeCompleting =>
      'Por favor verifica tu correo antes de completar el registro.';

  @override
  String get gotIt => 'Entendido';

  @override
  String get createPassword => 'Crear contraseña';

  @override
  String get enterYourPassword => 'Ingresa tu contraseña';

  @override
  String get confirmPassword => 'Confirmar contraseña';

  @override
  String get alreadyHaveAccount => 'Ya tienes una cuenta?';

  @override
  String get logIn => 'Iniciar sesión';

  @override
  String get federationBaseURL => 'URL base de la federación';

  @override
  String get clientWellKnownInformation => 'Información Client-Well-Known:';

  @override
  String get baseURL => 'URL base';

  @override
  String get identityServer => 'Servidor de identidad:';

  @override
  String get defaultPack => 'Paquete predeterminado';

  @override
  String get pushError => 'Error de notificación push';

  @override
  String get deleteError => 'Error al eliminar';

  @override
  String get answer => 'Responder';

  @override
  String heldTheCall(String displayName) {
    return '$displayName puso la llamada en espera.';
  }

  @override
  String get youHeldTheCall => 'Pusiste la llamada en espera.';

  @override
  String get foregroundServiceRunning =>
      'Esta notificación aparece cuando el servicio en segundo plano está activo.';

  @override
  String get screenSharingTitle => 'Compartir pantalla';

  @override
  String get screenSharingDetail =>
      'Usted está compartiendo su pantalla en BMP';

  @override
  String get emailVerificationFailed =>
      'La verificación del correo electrónico falló';

  @override
  String get unableToGetSession =>
      'No se pudo obtener la sesión para el registro';

  @override
  String get registrationFailed => 'El registro falló';

  @override
  String get networkError =>
      'Error de red. Por favor verifica tu conexión e intenta de nuevo.';

  @override
  String emailVerificationFailedWithError(String error) {
    return 'La verificación del correo electrónico falló: $error';
  }

  @override
  String get registrationDataNotFound =>
      'Datos de registro no encontrados. Por favor, inicia el registro nuevamente.';

  @override
  String get usernameAlreadyExists => 'El nombre de usuario ya existe';

  @override
  String get unableToGetSessionTryAgain =>
      'No se pudo obtener la sesión. Por favor, inténtalo de nuevo.';

  @override
  String get emailNotVerifiedYet =>
      'Correo electrónico aún no verificado. Por favor revisa tu bandeja de entrada y haz clic en el enlace de verificación.';

  @override
  String get usernameAlreadyExistsChooseDifferent =>
      'El nombre de usuario ya existe. Por favor, elige un nombre de usuario diferente.';

  @override
  String get emailAlreadyRegistered =>
      'Correo electrónico ya registrado. Por favor usa otro correo.';

  @override
  String get emailAlreadyExist => 'Correo electrónico ya registrado';

  @override
  String get networkErrorCheckConnection =>
      'Error de red. Por favor, verifica tu conexión e inténtalo de nuevo.';

  @override
  String get bmpDescription =>
      'BMP te permite chatear con tus amigos a través de diferentes servicios de mensajería.';

  @override
  String get signUp => 'Registrarse';

  @override
  String photos(int count) {
    return '$count fotos';
  }

  @override
  String videos(int count) {
    return '$count Vídeos';
  }

  @override
  String files(int count) {
    return 'Archivos';
  }

  @override
  String audio(int count) {
    return '$count audios';
  }

  @override
  String get sharedMedia => 'Medios compartidos';

  @override
  String items(int count) {
    return '$count elementos';
  }

  @override
  String get noMediaToShow => 'No hay medios para mostrar';

  @override
  String get beTheFirstToShareAMoment =>
      'Sé el primero en compartir un momento';

  @override
  String get file => 'Archivo';

  @override
  String opening(String fileName) {
    return 'Abriendo $fileName';
  }

  @override
  String get renameChannel => 'Renombrar canal';

  @override
  String get renameGroupChannel => 'Renombrar canal del grupo';

  @override
  String get renameGroup => 'Renombrar grupo';

  @override
  String get changeGroupName => 'Cambiar el nombre del grupo';

  @override
  String get setCustomEmotes => 'Establecer emoticonos personalizados';

  @override
  String get whoCanPerformWhichAction => 'Quién puede realizar qué acción';

  @override
  String get setting => 'Configuración';

  @override
  String get financePersonalInfo => 'Información personal';

  @override
  String get financeAddress => 'Dirección';

  @override
  String get financeID => 'Identificación';

  @override
  String get financeTermsOfService => 'Términos de servicio';

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
      'Error al aceptar los Términos de Servicio';

  @override
  String get financeTermsAcceptanceRequired =>
      'Es necesario aceptar los términos';

  @override
  String get financeIncompleteFields =>
      'Por favor completa todos los campos requeridos';

  @override
  String get financeValidEmail => 'Correo electrónico válido';

  @override
  String get financeBirthDate => 'Fecha de nacimiento';

  @override
  String get financeStreetAddress => 'Dirección';

  @override
  String get financeCity => 'Ciudad';

  @override
  String get financeCountry => 'País';

  @override
  String get financeState => 'Estado';

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
      'Ocurrió un error. Por favor, inténtalo de nuevo.';

  @override
  String financeFailedToSetPIN(String message) {
    return 'Error al establecer el PIN: $message';
  }

  @override
  String get financeCustomerUpdatedSuccess =>
      'Cliente actualizado exitosamente';

  @override
  String get financeFirstName => 'Nombre';

  @override
  String get financeLastName => 'Apellido';

  @override
  String get unableToPlayVideo => 'No se puede reproducir el video';

  @override
  String get notImplemented => 'No implementado';

  @override
  String get loadingEmojiVerification => 'Cargando verificación de emoji...';

  @override
  String get preparingEmojiVerification =>
      'Preparando verificación de emoji...';

  @override
  String get verificationCodesDontMatch =>
      'Los códigos de verificación no coinciden. Por favor, inténtalo de nuevo.';

  @override
  String get verificationCancelled => 'Verificación cancelada';

  @override
  String get otherUserCancelledVerification =>
      'El otro usuario canceló la verificación.';

  @override
  String get verificationTimeout => 'Tiempo de verificación agotado';

  @override
  String get verificationTimedOut =>
      'Se agotó el tiempo de verificación. Por favor, inténtalo de nuevo.';

  @override
  String get unknownVerificationTransaction =>
      'Transacción de verificación desconocida.';

  @override
  String get methodNotSupported => 'Método no soportado';

  @override
  String get verificationMethodNotSupported =>
      'Este método de verificación no es compatible.';

  @override
  String get unexpectedMessageReceived =>
      'Se recibió un mensaje inesperado durante la verificación.';

  @override
  String get keyVerificationFailed => 'Verificación de clave fallida';

  @override
  String get keysCouldNotBeVerified =>
      'Las claves no pudieron ser verificadas.';

  @override
  String get userVerificationFailed => 'Verificación de usuario fallida';

  @override
  String get userIdentityCouldNotBeVerified =>
      'La identidad del usuario no pudo ser verificada.';

  @override
  String get invalidMessage => 'Mensaje inválido';

  @override
  String get invalidMessageReceived =>
      'Se recibió un mensaje inválido durante la verificación.';

  @override
  String get alreadyVerified => 'Ya verificado';

  @override
  String get verificationAlreadyAccepted =>
      'Esta verificación ya fue aceptada en otro dispositivo.';

  @override
  String get verificationCancelledByOtherUser =>
      'La verificación fue cancelada por el otro usuario.';

  @override
  String get tourGuide => 'Guía turística';

  @override
  String get finance => 'Finanzas';

  @override
  String get marketplace => 'Mercado';

  @override
  String get community => 'Comunidad';

  @override
  String get apps => 'Aplicaciones';

  @override
  String get addContacts => 'Agregar contactos';

  @override
  String get goBackToAllChats => 'Regresar a todos los chats';

  @override
  String failedToInviteUser(String roomId) {
    return 'Error al invitar al usuario de la sala $roomId';
  }

  @override
  String get unableToCreateGroup => 'No se pudo crear el grupo';

  @override
  String get pleaseFillOut => 'Por favor completa';

  @override
  String get newGroup => 'Nuevo grupo';

  @override
  String get imageGroup => 'Imagen del grupo';

  @override
  String get groupName => 'Nombre del grupo';

  @override
  String get enterGroupName => 'Ingresa el nombre del grupo';

  @override
  String get changeNameGroup => 'Cambiar nombre del grupo';

  @override
  String get publicGroup => 'Grupo público';

  @override
  String get privateGroup => 'Grupo privado';

  @override
  String get anyoneCanFindAndJoin =>
      'Cualquiera puede encontrar y unirse a este grupo';

  @override
  String get onlyInvitedMembersCanJoin =>
      'Solo los miembros invitados pueden unirse a este grupo';

  @override
  String get endToEndEncryption => 'Cifrado de extremo a extremo';

  @override
  String get messagesWillBeEncrypted =>
      'Los mensajes serán cifrados por seguridad';

  @override
  String get messagesWillNotBeEncrypted => 'Los mensajes no serán cifrados';

  @override
  String get pleaseEnterGroupNameFirst =>
      'Por favor ingresa el nombre del grupo primero';

  @override
  String get selectFromYourContacts => 'Selecciona de tus contactos';

  @override
  String get contactsInGroup => 'Contactos en el grupo';

  @override
  String get unsupportedVersion => 'Versión no soportada';

  @override
  String get copied => 'Copiado';

  @override
  String qrCodeScanned(String link) {
    return 'Código QR escaneado: $link';
  }

  @override
  String usernameServer(String username, String server) {
    return 'Usuario: $username, Servidor: $server';
  }

  @override
  String extractedUserId(String userId) {
    return 'ID de usuario extraído: $userId';
  }

  @override
  String get matrixUrlDetected => 'URL de Matrix.to u otro formato detectado';

  @override
  String get addCaption => 'Agrega un título...';

  @override
  String get selectContact => 'Seleccionar contacto';

  @override
  String get scanQR => 'Escanear QR';

  @override
  String get messages => 'Mensajes';

  @override
  String get decline => 'Rechazar';

  @override
  String youInvitedBy(String user) {
    return 'Te invitó $username';
  }

  @override
  String get invalidServerName => 'Nombre de servidor inválido';

  @override
  String get archiveRoomDescription =>
      'Estás seguro de que quieres archivar esta sala?';

  @override
  String get hidePresences => 'Ocultar presencias';

  @override
  String get leaveEmptyToClearStatus => 'Deja vacío para borrar el estado';

  @override
  String get removeFromBundle => 'Eliminar del paquete';

  @override
  String get encryptionSetupRequired =>
      'Se requiere configuración de cifrado para mensajería segura. Por favor completa la configuración en Ajustes.';

  @override
  String get warning => '¡Advertencia!';

  @override
  String get noDevicesSelectedForRemoval =>
      'No hay dispositivos seleccionados para eliminar';

  @override
  String get deviceDeletionNotAllowed =>
      'Eliminación de dispositivo no permitida: Estos dispositivos pueden estar protegidos, activos recientemente, o requerir permisos adicionales del administrador del servidor. Este mensaje no aparecerá de nuevo.';

  @override
  String get deviceDeletionFailed =>
      'Eliminación de dispositivo fallida: El servidor rechazó la solicitud.';

  @override
  String failedToRemoveDevices(String error) {
    return 'Error al eliminar dispositivos: $error';
  }

  @override
  String get devicesRemovedSuccessfully =>
      'Dispositivos eliminados exitosamente';

  @override
  String errorRemovingDevices(String error) {
    return 'Error eliminando dispositivos: $error';
  }

  @override
  String get verifyOtherDevice => 'Verificar otro dispositivo';

  @override
  String get verifyOtherDeviceDescription =>
      'Quieres verificar este dispositivo?';

  @override
  String get removeDevicesDescription =>
      'Estás seguro de que quieres eliminar los dispositivos seleccionados?';

  @override
  String get failedToLoadChat =>
      'Error al cargar el chat. Por favor, inténtalo de nuevo.';

  @override
  String get encryptionIssue => 'Problema de cifrado';

  @override
  String get encryptionStatus => 'Estado del cifrado';

  @override
  String get room => 'Sala';

  @override
  String get clientReady => 'Cliente listo';

  @override
  String get roomReady => 'Sala lista';

  @override
  String get canReceive => 'Puede recibir';

  @override
  String get recommendations => 'Recomendaciones';

  @override
  String get fixEncryption => 'Arreglar cifrado';

  @override
  String get addedToFavorites => 'Agregado a favoritos';

  @override
  String get transferOnlyDirectChats =>
      'Las transferencias solo están disponibles en charlas directos';

  @override
  String get transferSuccessful => 'Transferencia exitosa:';

  @override
  String get messageForwardedSuccessfully => 'Mensaje reenviado exitosamente';

  @override
  String get callsOnlyDirectChats =>
      'Las llamadas solo están disponibles en charlas directos.';

  @override
  String get mustBeMemberToCall =>
      'Debes ser miembro de esta sala para iniciar una llamada.';

  @override
  String get cannotDetermineCallRecipient =>
      'No se puede determinar el destinatario de la llamada.';

  @override
  String get voiceVideoCallsNotAvailable =>
      'Las llamadas de voz y video no están disponibles. Por favor, habilítalas en configuración.';

  @override
  String get failedToStartCall => 'Error al iniciar llamada';

  @override
  String get startGroupCall => 'Iniciar llamada grupal';

  @override
  String get chooseGroupCallType => 'Elige el tipo de llamada grupal:';

  @override
  String get voiceGroupCall => 'Llamada grupal de voz';

  @override
  String get videoGroupCall => 'Videollamada grupal';

  @override
  String get startCall => 'Iniciar llamada';

  @override
  String get chooseCallType => 'Elige el tipo de llamada que quieres hacer:';

  @override
  String get makeYourFirstCall => 'Haz tu primera llamada';

  @override
  String get checkBackLater => 'o vuelve más tarde para ver nueva actividad';

  @override
  String get startAConversation => 'Inicia una\nConversación';

  @override
  String get sendMessageToGetStarted => 'Envía un mensaje para comenzar';

  @override
  String get noParticipantsGroupCall =>
      'No hay participantes disponibles para la llamada grupal.';

  @override
  String get groupCallsInDevelopmentDirectOnly =>
      'Las llamadas grupales están en desarrollo. Por favor, usa llamadas directas por ahora.';

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
    return '$username te invitó a BMP.\n1. Visita nuestro sitio web e instala la app \n2. Regístrate o inicia sesión \n3. Abre el enlace de invitación: \n $link';
  }

  @override
  String get gallery => 'Galería';

  @override
  String get document => 'Documento';

  @override
  String get location => 'Ubicación';

  @override
  String get contact => 'Contacto';

  @override
  String get send => 'Enviar';

  @override
  String get request => 'Solicitar';

  @override
  String get qr => 'Código QR';

  @override
  String get replaceOldestPin => '¿Reemplazar el pin más antiguo?';

  @override
  String get yourNewPinWillReplace =>
      'Tu nuevo pin reemplazará el más antiguo.';

  @override
  String get gift => 'Regalo';

  @override
  String get favorite => 'Favorito';

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
  String get recoveryKeyLost => 'Perdió su clave de recuperación?';

  @override
  String get wipeChatBackup =>
      'Limpiar la copia de seguridad de tu chat para crear una nueva clave de recuperación?';

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
    return '👞$username expulsó a $targetName';
  }

  @override
  String kickedAndBanned(String username, String targetName) {
    return '🙅$username expulsó y bloqueó a $targetName';
  }

  @override
  String get kickFromChat => 'Expulsar del chat';

  @override
  String lastActiveAgo(String localizedTimeShort) {
    return 'Última actividad: $localizedTimeShort';
  }

  @override
  String get leave => 'Salir';

  @override
  String get leftTheChat => 'Salió del chat';

  @override
  String get license => 'Licencia';

  @override
  String get lightTheme => 'Claro';

  @override
  String loadCountMoreParticipants(int count) {
    return 'Cargar $count participantes más';
  }

  @override
  String get dehydrate => 'Exportar sesión y limpiar el dispositivo';

  @override
  String get dehydrateWarning =>
      'Esta acción no se puede deshacer. Asegúrate de guardar de forma segura el archivo de respaldo.';

  @override
  String get dehydrateTor => 'TOR: Exportar sesión';

  @override
  String get dehydrateTorLong =>
      'Si estás usando TOR, se recomienda exportar tu sesión antes de cerrar la ventana.';

  @override
  String get hydrateTor => 'TOR: Importar sesión exportada';

  @override
  String get hydrateTorLong =>
      'Exportaste tu sesión la última vez que usaste TOR? Impórtala rápido y sigue chateando.';

  @override
  String get hydrate => 'Restaurar desde fichero de copia de seguridad';

  @override
  String get loadingPleaseWait => 'Cargando, por favor espera...';

  @override
  String get loadMore => 'Cargar más';

  @override
  String get locationDisabledNotice =>
      'Los servicios de ubicación están deshabilitados. Habilite para poder compartir su ubicación.';

  @override
  String get locationPermissionDeniedNotice =>
      'Permiso de ubicación denegado. Concédeles que puedan compartir tu ubicación.';

  @override
  String get login => 'Iniciar sesión';

  @override
  String logInTo(String homeserver) {
    return 'Inicia sesión en $homeserver';
  }

  @override
  String get memberChanges => 'Cambios de miembros';

  @override
  String get mention => 'Mención';

  @override
  String get messagesStyle => 'Mensajes:';

  @override
  String get moderator => 'Moderador';

  @override
  String get muteChat => 'Silenciar chat';

  @override
  String get needPantalaimonWarning =>
      'Ten en cuenta que necesitas Pantalaimon para usar cifrado de extremo a extremo por ahora.';

  @override
  String get newChat => 'Nuevo chat';

  @override
  String get newVerificationRequest => '¡Nueva solicitud de verificación!';

  @override
  String get next => 'Siguiente';

  @override
  String get no => 'No';

  @override
  String get noConnectionToTheServer => 'Sin conexión al servidor';

  @override
  String get members => 'Miembros';

  @override
  String get welcomeToMindPower => '¡Bienvenido a MindPower!';

  @override
  String get accountSuccessfullyCreated =>
      'Tu cuenta ha sido creada y verificada exitosamente.';

  @override
  String get takingYouToDashboard => 'Llevándote a tu panel de control...';

  @override
  String get continueToApp => 'Continuar a la App';

  @override
  String get quickAccess => 'Acceso rápido';

  @override
  String get cards => 'Tarjetas';

  @override
  String get privacy => 'Privacidad';

  @override
  String get notification => 'Notificación';

  @override
  String get wallet => 'Billetera';

  @override
  String get allCalls => 'Todas las llamadas';

  @override
  String get unreadCalls => 'Llamadas no leídas';

  @override
  String get setChatDescription => 'Establecer descripción del chat';

  @override
  String get replaceRoomWithNewerVersion =>
      'Reemplazar sala con versión más nueva';

  @override
  String get roomUpgradeDescription =>
      'Esto actualizará la sala a una versión más nueva. Esta acción no se puede deshacer.';

  @override
  String get usersMustKnock => 'Los usuarios deben tocar';

  @override
  String get noOneCanJoin => 'Nadie puede unirse';

  @override
  String get restricted => 'Restringido';

  @override
  String get knockRestricted => 'Toque restringido';

  @override
  String get unknown => 'Desconocido';

  @override
  String get openGallery => 'Abrir galería';

  @override
  String get voiceCallsOnlyDirectChats =>
      'Las llamadas de voz solo están disponibles en charlas directos';

  @override
  String get videoCallsOnlyDirectChats =>
      'Las videollamadas solo están disponibles en charlas directos';

  @override
  String get voiceCallsNotAvailable =>
      'Las llamadas de voz no están disponibles';

  @override
  String get videoCallsNotAvailable => 'Las videollamadas no están disponibles';

  @override
  String failedToStartVoiceCall(String error) {
    return 'Error al iniciar llamada de voz: $error';
  }

  @override
  String failedToStartVideoCall(String error) {
    return 'Error al iniciar videollamada: $error';
  }

  @override
  String get unsupportedAndroidVersion => 'Versión de Android no compatible';

  @override
  String get unsupportedAndroidVersionLong =>
      'Esta función requiere Android 5.0 o superior';

  @override
  String get available => 'Disponible';

  @override
  String get typeMessage => 'Escribe un mensaje...';

  @override
  String get report => 'Reportar';

  @override
  String get selectPhotos => 'Seleccionar fotos';

  @override
  String selectPhotosWithCount(int count) {
    return 'Seleccionar fotos ($count)';
  }

  @override
  String get galleryAccessRequired => 'Se requiere acceso a la galería';

  @override
  String get grantPermission => 'Conceder permiso';

  @override
  String get messageInfo => 'Información del mensaje';

  @override
  String get pinnMessage => 'Fijar mensaje';

  @override
  String get redactMessage => 'Eliminar mensaje';

  @override
  String get reportMessage => 'Reportar mensaje';

  @override
  String get jumpToLastReadMessage => 'Ir al último mensaje leído';

  @override
  String get jump => 'Ir';

  @override
  String get enterNewChat => 'Entrar al nuevo chat';

  @override
  String get reopenChat => 'Reabrir chat';

  @override
  String get reply => 'Responder';

  @override
  String get shareContact => 'Compartir contacto';

  @override
  String get searchContacts => 'Buscar contactos';

  @override
  String get loadingContacts => 'Cargando contactos...';

  @override
  String get accessYourContacts => 'Acceder a tus contactos';

  @override
  String get contactsPermissionMessage =>
      'Para compartir contactos con tus amigos, permite el acceso a los contactos de tu dispositivo.';

  @override
  String get allowAccess => 'Permitir acceso';

  @override
  String contactsSelected(int count, String plural) {
    return '$count contacto$plural seleccionado$plural';
  }

  @override
  String get sending => 'Enviando...';

  @override
  String sendCount(int count) {
    return 'Enviar ($count)';
  }

  @override
  String contactsSharedSuccessfully(int count, String plural) {
    return '$count contacto$plural compartido$plural exitosamente';
  }

  @override
  String failedToSendContacts(String error) {
    return 'Error al enviar contactos: $error';
  }

  @override
  String get encryptionEnabledButIncomplete =>
      'El cifrado está habilitado pero la verificación del dispositivo está incompleta.';

  @override
  String get recreateChatError =>
      'Intentar recrear una sala que no es un chat directo. ¡Esto no debería ser posible desde la interfaz!';

  @override
  String get transferFunds => 'Transferir Fondos';

  @override
  String get checkingRecipient => 'Verificando destinatario...';

  @override
  String get transferNotAvailable => 'Transferencia No Disponible';

  @override
  String get recipientNoEthereumWallet =>
      'El destinatario no tiene una billetera de Ethereum';

  @override
  String get createEthereumWalletFirst =>
      'Por favor crea primero una billetera de Ethereum';

  @override
  String get createCustomerAccountFirstChat =>
      'Por favor crea primero una cuenta de cliente';

  @override
  String get createCustomerAccountFirst =>
      'Por favor crea primero una cuenta de cliente para hacer transferencias.';

  @override
  String get retry => 'Reintentar';

  @override
  String get createCustomer => 'Crear Cliente';

  @override
  String get loadingWallets => 'Cargando billeteras...';

  @override
  String get createWallet => 'Crear Billetera';

  @override
  String transferPaymentTo(String recipient) {
    return 'Transferir Pago a $recipient';
  }

  @override
  String get amount => 'Cantidad';

  @override
  String get pleaseEnterAmount => 'Por favor ingrese la cantidad';

  @override
  String get pleaseEnterValidAmount => 'Por favor ingrese una cantidad válida';

  @override
  String get minimumAmount => 'La cantidad mínima es \$1';

  @override
  String get maximumAmount => 'La cantidad máxima es \$10,000';

  @override
  String get currency => 'Moneda';

  @override
  String get sourceWallet => 'Billetera de origen';

  @override
  String recipientWallets(int count) {
    return 'Billeteras del Destinatario ($count)';
  }

  @override
  String get transfer => 'Transferir';

  @override
  String get pleaseSelectSourceWallet =>
      'Por favor seleccione una billetera de origen';

  @override
  String get createWalletAccountFirst =>
      'Por favor cree una cuenta de billetera primero';

  @override
  String get unableToVerifyAccount =>
      'No se puede verificar su cuenta. Por favor intente nuevamente.';

  @override
  String get unableToFindRecipientAccount =>
      'No se puede encontrar la cuenta del destinatario';

  @override
  String get transferFailed => 'Transferencia fallida';

  @override
  String get otherPartyNotLoggedIn =>
      'La otra parte ahora mismo no está conectada y por tanto ¡no puede recibir mensajes!';

  @override
  String get transferCompleted => 'Transferencia completada';

  @override
  String get transferProcessedSuccessfully =>
      'La transferencia se ha procesado exitosamente.';

  @override
  String get failedToSendTransferMessage =>
      'Error al enviar mensaje de transferencia';

  @override
  String get voiceCallStarted => 'Llamada de voz iniciada...';

  @override
  String get videoCallStarted => 'Videollamada iniciada...';

  @override
  String get callsOnlyInDirectChats =>
      'Las llamadas solo están disponibles en charlas directos.';

  @override
  String get noParticipantsForGroupCall =>
      'No hay participantes disponibles para la llamada grupal.';

  @override
  String get groupCallsInDevelopment =>
      'Las llamadas grupales están en desarrollo. Por favor, usa llamadas directas por ahora.';

  @override
  String get to => 'a';

  @override
  String get chain => 'Cadena';

  @override
  String get transactionId => 'ID de transacción';

  @override
  String get sendAsText => 'Enviar como texto';

  @override
  String get whyDoYouWantToReportThis => 'Por qué quieres denunciar esto?';

  @override
  String get reason => 'Razón';

  @override
  String get offensive => 'Ofensiva';

  @override
  String get confirmEventUnpin =>
      'Seguro que quiere desfijar permanentemente el evento?';

  @override
  String get noEmotesFound => 'Ningún emote encontrado. 😕';

  @override
  String get addNewEmote => 'Agregar Nuevo Emote';

  @override
  String get shortcode => 'Código corto';

  @override
  String get image => 'Imagen';

  @override
  String get addEmote => 'Agregar Emote';

  @override
  String get chooseImage => 'Elegir Imagen';

  @override
  String get imageSelected => 'Imagen Seleccionada';

  @override
  String get deleteEmote => 'Eliminar emoticón';

  @override
  String get noEncryptionForPublicRooms =>
      'Sólo se puede activar el cifrado cuando la sala deja de ser pública.';

  @override
  String get noGoogleServicesWarning =>
      'Parece que no tienes los servicios de Firebase Cloud Messaging en tu dispositivo. Para recibir notificaciones de todas formas, te recomendamos instalar ntfy. Con ntfy o cualquier proveedor de Unified Push, puedes recibir notificaciones manteniendo la seguridad de tus datos. Puedes descargar ntfy desde PlayStore o F-Droid.';

  @override
  String noMatrixServer(String server1, String server2) {
    return '$server1 no es un servidor Matrix, usar $server2 en su lugar?';
  }

  @override
  String get shareInviteLink => 'Compartir enlace de invitación';

  @override
  String get scanQrCode => 'Escanear código QR';

  @override
  String get none => 'Ninguno';

  @override
  String get noPasswordRecoveryDescription =>
      'Aún no has agregado un método para recuperar tu contraseña.';

  @override
  String get noPermission => 'Sin permisos';

  @override
  String get noRoomsFound => 'No se encontraron salas…';

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
  String get offline => 'Desconectado';

  @override
  String get ok => 'Aceptar';

  @override
  String get online => 'Conectado';

  @override
  String get onlineKeyBackupEnabled =>
      'La copia de seguridad de claves en línea está habilitada';

  @override
  String get oopsPushError =>
      '¡UPS! Desafortunadamente, se produjo un error al configurar las notificaciones push.';

  @override
  String get oopsSomethingWentWrong => 'Ups, algo salió mal…';

  @override
  String get openAppToReadMessages => 'Abre la app para leer los mensajes';

  @override
  String get openCamera => 'Abrir cámara';

  @override
  String get openVideoCamera => 'Abrir la cámara para un video';

  @override
  String get oneClientLoggedOut =>
      'Se cerró la sesión en uno de tus dispositivos';

  @override
  String get addAccount => 'Agregar cuenta';

  @override
  String get editBundlesForAccount => 'Editar paquetes de esta cuenta';

  @override
  String get addToBundle => 'Agregar al paquete';

  @override
  String get bundleName => 'Nombre del paquete';

  @override
  String get enableMultiAccounts =>
      '(BETA) Habilite varias cuentas en este dispositivo';

  @override
  String get openInMaps => 'Abrir en Maps';

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
      'No mostrar en el chat cuando alguien entra o sale de una sala pública para mejorar la comprensión.';

  @override
  String get overview => 'Resumen';

  @override
  String get notifyMeFor => 'Notificarme por';

  @override
  String get passwordRecoverySettings =>
      'Configuración de recuperación de contraseña';

  @override
  String get passwordRecovery => 'Recuperación de contraseña';

  @override
  String get people => 'Personas';

  @override
  String get pickImage => 'Seleccionar imagen';

  @override
  String get pin => 'Fijar';

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
      'Haz clic en el enlace del correo electrónico y luego continúa.';

  @override
  String get pleaseEnter4Digits =>
      'Ingrese 4 dígitos o déjelo en blanco para deshabilitar el bloqueo de la aplicación.';

  @override
  String get pleaseEnterRecoveryKey =>
      'Por favor, introduzca su clave de recuperación:';

  @override
  String get pleaseEnterYourPassword => 'Por favor, ingresa tu contraseña';

  @override
  String get pleaseEnterYourPin => 'Por favor ingrese su PIN';

  @override
  String get pleaseEnterYourUsername =>
      'Por favor, ingresa tu nombre de usuario';

  @override
  String get pleaseFollowInstructionsOnWeb =>
      'Por favor, sigue las instrucciones en el sitio web y presiona \"siguiente\".';

  @override
  String get publicRooms => 'Salas públicas';

  @override
  String get pushRules => 'Regla de Push';

  @override
  String get recording => 'Grabando';

  @override
  String redactedBy(String username) {
    return 'Eliminado por $username';
  }

  @override
  String get directChat => 'Chat directo';

  @override
  String redactedByBecause(String username, String reason) {
    return 'Eliminado por $username porque: \"$reason\"';
  }

  @override
  String redactedAnEvent(String username) {
    return '$username ocultó un evento';
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
  String get removeAllOtherDevices => 'Eliminar todos los demás dispositivos';

  @override
  String removedBy(String username) {
    return 'Eliminado por $username';
  }

  @override
  String get removeDevice => 'Eliminar dispositivo';

  @override
  String get unbanFromChat => 'Quitar expulsión';

  @override
  String get removeYourAvatar => 'Quitar tu avatar';

  @override
  String get requestPermission => 'Solicitar permiso';

  @override
  String get roomHasBeenUpgraded => 'La sala ha sido actualizada';

  @override
  String get roomVersion => 'Versión de la sala';

  @override
  String get saveFile => 'Guardar archivo';

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
  String get sendFile => 'Enviar archivo';

  @override
  String get sendImage => 'Enviar imagen';

  @override
  String sendImages(int count) {
    return 'Enviando imagen $count';
  }

  @override
  String get sendMessages => 'Enviar mensajes';

  @override
  String get sendOriginal => 'Enviar original';

  @override
  String get sendSticker => 'Enviar stickers';

  @override
  String get sendVideo => 'Enviar video';

  @override
  String sentAFile(String username) {
    return '$username envió un archivo';
  }

  @override
  String get twitterLoginComingSoon =>
      '¡Pronto estará disponible el inicio de sesión con Twitter!';

  @override
  String get googleLoginComingSoon =>
      '¡Pronto estará disponible el inicio de sesión con Google!';

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
  String get separateChatTypes => 'Separar charlas directos de grupos';

  @override
  String get setAsCanonicalAlias => 'Establecer alias principal';

  @override
  String get setInvitationLink => 'Establecer enlace de invitación';

  @override
  String get setPermissionsLevel => 'Establecer nivel de permisos';

  @override
  String get setStatus => 'Establecer estado';

  @override
  String get settings => 'Configuración';

  @override
  String get share => 'Compartir';

  @override
  String sharedTheLocation(String username) {
    return '$username compartió su ubicación';
  }

  @override
  String get shareLocation => 'Compartir ubicación';

  @override
  String get showPassword => 'Mostrar contraseña';

  @override
  String get presenceStyle => 'Presencia:';

  @override
  String get presencesToggle => 'Mostrar los estados de otros usuarios';

  @override
  String get singlesignon => 'Inicio de sesión único';

  @override
  String get skip => 'Saltar';

  @override
  String get sourceCode => 'Código fuente';

  @override
  String get spaceIsPublic => 'El espacio es público';

  @override
  String get spaceName => 'Nombre del espacio';

  @override
  String startedACall(String senderName) {
    return '$senderName inició una llamada';
  }

  @override
  String get startFirstChat => 'Comience su primer chat';

  @override
  String get status => 'Estado';

  @override
  String get statusExampleMessage => 'Qué tal estás hoy?';

  @override
  String get submit => 'Enviar';

  @override
  String get synchronizingPleaseWait => 'Sincronizando... por favor espera.';

  @override
  String synchronizingPleaseWaitCounter(String percentage) {
    return 'Sincronizando… ($percentage%)';
  }

  @override
  String get systemTheme => 'Sistema';

  @override
  String get theyDontMatch => 'No coinciden';

  @override
  String get theyMatch => 'Coinciden';

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
  String get tryToSendAgain => 'Intentar enviar de nuevo';

  @override
  String get unavailable => 'No disponible';

  @override
  String unbannedUser(String username, String targetName) {
    return '$username reincorporó a $targetName';
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
  String get unmuteChat => 'Activar sonido del chat';

  @override
  String get unpin => 'Desfijar';

  @override
  String get unreadChats => 'Chats no leídos';

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
    return '$username salió del chat';
  }

  @override
  String get username => 'Nombre de usuario';

  @override
  String userSentUnknownEvent(String username, String type) {
    return '$username envió un evento desconocido $type';
  }

  @override
  String get unverified => 'No verificado';

  @override
  String get verified => 'Verificado';

  @override
  String get verify => 'Verificar';

  @override
  String get verifyStart => 'Iniciar verificación';

  @override
  String get verifySuccess => '¡Verificación exitosa!';

  @override
  String get verifyTitle => 'Verificando la otra cuenta';

  @override
  String get videoCall => 'Videollamada';

  @override
  String get visibilityOfTheChatHistory => 'Visibilidad del historial de chat';

  @override
  String get visibleForAllParticipants =>
      'Visible para todos los participantes';

  @override
  String get visibleForEveryone => 'Visible para todos';

  @override
  String get voiceMessage => 'Mensaje de voz';

  @override
  String get waitingPartnerAcceptRequest =>
      'Esperando que la otra persona acepte la solicitud…';

  @override
  String get waitingPartnerEmoji =>
      'Esperando que la otra persona acepte los emojis…';

  @override
  String get waitingPartnerNumbers =>
      'Esperando que la otra persona acepte los números…';

  @override
  String get wallpaper => 'Fondo de pantalla:';

  @override
  String get weSentYouAnEmail => 'Te hemos enviado un correo electrónico';

  @override
  String get whoIsAllowedToJoinThisGroup => 'Quién puede unirse a este grupo';

  @override
  String get unableToPlayAudioMessage =>
      'No se puede reproducir el mensaje de audio';

  @override
  String get message => 'Mensaje';

  @override
  String get call => 'Llamar';

  @override
  String get save => 'Guardar';

  @override
  String get edited => 'editado';

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
      'Ya no participas en este chat';

  @override
  String get youHaveBeenBannedFromThisChat => 'Has sido expulsado de este chat';

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
  String get addToSpaceDescription => 'Elige un espacio para añadir este chat.';

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
  String get pinMessage => 'Fijar mensaje';

  @override
  String get shareItemsValidationError => 'Ruta de archivo inválida';

  @override
  String get voiceRecordingPermissionDenied =>
      'Permiso de grabación de voz denegado';

  @override
  String get noEventsSelected => 'No hay eventos seleccionados';

  @override
  String actionFailed(String action, String error) {
    return '$action falló: $error';
  }

  @override
  String get emojis => 'Emojis';

  @override
  String get placeCall => 'Llamar';

  @override
  String get voiceCall => 'Llamada de voz';

  @override
  String get videoCallsBetaWarning =>
      'Ten en cuenta que las videollamadas están actualmente en fase beta. Puede que no funcionen como se espera o que no funcionen en algunas plataformas.';

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
  String get errorAddingWidget => 'Error al agregar el widget.';

  @override
  String get youRejectedTheInvitation => 'Rechazaste la invitación';

  @override
  String get youJoinedTheChat => 'Te uniste al chat';

  @override
  String get youAcceptedTheInvitation => '👍 Aceptaste la invitación';

  @override
  String youBannedUser(String user) {
    return 'Prohibiste el acceso a $user';
  }

  @override
  String youHaveWithdrawnTheInvitationFor(String user) {
    return 'Retiraste la invitación a $user';
  }

  @override
  String youInvitedToBy(String alias) {
    return '📩 Te invitaron mediante un enlace a:\n$alias';
  }

  @override
  String invitedBy(String user) {
    return '📩 Invitado por $user';
  }

  @override
  String youInvitedUser(String user) {
    return '📩 Invitaste a $user';
  }

  @override
  String youKicked(String user) {
    return '👞 Expulsaste a $user';
  }

  @override
  String youKickedAndBanned(String user) {
    return '🙅 Usted expulsó y prohibió el acceso a $user';
  }

  @override
  String youUnbannedUser(String user) {
    return 'Volviste a permitir el acceso a $user';
  }

  @override
  String hasKnocked(String user) {
    return '🚪 $user ha enviado un aviso';
  }

  @override
  String userWouldLikeToChangeTheChat(String user) {
    return '$user quiere unirse al chat.';
  }

  @override
  String get noPublicLinkHasBeenCreatedYet =>
      'Aún no se ha creado un enlace público';

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
  String get callingAccount => 'Llamando desde la cuenta';

  @override
  String get callingAccountDetails =>
      'Permite a BMP utilizar la aplicación de llamadas nativa de Android.';

  @override
  String get appearOnTop => 'Mostrar arriba';

  @override
  String get appearOnTopDetails =>
      'Permite que la app se muestre al frente (no es necesario si ya configuraste BMP como cuenta para llamadas)';

  @override
  String get otherCallingPermissions =>
      'Micrófono, cámara y otros permisos de BMP';

  @override
  String get whyIsThisMessageEncrypted =>
      'Por qué no se puede leer este mensaje?';

  @override
  String get noKeyForThisMessage =>
      'Esto puede pasar si el mensaje fue enviado antes de que iniciaras sesión en este dispositivo.\n\nTambién puede que el remitente haya bloqueado tu dispositivo o que haya habido un error de conexión.\n\nPuedes leer el mensaje en otra sesión? Entonces puedes transferirlo desde ahí. Ve a Ajustes > Dispositivos y asegúrate de que tus dispositivos estén verificados entre sí. Cuando abras la sala nuevamente y ambas sesiones estén activas, las claves se transferirán automáticamente.\n\nNo quieres perder las claves al salir o cambiar de dispositivo? Asegúrate de habilitar la copia de seguridad del chat en los ajustes.';

  @override
  String get newSpace => 'Nuevo espacio';

  @override
  String get enterSpace => 'Unirse al espacio';

  @override
  String get enterRoom => 'Entrar a la sala';

  @override
  String get allSpaces => 'Todos los espacios';

  @override
  String numChats(String number) {
    return '$number chats';
  }

  @override
  String get hideUnimportantStateEvents =>
      'Ocultar eventos de estado sin importancia';

  @override
  String get doNotShowAgain => 'No mostrar de nuevo';

  @override
  String wasDirectChatDisplayName(String oldDisplayName) {
    return 'Chat vacío (antes era $oldDisplayName)';
  }

  @override
  String get newSpaceDescription =>
      'Los espacios permiten organizar los charlas y crear comunidades privadas o públicas.';

  @override
  String get encryptThisChat => 'Encriptar este chat';

  @override
  String get disableEncryptionWarning =>
      'Por seguridad, no es posible desactivar el cifrado en un chat si ya fue activado antes.';

  @override
  String get sorryThatsNotPossible => 'Lo siento... eso no es posible';

  @override
  String get deviceKeys => 'Claves del dispositivo:';

  @override
  String get noBackupWarning =>
      '¡Cuidado! Si no habilitas la copia de seguridad del chat, perderás acceso a tus mensajes cifrados. Se recomienda activar la copia de seguridad antes de salir.';

  @override
  String get noOtherDevicesFound => 'No se encontraron otros dispositivos';

  @override
  String fileIsTooBigForServer(String max) {
    return '¡No se pudo enviar! El servidor solo permite archivos de hasta $max.';
  }

  @override
  String fileHasBeenSavedAt(String path) {
    return 'Archivo guardado en $path';
  }

  @override
  String get readUpToHere => 'Leer hasta aquí';

  @override
  String get openLinkInBrowser => 'Abrir enlace en el navegador';

  @override
  String get reportErrorDescription =>
      '😭 Oh, no. Algo salió mal. Si quieres, puedes reportar este error a los desarrolladores.';

  @override
  String get signInWithPassword => 'Iniciar sesión con contraseña';

  @override
  String get pleaseTryAgainLaterOrChooseDifferentServer =>
      'Por favor, inténtalo más tarde o elige un servidor diferente.';

  @override
  String signInWith(String provider) {
    return 'Iniciar sesión con $provider';
  }

  @override
  String get profileNotFound =>
      'El usuario no se encontró en el servidor. Puede que haya un problema de conexión o que el usuario no exista.';

  @override
  String get setTheme => 'Establecer tema:';

  @override
  String get setColorTheme => 'Elegir tema de color:';

  @override
  String get invite => 'Invitación';

  @override
  String get inviteGroupChat => '📨 Invitar al grupo de chat';

  @override
  String get invitePrivateChat => '📨 Invitar a chat privado';

  @override
  String get invalidInput => '¡Entrada no válida!';

  @override
  String get wrongPinEntered => 'PIN incorrecto';

  @override
  String get pleaseEnterANumber => 'Por favor, ingresa un número mayor que 0';

  @override
  String get banUserDescription =>
      'El usuario será expulsado del chat y no podrá volver a entrar hasta que se le permita.';

  @override
  String get unbanUserDescription =>
      'El usuario podrá volver a entrar al chat si lo intenta.';

  @override
  String get kickUserDescription =>
      'Expulsa al usuario del chat, pero no se le prohíbe volver a entrar. En los charlas públicos, el usuario podrá volver en cualquier momento.';

  @override
  String get makeAdminDescription =>
      'Si haces a este usuario administrador, puede que no puedas revertirlo porque tendrá los mismos permisos que tú.';

  @override
  String get pushNotificationsNotAvailable =>
      'Las notificaciones push no están disponibles';

  @override
  String get learnMore => 'Más información';

  @override
  String get yourGlobalUserIdIs => 'Tu ID de usuario global es:';

  @override
  String noUsersFoundWithQuery(String query) {
    return 'No se encontró ningún usuario con \"$query\". Por favor, revisa si cometiste un error.';
  }

  @override
  String get knocking => 'Tocando para entrar';

  @override
  String chatCanBeDiscoveredViaSearchOnServer(String server) {
    return 'El chat puede ser encontrado mediante búsqueda en $server';
  }

  @override
  String get searchChatsRooms => 'Buscar #chats, @usuarios...';

  @override
  String get nothingFound => 'No se halló nada...';

  @override
  String get createGroupAndInviteUsers => 'Crear un grupo e invitar a usuarios';

  @override
  String get groupCanBeFoundViaSearch =>
      'Los grupos se pueden encontrar mediante búsqueda';

  @override
  String get startConversation => 'Empezar conversación';

  @override
  String get commandHint_sendraw => 'Enviar JSON sin formato';

  @override
  String get databaseMigrationTitle => 'La base de datos se ha optimizado';

  @override
  String get databaseMigrationBody =>
      'Por favor, espera. Esto tomará un momento.';

  @override
  String get searchForUsers => 'Buscar @usuarios...';

  @override
  String get pleaseEnterYourCurrentPassword =>
      'Por favor, ingresa tu contraseña actual';

  @override
  String get newPassword => 'Nueva contraseña';

  @override
  String get pleaseChooseAStrongPassword =>
      'Por favor, elige una contraseña segura';

  @override
  String get passwordsDoNotMatch => 'Las contraseñas no coinciden';

  @override
  String get passwordIsWrong => 'La contraseña que ingresaste es incorrecta';

  @override
  String get publicLink => 'Liga pública';

  @override
  String get publicChatAddresses => 'Dirección pública del chat';

  @override
  String get createNewAddress => 'Crear nueva dirección';

  @override
  String get joinSpace => 'Unirse al espacio';

  @override
  String get publicSpaces => 'Espacios públicos';

  @override
  String get addChatOrSubSpace => 'Agregar chat o subespacio';

  @override
  String get subspace => 'Subespacio';

  @override
  String get thisDevice => 'Este dispositivo:';

  @override
  String get initAppError => 'Ocurrió un error al iniciar la app';

  @override
  String get userRole => 'Rol del usuario';

  @override
  String minimumPowerLevel(String level) {
    return 'El nivel mínimo es $level.';
  }

  @override
  String searchIn(String chat) {
    return 'Buscar en el chat \"$chat\"...';
  }

  @override
  String get searchMore => 'Buscar más...';

  @override
  String databaseBuildErrorBody(String url, String error) {
    return 'No se pudo crear la base de datos SQlite. La app intentará usar la base de datos anterior por ahora. Por favor, reporta este error a los desarrolladores en $url. El mensaje de error es: $error';
  }

  @override
  String sessionLostBody(String url, String error) {
    return 'Tu sesión se perdió. Por favor, avisa de este error a los desarrolladores en $url. El mensaje de error es: $error';
  }

  @override
  String restoreSessionBody(String url, String error) {
    return 'La app está intentando recuperar tu sesión desde la copia de seguridad. Por favor, reporta este error a los desarrolladores en $url. El mensaje de error es: $error';
  }

  @override
  String forwardMessageTo(String roomName) {
    return 'Reenviar mensaje a $roomName?';
  }

  @override
  String get sendReadReceipts => 'Enviar confirmaciones de lectura';

  @override
  String get sendTypingNotificationsDescription =>
      'Otros participantes en un chat pueden ver cuando estás escribiendo un mensaje.';

  @override
  String get sendReadReceiptsDescription =>
      'Otros participantes en un chat pueden ver cuando has leído un mensaje.';

  @override
  String get formattedMessages => 'Mensajes con formato';

  @override
  String get formattedMessagesDescription =>
      'Mostrar contenido enriquecido, como texto en negritas o cursivas, usando Markdown.';

  @override
  String get verifyOtherUser => '🔐 Verificar a otro usuario';

  @override
  String get verifyOtherUserDescription =>
      'Si verificas a otro usuario, puedes estar seguro de con quién estás hablando realmente. 💪\n\nCuando inicies una verificación, tú y el otro usuario verán una ventana emergente en la app con una serie de emojis o números que deberán comparar.\n\nLa mejor forma de hacerlo es en persona o por videollamada. 👭';

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
    return '$sender está listo para la verificación de clave';
  }

  @override
  String requestedKeyVerification(String sender) {
    return '$sender solicitó la verificación de clave';
  }

  @override
  String startedKeyVerification(String sender) {
    return '$sender comenzó la verificación de clave';
  }

  @override
  String get transparent => 'Transparente';

  @override
  String get incomingMessages => 'Mensajes entrantes';

  @override
  String get stickers => 'Stickers';

  @override
  String get discover => 'Descubrir';

  @override
  String get commandHint_ignore => 'Ignorar el ID de Matrix dado';

  @override
  String get commandHint_unignore => 'Dejar de ignorar el ID de Matrix dado';

  @override
  String unreadChatsInApp(String appname, String unread) {
    return '$appname: $unread charlas sin leer';
  }

  @override
  String get noDatabaseEncryption =>
      'En esta plataforma no hay cifrado de base de datos';

  @override
  String thereAreCountUsersBlocked(Object count) {
    return 'Actualmente hay $count usuarios bloqueados.';
  }

  @override
  String goToSpace(Object space) {
    return 'Ir al espacio: $space';
  }

  @override
  String get youDeletedThisMessage => 'Eliminaste este mensaje';

  @override
  String get thisMessageWasDeleted => 'Este mensaje fue eliminado';

  @override
  String get refreshing => 'Actualizando...';

  @override
  String get markAsUnread => 'Marcar como no leído';

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
      'Cambiar la configuración general del chat';

  @override
  String get inviteOtherUsers => 'Invitar a otros usuarios a este chat';

  @override
  String get changeTheChatPermissions => 'Cambiar permisos del chat';

  @override
  String get changeTheVisibilityOfChatHistory =>
      'Cambiar la visibilidad del historial de chat';

  @override
  String get changeTheCanonicalRoomAlias =>
      'Cambiar la dirección pública principal del chat';

  @override
  String get sendRoomNotifications => 'Enviar notificación @sala';

  @override
  String get changeTheDescriptionOfTheGroup =>
      'Cambiar la descripción del chat';

  @override
  String get chatPermissionsDescription =>
      'Define el nivel requerido para realizar ciertas acciones en este chat. Generalmente, los niveles 0, 50 y 100 representan usuarios, moderadores y administradores, pero puedes ajustar la escala como quieras.';

  @override
  String updateInstalled(String version) {
    return '¡🎉 Se instaló la actualización $version!';
  }

  @override
  String get changelog => 'Registro de cambios';

  @override
  String get sendCanceled => 'Envío cancelado';

  @override
  String get loginWithMatrixId => 'Iniciar sesión con un ID de Matrix';

  @override
  String get discoverHomeservers => 'Descubrir servidores domésticos';

  @override
  String get whatIsAHomeserver => 'Qué es un homeserver?';

  @override
  String get homeserverDescription =>
      'Todos tus datos se guardan en el homeserver, similar a un proveedor de correo electrónico. Puedes elegir el homeserver que deseas usar y aún así comunicarte con todos. Más información en https://invitation.be-mindpower.net/.';

  @override
  String get doesNotSeemToBeAValidHomeserver =>
      'No parece ser un homeserver válido. URL incorrecta?';

  @override
  String get calculatingFileSize => 'Calculando el tamaño del archivo...';

  @override
  String get prepareSendingAttachment =>
      'Preparando el envío del archivo adjunto...';

  @override
  String get sendingAttachment => 'Enviando archivo adjunto...';

  @override
  String get generatingVideoThumbnail => 'Generando miniatura de video...';

  @override
  String get compressVideo => 'Comprimiendo video...';

  @override
  String sendingAttachmentCountOfCount(int index, int length) {
    return 'Enviando archivo adjunto $index de $length...';
  }

  @override
  String serverLimitReached(int seconds) {
    return '¡Se alcanzó el límite del servidor! Espera $seconds segundos...';
  }

  @override
  String get oneOfYourDevicesIsNotVerified =>
      'Uno de tus dispositivos no está verificado';

  @override
  String get noticeChatBackupDeviceVerification =>
      'Nota: Cuando conectas todos tus dispositivos a la copia de seguridad del chat, se verifican automáticamente.';

  @override
  String get continueText => 'Continuar';

  @override
  String get welcomeText =>
      '¡Hey, hey! 👋 Esto es BMP. Puedes entrar a cualquier servidor que sea compatible con https://invitation.be-mindpower.net/. Luego puedes chatear con quien quieras. ¡Es una red de mensajería descentralizada gigante!';

  @override
  String get blur => 'Desenfoque:';

  @override
  String get opacity => 'Opacidad:';

  @override
  String get setWallpaper => 'Establecer fondo de pantalla';

  @override
  String get manageAccount => 'Administrar cuenta';

  @override
  String get noContactInformationProvided =>
      'El servidor no proporcionó información de contacto válida';

  @override
  String get contactServerAdmin => 'Contactar al administrador del servidor';

  @override
  String get contactServerSecurity =>
      'Contactar al equipo de seguridad del servidor';

  @override
  String get supportPage => 'Página de soporte';

  @override
  String get serverInformation => 'Información del servidor:';

  @override
  String get name => 'Nombre';

  @override
  String get version => 'Versión';

  @override
  String get website => 'Sitio web';

  @override
  String get compress => 'Comprimir';

  @override
  String get boldText => 'Texto en negritas';

  @override
  String get italicText => 'Texto en cursivas';

  @override
  String get strikeThrough => 'Texto tachado';

  @override
  String get invalidUrl => 'URL no válida';

  @override
  String get addLink => 'Agregar enlace';

  @override
  String get unableToJoinChat =>
      'No se puede entrar al chat. Es posible que la otra parte ya haya cerrado la conversación.';

  @override
  String get previous => 'Anterior';

  @override
  String appWantsToUseForLogin(String server) {
    return 'Usar \'$server\' para iniciar sesión';
  }

  @override
  String get appWantsToUseForLoginDescription =>
      'Estás permitiendo que la app y el sitio web compartan información sobre ti.';

  @override
  String get open => 'Abrir';

  @override
  String get waitingForServer => 'Esperando al servidor...';

  @override
  String get appIntroduction =>
      'BMP te permite chatear con tus amigos usando diferentes servicios de mensajería. Aprende más en https://invitation.be-mindpower.net/ o simplemente presiona *Continuar*.';

  @override
  String get newChatRequest => '📩 Nueva solicitud de chat';

  @override
  String get contentNotificationSettings =>
      'Configuración de notificaciones de contenido';

  @override
  String get generalNotificationSettings =>
      'Configuración general de notificaciones';

  @override
  String get roomNotificationSettings =>
      'Configuración de notificaciones por sala';

  @override
  String get userSpecificNotificationSettings =>
      'Configuración de notificaciones por usuario';

  @override
  String get otherNotificationSettings =>
      'Otras configuraciones de notificación';

  @override
  String get notificationRuleContainsUserName => 'Contiene nombre de usuario';

  @override
  String get notificationRuleContainsUserNameDescription =>
      'Notifica cuando un mensaje contiene tu nombre de usuario.';

  @override
  String get notificationRuleMaster => 'Silenciar todas las notificaciones';

  @override
  String get notificationRuleMasterDescription =>
      'Desactiva todas las demás reglas y apaga todas las notificaciones.';

  @override
  String get notificationRuleSuppressNotices => 'Ocultar mensajes automáticos';

  @override
  String get notificationRuleSuppressNoticesDescription =>
      'Suprime notificaciones automáticas, como las de bots.';

  @override
  String get notificationRuleInviteForMe => 'Invitación para mí';

  @override
  String get notificationRuleInviteForMeDescription =>
      'Te avisa cuando te invitan a una sala.';

  @override
  String get notificationRuleMemberEvent => 'Evento de miembros';

  @override
  String get notificationRuleMemberEventDescription =>
      'Oculta notificaciones de eventos relacionados con miembros.';

  @override
  String get notificationRuleIsUserMention => 'Mención directa';

  @override
  String get notificationRuleIsUserMentionDescription =>
      'Te notifica cuando alguien te menciona directamente en un mensaje.';

  @override
  String get notificationRuleContainsDisplayName =>
      'Contiene tu nombre visible';

  @override
  String get notificationRuleContainsDisplayNameDescription =>
      'Notifica cuando un mensaje contiene tu nombre mostrado.';

  @override
  String get notificationRuleIsRoomMention => 'Mención de sala';

  @override
  String get notificationRuleIsRoomMentionDescription =>
      'Notifica cuando se menciona la sala.';

  @override
  String get notificationRuleRoomnotif => 'Notificación de sala';

  @override
  String get notificationRuleRoomnotifDescription =>
      'Notifica cuando un mensaje contiene \'@sala\'.';

  @override
  String get notificationRuleTombstone => 'Sala deshabilitada';

  @override
  String get notificationRuleTombstoneDescription =>
      'Notifica sobre mensajes de desactivación de sala.';

  @override
  String get notificationRuleReaction => 'Reacción';

  @override
  String get notificationRuleReactionDescription =>
      'Suprime notificaciones por reacciones.';

  @override
  String get notificationRuleRoomServerAcl =>
      'Lista de control del servidor de sala';

  @override
  String get notificationRuleRoomServerAclDescription =>
      'Suprime notificaciones de control de acceso de servidores de sala.';

  @override
  String get notificationRuleSuppressEdits => 'Ocultar ediciones';

  @override
  String get notificationRuleSuppressEditsDescription =>
      'Suprime notificaciones de mensajes editados.';

  @override
  String get notificationRuleCall => 'Llamada';

  @override
  String get notificationRuleCallDescription =>
      'Notifica sobre llamadas entrantes.';

  @override
  String get notificationRuleEncryptedRoomOneToOne => 'Sala cifrada uno a uno';

  @override
  String get notificationRuleEncryptedRoomOneToOneDescription =>
      'Notifica sobre mensajes en salas cifradas uno a uno.';

  @override
  String get notificationRuleRoomOneToOne => 'Sala uno a uno';

  @override
  String get notificationRuleRoomOneToOneDescription =>
      'Notifica sobre mensajes en salas uno a uno.';

  @override
  String get notificationRuleMessage => 'Mensaje';

  @override
  String get notificationRuleMessageDescription =>
      'Notifica sobre mensajes generales.';

  @override
  String get notificationRuleEncrypted => 'Cifrado';

  @override
  String get notificationRuleEncryptedDescription =>
      'Notifica sobre mensajes en salas cifradas.';

  @override
  String get notificationRuleJitsi => 'Jitsi';

  @override
  String get notificationRuleJitsiDescription =>
      'Notifica sobre eventos del componente Jitsi.';

  @override
  String get notificationRuleServerAcl => 'Ocultar eventos de ACL del servidor';

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
      'Si eliminas esta configuración de notificación, no podrás deshacerlo.';

  @override
  String get more => 'Más';

  @override
  String get shareKeysWith => 'Compartir claves con...';

  @override
  String get shareKeysWithDescription =>
      'Qué dispositivos deben ser de confianza para que puedan leer tus mensajes en charlas cifrados?';

  @override
  String get allDevices => 'Todos los dispositivos';

  @override
  String get crossVerifiedDevicesIfEnabled =>
      'Dispositivos verificados si está habilitado';

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
  String get youHaveKnocked => 'Has tocado la puerta';

  @override
  String get pleaseWaitUntilInvited =>
      'Por favor espera hasta que alguien del chat te invite.';

  @override
  String get commandHint_logout => 'Cerrar sesión en este dispositivo';

  @override
  String get commandHint_logoutall =>
      'Cerrar sesión en todos los dispositivos activos';

  @override
  String get displayNavigationRail => 'Mostrar carril de navegación en móvil';

  @override
  String get customReaction => 'Reacción personalizada';

  @override
  String get unexpectedVerificationMessage =>
      'Se recibió un mensaje inesperado durante la verificación.';

  @override
  String get financeLoading => 'Cargando...';

  @override
  String get financePleaseWaitLoadWallet =>
      'Por favor espera mientras cargamos tu billetera';

  @override
  String get financeWelcome => 'Bienvenido';

  @override
  String get financeRegistrationCompleted => '¡Registro completado con éxito!';

  @override
  String financeFailedToUpdate(String error) {
    return 'Error al actualizar: $error';
  }

  @override
  String get financeStatusRefreshed => 'Estado actualizado con éxito';

  @override
  String financeFailedToRefresh(String error) {
    return 'Error al actualizar: $error';
  }

  @override
  String get financeFailedToStartKYC => 'Error al iniciar el proceso KYC';

  @override
  String get financeAccountFullyVerified =>
      'Tu cuenta está completamente verificada y activa';

  @override
  String get financeAccountVerificationFailed =>
      'La verificación de tu cuenta no fue exitosa';

  @override
  String get financeAccountUnderReview => 'Tu cuenta está bajo revisión';

  @override
  String get financeAdditionalVerificationRequired =>
      'Se requiere verificación adicional';

  @override
  String get financeManageWalletServices =>
      'Administra tus servicios de billetera';

  @override
  String get financeAccountRejected => 'Cuenta rechazada';

  @override
  String get financeAccountUnderReviewTitle => 'Cuenta en revisión';

  @override
  String get financeAccountIncomplete => 'Cuenta incompleta';

  @override
  String get financeFinishVerification => 'Completa tu verificación';

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
      'Agrega tus cuentas bancarias para enviar dinero por ACH o transferencia';

  @override
  String get financeDigitalWallets => 'Billeteras digitales';

  @override
  String get financeDigitalWalletsSubtitle =>
      'Accede a tus billeteras digitales';

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
  String get financeCreateFirstCard => 'Crea tu primera tarjeta para empezar';

  @override
  String get financeViewCards => 'Ver tarjetas';

  @override
  String get financeMyCards => 'Mis tarjetas';

  @override
  String get financeNoCards => 'Sin Tarjetas';

  @override
  String get financeCreateCardToGetStarted =>
      'Crea una nueva tarjeta para comenzar';

  @override
  String get financeCreateNewCard => 'Crear Nueva Tarjeta';

  @override
  String get financeVirtualCard => 'Tarjeta Virtual';

  @override
  String get financeActivatingCard => 'Activando Tarjeta';

  @override
  String get financeAlmostReady => 'Ya casi está listo';

  @override
  String get financeCardActivationInProgress =>
      'Activación de tarjeta en progreso...';

  @override
  String get financeCardActivationUnderReview =>
      'La activación de la tarjeta está en revisión. Por favor espere.';

  @override
  String get financeCardVerificationFailed =>
      'Error en la verificación de la tarjeta. Por favor contacte a soporte.';

  @override
  String get financeCardCreationFailed =>
      'Error al crear la tarjeta. Por favor intente nuevamente.';

  @override
  String get financeCardActivationSuccess => '¡Tarjeta activada exitosamente!';

  @override
  String get financeCardActivationError =>
      'Error al activar la tarjeta. Por favor intente nuevamente.';

  @override
  String get financeCompleteIdentityVerification =>
      'Completa tu verificación de identidad para crear y administrar tarjetas virtuales.';

  @override
  String get financeKYCVerificationRequired => 'Verificación KYC requerida';

  @override
  String get financeKYCActivationInProgress =>
      'Activación de tarjeta en progreso...';

  @override
  String get financeKYCUnderReview =>
      'La activación de la tarjeta está en revisión. Por favor espere.';

  @override
  String get financeKYCVerificationFailed =>
      'Error en la verificación de la tarjeta. Por favor contacte a soporte.';

  @override
  String get financeKYCCardCreationFailed =>
      'Error al crear la tarjeta. Por favor intente nuevamente.';

  @override
  String get financeKYCFailedToActivate => 'Error al activar la tarjeta';

  @override
  String get financeKYCRejected => 'KYC Rechazado';

  @override
  String get financeKYCRejectedMessage =>
      'Su verificación de identidad ha sido rechazada. Por favor revise sus datos e intente nuevamente.';

  @override
  String get financeKYCCommonIssues => 'Problemas comunes:';

  @override
  String get financeKYCUnderReviewTitle => 'En Revisión';

  @override
  String get financeKYCUnderReviewMessage =>
      'Su solicitud KYC está siendo revisada. Esto normalmente toma de 1 a 3 días hábiles.';

  @override
  String get financeKYCPendingTitle => 'Verificación en Progreso';

  @override
  String get financeKYCPendingMessage =>
      'Estamos revisando sus documentos. Será notificado una vez que se complete la verificación.';

  @override
  String get financeKYCDocumentUploaded => 'Documento Cargado';

  @override
  String get financeKYCIdentityVerified => 'Identidad Verificada';

  @override
  String get financeKYCPersonalInfoVerified =>
      'Información Personal Verificada';

  @override
  String get financeKYCAddressVerified => 'Dirección Verificada';

  @override
  String get financeKYCStartVerification => 'Iniciar Verificación';

  @override
  String get financeKYCContinueVerification => 'Continuar Verificación';

  @override
  String get financeKYCCheckStatus => 'Verificar Estado';

  @override
  String get financeKYCTryAgain => 'Intentar Nuevamente';

  @override
  String get financeCardStatusActive => 'Activa';

  @override
  String get financeCardStatusInactive => 'Inactiva';

  @override
  String get financeCardStatusFrozen => 'Congelada';

  @override
  String get financeCardStatusUnderReview => 'En Revisión';

  @override
  String get financeCardStatusFailed => 'Error de Verificación';

  @override
  String get financeCardActivationTitle => 'Activando Tarjeta';

  @override
  String get financeCardAlmostReady => 'Ya casi está lista';

  @override
  String get financeCardActivationMessage =>
      'Su tarjeta se está activando. Esto puede tomar unos momentos. Por favor no cierre la aplicación.';

  @override
  String get financeCardActivationCancel => 'Cancelar';

  @override
  String get financeCardActivationActivate => 'Activar Ahora';

  @override
  String get financeCardUnderReview =>
      'La activación de la tarjeta está en revisión. Por favor espere.';

  @override
  String get financeUSD => 'USD';

  @override
  String get financeViewAll => 'Ver todo';

  @override
  String get financeNoAccount => 'Sin cuenta';

  @override
  String get financeCreateNewAccountSubtitle =>
      'Crea una nueva cuenta para empezar';

  @override
  String get financeCreateNewAccount => 'Crear nueva cuenta';

  @override
  String get financeSourceOfFundsQuestionnaire =>
      'Completa el cuestionario sobre el origen de los fondos';

  @override
  String get financeSanctionsScreen => 'Completa la verificación de sanciones';

  @override
  String get financePEPScreen =>
      'Completa la verificación PEP (Persona Políticamente Expuesta)';

  @override
  String get financeBlocklistLookup =>
      'Completa la verificación de lista de bloqueo';

  @override
  String get financeAdverseMediaScreen =>
      'Completa la verificación de medios adversos';

  @override
  String get financeGovernmentIDVerification =>
      'Completa la verificación de identificación gubernamental';

  @override
  String get financeServiceNotAvailableInRegion =>
      'Este servicio no está disponible en tu región actual';

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
  String get financeSelectImageSource => 'Selecciona la fuente de la imagen';

  @override
  String get financeCamera => 'Cámara';

  @override
  String get financeGallery => 'Galería';

  @override
  String get financeTermsError => 'Error en los términos';

  @override
  String get financeTermOfService => 'Términos de servicio';

  @override
  String get financeTermsAcceptanceMessage =>
      'Debes aceptar los términos de servicio antes de actualizar la información del cliente.';

  @override
  String get financeAcceptTerms => 'Acepto los términos de servicio';

  @override
  String get financeTermsAccepted => 'Términos de servicio aceptados';

  @override
  String get financeCustomerType => 'Tipo de cliente';

  @override
  String get financeIndividual => 'Persona natural';

  @override
  String get financeCustomerTypeRequired =>
      'Se requiere especificar el tipo de cliente';

  @override
  String get financeEmail => 'Correo electrónico';

  @override
  String get financeBirthday => 'Fecha de nacimiento';

  @override
  String get financeBirthDateRequired => 'Se requiere la fecha de nacimiento';

  @override
  String get financeMinimumAge => 'Debes tener al menos 18 años';

  @override
  String get financeUploadFrontID => 'Subir identificación frontal';

  @override
  String get financeUploadBackID => 'Subir identificación trasera';

  @override
  String get financeUploadBothImages =>
      'Por favor sube ambas imágenes de identificación: frontal y trasera';

  @override
  String get financePrimaryIDRequired =>
      'Se requiere una identificación primaria (SSN/ITIN)';

  @override
  String get financeSSNLabel => 'Número de Seguro Social (SSN)';

  @override
  String get financeITINLabel => 'ID de Contribuyente Individual (ITIN)';

  @override
  String get financePrimaryIDRequiredUSA =>
      'Se requiere identificación primaria para EE. UU.';

  @override
  String get financeSelectPrimaryIDType =>
      'Por favor selecciona un tipo de identificación primaria';

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
      'Se requiere identificación secundaria para EE. UU.';

  @override
  String get financeSelectSecondaryIDType =>
      'Por favor selecciona un tipo de identificación secundaria';

  @override
  String get financeIDTypeRequired => 'Se requiere un tipo de identificación';

  @override
  String get financeSelectIDType =>
      'Por favor selecciona un tipo de identificación';

  @override
  String get financeNumber => 'Número';

  @override
  String get financeNumberRequired => 'Se requiere el número';

  @override
  String get financeEditCustomer => 'Editar cliente';

  @override
  String get financePleaseWait => 'Por favor espera…';

  @override
  String get financeUpdate => 'Actualizar';

  @override
  String get financeChooseImageSource => 'Elige cómo deseas agregar tu imagen:';

  @override
  String get financeImageError => 'Error con la imagen';

  @override
  String financeFailedToPickImage(String error) {
    return 'Error al seleccionar imagen: $error';
  }

  @override
  String get financeChoose => 'Elige';

  @override
  String get financeTermsRequired => 'Términos requeridos';

  @override
  String get financeAcceptToSBeforeUpdate =>
      'Por favor acepta los Términos de Servicio antes de actualizar';

  @override
  String get financeUpdateFailed => 'Actualización fallida';

  @override
  String financePleaseComplete(String fields) {
    return 'Por favor completa: $fields';
  }

  @override
  String get financeTakeNewPhoto => 'Tomar una nueva foto';

  @override
  String get financeChooseExistingPhotos => 'Elegir de fotos existentes';

  @override
  String get financeCameraAccessRequired =>
      'Se requiere acceso a la cámara para tomar fotos. Por favor permite el acceso e intenta nuevamente.';

  @override
  String get financeGalleryAccessRequired =>
      'Se requiere acceso a la galería para seleccionar imágenes. Por favor permite el acceso e intenta nuevamente.';

  @override
  String get financeCameraAccessDenied =>
      'El acceso a la cámara ha sido denegado permanentemente. Habilita el permiso en la configuración de tu dispositivo para tomar fotos.';

  @override
  String get financeGalleryAccessDenied =>
      'El acceso a la galería ha sido denegado permanentemente. Habilita el permiso en la configuración de tu dispositivo para seleccionar imágenes.';

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
      'Se requiere permiso de galería para seleccionar imágenes. Habilita el permiso en la configuración.';

  @override
  String get financeFailedToAccessImage => 'Error al acceder a la imagen';

  @override
  String get financeCameraAccessWasDenied =>
      'El acceso a la cámara fue denegado. Habilita el permiso en la configuración.';

  @override
  String get financeGalleryAccessWasDenied =>
      'El acceso a la galería fue denegado. Habilita el permiso en la configuración.';

  @override
  String get financeNoCameraAvailable =>
      'No hay cámara disponible en este dispositivo.';

  @override
  String get financeInvalidImageFile =>
      'El archivo seleccionado no es una imagen válida. Por favor elige otro archivo.';

  @override
  String get financeUnableToTakePhoto =>
      'No se puede tomar la foto. Intenta nuevamente.';

  @override
  String get financeUnableToSelectImage =>
      'No se puede seleccionar la imagen. Intenta nuevamente.';

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
  String get financeCountryRequired => 'Se requiere el país';

  @override
  String get financeIdentificationtype => 'Tipo de identificación';

  @override
  String get financeUploadBothImagesSecondaryID =>
      'Por favor sube ambas imágenes, frontal y trasera, de la identificación secundaria';

  @override
  String get financeUploadBothIDImages =>
      'Por favor sube ambas imágenes de identificación, frontal y trasera';

  @override
  String get financeAcceptToSBeforeCreating =>
      'Por favor acepta los Términos de Servicio antes de crear un cliente';

  @override
  String get financeWalletDashboard => 'Panel de billetera';

  @override
  String get financeVirtualCards => 'Tarjetas virtuales';

  @override
  String get financeCreateNewWallet => 'Crear nueva billetera';

  @override
  String get financeAllWalletsCreated =>
      'Todas las billeteras disponibles ya han sido creadas';

  @override
  String get financeCustomerIDNotFound =>
      'ID de cliente no encontrado. Por favor inicia sesión nuevamente.';

  @override
  String get financeFailedToCreateWallet => 'Error al crear la billetera';

  @override
  String get financeWalletDetails => 'Detalles de la billetera';

  @override
  String get financeLoadingWalletDetails =>
      'Cargando detalles de la billetera...';

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
      'Necesitamos información tuya para configurar tu billetera';

  @override
  String get financeNoWalletsMessage =>
      'Aún no tienes billeteras. Crea tu primera billetera para comenzar.';

  @override
  String get financeRetry => 'Reintentar';

  @override
  String get financeWalletOverview => 'Resumen de la billetera';

  @override
  String get financeManageAssets =>
      'Administra tus activos digitales y transacciones';

  @override
  String get financeWalletInformation => 'Información de la billetera';

  @override
  String get financeCreated => 'Creado';

  @override
  String get financeWalletAddress => 'Dirección de la billetera';

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
      'Dirección de destino o parámetros inválidos. Por favor verifica tu entrada.';

  @override
  String get financeAuthenticationError =>
      'Error de autenticación. Por favor inicia sesión nuevamente.';

  @override
  String get financeInsufficientBalance =>
      'Saldo insuficiente para esta transacción.';

  @override
  String get financeNetworkError =>
      'Error de red. Por favor verifica tu conexión a Internet.';

  @override
  String get financeRequestTimeout =>
      'Tiempo de espera agotado. Por favor intenta nuevamente.';

  @override
  String get financeRecentTransactions => 'Transacciones recientes';

  @override
  String get financeNoTransactionsYet => 'Aún no hay transacciones o depósitos';

  @override
  String get financeTransactionsWillAppear =>
      'Tus transacciones y depósitos aparecerán aquí';

  @override
  String get financeTransactionReceipt => 'Recibo de transacción';

  @override
  String get financeTransactionID => 'ID de transacción';

  @override
  String get financeAmount => 'Monto';

  @override
  String get financeStatus => 'Estado';

  @override
  String get financeFromCurrency => 'De moneda';

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
  String get financeVerifyAddress => 'Verifica la dirección antes de enviar';

  @override
  String get financeLoadingTransfers => 'Cargando transferencias...';

  @override
  String get financeNoTransfersYet => 'Aún no hay transferencias';

  @override
  String get financeTransfersWillAppear =>
      'Tus transferencias de criptomonedas aparecerán aquí';

  @override
  String get financeCryptoTransfer => 'Transferencia de criptomonedas';

  @override
  String get financeNoItemsFound => 'No se encontraron elementos';

  @override
  String get financePleaseEnterAmount => 'Por favor ingresa el monto';

  @override
  String get financePleaseEnterAllFields =>
      'Por favor completa todos los campos';

  @override
  String get financeCustomerNotFound =>
      'Cliente no encontrado. Por favor intenta nuevamente.';

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
  String get financeImportantDepositMessage =>
      'Mensaje importante sobre el depósito';

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
  String get financeEnterCode => 'Ingrese Código';

  @override
  String get financeEnter4DigitCode =>
      'Ingrese su código de transacción de 4 dígitos para continuar';

  @override
  String get financeForgotPIN => 'Olvidó su PIN?';

  @override
  String get financeVerifyOTP => 'Verificar OTP';

  @override
  String get financeEnter6DigitCodeSent =>
      'Ingrese el código de 6 dígitos enviado a';

  @override
  String get financeVerify => 'Verificar';

  @override
  String get financeDidntReceiveCode => 'No recibió el código? ';

  @override
  String get financeResend => 'Reenviar';

  @override
  String financeResendIn(Object seconds) {
    return 'Reenviar en ${seconds}s';
  }

  @override
  String get financeOTPMust6Digits => 'El OTP debe tener 6 dígitos';

  @override
  String get financeWrongOTP =>
      'OTP incorrecto. Por favor ingrese el OTP correcto nuevamente.';

  @override
  String get financeInvalidOTPRestart =>
      'OTP inválido. Por favor inicie el registro nuevamente.';

  @override
  String get financeSendingOTP => 'Enviando OTP';

  @override
  String get financePleaseWaitSendingCode =>
      'Por favor espere mientras enviamos el código de verificación a su correo electrónico';

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
  String get financeWithdraw => 'Retirar';

  @override
  String get financeLoadingWallets => 'Cargando billeteras...';

  @override
  String get financeZeroBalance => '0.00 USD';

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
  String get financeHowMuch => 'Cuánto?';

  @override
  String get financeTransfer_money_to_any_user =>
      'Transferir dinero a cualquier usuario';

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
  String get financeExternalAccountStepBank => 'Info\nbancaria';

  @override
  String get financeExternalAccountStepPersonal => 'Info\npersonal';

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
  String get financeExternalAccountGoBackTitle => 'Volver?';

  @override
  String get financeExternalAccountGoBackMessage =>
      'Está seguro de que desea volver? Toda la información ingresada se perderá.';

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
      'Comencemos una\n cuenta externa';

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
  String get financePayCryptoCardDetails => 'Detalles de la tarjeta';

  @override
  String get financePayCryptoBalanceOverview => 'Resumen de saldo';

  @override
  String get financePayCryptoCurrentBalance => 'Saldo actual';

  @override
  String get financePayCryptoAvailableBalance => 'Saldo disponible';

  @override
  String get financePayCryptoFreezeCard => 'Congelar tarjeta';

  @override
  String get financePayCryptoEnterReason => 'Ingresa el motivo para congelarla';

  @override
  String get financePayCryptoConfirmFreeze =>
      '¿Estás seguro de que deseas congelar esta tarjeta?';

  @override
  String get financePayCryptoFreeze => 'Congelar';

  @override
  String get financePayCryptoUnfreeze => 'Descongelar';

  @override
  String get financePayCryptoDeposit => 'Depósito';

  @override
  String get financePayCryptoCopyNumber => 'Copiar número';

  @override
  String get financePayCryptoCopyAll => 'Copiar todo';

  @override
  String get financePayCryptoSecurityTips => 'Consejos de seguridad';

  @override
  String get financePayCryptoCardNumberCopied =>
      'Número de tarjeta copiado al portapapeles';

  @override
  String get financePayCryptoAllDetailsCopied =>
      'Todos los detalles de la tarjeta copiados al portapapeles';

  @override
  String get financePayCryptoNoCards => 'Sin tarjetas';

  @override
  String get financePayCryptoCreateNewCard =>
      'Crea una nueva tarjeta para comenzar';

  @override
  String get financePayCryptoCreateANewCard => 'Crear una nueva tarjeta';

  @override
  String get financePayCryptoHistory => 'Historial';

  @override
  String get financePayCryptoKYCVerification => 'Verificación KYC';

  @override
  String get financeKYCSectionPersonalInfo => 'Información\nPersonal';

  @override
  String get financeKYCSectionAddress => 'Dirección';

  @override
  String get financeKYCSectionDocuments => 'Documentos';

  @override
  String get financeKYCSectionReview => 'Revisar y enviar';

  @override
  String get financeKYCBtnPrevious => 'Anterior';

  @override
  String get financeKYCBtnNext => 'Siguiente';

  @override
  String get financeKYCBtnSubmit => 'Enviar KYC';

  @override
  String get financeKYCBtnCancel => 'Cancelar';

  @override
  String get financePayCryptoPersonalInfo => 'Información\n personal';

  @override
  String get financePayCryptoAddress => 'Dirección';

  @override
  String get financePayCryptoDocument => 'Documento';

  @override
  String get financePayCryptoReview => 'Revisión';

  @override
  String get financePayCryptoFirstName => 'Nombre';

  @override
  String get financePayCryptoLastName => 'Apellido';

  @override
  String get financePayCryptoFirstNameRequired => 'Por favor ingresa tu nombre';

  @override
  String get financePayCryptoFirstNameMinLength =>
      'El nombre debe tener al menos 3 caracteres';

  @override
  String get financePayCryptoLastNameRequired =>
      'Por favor ingresa tu apellido';

  @override
  String get financePayCryptoLastNameMinLength =>
      'El apellido debe tener al menos 3 caracteres';

  @override
  String get financePayCryptoZipMinLength =>
      'El código postal debe tener al menos 4 caracteres';

  @override
  String get financePayCryptoPleaseEnterFirstName =>
      'Por favor ingrese su nombre';

  @override
  String get financePayCryptoPleaseEnterLastName =>
      'Por favor ingrese su apellido';

  @override
  String get financePayCryptoPleaseEnterEmail =>
      'Por favor ingrese su correo electrónico';

  @override
  String get financePayCryptoPleaseEnterValidEmail =>
      'Por favor ingrese un correo electrónico válido';

  @override
  String get financePayCryptoEmail => 'Correo electrónico';

  @override
  String get financePayCryptoEmailRequired =>
      'Por favor ingresa tu correo electrónico';

  @override
  String get financePayCryptoEmailInvalid =>
      'Por favor ingresa un correo electrónico válido';

  @override
  String get financePayCryptoCountryRequired => 'El país es requerido';

  @override
  String get financePayCryptoCountryCode => 'Código de país';

  @override
  String get financePayCryptoPhoneNumber => 'Número de teléfono';

  @override
  String get financePayCryptoPhoneRequired =>
      'Por favor ingresa tu número de teléfono';

  @override
  String get financePayCryptoPhoneMinLength =>
      'El número de teléfono debe tener al menos 5 dígitos';

  @override
  String get financePayCryptoGender => 'Género';

  @override
  String get financePayCryptoMale => 'Masculino';

  @override
  String get financePayCryptoFemale => 'Femenino';

  @override
  String get financePayCryptoDateOfBirth => 'Fecha de nacimiento';

  @override
  String get financePayCryptoDobRequired =>
      'La fecha de nacimiento es requerida';

  @override
  String get financePayCryptoAddressRequired => 'La dirección es requerida';

  @override
  String get financePayCryptoAddressMinLength =>
      'La dirección debe tener al menos 5 caracteres';

  @override
  String get financePayCryptoCity => 'Ciudad';

  @override
  String get financePayCryptoCityRequired => 'La ciudad es requerida';

  @override
  String get financePayCryptoCountry => 'País';

  @override
  String get financePayCryptoStateRequired =>
      'El estado/provincia es requerido';

  @override
  String get financePayCryptoStateProvince => 'Estado/Provincia';

  @override
  String get financePayCryptoSelectCountryFirst => 'Primero selecciona un país';

  @override
  String get financePayCryptoZipCode => 'Código postal';

  @override
  String get financePayCryptoZipRequired => 'El código postal es requerido';

  @override
  String get financePayCryptoDocumentType => 'Tipo de documento';

  @override
  String get financePayCryptoPassport => 'Pasaporte';

  @override
  String get financePayCryptoIdCard => 'Cédula de identidad';

  @override
  String get financePayCryptoDriversLicense => 'Licencia de conducir';

  @override
  String get financePayCryptoDocumentNumber => 'Número de documento';

  @override
  String get financePayCryptoDocumentNumberRequired =>
      'Por favor ingresa el número de documento';

  @override
  String get financePayCryptoFrontDocument => 'Frente del documento';

  @override
  String get financePayCryptoBackDocument => 'Reverso del documento';

  @override
  String get financePayCryptoSelfieWithDocument => 'Selfie con documento';

  @override
  String get financePayCryptoUploadPhoto => 'Subir foto';

  @override
  String get financePayCryptoTakePhoto => 'Tomar foto';

  @override
  String get financePayCryptoChooseFromGallery => 'Elegir de la galería';

  @override
  String get financePayCryptoCancel => 'Cancelar';

  @override
  String get financePayCryptoNext => 'Siguiente';

  @override
  String get financePayCryptoPrevious => 'Anterior';

  @override
  String get financePayCryptoSubmit => 'Enviar';

  @override
  String get financePayCryptoReviewYourInfo => 'Revisa tu información';

  @override
  String get financePayCryptoPleaseReview =>
      'Por favor revisa tu información antes de enviar.';

  @override
  String financePayCryptoDocumentRequired(Object documentType) {
    return '$documentType es requerido';
  }

  @override
  String get financePayCryptoKYCSubmitConfirmTitle => 'Enviar Información KYC';

  @override
  String get financePayCryptoKYCSubmitConfirmMessage =>
      'Está seguro de que desea enviar su información KYC? No podrá realizar cambios después del envío.';

  @override
  String get financePayCryptoKYCSubmitSuccess =>
      '¡Información KYC enviada exitosamente!';

  @override
  String get financePayCryptoKYCSubmitError =>
      'Error al enviar la información KYC. Por favor intente nuevamente.';

  @override
  String get financePayCryptoKYCProcessing =>
      'Procesando su información KYC. Esto puede tomar unos minutos...';

  @override
  String get financePayCryptoKYCUnderReviewTitle => 'En Revisión';

  @override
  String get financePayCryptoKYCUnderReviewMessage =>
      'Su información KYC está siendo revisada. Le notificaremos una vez que sea aprobada.';

  @override
  String get financePayCryptoKYCAwaitingApproval => 'Esperando Aprobación';

  @override
  String get financePayCryptoKYCDocumentsReceived => 'Documentos Recibidos';

  @override
  String get financePayCryptoKYCDocumentsUnderReview =>
      'Documentos en Revisión';

  @override
  String get financePayCryptoKYCApprovalPending => 'Aprobación Pendiente';

  @override
  String get financePayCryptoKYCCheckStatus => 'Verificar Estado';

  @override
  String get financePayCryptoKYCBackToHome => 'Volver al Inicio';

  @override
  String get financeKYCFirstName => 'Nombre';

  @override
  String get financeKYCLastName => 'Apellido';

  @override
  String get financeKYCEmail => 'Correo Electrónico';

  @override
  String get financeKYCCountryCode => 'Código de País';

  @override
  String get financeKYCPhoneNumber => 'Número de Teléfono';

  @override
  String get financeKYCGender => 'Género';

  @override
  String get financeKYCMale => 'Masculino';

  @override
  String get financeKYCFemale => 'Femenino';

  @override
  String get financeKYCDateOfBirth => 'Fecha de Nacimiento';

  @override
  String get financeKYCAddress => 'Dirección';

  @override
  String get financeKYCCity => 'Ciudad';

  @override
  String get financeKYCState => 'Estado/Provincia';

  @override
  String get financeKYCZipCode => 'Código Postal';

  @override
  String get financeKYCSelectCountryFirst => 'Seleccione un país primero';

  @override
  String get financePayCryptoPleaseEnterCountryCode =>
      'Por favor ingrese el código de país';

  @override
  String get financePayCryptoPleaseEnterPhoneNumber =>
      'Por favor ingrese su número de teléfono';

  @override
  String get financePayCryptoKYCUnderReview => 'KYC en Revisión';

  @override
  String get financePayCryptoDefaultCard => 'Tarjeta predeterminada';

  @override
  String get financePayCryptoUseAsDefault =>
      'Usar esta tarjeta como predeterminada';

  @override
  String get financePayCryptoContactlessPayment => 'Pago sin contacto';

  @override
  String get financePayCryptoEnableContactless =>
      'Habilitar pagos sin contacto';

  @override
  String get financePayCryptoPINCode => 'Código PIN';

  @override
  String get financePayCryptoAskPINWhenPaying =>
      'Solicitar código PIN al pagar';

  @override
  String get financePayCryptoSpending => 'Gasto';

  @override
  String get financePayCryptoTransactionHistory => 'Transacción';

  @override
  String get financeExternalAccountPleaseCreateCustomer =>
      'Por favor cree un perfil de cliente primero para administrar cuentas externas';

  @override
  String get financeExternalAccountWeNeedInfo =>
      'Necesitamos información tuya\npara configurar la cuenta externa';

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
  String get financeTransferDetails => 'Detalles de la transferencia';

  @override
  String get financeVirtualAccount => 'Cuenta Virtual';

  @override
  String get financeDepositReceived => 'Depósito Recibido';

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
  String get financeMain_Wallet => 'Billetera';

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
  String get sunday => 'Do';

  @override
  String get monday => 'Lu';

  @override
  String get tuesday => 'Ma';

  @override
  String get wednesday => 'Mi';

  @override
  String get thursday => 'Ju';

  @override
  String get friday => 'Vi';

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
  String get financeUnknownError => 'Ocurrió un error desconocido';

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
  String get youAreConnected => '¡Estás conectado!';

  @override
  String youCanNowTalkTo(String contactName) {
    return 'Ahora puedes hablar con @$contactName';
  }

  @override
  String get goChat => 'Ir al chat';

  @override
  String get verifyingOtherAccount => 'Verificando la \notra cuenta';

  @override
  String waitingForContactToAccept(String contactName) {
    return 'Esperando a que $contactName \nacepte la invitación';
  }

  @override
  String get creatingGroup => 'Creando grupo';

  @override
  String settingUpYourGroup(String groupName) {
    return 'Configurando tu grupo $groupName';
  }

  @override
  String get noInternetConnection => '¡No hay conexión a internet!';

  @override
  String get pleaseCheckYourInternetConnection =>
      'Por favor revisa tu conexión\na internet';

  @override
  String get enableWiFi => 'Activar WiFi';

  @override
  String get testingExternalAccountCreationAPI =>
      'Probando API de creación de cuenta externa';

  @override
  String get payload => 'Carga útil';

  @override
  String get responseStatus => 'Estado de respuesta';

  @override
  String get responseHeaders => 'Encabezados de respuesta';

  @override
  String get responseBody => 'Cuerpo de respuesta';

  @override
  String get successExternalAccountCreated =>
      '¡Éxito! Cuenta externa creada correctamente';

  @override
  String get responseStructure => 'Estructura de la respuesta';

  @override
  String get errorDetails => 'Detalles del error';

  @override
  String get rawError => 'Error crudo';

  @override
  String get exception => 'Excepción';

  @override
  String get testingCustomerVerificationStatus =>
      'Probando estado de verificación del cliente';

  @override
  String get customerID => 'ID del cliente';

  @override
  String get customerFound => 'Cliente encontrado';

  @override
  String get hasAcceptedTerms => 'Aceptó los términos';

  @override
  String get rejectionReasons => 'Motivos de rechazo';

  @override
  String get requirementsDue => 'Requisitos pendientes';

  @override
  String get canCreateExternalAccounts => 'Puede crear cuentas externas';

  @override
  String get issuesPreventingExternalAccountCreation =>
      'Problemas que impiden crear cuenta externa:';

  @override
  String get termsOfServiceNotAccepted => 'Términos de servicio no aceptados';

  @override
  String get accountHasRejectionReasons => 'La cuenta tiene motivos de rechazo';

  @override
  String get authFixCheckingClient => 'AuthFix: Verificando cliente';

  @override
  String get isLogged => 'está conectado';

  @override
  String get userID => 'ID de usuario';

  @override
  String get authFixStoredMatrixId => 'AuthFix: matrix_id guardado';

  @override
  String get authFixFixingMatrixId => 'AuthFix: Corrigiendo matrix_id desde';

  @override
  String get authFixGeneratingTokens =>
      'AuthFix: Generando tokens para usuario';

  @override
  String get authFixJwtTokenGenerated =>
      'AuthFix: Token JWT generado y guardado';

  @override
  String get authFixCsrfTokenGenerated =>
      'AuthFix: Token CSRF generado y actualización iniciada';

  @override
  String get authFixCsrfTokenFailed =>
      'AuthFix: Falló la generación de token CSRF';

  @override
  String get authFixJwtTokenFailed =>
      'AuthFix: Falló la generación de token JWT';

  @override
  String get authFixMatrixIdCorrect =>
      'AuthFix: Matrix ID correcto, no requiere cambios';

  @override
  String get authFixClientNotLoggedIn =>
      'AuthFix: Cliente no conectado o sin userID';

  @override
  String get authFixException => 'AuthFix: Excepción';

  @override
  String get autoEncryptionSetupFailed =>
      'Falló la configuración automática de cifrado';

  @override
  String get autoDeviceVerificationFailed =>
      'Falló la verificación automática del dispositivo';

  @override
  String get autoRoomEncryptionFailed =>
      'Falló el cifrado automático de la sala';

  @override
  String get messageSentToRoom => 'Mensaje enviado a la sala';

  @override
  String get roomNotFound => 'Sala no encontrada';

  @override
  String get errorSendingMessage => 'Error al enviar el mensaje';

  @override
  String get messageSentToRoomAlias => 'Mensaje enviado al alias de sala';

  @override
  String get errorSendingMessageToAlias => 'Error al enviar mensaje al alias';

  @override
  String get directMessageSentTo => 'Mensaje directo enviado a';

  @override
  String get errorSendingDirectMessage => 'Error al enviar mensaje directo';

  @override
  String get passwordMinLength =>
      'La contraseña debe tener mínimo 6 caracteres';

  @override
  String get contactSearch => 'Buscar contactos';

  @override
  String get noChatsFound => 'No se encontraron charlas';

  @override
  String get emoji => 'Emojis';

  @override
  String get contactsAccessRequired => 'Se requiere acceso a contactos';

  @override
  String get myCard => 'Mi tarjeta';

  @override
  String get favoriteMessage => 'Mensaje favorito';

  @override
  String get messageContentUnavailable => 'Contenido del mensaje no disponible';

  @override
  String get storageAccessRequired => 'Se requiere acceso al almacenamiento';

  @override
  String get searchFiles => 'Buscar archivos';

  @override
  String get noFilesFound => 'No se encontraron archivos';

  @override
  String get refresh => 'Actualizar';

  @override
  String sendPhotos(int count, String plural) {
    return 'Enviar $count foto$plural';
  }

  @override
  String get locationAccessRequired => 'Se requiere acceso a la ubicación';

  @override
  String get failedToGetLocation => 'Error al obtener la ubicación';

  @override
  String get tapToGetCurrentLocation => 'Toca para obtener tu ubicación actual';

  @override
  String get getLocation => 'Obtener ubicación';

  @override
  String get currentLocation => 'Ubicación actual';

  @override
  String get sendCurrentLocation => 'Enviar ubicación actual';

  @override
  String get chooseOnMap => 'Elegir en el mapa';

  @override
  String get refreshLocation => 'Actualizar ubicación';

  @override
  String get debug => 'Depurar';

  @override
  String get weak => 'Débil';

  @override
  String get medium => 'Media';

  @override
  String get good => 'Buena';

  @override
  String get strong => 'Fuerte';

  @override
  String get confirmGoBack => 'Confirmar';

  @override
  String get goBackProgressLost =>
      'Estás seguro de que quieres regresar? Tu progreso se perderá.';

  @override
  String get createAccount => 'Crear cuenta';

  @override
  String get verifyPhone => 'Vamos a verificar tu número de teléfono.';

  @override
  String get isItCorrectOrModify => '¿Es correcto o quieres modificarlo?';

  @override
  String get waitingToDetectSms =>
      'Esperando detectar automáticamente el SMS enviado a';

  @override
  String get verificationCode => 'Código de verificación';

  @override
  String get resendCode => 'Reenviar código';

  @override
  String get sendAgain => 'Enviar de nuevo';

  @override
  String get fullName => 'Nombre completo';

  @override
  String get exampleEmail => 'ejemplo@correo.com';

  @override
  String get continueButton => 'Continuar';

  @override
  String get atLeast6Characters => 'Mínimo 6 caracteres';

  @override
  String get backToLogin => 'Volver al inicio de sesión';

  @override
  String get usernameOrEmailRequired =>
      'Se requiere nombre de usuario o correo electrónico';

  @override
  String get invalidEmailOrPassword => 'Correo o contraseña incorrectos';

  @override
  String get invalidUsernameOrPassword => 'Usuario o contraseña incorrectos';

  @override
  String get emailNotFoundSignUp =>
      'Correo no encontrado. Verifica tu correo o regístrate primero.';

  @override
  String get tooManyLoginAttempts =>
      'Demasiados intentos de inicio de sesión. Intenta más tarde.';

  @override
  String get serverErrorTryAgain =>
      'Error del servidor. Intenta nuevamente más tarde.';

  @override
  String loginFailed(Object loginError) {
    return 'Error al iniciar sesión: $loginError';
  }

  @override
  String get serverConfigError =>
      'Error de configuración del servidor. Contacta soporte.';

  @override
  String get serverError =>
      'Error del servidor. El servicio de correo podría no estar disponible.';

  @override
  String get requestTimeout => 'Tiempo de espera agotado. Intenta nuevamente.';

  @override
  String get emailServiceNotAvailable =>
      'Servicio de correo no disponible. Contacta soporte.';

  @override
  String get serverErrorTryLater => 'Error del servidor. Intenta más tarde.';

  @override
  String get passwordIsRequired => 'La contraseña es obligatoria';

  @override
  String get confirmPasswordRequired => 'Confirmar contraseña es obligatorio';

  @override
  String get emailNotVerified =>
      'Aún no has verificado tu correo.\nPor favor revisa tu correo y haz clic en el enlace de verificación primero.';

  @override
  String weSentResetLink(String email) {
    return 'Enviamos un enlace de restablecimiento a $email';
  }

  @override
  String get verificationWarning =>
      'Aún no verificado. Haz clic en el enlace de verificación en tu correo, luego ingresa tu nueva contraseña abajo.';

  @override
  String get enterNewPassword => 'Ingresa nueva contraseña';

  @override
  String get confirmNewPassword => 'Confirma nueva contraseña';

  @override
  String get connectionError =>
      'Error de conexión. Por favor verifica tu conexión a internet.';

  @override
  String get enterEmail => 'Ingresa correo electrónico';

  @override
  String get enterEmailOrUsername => 'Ingresa correo o nombre de usuario';

  @override
  String get forgotYourPassword => 'Olvidaste tu contraseña?';

  @override
  String get orLoginWith => 'o inicia sesión con';

  @override
  String get doYouHaveAccount => 'Tienes una cuenta?';

  @override
  String get usernameMinLength =>
      'El nombre de usuario debe tener al menos 3 caracteres';

  @override
  String get usernameMaxLength =>
      'El nombre de usuario debe tener 20 caracteres o menos';

  @override
  String get usernameInvalidFormat =>
      'El nombre de usuario solo puede contener letras minúsculas, números, guión bajo (_) y punto (.)';

  @override
  String get usernameCannotStartWith =>
      'El nombre de usuario no puede empezar con guión bajo (_) o punto (.)';

  @override
  String get usernameCannotEndWith =>
      'El nombre de usuario no puede terminar con guión bajo (_) o punto (.)';

  @override
  String get usernameConsecutiveChars =>
      'El nombre de usuario no puede tener caracteres especiales consecutivos';

  @override
  String get usernameMustContainLetter =>
      'El nombre de usuario debe contener al menos una letra';

  @override
  String get fullNameIsRequired => 'El nombre completo es obligatorio';

  @override
  String get usernameAlreadyTaken => 'Nombre de usuario ya tomado';

  @override
  String get usernameAlreadyInUse =>
      'Este nombre de usuario ya está en uso. Por favor elige otro.';

  @override
  String get emailAlreadyInUse => 'Este correo ya está en uso.';

  @override
  String get langEnglish => 'Inglés';

  @override
  String get langSpanish => 'Español';

  @override
  String get countrySpain => 'España';

  @override
  String get countryUS => 'Estados Unidos';

  @override
  String get countryUnitedStates => 'Estados Unidos';

  @override
  String get countryFrance => 'Francia';

  @override
  String get countryGermany => 'Alemania';

  @override
  String get countryItaly => 'Italia';

  @override
  String get countryAustralia => 'Australia';

  @override
  String get countryBrazil => 'Brasil';

  @override
  String get enterText => 'Ingresar texto';

  @override
  String get recordingFailed => '¡Grabación fallida!';

  @override
  String get rememberMe => 'Recuérdame';

  @override
  String get otpVerificationFailed => 'Verificación OTP fallida';

  @override
  String get customerNotFound => 'Cliente no encontrado';

  @override
  String get failedToGetCustomerStatus =>
      'Error al obtener el estado del cliente';

  @override
  String get failedToGetCustomerStatusAfterCsrfRefresh =>
      'Error al obtener el estado del cliente después de actualizar CSRF';

  @override
  String get failedToUpdateCustomer => 'Error al actualizar el cliente';

  @override
  String get failedToCreateKycLink => 'Error al crear enlace KYC';

  @override
  String get failedToGetKycStatus => 'Error al obtener el estado KYC';

  @override
  String get usernameCheckFailed =>
      'Falló la verificación del nombre de usuario';

  @override
  String get failedToRegisterCustomerAfterRetries =>
      'Error al registrar el cliente después de todos los intentos';

  @override
  String get failedToVerifyOtpAfterRetries =>
      'Error al verificar OTP después de todos los intentos';

  @override
  String get fullNameRequired => 'El nombre completo es obligatorio';

  @override
  String get usernameRequired => 'El nombre de usuario es obligatorio';

  @override
  String get usernameCannotContainSpaces =>
      'El nombre de usuario no puede contener espacios';

  @override
  String get apiErrorTitle => 'Error';

  @override
  String get apiErrorDefaultMessage => 'Ocurrió un error';

  @override
  String get apiErrorInvalidField => 'Campo inválido';

  @override
  String get financeKYCAgeRestrictionError =>
      'Debes tener al menos 18 años para registrarte';

  @override
  String get financeKYCDocumentUpload => 'Subir imagen';

  @override
  String get financeKYCPreviousButton => 'Anterior';

  @override
  String get financeKYCCancelButton => 'Cancelar';

  @override
  String get financeKYCNextButton => 'Siguiente';

  @override
  String get financeKYCSubmitButton => 'Enviar KYC';

  @override
  String get financeKYCPersonalInfoStep => 'Información Personal';

  @override
  String get financeKYCAddressStep => 'Dirección';

  @override
  String get financeKYCDocumentStep => 'Documento';

  @override
  String get financeKYCReviewStep => 'Revisar';

  @override
  String get financeKYCFrontDocument => 'Frente del Documento';

  @override
  String get financeKYCBackDocument => 'Reverso del Documento';

  @override
  String get financeKYCSelfieWithDocument => 'Selfie con Documento';

  @override
  String get financeKYCErrorTitle => 'Error';

  @override
  String get financeKYCProcessingMessage =>
      'Tu solicitud de KYC está siendo procesada. Te notificaremos una vez que esté completa.';

  @override
  String get financeKYCDocumentsReceived => 'Documentos Recibidos';

  @override
  String get financeKYCUnderReviewStatus => 'En Revisión';

  @override
  String get financeKYCApprovalPending => 'Aprobación Pendiente';

  @override
  String get createStory => 'Crear historia';

  @override
  String get text => 'Texto';

  @override
  String get photo => 'Foto';

  @override
  String get video => 'Video';

  @override
  String get typeYourStory => 'Escribe tu historia...';

  @override
  String get videoSelected => 'Video seleccionado';

  @override
  String get tapToSelectPhoto => 'Toca para elegir foto';

  @override
  String get tapToSelectVideo => 'Toca para elegir video';

  @override
  String get storyCreatedSuccessfully => '¡Historia creada con éxito!';

  @override
  String get pleaseEnterSomeText => 'Por favor escribe algo de texto';

  @override
  String get pleaseSelectAPhoto => 'Por favor selecciona una foto';

  @override
  String get pleaseSelectAVideo => 'Por favor selecciona un video';

  @override
  String errorPickingMedia(String error) {
    return 'Error al seleccionar medio: $error';
  }

  @override
  String errorCreatingStory(String error) {
    return 'Error al crear la historia: $error';
  }

  @override
  String get storyViews => 'Vistas de la historia';

  @override
  String views(int count) {
    return '$count vistas';
  }

  @override
  String get noViewsYet => 'Todavía no hay vistas';

  @override
  String get videoStory => 'Historia en video';

  @override
  String get justNow => 'Justo ahora';

  @override
  String minutesAgo(int minutes) {
    return 'hace $minutes min';
  }

  @override
  String hoursAgo(int hours) {
    return 'hace $hours h';
  }

  @override
  String get noStoriesAvailable => 'No hay historias disponibles';

  @override
  String get mediaUploadIssue => 'Problema al subir medios';

  @override
  String get checkSynapseMediaConfiguration =>
      'Revisa la configuración de medios de Synapse';

  @override
  String get replyToStory => 'Responder a la historia...';

  @override
  String viewedBy(int count) {
    return 'Visto por $count';
  }

  @override
  String get replySent => '¡Respuesta enviada!';

  @override
  String get deleteStory => 'Eliminar historia';

  @override
  String get areYouSureDeleteStory => 'Seguro quieres eliminar esta historia?';

  @override
  String get noBlockedUsers => 'No hay usuarios bloqueados';

  @override
  String get incomingCall => 'Llamada entrante';

  @override
  String get profileSettings => 'Configuración de perfil';

  @override
  String get flightMode => 'Modo avión';

  @override
  String get manageYourFlightMode => 'Administrar tu modo avión';

  @override
  String get passwordAndSecurity => 'Contraseña y seguridad';

  @override
  String get twoFactorAuthentication => 'Autenticación en dos pasos';

  @override
  String get enableTwoFactorAuthentication =>
      'Activar autenticación en dos pasos';

  @override
  String get viewActiveSessions => 'Ver sesiones activas';

  @override
  String get signingIn => 'Iniciando sesión';

  @override
  String get usernameInvalidCharacters =>
      'El nombre de usuario solo puede contener letras, números, puntos, guiones bajos y guiones';

  @override
  String get emailRequired => 'El correo electrónico es obligatorio';

  @override
  String get pleaseEnterValidEmail => 'Por favor ingresa un correo válido';

  @override
  String get passwordRequired => 'La contraseña es obligatoria';

  @override
  String get passwordMustContainUppercase =>
      'La contraseña debe contener al menos 1 letra mayúscula (A-Z)';

  @override
  String get passwordMustContainLowercase =>
      'La contraseña debe contener al menos 1 letra minúscula (a-z)';

  @override
  String get passwordMustContainNumber =>
      'La contraseña debe contener al menos 1 número (0-9)';

  @override
  String get passwordMustContainSpecialChar =>
      'La contraseña debe contener al menos 1 carácter especial (!@#\$%^&*?)';

  @override
  String get passwordCannotContainUsername =>
      'La contraseña no puede contener tu nombre de usuario';

  @override
  String get passwordCannotContainCommonWords =>
      'La contraseña no puede contener palabras comunes';

  @override
  String get passwordCannotContainSequences =>
      'La contraseña no puede contener secuencias simples';

  @override
  String get noPendingVerification =>
      'No se encontró verificación pendiente. Por favor inicia el registro nuevamente.';

  @override
  String get emailVerificationRequiredMessage =>
      'Se requiere verificación de correo. Por favor revisa tu correo y haz clic en el enlace de verificación. Asegúrate de hacer clic en el enlace antes de intentar completar el registro.';

  @override
  String get failedToStartEmailVerification =>
      'Fallo al iniciar la verificación de correo';

  @override
  String get personalAccount => 'Cuenta personal';

  @override
  String get provideIdentificationDetails =>
      'Por favor proporciona tus datos de identificación a continuación.';

  @override
  String get processingData => 'Procesando datos';

  @override
  String get firstName => 'Nombre';

  @override
  String get pleaseEnterFirstName => 'Por favor ingresa tu nombre';

  @override
  String get middleNameOptional => 'Segundo nombre (opcional)';

  @override
  String get lastName => 'Apellido';

  @override
  String get pleaseEnterLastName => 'Por favor ingresa tu apellido';

  @override
  String get idOrPassportType => 'Tipo de ID o pasaporte';

  @override
  String get pleaseSelectDocumentType =>
      'Por favor selecciona un tipo de documento';

  @override
  String get dni => 'DNI';

  @override
  String get passport => 'Pasaporte';

  @override
  String get driverLicense => 'Licencia de conducir';

  @override
  String get otherId => 'Otro ID';

  @override
  String get documentNumber => 'Número de documento';

  @override
  String get pleaseEnterDocumentNumber =>
      'Por favor ingresa tu número de documento';

  @override
  String get resetPassword => 'Restablecer contraseña';

  @override
  String get checkYourEmail => 'Revisa tu correo';

  @override
  String get enterYourEmail => 'Ingresa tu correo electrónico';

  @override
  String get emailIsRequired => 'El correo electrónico es obligatorio';

  @override
  String get sendResetLink => 'Enviar enlace de restablecimiento';

  @override
  String get failedToSendResetEmail =>
      'Error al enviar correo de restablecimiento';

  @override
  String get emailNotFound =>
      'Correo no encontrado. Por favor verifica tu correo o regístrate primero.';

  @override
  String get myStory => 'Mi historia';

  @override
  String get today => 'Hoy';

  @override
  String get yesterday => 'Ayer';

  @override
  String get financeKycNotStarted => 'KYC No Iniciado';

  @override
  String get financeKycIncomplete => 'KYC Incompleto';

  @override
  String get financeKycQuestionnaireRequired => 'Cuestionario Requerido';

  @override
  String get financeKycUboDetailsRequired => 'Detalles UBO Requeridos';

  @override
  String get financeKycUnderReview => 'En Revisión';

  @override
  String get financeKycApproved => 'KYC Aprobado';

  @override
  String get financeKycRejected => 'KYC Rechazado';

  @override
  String get financeKycAccountPaused => 'Cuenta Pausada';

  @override
  String get financeKycAccountClosed => 'Cuenta Cerrada';

  @override
  String get financeKycStatusUnknown => 'Estado Desconocido';

  @override
  String get financeKycNotStartedDesc =>
      'La verificación de identidad aún no ha comenzado';

  @override
  String get financeKycIncompleteDesc =>
      'Por favor completa todos los pasos de verificación requeridos';

  @override
  String get financeKycQuestionnaireRequiredDesc =>
      'Se debe completar un cuestionario adicional';

  @override
  String get financeKycUboDetailsRequiredDesc =>
      'Se requieren detalles del Beneficiario Final Último';

  @override
  String get financeKycUnderReviewDesc =>
      'Tu verificación está siendo revisada actualmente';

  @override
  String get financeKycApprovedDesc =>
      'Tu identidad ha sido verificada exitosamente';

  @override
  String get financeKycRejectedDesc =>
      'La verificación fue rechazada. Por favor revisa y vuelve a enviar';

  @override
  String get financeKycAccountPausedDesc =>
      'Tu cuenta ha sido pausada temporalmente';

  @override
  String get financeKycAccountClosedDesc => 'Tu cuenta ha sido cerrada';

  @override
  String get financeKycUnknownStatusDesc =>
      'No se puede determinar el estado de verificación';

  @override
  String get financeKycStartVerification => 'Iniciar Verificación';

  @override
  String get financeKycCompleteVerification => 'Completar Verificación';

  @override
  String get financeKycCompleteQuestionnaire => 'Completar Cuestionario';

  @override
  String get financeKycProvideUboDetails => 'Proporcionar Detalles UBO';

  @override
  String get financeKycRetryVerification => 'Reintentar Verificación';

  @override
  String get financeKycContinueVerification => 'Continuar Verificación';

  @override
  String get financeKycLoadingStatus => 'Cargando Estado...';

  @override
  String get financeKycOpenLink => 'Abrir Enlace';

  @override
  String get financeKycViewTerms => 'Ver Términos';

  @override
  String get financeKycRefreshStatus => 'Actualizar Estado';

  @override
  String get financeKycCannotOpenLink => 'No Se Puede Abrir Enlace';

  @override
  String get financeKycFailedToOpenLink =>
      'Error al abrir enlace de verificación';

  @override
  String get financeKycTosAcceptedSuccess =>
      'Términos de servicio aceptados exitosamente';

  @override
  String get exit => 'salida';

  @override
  String get doYouWantToExitTheApp => '¿Quieres salir de la app?';

  @override
  String get newChatRequests => 'Nuevas solicitudes de chat';

  @override
  String get changeLanguageTitle => 'Cambiar idioma';

  @override
  String get selectLanguage => 'Seleccionar idioma';

  @override
  String get messageQuestionWillBeAvailable =>
      '¡La pregunta del mensaje estará disponible pronto!';

  @override
  String get enter4DigitPin => 'Ingresa tu PIN de 4 dígitos';

  @override
  String get createPinCode => 'Crea tu código PIN';

  @override
  String get welcomeTo => 'Bienvenido a';

  @override
  String get enjoyFullExperience =>
      'Disfruta de la experiencia completa que BMP te ofrece';

  @override
  String get signUpForAccount => 'Registrarse para una Cuenta';

  @override
  String get enterYourPhoneNumber => 'Ingresa Tu Número de Teléfono';

  @override
  String get verificationSMSMessage =>
      'Te enviaremos un código de verificación por SMS. Pueden aplicarse tarifas estándar de mensajería.';

  @override
  String get phoneNumber => 'Número de Teléfono';

  @override
  String get loginOnboardingNote =>
      '• Los usuarios que ya tienen una cuenta con correo electrónico deben iniciar sesión primero con su correo y luego vincular su número de teléfono.\n\n• Los nuevos usuarios deben registrarse directamente usando su número de teléfono';

  @override
  String get note => 'Nota';

  @override
  String get enterEmailOrUsernameToContinue =>
      'Ingresa tu correo o usuario y contraseña para continuar';

  @override
  String get securityUpdateRequired => 'Actualización de seguridad requerida';

  @override
  String get linkPhoneToSecureAccount =>
      'Vincula tu número de teléfono para proteger tu cuenta y continuar.';

  @override
  String get ageRestrictionMessage =>
      'Al crear una cuenta, confirmas que tienes al menos 18 años.';

  @override
  String get enterPhoneNumberError => 'Por favor ingresa un número de teléfono';

  @override
  String get pinSetSuccessfully => '¡PIN configurado correctamente!';

  @override
  String get selectCountry => 'Selecciona tu país';

  @override
  String get searchYourCountry => 'Busca tu país';

  @override
  String get groupChats => 'Chats de grupo';

  @override
  String get myQR => 'Mi QR';

  @override
  String get tapToStartConversation => 'Toca para iniciar la conversación';

  @override
  String get changeProfilePicture => 'Cambiar foto de perfil';

  @override
  String get displayName => 'Nombre para mostrar';

  @override
  String get editContact => 'Editar contacto';

  @override
  String get pleaseEnterYourPhoneNumber =>
      'Por favor ingresa tu número de teléfono';

  @override
  String get otpSentSuccessfully => 'OTP enviado exitosamente';

  @override
  String get otpSendFailed => 'Error al enviar OTP';

  @override
  String get otpVerifiedSuccessfully => 'OTP verificado exitosamente';

  @override
  String get sessionIdIsMissing => 'Falta el ID de sesión';

  @override
  String get verificationSuccessful => 'Verificación exitosa';

  @override
  String get pleaseEnterPhoneNumber =>
      'Por favor ingrese el número de teléfono';

  @override
  String phoneNumberMustBeDigits(int requiredLength) {
    return 'El número de teléfono debe tener al menos $requiredLength dígitos';
  }

  @override
  String phoneNumberCannotExceedDigits(Object requiredLength) {
    return 'El número de teléfono no puede exceder $requiredLength dígitos';
  }

  @override
  String get phoneNumberMustContainOnlyDigits =>
      'El número de teléfono debe contener solo dígitos';

  @override
  String get ibanNumber => 'Número IBAN';

  @override
  String get bicSwift => 'BIC / SWIFT';

  @override
  String get encryptionSetupTitle => 'Se requiere configuración de cifrado';

  @override
  String get encryptionSetupMessage =>
      'El cifrado de su dispositivo no está configurado correctamente. Esto es necesario para la mensajería segura.\n\n¿Desea completar la configuración del cifrado ahora?';

  @override
  String get encryptionSetupOk => 'Completar configuración';

  @override
  String get encryptionDisableNotAllowed =>
      'No puede desactivar el cifrado en una sala. Si desea desactivar el cifrado, cree una nueva sala sin cifrado.';

  @override
  String get publicRoomEncryptionNotAllowed =>
      'Las salas públicas no pueden estar cifradas.';

  @override
  String get encryptionPermissionDenied =>
      'No tiene permiso para cambiar esto.';

  @override
  String get encryptionSetupCompleted =>
      '¡La configuración del cifrado se completó correctamente! Ahora puede habilitar el cifrado.';

  @override
  String enableEncryptionFailed(Object error) {
    return 'No se pudo habilitar el cifrado: $error';
  }

  @override
  String completeEncryptionSetupFailed(Object error) {
    return 'No se pudo completar la configuración del cifrado: $error. Inténtelo de nuevo o contacte al soporte.';
  }

  @override
  String get encryptionIrreversibleWarning =>
      '¡Habilitar el cifrado en esta sala es irreversible! ¿Está seguro?';

  @override
  String get encryptionEnabledSuccess =>
      '¡El cifrado se habilitó correctamente!';

  @override
  String get encryptionError => 'Error de cifrado';

  @override
  String get encryptionSetupFailedTitle => 'Falló la configuración del cifrado';

  @override
  String get noTransactionHistoryAvailable =>
      'No hay historial de transacciones disponible';

  @override
  String get approved => 'Aprobado';

  @override
  String get active => 'Activo';

  @override
  String get rejected => 'Rechazado';

  @override
  String get pending => 'Pendiente';

  @override
  String get under_review => 'En revisión';

  @override
  String get incomplete => 'Incompleto';

  @override
  String get not_started => 'No iniciado';

  @override
  String get awaiting_questionnaire => 'En espera del cuestionario';

  @override
  String get awaiting_ubo => 'En espera de UBO';

  @override
  String get paused => 'Pausado';

  @override
  String get offboarded => 'Dado de baja';

  @override
  String get virtual => 'Virtual';

  @override
  String get physical => 'Físico';

  @override
  String get selectCardType => 'Seleccionar Tipo de Tarjeta';

  @override
  String get chooseVirtualAccountType =>
      'Elija el tipo de cuenta virtual que desea crear';

  @override
  String get noStoriesToShow => 'No hay historias para mostrar';

  @override
  String get noExternalAccountsAvailable =>
      'No hay cuentas externas disponibles';

  @override
  String get editAddress => 'Editar dirección';

  @override
  String get inactive => 'Inactivo';

  @override
  String get activated => 'Activado';

  @override
  String get editAccount => 'Editar cuenta';

  @override
  String get networkConnectionFailed =>
      'Falló la conexión de red. Asegúrate de estar conectado a internet.';

  @override
  String get networkErrorTitle => 'Error de red';

  @override
  String get maxTwoVideos => 'Solo puedes seleccionar hasta 2 videos';

  @override
  String get maxEightImages => 'Solo puedes seleccionar hasta 8 imágenes';

  @override
  String get createChannel => 'Crear canal';

  @override
  String get channelCreatedSuccess => 'El canal se ha creado correctamente';

  @override
  String get channelCreatedFailed => 'Error al crear el canal';

  @override
  String get channelNameEmpty => 'El nombre del canal no puede estar vacío';

  @override
  String get channelNameExists => 'El nombre del canal ya existe en este grupo';

  @override
  String get enterChannelName => 'Ingresa el nombre del canal';

  @override
  String get createGroupChannel => 'Crear canal de grupo';

  @override
  String get initiateKycProcess => 'Iniciar Proceso KYC';

  @override
  String get acceptTermsAndConditions => 'Aceptar Términos y Condiciones';

  @override
  String get setTransactionPin => 'Establecer PIN de Transacción';

  @override
  String get createFourDigitPin =>
      'Crea un PIN de 4 dígitos para transacciones';

  @override
  String loadLiquidationAddressFailed(Object error) {
    return 'Error al cargar los detalles de la dirección de liquidación: $error';
  }

  @override
  String get invalidExternalAccountAddress =>
      'La dirección de esta cuenta externa no es válida';

  @override
  String get customerIdCheck => 'Verificación de ID del cliente';

  @override
  String get customerIdNotFound =>
      'ID del cliente no encontrado. Intenta nuevamente.';

  @override
  String get enterPin => 'Ingresar PIN';

  @override
  String get enterFourDigitPin =>
      'Ingresa tu PIN de 4 dígitos para crear la dirección de liquidación';

  @override
  String get liquidationAddressPayload =>
      'Datos de la dirección de liquidación';

  @override
  String get failedToCreateLiquidationAddress =>
      'No se pudo crear la dirección de liquidación';

  @override
  String get liquidationCreationFailed => 'Falló la creación de la liquidación';

  @override
  String networkErrorWithMessage(Object error) {
    return 'Error de red: $error';
  }

  @override
  String createLiquidationAddressFailedWithMessage(Object error) {
    return 'Error al crear la dirección de liquidación: $error';
  }

  @override
  String get completeRequiredFields =>
      'Por favor completa todos los campos obligatorios:';

  @override
  String get noRecentTransactions => 'Aún no hay transacciones recientes';

  @override
  String wrongPinEnteredWithCooldown(int seconds) {
    return 'PIN incorrecto. Intenta de nuevo en $seconds segundos.';
  }

  @override
  String get pinsDoNotMatch => 'Los PIN no coinciden';

  @override
  String get reEnter4DigitPin => 'Vuelve a ingresar tu PIN de 4 dígitos';

  @override
  String get enterPinToUnlock => 'Ingresa tu PIN para desbloquear';

  @override
  String get enterCurrentPinToChange => 'Ingresa el PIN actual para cambiarlo';

  @override
  String get dialerConnecting => 'Conectando...';

  @override
  String get dialerReconnecting => 'Reconectando...';

  @override
  String get dialerReconnectingMessage =>
      'Por favor espera mientras restauramos la conexión';

  @override
  String get dialerRinging => 'Sonando...';

  @override
  String get dialerCalling => 'Llamando...';

  @override
  String get dialerVideoCalling => 'Videollamada...';

  @override
  String get dialerIncomingVoiceCall => 'Llamada de voz entrante...';

  @override
  String get dialerIncomingVideoCall => 'Videollamada entrante...';

  @override
  String get dialerIncomingCall => 'Llamada entrante';

  @override
  String get dialerMuted => 'Silenciado';

  @override
  String get dialerUnknown => 'Desconocido';

  @override
  String get networkQualityExcellent => 'Excelente';

  @override
  String get networkQualityGood => 'Bueno';

  @override
  String get networkQualityFair => 'Regular';

  @override
  String get networkQualityPoor => 'Malo';

  @override
  String get networkQualityDisconnected => 'Desconectado';

  @override
  String get videoQuality => 'Calidad de video';

  @override
  String get uploadSpeedLabel => 'Subida';

  @override
  String get downloadSpeedLabel => 'Bajada';

  @override
  String get outgoingCalls => 'Llamadas salientes';

  @override
  String get outgoing => 'Saliente';

  @override
  String durationMinutes(int minutes) {
    return '$minutes min';
  }

  @override
  String get subscriptionActivating =>
      'Tu suscripción se está activando. Esto puede tardar unos momentos.';

  @override
  String get subscriptionPaymentPending =>
      'Pago pendiente. Por favor completa tu pago para activar la suscripción.';

  @override
  String get subscriptionPaymentFailed =>
      'El pago falló. Por favor actualiza tu método de pago.';

  @override
  String get completeYourProfile => 'Completa tu perfil';

  @override
  String get provideDetailsToContinu =>
      'Por favor proporciona tus datos para continuar';

  @override
  String get enterValidEmail => 'Ingresa un correo válido';

  @override
  String get enterYourName => 'Ingresa tu nombre';

  @override
  String get nameIsRequired => 'El nombre es obligatorio';

  @override
  String get phoneOptional => 'Teléfono (Opcional)';

  @override
  String get phone => 'Teléfono';

  @override
  String get enterPhoneNumber => 'Ingresa número de teléfono';

  @override
  String get continueBtn => 'Continuar';

  @override
  String get noPricingPlansAvailable => 'No hay planes de precios disponibles';

  @override
  String get failedToLoadPricingPlans => 'Error al cargar planes de precios';

  @override
  String unlockFeature(String feature) {
    return 'Desbloquear $feature';
  }

  @override
  String subscribeToUnlock(String feature) {
    return 'Suscríbete para desbloquear $feature y todas las demás funciones premium.';
  }

  @override
  String get subscribeNow => 'Suscribirse ahora';

  @override
  String get cancelAnyTimeRecurringBilling =>
      'Cancela en cualquier momento. Facturación recurrente.';

  @override
  String get actions => 'Acciones';

  @override
  String get cancelSubscription => 'Cancelar suscripción';

  @override
  String get cancelSubscriptionSubtitle =>
      'Mantendrás el acceso hasta el final de tu período de facturación';

  @override
  String get reactivateSubscription => 'Reactivar suscripción';

  @override
  String get reactivateSubscriptionSubtitle =>
      'Cancela la cancelación programada y mantén tu suscripción';

  @override
  String get subscribeToPremium => 'Suscribirse a Premium';

  @override
  String get unlockPremiumFeatures => 'Desbloquea todas las funciones premium';

  @override
  String get noActiveSubscriptionToCancel =>
      'No se encontró ninguna suscripción activa para cancelar';

  @override
  String get subscriptionCancelledAtPeriodEnd =>
      'Tu suscripción se cancelará al final de tu período de facturación.';

  @override
  String get subscriptionCancelled => 'Tu suscripción ha sido cancelada.';

  @override
  String get failedToCancelSubscription => 'Error al cancelar la suscripción';

  @override
  String get noSubscriptionToReactivate =>
      'No se encontró ninguna suscripción para reactivar';

  @override
  String get subscriptionReactivated => '¡Tu suscripción ha sido reactivada!';

  @override
  String get failedToReactivateSubscription =>
      'Error al reactivar la suscripción';

  @override
  String get cancelSubscriptionQuestion => '¿Cancelar suscripción?';

  @override
  String subscriptionWillEndOn(String date) {
    return 'Tu suscripción terminará el $date. Tendrás acceso a las funciones premium hasta entonces. Después de eso, perderás el acceso a las funciones premium.';
  }

  @override
  String get keepSubscription => 'Mantener suscripción';

  @override
  String get subscriptionWillContinue =>
      'Tu suscripción continuará normalmente. No habrá cargos adicionales hasta tu próximo ciclo de facturación.';

  @override
  String get keepCancelled => 'Mantener cancelada';

  @override
  String get reactivate => 'Reactivar';

  @override
  String get premiumPlan => 'Plan Premium';

  @override
  String get cancelledOn => 'Cancelada el';

  @override
  String get accessEndsOn => 'El acceso termina el';

  @override
  String get nextBillingDate => 'Próxima fecha de facturación';

  @override
  String get subscriptionStatusCancelling => 'Cancelando';

  @override
  String get subscriptionStatusActive => 'Activa';

  @override
  String get subscriptionStatusTrial => 'Prueba';

  @override
  String get subscriptionStatusCancelled => 'Cancelada';

  @override
  String get subscriptionStatusExpired => 'Expirada';

  @override
  String get subscriptionStatusPaymentPending => 'Pago pendiente';

  @override
  String get subscriptionStatusPaymentOverdue => 'Pago vencido';

  @override
  String get subscriptionStatusNone => 'Sin suscripción';

  @override
  String subscriptionDescCancelling(int days) {
    return 'Tu suscripción está programada para cancelarse. Aún tienes acceso por $days días más. Puedes reactivarla en cualquier momento antes de que termine.';
  }

  @override
  String get subscriptionDescActive =>
      'Tienes acceso completo a todas las funciones premium. ¡Disfruta tu suscripción!';

  @override
  String get subscriptionDescTrial =>
      'Actualmente estás en una prueba gratuita. Suscríbete a premium para desbloquear todas las funciones.';

  @override
  String get subscriptionDescCancelled =>
      'Cancelaste tu suscripción. Tu suscripción anterior ha terminado. Suscríbete de nuevo para recuperar el acceso a las funciones premium.';

  @override
  String get subscriptionDescExpired =>
      'Tu suscripción ha expirado debido a un problema de pago. Por favor suscríbete de nuevo con un método de pago actualizado para continuar disfrutando de las funciones premium.';

  @override
  String get subscriptionDescIncomplete =>
      'Tu pago está siendo procesado. Por favor espera la confirmación, o intenta suscribirte de nuevo.';

  @override
  String get subscriptionDescPastDue =>
      'Tu pago está vencido. Por favor actualiza tu método de pago inmediatamente para evitar perder el acceso a las funciones premium.';

  @override
  String get subscriptionDescDefault =>
      'Suscríbete para desbloquear funciones premium y aprovechar al máximo tu experiencia.';

  @override
  String get failedToInitiateRegistration => 'Error al iniciar el registro';

  @override
  String get paymentFailed => 'El pago falló';

  @override
  String get supportPageTitle => 'Enviar ticket de soporte';

  @override
  String get supportPageSubtitle =>
      'Cuéntanos sobre el problema que estás enfrentando.';

  @override
  String get supportSubjectLabel => 'Asunto';

  @override
  String get supportDescriptionLabel => 'Descripción';

  @override
  String get supportSubjectHint =>
      'Ingresa el asunto (ej.: Problemas para iniciar sesión, Problema de pago, etc.)';

  @override
  String get supportDescriptionHint => 'Ingresa la descripción aquí...';

  @override
  String get logInToYourAccount => 'Inicia sesión en tu cuenta';

  @override
  String get missedCalls => 'Llamadas perdidas';

  @override
  String get selectAtLeastOneMember =>
      'Selecciona al menos un miembro para crear un grupo';

  @override
  String get chatSupportComingSoon =>
      'El soporte por chat estará disponible pronto';

  @override
  String get selectStartDate => 'Seleccionar fecha de inicio';

  @override
  String get selectEndDate => 'Seleccionar fecha de fin';

  @override
  String get recentContacts => 'Contactos recientes';

  @override
  String get sortZA => 'Ordenar de Z a A';

  @override
  String get sortAZ => 'Ordenar de A a Z';

  @override
  String get selectYourCardType => 'Selecciona tu tipo de tarjeta';

  @override
  String get selectCards => 'Seleccionar tarjetas';

  @override
  String get confirmCardSelection => 'Confirmar selección de tarjeta';

  @override
  String get reviewYourSelection => 'Revisa tu selección';

  @override
  String get mastercard => 'Mastercard';

  @override
  String get mastercardDescription =>
      'Una red de pagos global aceptada en todo el mundo, con transacciones rápidas y seguras y amplia aceptación en comercios.';

  @override
  String get visa => 'Visa';

  @override
  String get visaDescription =>
      'Una red global de pagos digitales que permite realizar pagos con tarjeta de forma rápida, segura y confiable en casi cualquier lugar.';

  @override
  String get selectVisaType => 'Seleccionar tipo de Visa';

  @override
  String get selectMastercardType => 'Seleccionar tipo de Mastercard';

  @override
  String get selectCardTypeForNewCard =>
      'Selecciona el tipo de tarjeta para tu nueva tarjeta';

  @override
  String get noCardTypesAvailable => 'No hay tipos de tarjeta disponibles';

  @override
  String get allCardTypesAlreadyCreated =>
      'Ya has creado todas las tarjetas disponibles de este tipo';

  @override
  String get errorCheckingKycStatus => 'Error al revisar el estado de KYC';

  @override
  String get financePayCryptoAccountRequired =>
      'Se requiere una cuenta de PayCrypto';

  @override
  String get pleaseEnter6DigitCode => 'Ingresa el código de 6 dígitos';

  @override
  String get cameraAccessDenied =>
      'Acceso a la cámara denegado. Por favor, activa el permiso de cámara en la configuración.';

  @override
  String get pinChangedSuccessfully => '¡PIN cambiado correctamente!';

  @override
  String get notAValidQrCode => 'Código QR no válido';

  @override
  String get errorScanningImage => 'Error al escanear la imagen';

  @override
  String get cardSetAsDefault =>
      'Esta tarjeta ahora es tu tarjeta predeterminada';

  @override
  String get failedToSetDefaultCard =>
      'No se pudo configurar la tarjeta predeterminada.';

  @override
  String get allContacts => 'Todos los contactos';

  @override
  String get outgoingCall => 'Llamada saliente';

  @override
  String get makeDefaultCard => 'Configurar como tarjeta predeterminada';

  @override
  String get enterPinToViewBalance => 'Ingresa tu PIN para ver el saldo';

  @override
  String get verifyPin => 'Verificar PIN';

  @override
  String get unlockPremiumAccess => 'Desbloquear acceso premium';

  @override
  String get subscribeToAccessAllFeatures =>
      'Suscríbete ahora para acceder a todas las funciones sin límites.';

  @override
  String get monthly => 'Mensual';

  @override
  String get supportDescriptionTooShort => 'La descripción es demasiado corta';

  @override
  String get supportDescriptionMinLength =>
      'La descripción debe tener al menos 20 caracteres';

  @override
  String get paymentsSecurelyProcessedBy =>
      'Pagos procesados de forma segura por';

  @override
  String get sessionExpired => 'Sesión expirada';

  @override
  String get sessionExpiredMessage =>
      'Tu sesión ha expirado o ya no es válida. Se cerrará la sesión por seguridad.';

  @override
  String get activeCards => 'Tarjetas activas';

  @override
  String get inactiveCards => 'Tarjetas inactivas';

  @override
  String get freezeCards => 'Congelar tarjetas';

  @override
  String depositInstructionSendOnly(Object currency, Object chain) {
    return 'Envía solo $currency en $chain a esta dirección';
  }

  @override
  String get depositInstructionProcessingTime =>
      'Tiempo de procesamiento: 2–15 minutos según la blockchain';

  @override
  String get depositInstructionMinimum =>
      'Depósito mínimo: equivalente a \$10 USD';

  @override
  String get depositInstructionAutoLoad =>
      'Tu tarjeta se cargará automáticamente';

  @override
  String get depositInstructionPushNotification =>
      'Recibirás una notificación cuando se complete';

  @override
  String get shareQr => 'Compartir QR';

  @override
  String get copyQr => 'Copiar QR';

  @override
  String get importantInformation => 'Información importante';

  @override
  String get errorLoadingAddress => 'Error al cargar la dirección';

  @override
  String get deposit => 'Depósito';

  @override
  String get copiedTitle => '¡Copiado!';

  @override
  String get addressCopiedMessage => 'Dirección copiada al portapapeles';

  @override
  String get selectBlockchain => 'Seleccionar blockchain';

  @override
  String get noChainsAvailableTitle => 'No hay redes disponibles';

  @override
  String get noChainsAvailableMessage =>
      'No se encontraron redes compatibles para tu cuenta';

  @override
  String get processing => 'Procesando...';

  @override
  String get noCardInformationAvailable =>
      'No hay información de la tarjeta disponible';

  @override
  String get cardDetailsTitle => 'Detalles de la tarjeta';

  @override
  String get seeYourCardInfo => 'Ver la información de tu tarjeta';

  @override
  String get securityTipDoNotSharePin =>
      'No compartas tu PIN ni los datos de tu tarjeta.';

  @override
  String get securityTipShopSecureSites =>
      'Compra solo en sitios seguros (https).';

  @override
  String get securityTipEnableAlerts =>
      'Activa las alertas y el bloqueo desde la app.';

  @override
  String get securityTipCheckTransactions =>
      'Revisa tus transacciones regularmente.';

  @override
  String get onlyAdminsCanEditGroup =>
      'Solo los administradores pueden editar el nombre y el ícono del grupo';

  @override
  String get profileUpdatedSuccessfully => 'Perfil actualizado correctamente';

  @override
  String get groupEditPermissionDenied =>
      'No tienes permiso para editar este grupo. Solo los administradores pueden editar los detalles del grupo.';

  @override
  String get insufficientGroupPermissions =>
      'Permisos insuficientes. Solo los administradores pueden editar los detalles del grupo.';

  @override
  String get failedToUpdateProfile => 'Error al actualizar el perfil';

  @override
  String get unableToDetermineEmail =>
      'No se pudo determinar tu correo electrónico. Inténtalo de nuevo.';

  @override
  String get transferInitiated => 'Transferencia iniciada';

  @override
  String get transferInitiatedSuccess =>
      '¡Tu transferencia ha sido iniciada con éxito!';

  @override
  String get invitationSent => 'Invitación enviada';

  @override
  String get invitationSentTo => 'Invitación enviada a';

  @override
  String get inviteFailed => 'Error al enviar la invitación';

  @override
  String get failedToSendInvitation => 'No se pudo enviar la invitación';

  @override
  String get inviteToBMP => 'Invitar a BMP';

  @override
  String inviteDescription(Object email) {
    return 'Envía una invitación a $email para unirse a BMP y recibir pagos en USDC';
  }

  @override
  String get sendInvite => 'Enviar invitación';

  @override
  String get sendMoney => 'Enviar dinero';

  @override
  String get transferUsdcViaEmail => 'Transferir USDC por correo electrónico';

  @override
  String get from => 'Desde';

  @override
  String get recipientEmail => 'Correo del destinatario';

  @override
  String get enterRecipientEmail =>
      'Por favor, ingresa el correo del destinatario';

  @override
  String get validRecipientEmail => 'Por favor, ingresa un correo válido';

  @override
  String get cannotSendToYourself => 'No puedes enviarte dinero a ti mismo';

  @override
  String get enterAmount => 'Por favor, ingresa una cantidad';

  @override
  String get validAmount => 'Por favor, ingresa una cantidad válida mayor a 0';

  @override
  String get insufficientBalance =>
      'No tienes suficiente saldo. Recarga tu billetera.';

  @override
  String get recipientNotOnBMP => 'El destinatario aún no está en BMP.';

  @override
  String get recipientNeedsWallet =>
      'El destinatario necesita configurar su billetera.';

  @override
  String incorrectPinAttempts(Object attempts) {
    return 'PIN incorrecto. Quedan $attempts intentos.';
  }

  @override
  String get tooManyAttempts =>
      'Demasiados intentos. Inténtalo de nuevo en 1 hora.';

  @override
  String get accountBlocked =>
      'Tu cuenta está bloqueada. Contacta con soporte.';

  @override
  String get createWalletToProceed =>
      'Crea una billetera para continuar con los pagos';

  @override
  String get selectSourceWallet =>
      'Por favor, selecciona una billetera de origen.';

  @override
  String get selectDestinationWallet =>
      'Por favor, selecciona una billetera de destino.';

  @override
  String get shareFailed => 'Error al compartir';

  @override
  String get failedToOpenShareDialog =>
      'No se pudo abrir el diálogo de compartir';

  @override
  String get reviewAndConfirmTransfer => 'Revisa y confirma tu transferencia';

  @override
  String get transferSummary => 'Resumen de la transferencia';

  @override
  String get destinationWallet => 'Billetera de destino';

  @override
  String get paymentProcessed =>
      'Pago procesado con éxito. Recibirás un correo de confirmación en breve.';

  @override
  String get phoneNumberAlreadyInUse =>
      'El número de teléfono ya existe. Por favor, usa un número diferente.';

  @override
  String get phoneNumberNotFound =>
      'Número de teléfono no encontrado. Por favor, verifique su número o regístrese primero.';

  @override
  String get linkEmailTitle => 'Vincular correo electrónico';

  @override
  String get linkEmailSubtitle =>
      'Por favor, ingresa una dirección de correo electrónico para vincular a tu cuenta para mayor seguridad.';

  @override
  String get emailHint => 'Correo electrónico';

  @override
  String get enterOtpEmail => 'Ingresa el código OTP enviado al correo';

  @override
  String get enterOtpSms => 'Ingresa el código OTP enviado por SMS';
}
