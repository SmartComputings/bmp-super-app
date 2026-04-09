// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class L10nZh extends L10n {
  L10nZh([String locale = 'zh']) : super(locale);

  @override
  String get alwaysUse24HourFormat => 'false';

  @override
  String get repeatPassword => '重复输入密码';

  @override
  String get notAnImage => '不是图像文件。';

  @override
  String get setCustomPermissionLevel => '设置自定义权限等级';

  @override
  String get setPermissionsLevelDescription =>
      '请在下方选择预定义的角色或输入 0 到 100 间的自定义权限等级。';

  @override
  String get ignoreUser => '忽略用户';

  @override
  String get normalUser => '正常用户';

  @override
  String get remove => '移除';

  @override
  String get importNow => '立即导入';

  @override
  String get importEmojis => '导入表情包';

  @override
  String get importFromZipFile => '从 .zip 文件导入';

  @override
  String get exportEmotePack => '以 .zip 格式导出表情包';

  @override
  String get replace => '替换';

  @override
  String get about => '关于';

  @override
  String aboutHomeserver(String homeserver) {
    return '关于 $homeserver';
  }

  @override
  String get accept => '接受';

  @override
  String acceptedTheInvitation(String username) {
    return '👍 $username 接受了邀请';
  }

  @override
  String get account => '账户';

  @override
  String activatedEndToEndEncryption(String username) {
    return '🔐 $username 激活了端到端加密';
  }

  @override
  String get addEmail => '添加电子邮件';

  @override
  String get confirmMatrixId => '请确认你的 Matrix ID 以删除账户。';

  @override
  String supposedMxid(String mxid) {
    return '应为 $mxid';
  }

  @override
  String get addChatDescription => '添加聊天说明…';

  @override
  String get addToSpace => '添加到空间';

  @override
  String get admin => '管理员';

  @override
  String get alias => '别名';

  @override
  String get all => '全部';

  @override
  String get allChats => '所有聊天';

  @override
  String get commandHint_roomupgrade => '将此聊天室升级到给定的聊天室版本';

  @override
  String get commandHint_googly => '发送“大眼”表情';

  @override
  String get commandHint_cuddle => '发送“搂抱”';

  @override
  String get commandHint_hug => '发送“拥抱”';

  @override
  String googlyEyesContent(String senderName) {
    return '$senderName 向你发送了“大眼”表情';
  }

  @override
  String cuddleContent(String senderName) {
    return '$senderName 搂抱了你';
  }

  @override
  String hugContent(String senderName) {
    return '$senderName 拥抱了你';
  }

  @override
  String answeredTheCall(String senderName) {
    return '$senderName 接听了通话';
  }

  @override
  String get anyoneCanJoin => '任何人都可以加入';

  @override
  String get appLock => '应用锁';

  @override
  String get appLockDescription => '用 pin 码在不用 FluffyChat 时锁定它';

  @override
  String get archive => '存档';

  @override
  String get unArchive => 'Unarchive';

  @override
  String get areGuestsAllowedToJoin => '是否允许访客加入';

  @override
  String get areYouSure => '你确定吗？';

  @override
  String get areYouSureYouWantToLogout => '你确定要注销吗？';

  @override
  String get askSSSSSign => '请输入你的安全存储的密码短语或恢复密钥，以向对方签名。';

  @override
  String askVerificationRequest(String username) {
    return '是否接受来自 $username 的验证请求？';
  }

  @override
  String get autoplayImages => '自动播放动态贴纸和表情';

  @override
  String badServerLoginTypesException(String serverVersions,
      String supportedVersions, Object suportedVersions) {
    return '主服务器支持的登录方式：\n$serverVersions\n但此应用仅支持：\n$supportedVersions';
  }

  @override
  String get sendTypingNotifications => '发送正在输入通知';

  @override
  String get swipeRightToLeftToReply => '从右向左滑动进行回复';

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
  String get sendOnEnter => '按 Enter 键发送';

  @override
  String badServerVersionsException(
      String serverVersions,
      String supportedVersions,
      Object serverVerions,
      Object supoortedVersions,
      Object suportedVersions) {
    return '主服务器支持的 Spec 版本：\n$serverVersions\n但此应用仅支持 $supportedVersions 版本';
  }

  @override
  String countChatsAndCountParticipants(int chats, int participants) {
    return '$chats 个聊天和 $participants 名参与者';
  }

  @override
  String countMembers(int count) {
    return '$count Members';
  }

  @override
  String get noMoreChatsFound => '找不到更多聊天…';

  @override
  String get noChatsFoundHere => '此处尚未找到聊天。使用下方按钮 ⤵️ 开始和某人的新聊天';

  @override
  String get joinedChats => '已加入的聊天';

  @override
  String get unread => '未读';

  @override
  String get space => '空间';

  @override
  String get spaces => '空间';

  @override
  String get banFromChat => '从聊天中封禁';

  @override
  String get banned => '已封禁';

  @override
  String bannedUser(String username, String targetName) {
    return '$username 封禁了 $targetName';
  }

  @override
  String get blockDevice => '屏蔽设备';

  @override
  String get blocked => '已屏蔽';

  @override
  String get botMessages => '机器人消息';

  @override
  String get cancel => '取消';

  @override
  String cantOpenUri(String uri) {
    return '无法打开 URI $uri';
  }

  @override
  String get changeDeviceName => '更改设备名称';

  @override
  String changedTheChatAvatar(String username) {
    return '$username 更改了聊天头像';
  }

  @override
  String changedTheChatDescriptionTo(String username, String description) {
    return '$username 将聊天描述更改为：\'$description\'';
  }

  @override
  String changedTheChatNameTo(String username, String chatname) {
    return '$username 将聊天名称更改为：\'$chatname\'';
  }

  @override
  String changedTheChatPermissions(String username) {
    return '$username 更改了聊天权限';
  }

  @override
  String changedTheDisplaynameTo(String username, String displayname) {
    return '$username 将昵称更改为：\'$displayname\'';
  }

  @override
  String changedTheGuestAccessRules(String username) {
    return '$username 更改了访客访问规则';
  }

  @override
  String changedTheGuestAccessRulesTo(String username, String rules) {
    return '$username 更改了访客访问规则为：$rules';
  }

  @override
  String changedTheHistoryVisibility(String username) {
    return '$username 更改了历史记录可见性';
  }

  @override
  String changedTheHistoryVisibilityTo(String username, String rules) {
    return '$username 更改了历史记录可见性为：$rules';
  }

  @override
  String changedTheJoinRules(String username) {
    return '$username 更改了加入的规则';
  }

  @override
  String changedTheJoinRulesTo(String username, String joinRules) {
    return '$username 更改了加入的规则为：$joinRules';
  }

  @override
  String changedTheProfileAvatar(String username) {
    return '$username 更改了头像';
  }

  @override
  String changedTheRoomAliases(String username) {
    return '$username 更改了聊天室别名';
  }

  @override
  String changedTheRoomInvitationLink(String username) {
    return '$username 更改了邀请链接';
  }

  @override
  String get changePassword => '更改密码';

  @override
  String get changeTheHomeserver => '更改主服务器';

  @override
  String get changeTheme => '改变风格';

  @override
  String get changeTheNameOfTheGroup => '更改群组名称';

  @override
  String get changeYourAvatar => '更改你的头像';

  @override
  String get channelCorruptedDecryptError => '加密已被破坏';

  @override
  String get chat => '聊天';

  @override
  String get yourChatBackupHasBeenSetUp => '你的聊天记录备份已设置。';

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
  String get chatDescription => '聊天描述';

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
  String get tryAgain => '重试';

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
  String get search => '搜索';

  @override
  String get select => '选择';

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
  String get logout => '注销';

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
  String get group => '群组';

  @override
  String get calls => '通话';

  @override
  String get done => 'Done!';

  @override
  String get taskCompletedSuccessfully => 'Task is completed\nsuccessfully';

  @override
  String get goBack => 'Go Back';

  @override
  String get signupSuccessMessage => 'You\'ve signed up \nsuccessfully';

  @override
  String get chatBackup => '聊天记录备份';

  @override
  String get chatBackupDescription => '你的旧消息受恢复密钥保护。请确保你不会丢失它。';

  @override
  String get chatDetails => '聊天详情';

  @override
  String get chatHasBeenAddedToThisSpace => '聊天已添加到此空间';

  @override
  String get chats => '聊天';

  @override
  String get chooseAStrongPassword => '输入一个强密码';

  @override
  String get clearArchive => '清除存档';

  @override
  String get close => '关闭';

  @override
  String get commandHint_markasdm => '将给定的 Matrix ID 标为私信聊天室';

  @override
  String get commandHint_markasgroup => '标记为群组';

  @override
  String get commandHint_ban => '在此聊天室封禁指定用户';

  @override
  String get commandHint_clearcache => '清除缓存';

  @override
  String get commandHint_create => '创建空的群聊\n使用 --no-encryption 选项来禁用加密';

  @override
  String get commandHint_discardsession => '丢弃会话';

  @override
  String get commandHint_dm => '创建私聊\n使用 --no-encryption 选项来禁用加密';

  @override
  String get commandHint_html => '发送 HTML 格式化文本';

  @override
  String get commandHint_invite => '邀请指定用户加入此聊天室';

  @override
  String get commandHint_join => '加入指定聊天室';

  @override
  String get commandHint_kick => '在此聊天室移除指定用户';

  @override
  String get commandHint_leave => '退出此聊天室';

  @override
  String get commandHint_me => '介绍自己';

  @override
  String get commandHint_myroomavatar => '设置你在此聊天室的头像（通过 mxc-uri）';

  @override
  String get commandHint_myroomnick => '设置你在此聊天室的昵称';

  @override
  String get commandHint_op => '设置指定用户的权限等级（默认：50）';

  @override
  String get commandHint_plain => '发送纯文本';

  @override
  String get commandHint_react => '将回复作为回应发送';

  @override
  String get commandHint_send => '发送文本';

  @override
  String get commandHint_unban => '在此聊天室解封指定用户';

  @override
  String get commandInvalid => '指令无效';

  @override
  String commandMissing(String command) {
    return '$command 不是指令。';
  }

  @override
  String get compareEmojiMatch => '请比较表情符号';

  @override
  String get compareNumbersMatch => '请比较以下数字';

  @override
  String get configureChat => '配置聊天';

  @override
  String get confirm => '确认';

  @override
  String get connect => '连接';

  @override
  String get contactHasBeenInvitedToTheGroup => '联系人已被邀请至群组';

  @override
  String get containsDisplayName => '包含昵称';

  @override
  String get containsUserName => '包含用户名';

  @override
  String get contentHasBeenReported => '此内容已被报告至服务器管理员处';

  @override
  String get copiedToClipboard => '已复制到剪贴板';

  @override
  String get copy => '复制';

  @override
  String get copyToClipboard => '复制到剪贴板';

  @override
  String couldNotDecryptMessage(String error) {
    return '不能解密消息: $error';
  }

  @override
  String get checkList => '清单';

  @override
  String countParticipants(int count) {
    return '$count 名参与者';
  }

  @override
  String countInvited(int count) {
    return '邀请了 $count';
  }

  @override
  String get create => '创建';

  @override
  String createdTheChat(String username) {
    return '💬 $username 创建了聊天';
  }

  @override
  String get createGroup => '创建群组';

  @override
  String get createNewSpace => '创建新空间';

  @override
  String get currentlyActive => '目前活跃';

  @override
  String get darkTheme => '深色';

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
  String get deactivateAccountWarning => '这将停用你的用户账户。这不能被撤销！你确定吗？';

  @override
  String get defaultPermissionLevel => '新用户默认权限级别';

  @override
  String get delete => '删除';

  @override
  String get deleteAccount => '删除账户';

  @override
  String get deleteMessage => '删除消息';

  @override
  String get device => '设备';

  @override
  String get deviceId => '设备 ID';

  @override
  String get devices => '设备';

  @override
  String get directChats => '私聊';

  @override
  String get allRooms => '所有群聊';

  @override
  String get displaynameHasBeenChanged => '昵称已更改';

  @override
  String get download => 'Download';

  @override
  String get downloadFile => '下载文件';

  @override
  String get edit => '编辑';

  @override
  String get editBlockedServers => '编辑被屏蔽的服务器';

  @override
  String get chatPermissions => '聊天权限';

  @override
  String get editDisplayname => '编辑昵称';

  @override
  String get editRoomAliases => '编辑聊天室别名';

  @override
  String get editRoomAvatar => '编辑聊天室头像';

  @override
  String get emoteExists => '表情已存在！';

  @override
  String get emoteInvalid => '无效的表情快捷码！';

  @override
  String get emoteKeyboardNoRecents => '最近使用过的表情会出现在这里...';

  @override
  String get emotePacks => '聊天室的表情包';

  @override
  String get emoteSettings => '表情设置';

  @override
  String get globalChatId => '全局聊天 ID';

  @override
  String get accessAndVisibility => '访问和可见性';

  @override
  String get accessAndVisibilityDescription => '谁可以加入此聊天以及怎样发现该聊天。';

  @override
  String get customEmojisAndStickers => '自定义表情符号和贴纸';

  @override
  String get customEmojisAndStickersBody => '添加或分享可用于任何聊天的表情符号或贴纸。';

  @override
  String get emoteShortcode => '表情快捷码';

  @override
  String get emoteWarnNeedToPick => '你需要选择一个表情快捷码和一张图片！';

  @override
  String get emptyChat => '空聊天';

  @override
  String get enableEmotesGlobally => '在全局启用表情包';

  @override
  String get enableEncryption => '启用加密';

  @override
  String get enableEncryptionWarning => '你之后将无法停用加密，确定吗？';

  @override
  String get encrypted => '已加密';

  @override
  String get encryption => '加密';

  @override
  String get encryptionNotEnabled => '加密未启用';

  @override
  String endedTheCall(String senderName) {
    return '$senderName 结束了通话';
  }

  @override
  String get enterAnEmailAddress => '输入一个电子邮件地址';

  @override
  String get homeserver => '服务器';

  @override
  String get enterYourHomeserver => '输入你的主服务器地址';

  @override
  String errorObtainingLocation(String error) {
    return '取得地址错误: $error';
  }

  @override
  String get everythingReady => '一切就绪！';

  @override
  String get extremeOffensive => '令人极度反感';

  @override
  String get fileName => '文件名';

  @override
  String get fluffychat => 'FluffyChat';

  @override
  String get fontSize => '字体大小';

  @override
  String get forward => '转发';

  @override
  String get fromJoining => '自加入起';

  @override
  String get fromTheInvitation => '自邀请起';

  @override
  String get goToTheNewRoom => '前往新的聊天室';

  @override
  String get chatDescriptionHasBeenChanged => '聊天描述已被更改';

  @override
  String get groupIsPublic => '群组是公开的';

  @override
  String get groups => '群组';

  @override
  String groupWith(String displayname) {
    return '名称为 $displayname 的群组';
  }

  @override
  String get guestsAreForbidden => '访客禁止加入';

  @override
  String get guestsCanJoin => '访客可以加入';

  @override
  String hasWithdrawnTheInvitationFor(String username, String targetName) {
    return '$username 撤回了对 $targetName 的邀请';
  }

  @override
  String get help => '帮助';

  @override
  String get hideRedactedEvents => '隐藏已删除的事件';

  @override
  String get hideRedactedMessages => '隐藏被涂黑的消息';

  @override
  String get hideRedactedMessagesBody => '如果某人涂黑了一条消息，那么在聊天中再也看不到这条消息。';

  @override
  String get hideInvalidOrUnknownMessageFormats => '隐藏无效或未知的消息格式';

  @override
  String get howOffensiveIsThisContent => '这些内容有多令人反感？';

  @override
  String get id => 'ID';

  @override
  String get identity => '身份';

  @override
  String get block => '屏蔽';

  @override
  String get blockedUsers => '已屏蔽的用户';

  @override
  String get blockListDescription => '你可以屏蔽打扰你的用户。你将不会收到来自屏蔽列表中用户的任何消息或聊天室邀请。';

  @override
  String get blockUsername => '忽略用户名';

  @override
  String get iHaveClickedOnLink => '我已经点击了链接';

  @override
  String get incorrectPassphraseOrKey => '不正确的密码短语或恢复密钥';

  @override
  String get inoffensive => '不令人反感';

  @override
  String get inviteContact => '邀请联系人';

  @override
  String inviteContactToGroupQuestion(Object contact, Object groupName) {
    return '你是否要邀请 $contact 参与聊天 \"$groupName\"？';
  }

  @override
  String inviteContactToGroup(String groupName) {
    return '邀请联系人到 $groupName';
  }

  @override
  String get noChatDescriptionYet => '尚未创建聊天描述。';

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
  String get foregroundServiceRunning => '此通知在前台服务运行时出现。';

  @override
  String get screenSharingTitle => '屏幕共享';

  @override
  String get screenSharingDetail => '你正在 FluffyChat 中共享屏幕';

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
    return '文件';
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
  String get setCustomEmotes => '设置自定义表情';

  @override
  String get whoCanPerformWhichAction => '谁可以执行哪些操作';

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
  String get pleaseFillOut => '请填写';

  @override
  String get newGroup => '新群组';

  @override
  String get imageGroup => 'Image group';

  @override
  String get groupName => '群组名称';

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
  String get messages => '消息';

  @override
  String get decline => '拒绝';

  @override
  String youInvitedBy(String user) {
    return '📩 你受到了 $user 的邀请';
  }

  @override
  String get invalidServerName => '服务器名称无效';

  @override
  String get archiveRoomDescription => '聊天将被移至存档。其他用户将能看到你已离开聊天。';

  @override
  String get hidePresences => '隐藏状态列表？';

  @override
  String get leaveEmptyToClearStatus => '留空以清除你的状态。';

  @override
  String get removeFromBundle => '从此集合中移除';

  @override
  String get encryptionSetupRequired =>
      'Encryption setup is required for secure messaging. Please complete the setup in Settings.';

  @override
  String get warning => '警告！';

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
  String get verifyOtherDevice => '🔐 验证其它设备';

  @override
  String get verifyOtherDeviceDescription =>
      '当你验证另一个设备时，这些设备可以交换密钥，从而提高整体安全性。 💪 当你开始验证时，两个设备上的应用都将显示一个弹出窗口。然后你会看到一系列表情符号或数字，你需要比较两个设备上显示的内容。在开始验证之前，最好将两个设备都放在手边。🤳';

  @override
  String get removeDevicesDescription => '你将从此设备登出，无法再接收消息。';

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
  String get invited => '已邀请';

  @override
  String get redactMessageDescription => '消息将为此对话中所有参与者删除。此操作无法撤销。';

  @override
  String get optionalRedactReason => '（可选）删除此消息的原因...';

  @override
  String invitedUser(String username, String targetName) {
    return '📩 $username 邀请了 $targetName';
  }

  @override
  String get invitedUsersOnly => '仅被邀请用户';

  @override
  String get inviteForMe => '发给我的邀请';

  @override
  String inviteText(String username, String link) {
    return '$username 邀请你使用 BMP。 \n1. 注册或登录 \n2. 打开邀请链接：\n $link';
  }

  @override
  String get gallery => '图库';

  @override
  String get document => 'Document';

  @override
  String get location => 'Location';

  @override
  String get contact => 'Contact';

  @override
  String get send => '发送';

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
  String get recoveryKey => '恢复密钥';

  @override
  String get storeInAndroidKeystore => '存储在 Android KeyStore 中';

  @override
  String get storeInAppleKeyChain => '存储在 Apple KeyChain 中';

  @override
  String get storeSecurlyOnThisDevice => '安全地存储在此设备上';

  @override
  String get storeInSecureStorageDescription => '将恢复密钥存储在此设备的安全存储中。';

  @override
  String get saveKeyManuallyDescription => '通过触发系统共享对话框或剪贴板手动保存此密钥。';

  @override
  String get pleaseEnterRecoveryKeyDescription =>
      '要解锁你的旧邮件，请输入你在之前会话中生成的恢复密钥。 你的恢复密钥不是你的密码。';

  @override
  String get unlockOldMessages => '解锁旧消息';

  @override
  String get wrongRecoveryKey => '抱歉…这似乎不是正确的恢复密钥。';

  @override
  String get recoveryKeyLost => '丢失了恢复密钥？';

  @override
  String get wipeChatBackup => '确定要清除你的聊天记录备份以创建新的恢复密钥吗？';

  @override
  String get isTyping => '正在输入…';

  @override
  String joinedTheChat(String username) {
    return '👋 $username 加入了聊天';
  }

  @override
  String get joinRoom => '加入聊天室';

  @override
  String kicked(String username, String targetName) {
    return '👞 $username 踢出了 $targetName';
  }

  @override
  String kickedAndBanned(String username, String targetName) {
    return '🙅 $username 踢出并封禁了 $targetName';
  }

  @override
  String get kickFromChat => '从聊天室踢出';

  @override
  String lastActiveAgo(String localizedTimeShort) {
    return '上次活跃: $localizedTimeShort';
  }

  @override
  String get leave => '离开';

  @override
  String get leftTheChat => '离开了聊天';

  @override
  String get license => '许可证';

  @override
  String get lightTheme => '浅色';

  @override
  String loadCountMoreParticipants(int count) {
    return '加载 $count 个更多的参与者';
  }

  @override
  String get dehydrate => '导出会话并擦除设备';

  @override
  String get dehydrateWarning => '此操作无法撤消。 确保你安全地存储备份文件。';

  @override
  String get dehydrateTor => 'TOR 用户：导出会话';

  @override
  String get dehydrateTorLong => '建议 TOR 用户在关闭窗口之前导出会话。';

  @override
  String get hydrateTor => 'TOR 用户：导入会话导出';

  @override
  String get hydrateTorLong => '你上次是否导出 TOR 会话？ 快速导入它并继续聊天。';

  @override
  String get hydrate => '从备份文件恢复';

  @override
  String get loadingPleaseWait => '加载中…请等待。';

  @override
  String get loadMore => '加载更多…';

  @override
  String get locationDisabledNotice => '位置服务已禁用。请启用此服务以分享你的位置.';

  @override
  String get locationPermissionDeniedNotice => '位置权限被拒绝。请授予此权限以分享你的位置.';

  @override
  String get login => '登录';

  @override
  String logInTo(String homeserver) {
    return '登录 $homeserver';
  }

  @override
  String get memberChanges => '成员变更';

  @override
  String get mention => '提及';

  @override
  String get messagesStyle => '消息：';

  @override
  String get moderator => '协管员';

  @override
  String get muteChat => '静音聊天';

  @override
  String get needPantalaimonWarning => '请注意当前你需要 Pantalaimon 以使用端到端加密功能。';

  @override
  String get newChat => '新的聊天';

  @override
  String get newMessageInFluffyChat => '💬 FluffyChat 新消息';

  @override
  String get newVerificationRequest => '新的验证请求！';

  @override
  String get next => '下一步';

  @override
  String get no => '否';

  @override
  String get noConnectionToTheServer => '无法连接服务器';

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
  String get privacy => '隐私';

  @override
  String get notification => 'Notification';

  @override
  String get wallet => 'Wallet';

  @override
  String get allCalls => 'All Calls';

  @override
  String get unreadCalls => 'Unread Calls';

  @override
  String get setChatDescription => '设置聊天描述';

  @override
  String get replaceRoomWithNewerVersion => '更新聊天室至新版本';

  @override
  String get roomUpgradeDescription =>
      '将使用新版聊天室来重新创建当前聊天室。所有参与者都会收到通知以切换到新的聊天室。有关聊天室版本的更多信息，请访问 https://spec.matrix.org/latest/rooms/';

  @override
  String get usersMustKnock => '用户必须请求加入';

  @override
  String get noOneCanJoin => '无人可以加入';

  @override
  String get restricted => '受限';

  @override
  String get knockRestricted => '“请求加入”请求受限';

  @override
  String get unknown => 'Unknown';

  @override
  String get openGallery => '打开图库';

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
  String get unsupportedAndroidVersion => '不受支持的 Android 版本';

  @override
  String get unsupportedAndroidVersionLong =>
      '这个功能需要较新版本的 Android 系统。请检查更新或 Lineage OS 支持。';

  @override
  String get available => 'Available';

  @override
  String get typeMessage => 'Type message..';

  @override
  String get report => '报错';

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
  String get messageInfo => '消息信息';

  @override
  String get pinnMessage => 'Pin message';

  @override
  String get redactMessage => '删除消息';

  @override
  String get reportMessage => '举报信息';

  @override
  String get jumpToLastReadMessage => '跳转到上次已读的消息';

  @override
  String get jump => '跳转';

  @override
  String get enterNewChat => '进入新聊天';

  @override
  String get reopenChat => '重新打开聊天';

  @override
  String get reply => '回复';

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
  String get otherPartyNotLoggedIn => '另一方当前未登录，因而无法接收消息！';

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
  String get sendAsText => '以文本发送';

  @override
  String get whyDoYouWantToReportThis => '你举报的理由是什么？';

  @override
  String get reason => '原因';

  @override
  String get offensive => '令人反感';

  @override
  String get confirmEventUnpin => '你确定要永久性取消置顶此事件吗？';

  @override
  String get noEmotesFound => '未找到表情。😕';

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
  String get noEncryptionForPublicRooms => '你只能在聊天室不可被公众访问时才能启用加密。';

  @override
  String get noGoogleServicesWarning =>
      '看起来你手机上没有 Firebase Cloud Messaging。如果仍希望接收 FluffyChat 的推送通知，推荐安装 ntfy。借助 ntfy 或另一个 Unified Push 程序，你可以以一种数据安全的方式接收推送通知。你可以从 PlayStore 或 F-Droid 商店下载 ntfy。';

  @override
  String noMatrixServer(String server1, String server2) {
    return '$server1 不是一个 Matrix 服务器，试试 $server2？';
  }

  @override
  String get shareInviteLink => '分享邀请链接';

  @override
  String get scanQrCode => '扫描二维码';

  @override
  String get none => '无';

  @override
  String get noPasswordRecoveryDescription => '你尚未添加恢复密码的方法。';

  @override
  String get noPermission => '没有权限';

  @override
  String get noRoomsFound => '未找到聊天室…';

  @override
  String get notifications => '通知';

  @override
  String get notificationsEnabledForThisAccount => '已为此账户启用通知';

  @override
  String numUsersTyping(int count) {
    return '$count 人正在输入…';
  }

  @override
  String get obtainingLocation => '获取位置中…';

  @override
  String get locationFound => 'Location Found';

  @override
  String get otherPartyCannotReceiveEncryptedMessages =>
      'Other party cannot receive encrypted messages';

  @override
  String get accuracy => 'Accuracy';

  @override
  String get offline => '离线';

  @override
  String get ok => '好';

  @override
  String get online => '在线';

  @override
  String get onlineKeyBackupEnabled => '在线密钥备份已启用';

  @override
  String get oopsPushError => '哎呀！十分不幸，配置推送通知时发生了错误。';

  @override
  String get oopsSomethingWentWrong => '哎呀，出了点差错…';

  @override
  String get openAppToReadMessages => '打开应用以查看消息';

  @override
  String get openCamera => '打开相机';

  @override
  String get openVideoCamera => '打开相机拍摄视频';

  @override
  String get oneClientLoggedOut => '你的一个客户端已登出';

  @override
  String get addAccount => '添加账户';

  @override
  String get editBundlesForAccount => '编辑此账户的集合';

  @override
  String get addToBundle => '添加到集合';

  @override
  String get bundleName => '集合名称';

  @override
  String get enableMultiAccounts => '（测试功能）在此设备上添加多个账户';

  @override
  String get openInMaps => '在地图中打开';

  @override
  String get link => '链接';

  @override
  String get serverRequiresEmail => '此服务器需要验证你的电子邮件地址以进行注册。';

  @override
  String get or => '或';

  @override
  String get participant => '参与者';

  @override
  String get passphraseOrKey => '密码短语或恢复密钥';

  @override
  String get password => '密码';

  @override
  String get passwordForgotten => '忘记密码';

  @override
  String get passwordHasBeenChanged => '密码已被更改';

  @override
  String get hideMemberChangesInPublicChats => '在公开聊天中隐藏成员变化';

  @override
  String get hideMemberChangesInPublicChatsBody =>
      '不在聊天时间线中显示某人是否加入或离开了公开聊天来改进可读性。';

  @override
  String get overview => '概览';

  @override
  String get notifyMeFor => '提示内容';

  @override
  String get passwordRecoverySettings => '密码发现设置';

  @override
  String get passwordRecovery => '密码恢复';

  @override
  String get people => '联系人';

  @override
  String get pickImage => '选择图像';

  @override
  String get pin => '置顶';

  @override
  String play(String fileName) {
    return '播放 $fileName';
  }

  @override
  String get pleaseChoose => '请选择';

  @override
  String get pleaseChooseAPasscode => '请选择一个密码';

  @override
  String get pleaseClickOnLink => '请点击电子邮件中的链接，然后继续。';

  @override
  String get pleaseEnter4Digits => '请输入 4 位数字或留空以停用应用锁。';

  @override
  String get pleaseEnterRecoveryKey => '请输入你的恢复密钥：';

  @override
  String get pleaseEnterYourPassword => '请输入你的密码';

  @override
  String get pleaseEnterYourPin => '请输入你的 PIN';

  @override
  String get pleaseEnterYourUsername => '请输入你的用户名';

  @override
  String get pleaseFollowInstructionsOnWeb => '请按照网站上的提示，点击下一步。';

  @override
  String get publicRooms => '公开聊天室';

  @override
  String get pushRules => '推送规则';

  @override
  String get recording => '录制';

  @override
  String redactedBy(String username) {
    return '已被 $username 删除';
  }

  @override
  String get directChat => '私聊';

  @override
  String redactedByBecause(String username, String reason) {
    return '已被 $username 删除，原因：\"$reason\"';
  }

  @override
  String redactedAnEvent(String username) {
    return '$username 删除了一个事件';
  }

  @override
  String get register => '注册';

  @override
  String get reject => '拒绝';

  @override
  String rejectedTheInvitation(String username) {
    return '$username 拒绝了邀请';
  }

  @override
  String get rejoin => '重新加入';

  @override
  String get removeAllOtherDevices => '移除所有其它设备';

  @override
  String removedBy(String username) {
    return '被 $username 移除';
  }

  @override
  String get removeDevice => '移除设备';

  @override
  String get unbanFromChat => '从聊天中解封';

  @override
  String get removeYourAvatar => '移除你的头像';

  @override
  String get requestPermission => '请求权限';

  @override
  String get roomHasBeenUpgraded => '聊天室已升级';

  @override
  String get roomVersion => '聊天室版本';

  @override
  String get saveFile => '保存文件';

  @override
  String get security => '安全';

  @override
  String seenByUser(String username) {
    return '被 $username 看见';
  }

  @override
  String get sendAMessage => '发送一条消息';

  @override
  String get sendAudio => '发送音频';

  @override
  String get sendFile => '发送文件';

  @override
  String get sendImage => '发送图像';

  @override
  String sendImages(int count) {
    return '发送 $count 张图片';
  }

  @override
  String get sendMessages => '发送消息';

  @override
  String get sendOriginal => '发送原图';

  @override
  String get sendSticker => '发送贴纸';

  @override
  String get sendVideo => '发送视频';

  @override
  String sentAFile(String username) {
    return '📁$username 发送了文件';
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
    return '🎤$username 发送了音频';
  }

  @override
  String sentAPicture(String username) {
    return '🖼️ $username 发送了图片';
  }

  @override
  String sentASticker(String username) {
    return '😊 $username 发送了贴纸';
  }

  @override
  String sentAVideo(String username) {
    return '🎥 $username 发送了视频';
  }

  @override
  String sentCallInformations(String senderName) {
    return '$senderName 发送了通话信息';
  }

  @override
  String get separateChatTypes => '分开私聊和群组';

  @override
  String get setAsCanonicalAlias => '设为主要别名';

  @override
  String get setInvitationLink => '设置邀请链接';

  @override
  String get setPermissionsLevel => '设置权限级别';

  @override
  String get setStatus => '设置状态';

  @override
  String get settings => '设置';

  @override
  String get share => '分享';

  @override
  String sharedTheLocation(String username) {
    return '$username 分享了位置';
  }

  @override
  String get shareLocation => '分享位置';

  @override
  String get showPassword => '显示密码';

  @override
  String get presenceStyle => '是否在线：';

  @override
  String get presencesToggle => '显示其他用户的状态消息';

  @override
  String get singlesignon => '单点登录';

  @override
  String get skip => '跳过';

  @override
  String get sourceCode => '源代码';

  @override
  String get spaceIsPublic => '空间是公开的';

  @override
  String get spaceName => '空间名称';

  @override
  String startedACall(String senderName) {
    return '$senderName 开始了通话';
  }

  @override
  String get startFirstChat => '发起你的第一个聊天';

  @override
  String get status => '状态';

  @override
  String get statusExampleMessage => '你今天怎么样？';

  @override
  String get submit => '提交';

  @override
  String get synchronizingPleaseWait => '同步中…请等待。';

  @override
  String synchronizingPleaseWaitCounter(String percentage) {
    return ' 同步中… ($percentage%)';
  }

  @override
  String get systemTheme => '系统';

  @override
  String get theyDontMatch => '它们不匹配';

  @override
  String get theyMatch => '它们匹配';

  @override
  String get notFound => 'Not found';

  @override
  String get pinLimitMessage => 'You can only pin up to 3 chats';

  @override
  String get title => 'FluffyChat';

  @override
  String get toggleFavorite => '切换收藏';

  @override
  String get toggleMuted => '切换静音';

  @override
  String get toggleUnread => '标记已读/未读';

  @override
  String get tooManyRequestsWarning => '请求过多。请稍后再试！';

  @override
  String get transferFromAnotherDevice => '从其它设备传输';

  @override
  String get tryToSendAgain => '尝试重新发送';

  @override
  String get unavailable => '不可用';

  @override
  String unbannedUser(String username, String targetName) {
    return '$username 解封了 $targetName';
  }

  @override
  String get unblockDevice => '解除屏蔽设备';

  @override
  String get unknownDevice => '未知设备';

  @override
  String get unknownEncryptionAlgorithm => '未知加密算法';

  @override
  String unknownEvent(String type) {
    return '未知事件 \'$type\'';
  }

  @override
  String get unmuteChat => '取消静音聊天';

  @override
  String get unpin => '取消置顶';

  @override
  String get unreadChats => 'null';

  @override
  String userAndOthersAreTyping(String username, int count) {
    return '$username 和其他 $count 人正在输入…';
  }

  @override
  String userAndUserAreTyping(String username, String username2) {
    return '$username 和 $username2 正在输入…';
  }

  @override
  String userIsTyping(String username) {
    return '$username 正在输入…';
  }

  @override
  String userLeftTheChat(String username) {
    return '🚪$username 离开了聊天';
  }

  @override
  String get username => '用户名';

  @override
  String userSentUnknownEvent(String username, String type) {
    return '$username 发送了一个 $type 事件';
  }

  @override
  String get unverified => '未经验证';

  @override
  String get verified => '已验证';

  @override
  String get verify => '验证';

  @override
  String get verifyStart => '开始验证';

  @override
  String get verifySuccess => '你已成功验证！';

  @override
  String get verifyTitle => '验证其它账户';

  @override
  String get videoCall => '视频通话';

  @override
  String get visibilityOfTheChatHistory => '聊天记录的可见性';

  @override
  String get visibleForAllParticipants => '对所有参与者可见';

  @override
  String get visibleForEveryone => '对所有人可见';

  @override
  String get voiceMessage => '语音消息';

  @override
  String get waitingPartnerAcceptRequest => '等待对方接受请求…';

  @override
  String get waitingPartnerEmoji => '等待对方接受 emoji…';

  @override
  String get waitingPartnerNumbers => '等待对方接受数字…';

  @override
  String get wallpaper => '壁纸：';

  @override
  String get weSentYouAnEmail => '我们向你发送了一封电子邮件';

  @override
  String get whoIsAllowedToJoinThisGroup => '谁可以加入此群组';

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
  String get withTheseAddressesRecoveryDescription => '通过这些地址，你可以恢复密码。';

  @override
  String get writeAMessage => '写一条消息…';

  @override
  String get yes => '是';

  @override
  String get you => '你';

  @override
  String get youAreNoLongerParticipatingInThisChat => '你已不再参与此聊天';

  @override
  String get youHaveBeenBannedFromThisChat => '你已被此聊天封禁';

  @override
  String get yourPublicKey => '你的公钥';

  @override
  String get time => '时间';

  @override
  String get messageType => '消息类型';

  @override
  String get sender => '发送者';

  @override
  String get removeFromSpace => '从此空间中移除';

  @override
  String get addToSpaceDescription => '选择一个空间以添加此聊天。';

  @override
  String get start => '开始';

  @override
  String get publish => '发布';

  @override
  String videoWithSize(String size) {
    return '视频 ($size)';
  }

  @override
  String get openChat => '打开聊天';

  @override
  String get markAsRead => '标为已读';

  @override
  String get reportUser => '举报用户';

  @override
  String get dismiss => '忽略';

  @override
  String reactedWith(String sender, String reaction) {
    return '$sender 回应了 $reaction';
  }

  @override
  String get pinMessage => '置顶到聊天室';

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
  String get emojis => '表情符号';

  @override
  String get placeCall => '发起通话';

  @override
  String get voiceCall => '语音通话';

  @override
  String get videoCallsBetaWarning =>
      '请注意，视频通话目前处于测试阶段。它们可能不能像预期的那样工作，或者在所有平台上都不能工作。';

  @override
  String get experimentalVideoCalls => '实验性的视频通话';

  @override
  String get emailOrUsername => '电子邮箱或用户名';

  @override
  String get indexedDbErrorTitle => '私有模式问题';

  @override
  String get indexedDbErrorLong =>
      '遗憾的是，默认情况下未在私有模式下启用消息存储。\n请访问\n - about:config\n - 将 dom.indexedDB.privateBrowsing.enabled 设置为 true\n否则，无法运行 FluffyChat。';

  @override
  String switchToAccount(String number) {
    return '切换到账户 $number';
  }

  @override
  String get nextAccount => '下个账户';

  @override
  String get previousAccount => '上个账户';

  @override
  String get addWidget => '添加小部件';

  @override
  String get widgetVideo => '视频';

  @override
  String get widgetEtherpad => '文本笔记';

  @override
  String get widgetJitsi => 'Jitsi Meet';

  @override
  String get widgetCustom => '自定义';

  @override
  String get widgetName => '名称';

  @override
  String get widgetUrlError => '这不是有效的 URL。';

  @override
  String get widgetNameError => '请提供昵称。';

  @override
  String get errorAddingWidget => '添加小部件出错。';

  @override
  String get youRejectedTheInvitation => '你拒绝了邀请';

  @override
  String get youJoinedTheChat => '你加入了聊天';

  @override
  String get youAcceptedTheInvitation => '👍 你接受了邀请';

  @override
  String youBannedUser(String user) {
    return '你封禁了 $user';
  }

  @override
  String youHaveWithdrawnTheInvitationFor(String user) {
    return '你撤回了对 $user 的邀请';
  }

  @override
  String youInvitedToBy(String alias) {
    return '📩 你已通过链接被邀请到：\n$alias';
  }

  @override
  String invitedBy(String user) {
    return '📩 邀请人 $user';
  }

  @override
  String youInvitedUser(String user) {
    return '📩 你邀请了 $user';
  }

  @override
  String youKicked(String user) {
    return '👞 你踢出了 $user';
  }

  @override
  String youKickedAndBanned(String user) {
    return '🙅 你踢出并封禁了 $user';
  }

  @override
  String youUnbannedUser(String user) {
    return '你解除了对 $user 的封禁';
  }

  @override
  String hasKnocked(String user) {
    return '$user 请求了加入聊天室的邀请';
  }

  @override
  String userWouldLikeToChangeTheChat(String user) {
    return '$user 想加入聊天。';
  }

  @override
  String get noPublicLinkHasBeenCreatedYet => '尚未创建公开链接';

  @override
  String get knock => '请求';

  @override
  String get users => '用户';

  @override
  String countFiles(int count) {
    return '$count 个文件';
  }

  @override
  String get user => '用户';

  @override
  String get custom => '自定义';

  @override
  String get callingPermissions => '呼叫权限';

  @override
  String get callingAccount => '呼叫账户';

  @override
  String get callingAccountDetails => '允许 FluffyChat 使用本机 android 拨号器应用。';

  @override
  String get appearOnTop => '显示在其它应用上方';

  @override
  String get appearOnTopDetails =>
      '允许应用显示在顶部（如果你已经将 Fluffychat 设置为呼叫账户，则不需要授予此权限）';

  @override
  String get otherCallingPermissions => '麦克风、摄像头和其它 FluffyChat 权限';

  @override
  String get whyIsThisMessageEncrypted => '为什么此消息不可读？';

  @override
  String get noKeyForThisMessage =>
      '如果消息是在你在此设备上登录账户前发送的，就可能发生这种情况。\n\n也有可能是发送者屏蔽了你的设备或网络连接出了问题。\n\n你能在另一个会话中读取消息吗？如果是的话，你可以从它那里传递信息！点击设置 > 设备，并确保你的设备已经相互验证。当你下次打开聊天室，且两个会话都在前台，密钥就会自动传输。\n\n你不想在注销或切换设备时丢失密钥？请确保在设置中启用了聊天备份。';

  @override
  String get newSpace => '新的空间';

  @override
  String get enterSpace => '进入空间';

  @override
  String get enterRoom => '进入聊天室';

  @override
  String get allSpaces => '所有空间';

  @override
  String numChats(String number) {
    return '$number 个聊天';
  }

  @override
  String get hideUnimportantStateEvents => '隐藏不重要的状态事件';

  @override
  String get doNotShowAgain => '不再显示';

  @override
  String wasDirectChatDisplayName(String oldDisplayName) {
    return '空聊天（曾是 $oldDisplayName）';
  }

  @override
  String get newSpaceDescription => '空间让你可以整合聊天并建立私人或公共社区。';

  @override
  String get encryptThisChat => '加密此聊天';

  @override
  String get disableEncryptionWarning => '出于安全考虑 ，你不能在之前已启用加密的聊天中禁用加密。';

  @override
  String get sorryThatsNotPossible => '非常抱歉……这是做不到的';

  @override
  String get deviceKeys => '设备密钥：';

  @override
  String get noBackupWarning => '警告！如果不启用聊天备份，你将无法访问加密消息。强烈建议在注销前先启用聊天备份。';

  @override
  String get noOtherDevicesFound => '未找到其它设备';

  @override
  String fileIsTooBigForServer(String max) {
    return '无法发送！服务器只支持最大 $max 的文件。';
  }

  @override
  String fileHasBeenSavedAt(String path) {
    return '文件已保存在 $path';
  }

  @override
  String get readUpToHere => '读到此处';

  @override
  String get openLinkInBrowser => '在浏览器中打开链接';

  @override
  String get reportErrorDescription => '😭 哦不。出了点差错。如果你愿意，可以向开发人员报告此错误。';

  @override
  String get signInWithPassword => '使用密码登录';

  @override
  String get pleaseTryAgainLaterOrChooseDifferentServer => '请稍后再试或选择其它服务器。';

  @override
  String signInWith(String provider) {
    return '使用 $provider 登录';
  }

  @override
  String get profileNotFound => '服务器上找不到此用户。可能是连接有问题或者用户不存在。';

  @override
  String get setTheme => '设置主题：';

  @override
  String get setColorTheme => '设置主题颜色：';

  @override
  String get invite => '邀请';

  @override
  String get inviteGroupChat => '📨 邀请至群聊';

  @override
  String get invitePrivateChat => '📨 邀请至私聊';

  @override
  String get invalidInput => '无效的输入！';

  @override
  String wrongPinEntered(int seconds) {
    return '输入的 PIN 码不正确！请 $seconds 秒后重试…';
  }

  @override
  String get pleaseEnterANumber => '请输入大于 0 的数';

  @override
  String get banUserDescription => '该用户将被禁止进入聊天室，在解除封禁之前将不能再进入聊天室。';

  @override
  String get unbanUserDescription => '如果用户尝试加入则可以再次进入聊天。';

  @override
  String get kickUserDescription => '该用户会被踢出聊天但没被封禁。在公开聊天中，该用户可以随时重新加入。';

  @override
  String get makeAdminDescription => '一旦你将该用户设为管理员，你可能无法撤销，因为他们将拥有与你相同的权限。';

  @override
  String get pushNotificationsNotAvailable => '通知推送不可用';

  @override
  String get learnMore => '了解更多';

  @override
  String get yourGlobalUserIdIs => '你的全局用户 ID 是： ';

  @override
  String noUsersFoundWithQuery(String query) {
    return '很遗憾，没有找到有关\"$query\"的用户。请检查是否输入错误。';
  }

  @override
  String get knocking => '正在请求';

  @override
  String chatCanBeDiscoveredViaSearchOnServer(String server) {
    return '可通过搜索 $server 发现聊天';
  }

  @override
  String get searchChatsRooms => '搜索 #聊天，@用户…';

  @override
  String get nothingFound => '未找到任何内容…';

  @override
  String get createGroupAndInviteUsers => '创建群组并邀请用户';

  @override
  String get groupCanBeFoundViaSearch => '可通过搜索找到该群组';

  @override
  String get startConversation => '开始对话';

  @override
  String get commandHint_sendraw => '发送原始 json';

  @override
  String get databaseMigrationTitle => '数据库已优化';

  @override
  String get databaseMigrationBody => '请稍候。可能需要稍等片刻。';

  @override
  String get searchForUsers => '搜索 @用户…';

  @override
  String get pleaseEnterYourCurrentPassword => '请输入你当前的密码';

  @override
  String get newPassword => '新的密码';

  @override
  String get pleaseChooseAStrongPassword => '请选择一个强密码';

  @override
  String get passwordsDoNotMatch => '密码不匹配';

  @override
  String get passwordIsWrong => '你输入的密码有误';

  @override
  String get publicLink => '公开链接';

  @override
  String get publicChatAddresses => '公开聊天的地址';

  @override
  String get createNewAddress => '新建地址';

  @override
  String get joinSpace => '加入空间';

  @override
  String get publicSpaces => '公开空间';

  @override
  String get addChatOrSubSpace => '添加聊天或子空间';

  @override
  String get subspace => '子空间';

  @override
  String get thisDevice => '此设备：';

  @override
  String get initAppError => '在初始化应用时发生错误';

  @override
  String get userRole => '用户角色';

  @override
  String minimumPowerLevel(String level) {
    return '$level 是最低权限等级。';
  }

  @override
  String searchIn(String chat) {
    return '在 “$chat” 聊天中搜索…';
  }

  @override
  String get searchMore => '搜索更多…';

  @override
  String databaseBuildErrorBody(String url, String error) {
    return '无法构建 SQLite 数据库。目前应用尝试使用旧数据库。请将此错误报告给开发者，网址为 $url。错误消息为：$error';
  }

  @override
  String sessionLostBody(String url, String error) {
    return '你的会话已丢失。请将此错误报告给开发者，网址为 $url。错误消息为：$error';
  }

  @override
  String restoreSessionBody(String url, String error) {
    return '应用现在尝试从备份中恢复你的会话。请将此错误报告给开发者，网址为 $url。错误消息为：$error';
  }

  @override
  String forwardMessageTo(String roomName) {
    return '转发消息至 $roomName ？';
  }

  @override
  String get sendReadReceipts => '发送已读回执';

  @override
  String get sendTypingNotificationsDescription => '聊天中的其他参与者可以看到你正在输入新消息。';

  @override
  String get sendReadReceiptsDescription => '聊天中的其他参与者可以看到你是否读过消息。';

  @override
  String get formattedMessages => '格式化的消息';

  @override
  String get formattedMessagesDescription => '使用 Markdown 显示富文本内容，例如加粗文本。';

  @override
  String get verifyOtherUser => '🔐 验证其他用户';

  @override
  String get verifyOtherUserDescription =>
      '如果你验证了其他用户，就可以确保你清楚自己正在与谁进行通信。💪\n\n当你开始验证时，你和其他用户将在应用中看到一个弹出窗口。然后你会看到一系列表情符号或数字，你和其他用户需要比较它们是否一致。\n\n最好的方式是线下会面或开始视频通话。👭';

  @override
  String acceptedKeyVerification(String sender) {
    return '$sender 接受了密钥验证';
  }

  @override
  String canceledKeyVerification(String sender) {
    return '$sender 取消了密钥验证';
  }

  @override
  String completedKeyVerification(String sender) {
    return '$sender 完成了密钥验证';
  }

  @override
  String isReadyForKeyVerification(String sender) {
    return '$sender 已准备好进行密钥验证';
  }

  @override
  String requestedKeyVerification(String sender) {
    return '$sender 请求了密钥验证';
  }

  @override
  String startedKeyVerification(String sender) {
    return '$sender 开始了密钥验证';
  }

  @override
  String get transparent => '透明';

  @override
  String get incomingMessages => '传入消息';

  @override
  String get stickers => '贴纸';

  @override
  String get discover => '发现';

  @override
  String get commandHint_ignore => '忽略给定的 matrix ID';

  @override
  String get commandHint_unignore => '取消忽略给定的 matrix ID';

  @override
  String unreadChatsInApp(String appname, String unread) {
    return '$appname: $unread 未读聊天';
  }

  @override
  String get noDatabaseEncryption => '数据库加密在此平台上不受支持';

  @override
  String thereAreCountUsersBlocked(Object count) {
    return '目前有 $count 名用户被封禁。';
  }

  @override
  String goToSpace(Object space) {
    return '转到空间：$space';
  }

  @override
  String get youDeletedThisMessage => 'You deleted this message';

  @override
  String get thisMessageWasDeleted => 'This message was deleted';

  @override
  String get refreshing => 'Refreshing...';

  @override
  String get markAsUnread => '标为未读';

  @override
  String userLevel(int level) {
    return '$level - 用户';
  }

  @override
  String moderatorLevel(int level) {
    return '$level - 主持人';
  }

  @override
  String adminLevel(int level) {
    return '$level - 管理员';
  }

  @override
  String get changeGeneralChatSettings => '更改常规聊天设置';

  @override
  String get inviteOtherUsers => '邀请其他用户到这个聊天';

  @override
  String get changeTheChatPermissions => '更改聊天权限';

  @override
  String get changeTheVisibilityOfChatHistory => '更改聊天历史的可见性';

  @override
  String get changeTheCanonicalRoomAlias => '更改主公共聊天地址';

  @override
  String get sendRoomNotifications => '发送通知聊天室所有人的通知';

  @override
  String get changeTheDescriptionOfTheGroup => '更改聊天描述';

  @override
  String get chatPermissionsDescription =>
      '定义此聊天中哪个权限等级对特定操作是必需的。权限等级 0、50 和 100 通常代表用户、主持人和管理员，但你可以自定义任何等级。';

  @override
  String updateInstalled(String version) {
    return '🎉 已安装更新 $version ！';
  }

  @override
  String get changelog => '更新记录';

  @override
  String get sendCanceled => '发送被取消';

  @override
  String get loginWithMatrixId => '使用 Matrix-ID 登录';

  @override
  String get discoverHomeservers => '发现主服务器';

  @override
  String get whatIsAHomeserver => '什么是主服务器？';

  @override
  String get homeserverDescription =>
      '主服务器上就像电子邮件提供商，你的所有数据都存储在上面。你可以选择你想使用哪个主服务器。在 https://invitation.be-mindpower.net/ 上了解更多信息。';

  @override
  String get doesNotSeemToBeAValidHomeserver => '似乎不是兼容的主服务器。URL 不正确？';

  @override
  String get calculatingFileSize => '计算文件尺寸中…';

  @override
  String get prepareSendingAttachment => '准备发送附件…';

  @override
  String get sendingAttachment => '发送附件中…';

  @override
  String get generatingVideoThumbnail => '生成视频缩略图中…';

  @override
  String get compressVideo => '压缩视频中…';

  @override
  String sendingAttachmentCountOfCount(int index, int length) {
    return '正在发送附件 $index，共 $length 个附件…';
  }

  @override
  String serverLimitReached(int seconds) {
    return '达到了服务器限制！等待 $seconds 秒…';
  }

  @override
  String get oneOfYourDevicesIsNotVerified => '您设备中的一台未验证';

  @override
  String get noticeChatBackupDeviceVerification =>
      '注意：当你连接所有设备到聊天备份时，这些设备将被自动验证。';

  @override
  String get continueText => '继续';

  @override
  String get welcomeText =>
      '你好呀 👋 欢迎来到 FluffyChat。你可以登录任意兼容 https://invitation.be-mindpower.net/ 的 homeserver，然后和任何人聊天。这是个巨大的去中心化消息网络！';

  @override
  String get blur => '模糊：';

  @override
  String get opacity => '不透明：';

  @override
  String get setWallpaper => '设置壁纸';

  @override
  String get manageAccount => '管理账户';

  @override
  String get noContactInformationProvided => '服务器未提供任何有效的联系信息';

  @override
  String get contactServerAdmin => '联系服务器管理员';

  @override
  String get contactServerSecurity => '联系服务器安全管理';

  @override
  String get supportPage => '支持页面';

  @override
  String get serverInformation => '服务器信息：';

  @override
  String get name => '名称';

  @override
  String get version => '版本';

  @override
  String get website => '网站';

  @override
  String get compress => '压缩';

  @override
  String get boldText => '文本加粗';

  @override
  String get italicText => '文件倾斜';

  @override
  String get strikeThrough => '删除线';

  @override
  String get invalidUrl => '无效 url';

  @override
  String get addLink => '添加链接';

  @override
  String get unableToJoinChat => '无法加入聊天。可能其他方面已经关闭了对话。';

  @override
  String get previous => '前一个';

  @override
  String appWantsToUseForLogin(String server) {
    return '使用 \'$server\'服务器登录';
  }

  @override
  String get appWantsToUseForLoginDescription => '您特此允许本应用和网站分享关于您的信息。';

  @override
  String get open => '打开';

  @override
  String get waitingForServer => '正在等待服务器…';

  @override
  String get appIntroduction =>
      'FluffyChat 让使用不同即时通信工具的你和你的好友得以聊天。 访问 https://invitation.be-mindpower.net/ 了解详情或轻按 *继续*。';

  @override
  String get newChatRequest => '📩 新的聊天请求';

  @override
  String get contentNotificationSettings => '内容通知设置';

  @override
  String get generalNotificationSettings => '常规通知设置';

  @override
  String get roomNotificationSettings => '聊天室通知设置';

  @override
  String get userSpecificNotificationSettings => '使用特定通知设置';

  @override
  String get otherNotificationSettings => '其他通知设置';

  @override
  String get notificationRuleContainsUserName => '包含用户名';

  @override
  String get notificationRuleContainsUserNameDescription =>
      '当消息包含用户名时通知使用该用户名的用户。';

  @override
  String get notificationRuleMaster => '静音所有通知';

  @override
  String get notificationRuleMasterDescription => '覆盖所有其他规则并禁用所有通知。';

  @override
  String get notificationRuleSuppressNotices => '隐藏自动消息';

  @override
  String get notificationRuleSuppressNoticesDescription =>
      '隐藏来自 bot 等自动客户端的通知。';

  @override
  String get notificationRuleInviteForMe => '给我的邀请';

  @override
  String get notificationRuleInviteForMeDescription => '当用户被邀请加入聊天室时提醒用户。';

  @override
  String get notificationRuleMemberEvent => '成员事件';

  @override
  String get notificationRuleMemberEventDescription => '隐藏成员身份事件通知。';

  @override
  String get notificationRuleIsUserMention => '用户提及';

  @override
  String get notificationRuleIsUserMentionDescription =>
      '当消息中直接提到用户名时通知使用该用户名的用户。';

  @override
  String get notificationRuleContainsDisplayName => '包含展示名称';

  @override
  String get notificationRuleContainsDisplayNameDescription =>
      '当消息包含用户的展示名时提醒使用该展示名的用户。';

  @override
  String get notificationRuleIsRoomMention => '聊天室提及';

  @override
  String get notificationRuleIsRoomMentionDescription => '有聊天室提及时通知用户。';

  @override
  String get notificationRuleRoomnotif => '聊天室通知';

  @override
  String get notificationRuleRoomnotifDescription => '消息包含 「@room」 时提醒用户。';

  @override
  String get notificationRuleTombstone => '墓碑';

  @override
  String get notificationRuleTombstoneDescription => '提醒用户聊天室解散的消息。';

  @override
  String get notificationRuleReaction => '回应';

  @override
  String get notificationRuleReactionDescription => '隐藏回应通知。';

  @override
  String get notificationRuleRoomServerAcl => '聊天室服务器 ACL';

  @override
  String get notificationRuleRoomServerAclDescription =>
      '隐藏聊天室服务器访问控制列表（ACL）通知。';

  @override
  String get notificationRuleSuppressEdits => '隐藏编辑';

  @override
  String get notificationRuleSuppressEditsDescription => '隐藏消息编辑通知。';

  @override
  String get notificationRuleCall => '通话';

  @override
  String get notificationRuleCallDescription => '提醒用户通话的消息。';

  @override
  String get notificationRuleEncryptedRoomOneToOne => '已加密一对一聊天室';

  @override
  String get notificationRuleEncryptedRoomOneToOneDescription =>
      '在已加密一对一聊天室中提醒用户消息。';

  @override
  String get notificationRuleRoomOneToOne => '一对一聊天室';

  @override
  String get notificationRuleRoomOneToOneDescription => '在一对一聊天室中提醒用户消息。';

  @override
  String get notificationRuleMessage => '消息';

  @override
  String get notificationRuleMessageDescription => '提醒用户常规消息。';

  @override
  String get notificationRuleEncrypted => '已加密';

  @override
  String get notificationRuleEncryptedDescription => '在已加密聊天室中提醒用户消息。';

  @override
  String get notificationRuleJitsi => 'Jitsi';

  @override
  String get notificationRuleJitsiDescription => '提醒用户 Jitsi 小部件的事件。';

  @override
  String get notificationRuleServerAcl => '隐藏服务器 ACL 事件';

  @override
  String get notificationRuleServerAclDescription => '隐藏服务器 ACL 事件的通知。';

  @override
  String unknownPushRule(String rule) {
    return '未知推送规则 \'$rule\'';
  }

  @override
  String sentVoiceMessage(String sender, String duration) {
    return '🎙️ $duration - 来自 $sender 的语音消息';
  }

  @override
  String get deletePushRuleCanNotBeUndone => '删除这个通知设置的操作无法撤销。';

  @override
  String get more => '更多';

  @override
  String get shareKeysWith => '与哪些设备分享密钥…';

  @override
  String get shareKeysWithDescription => '选择应当信任哪些设备允许它们读取你在加密聊天中的消息？';

  @override
  String get allDevices => '所有设备';

  @override
  String get crossVerifiedDevicesIfEnabled => '交叉验证设备（如启用）';

  @override
  String get crossVerifiedDevices => '交叉验证设备';

  @override
  String get verifiedDevicesOnly => '仅已验证设备';

  @override
  String get takeAPhoto => '拍照';

  @override
  String get recordAVideo => '录像';

  @override
  String get optionalMessage => '（可选）消息…';

  @override
  String get notSupportedOnThisDevice => '此设备上不受支持';

  @override
  String get approve => '批准';

  @override
  String get youHaveKnocked => '你已请求加入';

  @override
  String get pleaseWaitUntilInvited => '在来自该聊天室的某人邀请你之前请等待。';

  @override
  String get commandHint_logout => '注销当前设备';

  @override
  String get commandHint_logoutall => '注销所有活动设备';

  @override
  String get displayNavigationRail => '在移动设备上显示导航栏';

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

/// The translations for Chinese, using the Han script (`zh_Hant`).
class L10nZhHant extends L10nZh {
  L10nZhHant() : super('zh_Hant');

  @override
  String get alwaysUse24HourFormat => 'false';

  @override
  String get repeatPassword => '再次輸入密碼';

  @override
  String get notAnImage => '不是圖片檔案。';

  @override
  String get setCustomPermissionLevel => '設置自定義權限等級';

  @override
  String get setPermissionsLevelDescription =>
      '請在下方選擇預先定義的角色，或輸入在 0 到 100 之間的自訂權限等級。';

  @override
  String get ignoreUser => '忽略用户';

  @override
  String get normalUser => '正常用户';

  @override
  String get remove => '移除';

  @override
  String get importNow => '立即匯入';

  @override
  String get importEmojis => '匯入表情包';

  @override
  String get importFromZipFile => '從 .zip 檔案匯入';

  @override
  String get exportEmotePack => '將表情包匯出成 .zip 檔案';

  @override
  String get replace => '取代';

  @override
  String get about => '關於';

  @override
  String aboutHomeserver(String homeserver) {
    return '關於$homeserver';
  }

  @override
  String get accept => '同意';

  @override
  String acceptedTheInvitation(String username) {
    return '👍 $username 已接受邀請';
  }

  @override
  String get account => '帳號';

  @override
  String activatedEndToEndEncryption(String username) {
    return '🔐 $username 已啟用點對點加密';
  }

  @override
  String get addEmail => '新增電子郵件';

  @override
  String get confirmMatrixId => '如需刪除你的帳戶，請確認你的 Matrix ID。';

  @override
  String supposedMxid(String mxid) {
    return '此處應爲 $mxid';
  }

  @override
  String get addChatDescription => '新增聊天室描述......';

  @override
  String get addToSpace => '加入空間';

  @override
  String get admin => '管理員';

  @override
  String get alias => '別稱';

  @override
  String get all => '全部';

  @override
  String get allChats => '所有會話';

  @override
  String get commandHint_roomupgrade => '升級此聊天室至指定版本';

  @override
  String get commandHint_googly => '傳送一些瞪眼表情';

  @override
  String get commandHint_cuddle => '傳送一個摟抱表情';

  @override
  String get commandHint_hug => '傳送一個擁抱表情';

  @override
  String googlyEyesContent(String senderName) {
    return '$senderName 向您傳送了瞪眼表情';
  }

  @override
  String cuddleContent(String senderName) {
    return '$senderName 摟抱您';
  }

  @override
  String hugContent(String senderName) {
    return '$senderName 擁抱您';
  }

  @override
  String answeredTheCall(String senderName) {
    return '已開始與 $senderName 通話';
  }

  @override
  String get anyoneCanJoin => '任何人可以加入';

  @override
  String get appLock => '密碼鎖定';

  @override
  String get appLockDescription => '未使用時以密碼鎖定應用程式';

  @override
  String get archive => '封存';

  @override
  String get areGuestsAllowedToJoin => '是否允許訪客加入';

  @override
  String get areYouSure => '您確定嗎？';

  @override
  String get areYouSureYouWantToLogout => '您確定要登出嗎？';

  @override
  String get askSSSSSign => '請輸入您安全儲存的密碼短語或恢復金鑰，以向對方簽名。';

  @override
  String askVerificationRequest(String username) {
    return '是否接受來自 $username 的驗證申請？';
  }

  @override
  String get autoplayImages => '自動播放動態貼圖和表情';

  @override
  String badServerLoginTypesException(String serverVersions,
      String supportedVersions, Object suportedVersions) {
    return '目前伺服器支援的登入類型：\n$serverVersions\n但本應用程式僅支援：\n$supportedVersions';
  }

  @override
  String get sendTypingNotifications => '傳送「輸入中」通知';

  @override
  String get swipeRightToLeftToReply => '向右滑至左以回覆';

  @override
  String get sendOnEnter => '按 Enter 鍵傳送';

  @override
  String badServerVersionsException(
      String serverVersions,
      String supportedVersions,
      Object serverVerions,
      Object supoortedVersions,
      Object suportedVersions) {
    return '目前伺服器支援的協議版本：\n$serverVersions\n但本應用程式僅支援 $supportedVersions';
  }

  @override
  String countChatsAndCountParticipants(int chats, int participants) {
    return '$chats 個聊天室和 $participants 位參與者';
  }

  @override
  String get noMoreChatsFound => '沒有更多聊天室了...';

  @override
  String get noChatsFoundHere => '還沒開始聊天嗎？點擊下方按鈕找個人聊聊吧⤵';

  @override
  String get joinedChats => '已加入的聊天室';

  @override
  String get unread => '未讀';

  @override
  String get space => '空間';

  @override
  String get spaces => '空間';

  @override
  String get banFromChat => '已從聊天室中封鎖';

  @override
  String get banned => '已被封鎖';

  @override
  String bannedUser(String username, String targetName) {
    return '$username 封鎖了 $targetName';
  }

  @override
  String get blockDevice => '封鎖裝置';

  @override
  String get blocked => '已封鎖';

  @override
  String get botMessages => '機器人訊息';

  @override
  String get cancel => '取消';

  @override
  String cantOpenUri(String uri) {
    return '無法打開 URI $uri';
  }

  @override
  String get changeDeviceName => '變更裝置名稱';

  @override
  String changedTheChatAvatar(String username) {
    return '$username 變更了對話頭貼';
  }

  @override
  String changedTheChatDescriptionTo(String username, String description) {
    return '$username 變更了聊天室介紹為：「$description」';
  }

  @override
  String changedTheChatNameTo(String username, String chatname) {
    return '$username 把聊天室名稱變更為：「$chatname」';
  }

  @override
  String changedTheChatPermissions(String username) {
    return '$username 變更了對話權限';
  }

  @override
  String changedTheDisplaynameTo(String username, String displayname) {
    return '$username 變更了顯示名稱為：「$displayname」';
  }

  @override
  String changedTheGuestAccessRules(String username) {
    return '$username 變更了訪客訪問規則';
  }

  @override
  String changedTheGuestAccessRulesTo(String username, String rules) {
    return '$username 變更了訪客訪問規則為：$rules';
  }

  @override
  String changedTheHistoryVisibility(String username) {
    return '$username 變更了歷史記錄觀察狀態';
  }

  @override
  String changedTheHistoryVisibilityTo(String username, String rules) {
    return '$username 變更了歷史紀錄觀察狀態到：$rules';
  }

  @override
  String changedTheJoinRules(String username) {
    return '$username 變更了加入的規則';
  }

  @override
  String changedTheJoinRulesTo(String username, String joinRules) {
    return '$username 變更了加入的規則為：$joinRules';
  }

  @override
  String changedTheProfileAvatar(String username) {
    return '$username 變更了頭貼';
  }

  @override
  String changedTheRoomAliases(String username) {
    return '$username 變更了聊天室名';
  }

  @override
  String changedTheRoomInvitationLink(String username) {
    return '$username 變更了邀請連結';
  }

  @override
  String get changePassword => '變更密碼';

  @override
  String get changeTheHomeserver => '變更主機位址';

  @override
  String get changeTheme => '變更主題';

  @override
  String get changeTheNameOfTheGroup => '變更了群組名稱';

  @override
  String get changeYourAvatar => '更改您的大頭貼';

  @override
  String get channelCorruptedDecryptError => '加密已被破壞';

  @override
  String get chat => '聊天室';

  @override
  String get yourChatBackupHasBeenSetUp => '您的聊天室記錄備份已設定。';

  @override
  String get chatDescription => '聊天室描述';

  @override
  String get tryAgain => '再試一次';

  @override
  String get search => '搜尋';

  @override
  String get select => '選擇';

  @override
  String get logout => '登出';

  @override
  String get group => '群組';

  @override
  String get calls => '通話';

  @override
  String get chatBackup => '備份聊天室';

  @override
  String get chatBackupDescription => '您的過往聊天室記錄已被恢復金鑰加密。請您確保不會弄丟它。';

  @override
  String get chatDetails => '對話詳細';

  @override
  String get chatHasBeenAddedToThisSpace => '聊天室已新增到此空間';

  @override
  String get chats => '聊天室';

  @override
  String get chooseAStrongPassword => '輸入一個較強的密碼';

  @override
  String get clearArchive => '清除存檔';

  @override
  String get close => '關閉';

  @override
  String get commandHint_markasdm => '將給定的 Matrix ID 標示為直接訊息房間';

  @override
  String get commandHint_markasgroup => '標示為群組';

  @override
  String get commandHint_ban => '在此聊天室封鎖該使用者';

  @override
  String get commandHint_clearcache => '清除快取';

  @override
  String get commandHint_create => '建立一個空的群聊\n使用 --no-encryption 選項來停用加密';

  @override
  String get commandHint_discardsession => '丟棄工作階段';

  @override
  String get commandHint_dm => '啟動一對一聊天室\n使用 --no-encryption 選項來停用加密';

  @override
  String get commandHint_html => '傳送 HTML 格式的文字';

  @override
  String get commandHint_invite => '邀請該使用者加入此聊天室';

  @override
  String get commandHint_join => '加入此聊天室';

  @override
  String get commandHint_kick => '將這個使用者移出此聊天室';

  @override
  String get commandHint_leave => '退出此聊天室';

  @override
  String get commandHint_me => '描述自己';

  @override
  String get commandHint_myroomavatar => '設定您的聊天室頭貼（通過 mxc-uri）';

  @override
  String get commandHint_myroomnick => '設定您的聊天室暱稱';

  @override
  String get commandHint_op => '設定給定使用者的權限等級（預設：50）';

  @override
  String get commandHint_plain => '傳送未格式化的文字';

  @override
  String get commandHint_react => '以反應的形式傳送回覆';

  @override
  String get commandHint_send => '傳送文字';

  @override
  String get commandHint_unban => '在此聊天室解除封鎖該使用者';

  @override
  String get commandInvalid => '命令無效';

  @override
  String commandMissing(String command) {
    return '$command 不是正確的命令。';
  }

  @override
  String get compareEmojiMatch => '請對比這些表情';

  @override
  String get compareNumbersMatch => '請對比這些數字';

  @override
  String get configureChat => '設定聊天室';

  @override
  String get confirm => '確認';

  @override
  String get connect => '連接';

  @override
  String get contactHasBeenInvitedToTheGroup => '聯絡人已被邀請至群組';

  @override
  String get containsDisplayName => '包含顯示名稱';

  @override
  String get containsUserName => '包含使用者名稱';

  @override
  String get contentHasBeenReported => '此內容已被回報給伺服器管理員們';

  @override
  String get copiedToClipboard => '已複製到剪貼簿';

  @override
  String get copy => '複製';

  @override
  String get copyToClipboard => '複製到剪貼簿';

  @override
  String couldNotDecryptMessage(String error) {
    return '不能解密訊息：$error';
  }

  @override
  String countParticipants(int count) {
    return '$count 個參與者';
  }

  @override
  String get create => '建立';

  @override
  String createdTheChat(String username) {
    return '💬 $username 建立了聊天室';
  }

  @override
  String get createGroup => '建立群組';

  @override
  String get createNewSpace => '新建空間';

  @override
  String get currentlyActive => '目前活躍';

  @override
  String get darkTheme => '夜間模式';

  @override
  String dateAndTimeOfDay(String date, String timeOfDay) {
    return '$date , $timeOfDay';
  }

  @override
  String dateWithoutYear(String month, String day) {
    return '$month - $day';
  }

  @override
  String dateWithYear(String year, String month, String day) {
    return '$year - $month - $day';
  }

  @override
  String get deactivateAccountWarning => '這將停用您的帳號。這個決定是不能挽回的！您確定嗎？';

  @override
  String get defaultPermissionLevel => '預設權限等級';

  @override
  String get delete => '刪除';

  @override
  String get deleteAccount => '刪除帳號';

  @override
  String get deleteMessage => '刪除訊息';

  @override
  String get device => '裝置';

  @override
  String get deviceId => '裝置ID';

  @override
  String get devices => '裝置';

  @override
  String get directChats => '直接傳訊';

  @override
  String get allRooms => '所有群組聊天室';

  @override
  String get displaynameHasBeenChanged => '顯示名稱已被變更';

  @override
  String get downloadFile => '下載文件';

  @override
  String get edit => '編輯';

  @override
  String get editBlockedServers => '編輯被封鎖的伺服器';

  @override
  String get chatPermissions => '聊天室權限';

  @override
  String get editDisplayname => '編輯顯示名稱';

  @override
  String get editRoomAliases => '編輯聊天室名';

  @override
  String get editRoomAvatar => '編輯聊天室頭貼';

  @override
  String get emoteExists => '表情已存在！';

  @override
  String get emoteInvalid => '無效的表情快捷鍵！';

  @override
  String get emoteKeyboardNoRecents => '最近使用的表情將顯示在這裡...';

  @override
  String get emotePacks => '聊天室的表情符號';

  @override
  String get emoteSettings => '表情設定';

  @override
  String get globalChatId => '全球聊天室 ID';

  @override
  String get accessAndVisibility => '訪問權限和可見性';

  @override
  String get accessAndVisibilityDescription => '誰被允許加入此聊天室以及如何發現聊天室。';

  @override
  String get customEmojisAndStickers => '自訂表情符號和貼圖';

  @override
  String get customEmojisAndStickersBody => '新增或分享可在任何聊天室中使用的自訂表情符號或貼圖。';

  @override
  String get emoteShortcode => '表情快捷鍵';

  @override
  String get emoteWarnNeedToPick => '您需要選取一個表情快捷鍵和一張圖片！';

  @override
  String get emptyChat => '空的聊天室';

  @override
  String get enableEmotesGlobally => '在全域啟用表情符號';

  @override
  String get enableEncryption => '啟用加密';

  @override
  String get enableEncryptionWarning => '您將不能再停用加密，確定嗎？';

  @override
  String get encrypted => '已加密的';

  @override
  String get encryption => '加密';

  @override
  String get encryptionNotEnabled => '加密未啟用';

  @override
  String endedTheCall(String senderName) {
    return '$senderName 結束了通話';
  }

  @override
  String get enterAnEmailAddress => '輸入一個電子郵件位址';

  @override
  String get homeserver => '伺服器';

  @override
  String get enterYourHomeserver => '輸入伺服器位址';

  @override
  String errorObtainingLocation(String error) {
    return '取得位置錯誤：$error';
  }

  @override
  String get everythingReady => '一切就緒！';

  @override
  String get extremeOffensive => '極端令人反感';

  @override
  String get fileName => '檔案名稱';

  @override
  String get fluffychat => 'FluffyChat';

  @override
  String get fontSize => '字體大小';

  @override
  String get forward => '轉發';

  @override
  String get fromJoining => '自加入起';

  @override
  String get fromTheInvitation => '自邀請起';

  @override
  String get goToTheNewRoom => '前往新聊天室';

  @override
  String get chatDescriptionHasBeenChanged => '聊天室描述已變更';

  @override
  String get groupIsPublic => '群組是公開的';

  @override
  String get groups => '群組';

  @override
  String groupWith(String displayname) {
    return '名稱為 $displayname 的群組';
  }

  @override
  String get guestsAreForbidden => '訪客已被禁止';

  @override
  String get guestsCanJoin => '訪客可以加入';

  @override
  String hasWithdrawnTheInvitationFor(String username, String targetName) {
    return '$username 收回了對 $targetName 的邀請';
  }

  @override
  String get help => '幫助';

  @override
  String get hideRedactedEvents => '隱藏編輯過的事件';

  @override
  String get hideRedactedMessages => '隱藏被刪除的訊息';

  @override
  String get hideRedactedMessagesBody => '如果有人收回一條訊息，該訊息將不再在聊天室中顯示。';

  @override
  String get hideInvalidOrUnknownMessageFormats => '隱藏無效或未知的訊息格式';

  @override
  String get howOffensiveIsThisContent => '這個內容有多令人反感？';

  @override
  String get id => 'ID';

  @override
  String get identity => '身份';

  @override
  String get block => '封鎖';

  @override
  String get blockedUsers => '已封鎖的使用者';

  @override
  String get blockListDescription => '你可以封鎖打擾你的使用者。你不會再收到任何從已封鎖使用者發來的訊息或聊天室邀請。';

  @override
  String get blockUsername => '無視使用者名稱';

  @override
  String get iHaveClickedOnLink => '我已經點擊了網址';

  @override
  String get incorrectPassphraseOrKey => '錯誤的密碼短語或恢復金鑰';

  @override
  String get inoffensive => '不令人反感';

  @override
  String get inviteContact => '邀請聯絡人';

  @override
  String inviteContactToGroupQuestion(Object contact, Object groupName) {
    return '您想邀請 $contact 加入 「$groupName」 聊天室嗎？';
  }

  @override
  String inviteContactToGroup(String groupName) {
    return '邀請聯絡人到 $groupName';
  }

  @override
  String get noChatDescriptionYet => '尚未建立聊天室描述。';

  @override
  String get foregroundServiceRunning => '當前景服務正在運行時會顯示此通知。';

  @override
  String get screenSharingTitle => '螢幕分享';

  @override
  String get screenSharingDetail => '您正在 FuffyChat 中分享您的螢幕';

  @override
  String files(int count) {
    return '文件';
  }

  @override
  String get setCustomEmotes => '自訂表情符號';

  @override
  String get whoCanPerformWhichAction => '誰可以執行這個動作';

  @override
  String get pleaseFillOut => '請填充';

  @override
  String get newGroup => '新群組';

  @override
  String get groupName => '群組名稱';

  @override
  String get messages => '訊息';

  @override
  String get decline => '拒絕';

  @override
  String youInvitedBy(String user) {
    return '📩 您被 $user 邀請';
  }

  @override
  String get invalidServerName => '伺服器名稱錯誤';

  @override
  String get archiveRoomDescription => '聊天室將被移動到存檔中。其他使用者將能看到您已離開聊天室。';

  @override
  String get hidePresences => '隱藏狀態列表？';

  @override
  String get leaveEmptyToClearStatus => '留空以清除您的狀態。';

  @override
  String get removeFromBundle => '從此套組中移除';

  @override
  String get warning => '警告！';

  @override
  String get verifyOtherDevice => '🔐 驗證其他裝置';

  @override
  String get verifyOtherDeviceDescription =>
      '當您驗證另一個裝置時，這些裝置可以交換密鑰，提升您的整體安全性。💪 當您開始驗證時，一個彈出視窗將在兩個裝置上的應用程式中出現。在那裡，您將看到一系列的表情符號或數字，您需要相互比較。在開始驗證之前最好有兩個裝置在手邊。🤳';

  @override
  String get removeDevicesDescription => '您將從這個裝置登出，並將不再能夠接收消息。';

  @override
  String get invited => '已邀請';

  @override
  String get redactMessageDescription => '該訊息將對此對話中的所有參與者收回。這不能被反悔。';

  @override
  String get optionalRedactReason => '（非必填）收回此訊息的原因...';

  @override
  String invitedUser(String username, String targetName) {
    return '📩 $username 邀請了 $targetName';
  }

  @override
  String get invitedUsersOnly => '只有被邀請的使用者';

  @override
  String get inviteForMe => '來自我的邀請';

  @override
  String inviteText(String username, String link) {
    return '$username 邀請您使用 BMP\n1. 登入或註冊\n2. 打開該邀請網址：\n$link';
  }

  @override
  String get gallery => '畫廊';

  @override
  String get send => '傳送';

  @override
  String get recoveryKey => '恢復金鑰';

  @override
  String get storeInAndroidKeystore => '存儲在 Android KeyStore';

  @override
  String get storeInAppleKeyChain => '存儲在 Apple KeyChain';

  @override
  String get storeSecurlyOnThisDevice => '在此裝置上安全存儲';

  @override
  String get storeInSecureStorageDescription => '將恢復密鑰存儲在此裝置的安全存儲中。';

  @override
  String get saveKeyManuallyDescription => '通過觸發系統分享對話框或剪貼板手動保存此密鑰。';

  @override
  String get pleaseEnterRecoveryKeyDescription =>
      '要解鎖您的舊訊息，請輸入在之前的會話中生成的恢復密鑰。您的恢復密鑰不是您的密碼。';

  @override
  String get unlockOldMessages => '解鎖舊消息';

  @override
  String get wrongRecoveryKey => '抱歉......這似乎不是正確的恢復密鑰。';

  @override
  String get recoveryKeyLost => '遺失恢復金鑰？';

  @override
  String get wipeChatBackup => '是否清除您的聊天室記錄備份以建立新的安全金鑰嗎？';

  @override
  String get isTyping => '正在輸入...…';

  @override
  String joinedTheChat(String username) {
    return '👋 $username 加入了聊天室';
  }

  @override
  String get joinRoom => '加入聊天室';

  @override
  String kicked(String username, String targetName) {
    return '👞 $username 踢了 $targetName';
  }

  @override
  String kickedAndBanned(String username, String targetName) {
    return '🙅 $username 踢了 $targetName 並將其封鎖';
  }

  @override
  String get kickFromChat => '從聊天室踢出';

  @override
  String lastActiveAgo(String localizedTimeShort) {
    return '最後活動時間：$localizedTimeShort';
  }

  @override
  String get leave => '離開';

  @override
  String get leftTheChat => '離開了聊天室';

  @override
  String get license => '授權';

  @override
  String get lightTheme => '日間模式';

  @override
  String loadCountMoreParticipants(int count) {
    return '載入 $count 個更多的參與者';
  }

  @override
  String get dehydrate => '匯出會話並清除裝置';

  @override
  String get dehydrateWarning => '此操作不能反悔。請確保安全地存儲備份文件。';

  @override
  String get dehydrateTor => 'TOR 使用者：匯出會話';

  @override
  String get dehydrateTorLong => '對 TOR 使用者，建議在關閉窗口前匯出會話。';

  @override
  String get hydrateTor => 'TOR 使用者：匯入會話';

  @override
  String get hydrateTorLong => '上次在 TOR 上匯出會話了嗎？快速匯入它已繼續使用聊天室。';

  @override
  String get hydrate => '從備份文件恢復';

  @override
  String get loadingPleaseWait => '載入中...... 請稍候。';

  @override
  String get loadMore => '載入更多...…';

  @override
  String get locationDisabledNotice => '位置服務被停用。請啟用它們以能夠分享您的位置。';

  @override
  String get locationPermissionDeniedNotice => '位置權限被拒絕。請授予它們以能夠分享您的位置。';

  @override
  String get login => '登入';

  @override
  String logInTo(String homeserver) {
    return '登入 $homeserver';
  }

  @override
  String get memberChanges => '變更成員';

  @override
  String get mention => '提及';

  @override
  String get messagesStyle => '訊息樣式：';

  @override
  String get moderator => '版主';

  @override
  String get muteChat => '將該聊天室靜音';

  @override
  String get needPantalaimonWarning => '請注意您需要 Pantalaimon 才能使用點對點加密功能。';

  @override
  String get newChat => '新聊天';

  @override
  String get newMessageInFluffyChat => '💬 來自 FluffyChat 的新訊息';

  @override
  String get newVerificationRequest => '新的驗證請求！';

  @override
  String get next => '下一個';

  @override
  String get no => '否';

  @override
  String get noConnectionToTheServer => '無法連接到伺服器';

  @override
  String get privacy => '隱私';

  @override
  String get setChatDescription => '設定聊天室描述';

  @override
  String get replaceRoomWithNewerVersion => '用較新的版本取代聊天室';

  @override
  String get roomUpgradeDescription =>
      '將使用新版本聊天室來重新建立聊天室。所有本聊天室的參與者都會收到通知，他們都需要換到新的聊天室裡。若您想知道有關新版本的更多資訊，請前往 https://spec.matrix.org/latest/rooms/';

  @override
  String get usersMustKnock => '使用者必須敲門';

  @override
  String get noOneCanJoin => '沒有人可以加入';

  @override
  String get restricted => '受限';

  @override
  String get knockRestricted => '敲門受限';

  @override
  String get openGallery => '開啟畫廊';

  @override
  String get unsupportedAndroidVersion => '不支持的Android版本';

  @override
  String get unsupportedAndroidVersionLong =>
      '此功能需要較新的 Android 版本。請檢查更新或 Lineage OS 支持。';

  @override
  String get report => '報告';

  @override
  String get messageInfo => '訊息資訊';

  @override
  String get redactMessage => '重新編輯訊息';

  @override
  String get reportMessage => '檢舉訊息';

  @override
  String get jumpToLastReadMessage => '跳至最後讀取的訊息';

  @override
  String get jump => '跳轉';

  @override
  String get enterNewChat => '進入新聊天室';

  @override
  String get reopenChat => '重新開啟聊天室';

  @override
  String get reply => '回覆';

  @override
  String get otherPartyNotLoggedIn => '對方現未登入，未能接收訊息 !';

  @override
  String get sendAsText => '以文字傳送';

  @override
  String get whyDoYouWantToReportThis => '您檢舉的原因是什麼？';

  @override
  String get reason => '原因';

  @override
  String get offensive => '令人反感';

  @override
  String get confirmEventUnpin => '您確定要永久取消釘選該事件嗎？';

  @override
  String get noEmotesFound => '表情符號不存在。😕';

  @override
  String get noEncryptionForPublicRooms => '您只能在這個聊天室不再被允許公開訪問後，才能啟用加密。';

  @override
  String get noGoogleServicesWarning =>
      '您手機上沒有安裝 Google 服務框架。這或許對於保護您的隱私而言是個好事！但為了收到 FluffyChat 的推播通知，我們建議您使用 https://microg.org 或 https://unifiedpush.org。';

  @override
  String noMatrixServer(String server1, String server2) {
    return '$server1 不是 Matrix 服務器，改用 $server2 嗎？';
  }

  @override
  String get shareInviteLink => '分享邀請網址';

  @override
  String get scanQrCode => '掃描 QR 碼';

  @override
  String get none => '無';

  @override
  String get noPasswordRecoveryDescription => '您尚未新增恢復密碼的方法。';

  @override
  String get noPermission => '沒有權限';

  @override
  String get noRoomsFound => '找不到聊天室...…';

  @override
  String get notifications => '通知';

  @override
  String get notificationsEnabledForThisAccount => '已為此帳號啟用通知';

  @override
  String numUsersTyping(int count) {
    return '$count 個人正在輸入...…';
  }

  @override
  String get obtainingLocation => '正在取得位置…';

  @override
  String get offline => '離線';

  @override
  String get ok => 'OK';

  @override
  String get online => '線上';

  @override
  String get onlineKeyBackupEnabled => '線上金鑰備份已啟用';

  @override
  String get oopsPushError => '哎呀！設定推送通知時不幸發生錯誤。';

  @override
  String get oopsSomethingWentWrong => '哎呀！出了一點差錯...…';

  @override
  String get openAppToReadMessages => '打開應用程式以讀取訊息';

  @override
  String get openCamera => '開啟相機';

  @override
  String get openVideoCamera => '打開錄影';

  @override
  String get oneClientLoggedOut => '您的一個客戶端已登出';

  @override
  String get addAccount => '新增帳號';

  @override
  String get editBundlesForAccount => '為此帳號編輯套組';

  @override
  String get addToBundle => '新增到套組';

  @override
  String get bundleName => '套組名稱';

  @override
  String get enableMultiAccounts => '（實驗性功能）在此裝置上啟用多個帳號';

  @override
  String get openInMaps => '在地圖中打開';

  @override
  String get link => '網址';

  @override
  String get serverRequiresEmail => '該伺服器需要驗證您的註冊電子郵件地址。';

  @override
  String get or => '或';

  @override
  String get participant => '參與者';

  @override
  String get passphraseOrKey => '密碼短語或恢復金鑰';

  @override
  String get password => '密碼';

  @override
  String get passwordForgotten => '忘記密碼';

  @override
  String get passwordHasBeenChanged => '密碼已被變更';

  @override
  String get hideMemberChangesInPublicChats => '在公開聊天室中隱藏成員變動';

  @override
  String get hideMemberChangesInPublicChatsBody =>
      '若有人加入或離開公開聊天室，將不在聊天室時間軸顯示，以提升資訊可讀性。';

  @override
  String get overview => '概觀';

  @override
  String get notifyMeFor => '通知我';

  @override
  String get passwordRecoverySettings => '恢復密碼設定';

  @override
  String get passwordRecovery => '恢復密碼';

  @override
  String get people => '人';

  @override
  String get pickImage => '選擇圖片';

  @override
  String get pin => '釘選';

  @override
  String play(String fileName) {
    return '播放 $fileName';
  }

  @override
  String get pleaseChoose => '請選擇';

  @override
  String get pleaseChooseAPasscode => '請選擇一個密碼';

  @override
  String get pleaseClickOnLink => '請點擊電子郵件中的網址，然後繼續。';

  @override
  String get pleaseEnter4Digits => '請輸入4位數字，或留空以停用密碼鎖定。';

  @override
  String get pleaseEnterRecoveryKey => '請輸入您的恢復金鑰：';

  @override
  String get pleaseEnterYourPassword => '請輸入您的密碼';

  @override
  String get pleaseEnterYourPin => '請輸入您的密碼';

  @override
  String get pleaseEnterYourUsername => '請輸入您的使用者名稱';

  @override
  String get pleaseFollowInstructionsOnWeb => '請按照網站上的說明進行操作，然後點擊下一步。';

  @override
  String get publicRooms => '公開的聊天室';

  @override
  String get pushRules => '推播規則';

  @override
  String get recording => '錄音中';

  @override
  String redactedBy(String username) {
    return '由 $username 編輯';
  }

  @override
  String get directChat => '私訊';

  @override
  String redactedByBecause(String username, String reason) {
    return '由 $username 編輯，原因：「$reason」';
  }

  @override
  String redactedAnEvent(String username) {
    return '$username 編輯了一個事件';
  }

  @override
  String get register => '註冊';

  @override
  String get reject => '拒絕';

  @override
  String rejectedTheInvitation(String username) {
    return '$username 拒絕了邀請';
  }

  @override
  String get rejoin => '重新加入';

  @override
  String get removeAllOtherDevices => '移除所有其他裝置';

  @override
  String removedBy(String username) {
    return '被 $username 移除';
  }

  @override
  String get removeDevice => '移除裝置';

  @override
  String get unbanFromChat => '解封聊天室';

  @override
  String get removeYourAvatar => '移除您的頭像';

  @override
  String get requestPermission => '請求權限';

  @override
  String get roomHasBeenUpgraded => '聊天室已更新';

  @override
  String get roomVersion => '聊天室的版本';

  @override
  String get saveFile => '儲存檔案';

  @override
  String get security => '安全';

  @override
  String seenByUser(String username) {
    return '$username 已讀';
  }

  @override
  String get sendAMessage => '傳送訊息';

  @override
  String get sendAudio => '傳送音訊';

  @override
  String get sendFile => '傳送文件';

  @override
  String get sendImage => '傳送圖片';

  @override
  String sendImages(int count) {
    return '傳送$count張圖片';
  }

  @override
  String get sendMessages => '傳送訊息';

  @override
  String get sendOriginal => '傳送原始內容';

  @override
  String get sendSticker => '傳送貼圖';

  @override
  String get sendVideo => '傳送影片';

  @override
  String sentAFile(String username) {
    return '$username 傳送了一個文件';
  }

  @override
  String sentAnAudio(String username) {
    return '🎤$username 傳送了一個音訊';
  }

  @override
  String sentAPicture(String username) {
    return '🖼️$username 傳送了一張圖片';
  }

  @override
  String sentASticker(String username) {
    return '😊$username 傳送了貼圖';
  }

  @override
  String sentAVideo(String username) {
    return '🎥$username 傳送了影片';
  }

  @override
  String sentCallInformations(String senderName) {
    return '$senderName 傳送了通話資訊';
  }

  @override
  String get separateChatTypes => '分開私訊和群組';

  @override
  String get setAsCanonicalAlias => '設為主要別名';

  @override
  String get setInvitationLink => '設定邀請連結';

  @override
  String get setPermissionsLevel => '設定權限等級';

  @override
  String get setStatus => '設定狀態';

  @override
  String get settings => '設定';

  @override
  String get share => '分享';

  @override
  String sharedTheLocation(String username) {
    return '$username 分享了位置';
  }

  @override
  String get shareLocation => '分享位置';

  @override
  String get showPassword => '顯示密碼';

  @override
  String get presenceStyle => '目前狀態：';

  @override
  String get presencesToggle => '顯示其他使用者的狀態訊息';

  @override
  String get singlesignon => '單一登入';

  @override
  String get skip => '跳過';

  @override
  String get sourceCode => '原始碼';

  @override
  String get spaceIsPublic => '空間是公開的';

  @override
  String get spaceName => '空間名稱';

  @override
  String startedACall(String senderName) {
    return '$senderName 開始了通話';
  }

  @override
  String get startFirstChat => '開始您的第一次聊天室';

  @override
  String get status => '狀態';

  @override
  String get statusExampleMessage => '今天過得如何？';

  @override
  String get submit => '送出';

  @override
  String get synchronizingPleaseWait => '正在同步... 請稍候。';

  @override
  String synchronizingPleaseWaitCounter(String percentage) {
    return ' 同步中… ($percentage%)';
  }

  @override
  String get systemTheme => '自動';

  @override
  String get theyDontMatch => '它們不相符';

  @override
  String get theyMatch => '它們相符';

  @override
  String get title => 'FluffyChat';

  @override
  String get toggleFavorite => '切換收藏夾';

  @override
  String get toggleMuted => '切換靜音';

  @override
  String get toggleUnread => '標示為已讀/未讀';

  @override
  String get tooManyRequestsWarning => '太多請求了。請稍候再試！';

  @override
  String get transferFromAnotherDevice => '從其他裝置傳輸';

  @override
  String get tryToSendAgain => '再次嘗試傳送';

  @override
  String get unavailable => '無法取得';

  @override
  String unbannedUser(String username, String targetName) {
    return '$username 解除封鎖了 $targetName';
  }

  @override
  String get unblockDevice => '解除鎖定裝置';

  @override
  String get unknownDevice => '未知裝置';

  @override
  String get unknownEncryptionAlgorithm => '未知的加密演算法';

  @override
  String unknownEvent(String type) {
    return '未知事件「$type」';
  }

  @override
  String get unmuteChat => '取消靜音聊天室';

  @override
  String get unpin => '取消釘選';

  @override
  String get unreadChats => 'null';

  @override
  String userAndOthersAreTyping(String username, int count) {
    return '$username 和其他 $count 個人正在輸入...…';
  }

  @override
  String userAndUserAreTyping(String username, String username2) {
    return '$username 和 $username2 正在輸入...…';
  }

  @override
  String userIsTyping(String username) {
    return '$username 正在輸入...…';
  }

  @override
  String userLeftTheChat(String username) {
    return '$username 離開了聊天室';
  }

  @override
  String get username => '使用者名稱';

  @override
  String userSentUnknownEvent(String username, String type) {
    return '$username 傳送了一個 $type 事件';
  }

  @override
  String get unverified => '尚未驗證';

  @override
  String get verified => '已驗證';

  @override
  String get verify => '驗證';

  @override
  String get verifyStart => '開始驗證';

  @override
  String get verifySuccess => '您成功驗證了！';

  @override
  String get verifyTitle => '正在驗證其他帳號';

  @override
  String get videoCall => '視訊通話';

  @override
  String get visibilityOfTheChatHistory => '聊天室記錄的可見性';

  @override
  String get visibleForAllParticipants => '對所有參與者可見';

  @override
  String get visibleForEveryone => '對所有人可見';

  @override
  String get voiceMessage => '語音訊息';

  @override
  String get waitingPartnerAcceptRequest => '正在等待夥伴接受請求...…';

  @override
  String get waitingPartnerEmoji => '正在等待夥伴接受表情符號...…';

  @override
  String get waitingPartnerNumbers => '正在等待夥伴接受數字...…';

  @override
  String get wallpaper => '桌布：';

  @override
  String get weSentYouAnEmail => '我們向您傳送了一封電子郵件';

  @override
  String get whoIsAllowedToJoinThisGroup => '誰可以加入這個群組';

  @override
  String get withTheseAddressesRecoveryDescription => '有了這些位址，您就可以恢復密碼。';

  @override
  String get writeAMessage => '輸入訊息...…';

  @override
  String get yes => '是';

  @override
  String get you => '您';

  @override
  String get youAreNoLongerParticipatingInThisChat => '您不再參與這個聊天室了';

  @override
  String get youHaveBeenBannedFromThisChat => '您已經被這個聊天室封鎖';

  @override
  String get yourPublicKey => '您的公鑰';

  @override
  String get time => '時間';

  @override
  String get messageType => '訊息類型';

  @override
  String get sender => '傳送者';

  @override
  String get removeFromSpace => '從空間中移除';

  @override
  String get addToSpaceDescription => '選擇一個空間將此聊天室加入。';

  @override
  String get start => '開始';

  @override
  String get publish => '發布';

  @override
  String videoWithSize(String size) {
    return '影片（$size）';
  }

  @override
  String get openChat => '開啟聊天室';

  @override
  String get markAsRead => '標示為已讀';

  @override
  String get reportUser => '舉報使用者';

  @override
  String get dismiss => '解散';

  @override
  String reactedWith(String sender, String reaction) {
    return '$sender 以 $reaction 回應';
  }

  @override
  String get pinMessage => '釘選到房間';

  @override
  String get emojis => '表情符號';

  @override
  String get placeCall => '發起通話';

  @override
  String get voiceCall => '語音通話';

  @override
  String get videoCallsBetaWarning =>
      '請注意，視訊通話目前處於測試階段。它們可能不會按預期工作，或者在所有平台上都不工作。';

  @override
  String get experimentalVideoCalls => '實驗性視訊通話';

  @override
  String get emailOrUsername => '電子郵件或使用者名';

  @override
  String get indexedDbErrorTitle => '私密模式問題';

  @override
  String get indexedDbErrorLong =>
      '預設情況下，私密模式不啟用消息存儲。\n請訪問\n - about:config\n - 將 dom.indexedDB.privateBrowsing.enabled 設定為 true\n否則，無法運行 FluffyChat。';

  @override
  String switchToAccount(String number) {
    return '切換到帳戶 $number';
  }

  @override
  String get nextAccount => '下一個帳戶';

  @override
  String get previousAccount => '上一個帳戶';

  @override
  String get addWidget => '新增小工具';

  @override
  String get widgetVideo => '影片';

  @override
  String get widgetEtherpad => '文字筆記';

  @override
  String get widgetJitsi => 'Jitsi Meet';

  @override
  String get widgetCustom => '自訂';

  @override
  String get widgetName => '名稱';

  @override
  String get widgetUrlError => '這不是一個有效的URL。';

  @override
  String get widgetNameError => '請提供一個顯示名稱。';

  @override
  String get errorAddingWidget => '新增小工具時發生錯誤。';

  @override
  String get youRejectedTheInvitation => '您拒絕了邀請';

  @override
  String get youJoinedTheChat => '您加入了聊天室';

  @override
  String get youAcceptedTheInvitation => '👍 您接受了邀請';

  @override
  String youBannedUser(String user) {
    return '您封鎖了 $user';
  }

  @override
  String youHaveWithdrawnTheInvitationFor(String user) {
    return '您已收回對 $user 的邀請';
  }

  @override
  String youInvitedToBy(String alias) {
    return '📩 您通過網址被邀請至：\n$alias';
  }

  @override
  String invitedBy(String user) {
    return '📩 由 $user 邀請';
  }

  @override
  String youInvitedUser(String user) {
    return '📩 您邀請了 $user';
  }

  @override
  String youKicked(String user) {
    return '👞 您踢出了 $user';
  }

  @override
  String youKickedAndBanned(String user) {
    return '🙅 您踢出並封鎖了 $user';
  }

  @override
  String youUnbannedUser(String user) {
    return '您解除封鎖了 $user';
  }

  @override
  String hasKnocked(String user) {
    return '🚪 $user 敲門了';
  }

  @override
  String userWouldLikeToChangeTheChat(String user) {
    return '$user 想要加入聊天室。';
  }

  @override
  String get noPublicLinkHasBeenCreatedYet => '尚未建立公開網址';

  @override
  String get knock => '敲門';

  @override
  String get users => '使用者';

  @override
  String countFiles(int count) {
    return '$count 個文件';
  }

  @override
  String get user => '使用者';

  @override
  String get custom => '自訂';

  @override
  String get callingPermissions => '通話權限';

  @override
  String get callingAccount => '通話帳戶';

  @override
  String get callingAccountDetails => '允許 FluffyChat 使用原生 Android 撥號應用程式。';

  @override
  String get appearOnTop => '顯示在最上層';

  @override
  String get appearOnTopDetails => '允許應用程式顯示在最上層（如果您已將 Fluffychat 設定為通話帳戶則不需要）';

  @override
  String get otherCallingPermissions => '麥克風、相機和其他 FluffyChat 權限';

  @override
  String get whyIsThisMessageEncrypted => '為什麼這條訊息無法讀取？';

  @override
  String get noKeyForThisMessage =>
      '如果訊息是在您登入此裝置之前傳送的，就可能會發生這種情況。\n\n也有可能是傳送者已經封鎖了您的裝置，或者網絡連接出了問題。\n\n如果您能在另一個會話中讀取該訊息，那麼您可以從中轉移訊息！前往設定 > 裝置，並確保您的裝置已相互驗證。當您下次打開房間且兩個會話都在前景時，密鑰將自動傳輸。\n\n不想在登出或切換裝置時丟失密鑰？請確保您已在設定中啟用了聊天室備份。';

  @override
  String get newSpace => '新空間';

  @override
  String get enterSpace => '進入空間';

  @override
  String get enterRoom => '進入房間';

  @override
  String get allSpaces => '所有空間';

  @override
  String numChats(String number) {
    return '$number 個聊天室';
  }

  @override
  String get hideUnimportantStateEvents => '隱藏不重要的狀態事件';

  @override
  String get doNotShowAgain => '不再顯示';

  @override
  String wasDirectChatDisplayName(String oldDisplayName) {
    return '空的聊天室（原名稱為 $oldDisplayName ）';
  }

  @override
  String get newSpaceDescription => '空間允許您整合您的聊天室並建立私人或公開社群。';

  @override
  String get encryptThisChat => '加密此聊天室';

  @override
  String get disableEncryptionWarning => '出於安全原因，您不能在之前已加密的聊天室中停用加密。';

  @override
  String get sorryThatsNotPossible => '抱歉......這是不可能的';

  @override
  String get deviceKeys => '裝置密鑰：';

  @override
  String get noBackupWarning => '警告！如果不啟用聊天室備份，您將失去對加密訊息的訪問。強烈建議在登出前先啟用聊天室備份。';

  @override
  String get noOtherDevicesFound => '未找到其他裝置';

  @override
  String fileIsTooBigForServer(String max) {
    return '無法發送！該伺服器僅支援最大到 $max 的附件。';
  }

  @override
  String fileHasBeenSavedAt(String path) {
    return '文件已保存在 $path';
  }

  @override
  String get readUpToHere => '讀到這裡';

  @override
  String get openLinkInBrowser => '在瀏覽器中開啟連結';

  @override
  String get reportErrorDescription => '😭 哦不。出了些問題。如果您願意，可以將此錯誤報告給開發者。';

  @override
  String get signInWithPassword => '使用密碼登入';

  @override
  String get pleaseTryAgainLaterOrChooseDifferentServer => '請稍後再試，或選擇不同的伺服器。';

  @override
  String signInWith(String provider) {
    return '使用 $provider 登入';
  }

  @override
  String get profileNotFound => '在伺服器上找不到該使用者。可能是連接問題或該使用者不存在。';

  @override
  String get setTheme => '設定主題：';

  @override
  String get setColorTheme => '設定主題顏色：';

  @override
  String get invite => '邀請';

  @override
  String get inviteGroupChat => '📨 邀請群組聊天室';

  @override
  String get invitePrivateChat => '📨 邀請私人聊天室';

  @override
  String get invalidInput => '無效的輸入！';

  @override
  String wrongPinEntered(int seconds) {
    return '輸入的密碼錯誤！ $seconds 秒後再試一次......';
  }

  @override
  String get pleaseEnterANumber => '請輸入大於 0 的數字';

  @override
  String get banUserDescription => '該使用者將被禁止進入聊天室，直到他們被解封之前都無法再次進入聊天室。';

  @override
  String get unbanUserDescription => '如果該使用者嘗試，他們將能夠再次進入聊天室。';

  @override
  String get kickUserDescription => '該使用者被踢出聊天室，但未被禁止。在公開聊天室中，該使用者可以隨時重新加入。';

  @override
  String get makeAdminDescription =>
      '一旦您讓這個使用者成為管理員，您可能無法撤銷此操作，因為他們將擁有與您相同的權限。';

  @override
  String get pushNotificationsNotAvailable => '推送通知不可用';

  @override
  String get learnMore => '了解更多';

  @override
  String get yourGlobalUserIdIs => '您的全域使用者ID是： ';

  @override
  String noUsersFoundWithQuery(String query) {
    return '很遺憾，找不到與「$query」相符的使用者。請檢查是否有打錯字。';
  }

  @override
  String get knocking => '敲門';

  @override
  String chatCanBeDiscoveredViaSearchOnServer(String server) {
    return '可以透過在 $server 上的搜尋發現聊天室';
  }

  @override
  String get searchChatsRooms => '搜尋 #chats, @users...';

  @override
  String get nothingFound => '什麼都沒找到......';

  @override
  String get createGroupAndInviteUsers => '建立群組並邀請使用者';

  @override
  String get groupCanBeFoundViaSearch => '可以透過搜尋找到群組';

  @override
  String get startConversation => '開始對話';

  @override
  String get commandHint_sendraw => '傳送原始 json';

  @override
  String get databaseMigrationTitle => '資料庫已最佳化';

  @override
  String get databaseMigrationBody => '請稍候。這可能需要一點時間。';

  @override
  String get searchForUsers => '搜尋 @users...';

  @override
  String get pleaseEnterYourCurrentPassword => '請輸入您當前的密碼';

  @override
  String get newPassword => '新密碼';

  @override
  String get pleaseChooseAStrongPassword => '請選擇一個強密碼';

  @override
  String get passwordsDoNotMatch => '密碼不匹配';

  @override
  String get passwordIsWrong => '您輸入的密碼錯誤';

  @override
  String get publicLink => '公開網址';

  @override
  String get publicChatAddresses => '公開聊天室地址';

  @override
  String get createNewAddress => '建立新地址';

  @override
  String get joinSpace => '加入空間';

  @override
  String get publicSpaces => '公共空間';

  @override
  String get addChatOrSubSpace => '新增聊天室或子空間';

  @override
  String get subspace => '子空間';

  @override
  String get thisDevice => '這個裝置：';

  @override
  String get initAppError => '初始化應用時發生錯誤';

  @override
  String get userRole => '使用者角色';

  @override
  String minimumPowerLevel(String level) {
    return '$level 是最低權限等級。';
  }

  @override
  String searchIn(String chat) {
    return '在聊天室「$chat」中搜尋......';
  }

  @override
  String get searchMore => '搜尋更多......';

  @override
  String databaseBuildErrorBody(String url, String error) {
    return '無法建立 SQLite 資料庫。應用程式目前嘗試使用遺留資料庫。請將此錯誤報告給開發人員，網址為 $url。錯誤訊息為：$error';
  }

  @override
  String sessionLostBody(String url, String error) {
    return '您的會話已丟失。請將此錯誤報告給開發人員，網址為 $url。錯誤訊息為：$error';
  }

  @override
  String restoreSessionBody(String url, String error) {
    return '應用程式現在嘗試從備份中恢復您的會話。請將此錯誤報告給開發人員，網址為 $url。錯誤訊息為：$error';
  }

  @override
  String forwardMessageTo(String roomName) {
    return '將訊息轉發至 $roomName？';
  }

  @override
  String get sendReadReceipts => '傳送已讀回條';

  @override
  String get sendTypingNotificationsDescription => '聊天室中的其他參與者可以看到您正在輸入新訊息。';

  @override
  String get sendReadReceiptsDescription => '聊天室中的其他參與者可以看到您已讀取一條訊息。';

  @override
  String get formattedMessages => '格式化訊息';

  @override
  String get formattedMessagesDescription => '使用 markdown 顯示豐富的訊息內容，如粗體文字。';

  @override
  String get verifyOtherUser => '🔐 驗證其他使用者';

  @override
  String get verifyOtherUserDescription =>
      '如果您驗證了另一個使用者，您可以確定您真正與誰通信。💪\n\n當您開始驗證時，您和另一個使用者將在應用程式中看到一個彈出視窗。在那裡，您將看到一系列的表情符號或數字，您需要相互比較。\n\n最好的方式是見面或開始視訊通話。👭';

  @override
  String acceptedKeyVerification(String sender) {
    return '$sender 接受了密鑰驗證';
  }

  @override
  String canceledKeyVerification(String sender) {
    return '$sender 取消了密鑰驗證';
  }

  @override
  String completedKeyVerification(String sender) {
    return '$sender 完成了密鑰驗證';
  }

  @override
  String isReadyForKeyVerification(String sender) {
    return '$sender 已準備好進行密鑰驗證';
  }

  @override
  String requestedKeyVerification(String sender) {
    return '$sender 請求了密鑰驗證';
  }

  @override
  String startedKeyVerification(String sender) {
    return '$sender 開始了密鑰驗證';
  }

  @override
  String get transparent => '透明';

  @override
  String get incomingMessages => '收到的訊息';

  @override
  String get stickers => '貼圖';

  @override
  String get discover => '發現';

  @override
  String get commandHint_ignore => '無視已提供的 Matrix ID';

  @override
  String get commandHint_unignore => '取消無視已提供的 Matrix ID';

  @override
  String unreadChatsInApp(String appname, String unread) {
    return '$appname：$unread 未讀聊天室';
  }

  @override
  String get noDatabaseEncryption => '此平台不支援資料庫加密';

  @override
  String thereAreCountUsersBlocked(Object count) {
    return '目前有 $count 名使用者被封鎖。';
  }

  @override
  String goToSpace(Object space) {
    return '前往空間：$space';
  }

  @override
  String get markAsUnread => '標示為未讀';

  @override
  String userLevel(int level) {
    return '$level - 用戶';
  }

  @override
  String moderatorLevel(int level) {
    return '$level - 管理員';
  }

  @override
  String adminLevel(int level) {
    return '$level - 管理員';
  }

  @override
  String get changeGeneralChatSettings => '變更一般聊天設定';

  @override
  String get inviteOtherUsers => '邀請其他用戶進入本聊天';

  @override
  String get changeTheChatPermissions => '變更聊天室權限';

  @override
  String get changeTheVisibilityOfChatHistory => '變更過往聊天記錄可見度';

  @override
  String get changeTheCanonicalRoomAlias => '變更公開聊天室的主要地址';

  @override
  String get sendRoomNotifications => '傳送一條 @room 群提醒';

  @override
  String get changeTheDescriptionOfTheGroup => '變更聊天室說明';

  @override
  String get chatPermissionsDescription =>
      '定義此聊天中某些操作需要哪個權限等級。 權限等級0、50和100通常代表使用者、版主和管理員，但任何分級都是可能的。';

  @override
  String updateInstalled(String version) {
    return '🎉已成功安裝$version版本!';
  }

  @override
  String get changelog => '變更日誌';

  @override
  String get sendCanceled => '傳送取消';

  @override
  String get loginWithMatrixId => '以Matrix-ID登入';

  @override
  String get discoverHomeservers => '探索歸屬伺服器';

  @override
  String get whatIsAHomeserver => '什麼是歸屬伺服器?';

  @override
  String get homeserverDescription =>
      '您的所有資料都儲存在歸屬伺服器上，就像電子郵件提供商一樣。 您可以選擇要使用的歸屬伺服器，同時您仍然可以與每個人溝通。 請訪問https://server.be-mindpower.net/瞭解更多資訊。';

  @override
  String get doesNotSeemToBeAValidHomeserver => '似乎不是能匹配的歸屬伺服器。伺服器域名打錯了嗎？';

  @override
  String get calculatingFileSize => '正在計算檔案大小…';

  @override
  String get prepareSendingAttachment => '準備傳送附件…';

  @override
  String get sendingAttachment => '附件傳送中…';

  @override
  String get generatingVideoThumbnail => '生成影片縮圖中…';

  @override
  String get compressVideo => '影片壓縮中…';

  @override
  String sendingAttachmentCountOfCount(int index, int length) {
    return '附件傳送中 $index/$length…';
  }

  @override
  String serverLimitReached(int seconds) {
    return '已達伺服器上限! 請稍等$seconds秒…';
  }

  @override
  String get oneOfYourDevicesIsNotVerified => '你的其中一個裝置尚未驗證';

  @override
  String get noticeChatBackupDeviceVerification =>
      '注意：當您將所有裝置連線到聊天備份時，它們會自動驗證。';

  @override
  String get continueText => '繼續';

  @override
  String get welcomeText =>
      '嘿，嘿👋這是FluffyChat。 您可以登入任何與https://server.be-mindpower.net/相容的歸屬伺服器後和任何人聊天。 這是一個巨大的去中心化訊息網路！';

  @override
  String get blur => '模糊:';

  @override
  String get opacity => '不透明度:';

  @override
  String get setWallpaper => '設定背景樣式';

  @override
  String get manageAccount => '帳號管理';

  @override
  String get noContactInformationProvided => '伺服器沒有提供任何有效的聯絡資訊';

  @override
  String get contactServerAdmin => '聯繫伺服器管理員';

  @override
  String get contactServerSecurity => '聯繫伺服器安管';

  @override
  String get supportPage => '幫助頁面';

  @override
  String get serverInformation => '伺服器資訊 ：';

  @override
  String get name => '名稱';

  @override
  String get version => '版本';

  @override
  String get website => '網站';

  @override
  String get compress => '壓縮';

  @override
  String get boldText => '粗體';

  @override
  String get italicText => '斜體';

  @override
  String get strikeThrough => '刪除線';

  @override
  String get invalidUrl => '無效 url';

  @override
  String get addLink => '插入連結';

  @override
  String get unableToJoinChat => '無法加入聊天室。對話可能以被其他方結束。';

  @override
  String get previous => '上一個';

  @override
  String appWantsToUseForLogin(String server) {
    return '使用伺服器「$server 」登入';
  }

  @override
  String get appWantsToUseForLoginDescription => '你特此允許該應用程式和網站分享關於你的信息。';

  @override
  String get open => '打開';

  @override
  String get waitingForServer => '等待伺服器中...';

  @override
  String get appIntroduction =>
      'FluffyChat 讓你和你的朋友跨越工具聊天。在 https://invitation.be-mindpower.net/ 了解更多或*繼續*。';

  @override
  String get newChatRequest => '📩 新的聊天邀請';

  @override
  String get contentNotificationSettings => '內容通知設定';

  @override
  String get generalNotificationSettings => '常規通知設定';

  @override
  String get roomNotificationSettings => '聊天室通知設定';

  @override
  String get userSpecificNotificationSettings => '用戶特定通知設定';

  @override
  String get otherNotificationSettings => '其他通知設定';

  @override
  String get notificationRuleContainsUserName => '包含用户名稱';

  @override
  String get notificationRuleContainsUserNameDescription => '當訊息帶有用户名稱時通知用戶。';

  @override
  String get notificationRuleMaster => '靜音所有通知';

  @override
  String get notificationRuleMasterDescription => '覆蓋所有其他規則並禁止所有通知。';

  @override
  String get notificationRuleSuppressNotices => '隱藏自動化消息';

  @override
  String get notificationRuleSuppressNoticesDescription => '隱藏來自bot等的自動化消息。';

  @override
  String get notificationRuleInviteForMe => '邀請我';

  @override
  String get notificationRuleInviteForMeDescription => '當用户被邀請到聊天室時，通知他們。';

  @override
  String get notificationRuleMemberEvent => '成員事件';

  @override
  String get notificationRuleMemberEventDescription => '隱藏成員事件的通知。';

  @override
  String get notificationRuleIsUserMention => '用户提及';

  @override
  String get notificationRuleIsUserMentionDescription => '被@時通知他們。';

  @override
  String get notificationRuleContainsDisplayName => '包含顯示名稱';

  @override
  String get notificationRuleContainsDisplayNameDescription =>
      '當訊息包含用户的顯示名稱時通知用户。';

  @override
  String get notificationRuleIsRoomMention => '聊天室提及';

  @override
  String get notificationRuleIsRoomMentionDescription => '當有聊天室提及時通知用户。';

  @override
  String get notificationRuleRoomnotif => '聊天室通知';

  @override
  String get notificationRuleRoomnotifDescription => '當訊息包含 \"@room\" 時通知用户。';

  @override
  String get notificationRuleTombstone => '墓碑';

  @override
  String get notificationRuleTombstoneDescription => '通知用户有關房間解散的訊息。';

  @override
  String get notificationRuleReaction => '心情回應';

  @override
  String get notificationRuleReactionDescription => '關閉心情回應通知。';

  @override
  String get notificationRuleRoomServerAcl => '聊天室伺服器 ACL';

  @override
  String get notificationRuleRoomServerAclDescription =>
      '關閉聊天室伺服器存取控制清單 (ACL) 的通知。';

  @override
  String get notificationRuleSuppressEdits => '隱藏編輯';

  @override
  String get notificationRuleSuppressEditsDescription => '隱藏已編輯訊息通知。';

  @override
  String get notificationRuleCall => '來電';

  @override
  String get notificationRuleCallDescription => '通知用户有來電。';

  @override
  String get notificationRuleEncryptedRoomOneToOne => '一對一加密聊天室';

  @override
  String get notificationRuleEncryptedRoomOneToOneDescription =>
      '通知用户一對一加密聊天室的訊息。';

  @override
  String get notificationRuleRoomOneToOne => '一對一聊天室';

  @override
  String get notificationRuleRoomOneToOneDescription => '在一對一聊天室中通知用户收到訊息。';

  @override
  String get notificationRuleMessage => '訊息';

  @override
  String get notificationRuleMessageDescription => '通知用户一般訊息。';

  @override
  String get notificationRuleEncrypted => '已加密';

  @override
  String get notificationRuleEncryptedDescription => '在已加密房間內通知用户訊息。';

  @override
  String get notificationRuleJitsi => 'Jitsi';

  @override
  String get notificationRuleJitsiDescription => '通知用户 Jitsi 小部件事件。';

  @override
  String get notificationRuleServerAcl => '隱藏伺服器 ACL 事件';

  @override
  String get notificationRuleServerAclDescription => '隱藏伺服器 ACL 事件的通知。';

  @override
  String unknownPushRule(String rule) {
    return '未知推送規則 \'$rule\'';
  }

  @override
  String get deletePushRuleCanNotBeUndone => '刪除此通知設定的操作無法復原。';

  @override
  String get more => '更多';

  @override
  String get shareKeysWith => '與哪些設備共享金鑰…';

  @override
  String get shareKeysWithDescription => '選擇應該信任的裝置，並允許它們在加密聊天中讀取您的訊息？';

  @override
  String get allDevices => '所有裝置';

  @override
  String get crossVerifiedDevicesIfEnabled => '交叉驗證裝置（如啟用）';

  @override
  String get crossVerifiedDevices => '經交叉驗證的裝置';

  @override
  String get verifiedDevicesOnly => '僅限已驗證的裝置';

  @override
  String get takeAPhoto => '拍攝照片';

  @override
  String get recordAVideo => '錄製影像';

  @override
  String get optionalMessage => '(可選）訊息...';

  @override
  String get notSupportedOnThisDevice => '此裝置不受支援';

  @override
  String get approve => '核准';

  @override
  String get youHaveKnocked => '您已請求加入';

  @override
  String get pleaseWaitUntilInvited => '直到聊天室裡有人邀請您前，請等候。';
}
