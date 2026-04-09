import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'l10n_ar.dart' deferred as l10n_ar;
import 'l10n_be.dart' deferred as l10n_be;
import 'l10n_bn.dart' deferred as l10n_bn;
import 'l10n_bo.dart' deferred as l10n_bo;
import 'l10n_ca.dart' deferred as l10n_ca;
import 'l10n_cs.dart' deferred as l10n_cs;
import 'l10n_da.dart' deferred as l10n_da;
import 'l10n_de.dart' deferred as l10n_de;
import 'l10n_el.dart' deferred as l10n_el;
import 'l10n_en.dart' deferred as l10n_en;
import 'l10n_eo.dart' deferred as l10n_eo;
import 'l10n_es.dart' deferred as l10n_es;
import 'l10n_et.dart' deferred as l10n_et;
import 'l10n_eu.dart' deferred as l10n_eu;
import 'l10n_fa.dart' deferred as l10n_fa;
import 'l10n_fi.dart' deferred as l10n_fi;
import 'l10n_fil.dart' deferred as l10n_fil;
import 'l10n_fr.dart' deferred as l10n_fr;
import 'l10n_ga.dart' deferred as l10n_ga;
import 'l10n_gl.dart' deferred as l10n_gl;
import 'l10n_he.dart' deferred as l10n_he;
import 'l10n_hi.dart' deferred as l10n_hi;
import 'l10n_hr.dart' deferred as l10n_hr;
import 'l10n_hu.dart' deferred as l10n_hu;
import 'l10n_ia.dart' deferred as l10n_ia;
import 'l10n_id.dart' deferred as l10n_id;
import 'l10n_ie.dart' deferred as l10n_ie;
import 'l10n_it.dart' deferred as l10n_it;
import 'l10n_ja.dart' deferred as l10n_ja;
import 'l10n_ka.dart' deferred as l10n_ka;
import 'l10n_ko.dart' deferred as l10n_ko;
import 'l10n_lt.dart' deferred as l10n_lt;
import 'l10n_lv.dart' deferred as l10n_lv;
import 'l10n_nb.dart' deferred as l10n_nb;
import 'l10n_nl.dart' deferred as l10n_nl;
import 'l10n_pl.dart' deferred as l10n_pl;
import 'l10n_pt.dart' deferred as l10n_pt;
import 'l10n_ro.dart' deferred as l10n_ro;
import 'l10n_ru.dart' deferred as l10n_ru;
import 'l10n_sk.dart' deferred as l10n_sk;
import 'l10n_sl.dart' deferred as l10n_sl;
import 'l10n_sr.dart' deferred as l10n_sr;
import 'l10n_sv.dart' deferred as l10n_sv;
import 'l10n_ta.dart' deferred as l10n_ta;
import 'l10n_te.dart' deferred as l10n_te;
import 'l10n_th.dart' deferred as l10n_th;
import 'l10n_tr.dart' deferred as l10n_tr;
import 'l10n_uk.dart' deferred as l10n_uk;
import 'l10n_vi.dart' deferred as l10n_vi;
import 'l10n_yue.dart' deferred as l10n_yue;
import 'l10n_zh.dart' deferred as l10n_zh;

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of L10n
/// returned by `L10n.of(context)`.
///
/// Applications need to include `L10n.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/l10n.dart';
///
/// return MaterialApp(
///   localizationsDelegates: L10n.localizationsDelegates,
///   supportedLocales: L10n.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the L10n.supportedLocales
/// property.
abstract class L10n {
  L10n(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static L10n of(BuildContext context) {
    return Localizations.of<L10n>(context, L10n)!;
  }

  static const LocalizationsDelegate<L10n> delegate = _L10nDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ar'),
    Locale('be'),
    Locale('bn'),
    Locale('bo'),
    Locale('ca'),
    Locale('cs'),
    Locale('da'),
    Locale('de'),
    Locale('el'),
    Locale('eo'),
    Locale('es'),
    Locale('et'),
    Locale('eu'),
    Locale('fa'),
    Locale('fi'),
    Locale('fil'),
    Locale('fr'),
    Locale('ga'),
    Locale('gl'),
    Locale('he'),
    Locale('hi'),
    Locale('hr'),
    Locale('hu'),
    Locale('ia'),
    Locale('id'),
    Locale('ie'),
    Locale('it'),
    Locale('ja'),
    Locale('ka'),
    Locale('ko'),
    Locale('lt'),
    Locale('lv'),
    Locale('nb'),
    Locale('nl'),
    Locale('pl'),
    Locale('pt'),
    Locale('pt', 'BR'),
    Locale('pt', 'PT'),
    Locale('ro'),
    Locale('ru'),
    Locale('sk'),
    Locale('sl'),
    Locale('sr'),
    Locale('sv'),
    Locale('ta'),
    Locale('te'),
    Locale('th'),
    Locale('tr'),
    Locale('uk'),
    Locale('vi'),
    Locale('yue'),
    Locale('zh'),
    Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant')
  ];

  /// Set to true to always display time of day in 24 hour format.
  ///
  /// In en, this message translates to:
  /// **'false'**
  String get alwaysUse24HourFormat;

  /// No description provided for @repeatPassword.
  ///
  /// In en, this message translates to:
  /// **'Repeat password'**
  String get repeatPassword;

  /// No description provided for @notAnImage.
  ///
  /// In en, this message translates to:
  /// **'Not an image file.'**
  String get notAnImage;

  /// No description provided for @setCustomPermissionLevel.
  ///
  /// In en, this message translates to:
  /// **'Set custom permission level'**
  String get setCustomPermissionLevel;

  /// No description provided for @setPermissionsLevelDescription.
  ///
  /// In en, this message translates to:
  /// **'Please choose a predefined role below or enter a custom permission level between 0 and 100.'**
  String get setPermissionsLevelDescription;

  /// No description provided for @ignoreUser.
  ///
  /// In en, this message translates to:
  /// **'Ignore user'**
  String get ignoreUser;

  /// No description provided for @normalUser.
  ///
  /// In en, this message translates to:
  /// **'Normal user'**
  String get normalUser;

  /// No description provided for @remove.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get remove;

  /// No description provided for @importNow.
  ///
  /// In en, this message translates to:
  /// **'Import now'**
  String get importNow;

  /// No description provided for @importEmojis.
  ///
  /// In en, this message translates to:
  /// **'Import Emojis'**
  String get importEmojis;

  /// No description provided for @importFromZipFile.
  ///
  /// In en, this message translates to:
  /// **'Import from .zip file'**
  String get importFromZipFile;

  /// No description provided for @exportEmotePack.
  ///
  /// In en, this message translates to:
  /// **'Export Emote pack as .zip'**
  String get exportEmotePack;

  /// No description provided for @replace.
  ///
  /// In en, this message translates to:
  /// **'Replace'**
  String get replace;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @aboutHomeserver.
  ///
  /// In en, this message translates to:
  /// **'About {homeserver}'**
  String aboutHomeserver(String homeserver);

  /// No description provided for @accept.
  ///
  /// In en, this message translates to:
  /// **'Accept'**
  String get accept;

  /// No description provided for @acceptedTheInvitation.
  ///
  /// In en, this message translates to:
  /// **' {username} accepted the invitation'**
  String acceptedTheInvitation(String username);

  /// No description provided for @account.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get account;

  /// No description provided for @activatedEndToEndEncryption.
  ///
  /// In en, this message translates to:
  /// **'  {username} activated end to end encryption'**
  String activatedEndToEndEncryption(String username);

  /// No description provided for @addEmail.
  ///
  /// In en, this message translates to:
  /// **'Add email'**
  String get addEmail;

  /// No description provided for @confirmMatrixId.
  ///
  /// In en, this message translates to:
  /// **'Please confirm your Matrix ID in order to delete your account.'**
  String get confirmMatrixId;

  /// No description provided for @supposedMxid.
  ///
  /// In en, this message translates to:
  /// **'This should be {mxid}'**
  String supposedMxid(String mxid);

  /// No description provided for @addChatDescription.
  ///
  /// In en, this message translates to:
  /// **'Add a chat description...'**
  String get addChatDescription;

  /// No description provided for @addToSpace.
  ///
  /// In en, this message translates to:
  /// **'Add to space'**
  String get addToSpace;

  /// No description provided for @admin.
  ///
  /// In en, this message translates to:
  /// **'Admin'**
  String get admin;

  /// No description provided for @alias.
  ///
  /// In en, this message translates to:
  /// **'alias'**
  String get alias;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @allChats.
  ///
  /// In en, this message translates to:
  /// **'All Chats'**
  String get allChats;

  /// No description provided for @commandHint_roomupgrade.
  ///
  /// In en, this message translates to:
  /// **'Upgrade this room to the given room version'**
  String get commandHint_roomupgrade;

  /// No description provided for @commandHint_googly.
  ///
  /// In en, this message translates to:
  /// **'Send some googly eyes'**
  String get commandHint_googly;

  /// No description provided for @commandHint_cuddle.
  ///
  /// In en, this message translates to:
  /// **'Send a cuddle'**
  String get commandHint_cuddle;

  /// No description provided for @commandHint_hug.
  ///
  /// In en, this message translates to:
  /// **'Send a hug'**
  String get commandHint_hug;

  /// No description provided for @googlyEyesContent.
  ///
  /// In en, this message translates to:
  /// **'{senderName} sends you googly eyes'**
  String googlyEyesContent(String senderName);

  /// No description provided for @cuddleContent.
  ///
  /// In en, this message translates to:
  /// **'{senderName} cuddles you'**
  String cuddleContent(String senderName);

  /// No description provided for @hugContent.
  ///
  /// In en, this message translates to:
  /// **'{senderName} hugs you'**
  String hugContent(String senderName);

  /// No description provided for @answeredTheCall.
  ///
  /// In en, this message translates to:
  /// **'{senderName} answered the call'**
  String answeredTheCall(String senderName);

  /// No description provided for @anyoneCanJoin.
  ///
  /// In en, this message translates to:
  /// **'Anyone can join'**
  String get anyoneCanJoin;

  /// No description provided for @appLock.
  ///
  /// In en, this message translates to:
  /// **'App lock'**
  String get appLock;

  /// No description provided for @appLockDescription.
  ///
  /// In en, this message translates to:
  /// **'Lock the app when not using with a pin code'**
  String get appLockDescription;

  /// No description provided for @archive.
  ///
  /// In en, this message translates to:
  /// **'Archive'**
  String get archive;

  /// No description provided for @unArchive.
  ///
  /// In en, this message translates to:
  /// **'Unarchive'**
  String get unArchive;

  /// No description provided for @areGuestsAllowedToJoin.
  ///
  /// In en, this message translates to:
  /// **'Are guest users allowed to join'**
  String get areGuestsAllowedToJoin;

  /// No description provided for @areYouSure.
  ///
  /// In en, this message translates to:
  /// **'Are you sure?'**
  String get areYouSure;

  /// No description provided for @areYouSureYouWantToLogout.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to log out?'**
  String get areYouSureYouWantToLogout;

  /// No description provided for @askSSSSSign.
  ///
  /// In en, this message translates to:
  /// **'To be able to sign the other person, please enter your secure store passphrase or recovery key.'**
  String get askSSSSSign;

  /// No description provided for @askVerificationRequest.
  ///
  /// In en, this message translates to:
  /// **'Accept this verification request from {username}?'**
  String askVerificationRequest(String username);

  /// No description provided for @autoplayImages.
  ///
  /// In en, this message translates to:
  /// **'Automatically play animated stickers and emotes'**
  String get autoplayImages;

  /// No description provided for @badServerLoginTypesException.
  ///
  /// In en, this message translates to:
  /// **'The homeserver supports the login types:\n{serverVersions}\nBut this app supports only:\n{supportedVersions}'**
  String badServerLoginTypesException(
      String serverVersions, String supportedVersions, Object suportedVersions);

  /// No description provided for @sendTypingNotifications.
  ///
  /// In en, this message translates to:
  /// **'Send typing notifications'**
  String get sendTypingNotifications;

  /// No description provided for @swipeRightToLeftToReply.
  ///
  /// In en, this message translates to:
  /// **'Swipe right to left to reply'**
  String get swipeRightToLeftToReply;

  /// No description provided for @alwaysShowMessageTimestamps.
  ///
  /// In en, this message translates to:
  /// **'Always Show Message Timestamps'**
  String get alwaysShowMessageTimestamps;

  /// No description provided for @alwaysShowMessageTimestampsDescription.
  ///
  /// In en, this message translates to:
  /// **'Show timestamps for every message like WhatsApp'**
  String get alwaysShowMessageTimestampsDescription;

  /// No description provided for @attachmentCamera.
  ///
  /// In en, this message translates to:
  /// **'Camera'**
  String get attachmentCamera;

  /// No description provided for @attachmentGallery.
  ///
  /// In en, this message translates to:
  /// **'Gallery'**
  String get attachmentGallery;

  /// No description provided for @attachmentDocument.
  ///
  /// In en, this message translates to:
  /// **'Document'**
  String get attachmentDocument;

  /// No description provided for @attachmentLocation.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get attachmentLocation;

  /// No description provided for @attachmentContact.
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get attachmentContact;

  /// No description provided for @attachmentSend.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get attachmentSend;

  /// No description provided for @attachmentRequest.
  ///
  /// In en, this message translates to:
  /// **'Request'**
  String get attachmentRequest;

  /// No description provided for @attachmentQR.
  ///
  /// In en, this message translates to:
  /// **'QR'**
  String get attachmentQR;

  /// No description provided for @attachmentGift.
  ///
  /// In en, this message translates to:
  /// **'Gift'**
  String get attachmentGift;

  /// No description provided for @attachmentFavorite.
  ///
  /// In en, this message translates to:
  /// **'Favorite'**
  String get attachmentFavorite;

  /// No description provided for @sendOnEnter.
  ///
  /// In en, this message translates to:
  /// **'Send on enter'**
  String get sendOnEnter;

  /// No description provided for @badServerVersionsException.
  ///
  /// In en, this message translates to:
  /// **'The homeserver supports the Spec versions:\n{serverVersions}\nBut this app supports only {supportedVersions}'**
  String badServerVersionsException(
      String serverVersions,
      String supportedVersions,
      Object serverVerions,
      Object supoortedVersions,
      Object suportedVersions);

  /// No description provided for @countChatsAndCountParticipants.
  ///
  /// In en, this message translates to:
  /// **'{chats} chats and {participants} participants'**
  String countChatsAndCountParticipants(int chats, int participants);

  /// No description provided for @countMembers.
  ///
  /// In en, this message translates to:
  /// **'{count} Members'**
  String countMembers(int count);

  /// No description provided for @noMoreChatsFound.
  ///
  /// In en, this message translates to:
  /// **'No more chats found...'**
  String get noMoreChatsFound;

  /// No description provided for @noChatsFoundHere.
  ///
  /// In en, this message translates to:
  /// **'No chats found here yet. Start a new chat with someone by using the button below. â¤µï¸'**
  String get noChatsFoundHere;

  /// No description provided for @joinedChats.
  ///
  /// In en, this message translates to:
  /// **'Joined chats'**
  String get joinedChats;

  /// No description provided for @unread.
  ///
  /// In en, this message translates to:
  /// **'Unread'**
  String get unread;

  /// No description provided for @space.
  ///
  /// In en, this message translates to:
  /// **'Space'**
  String get space;

  /// No description provided for @spaces.
  ///
  /// In en, this message translates to:
  /// **'Spaces'**
  String get spaces;

  /// No description provided for @banFromChat.
  ///
  /// In en, this message translates to:
  /// **'Ban from chat'**
  String get banFromChat;

  /// No description provided for @banned.
  ///
  /// In en, this message translates to:
  /// **'Banned'**
  String get banned;

  /// No description provided for @bannedUser.
  ///
  /// In en, this message translates to:
  /// **'{username} banned {targetName}'**
  String bannedUser(String username, String targetName);

  /// No description provided for @blockDevice.
  ///
  /// In en, this message translates to:
  /// **'Block Device'**
  String get blockDevice;

  /// No description provided for @blocked.
  ///
  /// In en, this message translates to:
  /// **'Blocked'**
  String get blocked;

  /// No description provided for @botMessages.
  ///
  /// In en, this message translates to:
  /// **'Bot messages'**
  String get botMessages;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @cantOpenUri.
  ///
  /// In en, this message translates to:
  /// **'Can\'t open the URI {uri}'**
  String cantOpenUri(String uri);

  /// No description provided for @changeDeviceName.
  ///
  /// In en, this message translates to:
  /// **'Change device name'**
  String get changeDeviceName;

  /// No description provided for @changedTheChatAvatar.
  ///
  /// In en, this message translates to:
  /// **'{username} changed the chat avatar'**
  String changedTheChatAvatar(String username);

  /// No description provided for @changedTheChatDescriptionTo.
  ///
  /// In en, this message translates to:
  /// **'{username} changed the chat description to: \'{description}\''**
  String changedTheChatDescriptionTo(String username, String description);

  /// No description provided for @changedTheChatNameTo.
  ///
  /// In en, this message translates to:
  /// **'{username} changed the chat name to: \'{chatname}\''**
  String changedTheChatNameTo(String username, String chatname);

  /// No description provided for @changedTheChatPermissions.
  ///
  /// In en, this message translates to:
  /// **'{username} changed the chat permissions'**
  String changedTheChatPermissions(String username);

  /// No description provided for @changedTheDisplaynameTo.
  ///
  /// In en, this message translates to:
  /// **'{username} changed their displayname to: \'{displayname}\''**
  String changedTheDisplaynameTo(String username, String displayname);

  /// No description provided for @changedTheGuestAccessRules.
  ///
  /// In en, this message translates to:
  /// **'{username} changed the guest access rules'**
  String changedTheGuestAccessRules(String username);

  /// No description provided for @changedTheGuestAccessRulesTo.
  ///
  /// In en, this message translates to:
  /// **'{username} changed the guest access rules to: {rules}'**
  String changedTheGuestAccessRulesTo(String username, String rules);

  /// No description provided for @changedTheHistoryVisibility.
  ///
  /// In en, this message translates to:
  /// **'{username} changed the history visibility'**
  String changedTheHistoryVisibility(String username);

  /// No description provided for @changedTheHistoryVisibilityTo.
  ///
  /// In en, this message translates to:
  /// **'{username} changed the history visibility to: {rules}'**
  String changedTheHistoryVisibilityTo(String username, String rules);

  /// No description provided for @changedTheJoinRules.
  ///
  /// In en, this message translates to:
  /// **'{username} changed the join rules'**
  String changedTheJoinRules(String username);

  /// No description provided for @changedTheJoinRulesTo.
  ///
  /// In en, this message translates to:
  /// **'{username} changed the join rules to: {joinRules}'**
  String changedTheJoinRulesTo(String username, String joinRules);

  /// No description provided for @changedTheProfileAvatar.
  ///
  /// In en, this message translates to:
  /// **'{username} changed their avatar'**
  String changedTheProfileAvatar(String username);

  /// No description provided for @changedTheRoomAliases.
  ///
  /// In en, this message translates to:
  /// **'{username} changed the room aliases'**
  String changedTheRoomAliases(String username);

  /// No description provided for @changedTheRoomInvitationLink.
  ///
  /// In en, this message translates to:
  /// **'{username} changed the invitation link'**
  String changedTheRoomInvitationLink(String username);

  /// No description provided for @changePassword.
  ///
  /// In en, this message translates to:
  /// **'Change password'**
  String get changePassword;

  /// No description provided for @changeTheHomeserver.
  ///
  /// In en, this message translates to:
  /// **'Change the homeserver'**
  String get changeTheHomeserver;

  /// No description provided for @changeTheme.
  ///
  /// In en, this message translates to:
  /// **'Change your style'**
  String get changeTheme;

  /// No description provided for @changeTheNameOfTheGroup.
  ///
  /// In en, this message translates to:
  /// **'Change the name of the group'**
  String get changeTheNameOfTheGroup;

  /// No description provided for @changeYourAvatar.
  ///
  /// In en, this message translates to:
  /// **'Change your avatar'**
  String get changeYourAvatar;

  /// No description provided for @channelCorruptedDecryptError.
  ///
  /// In en, this message translates to:
  /// **'The encryption has been corrupted'**
  String get channelCorruptedDecryptError;

  /// No description provided for @chat.
  ///
  /// In en, this message translates to:
  /// **'Chat'**
  String get chat;

  /// No description provided for @yourChatBackupHasBeenSetUp.
  ///
  /// In en, this message translates to:
  /// **'Your chat backup has been set up.'**
  String get yourChatBackupHasBeenSetUp;

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get welcome;

  /// No description provided for @welcomeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'To an unprecedented experience'**
  String get welcomeSubtitle;

  /// No description provided for @welcomeDescription.
  ///
  /// In en, this message translates to:
  /// **'Here you don\'t just have an app. You have your world in the palm of your hand: connect, buy, pay, explore and transform your day... without leaving Bemind'**
  String get welcomeDescription;

  /// No description provided for @getStarted.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get getStarted;

  /// No description provided for @chatTitle.
  ///
  /// In en, this message translates to:
  /// **'Chat'**
  String get chatTitle;

  /// No description provided for @chatSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Chat, share, and pay all in one place.'**
  String get chatSubtitle;

  /// No description provided for @chatDescription.
  ///
  /// In en, this message translates to:
  /// **'Chat description'**
  String get chatDescription;

  /// No description provided for @goToChat.
  ///
  /// In en, this message translates to:
  /// **'Go to Chat'**
  String get goToChat;

  /// No description provided for @financeTitle.
  ///
  /// In en, this message translates to:
  /// **'Finance'**
  String get financeTitle;

  /// No description provided for @financeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Your money, hassle-free.'**
  String get financeSubtitle;

  /// No description provided for @financeDescription.
  ///
  /// In en, this message translates to:
  /// **'Send, receive, convert, pay with QR, or add funds all in one place. No - hassle. No surprises.'**
  String get financeDescription;

  /// No description provided for @goToWallet.
  ///
  /// In en, this message translates to:
  /// **'Go to Wallet'**
  String get goToWallet;

  /// No description provided for @marketplaceTitle.
  ///
  /// In en, this message translates to:
  /// **'Marketplace'**
  String get marketplaceTitle;

  /// No description provided for @marketplaceSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Shop without searching, find what you need.'**
  String get marketplaceSubtitle;

  /// No description provided for @marketplaceDescription.
  ///
  /// In en, this message translates to:
  /// **'Products, services, and experiences curated for you. Real prices, no strings attached, and all paid for with your wallet, right from the app.'**
  String get marketplaceDescription;

  /// No description provided for @goToMarketplace.
  ///
  /// In en, this message translates to:
  /// **'Go to Marketplace'**
  String get goToMarketplace;

  /// No description provided for @appsTitle.
  ///
  /// In en, this message translates to:
  /// **'Apps'**
  String get appsTitle;

  /// No description provided for @appsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Your favorite apps, already integrated.'**
  String get appsSubtitle;

  /// No description provided for @appsDescription.
  ///
  /// In en, this message translates to:
  /// **'Delivery, shipping, subscriptions, reservations… All in one tap. They\'re here, ready for you.'**
  String get appsDescription;

  /// No description provided for @goToApps.
  ///
  /// In en, this message translates to:
  /// **'Go to Apps'**
  String get goToApps;

  /// No description provided for @communitiesTitle.
  ///
  /// In en, this message translates to:
  /// **'Communities'**
  String get communitiesTitle;

  /// No description provided for @communitiesSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Connect, share and create.'**
  String get communitiesSubtitle;

  /// No description provided for @communitiesDescription.
  ///
  /// In en, this message translates to:
  /// **'Explore other people\'s content, post your own. This isn\'t just about social media… it\'s about your voice, it\'s about you in the digital world.'**
  String get communitiesDescription;

  /// No description provided for @goToCommunity.
  ///
  /// In en, this message translates to:
  /// **'Go to Community'**
  String get goToCommunity;

  /// No description provided for @music.
  ///
  /// In en, this message translates to:
  /// **'Music'**
  String get music;

  /// No description provided for @yourRhythmYourSpace.
  ///
  /// In en, this message translates to:
  /// **'Your rhythm, your space'**
  String get yourRhythmYourSpace;

  /// No description provided for @musicDescription.
  ///
  /// In en, this message translates to:
  /// **'Discover, listen, and share music that moves you. Create playlists, follow artists, and let the rhythm be part of your daily experience.'**
  String get musicDescription;

  /// No description provided for @mentalHealth.
  ///
  /// In en, this message translates to:
  /// **'Mental Health'**
  String get mentalHealth;

  /// No description provided for @yourPeaceAlsoMatters.
  ///
  /// In en, this message translates to:
  /// **'Your peace also matters'**
  String get yourPeaceAlsoMatters;

  /// No description provided for @mentalHealthDescription.
  ///
  /// In en, this message translates to:
  /// **'Tools and resources for your emotional well-being. Meditation, mindfulness exercises, and professional support when you need it most.'**
  String get mentalHealthDescription;

  /// No description provided for @aiFinance.
  ///
  /// In en, this message translates to:
  /// **'AI Finance'**
  String get aiFinance;

  /// No description provided for @letMoneyThinkToo.
  ///
  /// In en, this message translates to:
  /// **'Let money think too'**
  String get letMoneyThinkToo;

  /// No description provided for @aiFinanceDescription.
  ///
  /// In en, this message translates to:
  /// **'Artificial intelligence that helps you make smarter financial decisions. Automatic analysis, personalized recommendations, and predictive insights.'**
  String get aiFinanceDescription;

  /// No description provided for @nutrition.
  ///
  /// In en, this message translates to:
  /// **'Nutrition'**
  String get nutrition;

  /// No description provided for @eatWithoutComplications.
  ///
  /// In en, this message translates to:
  /// **'Eat without complications'**
  String get eatWithoutComplications;

  /// No description provided for @nutritionDescription.
  ///
  /// In en, this message translates to:
  /// **'Personalized meal plans, nutritional tracking, and healthy recipes. Take care of your body with smart, simple nutrition.'**
  String get nutritionDescription;

  /// No description provided for @accessDenied.
  ///
  /// In en, this message translates to:
  /// **'Access Denied'**
  String get accessDenied;

  /// No description provided for @searchError.
  ///
  /// In en, this message translates to:
  /// **'Search Error'**
  String get searchError;

  /// No description provided for @accessRequired.
  ///
  /// In en, this message translates to:
  /// **'Access Required'**
  String get accessRequired;

  /// No description provided for @cameraAccessRequired.
  ///
  /// In en, this message translates to:
  /// **'Camera access is required for KYC document verification. Please enable camera permission in app settings.'**
  String get cameraAccessRequired;

  /// No description provided for @openSettings.
  ///
  /// In en, this message translates to:
  /// **'Open Settings'**
  String get openSettings;

  /// No description provided for @success.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get success;

  /// No description provided for @info.
  ///
  /// In en, this message translates to:
  /// **'Info'**
  String get info;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;

  /// No description provided for @joinMeOnBeMindPower.
  ///
  /// In en, this message translates to:
  /// **'Join me on Be MindPower!'**
  String get joinMeOnBeMindPower;

  /// No description provided for @inviteMessageBody.
  ///
  /// In en, this message translates to:
  /// **'Hi, I\'m {displayName} and I\'d like to invite you to chat with me on Be MindPower.'**
  String inviteMessageBody(String displayName);

  /// No description provided for @downloadTheApp.
  ///
  /// In en, this message translates to:
  /// **'Download the app: {url}'**
  String downloadTheApp(String url);

  /// No description provided for @beMindPowerTagline.
  ///
  /// In en, this message translates to:
  /// **'Be MindPower - Connect, Chat, and Grow Together!'**
  String get beMindPowerTagline;

  /// No description provided for @failedToCreateInvite.
  ///
  /// In en, this message translates to:
  /// **'Failed to create invite: {error}'**
  String failedToCreateInvite(String error);

  /// No description provided for @emailVerification.
  ///
  /// In en, this message translates to:
  /// **'Email Verification'**
  String get emailVerification;

  /// No description provided for @verifyingYourEmail.
  ///
  /// In en, this message translates to:
  /// **'Verifying your email...'**
  String get verifyingYourEmail;

  /// No description provided for @pleaseWaitWhileWeCompleteRegistration.
  ///
  /// In en, this message translates to:
  /// **'Please wait while we complete your registration.'**
  String get pleaseWaitWhileWeCompleteRegistration;

  /// No description provided for @registrationComplete.
  ///
  /// In en, this message translates to:
  /// **'Registration Complete!'**
  String get registrationComplete;

  /// No description provided for @emailVerifiedAndAutoLoginSuccessful.
  ///
  /// In en, this message translates to:
  /// **'Email verified and auto-login successful.\nRedirecting to your dashboard...'**
  String get emailVerifiedAndAutoLoginSuccessful;

  /// No description provided for @verificationFailed.
  ///
  /// In en, this message translates to:
  /// **'Verification failed'**
  String get verificationFailed;

  /// No description provided for @tryAgain.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get tryAgain;

  /// No description provided for @emailVerifiedRedirecting.
  ///
  /// In en, this message translates to:
  /// **'Email verified! Redirecting to login...'**
  String get emailVerifiedRedirecting;

  /// No description provided for @emailVerificationFailedTryAgain.
  ///
  /// In en, this message translates to:
  /// **'Email verification failed. Please try again.'**
  String get emailVerificationFailedTryAgain;

  /// No description provided for @verificationError.
  ///
  /// In en, this message translates to:
  /// **'Verification Error'**
  String get verificationError;

  /// No description provided for @goToLogin.
  ///
  /// In en, this message translates to:
  /// **'Go to Login'**
  String get goToLogin;

  /// No description provided for @pleaseLogInToAccessArchive.
  ///
  /// In en, this message translates to:
  /// **'Please log in to access archive'**
  String get pleaseLogInToAccessArchive;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// No description provided for @errorAccessingArchive.
  ///
  /// In en, this message translates to:
  /// **'Error accessing archive'**
  String get errorAccessingArchive;

  /// No description provided for @contacts.
  ///
  /// In en, this message translates to:
  /// **'Contacts'**
  String get contacts;

  /// No description provided for @filter.
  ///
  /// In en, this message translates to:
  /// **'Filter'**
  String get filter;

  /// No description provided for @unreadChat.
  ///
  /// In en, this message translates to:
  /// **'Unread Chat'**
  String get unreadChat;

  /// No description provided for @noResultsFound.
  ///
  /// In en, this message translates to:
  /// **'No results found'**
  String get noResultsFound;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @select.
  ///
  /// In en, this message translates to:
  /// **'Select'**
  String get select;

  /// No description provided for @markRead.
  ///
  /// In en, this message translates to:
  /// **'Mark Read'**
  String get markRead;

  /// No description provided for @markUnread.
  ///
  /// In en, this message translates to:
  /// **'Mark Unread'**
  String get markUnread;

  /// No description provided for @blockUser.
  ///
  /// In en, this message translates to:
  /// **'Block User'**
  String get blockUser;

  /// No description provided for @read.
  ///
  /// In en, this message translates to:
  /// **'Read'**
  String get read;

  /// No description provided for @myWallet.
  ///
  /// In en, this message translates to:
  /// **'My Wallet'**
  String get myWallet;

  /// No description provided for @myBank.
  ///
  /// In en, this message translates to:
  /// **'My Bank'**
  String get myBank;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @favorites.
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get favorites;

  /// No description provided for @unfavorite.
  ///
  /// In en, this message translates to:
  /// **'Unfavorite'**
  String get unfavorite;

  /// No description provided for @noFavoritesYet.
  ///
  /// In en, this message translates to:
  /// **'No favorites yet'**
  String get noFavoritesYet;

  /// No description provided for @starMessagesToAddFavorites.
  ///
  /// In en, this message translates to:
  /// **'Star messages to add them to favorites'**
  String get starMessagesToAddFavorites;

  /// No description provided for @removedFromFavorites.
  ///
  /// In en, this message translates to:
  /// **'Removed from favorites'**
  String get removedFromFavorites;

  /// No description provided for @unknownRoom.
  ///
  /// In en, this message translates to:
  /// **'Unknown room'**
  String get unknownRoom;

  /// No description provided for @unknownTime.
  ///
  /// In en, this message translates to:
  /// **'Unknown time'**
  String get unknownTime;

  /// No description provided for @errorWithMessage.
  ///
  /// In en, this message translates to:
  /// **'Error: {message}'**
  String errorWithMessage(String message);

  /// No description provided for @newMessage.
  ///
  /// In en, this message translates to:
  /// **'New Message'**
  String get newMessage;

  /// No description provided for @searchUsers.
  ///
  /// In en, this message translates to:
  /// **'Search @users...'**
  String get searchUsers;

  /// No description provided for @yourGlobalUsernameIs.
  ///
  /// In en, this message translates to:
  /// **'Your global username is: @{username}'**
  String yourGlobalUsernameIs(String username);

  /// No description provided for @invitationLink.
  ///
  /// In en, this message translates to:
  /// **'Invitation link'**
  String get invitationLink;

  /// No description provided for @sendLinkToChat.
  ///
  /// In en, this message translates to:
  /// **'Send a link to chat.'**
  String get sendLinkToChat;

  /// No description provided for @createGroupChat.
  ///
  /// In en, this message translates to:
  /// **'Create a group chat.'**
  String get createGroupChat;

  /// No description provided for @scanQRCode.
  ///
  /// In en, this message translates to:
  /// **'Scan a QR code.'**
  String get scanQRCode;

  /// No description provided for @scanQRCodeDescription.
  ///
  /// In en, this message translates to:
  /// **'Scan a QR code.'**
  String get scanQRCodeDescription;

  /// No description provided for @errorSearchingUsers.
  ///
  /// In en, this message translates to:
  /// **'Error searching users'**
  String get errorSearchingUsers;

  /// No description provided for @noUsersFound.
  ///
  /// In en, this message translates to:
  /// **'No users found'**
  String get noUsersFound;

  /// No description provided for @permissionDenied.
  ///
  /// In en, this message translates to:
  /// **'Permission Denied'**
  String get permissionDenied;

  /// No description provided for @searchContact.
  ///
  /// In en, this message translates to:
  /// **'Search contact'**
  String get searchContact;

  /// No description provided for @noContactsFound.
  ///
  /// In en, this message translates to:
  /// **'No contacts found'**
  String get noContactsFound;

  /// No description provided for @group.
  ///
  /// In en, this message translates to:
  /// **'Group'**
  String get group;

  /// No description provided for @calls.
  ///
  /// In en, this message translates to:
  /// **'Calls'**
  String get calls;

  /// No description provided for @done.
  ///
  /// In en, this message translates to:
  /// **'Done!'**
  String get done;

  /// No description provided for @taskCompletedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Task is completed\nsuccessfully'**
  String get taskCompletedSuccessfully;

  /// No description provided for @goBack.
  ///
  /// In en, this message translates to:
  /// **'Go Back'**
  String get goBack;

  /// No description provided for @signupSuccessMessage.
  ///
  /// In en, this message translates to:
  /// **'You\'ve signed up \nsuccessfully'**
  String get signupSuccessMessage;

  /// No description provided for @chatBackup.
  ///
  /// In en, this message translates to:
  /// **'Chat backup'**
  String get chatBackup;

  /// No description provided for @chatBackupDescription.
  ///
  /// In en, this message translates to:
  /// **'Your old messages are secured with a recovery key. Please make sure you don\'t lose it.'**
  String get chatBackupDescription;

  /// No description provided for @chatDetails.
  ///
  /// In en, this message translates to:
  /// **'Chat details'**
  String get chatDetails;

  /// No description provided for @chatHasBeenAddedToThisSpace.
  ///
  /// In en, this message translates to:
  /// **'Chat has been added to this space'**
  String get chatHasBeenAddedToThisSpace;

  /// No description provided for @chats.
  ///
  /// In en, this message translates to:
  /// **'Chats'**
  String get chats;

  /// No description provided for @chooseAStrongPassword.
  ///
  /// In en, this message translates to:
  /// **'Choose a strong password'**
  String get chooseAStrongPassword;

  /// No description provided for @clearArchive.
  ///
  /// In en, this message translates to:
  /// **'Clear archive'**
  String get clearArchive;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @commandHint_markasdm.
  ///
  /// In en, this message translates to:
  /// **'Mark as direct message room for the giving Matrix ID'**
  String get commandHint_markasdm;

  /// No description provided for @commandHint_markasgroup.
  ///
  /// In en, this message translates to:
  /// **'Mark as group'**
  String get commandHint_markasgroup;

  /// Usage hint for the command /ban
  ///
  /// In en, this message translates to:
  /// **'Ban the given user from this room'**
  String get commandHint_ban;

  /// Usage hint for the command /clearcache
  ///
  /// In en, this message translates to:
  /// **'Clear cache'**
  String get commandHint_clearcache;

  /// Usage hint for the command /create
  ///
  /// In en, this message translates to:
  /// **'Create an empty group chat\nUse --no-encryption to disable encryption'**
  String get commandHint_create;

  /// Usage hint for the command /discardsession
  ///
  /// In en, this message translates to:
  /// **'Discard session'**
  String get commandHint_discardsession;

  /// Usage hint for the command /dm
  ///
  /// In en, this message translates to:
  /// **'Start a direct chat\nUse --no-encryption to disable encryption'**
  String get commandHint_dm;

  /// Usage hint for the command /html
  ///
  /// In en, this message translates to:
  /// **'Send HTML-formatted text'**
  String get commandHint_html;

  /// Usage hint for the command /invite
  ///
  /// In en, this message translates to:
  /// **'Invite the given user to this room'**
  String get commandHint_invite;

  /// Usage hint for the command /join
  ///
  /// In en, this message translates to:
  /// **'Join the given room'**
  String get commandHint_join;

  /// Usage hint for the command /kick
  ///
  /// In en, this message translates to:
  /// **'Remove the given user from this room'**
  String get commandHint_kick;

  /// Usage hint for the command /leave
  ///
  /// In en, this message translates to:
  /// **'Leave this room'**
  String get commandHint_leave;

  /// Usage hint for the command /me
  ///
  /// In en, this message translates to:
  /// **'Describe yourself'**
  String get commandHint_me;

  /// Usage hint for the command /myroomavatar
  ///
  /// In en, this message translates to:
  /// **'Set your picture for this room (by mxc-uri)'**
  String get commandHint_myroomavatar;

  /// Usage hint for the command /myroomnick
  ///
  /// In en, this message translates to:
  /// **'Set your display name for this room'**
  String get commandHint_myroomnick;

  /// Usage hint for the command /op
  ///
  /// In en, this message translates to:
  /// **'Set the given user\'s power level (default: 50)'**
  String get commandHint_op;

  /// Usage hint for the command /plain
  ///
  /// In en, this message translates to:
  /// **'Send unformatted text'**
  String get commandHint_plain;

  /// Usage hint for the command /react
  ///
  /// In en, this message translates to:
  /// **'Send reply as a reaction'**
  String get commandHint_react;

  /// Usage hint for the command /send
  ///
  /// In en, this message translates to:
  /// **'Send text'**
  String get commandHint_send;

  /// Usage hint for the command /unban
  ///
  /// In en, this message translates to:
  /// **'Unban the given user from this room'**
  String get commandHint_unban;

  /// No description provided for @commandInvalid.
  ///
  /// In en, this message translates to:
  /// **'Command invalid'**
  String get commandInvalid;

  /// State that {command} is not a valid /command.
  ///
  /// In en, this message translates to:
  /// **'{command} is not a command.'**
  String commandMissing(String command);

  /// No description provided for @compareEmojiMatch.
  ///
  /// In en, this message translates to:
  /// **'Please compare the emojis'**
  String get compareEmojiMatch;

  /// No description provided for @compareNumbersMatch.
  ///
  /// In en, this message translates to:
  /// **'Please compare the numbers'**
  String get compareNumbersMatch;

  /// No description provided for @configureChat.
  ///
  /// In en, this message translates to:
  /// **'Configure chat'**
  String get configureChat;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @connect.
  ///
  /// In en, this message translates to:
  /// **'Connect'**
  String get connect;

  /// No description provided for @contactHasBeenInvitedToTheGroup.
  ///
  /// In en, this message translates to:
  /// **'Contact has been invited to the group'**
  String get contactHasBeenInvitedToTheGroup;

  /// No description provided for @containsDisplayName.
  ///
  /// In en, this message translates to:
  /// **'Contains display name'**
  String get containsDisplayName;

  /// No description provided for @containsUserName.
  ///
  /// In en, this message translates to:
  /// **'Contains username'**
  String get containsUserName;

  /// No description provided for @contentHasBeenReported.
  ///
  /// In en, this message translates to:
  /// **'The content has been reported to the server admins'**
  String get contentHasBeenReported;

  /// No description provided for @copiedToClipboard.
  ///
  /// In en, this message translates to:
  /// **'Copied to clipboard'**
  String get copiedToClipboard;

  /// No description provided for @copy.
  ///
  /// In en, this message translates to:
  /// **'Copy'**
  String get copy;

  /// No description provided for @copyToClipboard.
  ///
  /// In en, this message translates to:
  /// **'Copy to clipboard'**
  String get copyToClipboard;

  /// No description provided for @couldNotDecryptMessage.
  ///
  /// In en, this message translates to:
  /// **'Could not decrypt message: {error}'**
  String couldNotDecryptMessage(String error);

  /// No description provided for @checkList.
  ///
  /// In en, this message translates to:
  /// **'Check list'**
  String get checkList;

  /// No description provided for @countParticipants.
  ///
  /// In en, this message translates to:
  /// **'{count} participants'**
  String countParticipants(int count);

  /// No description provided for @countInvited.
  ///
  /// In en, this message translates to:
  /// **'{count} invited'**
  String countInvited(int count);

  /// No description provided for @create.
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get create;

  /// No description provided for @createdTheChat.
  ///
  /// In en, this message translates to:
  /// **' {username} created the chat'**
  String createdTheChat(String username);

  /// No description provided for @createGroup.
  ///
  /// In en, this message translates to:
  /// **'Create Group'**
  String get createGroup;

  /// No description provided for @createNewSpace.
  ///
  /// In en, this message translates to:
  /// **'New space'**
  String get createNewSpace;

  /// No description provided for @currentlyActive.
  ///
  /// In en, this message translates to:
  /// **'Currently active'**
  String get currentlyActive;

  /// No description provided for @darkTheme.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get darkTheme;

  /// No description provided for @dateAndTimeOfDay.
  ///
  /// In en, this message translates to:
  /// **'{date}, {timeOfDay}'**
  String dateAndTimeOfDay(String date, String timeOfDay);

  /// No description provided for @dateWithoutYear.
  ///
  /// In en, this message translates to:
  /// **'{month}-{day}'**
  String dateWithoutYear(String month, String day);

  /// No description provided for @dateWithYear.
  ///
  /// In en, this message translates to:
  /// **'{year}-{month}-{day}'**
  String dateWithYear(String year, String month, String day);

  /// No description provided for @deactivateAccountWarning.
  ///
  /// In en, this message translates to:
  /// **'This will deactivate your user account. This can not be undone! Are you sure?'**
  String get deactivateAccountWarning;

  /// No description provided for @defaultPermissionLevel.
  ///
  /// In en, this message translates to:
  /// **'Default permission level for new users'**
  String get defaultPermissionLevel;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @deleteAccount.
  ///
  /// In en, this message translates to:
  /// **'Delete account'**
  String get deleteAccount;

  /// No description provided for @deleteMessage.
  ///
  /// In en, this message translates to:
  /// **'Delete message'**
  String get deleteMessage;

  /// No description provided for @device.
  ///
  /// In en, this message translates to:
  /// **'Device'**
  String get device;

  /// No description provided for @deviceId.
  ///
  /// In en, this message translates to:
  /// **'Device ID'**
  String get deviceId;

  /// No description provided for @devices.
  ///
  /// In en, this message translates to:
  /// **'Devices'**
  String get devices;

  /// No description provided for @directChats.
  ///
  /// In en, this message translates to:
  /// **'Direct Chats'**
  String get directChats;

  /// No description provided for @allRooms.
  ///
  /// In en, this message translates to:
  /// **'All Group Chats'**
  String get allRooms;

  /// No description provided for @displaynameHasBeenChanged.
  ///
  /// In en, this message translates to:
  /// **'Displayname has been changed'**
  String get displaynameHasBeenChanged;

  /// No description provided for @download.
  ///
  /// In en, this message translates to:
  /// **'Download'**
  String get download;

  /// No description provided for @downloadFile.
  ///
  /// In en, this message translates to:
  /// **'Download file'**
  String get downloadFile;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @editBlockedServers.
  ///
  /// In en, this message translates to:
  /// **'Edit blocked servers'**
  String get editBlockedServers;

  /// No description provided for @chatPermissions.
  ///
  /// In en, this message translates to:
  /// **'Chat permissions'**
  String get chatPermissions;

  /// No description provided for @editDisplayname.
  ///
  /// In en, this message translates to:
  /// **'Edit displayname'**
  String get editDisplayname;

  /// No description provided for @editRoomAliases.
  ///
  /// In en, this message translates to:
  /// **'Edit room aliases'**
  String get editRoomAliases;

  /// No description provided for @editRoomAvatar.
  ///
  /// In en, this message translates to:
  /// **'Edit room avatar'**
  String get editRoomAvatar;

  /// No description provided for @emoteExists.
  ///
  /// In en, this message translates to:
  /// **'Emote already exists!'**
  String get emoteExists;

  /// No description provided for @emoteInvalid.
  ///
  /// In en, this message translates to:
  /// **'Invalid emote shortcode!'**
  String get emoteInvalid;

  /// No description provided for @emoteKeyboardNoRecents.
  ///
  /// In en, this message translates to:
  /// **'Recently-used emotes will appear here...'**
  String get emoteKeyboardNoRecents;

  /// No description provided for @emotePacks.
  ///
  /// In en, this message translates to:
  /// **'Emote packs for room'**
  String get emotePacks;

  /// No description provided for @emoteSettings.
  ///
  /// In en, this message translates to:
  /// **'Emote Settings'**
  String get emoteSettings;

  /// No description provided for @globalChatId.
  ///
  /// In en, this message translates to:
  /// **'Global chat ID'**
  String get globalChatId;

  /// No description provided for @accessAndVisibility.
  ///
  /// In en, this message translates to:
  /// **'Access and visibility'**
  String get accessAndVisibility;

  /// No description provided for @accessAndVisibilityDescription.
  ///
  /// In en, this message translates to:
  /// **'Who is allowed to join this chat and how the chat can be discovered.'**
  String get accessAndVisibilityDescription;

  /// No description provided for @customEmojisAndStickers.
  ///
  /// In en, this message translates to:
  /// **'Custom emojis and stickers'**
  String get customEmojisAndStickers;

  /// No description provided for @customEmojisAndStickersBody.
  ///
  /// In en, this message translates to:
  /// **'Add or share custom emojis or stickers which can be used in any chat.'**
  String get customEmojisAndStickersBody;

  /// No description provided for @emoteShortcode.
  ///
  /// In en, this message translates to:
  /// **'Emote shortcode'**
  String get emoteShortcode;

  /// No description provided for @emoteWarnNeedToPick.
  ///
  /// In en, this message translates to:
  /// **'You need to pick an emote shortcode and an image!'**
  String get emoteWarnNeedToPick;

  /// No description provided for @emptyChat.
  ///
  /// In en, this message translates to:
  /// **'Empty chat'**
  String get emptyChat;

  /// No description provided for @enableEmotesGlobally.
  ///
  /// In en, this message translates to:
  /// **'Enable emote pack globally'**
  String get enableEmotesGlobally;

  /// No description provided for @enableEncryption.
  ///
  /// In en, this message translates to:
  /// **'Enable encryption'**
  String get enableEncryption;

  /// No description provided for @enableEncryptionWarning.
  ///
  /// In en, this message translates to:
  /// **'You won\'t be able to disable the encryption anymore. Are you sure?'**
  String get enableEncryptionWarning;

  /// No description provided for @encrypted.
  ///
  /// In en, this message translates to:
  /// **'Encrypted'**
  String get encrypted;

  /// No description provided for @encryption.
  ///
  /// In en, this message translates to:
  /// **'Encryption'**
  String get encryption;

  /// No description provided for @encryptionNotEnabled.
  ///
  /// In en, this message translates to:
  /// **'Encryption is not enabled'**
  String get encryptionNotEnabled;

  /// No description provided for @endedTheCall.
  ///
  /// In en, this message translates to:
  /// **'{senderName} ended the call'**
  String endedTheCall(String senderName);

  /// No description provided for @enterAnEmailAddress.
  ///
  /// In en, this message translates to:
  /// **'Enter an email address'**
  String get enterAnEmailAddress;

  /// No description provided for @homeserver.
  ///
  /// In en, this message translates to:
  /// **'Homeserver'**
  String get homeserver;

  /// No description provided for @enterYourHomeserver.
  ///
  /// In en, this message translates to:
  /// **'Enter your homeserver'**
  String get enterYourHomeserver;

  /// No description provided for @errorObtainingLocation.
  ///
  /// In en, this message translates to:
  /// **'Error obtaining location: {error}'**
  String errorObtainingLocation(String error);

  /// No description provided for @everythingReady.
  ///
  /// In en, this message translates to:
  /// **'Everything ready!'**
  String get everythingReady;

  /// No description provided for @extremeOffensive.
  ///
  /// In en, this message translates to:
  /// **'Extremely offensive'**
  String get extremeOffensive;

  /// No description provided for @fileName.
  ///
  /// In en, this message translates to:
  /// **'File name'**
  String get fileName;

  /// No description provided for @fluffychat.
  ///
  /// In en, this message translates to:
  /// **'BMP'**
  String get fluffychat;

  /// No description provided for @fontSize.
  ///
  /// In en, this message translates to:
  /// **'Font size'**
  String get fontSize;

  /// No description provided for @forward.
  ///
  /// In en, this message translates to:
  /// **'Forward'**
  String get forward;

  /// No description provided for @fromJoining.
  ///
  /// In en, this message translates to:
  /// **'From joining'**
  String get fromJoining;

  /// No description provided for @fromTheInvitation.
  ///
  /// In en, this message translates to:
  /// **'From the invitation'**
  String get fromTheInvitation;

  /// No description provided for @goToTheNewRoom.
  ///
  /// In en, this message translates to:
  /// **'Go to the new room'**
  String get goToTheNewRoom;

  /// No description provided for @chatDescriptionHasBeenChanged.
  ///
  /// In en, this message translates to:
  /// **'Chat description changed'**
  String get chatDescriptionHasBeenChanged;

  /// No description provided for @groupIsPublic.
  ///
  /// In en, this message translates to:
  /// **'Group is public'**
  String get groupIsPublic;

  /// No description provided for @groups.
  ///
  /// In en, this message translates to:
  /// **'Groups'**
  String get groups;

  /// No description provided for @groupWith.
  ///
  /// In en, this message translates to:
  /// **'Group with {displayname}'**
  String groupWith(String displayname);

  /// No description provided for @guestsAreForbidden.
  ///
  /// In en, this message translates to:
  /// **'Guests are forbidden'**
  String get guestsAreForbidden;

  /// No description provided for @guestsCanJoin.
  ///
  /// In en, this message translates to:
  /// **'Guests can join'**
  String get guestsCanJoin;

  /// No description provided for @hasWithdrawnTheInvitationFor.
  ///
  /// In en, this message translates to:
  /// **'{username} has withdrawn the invitation for {targetName}'**
  String hasWithdrawnTheInvitationFor(String username, String targetName);

  /// No description provided for @help.
  ///
  /// In en, this message translates to:
  /// **'Help'**
  String get help;

  /// No description provided for @hideRedactedEvents.
  ///
  /// In en, this message translates to:
  /// **'Hide deleted events'**
  String get hideRedactedEvents;

  /// No description provided for @hideRedactedMessages.
  ///
  /// In en, this message translates to:
  /// **'Hide deleted messages'**
  String get hideRedactedMessages;

  /// No description provided for @hideRedactedMessagesBody.
  ///
  /// In en, this message translates to:
  /// **'If someone delete a message, this message won\'t be visible in the chat anymore.'**
  String get hideRedactedMessagesBody;

  /// No description provided for @hideInvalidOrUnknownMessageFormats.
  ///
  /// In en, this message translates to:
  /// **'Hide invalid or unknown message formats'**
  String get hideInvalidOrUnknownMessageFormats;

  /// No description provided for @howOffensiveIsThisContent.
  ///
  /// In en, this message translates to:
  /// **'How offensive is this content?'**
  String get howOffensiveIsThisContent;

  /// No description provided for @id.
  ///
  /// In en, this message translates to:
  /// **'ID'**
  String get id;

  /// No description provided for @identity.
  ///
  /// In en, this message translates to:
  /// **'Identity'**
  String get identity;

  /// No description provided for @block.
  ///
  /// In en, this message translates to:
  /// **'Block'**
  String get block;

  /// No description provided for @blockedUsers.
  ///
  /// In en, this message translates to:
  /// **'Blocked users'**
  String get blockedUsers;

  /// No description provided for @blockListDescription.
  ///
  /// In en, this message translates to:
  /// **'You can block users who are disturbing you. You won\'t be able to receive any messages or room invites from the users on your personal block list.'**
  String get blockListDescription;

  /// No description provided for @blockUsername.
  ///
  /// In en, this message translates to:
  /// **'Ignore username'**
  String get blockUsername;

  /// No description provided for @iHaveClickedOnLink.
  ///
  /// In en, this message translates to:
  /// **'I have clicked on the link'**
  String get iHaveClickedOnLink;

  /// No description provided for @incorrectPassphraseOrKey.
  ///
  /// In en, this message translates to:
  /// **'Incorrect passphrase or recovery key'**
  String get incorrectPassphraseOrKey;

  /// No description provided for @inoffensive.
  ///
  /// In en, this message translates to:
  /// **'Inoffensive'**
  String get inoffensive;

  /// No description provided for @inviteContact.
  ///
  /// In en, this message translates to:
  /// **'Invite contact'**
  String get inviteContact;

  /// No description provided for @inviteContactToGroupQuestion.
  ///
  /// In en, this message translates to:
  /// **'Do you want to invite {contact} to the chat \"{groupName}\"?'**
  String inviteContactToGroupQuestion(Object contact, Object groupName);

  /// No description provided for @inviteContactToGroup.
  ///
  /// In en, this message translates to:
  /// **'Invite contact to {groupName}'**
  String inviteContactToGroup(String groupName);

  /// No description provided for @noChatDescriptionYet.
  ///
  /// In en, this message translates to:
  /// **'No chat description created yet.'**
  String get noChatDescriptionYet;

  /// No description provided for @hangup.
  ///
  /// In en, this message translates to:
  /// **'Hangup'**
  String get hangup;

  /// No description provided for @logoutConfirmTitle.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logoutConfirmTitle;

  /// No description provided for @logoutConfirmMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to logout?'**
  String get logoutConfirmMessage;

  /// No description provided for @logoutButton.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logoutButton;

  /// No description provided for @comingSoon.
  ///
  /// In en, this message translates to:
  /// **'Coming soon'**
  String get comingSoon;

  /// No description provided for @searchApps.
  ///
  /// In en, this message translates to:
  /// **'Search apps...'**
  String get searchApps;

  /// No description provided for @education.
  ///
  /// In en, this message translates to:
  /// **'Education'**
  String get education;

  /// No description provided for @game.
  ///
  /// In en, this message translates to:
  /// **'Game'**
  String get game;

  /// No description provided for @sport.
  ///
  /// In en, this message translates to:
  /// **'Sport'**
  String get sport;

  /// No description provided for @animal.
  ///
  /// In en, this message translates to:
  /// **'Animal'**
  String get animal;

  /// No description provided for @love.
  ///
  /// In en, this message translates to:
  /// **'Love'**
  String get love;

  /// No description provided for @traveling.
  ///
  /// In en, this message translates to:
  /// **'Traveling'**
  String get traveling;

  /// No description provided for @automotive.
  ///
  /// In en, this message translates to:
  /// **'Automotive'**
  String get automotive;

  /// No description provided for @popular.
  ///
  /// In en, this message translates to:
  /// **'Popular'**
  String get popular;

  /// No description provided for @food.
  ///
  /// In en, this message translates to:
  /// **'Food'**
  String get food;

  /// No description provided for @health.
  ///
  /// In en, this message translates to:
  /// **'Health'**
  String get health;

  /// No description provided for @shopping.
  ///
  /// In en, this message translates to:
  /// **'Shopping'**
  String get shopping;

  /// No description provided for @art.
  ///
  /// In en, this message translates to:
  /// **'Art'**
  String get art;

  /// No description provided for @spiritual.
  ///
  /// In en, this message translates to:
  /// **'Spiritual'**
  String get spiritual;

  /// No description provided for @maintenance.
  ///
  /// In en, this message translates to:
  /// **'Maintenance'**
  String get maintenance;

  /// No description provided for @lifestyle.
  ///
  /// In en, this message translates to:
  /// **'Lifestyle'**
  String get lifestyle;

  /// No description provided for @construction.
  ///
  /// In en, this message translates to:
  /// **'Construction'**
  String get construction;

  /// No description provided for @camera.
  ///
  /// In en, this message translates to:
  /// **'Camera'**
  String get camera;

  /// No description provided for @comingSoonEllipsis.
  ///
  /// In en, this message translates to:
  /// **'Coming Soon...'**
  String get comingSoonEllipsis;

  /// No description provided for @exploreFeatures.
  ///
  /// In en, this message translates to:
  /// **'Explore Features'**
  String get exploreFeatures;

  /// No description provided for @welcomeToBeMindPower.
  ///
  /// In en, this message translates to:
  /// **'Welcome to \n BeMind Power'**
  String get welcomeToBeMindPower;

  /// No description provided for @signUpForAnAccount.
  ///
  /// In en, this message translates to:
  /// **'Sign up for an account'**
  String get signUpForAnAccount;

  /// No description provided for @whatTypeOfAccountDoYouWantToOpen.
  ///
  /// In en, this message translates to:
  /// **'What type of account do you want to open?'**
  String get whatTypeOfAccountDoYouWantToOpen;

  /// No description provided for @naturalPerson.
  ///
  /// In en, this message translates to:
  /// **'Natural person'**
  String get naturalPerson;

  /// No description provided for @verificationEmailSent.
  ///
  /// In en, this message translates to:
  /// **'Verification Email Sent!'**
  String get verificationEmailSent;

  /// No description provided for @pleaseCheckEmailAndVerify.
  ///
  /// In en, this message translates to:
  /// **'Please check your email and click the verification link, then click \"Complete Registration\" below.'**
  String get pleaseCheckEmailAndVerify;

  /// No description provided for @clickCompleteAfterVerifying.
  ///
  /// In en, this message translates to:
  /// **'Click \"Complete Registration\" after verifying your email.'**
  String get clickCompleteAfterVerifying;

  /// No description provided for @completeRegistration.
  ///
  /// In en, this message translates to:
  /// **'Complete registration'**
  String get completeRegistration;

  /// No description provided for @startOver.
  ///
  /// In en, this message translates to:
  /// **'Start Over'**
  String get startOver;

  /// No description provided for @successfullyRegistered.
  ///
  /// In en, this message translates to:
  /// **'Successfully registered!'**
  String get successfullyRegistered;

  /// No description provided for @emailVerificationRequired.
  ///
  /// In en, this message translates to:
  /// **'Email Verification Required'**
  String get emailVerificationRequired;

  /// No description provided for @pleaseVerifyEmailFirst.
  ///
  /// In en, this message translates to:
  /// **'Please check your email and click the verification link first, then try again.'**
  String get pleaseVerifyEmailFirst;

  /// No description provided for @sessionExpiredStartOver.
  ///
  /// In en, this message translates to:
  /// **'Your session has expired. Please start the registration process again.'**
  String get sessionExpiredStartOver;

  /// No description provided for @pleaseVerifyEmailBeforeCompleting.
  ///
  /// In en, this message translates to:
  /// **'Please verify your email address before completing registration.'**
  String get pleaseVerifyEmailBeforeCompleting;

  /// No description provided for @gotIt.
  ///
  /// In en, this message translates to:
  /// **'Got it'**
  String get gotIt;

  /// No description provided for @createPassword.
  ///
  /// In en, this message translates to:
  /// **'Create password'**
  String get createPassword;

  /// No description provided for @enterYourPassword.
  ///
  /// In en, this message translates to:
  /// **'Enter your password'**
  String get enterYourPassword;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm password'**
  String get confirmPassword;

  /// No description provided for @alreadyHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get alreadyHaveAccount;

  /// No description provided for @logIn.
  ///
  /// In en, this message translates to:
  /// **'Log in'**
  String get logIn;

  /// No description provided for @federationBaseURL.
  ///
  /// In en, this message translates to:
  /// **'Federation Base URL'**
  String get federationBaseURL;

  /// No description provided for @clientWellKnownInformation.
  ///
  /// In en, this message translates to:
  /// **'Client-Well-Known Information:'**
  String get clientWellKnownInformation;

  /// No description provided for @baseURL.
  ///
  /// In en, this message translates to:
  /// **'Base URL'**
  String get baseURL;

  /// No description provided for @identityServer.
  ///
  /// In en, this message translates to:
  /// **'Identity Server:'**
  String get identityServer;

  /// No description provided for @defaultPack.
  ///
  /// In en, this message translates to:
  /// **'Default Pack'**
  String get defaultPack;

  /// No description provided for @pushError.
  ///
  /// In en, this message translates to:
  /// **'Push Error'**
  String get pushError;

  /// No description provided for @deleteError.
  ///
  /// In en, this message translates to:
  /// **'Delete Error'**
  String get deleteError;

  /// No description provided for @answer.
  ///
  /// In en, this message translates to:
  /// **'Answer'**
  String get answer;

  /// No description provided for @heldTheCall.
  ///
  /// In en, this message translates to:
  /// **'{displayName} held the call.'**
  String heldTheCall(String displayName);

  /// No description provided for @youHeldTheCall.
  ///
  /// In en, this message translates to:
  /// **'You held the call.'**
  String get youHeldTheCall;

  /// No description provided for @foregroundServiceRunning.
  ///
  /// In en, this message translates to:
  /// **'This notification appears when the foreground service is running.'**
  String get foregroundServiceRunning;

  /// No description provided for @screenSharingTitle.
  ///
  /// In en, this message translates to:
  /// **'screen sharing'**
  String get screenSharingTitle;

  /// No description provided for @screenSharingDetail.
  ///
  /// In en, this message translates to:
  /// **'You are sharing your screen in BMP'**
  String get screenSharingDetail;

  /// No description provided for @emailVerificationFailed.
  ///
  /// In en, this message translates to:
  /// **'Email verification failed'**
  String get emailVerificationFailed;

  /// No description provided for @unableToGetSession.
  ///
  /// In en, this message translates to:
  /// **'Unable to get session for registration'**
  String get unableToGetSession;

  /// No description provided for @registrationFailed.
  ///
  /// In en, this message translates to:
  /// **'Registration failed'**
  String get registrationFailed;

  /// No description provided for @networkError.
  ///
  /// In en, this message translates to:
  /// **'Network error. Please check your connection and try again.'**
  String get networkError;

  /// No description provided for @emailVerificationFailedWithError.
  ///
  /// In en, this message translates to:
  /// **'Email verification failed: {error}'**
  String emailVerificationFailedWithError(String error);

  /// No description provided for @registrationDataNotFound.
  ///
  /// In en, this message translates to:
  /// **'Registration data not found. Please start registration again.'**
  String get registrationDataNotFound;

  /// No description provided for @usernameAlreadyExists.
  ///
  /// In en, this message translates to:
  /// **'Username already exists'**
  String get usernameAlreadyExists;

  /// No description provided for @unableToGetSessionTryAgain.
  ///
  /// In en, this message translates to:
  /// **'Unable to get session. Please try again.'**
  String get unableToGetSessionTryAgain;

  /// No description provided for @emailNotVerifiedYet.
  ///
  /// In en, this message translates to:
  /// **'Email not verified yet. Please check your inbox and click the verification link.'**
  String get emailNotVerifiedYet;

  /// No description provided for @usernameAlreadyExistsChooseDifferent.
  ///
  /// In en, this message translates to:
  /// **'Username already exists. Please choose a different username.'**
  String get usernameAlreadyExistsChooseDifferent;

  /// No description provided for @emailAlreadyRegistered.
  ///
  /// In en, this message translates to:
  /// **'Email Already Registered'**
  String get emailAlreadyRegistered;

  /// No description provided for @emailAlreadyExist.
  ///
  /// In en, this message translates to:
  /// **'Email already registered'**
  String get emailAlreadyExist;

  /// No description provided for @networkErrorCheckConnection.
  ///
  /// In en, this message translates to:
  /// **'Network error. Please check your connection and try again.'**
  String get networkErrorCheckConnection;

  /// No description provided for @bmpDescription.
  ///
  /// In en, this message translates to:
  /// **'BMP lets you chat with your friends across different messengers.'**
  String get bmpDescription;

  /// No description provided for @signUp.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signUp;

  /// No description provided for @photos.
  ///
  /// In en, this message translates to:
  /// **'{count} Photos'**
  String photos(int count);

  /// No description provided for @videos.
  ///
  /// In en, this message translates to:
  /// **'{count} Videos'**
  String videos(int count);

  /// No description provided for @files.
  ///
  /// In en, this message translates to:
  /// **'{count} Files'**
  String files(int count);

  /// No description provided for @audio.
  ///
  /// In en, this message translates to:
  /// **'{count} Audio'**
  String audio(int count);

  /// No description provided for @sharedMedia.
  ///
  /// In en, this message translates to:
  /// **'Shared Media'**
  String get sharedMedia;

  /// No description provided for @items.
  ///
  /// In en, this message translates to:
  /// **'{count} items'**
  String items(int count);

  /// No description provided for @noMediaToShow.
  ///
  /// In en, this message translates to:
  /// **'No media to show'**
  String get noMediaToShow;

  /// No description provided for @beTheFirstToShareAMoment.
  ///
  /// In en, this message translates to:
  /// **'Be the first to share a moment'**
  String get beTheFirstToShareAMoment;

  /// No description provided for @file.
  ///
  /// In en, this message translates to:
  /// **'File'**
  String get file;

  /// No description provided for @opening.
  ///
  /// In en, this message translates to:
  /// **'Opening {fileName}'**
  String opening(String fileName);

  /// No description provided for @renameChannel.
  ///
  /// In en, this message translates to:
  /// **'Rename channel'**
  String get renameChannel;

  /// No description provided for @renameGroupChannel.
  ///
  /// In en, this message translates to:
  /// **'Rename group/channel'**
  String get renameGroupChannel;

  /// No description provided for @renameGroup.
  ///
  /// In en, this message translates to:
  /// **'Rename group'**
  String get renameGroup;

  /// No description provided for @changeGroupName.
  ///
  /// In en, this message translates to:
  /// **'Change the group name'**
  String get changeGroupName;

  /// No description provided for @setCustomEmotes.
  ///
  /// In en, this message translates to:
  /// **'Set custom emotes'**
  String get setCustomEmotes;

  /// No description provided for @whoCanPerformWhichAction.
  ///
  /// In en, this message translates to:
  /// **'Who can perform which action'**
  String get whoCanPerformWhichAction;

  /// No description provided for @setting.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get setting;

  /// No description provided for @financePersonalInfo.
  ///
  /// In en, this message translates to:
  /// **'Personal\nInfo'**
  String get financePersonalInfo;

  /// No description provided for @financeAddress.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get financeAddress;

  /// No description provided for @financeID.
  ///
  /// In en, this message translates to:
  /// **'ID'**
  String get financeID;

  /// No description provided for @financeTermsOfService.
  ///
  /// In en, this message translates to:
  /// **'Terms\nof service'**
  String get financeTermsOfService;

  /// No description provided for @financeBack.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get financeBack;

  /// No description provided for @financeCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get financeCancel;

  /// No description provided for @financeCreate.
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get financeCreate;

  /// No description provided for @financeNext.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get financeNext;

  /// No description provided for @financeError.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get financeError;

  /// No description provided for @financeFailedToAcceptToS.
  ///
  /// In en, this message translates to:
  /// **'Failed to accept ToS'**
  String get financeFailedToAcceptToS;

  /// No description provided for @financeTermsAcceptanceRequired.
  ///
  /// In en, this message translates to:
  /// **'Please accept the Terms of Service to continue'**
  String get financeTermsAcceptanceRequired;

  /// No description provided for @financeIncompleteFields.
  ///
  /// In en, this message translates to:
  /// **'Incomplete Fields'**
  String get financeIncompleteFields;

  /// No description provided for @financeValidEmail.
  ///
  /// In en, this message translates to:
  /// **'Valid Email'**
  String get financeValidEmail;

  /// No description provided for @financeBirthDate.
  ///
  /// In en, this message translates to:
  /// **'Birth Date'**
  String get financeBirthDate;

  /// No description provided for @financeStreetAddress.
  ///
  /// In en, this message translates to:
  /// **'Street Address'**
  String get financeStreetAddress;

  /// No description provided for @financeCity.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get financeCity;

  /// No description provided for @financeCountry.
  ///
  /// In en, this message translates to:
  /// **'Search your country'**
  String get financeCountry;

  /// No description provided for @financeState.
  ///
  /// In en, this message translates to:
  /// **'Search your state'**
  String get financeState;

  /// No description provided for @financePostalCode.
  ///
  /// In en, this message translates to:
  /// **'Postal Code'**
  String get financePostalCode;

  /// No description provided for @financePrimaryID.
  ///
  /// In en, this message translates to:
  /// **'Primary ID'**
  String get financePrimaryID;

  /// No description provided for @financePrimaryIDNumber.
  ///
  /// In en, this message translates to:
  /// **'Primary ID Number'**
  String get financePrimaryIDNumber;

  /// No description provided for @financeSecondaryID.
  ///
  /// In en, this message translates to:
  /// **'Secondary ID'**
  String get financeSecondaryID;

  /// No description provided for @financeSecondaryIDNumber.
  ///
  /// In en, this message translates to:
  /// **'Secondary ID Number'**
  String get financeSecondaryIDNumber;

  /// No description provided for @financeIDImages.
  ///
  /// In en, this message translates to:
  /// **'ID Images'**
  String get financeIDImages;

  /// No description provided for @financeIDType.
  ///
  /// In en, this message translates to:
  /// **'ID Type'**
  String get financeIDType;

  /// No description provided for @financeIDNumber.
  ///
  /// In en, this message translates to:
  /// **'ID Number'**
  String get financeIDNumber;

  /// No description provided for @financeSuccess.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get financeSuccess;

  /// No description provided for @financeAnErrorOccurred.
  ///
  /// In en, this message translates to:
  /// **'An error occurred'**
  String get financeAnErrorOccurred;

  /// No description provided for @financeAnErrorOccurredTryAgain.
  ///
  /// In en, this message translates to:
  /// **'An error occurred. Please try again.'**
  String get financeAnErrorOccurredTryAgain;

  /// No description provided for @financeFailedToSetPIN.
  ///
  /// In en, this message translates to:
  /// **'Failed to set PIN: {message}'**
  String financeFailedToSetPIN(String message);

  /// No description provided for @financeCustomerUpdatedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Customer updated successfully'**
  String get financeCustomerUpdatedSuccess;

  /// No description provided for @financeFirstName.
  ///
  /// In en, this message translates to:
  /// **'First Name'**
  String get financeFirstName;

  /// No description provided for @financeLastName.
  ///
  /// In en, this message translates to:
  /// **'Last Name'**
  String get financeLastName;

  /// No description provided for @unableToPlayVideo.
  ///
  /// In en, this message translates to:
  /// **'Unable to play video'**
  String get unableToPlayVideo;

  /// No description provided for @notImplemented.
  ///
  /// In en, this message translates to:
  /// **'Not implemented'**
  String get notImplemented;

  /// No description provided for @loadingEmojiVerification.
  ///
  /// In en, this message translates to:
  /// **'Loading emoji verification...'**
  String get loadingEmojiVerification;

  /// No description provided for @preparingEmojiVerification.
  ///
  /// In en, this message translates to:
  /// **'Preparing emoji verification...'**
  String get preparingEmojiVerification;

  /// No description provided for @verificationCodesDontMatch.
  ///
  /// In en, this message translates to:
  /// **'The verification codes don\'t match. Please try again.'**
  String get verificationCodesDontMatch;

  /// No description provided for @verificationCancelled.
  ///
  /// In en, this message translates to:
  /// **'Verification was cancelled by the user'**
  String get verificationCancelled;

  /// No description provided for @otherUserCancelledVerification.
  ///
  /// In en, this message translates to:
  /// **'The other user cancelled the verification.'**
  String get otherUserCancelledVerification;

  /// No description provided for @verificationTimeout.
  ///
  /// In en, this message translates to:
  /// **'Verification timed out. Please try again.'**
  String get verificationTimeout;

  /// No description provided for @verificationTimedOut.
  ///
  /// In en, this message translates to:
  /// **'Verification timed out. Please try again.'**
  String get verificationTimedOut;

  /// No description provided for @unknownVerificationTransaction.
  ///
  /// In en, this message translates to:
  /// **'Unknown verification transaction. Please start a new verification.'**
  String get unknownVerificationTransaction;

  /// No description provided for @methodNotSupported.
  ///
  /// In en, this message translates to:
  /// **'Method Not Supported'**
  String get methodNotSupported;

  /// No description provided for @verificationMethodNotSupported.
  ///
  /// In en, this message translates to:
  /// **'Verification method not supported. Please try a different method.'**
  String get verificationMethodNotSupported;

  /// No description provided for @unexpectedMessageReceived.
  ///
  /// In en, this message translates to:
  /// **'Unexpected message received during verification.'**
  String get unexpectedMessageReceived;

  /// No description provided for @keyVerificationFailed.
  ///
  /// In en, this message translates to:
  /// **'Key Verification Failed'**
  String get keyVerificationFailed;

  /// No description provided for @keysCouldNotBeVerified.
  ///
  /// In en, this message translates to:
  /// **'The keys could not be verified.'**
  String get keysCouldNotBeVerified;

  /// No description provided for @userVerificationFailed.
  ///
  /// In en, this message translates to:
  /// **'User Verification Failed'**
  String get userVerificationFailed;

  /// No description provided for @userIdentityCouldNotBeVerified.
  ///
  /// In en, this message translates to:
  /// **'The user identity could not be verified.'**
  String get userIdentityCouldNotBeVerified;

  /// No description provided for @invalidMessage.
  ///
  /// In en, this message translates to:
  /// **'Invalid Message'**
  String get invalidMessage;

  /// No description provided for @invalidMessageReceived.
  ///
  /// In en, this message translates to:
  /// **'An invalid message was received during verification.'**
  String get invalidMessageReceived;

  /// No description provided for @alreadyVerified.
  ///
  /// In en, this message translates to:
  /// **'Already Verified'**
  String get alreadyVerified;

  /// No description provided for @verificationAlreadyAccepted.
  ///
  /// In en, this message translates to:
  /// **'This verification was already accepted on another device.'**
  String get verificationAlreadyAccepted;

  /// No description provided for @verificationCancelledByOtherUser.
  ///
  /// In en, this message translates to:
  /// **'The verification was cancelled by the other user.'**
  String get verificationCancelledByOtherUser;

  /// No description provided for @tourGuide.
  ///
  /// In en, this message translates to:
  /// **'Tour Guide'**
  String get tourGuide;

  /// No description provided for @finance.
  ///
  /// In en, this message translates to:
  /// **'Finance'**
  String get finance;

  /// No description provided for @marketplace.
  ///
  /// In en, this message translates to:
  /// **'Marketplace'**
  String get marketplace;

  /// No description provided for @community.
  ///
  /// In en, this message translates to:
  /// **'Community'**
  String get community;

  /// No description provided for @apps.
  ///
  /// In en, this message translates to:
  /// **'Apps'**
  String get apps;

  /// No description provided for @addContacts.
  ///
  /// In en, this message translates to:
  /// **'Add Contacts'**
  String get addContacts;

  /// No description provided for @goBackToAllChats.
  ///
  /// In en, this message translates to:
  /// **'Go Back to All Chats'**
  String get goBackToAllChats;

  /// No description provided for @failedToInviteUser.
  ///
  /// In en, this message translates to:
  /// **'Failed to invite user from room {roomId}'**
  String failedToInviteUser(String roomId);

  /// No description provided for @unableToCreateGroup.
  ///
  /// In en, this message translates to:
  /// **'Unable to create group'**
  String get unableToCreateGroup;

  /// No description provided for @pleaseFillOut.
  ///
  /// In en, this message translates to:
  /// **'Please fill out'**
  String get pleaseFillOut;

  /// No description provided for @newGroup.
  ///
  /// In en, this message translates to:
  /// **'New group'**
  String get newGroup;

  /// No description provided for @imageGroup.
  ///
  /// In en, this message translates to:
  /// **'Image group'**
  String get imageGroup;

  /// No description provided for @groupName.
  ///
  /// In en, this message translates to:
  /// **'Group Name'**
  String get groupName;

  /// No description provided for @enterGroupName.
  ///
  /// In en, this message translates to:
  /// **'Enter group name'**
  String get enterGroupName;

  /// No description provided for @changeNameGroup.
  ///
  /// In en, this message translates to:
  /// **'Change Name Group'**
  String get changeNameGroup;

  /// No description provided for @publicGroup.
  ///
  /// In en, this message translates to:
  /// **'Public Group'**
  String get publicGroup;

  /// No description provided for @privateGroup.
  ///
  /// In en, this message translates to:
  /// **'Private Group'**
  String get privateGroup;

  /// No description provided for @anyoneCanFindAndJoin.
  ///
  /// In en, this message translates to:
  /// **'Anyone can find and join this group'**
  String get anyoneCanFindAndJoin;

  /// No description provided for @onlyInvitedMembersCanJoin.
  ///
  /// In en, this message translates to:
  /// **'Only invited members can join this group'**
  String get onlyInvitedMembersCanJoin;

  /// No description provided for @endToEndEncryption.
  ///
  /// In en, this message translates to:
  /// **'End-to-End Encryption'**
  String get endToEndEncryption;

  /// No description provided for @messagesWillBeEncrypted.
  ///
  /// In en, this message translates to:
  /// **'Messages will be encrypted for security'**
  String get messagesWillBeEncrypted;

  /// No description provided for @messagesWillNotBeEncrypted.
  ///
  /// In en, this message translates to:
  /// **'Messages will not be encrypted'**
  String get messagesWillNotBeEncrypted;

  /// No description provided for @pleaseEnterGroupNameFirst.
  ///
  /// In en, this message translates to:
  /// **'Please enter group name first'**
  String get pleaseEnterGroupNameFirst;

  /// No description provided for @selectFromYourContacts.
  ///
  /// In en, this message translates to:
  /// **'Select from your contacts'**
  String get selectFromYourContacts;

  /// No description provided for @contactsInGroup.
  ///
  /// In en, this message translates to:
  /// **'Contacts in group'**
  String get contactsInGroup;

  /// No description provided for @unsupportedVersion.
  ///
  /// In en, this message translates to:
  /// **'Unsupported Version'**
  String get unsupportedVersion;

  /// No description provided for @copied.
  ///
  /// In en, this message translates to:
  /// **'Copied'**
  String get copied;

  /// No description provided for @qrCodeScanned.
  ///
  /// In en, this message translates to:
  /// **'QR Code Scanned: {link}'**
  String qrCodeScanned(String link);

  /// No description provided for @usernameServer.
  ///
  /// In en, this message translates to:
  /// **'Username: {username}, Server: {server}'**
  String usernameServer(String username, String server);

  /// No description provided for @extractedUserId.
  ///
  /// In en, this message translates to:
  /// **'Extracted User ID: {userId}'**
  String extractedUserId(String userId);

  /// No description provided for @matrixUrlDetected.
  ///
  /// In en, this message translates to:
  /// **'Matrix.to URL or other format detected'**
  String get matrixUrlDetected;

  /// No description provided for @addCaption.
  ///
  /// In en, this message translates to:
  /// **'Add a caption...'**
  String get addCaption;

  /// No description provided for @selectContact.
  ///
  /// In en, this message translates to:
  /// **'Select Contact'**
  String get selectContact;

  /// No description provided for @scanQR.
  ///
  /// In en, this message translates to:
  /// **'Scan QR'**
  String get scanQR;

  /// No description provided for @messages.
  ///
  /// In en, this message translates to:
  /// **'Messages'**
  String get messages;

  /// No description provided for @decline.
  ///
  /// In en, this message translates to:
  /// **'Decline'**
  String get decline;

  /// No description provided for @youInvitedBy.
  ///
  /// In en, this message translates to:
  /// **' You have been invited by {user}'**
  String youInvitedBy(String user);

  /// No description provided for @invalidServerName.
  ///
  /// In en, this message translates to:
  /// **'Invalid server name'**
  String get invalidServerName;

  /// No description provided for @archiveRoomDescription.
  ///
  /// In en, this message translates to:
  /// **'The chat will be moved to the archive. Other users will be able to see that you have left the chat.'**
  String get archiveRoomDescription;

  /// No description provided for @hidePresences.
  ///
  /// In en, this message translates to:
  /// **'Hide Status List?'**
  String get hidePresences;

  /// No description provided for @leaveEmptyToClearStatus.
  ///
  /// In en, this message translates to:
  /// **'Leave empty to clear your status.'**
  String get leaveEmptyToClearStatus;

  /// No description provided for @removeFromBundle.
  ///
  /// In en, this message translates to:
  /// **'Remove from this bundle'**
  String get removeFromBundle;

  /// No description provided for @encryptionSetupRequired.
  ///
  /// In en, this message translates to:
  /// **'Encryption setup is required for secure messaging. Please complete the setup in Settings.'**
  String get encryptionSetupRequired;

  /// No description provided for @warning.
  ///
  /// In en, this message translates to:
  /// **'Warning!'**
  String get warning;

  /// No description provided for @noDevicesSelectedForRemoval.
  ///
  /// In en, this message translates to:
  /// **'No devices selected for removal'**
  String get noDevicesSelectedForRemoval;

  /// No description provided for @deviceDeletionNotAllowed.
  ///
  /// In en, this message translates to:
  /// **'Device deletion not allowed: These devices may be protected, recently active, or require additional permissions from your server administrator. This message will not appear again.'**
  String get deviceDeletionNotAllowed;

  /// No description provided for @deviceDeletionFailed.
  ///
  /// In en, this message translates to:
  /// **'Device deletion failed: Server rejected the request.'**
  String get deviceDeletionFailed;

  /// No description provided for @failedToRemoveDevices.
  ///
  /// In en, this message translates to:
  /// **'Failed to remove devices: {error}'**
  String failedToRemoveDevices(String error);

  /// No description provided for @devicesRemovedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Devices removed successfully'**
  String get devicesRemovedSuccessfully;

  /// No description provided for @errorRemovingDevices.
  ///
  /// In en, this message translates to:
  /// **'Error removing devices: {error}'**
  String errorRemovingDevices(String error);

  /// No description provided for @verifyOtherDevice.
  ///
  /// In en, this message translates to:
  /// **'Verify other device'**
  String get verifyOtherDevice;

  /// No description provided for @verifyOtherDeviceDescription.
  ///
  /// In en, this message translates to:
  /// **'When you verify another device, those devices can exchange keys, increasing your overall security. When you start a verification, a popup will appear in the app on both devices. There you will then see a series of emojis or numbers that you have to compare with each other. It\'s best to have both devices handy before you start the verification.'**
  String get verifyOtherDeviceDescription;

  /// No description provided for @removeDevicesDescription.
  ///
  /// In en, this message translates to:
  /// **'You will be logged out of this device and will no longer be able to receive messages.'**
  String get removeDevicesDescription;

  /// No description provided for @failedToLoadChat.
  ///
  /// In en, this message translates to:
  /// **'Failed to load chat. Please try again.'**
  String get failedToLoadChat;

  /// No description provided for @encryptionIssue.
  ///
  /// In en, this message translates to:
  /// **'Encryption Issue'**
  String get encryptionIssue;

  /// No description provided for @encryptionStatus.
  ///
  /// In en, this message translates to:
  /// **'Encryption Status'**
  String get encryptionStatus;

  /// No description provided for @room.
  ///
  /// In en, this message translates to:
  /// **'Room'**
  String get room;

  /// No description provided for @clientReady.
  ///
  /// In en, this message translates to:
  /// **'Client Ready'**
  String get clientReady;

  /// No description provided for @roomReady.
  ///
  /// In en, this message translates to:
  /// **'Room Ready'**
  String get roomReady;

  /// No description provided for @canReceive.
  ///
  /// In en, this message translates to:
  /// **'Can Receive'**
  String get canReceive;

  /// No description provided for @recommendations.
  ///
  /// In en, this message translates to:
  /// **'Recommendations'**
  String get recommendations;

  /// No description provided for @fixEncryption.
  ///
  /// In en, this message translates to:
  /// **'Fix Encryption'**
  String get fixEncryption;

  /// No description provided for @addedToFavorites.
  ///
  /// In en, this message translates to:
  /// **'Added to favorites'**
  String get addedToFavorites;

  /// No description provided for @transferOnlyDirectChats.
  ///
  /// In en, this message translates to:
  /// **'Transfer is only available in direct chats'**
  String get transferOnlyDirectChats;

  /// No description provided for @transferSuccessful.
  ///
  /// In en, this message translates to:
  /// **'Transfer successful! Transaction details sent to chat.'**
  String get transferSuccessful;

  /// No description provided for @messageForwardedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Message forwarded successfully'**
  String get messageForwardedSuccessfully;

  /// No description provided for @callsOnlyDirectChats.
  ///
  /// In en, this message translates to:
  /// **'Calls are only available in direct chats.'**
  String get callsOnlyDirectChats;

  /// No description provided for @mustBeMemberToCall.
  ///
  /// In en, this message translates to:
  /// **'You must be a member of this room to start a call.'**
  String get mustBeMemberToCall;

  /// No description provided for @cannotDetermineCallRecipient.
  ///
  /// In en, this message translates to:
  /// **'Cannot determine call recipient.'**
  String get cannotDetermineCallRecipient;

  /// No description provided for @voiceVideoCallsNotAvailable.
  ///
  /// In en, this message translates to:
  /// **'Voice and video calls are not available. Please enable them in settings.'**
  String get voiceVideoCallsNotAvailable;

  /// No description provided for @failedToStartCall.
  ///
  /// In en, this message translates to:
  /// **'Failed to start call'**
  String get failedToStartCall;

  /// No description provided for @startGroupCall.
  ///
  /// In en, this message translates to:
  /// **'Start Group Call'**
  String get startGroupCall;

  /// No description provided for @chooseGroupCallType.
  ///
  /// In en, this message translates to:
  /// **'Choose the type of group call:'**
  String get chooseGroupCallType;

  /// No description provided for @voiceGroupCall.
  ///
  /// In en, this message translates to:
  /// **'Voice Group Call'**
  String get voiceGroupCall;

  /// No description provided for @videoGroupCall.
  ///
  /// In en, this message translates to:
  /// **'Video Group Call'**
  String get videoGroupCall;

  /// No description provided for @startCall.
  ///
  /// In en, this message translates to:
  /// **'Start Call'**
  String get startCall;

  /// No description provided for @chooseCallType.
  ///
  /// In en, this message translates to:
  /// **'Choose the type of call you want to make:'**
  String get chooseCallType;

  /// No description provided for @makeYourFirstCall.
  ///
  /// In en, this message translates to:
  /// **'Make your first call'**
  String get makeYourFirstCall;

  /// No description provided for @checkBackLater.
  ///
  /// In en, this message translates to:
  /// **'or check back later for new activity'**
  String get checkBackLater;

  /// No description provided for @startAConversation.
  ///
  /// In en, this message translates to:
  /// **'Start a\nConversation'**
  String get startAConversation;

  /// No description provided for @sendMessageToGetStarted.
  ///
  /// In en, this message translates to:
  /// **'Send a message to get started'**
  String get sendMessageToGetStarted;

  /// No description provided for @noParticipantsGroupCall.
  ///
  /// In en, this message translates to:
  /// **'No participants available for group call.'**
  String get noParticipantsGroupCall;

  /// No description provided for @groupCallsInDevelopmentDirectOnly.
  ///
  /// In en, this message translates to:
  /// **'Group calls are in development. Please use direct calls for now.'**
  String get groupCallsInDevelopmentDirectOnly;

  /// No description provided for @invited.
  ///
  /// In en, this message translates to:
  /// **'Invited'**
  String get invited;

  /// No description provided for @redactMessageDescription.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this message?'**
  String get redactMessageDescription;

  /// No description provided for @optionalRedactReason.
  ///
  /// In en, this message translates to:
  /// **'Optional delete reason'**
  String get optionalRedactReason;

  /// No description provided for @invitedUser.
  ///
  /// In en, this message translates to:
  /// **' {username} invited {targetName}'**
  String invitedUser(String username, String targetName);

  /// No description provided for @invitedUsersOnly.
  ///
  /// In en, this message translates to:
  /// **'Invited users only'**
  String get invitedUsersOnly;

  /// No description provided for @inviteForMe.
  ///
  /// In en, this message translates to:
  /// **'Invite for me'**
  String get inviteForMe;

  /// No description provided for @inviteText.
  ///
  /// In en, this message translates to:
  /// **'{username} invited you to BMP.\n1. Visit our website and install the app \n2. Sign up or sign in \n3. Open the invite link: \n {link}'**
  String inviteText(String username, String link);

  /// No description provided for @gallery.
  ///
  /// In en, this message translates to:
  /// **'Gallery'**
  String get gallery;

  /// No description provided for @document.
  ///
  /// In en, this message translates to:
  /// **'Document'**
  String get document;

  /// No description provided for @location.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get location;

  /// No description provided for @contact.
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get contact;

  /// No description provided for @send.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get send;

  /// No description provided for @request.
  ///
  /// In en, this message translates to:
  /// **'Request'**
  String get request;

  /// No description provided for @qr.
  ///
  /// In en, this message translates to:
  /// **'QR'**
  String get qr;

  /// No description provided for @replaceOldestPin.
  ///
  /// In en, this message translates to:
  /// **'Replace oldest pin?'**
  String get replaceOldestPin;

  /// No description provided for @yourNewPinWillReplace.
  ///
  /// In en, this message translates to:
  /// **'Your new pin will replace the oldest one.'**
  String get yourNewPinWillReplace;

  /// No description provided for @gift.
  ///
  /// In en, this message translates to:
  /// **'Gift'**
  String get gift;

  /// No description provided for @favorite.
  ///
  /// In en, this message translates to:
  /// **'Favorite'**
  String get favorite;

  /// No description provided for @recoveryKey.
  ///
  /// In en, this message translates to:
  /// **'Recovery key'**
  String get recoveryKey;

  /// No description provided for @storeInAndroidKeystore.
  ///
  /// In en, this message translates to:
  /// **'Store in Android KeyStore'**
  String get storeInAndroidKeystore;

  /// No description provided for @storeInAppleKeyChain.
  ///
  /// In en, this message translates to:
  /// **'Store in Apple KeyChain'**
  String get storeInAppleKeyChain;

  /// No description provided for @storeSecurlyOnThisDevice.
  ///
  /// In en, this message translates to:
  /// **'Store securely on this device'**
  String get storeSecurlyOnThisDevice;

  /// No description provided for @storeInSecureStorageDescription.
  ///
  /// In en, this message translates to:
  /// **'Store the recovery key in the secure storage of this device.'**
  String get storeInSecureStorageDescription;

  /// No description provided for @saveKeyManuallyDescription.
  ///
  /// In en, this message translates to:
  /// **'Save this key manually by triggering the system share dialog or clipboard.'**
  String get saveKeyManuallyDescription;

  /// No description provided for @pleaseEnterRecoveryKeyDescription.
  ///
  /// In en, this message translates to:
  /// **'To unlock your old messages, please enter your recovery key that has been generated in a previous session. Your recovery key is NOT your password.'**
  String get pleaseEnterRecoveryKeyDescription;

  /// No description provided for @unlockOldMessages.
  ///
  /// In en, this message translates to:
  /// **'Unlock old messages'**
  String get unlockOldMessages;

  /// No description provided for @wrongRecoveryKey.
  ///
  /// In en, this message translates to:
  /// **'Sorry... this does not seem to be the correct recovery key.'**
  String get wrongRecoveryKey;

  /// No description provided for @recoveryKeyLost.
  ///
  /// In en, this message translates to:
  /// **'Recovery key lost?'**
  String get recoveryKeyLost;

  /// No description provided for @wipeChatBackup.
  ///
  /// In en, this message translates to:
  /// **'Wipe your chat backup to create a new recovery key?'**
  String get wipeChatBackup;

  /// No description provided for @isTyping.
  ///
  /// In en, this message translates to:
  /// **'is typing '**
  String get isTyping;

  /// No description provided for @joinedTheChat.
  ///
  /// In en, this message translates to:
  /// **'{username} joined the chat'**
  String joinedTheChat(String username);

  /// No description provided for @joinRoom.
  ///
  /// In en, this message translates to:
  /// **'Join room'**
  String get joinRoom;

  /// No description provided for @kicked.
  ///
  /// In en, this message translates to:
  /// **'{username} kicked {targetName}'**
  String kicked(String username, String targetName);

  /// No description provided for @kickedAndBanned.
  ///
  /// In en, this message translates to:
  /// **'{username} kicked and banned {targetName}'**
  String kickedAndBanned(String username, String targetName);

  /// No description provided for @kickFromChat.
  ///
  /// In en, this message translates to:
  /// **'Kick from chat'**
  String get kickFromChat;

  /// No description provided for @lastActiveAgo.
  ///
  /// In en, this message translates to:
  /// **'Last active: {localizedTimeShort}'**
  String lastActiveAgo(String localizedTimeShort);

  /// No description provided for @leave.
  ///
  /// In en, this message translates to:
  /// **'Leave'**
  String get leave;

  /// No description provided for @leftTheChat.
  ///
  /// In en, this message translates to:
  /// **'Left the chat'**
  String get leftTheChat;

  /// No description provided for @license.
  ///
  /// In en, this message translates to:
  /// **'License'**
  String get license;

  /// No description provided for @lightTheme.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get lightTheme;

  /// No description provided for @loadCountMoreParticipants.
  ///
  /// In en, this message translates to:
  /// **'Load {count} more participants'**
  String loadCountMoreParticipants(int count);

  /// No description provided for @dehydrate.
  ///
  /// In en, this message translates to:
  /// **'Export session and wipe device'**
  String get dehydrate;

  /// No description provided for @dehydrateWarning.
  ///
  /// In en, this message translates to:
  /// **'This action cannot be undone. Ensure you safely store the backup file.'**
  String get dehydrateWarning;

  /// No description provided for @dehydrateTor.
  ///
  /// In en, this message translates to:
  /// **'TOR Users: Export session'**
  String get dehydrateTor;

  /// No description provided for @dehydrateTorLong.
  ///
  /// In en, this message translates to:
  /// **'For TOR users, it is recommended to export the session before closing the window.'**
  String get dehydrateTorLong;

  /// No description provided for @hydrateTor.
  ///
  /// In en, this message translates to:
  /// **'TOR Users: Import session export'**
  String get hydrateTor;

  /// No description provided for @hydrateTorLong.
  ///
  /// In en, this message translates to:
  /// **'Did you export your session last time on TOR? Quickly import it and continue chatting.'**
  String get hydrateTorLong;

  /// No description provided for @hydrate.
  ///
  /// In en, this message translates to:
  /// **'Restore from backup file'**
  String get hydrate;

  /// No description provided for @loadingPleaseWait.
  ///
  /// In en, this message translates to:
  /// **'Loading Please wait...'**
  String get loadingPleaseWait;

  /// No description provided for @loadMore.
  ///
  /// In en, this message translates to:
  /// **'Load more '**
  String get loadMore;

  /// No description provided for @locationDisabledNotice.
  ///
  /// In en, this message translates to:
  /// **'Location services are disabled. Please enable them to be able to share your location.'**
  String get locationDisabledNotice;

  /// No description provided for @locationPermissionDeniedNotice.
  ///
  /// In en, this message translates to:
  /// **'Location permission denied. Please grant them to be able to share your location.'**
  String get locationPermissionDeniedNotice;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @logInTo.
  ///
  /// In en, this message translates to:
  /// **'Log in to {homeserver}'**
  String logInTo(String homeserver);

  /// No description provided for @memberChanges.
  ///
  /// In en, this message translates to:
  /// **'Member changes'**
  String get memberChanges;

  /// No description provided for @mention.
  ///
  /// In en, this message translates to:
  /// **'Mention'**
  String get mention;

  /// No description provided for @messagesStyle.
  ///
  /// In en, this message translates to:
  /// **'Messages:'**
  String get messagesStyle;

  /// No description provided for @moderator.
  ///
  /// In en, this message translates to:
  /// **'Moderator'**
  String get moderator;

  /// No description provided for @muteChat.
  ///
  /// In en, this message translates to:
  /// **'Mute chat'**
  String get muteChat;

  /// No description provided for @needPantalaimonWarning.
  ///
  /// In en, this message translates to:
  /// **'Please be aware that you need Pantalaimon to use end-to-end encryption for now.'**
  String get needPantalaimonWarning;

  /// No description provided for @newChat.
  ///
  /// In en, this message translates to:
  /// **'New chat'**
  String get newChat;

  /// No description provided for @newMessageInFluffyChat.
  ///
  /// In en, this message translates to:
  /// **' New message in BMP'**
  String get newMessageInFluffyChat;

  /// No description provided for @newVerificationRequest.
  ///
  /// In en, this message translates to:
  /// **'New verification request!'**
  String get newVerificationRequest;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @noConnectionToTheServer.
  ///
  /// In en, this message translates to:
  /// **'No connection to the server'**
  String get noConnectionToTheServer;

  /// No description provided for @members.
  ///
  /// In en, this message translates to:
  /// **'Members'**
  String get members;

  /// No description provided for @welcomeToMindPower.
  ///
  /// In en, this message translates to:
  /// **'Welcome to MindPower!'**
  String get welcomeToMindPower;

  /// No description provided for @accountSuccessfullyCreated.
  ///
  /// In en, this message translates to:
  /// **'Your account has been successfully created and verified.'**
  String get accountSuccessfullyCreated;

  /// No description provided for @takingYouToDashboard.
  ///
  /// In en, this message translates to:
  /// **'Taking you to your dashboard...'**
  String get takingYouToDashboard;

  /// No description provided for @continueToApp.
  ///
  /// In en, this message translates to:
  /// **'Continue to App'**
  String get continueToApp;

  /// No description provided for @quickAccess.
  ///
  /// In en, this message translates to:
  /// **'Quick access'**
  String get quickAccess;

  /// No description provided for @cards.
  ///
  /// In en, this message translates to:
  /// **'Cards'**
  String get cards;

  /// No description provided for @privacy.
  ///
  /// In en, this message translates to:
  /// **'Privacy'**
  String get privacy;

  /// No description provided for @notification.
  ///
  /// In en, this message translates to:
  /// **'Notification'**
  String get notification;

  /// No description provided for @wallet.
  ///
  /// In en, this message translates to:
  /// **'Wallet'**
  String get wallet;

  /// No description provided for @allCalls.
  ///
  /// In en, this message translates to:
  /// **'All Calls'**
  String get allCalls;

  /// No description provided for @unreadCalls.
  ///
  /// In en, this message translates to:
  /// **'Unread Calls'**
  String get unreadCalls;

  /// No description provided for @setChatDescription.
  ///
  /// In en, this message translates to:
  /// **'Set chat description'**
  String get setChatDescription;

  /// No description provided for @replaceRoomWithNewerVersion.
  ///
  /// In en, this message translates to:
  /// **'Replace room with newer version'**
  String get replaceRoomWithNewerVersion;

  /// No description provided for @roomUpgradeDescription.
  ///
  /// In en, this message translates to:
  /// **'The chat will then be recreated with the new room version. All participants will be notified that they need to switch to the new chat. You can find out more about room versions at https://spec.matrix.org/latest/rooms/'**
  String get roomUpgradeDescription;

  /// No description provided for @usersMustKnock.
  ///
  /// In en, this message translates to:
  /// **'Users must knock'**
  String get usersMustKnock;

  /// No description provided for @noOneCanJoin.
  ///
  /// In en, this message translates to:
  /// **'No one can join'**
  String get noOneCanJoin;

  /// No description provided for @restricted.
  ///
  /// In en, this message translates to:
  /// **'Restricted'**
  String get restricted;

  /// No description provided for @knockRestricted.
  ///
  /// In en, this message translates to:
  /// **'Knock restricted'**
  String get knockRestricted;

  /// No description provided for @unknown.
  ///
  /// In en, this message translates to:
  /// **'Unknown'**
  String get unknown;

  /// No description provided for @openGallery.
  ///
  /// In en, this message translates to:
  /// **'Open gallery'**
  String get openGallery;

  /// No description provided for @voiceCallsOnlyDirectChats.
  ///
  /// In en, this message translates to:
  /// **'Voice calls are only available in direct chats'**
  String get voiceCallsOnlyDirectChats;

  /// No description provided for @videoCallsOnlyDirectChats.
  ///
  /// In en, this message translates to:
  /// **'Video calls are only available in direct chats'**
  String get videoCallsOnlyDirectChats;

  /// No description provided for @voiceCallsNotAvailable.
  ///
  /// In en, this message translates to:
  /// **'Voice and video calls are not available. Please enable them in settings.'**
  String get voiceCallsNotAvailable;

  /// No description provided for @videoCallsNotAvailable.
  ///
  /// In en, this message translates to:
  /// **'Video calls are not available'**
  String get videoCallsNotAvailable;

  /// No description provided for @failedToStartVoiceCall.
  ///
  /// In en, this message translates to:
  /// **'Failed to start voice call: {error}'**
  String failedToStartVoiceCall(String error);

  /// No description provided for @failedToStartVideoCall.
  ///
  /// In en, this message translates to:
  /// **'Failed to start video call: {error}'**
  String failedToStartVideoCall(String error);

  /// No description provided for @unsupportedAndroidVersion.
  ///
  /// In en, this message translates to:
  /// **'Unsupported Android version'**
  String get unsupportedAndroidVersion;

  /// No description provided for @unsupportedAndroidVersionLong.
  ///
  /// In en, this message translates to:
  /// **'This feature requires a newer Android version. Please check for updates or Lineage OS support.'**
  String get unsupportedAndroidVersionLong;

  /// No description provided for @available.
  ///
  /// In en, this message translates to:
  /// **'Available'**
  String get available;

  /// No description provided for @typeMessage.
  ///
  /// In en, this message translates to:
  /// **'Type message..'**
  String get typeMessage;

  /// No description provided for @report.
  ///
  /// In en, this message translates to:
  /// **'report'**
  String get report;

  /// No description provided for @selectPhotos.
  ///
  /// In en, this message translates to:
  /// **'Select Photos'**
  String get selectPhotos;

  /// No description provided for @selectPhotosWithCount.
  ///
  /// In en, this message translates to:
  /// **'Select Photos ({count})'**
  String selectPhotosWithCount(int count);

  /// No description provided for @galleryAccessRequired.
  ///
  /// In en, this message translates to:
  /// **'Gallery Access Required'**
  String get galleryAccessRequired;

  /// No description provided for @grantPermission.
  ///
  /// In en, this message translates to:
  /// **'Grant Permission'**
  String get grantPermission;

  /// No description provided for @messageInfo.
  ///
  /// In en, this message translates to:
  /// **'Message info'**
  String get messageInfo;

  /// No description provided for @pinnMessage.
  ///
  /// In en, this message translates to:
  /// **'Pin message'**
  String get pinnMessage;

  /// No description provided for @redactMessage.
  ///
  /// In en, this message translates to:
  /// **'Delete message'**
  String get redactMessage;

  /// No description provided for @reportMessage.
  ///
  /// In en, this message translates to:
  /// **'Report message'**
  String get reportMessage;

  /// No description provided for @jumpToLastReadMessage.
  ///
  /// In en, this message translates to:
  /// **'Jump to last read message'**
  String get jumpToLastReadMessage;

  /// No description provided for @jump.
  ///
  /// In en, this message translates to:
  /// **'Jump'**
  String get jump;

  /// No description provided for @enterNewChat.
  ///
  /// In en, this message translates to:
  /// **'Enter new chat'**
  String get enterNewChat;

  /// No description provided for @reopenChat.
  ///
  /// In en, this message translates to:
  /// **'Reopen chat'**
  String get reopenChat;

  /// No description provided for @reply.
  ///
  /// In en, this message translates to:
  /// **'Reply'**
  String get reply;

  /// No description provided for @shareContact.
  ///
  /// In en, this message translates to:
  /// **'Share Contact'**
  String get shareContact;

  /// No description provided for @searchContacts.
  ///
  /// In en, this message translates to:
  /// **'Search contacts'**
  String get searchContacts;

  /// No description provided for @loadingContacts.
  ///
  /// In en, this message translates to:
  /// **'Loading contacts...'**
  String get loadingContacts;

  /// No description provided for @accessYourContacts.
  ///
  /// In en, this message translates to:
  /// **'Access Your Contacts'**
  String get accessYourContacts;

  /// No description provided for @contactsPermissionMessage.
  ///
  /// In en, this message translates to:
  /// **'To share contacts with your friends, please allow access to your device contacts.'**
  String get contactsPermissionMessage;

  /// No description provided for @allowAccess.
  ///
  /// In en, this message translates to:
  /// **'Allow Access'**
  String get allowAccess;

  /// No description provided for @contactsSelected.
  ///
  /// In en, this message translates to:
  /// **'{count} contact{plural} selected'**
  String contactsSelected(int count, String plural);

  /// No description provided for @sending.
  ///
  /// In en, this message translates to:
  /// **'Sending...'**
  String get sending;

  /// No description provided for @sendCount.
  ///
  /// In en, this message translates to:
  /// **'Send ({count})'**
  String sendCount(int count);

  /// No description provided for @contactsSharedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'{count} contact{plural} shared successfully'**
  String contactsSharedSuccessfully(int count, String plural);

  /// No description provided for @failedToSendContacts.
  ///
  /// In en, this message translates to:
  /// **'Failed to send contacts: {error}'**
  String failedToSendContacts(String error);

  /// No description provided for @encryptionEnabledButIncomplete.
  ///
  /// In en, this message translates to:
  /// **'Encryption is enabled but device verification is incomplete.'**
  String get encryptionEnabledButIncomplete;

  /// No description provided for @recreateChatError.
  ///
  /// In en, this message translates to:
  /// **'Trying to recreate a room that is not a direct chat. This should not be possible from the UI!'**
  String get recreateChatError;

  /// No description provided for @transferFunds.
  ///
  /// In en, this message translates to:
  /// **'Transfer Funds'**
  String get transferFunds;

  /// No description provided for @checkingRecipient.
  ///
  /// In en, this message translates to:
  /// **'Checking recipient...'**
  String get checkingRecipient;

  /// No description provided for @transferNotAvailable.
  ///
  /// In en, this message translates to:
  /// **'Transfer Not Available'**
  String get transferNotAvailable;

  /// No description provided for @recipientNoEthereumWallet.
  ///
  /// In en, this message translates to:
  /// **'Recipient has no Ethereum wallet. Please ask them to create an Ethereum wallet first.'**
  String get recipientNoEthereumWallet;

  /// No description provided for @createEthereumWalletFirst.
  ///
  /// In en, this message translates to:
  /// **'You need to create an Ethereum wallet first to make transfers.'**
  String get createEthereumWalletFirst;

  /// No description provided for @createCustomerAccountFirstChat.
  ///
  /// In en, this message translates to:
  /// **'Please create a customer account first'**
  String get createCustomerAccountFirstChat;

  /// No description provided for @createCustomerAccountFirst.
  ///
  /// In en, this message translates to:
  /// **'Please create a customer account first to make transfers.'**
  String get createCustomerAccountFirst;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @createCustomer.
  ///
  /// In en, this message translates to:
  /// **'Create Customer'**
  String get createCustomer;

  /// No description provided for @loadingWallets.
  ///
  /// In en, this message translates to:
  /// **'Loading wallets...'**
  String get loadingWallets;

  /// No description provided for @createWallet.
  ///
  /// In en, this message translates to:
  /// **'Create Wallet'**
  String get createWallet;

  /// No description provided for @loadingRecipientWallets.
  ///
  /// In en, this message translates to:
  /// **'Loading recipient wallets...'**
  String get loadingRecipientWallets;

  /// No description provided for @transferPaymentTo.
  ///
  /// In en, this message translates to:
  /// **'Transfer Payment to {recipient}'**
  String transferPaymentTo(String recipient);

  /// No description provided for @amount.
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get amount;

  /// No description provided for @pleaseEnterAmount.
  ///
  /// In en, this message translates to:
  /// **'Please enter amount'**
  String get pleaseEnterAmount;

  /// No description provided for @pleaseEnterValidAmount.
  ///
  /// In en, this message translates to:
  /// **'Please enter valid amount'**
  String get pleaseEnterValidAmount;

  /// No description provided for @minimumAmount.
  ///
  /// In en, this message translates to:
  /// **'Minimum amount is \$1'**
  String get minimumAmount;

  /// No description provided for @maximumAmount.
  ///
  /// In en, this message translates to:
  /// **'Maximum amount is \$10,000'**
  String get maximumAmount;

  /// No description provided for @currency.
  ///
  /// In en, this message translates to:
  /// **'Currency'**
  String get currency;

  /// No description provided for @sourceWallet.
  ///
  /// In en, this message translates to:
  /// **'Source Wallet'**
  String get sourceWallet;

  /// No description provided for @recipientWallets.
  ///
  /// In en, this message translates to:
  /// **'Recipient Wallets ({count})'**
  String recipientWallets(int count);

  /// No description provided for @transfer.
  ///
  /// In en, this message translates to:
  /// **'Transfer'**
  String get transfer;

  /// No description provided for @pleaseSelectSourceWallet.
  ///
  /// In en, this message translates to:
  /// **'Please select a source wallet'**
  String get pleaseSelectSourceWallet;

  /// No description provided for @createWalletAccountFirst.
  ///
  /// In en, this message translates to:
  /// **'Please create a wallet account first'**
  String get createWalletAccountFirst;

  /// No description provided for @unableToVerifyAccount.
  ///
  /// In en, this message translates to:
  /// **'Unable to verify your account. Please try again.'**
  String get unableToVerifyAccount;

  /// No description provided for @unableToFindRecipientAccount.
  ///
  /// In en, this message translates to:
  /// **'Unable to find recipient account'**
  String get unableToFindRecipientAccount;

  /// No description provided for @transferFailed.
  ///
  /// In en, this message translates to:
  /// **'Transfer failed: {error}'**
  String transferFailed(String error);

  /// No description provided for @otherPartyNotLoggedIn.
  ///
  /// In en, this message translates to:
  /// **'The other party is currently not logged in and therefore cannot receive messages!'**
  String get otherPartyNotLoggedIn;

  /// No description provided for @transferOnlyInDirectChats.
  ///
  /// In en, this message translates to:
  /// **'Transfer is only available in direct chats'**
  String get transferOnlyInDirectChats;

  /// No description provided for @transferCompleted.
  ///
  /// In en, this message translates to:
  /// **'Transfer Completed'**
  String get transferCompleted;

  /// No description provided for @transferProcessedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Transfer has been processed successfully.'**
  String get transferProcessedSuccessfully;

  /// No description provided for @failedToSendTransferMessage.
  ///
  /// In en, this message translates to:
  /// **'Failed to send transfer message'**
  String get failedToSendTransferMessage;

  /// No description provided for @voiceCallStarted.
  ///
  /// In en, this message translates to:
  /// **'Voice call started...'**
  String get voiceCallStarted;

  /// No description provided for @videoCallStarted.
  ///
  /// In en, this message translates to:
  /// **'Video call started...'**
  String get videoCallStarted;

  /// No description provided for @callsOnlyInDirectChats.
  ///
  /// In en, this message translates to:
  /// **'Calls are only available in direct chats.'**
  String get callsOnlyInDirectChats;

  /// No description provided for @noParticipantsForGroupCall.
  ///
  /// In en, this message translates to:
  /// **'No participants available for group call.'**
  String get noParticipantsForGroupCall;

  /// No description provided for @groupCallsInDevelopment.
  ///
  /// In en, this message translates to:
  /// **'Group calls are in development. Please use direct calls for now.'**
  String get groupCallsInDevelopment;

  /// No description provided for @to.
  ///
  /// In en, this message translates to:
  /// **'to'**
  String get to;

  /// No description provided for @chain.
  ///
  /// In en, this message translates to:
  /// **'Chain'**
  String get chain;

  /// No description provided for @transactionId.
  ///
  /// In en, this message translates to:
  /// **'Transaction ID'**
  String get transactionId;

  /// No description provided for @sendAsText.
  ///
  /// In en, this message translates to:
  /// **'Send as text'**
  String get sendAsText;

  /// No description provided for @whyDoYouWantToReportThis.
  ///
  /// In en, this message translates to:
  /// **'Why do you want to report this?'**
  String get whyDoYouWantToReportThis;

  /// No description provided for @reason.
  ///
  /// In en, this message translates to:
  /// **'Reason'**
  String get reason;

  /// No description provided for @offensive.
  ///
  /// In en, this message translates to:
  /// **'Offensive'**
  String get offensive;

  /// No description provided for @confirmEventUnpin.
  ///
  /// In en, this message translates to:
  /// **'Are you sure to permanently unpin the event?'**
  String get confirmEventUnpin;

  /// No description provided for @noEmotesFound.
  ///
  /// In en, this message translates to:
  /// **'No emotes found.'**
  String get noEmotesFound;

  /// No description provided for @addNewEmote.
  ///
  /// In en, this message translates to:
  /// **'Add New Emote'**
  String get addNewEmote;

  /// No description provided for @shortcode.
  ///
  /// In en, this message translates to:
  /// **'Shortcode'**
  String get shortcode;

  /// No description provided for @image.
  ///
  /// In en, this message translates to:
  /// **'Image'**
  String get image;

  /// No description provided for @addEmote.
  ///
  /// In en, this message translates to:
  /// **'Add Emote'**
  String get addEmote;

  /// No description provided for @chooseImage.
  ///
  /// In en, this message translates to:
  /// **'Choose Image'**
  String get chooseImage;

  /// No description provided for @imageSelected.
  ///
  /// In en, this message translates to:
  /// **'Image Selected'**
  String get imageSelected;

  /// No description provided for @deleteEmote.
  ///
  /// In en, this message translates to:
  /// **'Delete Emote'**
  String get deleteEmote;

  /// No description provided for @noEncryptionForPublicRooms.
  ///
  /// In en, this message translates to:
  /// **'You can only activate encryption as soon as the room is no longer publicly accessible.'**
  String get noEncryptionForPublicRooms;

  /// No description provided for @noGoogleServicesWarning.
  ///
  /// In en, this message translates to:
  /// **'Firebase Cloud Messaging doesn\'t appear to be available on your device. To still receive push notifications, we recommend installing ntfy. With ntfy or another Unified Push provider you can receive push notifications in a data secure way. You can download ntfy from the PlayStore or from F-Droid.'**
  String get noGoogleServicesWarning;

  /// No description provided for @noMatrixServer.
  ///
  /// In en, this message translates to:
  /// **'{server1} is no matrix server, use {server2} instead?'**
  String noMatrixServer(String server1, String server2);

  /// No description provided for @shareInviteLink.
  ///
  /// In en, this message translates to:
  /// **'Share invite link'**
  String get shareInviteLink;

  /// No description provided for @scanQrCode.
  ///
  /// In en, this message translates to:
  /// **'Scan QR code'**
  String get scanQrCode;

  /// No description provided for @none.
  ///
  /// In en, this message translates to:
  /// **'None'**
  String get none;

  /// No description provided for @noPasswordRecoveryDescription.
  ///
  /// In en, this message translates to:
  /// **'You have not added a way to recover your password yet.'**
  String get noPasswordRecoveryDescription;

  /// No description provided for @noPermission.
  ///
  /// In en, this message translates to:
  /// **'No permission'**
  String get noPermission;

  /// No description provided for @noRoomsFound.
  ///
  /// In en, this message translates to:
  /// **'No rooms found '**
  String get noRoomsFound;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @notificationsEnabledForThisAccount.
  ///
  /// In en, this message translates to:
  /// **'Notifications enabled for this account'**
  String get notificationsEnabledForThisAccount;

  /// No description provided for @numUsersTyping.
  ///
  /// In en, this message translates to:
  /// **'{count} users are typing '**
  String numUsersTyping(int count);

  /// No description provided for @obtainingLocation.
  ///
  /// In en, this message translates to:
  /// **'Obtaining location '**
  String get obtainingLocation;

  /// No description provided for @locationFound.
  ///
  /// In en, this message translates to:
  /// **'Location Found'**
  String get locationFound;

  /// No description provided for @otherPartyCannotReceiveEncryptedMessages.
  ///
  /// In en, this message translates to:
  /// **'Other party cannot receive encrypted messages'**
  String get otherPartyCannotReceiveEncryptedMessages;

  /// No description provided for @accuracy.
  ///
  /// In en, this message translates to:
  /// **'Accuracy'**
  String get accuracy;

  /// No description provided for @offline.
  ///
  /// In en, this message translates to:
  /// **'Offline'**
  String get offline;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'Ok'**
  String get ok;

  /// No description provided for @online.
  ///
  /// In en, this message translates to:
  /// **'Online'**
  String get online;

  /// No description provided for @onlineKeyBackupEnabled.
  ///
  /// In en, this message translates to:
  /// **'Online Key Backup is enabled'**
  String get onlineKeyBackupEnabled;

  /// No description provided for @oopsPushError.
  ///
  /// In en, this message translates to:
  /// **'Oops! Unfortunately, an error occurred when setting up the push notifications.'**
  String get oopsPushError;

  /// No description provided for @oopsSomethingWentWrong.
  ///
  /// In en, this message translates to:
  /// **'Oops, something went wrong '**
  String get oopsSomethingWentWrong;

  /// No description provided for @openAppToReadMessages.
  ///
  /// In en, this message translates to:
  /// **'Open app to read messages'**
  String get openAppToReadMessages;

  /// No description provided for @openCamera.
  ///
  /// In en, this message translates to:
  /// **'Open camera'**
  String get openCamera;

  /// No description provided for @openVideoCamera.
  ///
  /// In en, this message translates to:
  /// **'Open camera for a video'**
  String get openVideoCamera;

  /// No description provided for @oneClientLoggedOut.
  ///
  /// In en, this message translates to:
  /// **'One of your clients has been logged out'**
  String get oneClientLoggedOut;

  /// No description provided for @addAccount.
  ///
  /// In en, this message translates to:
  /// **'Add account'**
  String get addAccount;

  /// No description provided for @editBundlesForAccount.
  ///
  /// In en, this message translates to:
  /// **'Edit bundles for this account'**
  String get editBundlesForAccount;

  /// No description provided for @addToBundle.
  ///
  /// In en, this message translates to:
  /// **'Add to bundle'**
  String get addToBundle;

  /// No description provided for @bundleName.
  ///
  /// In en, this message translates to:
  /// **'Bundle name'**
  String get bundleName;

  /// No description provided for @enableMultiAccounts.
  ///
  /// In en, this message translates to:
  /// **'(BETA) Enable multi accounts on this device'**
  String get enableMultiAccounts;

  /// No description provided for @openInMaps.
  ///
  /// In en, this message translates to:
  /// **'Open in map'**
  String get openInMaps;

  /// No description provided for @link.
  ///
  /// In en, this message translates to:
  /// **'Link'**
  String get link;

  /// No description provided for @serverRequiresEmail.
  ///
  /// In en, this message translates to:
  /// **'This server needs to validate your email address for registration.'**
  String get serverRequiresEmail;

  /// No description provided for @or.
  ///
  /// In en, this message translates to:
  /// **'Or'**
  String get or;

  /// No description provided for @participant.
  ///
  /// In en, this message translates to:
  /// **'Participant'**
  String get participant;

  /// No description provided for @passphraseOrKey.
  ///
  /// In en, this message translates to:
  /// **'passphrase or recovery key'**
  String get passphraseOrKey;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @passwordForgotten.
  ///
  /// In en, this message translates to:
  /// **'Password forgotten'**
  String get passwordForgotten;

  /// No description provided for @passwordHasBeenChanged.
  ///
  /// In en, this message translates to:
  /// **'Password has been changed'**
  String get passwordHasBeenChanged;

  /// No description provided for @hideMemberChangesInPublicChats.
  ///
  /// In en, this message translates to:
  /// **'Hide member changes in public chats'**
  String get hideMemberChangesInPublicChats;

  /// No description provided for @hideMemberChangesInPublicChatsBody.
  ///
  /// In en, this message translates to:
  /// **'Do not show in the chat timeline if someone joins or leaves a public chat to improve readability.'**
  String get hideMemberChangesInPublicChatsBody;

  /// No description provided for @overview.
  ///
  /// In en, this message translates to:
  /// **'Overview'**
  String get overview;

  /// No description provided for @notifyMeFor.
  ///
  /// In en, this message translates to:
  /// **'Notify me for'**
  String get notifyMeFor;

  /// No description provided for @passwordRecoverySettings.
  ///
  /// In en, this message translates to:
  /// **'Password recovery settings'**
  String get passwordRecoverySettings;

  /// No description provided for @passwordRecovery.
  ///
  /// In en, this message translates to:
  /// **'Password recovery'**
  String get passwordRecovery;

  /// No description provided for @people.
  ///
  /// In en, this message translates to:
  /// **'People'**
  String get people;

  /// No description provided for @pickImage.
  ///
  /// In en, this message translates to:
  /// **'Pick an image'**
  String get pickImage;

  /// No description provided for @pin.
  ///
  /// In en, this message translates to:
  /// **'Pin'**
  String get pin;

  /// No description provided for @play.
  ///
  /// In en, this message translates to:
  /// **'Play {fileName}'**
  String play(String fileName);

  /// No description provided for @pleaseChoose.
  ///
  /// In en, this message translates to:
  /// **'Please choose'**
  String get pleaseChoose;

  /// No description provided for @pleaseChooseAPasscode.
  ///
  /// In en, this message translates to:
  /// **'Please choose a pass code'**
  String get pleaseChooseAPasscode;

  /// No description provided for @pleaseClickOnLink.
  ///
  /// In en, this message translates to:
  /// **'Please click on the link in the email and then proceed.'**
  String get pleaseClickOnLink;

  /// No description provided for @pleaseEnter4Digits.
  ///
  /// In en, this message translates to:
  /// **'Please enter 4 digits or leave empty to disable app lock.'**
  String get pleaseEnter4Digits;

  /// No description provided for @pleaseEnterRecoveryKey.
  ///
  /// In en, this message translates to:
  /// **'Please enter your recovery key:'**
  String get pleaseEnterRecoveryKey;

  /// No description provided for @pleaseEnterYourPassword.
  ///
  /// In en, this message translates to:
  /// **'Please enter your password'**
  String get pleaseEnterYourPassword;

  /// No description provided for @pleaseEnterYourPin.
  ///
  /// In en, this message translates to:
  /// **'Please enter your pin'**
  String get pleaseEnterYourPin;

  /// No description provided for @pleaseEnterYourUsername.
  ///
  /// In en, this message translates to:
  /// **'Please enter your username'**
  String get pleaseEnterYourUsername;

  /// No description provided for @pleaseFollowInstructionsOnWeb.
  ///
  /// In en, this message translates to:
  /// **'Please follow the instructions on the website and tap on next.'**
  String get pleaseFollowInstructionsOnWeb;

  /// No description provided for @publicRooms.
  ///
  /// In en, this message translates to:
  /// **'Public Rooms'**
  String get publicRooms;

  /// No description provided for @pushRules.
  ///
  /// In en, this message translates to:
  /// **'Push rules'**
  String get pushRules;

  /// No description provided for @recording.
  ///
  /// In en, this message translates to:
  /// **'Recording'**
  String get recording;

  /// No description provided for @redactedBy.
  ///
  /// In en, this message translates to:
  /// **'Deleted by {username}'**
  String redactedBy(String username);

  /// No description provided for @directChat.
  ///
  /// In en, this message translates to:
  /// **'Direct chat'**
  String get directChat;

  /// No description provided for @redactedByBecause.
  ///
  /// In en, this message translates to:
  /// **'Deleted by {username} because: \"{reason}\"'**
  String redactedByBecause(String username, String reason);

  /// No description provided for @redactedAnEvent.
  ///
  /// In en, this message translates to:
  /// **'{username} deleted an event'**
  String redactedAnEvent(String username);

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @reject.
  ///
  /// In en, this message translates to:
  /// **'Reject'**
  String get reject;

  /// No description provided for @rejectedTheInvitation.
  ///
  /// In en, this message translates to:
  /// **'{username} rejected the invitation'**
  String rejectedTheInvitation(String username);

  /// No description provided for @rejoin.
  ///
  /// In en, this message translates to:
  /// **'Rejoin'**
  String get rejoin;

  /// No description provided for @removeAllOtherDevices.
  ///
  /// In en, this message translates to:
  /// **'Remove all other devices'**
  String get removeAllOtherDevices;

  /// No description provided for @removedBy.
  ///
  /// In en, this message translates to:
  /// **'Removed by {username}'**
  String removedBy(String username);

  /// No description provided for @removeDevice.
  ///
  /// In en, this message translates to:
  /// **'Remove device'**
  String get removeDevice;

  /// No description provided for @unbanFromChat.
  ///
  /// In en, this message translates to:
  /// **'Unban from chat'**
  String get unbanFromChat;

  /// No description provided for @removeYourAvatar.
  ///
  /// In en, this message translates to:
  /// **'Remove your avatar'**
  String get removeYourAvatar;

  /// No description provided for @requestPermission.
  ///
  /// In en, this message translates to:
  /// **'Request permission'**
  String get requestPermission;

  /// No description provided for @roomHasBeenUpgraded.
  ///
  /// In en, this message translates to:
  /// **'Room has been upgraded'**
  String get roomHasBeenUpgraded;

  /// No description provided for @roomVersion.
  ///
  /// In en, this message translates to:
  /// **'Room version'**
  String get roomVersion;

  /// No description provided for @saveFile.
  ///
  /// In en, this message translates to:
  /// **'Save file'**
  String get saveFile;

  /// No description provided for @security.
  ///
  /// In en, this message translates to:
  /// **'Security'**
  String get security;

  /// No description provided for @seenByUser.
  ///
  /// In en, this message translates to:
  /// **'Seen by {username}'**
  String seenByUser(String username);

  /// No description provided for @sendAMessage.
  ///
  /// In en, this message translates to:
  /// **'Send a message'**
  String get sendAMessage;

  /// No description provided for @sendAudio.
  ///
  /// In en, this message translates to:
  /// **'Send audio'**
  String get sendAudio;

  /// No description provided for @sendFile.
  ///
  /// In en, this message translates to:
  /// **'Send file'**
  String get sendFile;

  /// No description provided for @sendImage.
  ///
  /// In en, this message translates to:
  /// **'Send image'**
  String get sendImage;

  /// No description provided for @sendImages.
  ///
  /// In en, this message translates to:
  /// **'Send {count} image'**
  String sendImages(int count);

  /// No description provided for @sendMessages.
  ///
  /// In en, this message translates to:
  /// **'Send messages'**
  String get sendMessages;

  /// No description provided for @sendOriginal.
  ///
  /// In en, this message translates to:
  /// **'Send original'**
  String get sendOriginal;

  /// No description provided for @sendSticker.
  ///
  /// In en, this message translates to:
  /// **'Send sticker'**
  String get sendSticker;

  /// No description provided for @sendVideo.
  ///
  /// In en, this message translates to:
  /// **'Send video'**
  String get sendVideo;

  /// No description provided for @sentAFile.
  ///
  /// In en, this message translates to:
  /// **' {username} sent a file'**
  String sentAFile(String username);

  /// No description provided for @pickFiles.
  ///
  /// In en, this message translates to:
  /// **'Pick Files'**
  String get pickFiles;

  /// No description provided for @allFiles.
  ///
  /// In en, this message translates to:
  /// **'All Files'**
  String get allFiles;

  /// No description provided for @documents.
  ///
  /// In en, this message translates to:
  /// **'Documents'**
  String get documents;

  /// No description provided for @spreadsheets.
  ///
  /// In en, this message translates to:
  /// **'Spreadsheets'**
  String get spreadsheets;

  /// No description provided for @pdf.
  ///
  /// In en, this message translates to:
  /// **'PDF'**
  String get pdf;

  /// No description provided for @twitterLoginComingSoon.
  ///
  /// In en, this message translates to:
  /// **'Twitter login will be available soon!'**
  String get twitterLoginComingSoon;

  /// No description provided for @googleLoginComingSoon.
  ///
  /// In en, this message translates to:
  /// **'Google login will be available soon!'**
  String get googleLoginComingSoon;

  /// No description provided for @audioFile.
  ///
  /// In en, this message translates to:
  /// **'Audio'**
  String get audioFile;

  /// No description provided for @sentAnAudio.
  ///
  /// In en, this message translates to:
  /// **' {username} sent an audio'**
  String sentAnAudio(String username);

  /// No description provided for @sentAPicture.
  ///
  /// In en, this message translates to:
  /// **' {username} sent a picture'**
  String sentAPicture(String username);

  /// No description provided for @sentASticker.
  ///
  /// In en, this message translates to:
  /// **' {username} sent a sticker'**
  String sentASticker(String username);

  /// No description provided for @sentAVideo.
  ///
  /// In en, this message translates to:
  /// **' {username} sent a video'**
  String sentAVideo(String username);

  /// No description provided for @sentCallInformations.
  ///
  /// In en, this message translates to:
  /// **'{senderName} sent call information'**
  String sentCallInformations(String senderName);

  /// No description provided for @separateChatTypes.
  ///
  /// In en, this message translates to:
  /// **'Separate Direct Chats and Groups'**
  String get separateChatTypes;

  /// No description provided for @setAsCanonicalAlias.
  ///
  /// In en, this message translates to:
  /// **'Set as main alias'**
  String get setAsCanonicalAlias;

  /// No description provided for @setInvitationLink.
  ///
  /// In en, this message translates to:
  /// **'Set invitation link'**
  String get setInvitationLink;

  /// No description provided for @setPermissionsLevel.
  ///
  /// In en, this message translates to:
  /// **'Set permissions level'**
  String get setPermissionsLevel;

  /// No description provided for @setStatus.
  ///
  /// In en, this message translates to:
  /// **'Set status'**
  String get setStatus;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @share.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get share;

  /// No description provided for @sharedTheLocation.
  ///
  /// In en, this message translates to:
  /// **'{username} shared their location'**
  String sharedTheLocation(String username);

  /// No description provided for @shareLocation.
  ///
  /// In en, this message translates to:
  /// **'Share location'**
  String get shareLocation;

  /// No description provided for @showPassword.
  ///
  /// In en, this message translates to:
  /// **'Show password'**
  String get showPassword;

  /// No description provided for @presenceStyle.
  ///
  /// In en, this message translates to:
  /// **'Presence:'**
  String get presenceStyle;

  /// No description provided for @presencesToggle.
  ///
  /// In en, this message translates to:
  /// **'Show status messages from other users'**
  String get presencesToggle;

  /// No description provided for @singlesignon.
  ///
  /// In en, this message translates to:
  /// **'Single Sign on'**
  String get singlesignon;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// No description provided for @sourceCode.
  ///
  /// In en, this message translates to:
  /// **'Source code'**
  String get sourceCode;

  /// No description provided for @spaceIsPublic.
  ///
  /// In en, this message translates to:
  /// **'Space is public'**
  String get spaceIsPublic;

  /// No description provided for @spaceName.
  ///
  /// In en, this message translates to:
  /// **'Space name'**
  String get spaceName;

  /// No description provided for @startedACall.
  ///
  /// In en, this message translates to:
  /// **'{senderName} started a call'**
  String startedACall(String senderName);

  /// No description provided for @startFirstChat.
  ///
  /// In en, this message translates to:
  /// **'Start your first chat'**
  String get startFirstChat;

  /// No description provided for @status.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get status;

  /// No description provided for @statusExampleMessage.
  ///
  /// In en, this message translates to:
  /// **'How are you today?'**
  String get statusExampleMessage;

  /// No description provided for @submit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submit;

  /// No description provided for @synchronizingPleaseWait.
  ///
  /// In en, this message translates to:
  /// **'Synchronizing  Please wait.'**
  String get synchronizingPleaseWait;

  /// No description provided for @synchronizingPleaseWaitCounter.
  ///
  /// In en, this message translates to:
  /// **' Synchronizing  ({percentage}%)'**
  String synchronizingPleaseWaitCounter(String percentage);

  /// No description provided for @systemTheme.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get systemTheme;

  /// No description provided for @theyDontMatch.
  ///
  /// In en, this message translates to:
  /// **'They Don\'t Match'**
  String get theyDontMatch;

  /// No description provided for @theyMatch.
  ///
  /// In en, this message translates to:
  /// **'They Match'**
  String get theyMatch;

  /// No description provided for @notFound.
  ///
  /// In en, this message translates to:
  /// **'Not found'**
  String get notFound;

  /// No description provided for @pinLimitMessage.
  ///
  /// In en, this message translates to:
  /// **'You can only pin up to 3 chats'**
  String get pinLimitMessage;

  /// Title for the application
  ///
  /// In en, this message translates to:
  /// **'BMP'**
  String get title;

  /// No description provided for @toggleFavorite.
  ///
  /// In en, this message translates to:
  /// **'Toggle Favorite'**
  String get toggleFavorite;

  /// No description provided for @toggleMuted.
  ///
  /// In en, this message translates to:
  /// **'Toggle Muted'**
  String get toggleMuted;

  /// No description provided for @toggleUnread.
  ///
  /// In en, this message translates to:
  /// **'Mark Read/Unread'**
  String get toggleUnread;

  /// No description provided for @tooManyRequestsWarning.
  ///
  /// In en, this message translates to:
  /// **'Too many requests. Please try again later!'**
  String get tooManyRequestsWarning;

  /// No description provided for @transferFromAnotherDevice.
  ///
  /// In en, this message translates to:
  /// **'Transfer from another device'**
  String get transferFromAnotherDevice;

  /// No description provided for @tryToSendAgain.
  ///
  /// In en, this message translates to:
  /// **'Try to send again'**
  String get tryToSendAgain;

  /// No description provided for @unavailable.
  ///
  /// In en, this message translates to:
  /// **'Unavailable'**
  String get unavailable;

  /// No description provided for @unbannedUser.
  ///
  /// In en, this message translates to:
  /// **'{username} unbanned {targetName}'**
  String unbannedUser(String username, String targetName);

  /// No description provided for @unblockDevice.
  ///
  /// In en, this message translates to:
  /// **'Unblock Device'**
  String get unblockDevice;

  /// No description provided for @unknownDevice.
  ///
  /// In en, this message translates to:
  /// **'Unknown device'**
  String get unknownDevice;

  /// No description provided for @unknownEncryptionAlgorithm.
  ///
  /// In en, this message translates to:
  /// **'Unknown encryption algorithm'**
  String get unknownEncryptionAlgorithm;

  /// No description provided for @unknownEvent.
  ///
  /// In en, this message translates to:
  /// **'Unknown event \'{type}\''**
  String unknownEvent(String type);

  /// No description provided for @unmuteChat.
  ///
  /// In en, this message translates to:
  /// **'Unmute chat'**
  String get unmuteChat;

  /// No description provided for @unpin.
  ///
  /// In en, this message translates to:
  /// **'Unpin'**
  String get unpin;

  /// No description provided for @unreadChats.
  ///
  /// In en, this message translates to:
  /// **'Unread Chats'**
  String get unreadChats;

  /// No description provided for @userAndOthersAreTyping.
  ///
  /// In en, this message translates to:
  /// **'{username} and {count} others are typing '**
  String userAndOthersAreTyping(String username, int count);

  /// No description provided for @userAndUserAreTyping.
  ///
  /// In en, this message translates to:
  /// **'{username} and {username2} are typing '**
  String userAndUserAreTyping(String username, String username2);

  /// No description provided for @userIsTyping.
  ///
  /// In en, this message translates to:
  /// **'{username} is typing '**
  String userIsTyping(String username);

  /// No description provided for @userLeftTheChat.
  ///
  /// In en, this message translates to:
  /// **' {username} left the chat'**
  String userLeftTheChat(String username);

  /// No description provided for @username.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get username;

  /// No description provided for @userSentUnknownEvent.
  ///
  /// In en, this message translates to:
  /// **'{username} sent a {type} event'**
  String userSentUnknownEvent(String username, String type);

  /// No description provided for @unverified.
  ///
  /// In en, this message translates to:
  /// **'Unverified'**
  String get unverified;

  /// No description provided for @verified.
  ///
  /// In en, this message translates to:
  /// **'Verified'**
  String get verified;

  /// No description provided for @verify.
  ///
  /// In en, this message translates to:
  /// **'Verify'**
  String get verify;

  /// No description provided for @verifyStart.
  ///
  /// In en, this message translates to:
  /// **'Start Verification'**
  String get verifyStart;

  /// No description provided for @verifySuccess.
  ///
  /// In en, this message translates to:
  /// **'You successfully verified!'**
  String get verifySuccess;

  /// No description provided for @verifyTitle.
  ///
  /// In en, this message translates to:
  /// **'Verifying other account'**
  String get verifyTitle;

  /// No description provided for @videoCall.
  ///
  /// In en, this message translates to:
  /// **'Video call'**
  String get videoCall;

  /// No description provided for @visibilityOfTheChatHistory.
  ///
  /// In en, this message translates to:
  /// **'Visibility of the chat history'**
  String get visibilityOfTheChatHistory;

  /// No description provided for @visibleForAllParticipants.
  ///
  /// In en, this message translates to:
  /// **'Visible for all participants'**
  String get visibleForAllParticipants;

  /// No description provided for @visibleForEveryone.
  ///
  /// In en, this message translates to:
  /// **'Visible for everyone'**
  String get visibleForEveryone;

  /// No description provided for @voiceMessage.
  ///
  /// In en, this message translates to:
  /// **'Voice message'**
  String get voiceMessage;

  /// No description provided for @waitingPartnerAcceptRequest.
  ///
  /// In en, this message translates to:
  /// **'Waiting for partner to accept the request '**
  String get waitingPartnerAcceptRequest;

  /// No description provided for @waitingPartnerEmoji.
  ///
  /// In en, this message translates to:
  /// **'Waiting for partner to accept the emoji '**
  String get waitingPartnerEmoji;

  /// No description provided for @waitingPartnerNumbers.
  ///
  /// In en, this message translates to:
  /// **'Waiting for partner to accept the numbers '**
  String get waitingPartnerNumbers;

  /// No description provided for @wallpaper.
  ///
  /// In en, this message translates to:
  /// **'Wallpaper:'**
  String get wallpaper;

  /// No description provided for @weSentYouAnEmail.
  ///
  /// In en, this message translates to:
  /// **'We sent you an email'**
  String get weSentYouAnEmail;

  /// No description provided for @whoIsAllowedToJoinThisGroup.
  ///
  /// In en, this message translates to:
  /// **'Who is allowed to join this group'**
  String get whoIsAllowedToJoinThisGroup;

  /// No description provided for @unableToPlayAudioMessage.
  ///
  /// In en, this message translates to:
  /// **'Unable to play audio message'**
  String get unableToPlayAudioMessage;

  /// No description provided for @message.
  ///
  /// In en, this message translates to:
  /// **'Message'**
  String get message;

  /// No description provided for @call.
  ///
  /// In en, this message translates to:
  /// **'Call'**
  String get call;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @edited.
  ///
  /// In en, this message translates to:
  /// **'edited'**
  String get edited;

  /// No description provided for @withTheseAddressesRecoveryDescription.
  ///
  /// In en, this message translates to:
  /// **'With these addresses you can recover your password.'**
  String get withTheseAddressesRecoveryDescription;

  /// No description provided for @writeAMessage.
  ///
  /// In en, this message translates to:
  /// **'Write a message '**
  String get writeAMessage;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @you.
  ///
  /// In en, this message translates to:
  /// **'You'**
  String get you;

  /// No description provided for @youAreNoLongerParticipatingInThisChat.
  ///
  /// In en, this message translates to:
  /// **'You are no longer participating in this chat'**
  String get youAreNoLongerParticipatingInThisChat;

  /// No description provided for @youHaveBeenBannedFromThisChat.
  ///
  /// In en, this message translates to:
  /// **'You have been banned from this chat'**
  String get youHaveBeenBannedFromThisChat;

  /// No description provided for @yourPublicKey.
  ///
  /// In en, this message translates to:
  /// **'Your public key'**
  String get yourPublicKey;

  /// No description provided for @time.
  ///
  /// In en, this message translates to:
  /// **'Time'**
  String get time;

  /// No description provided for @messageType.
  ///
  /// In en, this message translates to:
  /// **'Message Type'**
  String get messageType;

  /// No description provided for @sender.
  ///
  /// In en, this message translates to:
  /// **'Sender'**
  String get sender;

  /// No description provided for @removeFromSpace.
  ///
  /// In en, this message translates to:
  /// **'Remove from space'**
  String get removeFromSpace;

  /// No description provided for @addToSpaceDescription.
  ///
  /// In en, this message translates to:
  /// **'Select a space to add this chat to it.'**
  String get addToSpaceDescription;

  /// No description provided for @start.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get start;

  /// No description provided for @publish.
  ///
  /// In en, this message translates to:
  /// **'Publish'**
  String get publish;

  /// No description provided for @videoWithSize.
  ///
  /// In en, this message translates to:
  /// **'Video ({size})'**
  String videoWithSize(String size);

  /// No description provided for @openChat.
  ///
  /// In en, this message translates to:
  /// **'Open Chat'**
  String get openChat;

  /// No description provided for @markAsRead.
  ///
  /// In en, this message translates to:
  /// **'Mark as read'**
  String get markAsRead;

  /// No description provided for @reportUser.
  ///
  /// In en, this message translates to:
  /// **'Report user'**
  String get reportUser;

  /// No description provided for @dismiss.
  ///
  /// In en, this message translates to:
  /// **'Dismiss'**
  String get dismiss;

  /// No description provided for @reactedWith.
  ///
  /// In en, this message translates to:
  /// **'{sender} reacted with {reaction}'**
  String reactedWith(String sender, String reaction);

  /// No description provided for @pinMessage.
  ///
  /// In en, this message translates to:
  /// **'Pin to room'**
  String get pinMessage;

  /// No description provided for @shareItemsValidationError.
  ///
  /// In en, this message translates to:
  /// **'Invalid file path'**
  String get shareItemsValidationError;

  /// No description provided for @voiceRecordingPermissionDenied.
  ///
  /// In en, this message translates to:
  /// **'Voice recording permission denied'**
  String get voiceRecordingPermissionDenied;

  /// No description provided for @noEventsSelected.
  ///
  /// In en, this message translates to:
  /// **'No events selected'**
  String get noEventsSelected;

  /// No description provided for @actionFailed.
  ///
  /// In en, this message translates to:
  /// **'{action} failed: {error}'**
  String actionFailed(String action, String error);

  /// No description provided for @emojis.
  ///
  /// In en, this message translates to:
  /// **'Emojis'**
  String get emojis;

  /// No description provided for @placeCall.
  ///
  /// In en, this message translates to:
  /// **'Place call'**
  String get placeCall;

  /// No description provided for @voiceCall.
  ///
  /// In en, this message translates to:
  /// **'Voice call'**
  String get voiceCall;

  /// No description provided for @videoCallsBetaWarning.
  ///
  /// In en, this message translates to:
  /// **'Please note that video calls are currently in beta. They might not work as expected or work at all on all platforms.'**
  String get videoCallsBetaWarning;

  /// No description provided for @experimentalVideoCalls.
  ///
  /// In en, this message translates to:
  /// **'Experimental video calls'**
  String get experimentalVideoCalls;

  /// No description provided for @emailOrUsername.
  ///
  /// In en, this message translates to:
  /// **'Email or username'**
  String get emailOrUsername;

  /// No description provided for @indexedDbErrorTitle.
  ///
  /// In en, this message translates to:
  /// **'Private mode issues'**
  String get indexedDbErrorTitle;

  /// No description provided for @indexedDbErrorLong.
  ///
  /// In en, this message translates to:
  /// **'The message storage is unfortunately not enabled in private mode by default.\nPlease visit\n - about:config\n - set dom.indexedDB.privateBrowsing.enabled to true\nOtherwise, it is not possible to run BMP.'**
  String get indexedDbErrorLong;

  /// No description provided for @switchToAccount.
  ///
  /// In en, this message translates to:
  /// **'Switch to account {number}'**
  String switchToAccount(String number);

  /// No description provided for @nextAccount.
  ///
  /// In en, this message translates to:
  /// **'Next account'**
  String get nextAccount;

  /// No description provided for @previousAccount.
  ///
  /// In en, this message translates to:
  /// **'Previous account'**
  String get previousAccount;

  /// No description provided for @addWidget.
  ///
  /// In en, this message translates to:
  /// **'Add widget'**
  String get addWidget;

  /// No description provided for @widgetVideo.
  ///
  /// In en, this message translates to:
  /// **'Video'**
  String get widgetVideo;

  /// No description provided for @widgetEtherpad.
  ///
  /// In en, this message translates to:
  /// **'Text note'**
  String get widgetEtherpad;

  /// No description provided for @widgetJitsi.
  ///
  /// In en, this message translates to:
  /// **'Jitsi Meet'**
  String get widgetJitsi;

  /// No description provided for @widgetCustom.
  ///
  /// In en, this message translates to:
  /// **'Custom'**
  String get widgetCustom;

  /// No description provided for @widgetName.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get widgetName;

  /// No description provided for @widgetUrlError.
  ///
  /// In en, this message translates to:
  /// **'This is not a valid URL.'**
  String get widgetUrlError;

  /// No description provided for @widgetNameError.
  ///
  /// In en, this message translates to:
  /// **'Please provide a display name.'**
  String get widgetNameError;

  /// No description provided for @errorAddingWidget.
  ///
  /// In en, this message translates to:
  /// **'Error adding the widget.'**
  String get errorAddingWidget;

  /// No description provided for @youRejectedTheInvitation.
  ///
  /// In en, this message translates to:
  /// **'You rejected the invitation'**
  String get youRejectedTheInvitation;

  /// No description provided for @youJoinedTheChat.
  ///
  /// In en, this message translates to:
  /// **'You joined the chat'**
  String get youJoinedTheChat;

  /// No description provided for @youAcceptedTheInvitation.
  ///
  /// In en, this message translates to:
  /// **' You accepted the invitation'**
  String get youAcceptedTheInvitation;

  /// No description provided for @youBannedUser.
  ///
  /// In en, this message translates to:
  /// **'You banned {user}'**
  String youBannedUser(String user);

  /// No description provided for @youHaveWithdrawnTheInvitationFor.
  ///
  /// In en, this message translates to:
  /// **'You have withdrawn the invitation for {user}'**
  String youHaveWithdrawnTheInvitationFor(String user);

  /// No description provided for @youInvitedToBy.
  ///
  /// In en, this message translates to:
  /// **' You have been invited via link to:\n{alias}'**
  String youInvitedToBy(String alias);

  /// No description provided for @invitedBy.
  ///
  /// In en, this message translates to:
  /// **' Invited by {user}'**
  String invitedBy(String user);

  /// No description provided for @youInvitedUser.
  ///
  /// In en, this message translates to:
  /// **' You invited {user}'**
  String youInvitedUser(String user);

  /// No description provided for @youKicked.
  ///
  /// In en, this message translates to:
  /// **'You kicked {user}'**
  String youKicked(String user);

  /// No description provided for @youKickedAndBanned.
  ///
  /// In en, this message translates to:
  /// **'You kicked and banned {user}'**
  String youKickedAndBanned(String user);

  /// No description provided for @youUnbannedUser.
  ///
  /// In en, this message translates to:
  /// **'You unbanned {user}'**
  String youUnbannedUser(String user);

  /// No description provided for @hasKnocked.
  ///
  /// In en, this message translates to:
  /// **' {user} has knocked'**
  String hasKnocked(String user);

  /// No description provided for @userWouldLikeToChangeTheChat.
  ///
  /// In en, this message translates to:
  /// **'{user} would like to join the chat.'**
  String userWouldLikeToChangeTheChat(String user);

  /// No description provided for @noPublicLinkHasBeenCreatedYet.
  ///
  /// In en, this message translates to:
  /// **'No public link has been created yet'**
  String get noPublicLinkHasBeenCreatedYet;

  /// No description provided for @knock.
  ///
  /// In en, this message translates to:
  /// **'Knock'**
  String get knock;

  /// No description provided for @users.
  ///
  /// In en, this message translates to:
  /// **'Users'**
  String get users;

  /// No description provided for @countFiles.
  ///
  /// In en, this message translates to:
  /// **'{count} files'**
  String countFiles(int count);

  /// No description provided for @user.
  ///
  /// In en, this message translates to:
  /// **'User'**
  String get user;

  /// No description provided for @custom.
  ///
  /// In en, this message translates to:
  /// **'Custom'**
  String get custom;

  /// No description provided for @callingPermissions.
  ///
  /// In en, this message translates to:
  /// **'Calling permissions'**
  String get callingPermissions;

  /// No description provided for @callingAccount.
  ///
  /// In en, this message translates to:
  /// **'Calling account'**
  String get callingAccount;

  /// No description provided for @callingAccountDetails.
  ///
  /// In en, this message translates to:
  /// **'Allows BMP to use the native android dialer app.'**
  String get callingAccountDetails;

  /// No description provided for @appearOnTop.
  ///
  /// In en, this message translates to:
  /// **'Appear on top'**
  String get appearOnTop;

  /// No description provided for @appearOnTopDetails.
  ///
  /// In en, this message translates to:
  /// **'Allows the app to appear on top (not needed if you already have BMP setup as a calling account)'**
  String get appearOnTopDetails;

  /// No description provided for @otherCallingPermissions.
  ///
  /// In en, this message translates to:
  /// **'Microphone, camera and other BMP permissions'**
  String get otherCallingPermissions;

  /// No description provided for @whyIsThisMessageEncrypted.
  ///
  /// In en, this message translates to:
  /// **'Why is this message unreadable?'**
  String get whyIsThisMessageEncrypted;

  /// No description provided for @noKeyForThisMessage.
  ///
  /// In en, this message translates to:
  /// **'This can happen if the message was sent before you have signed in to your account at this device.\n\nIt is also possible that the sender has blocked your device or something went wrong with the internet connection.\n\nAre you able to read the message on another session? Then you can transfer the message from it! Go to Settings > Devices and make sure that your devices have verified each other. When you open the room the next time and both sessions are in the foreground, the keys will be transmitted automatically.\n\nDo you not want to lose the keys when logging out or switching devices? Make sure that you have enabled the chat backup in the settings.'**
  String get noKeyForThisMessage;

  /// No description provided for @newSpace.
  ///
  /// In en, this message translates to:
  /// **'New space'**
  String get newSpace;

  /// No description provided for @enterSpace.
  ///
  /// In en, this message translates to:
  /// **'Enter space'**
  String get enterSpace;

  /// No description provided for @enterRoom.
  ///
  /// In en, this message translates to:
  /// **'Enter room'**
  String get enterRoom;

  /// No description provided for @allSpaces.
  ///
  /// In en, this message translates to:
  /// **'All spaces'**
  String get allSpaces;

  /// No description provided for @numChats.
  ///
  /// In en, this message translates to:
  /// **'{number} chats'**
  String numChats(String number);

  /// No description provided for @hideUnimportantStateEvents.
  ///
  /// In en, this message translates to:
  /// **'Hide unimportant state events'**
  String get hideUnimportantStateEvents;

  /// No description provided for @doNotShowAgain.
  ///
  /// In en, this message translates to:
  /// **'Do not show again'**
  String get doNotShowAgain;

  /// No description provided for @wasDirectChatDisplayName.
  ///
  /// In en, this message translates to:
  /// **'Empty chat (was {oldDisplayName})'**
  String wasDirectChatDisplayName(String oldDisplayName);

  /// No description provided for @newSpaceDescription.
  ///
  /// In en, this message translates to:
  /// **'Spaces allows you to consolidate your chats and build private or public communities.'**
  String get newSpaceDescription;

  /// No description provided for @encryptThisChat.
  ///
  /// In en, this message translates to:
  /// **'Encrypt this chat'**
  String get encryptThisChat;

  /// No description provided for @disableEncryptionWarning.
  ///
  /// In en, this message translates to:
  /// **'For security reasons you can not disable encryption in a chat, where it has been enabled before.'**
  String get disableEncryptionWarning;

  /// No description provided for @sorryThatsNotPossible.
  ///
  /// In en, this message translates to:
  /// **'Sorry... that is not possible'**
  String get sorryThatsNotPossible;

  /// No description provided for @deviceKeys.
  ///
  /// In en, this message translates to:
  /// **'Device keys:'**
  String get deviceKeys;

  /// No description provided for @noBackupWarning.
  ///
  /// In en, this message translates to:
  /// **'Warning! Without enabling chat backup, you will lose access to your encrypted messages. It is highly recommended to enable the chat backup first before logging out.'**
  String get noBackupWarning;

  /// No description provided for @noOtherDevicesFound.
  ///
  /// In en, this message translates to:
  /// **'No other devices found'**
  String get noOtherDevicesFound;

  /// No description provided for @fileIsTooBigForServer.
  ///
  /// In en, this message translates to:
  /// **'Unable to send! The server only supports attachments up to {max}.'**
  String fileIsTooBigForServer(String max);

  /// No description provided for @fileHasBeenSavedAt.
  ///
  /// In en, this message translates to:
  /// **'File has been saved at {path}'**
  String fileHasBeenSavedAt(String path);

  /// No description provided for @readUpToHere.
  ///
  /// In en, this message translates to:
  /// **'Read up to here'**
  String get readUpToHere;

  /// No description provided for @openLinkInBrowser.
  ///
  /// In en, this message translates to:
  /// **'Open link in browser'**
  String get openLinkInBrowser;

  /// No description provided for @reportErrorDescription.
  ///
  /// In en, this message translates to:
  /// **'­ Oh no. Something went wrong. If you want, you can report this bug to the developers.'**
  String get reportErrorDescription;

  /// No description provided for @signInWithPassword.
  ///
  /// In en, this message translates to:
  /// **'Sign in with password'**
  String get signInWithPassword;

  /// No description provided for @pleaseTryAgainLaterOrChooseDifferentServer.
  ///
  /// In en, this message translates to:
  /// **'Please try again later or choose a different server.'**
  String get pleaseTryAgainLaterOrChooseDifferentServer;

  /// No description provided for @signInWith.
  ///
  /// In en, this message translates to:
  /// **'Sign in with {provider}'**
  String signInWith(String provider);

  /// No description provided for @profileNotFound.
  ///
  /// In en, this message translates to:
  /// **'The user could not be found on the server. Maybe there is a connection problem or the user doesn\'t exist.'**
  String get profileNotFound;

  /// No description provided for @setTheme.
  ///
  /// In en, this message translates to:
  /// **'Set theme:'**
  String get setTheme;

  /// No description provided for @setColorTheme.
  ///
  /// In en, this message translates to:
  /// **'Set color theme:'**
  String get setColorTheme;

  /// No description provided for @invite.
  ///
  /// In en, this message translates to:
  /// **'Invite'**
  String get invite;

  /// No description provided for @inviteGroupChat.
  ///
  /// In en, this message translates to:
  /// **' Invite group chat'**
  String get inviteGroupChat;

  /// No description provided for @invitePrivateChat.
  ///
  /// In en, this message translates to:
  /// **' Invite private chat'**
  String get invitePrivateChat;

  /// No description provided for @invalidInput.
  ///
  /// In en, this message translates to:
  /// **'Invalid input!'**
  String get invalidInput;

  /// No description provided for @wrongPinEntered.
  ///
  /// In en, this message translates to:
  /// **'Wrong pin entered! Try again in {seconds} seconds...'**
  String wrongPinEntered(int seconds);

  /// No description provided for @pleaseEnterANumber.
  ///
  /// In en, this message translates to:
  /// **'Please enter a number greater than 0'**
  String get pleaseEnterANumber;

  /// No description provided for @banUserDescription.
  ///
  /// In en, this message translates to:
  /// **'The user will be banned from the chat and will not be able to enter the chat again until they are unbanned.'**
  String get banUserDescription;

  /// No description provided for @unbanUserDescription.
  ///
  /// In en, this message translates to:
  /// **'The user will be able to enter the chat again if they try.'**
  String get unbanUserDescription;

  /// No description provided for @kickUserDescription.
  ///
  /// In en, this message translates to:
  /// **'The user is kicked out of the chat but not banned. In public chats, the user can rejoin at any time.'**
  String get kickUserDescription;

  /// No description provided for @makeAdminDescription.
  ///
  /// In en, this message translates to:
  /// **'Once you make this user admin, you may not be able to undo this as they will then have the same permissions as you.'**
  String get makeAdminDescription;

  /// No description provided for @pushNotificationsNotAvailable.
  ///
  /// In en, this message translates to:
  /// **'Push notifications not available'**
  String get pushNotificationsNotAvailable;

  /// No description provided for @learnMore.
  ///
  /// In en, this message translates to:
  /// **'Learn more'**
  String get learnMore;

  /// No description provided for @yourGlobalUserIdIs.
  ///
  /// In en, this message translates to:
  /// **'Your global user-ID is: '**
  String get yourGlobalUserIdIs;

  /// No description provided for @noUsersFoundWithQuery.
  ///
  /// In en, this message translates to:
  /// **'Unfortunately no user could be found with \"{query}\". Please check whether you made a typo.'**
  String noUsersFoundWithQuery(String query);

  /// No description provided for @knocking.
  ///
  /// In en, this message translates to:
  /// **'Knocking'**
  String get knocking;

  /// No description provided for @chatCanBeDiscoveredViaSearchOnServer.
  ///
  /// In en, this message translates to:
  /// **'Chat can be discovered via the search on {server}'**
  String chatCanBeDiscoveredViaSearchOnServer(String server);

  /// No description provided for @searchChatsRooms.
  ///
  /// In en, this message translates to:
  /// **'Search for #chats, @users...'**
  String get searchChatsRooms;

  /// No description provided for @nothingFound.
  ///
  /// In en, this message translates to:
  /// **'Nothing found...'**
  String get nothingFound;

  /// No description provided for @createGroupAndInviteUsers.
  ///
  /// In en, this message translates to:
  /// **'Create a group and invite users'**
  String get createGroupAndInviteUsers;

  /// No description provided for @groupCanBeFoundViaSearch.
  ///
  /// In en, this message translates to:
  /// **'Group can be found via search'**
  String get groupCanBeFoundViaSearch;

  /// No description provided for @startConversation.
  ///
  /// In en, this message translates to:
  /// **'Start conversation'**
  String get startConversation;

  /// No description provided for @commandHint_sendraw.
  ///
  /// In en, this message translates to:
  /// **'Send raw json'**
  String get commandHint_sendraw;

  /// No description provided for @databaseMigrationTitle.
  ///
  /// In en, this message translates to:
  /// **'Database is optimized'**
  String get databaseMigrationTitle;

  /// No description provided for @databaseMigrationBody.
  ///
  /// In en, this message translates to:
  /// **'Please wait. This may take a moment.'**
  String get databaseMigrationBody;

  /// No description provided for @searchForUsers.
  ///
  /// In en, this message translates to:
  /// **'Search for @users...'**
  String get searchForUsers;

  /// No description provided for @pleaseEnterYourCurrentPassword.
  ///
  /// In en, this message translates to:
  /// **'Please enter your current password'**
  String get pleaseEnterYourCurrentPassword;

  /// No description provided for @newPassword.
  ///
  /// In en, this message translates to:
  /// **'New password'**
  String get newPassword;

  /// No description provided for @pleaseChooseAStrongPassword.
  ///
  /// In en, this message translates to:
  /// **'Please choose a strong password'**
  String get pleaseChooseAStrongPassword;

  /// No description provided for @passwordsDoNotMatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get passwordsDoNotMatch;

  /// No description provided for @passwordIsWrong.
  ///
  /// In en, this message translates to:
  /// **'Your entered password is wrong'**
  String get passwordIsWrong;

  /// No description provided for @publicLink.
  ///
  /// In en, this message translates to:
  /// **'Public link'**
  String get publicLink;

  /// No description provided for @publicChatAddresses.
  ///
  /// In en, this message translates to:
  /// **'Public chat addresses'**
  String get publicChatAddresses;

  /// No description provided for @createNewAddress.
  ///
  /// In en, this message translates to:
  /// **'Create new address'**
  String get createNewAddress;

  /// No description provided for @joinSpace.
  ///
  /// In en, this message translates to:
  /// **'Join space'**
  String get joinSpace;

  /// No description provided for @publicSpaces.
  ///
  /// In en, this message translates to:
  /// **'Public spaces'**
  String get publicSpaces;

  /// No description provided for @addChatOrSubSpace.
  ///
  /// In en, this message translates to:
  /// **'Add chat or sub space'**
  String get addChatOrSubSpace;

  /// No description provided for @subspace.
  ///
  /// In en, this message translates to:
  /// **'Subspace'**
  String get subspace;

  /// No description provided for @thisDevice.
  ///
  /// In en, this message translates to:
  /// **'This device:'**
  String get thisDevice;

  /// No description provided for @initAppError.
  ///
  /// In en, this message translates to:
  /// **'An error occured while init the app'**
  String get initAppError;

  /// No description provided for @userRole.
  ///
  /// In en, this message translates to:
  /// **'User role'**
  String get userRole;

  /// No description provided for @minimumPowerLevel.
  ///
  /// In en, this message translates to:
  /// **'{level} is the minimum power level.'**
  String minimumPowerLevel(String level);

  /// No description provided for @searchIn.
  ///
  /// In en, this message translates to:
  /// **'Search in chat \"{chat}\"...'**
  String searchIn(String chat);

  /// No description provided for @searchMore.
  ///
  /// In en, this message translates to:
  /// **'Search more...'**
  String get searchMore;

  /// No description provided for @databaseBuildErrorBody.
  ///
  /// In en, this message translates to:
  /// **'Unable to build the SQlite database. The app tries to use the legacy database for now. Please report this error to the developers at {url}. The error message is: {error}'**
  String databaseBuildErrorBody(String url, String error);

  /// No description provided for @sessionLostBody.
  ///
  /// In en, this message translates to:
  /// **'Your session is lost. Please report this error to the developers at {url}. The error message is: {error}'**
  String sessionLostBody(String url, String error);

  /// No description provided for @restoreSessionBody.
  ///
  /// In en, this message translates to:
  /// **'The app now tries to restore your session from the backup. Please report this error to the developers at {url}. The error message is: {error}'**
  String restoreSessionBody(String url, String error);

  /// No description provided for @forwardMessageTo.
  ///
  /// In en, this message translates to:
  /// **'Forward message to {roomName}?'**
  String forwardMessageTo(String roomName);

  /// No description provided for @sendReadReceipts.
  ///
  /// In en, this message translates to:
  /// **'Send read receipts'**
  String get sendReadReceipts;

  /// No description provided for @sendTypingNotificationsDescription.
  ///
  /// In en, this message translates to:
  /// **'Other participants in a chat can see when you are typing a new message.'**
  String get sendTypingNotificationsDescription;

  /// No description provided for @sendReadReceiptsDescription.
  ///
  /// In en, this message translates to:
  /// **'Other participants in a chat can see when you have read a message.'**
  String get sendReadReceiptsDescription;

  /// No description provided for @formattedMessages.
  ///
  /// In en, this message translates to:
  /// **'Formatted messages'**
  String get formattedMessages;

  /// No description provided for @formattedMessagesDescription.
  ///
  /// In en, this message translates to:
  /// **'Display rich message content like bold text using markdown.'**
  String get formattedMessagesDescription;

  /// No description provided for @verifyOtherUser.
  ///
  /// In en, this message translates to:
  /// **'  Verify other user'**
  String get verifyOtherUser;

  /// No description provided for @verifyOtherUserDescription.
  ///
  /// In en, this message translates to:
  /// **'If you verify another user, you can be sure that you know who you are really writing to. \n\nWhen you start a verification, you and the other user will see a popup in the app. There you will then see a series of emojis or numbers that you have to compare with each other.\n\nThe best way to do this is to meet up or start a video call. ­'**
  String get verifyOtherUserDescription;

  /// No description provided for @acceptedKeyVerification.
  ///
  /// In en, this message translates to:
  /// **'{sender} accepted key verification'**
  String acceptedKeyVerification(String sender);

  /// No description provided for @canceledKeyVerification.
  ///
  /// In en, this message translates to:
  /// **'{sender} canceled key verification'**
  String canceledKeyVerification(String sender);

  /// No description provided for @completedKeyVerification.
  ///
  /// In en, this message translates to:
  /// **'{sender} completed key verification'**
  String completedKeyVerification(String sender);

  /// No description provided for @isReadyForKeyVerification.
  ///
  /// In en, this message translates to:
  /// **'{sender} is ready for key verification'**
  String isReadyForKeyVerification(String sender);

  /// No description provided for @requestedKeyVerification.
  ///
  /// In en, this message translates to:
  /// **'{sender} requested key verification'**
  String requestedKeyVerification(String sender);

  /// No description provided for @startedKeyVerification.
  ///
  /// In en, this message translates to:
  /// **'{sender} started key verification'**
  String startedKeyVerification(String sender);

  /// No description provided for @transparent.
  ///
  /// In en, this message translates to:
  /// **'Transparent'**
  String get transparent;

  /// No description provided for @incomingMessages.
  ///
  /// In en, this message translates to:
  /// **'Incoming messages'**
  String get incomingMessages;

  /// No description provided for @stickers.
  ///
  /// In en, this message translates to:
  /// **'Stickers'**
  String get stickers;

  /// No description provided for @discover.
  ///
  /// In en, this message translates to:
  /// **'Discover'**
  String get discover;

  /// No description provided for @commandHint_ignore.
  ///
  /// In en, this message translates to:
  /// **'Ignore the given matrix ID'**
  String get commandHint_ignore;

  /// No description provided for @commandHint_unignore.
  ///
  /// In en, this message translates to:
  /// **'Unignore the given matrix ID'**
  String get commandHint_unignore;

  /// No description provided for @unreadChatsInApp.
  ///
  /// In en, this message translates to:
  /// **'{appname}: {unread} unread chats'**
  String unreadChatsInApp(String appname, String unread);

  /// No description provided for @noDatabaseEncryption.
  ///
  /// In en, this message translates to:
  /// **'Database encryption is not supported on this platform'**
  String get noDatabaseEncryption;

  /// No description provided for @thereAreCountUsersBlocked.
  ///
  /// In en, this message translates to:
  /// **'Right now there are {count} users blocked.'**
  String thereAreCountUsersBlocked(Object count);

  /// No description provided for @goToSpace.
  ///
  /// In en, this message translates to:
  /// **'Go to space: {space}'**
  String goToSpace(Object space);

  /// No description provided for @youDeletedThisMessage.
  ///
  /// In en, this message translates to:
  /// **'You deleted this message'**
  String get youDeletedThisMessage;

  /// No description provided for @thisMessageWasDeleted.
  ///
  /// In en, this message translates to:
  /// **'This message was deleted'**
  String get thisMessageWasDeleted;

  /// No description provided for @refreshing.
  ///
  /// In en, this message translates to:
  /// **'Refreshing...'**
  String get refreshing;

  /// No description provided for @markAsUnread.
  ///
  /// In en, this message translates to:
  /// **'Mark as unread'**
  String get markAsUnread;

  /// No description provided for @userLevel.
  ///
  /// In en, this message translates to:
  /// **'{level} - User'**
  String userLevel(int level);

  /// No description provided for @moderatorLevel.
  ///
  /// In en, this message translates to:
  /// **'{level} - Moderator'**
  String moderatorLevel(int level);

  /// No description provided for @adminLevel.
  ///
  /// In en, this message translates to:
  /// **'{level} - Admin'**
  String adminLevel(int level);

  /// No description provided for @changeGeneralChatSettings.
  ///
  /// In en, this message translates to:
  /// **'Change general chat settings'**
  String get changeGeneralChatSettings;

  /// No description provided for @inviteOtherUsers.
  ///
  /// In en, this message translates to:
  /// **'Invite other users to this chat'**
  String get inviteOtherUsers;

  /// No description provided for @changeTheChatPermissions.
  ///
  /// In en, this message translates to:
  /// **'Change the chat permissions'**
  String get changeTheChatPermissions;

  /// No description provided for @changeTheVisibilityOfChatHistory.
  ///
  /// In en, this message translates to:
  /// **'Change the visibility of the chat history'**
  String get changeTheVisibilityOfChatHistory;

  /// No description provided for @changeTheCanonicalRoomAlias.
  ///
  /// In en, this message translates to:
  /// **'Change the main public chat address'**
  String get changeTheCanonicalRoomAlias;

  /// No description provided for @sendRoomNotifications.
  ///
  /// In en, this message translates to:
  /// **'Send a @room notifications'**
  String get sendRoomNotifications;

  /// No description provided for @changeTheDescriptionOfTheGroup.
  ///
  /// In en, this message translates to:
  /// **'Change the description of the chat'**
  String get changeTheDescriptionOfTheGroup;

  /// No description provided for @chatPermissionsDescription.
  ///
  /// In en, this message translates to:
  /// **'Define which power level is necessary for certain actions in this chat. The power levels 0, 50 and 100 are usually representing users, moderators and admins, but any gradation is possible.'**
  String get chatPermissionsDescription;

  /// No description provided for @updateInstalled.
  ///
  /// In en, this message translates to:
  /// **' Update {version} installed!'**
  String updateInstalled(String version);

  /// No description provided for @changelog.
  ///
  /// In en, this message translates to:
  /// **'Changelog'**
  String get changelog;

  /// No description provided for @sendCanceled.
  ///
  /// In en, this message translates to:
  /// **'Sending canceled'**
  String get sendCanceled;

  /// No description provided for @loginWithMatrixId.
  ///
  /// In en, this message translates to:
  /// **'Login with Matrix-ID'**
  String get loginWithMatrixId;

  /// No description provided for @discoverHomeservers.
  ///
  /// In en, this message translates to:
  /// **'Discover homeservers'**
  String get discoverHomeservers;

  /// No description provided for @whatIsAHomeserver.
  ///
  /// In en, this message translates to:
  /// **'What is a homeserver?'**
  String get whatIsAHomeserver;

  /// No description provided for @homeserverDescription.
  ///
  /// In en, this message translates to:
  /// **'All your data is stored on the homeserver, just like an email provider. You can choose which homeserver you want to use, while you can still communicate with everyone. Learn more at at https://invitation.be-mindpower.net/.'**
  String get homeserverDescription;

  /// No description provided for @doesNotSeemToBeAValidHomeserver.
  ///
  /// In en, this message translates to:
  /// **'Doesn\'t seem to be a compatible homeserver. Wrong URL?'**
  String get doesNotSeemToBeAValidHomeserver;

  /// No description provided for @calculatingFileSize.
  ///
  /// In en, this message translates to:
  /// **'Calculating file size...'**
  String get calculatingFileSize;

  /// No description provided for @prepareSendingAttachment.
  ///
  /// In en, this message translates to:
  /// **'Prepare sending attachment...'**
  String get prepareSendingAttachment;

  /// No description provided for @sendingAttachment.
  ///
  /// In en, this message translates to:
  /// **'Sending attachment...'**
  String get sendingAttachment;

  /// No description provided for @generatingVideoThumbnail.
  ///
  /// In en, this message translates to:
  /// **'Generating video thumbnail...'**
  String get generatingVideoThumbnail;

  /// No description provided for @compressVideo.
  ///
  /// In en, this message translates to:
  /// **'Compressing video...'**
  String get compressVideo;

  /// No description provided for @sendingAttachmentCountOfCount.
  ///
  /// In en, this message translates to:
  /// **'Sending attachment {index} of {length}...'**
  String sendingAttachmentCountOfCount(int index, int length);

  /// No description provided for @serverLimitReached.
  ///
  /// In en, this message translates to:
  /// **'Server limit reached! Waiting {seconds} seconds...'**
  String serverLimitReached(int seconds);

  /// No description provided for @oneOfYourDevicesIsNotVerified.
  ///
  /// In en, this message translates to:
  /// **'One of your devices is not verified'**
  String get oneOfYourDevicesIsNotVerified;

  /// No description provided for @noticeChatBackupDeviceVerification.
  ///
  /// In en, this message translates to:
  /// **'Note: When you connect all your devices to the chat backup, they are automatically verified.'**
  String get noticeChatBackupDeviceVerification;

  /// No description provided for @continueText.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueText;

  /// No description provided for @welcomeText.
  ///
  /// In en, this message translates to:
  /// **'Hey Hey This is BMP. You can sign in to any homeserver, which is compatible with https://invitation.be-mindpower.net/. And then chat with anyone. It\'s a huge decentralized messaging network!'**
  String get welcomeText;

  /// No description provided for @blur.
  ///
  /// In en, this message translates to:
  /// **'Blur:'**
  String get blur;

  /// No description provided for @opacity.
  ///
  /// In en, this message translates to:
  /// **'Opacity:'**
  String get opacity;

  /// No description provided for @setWallpaper.
  ///
  /// In en, this message translates to:
  /// **'Set wallpaper'**
  String get setWallpaper;

  /// No description provided for @manageAccount.
  ///
  /// In en, this message translates to:
  /// **'Manage account'**
  String get manageAccount;

  /// No description provided for @noContactInformationProvided.
  ///
  /// In en, this message translates to:
  /// **'Server does not provide any valid contact information'**
  String get noContactInformationProvided;

  /// No description provided for @contactServerAdmin.
  ///
  /// In en, this message translates to:
  /// **'Contact server admin'**
  String get contactServerAdmin;

  /// No description provided for @contactServerSecurity.
  ///
  /// In en, this message translates to:
  /// **'Contact server security'**
  String get contactServerSecurity;

  /// No description provided for @supportPage.
  ///
  /// In en, this message translates to:
  /// **'Support page'**
  String get supportPage;

  /// No description provided for @serverInformation.
  ///
  /// In en, this message translates to:
  /// **'Server information:'**
  String get serverInformation;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @version.
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get version;

  /// No description provided for @website.
  ///
  /// In en, this message translates to:
  /// **'Website'**
  String get website;

  /// No description provided for @compress.
  ///
  /// In en, this message translates to:
  /// **'Compress'**
  String get compress;

  /// No description provided for @boldText.
  ///
  /// In en, this message translates to:
  /// **'Bold text'**
  String get boldText;

  /// No description provided for @italicText.
  ///
  /// In en, this message translates to:
  /// **'Italic text'**
  String get italicText;

  /// No description provided for @strikeThrough.
  ///
  /// In en, this message translates to:
  /// **'Strikethrough'**
  String get strikeThrough;

  /// No description provided for @invalidUrl.
  ///
  /// In en, this message translates to:
  /// **'Invalid url'**
  String get invalidUrl;

  /// No description provided for @addLink.
  ///
  /// In en, this message translates to:
  /// **'Add link'**
  String get addLink;

  /// No description provided for @unableToJoinChat.
  ///
  /// In en, this message translates to:
  /// **'Unable to join chat. Maybe the other party has already closed the conversation.'**
  String get unableToJoinChat;

  /// No description provided for @previous.
  ///
  /// In en, this message translates to:
  /// **'Previous'**
  String get previous;

  /// No description provided for @appWantsToUseForLogin.
  ///
  /// In en, this message translates to:
  /// **'Use \'{server}\' to log in'**
  String appWantsToUseForLogin(String server);

  /// No description provided for @appWantsToUseForLoginDescription.
  ///
  /// In en, this message translates to:
  /// **'You hereby allow the app and website to share information about you.'**
  String get appWantsToUseForLoginDescription;

  /// No description provided for @open.
  ///
  /// In en, this message translates to:
  /// **'Open'**
  String get open;

  /// No description provided for @waitingForServer.
  ///
  /// In en, this message translates to:
  /// **'Waiting for server...'**
  String get waitingForServer;

  /// No description provided for @appIntroduction.
  ///
  /// In en, this message translates to:
  /// **'BMP lets you chat with your friends across different messengers.'**
  String get appIntroduction;

  /// No description provided for @newChatRequest.
  ///
  /// In en, this message translates to:
  /// **' New chat request'**
  String get newChatRequest;

  /// No description provided for @contentNotificationSettings.
  ///
  /// In en, this message translates to:
  /// **'Content notification settings'**
  String get contentNotificationSettings;

  /// No description provided for @generalNotificationSettings.
  ///
  /// In en, this message translates to:
  /// **'General notification settings'**
  String get generalNotificationSettings;

  /// No description provided for @roomNotificationSettings.
  ///
  /// In en, this message translates to:
  /// **'Room notification settings'**
  String get roomNotificationSettings;

  /// No description provided for @userSpecificNotificationSettings.
  ///
  /// In en, this message translates to:
  /// **'User specific notification settings'**
  String get userSpecificNotificationSettings;

  /// No description provided for @otherNotificationSettings.
  ///
  /// In en, this message translates to:
  /// **'Other notification settings'**
  String get otherNotificationSettings;

  /// No description provided for @notificationRuleContainsUserName.
  ///
  /// In en, this message translates to:
  /// **'Contains User Name'**
  String get notificationRuleContainsUserName;

  /// No description provided for @notificationRuleContainsUserNameDescription.
  ///
  /// In en, this message translates to:
  /// **'Notifies the user when a message contains their username.'**
  String get notificationRuleContainsUserNameDescription;

  /// No description provided for @notificationRuleMaster.
  ///
  /// In en, this message translates to:
  /// **'Mute all notifications'**
  String get notificationRuleMaster;

  /// No description provided for @notificationRuleMasterDescription.
  ///
  /// In en, this message translates to:
  /// **'Overrides all other rules and disables all notifications.'**
  String get notificationRuleMasterDescription;

  /// No description provided for @notificationRuleSuppressNotices.
  ///
  /// In en, this message translates to:
  /// **'Suppress Automated Messages'**
  String get notificationRuleSuppressNotices;

  /// No description provided for @notificationRuleSuppressNoticesDescription.
  ///
  /// In en, this message translates to:
  /// **'Suppresses notifications from automated clients like bots.'**
  String get notificationRuleSuppressNoticesDescription;

  /// No description provided for @notificationRuleInviteForMe.
  ///
  /// In en, this message translates to:
  /// **'Invite for Me'**
  String get notificationRuleInviteForMe;

  /// No description provided for @notificationRuleInviteForMeDescription.
  ///
  /// In en, this message translates to:
  /// **'Notifies the user when they are invited to a room.'**
  String get notificationRuleInviteForMeDescription;

  /// No description provided for @notificationRuleMemberEvent.
  ///
  /// In en, this message translates to:
  /// **'Member Event'**
  String get notificationRuleMemberEvent;

  /// No description provided for @notificationRuleMemberEventDescription.
  ///
  /// In en, this message translates to:
  /// **'Suppresses notifications for membership events.'**
  String get notificationRuleMemberEventDescription;

  /// No description provided for @notificationRuleIsUserMention.
  ///
  /// In en, this message translates to:
  /// **'User Mention'**
  String get notificationRuleIsUserMention;

  /// No description provided for @notificationRuleIsUserMentionDescription.
  ///
  /// In en, this message translates to:
  /// **'Notifies the user when they are directly mentioned in a message.'**
  String get notificationRuleIsUserMentionDescription;

  /// No description provided for @notificationRuleContainsDisplayName.
  ///
  /// In en, this message translates to:
  /// **'Contains Display Name'**
  String get notificationRuleContainsDisplayName;

  /// No description provided for @notificationRuleContainsDisplayNameDescription.
  ///
  /// In en, this message translates to:
  /// **'Notifies the user when a message contains their display name.'**
  String get notificationRuleContainsDisplayNameDescription;

  /// No description provided for @notificationRuleIsRoomMention.
  ///
  /// In en, this message translates to:
  /// **'Room Mention'**
  String get notificationRuleIsRoomMention;

  /// No description provided for @notificationRuleIsRoomMentionDescription.
  ///
  /// In en, this message translates to:
  /// **'Notifies the user when there is a room mention.'**
  String get notificationRuleIsRoomMentionDescription;

  /// No description provided for @notificationRuleRoomnotif.
  ///
  /// In en, this message translates to:
  /// **'Room Notification'**
  String get notificationRuleRoomnotif;

  /// No description provided for @notificationRuleRoomnotifDescription.
  ///
  /// In en, this message translates to:
  /// **'Notifies the user when a message contains \'@room\'.'**
  String get notificationRuleRoomnotifDescription;

  /// No description provided for @notificationRuleTombstone.
  ///
  /// In en, this message translates to:
  /// **'Tombstone'**
  String get notificationRuleTombstone;

  /// No description provided for @notificationRuleTombstoneDescription.
  ///
  /// In en, this message translates to:
  /// **'Notifies the user about room deactivation messages.'**
  String get notificationRuleTombstoneDescription;

  /// No description provided for @notificationRuleReaction.
  ///
  /// In en, this message translates to:
  /// **'Reaction'**
  String get notificationRuleReaction;

  /// No description provided for @notificationRuleReactionDescription.
  ///
  /// In en, this message translates to:
  /// **'Suppresses notifications for reactions.'**
  String get notificationRuleReactionDescription;

  /// No description provided for @notificationRuleRoomServerAcl.
  ///
  /// In en, this message translates to:
  /// **'Room Server ACL'**
  String get notificationRuleRoomServerAcl;

  /// No description provided for @notificationRuleRoomServerAclDescription.
  ///
  /// In en, this message translates to:
  /// **'Suppresses notifications for room server access control lists (ACL).'**
  String get notificationRuleRoomServerAclDescription;

  /// No description provided for @notificationRuleSuppressEdits.
  ///
  /// In en, this message translates to:
  /// **'Suppress Edits'**
  String get notificationRuleSuppressEdits;

  /// No description provided for @notificationRuleSuppressEditsDescription.
  ///
  /// In en, this message translates to:
  /// **'Suppresses notifications for edited messages.'**
  String get notificationRuleSuppressEditsDescription;

  /// No description provided for @notificationRuleCall.
  ///
  /// In en, this message translates to:
  /// **'Call'**
  String get notificationRuleCall;

  /// No description provided for @notificationRuleCallDescription.
  ///
  /// In en, this message translates to:
  /// **'Notifies the user about calls.'**
  String get notificationRuleCallDescription;

  /// No description provided for @notificationRuleEncryptedRoomOneToOne.
  ///
  /// In en, this message translates to:
  /// **'Encrypted Room One-to-One'**
  String get notificationRuleEncryptedRoomOneToOne;

  /// No description provided for @notificationRuleEncryptedRoomOneToOneDescription.
  ///
  /// In en, this message translates to:
  /// **'Notifies the user about messages in encrypted one-to-one rooms.'**
  String get notificationRuleEncryptedRoomOneToOneDescription;

  /// No description provided for @notificationRuleRoomOneToOne.
  ///
  /// In en, this message translates to:
  /// **'Room One-to-One'**
  String get notificationRuleRoomOneToOne;

  /// No description provided for @notificationRuleRoomOneToOneDescription.
  ///
  /// In en, this message translates to:
  /// **'Notifies the user about messages in one-to-one rooms.'**
  String get notificationRuleRoomOneToOneDescription;

  /// No description provided for @notificationRuleMessage.
  ///
  /// In en, this message translates to:
  /// **'Message'**
  String get notificationRuleMessage;

  /// No description provided for @notificationRuleMessageDescription.
  ///
  /// In en, this message translates to:
  /// **'Notifies the user about general messages.'**
  String get notificationRuleMessageDescription;

  /// No description provided for @notificationRuleEncrypted.
  ///
  /// In en, this message translates to:
  /// **'Encrypted'**
  String get notificationRuleEncrypted;

  /// No description provided for @notificationRuleEncryptedDescription.
  ///
  /// In en, this message translates to:
  /// **'Notifies the user about messages in encrypted rooms.'**
  String get notificationRuleEncryptedDescription;

  /// No description provided for @notificationRuleJitsi.
  ///
  /// In en, this message translates to:
  /// **'Jitsi'**
  String get notificationRuleJitsi;

  /// No description provided for @notificationRuleJitsiDescription.
  ///
  /// In en, this message translates to:
  /// **'Notifies the user about Jitsi widget events.'**
  String get notificationRuleJitsiDescription;

  /// No description provided for @notificationRuleServerAcl.
  ///
  /// In en, this message translates to:
  /// **'Suppress Server ACL Events'**
  String get notificationRuleServerAcl;

  /// No description provided for @notificationRuleServerAclDescription.
  ///
  /// In en, this message translates to:
  /// **'Suppresses notifications for Server ACL events.'**
  String get notificationRuleServerAclDescription;

  /// No description provided for @unknownPushRule.
  ///
  /// In en, this message translates to:
  /// **'Unknown push rule \'{rule}\''**
  String unknownPushRule(String rule);

  /// No description provided for @sentVoiceMessage.
  ///
  /// In en, this message translates to:
  /// **' {duration} - Voice message from {sender}'**
  String sentVoiceMessage(String sender, String duration);

  /// No description provided for @deletePushRuleCanNotBeUndone.
  ///
  /// In en, this message translates to:
  /// **'If you delete this notification setting, this can not be undone.'**
  String get deletePushRuleCanNotBeUndone;

  /// No description provided for @more.
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get more;

  /// No description provided for @shareKeysWith.
  ///
  /// In en, this message translates to:
  /// **'Share keys with...'**
  String get shareKeysWith;

  /// No description provided for @shareKeysWithDescription.
  ///
  /// In en, this message translates to:
  /// **'Which devices should be trusted so that they can read along your messages in encrypted chats?'**
  String get shareKeysWithDescription;

  /// No description provided for @allDevices.
  ///
  /// In en, this message translates to:
  /// **'All devices'**
  String get allDevices;

  /// No description provided for @crossVerifiedDevicesIfEnabled.
  ///
  /// In en, this message translates to:
  /// **'Cross verified devices if enabled'**
  String get crossVerifiedDevicesIfEnabled;

  /// No description provided for @crossVerifiedDevices.
  ///
  /// In en, this message translates to:
  /// **'Cross verified devices'**
  String get crossVerifiedDevices;

  /// No description provided for @verifiedDevicesOnly.
  ///
  /// In en, this message translates to:
  /// **'Verified devices only'**
  String get verifiedDevicesOnly;

  /// No description provided for @takeAPhoto.
  ///
  /// In en, this message translates to:
  /// **'Take a photo'**
  String get takeAPhoto;

  /// No description provided for @recordAVideo.
  ///
  /// In en, this message translates to:
  /// **'Record a video'**
  String get recordAVideo;

  /// No description provided for @optionalMessage.
  ///
  /// In en, this message translates to:
  /// **'(Optional) message...'**
  String get optionalMessage;

  /// No description provided for @notSupportedOnThisDevice.
  ///
  /// In en, this message translates to:
  /// **'Not supported on this device'**
  String get notSupportedOnThisDevice;

  /// No description provided for @approve.
  ///
  /// In en, this message translates to:
  /// **'Approve'**
  String get approve;

  /// No description provided for @youHaveKnocked.
  ///
  /// In en, this message translates to:
  /// **'You have knocked'**
  String get youHaveKnocked;

  /// No description provided for @pleaseWaitUntilInvited.
  ///
  /// In en, this message translates to:
  /// **'Please wait now, until someone from the room invites you.'**
  String get pleaseWaitUntilInvited;

  /// No description provided for @commandHint_logout.
  ///
  /// In en, this message translates to:
  /// **'Logout your current device'**
  String get commandHint_logout;

  /// No description provided for @commandHint_logoutall.
  ///
  /// In en, this message translates to:
  /// **'Logout all active devices'**
  String get commandHint_logoutall;

  /// No description provided for @displayNavigationRail.
  ///
  /// In en, this message translates to:
  /// **'Show navigation rail on mobile'**
  String get displayNavigationRail;

  /// No description provided for @customReaction.
  ///
  /// In en, this message translates to:
  /// **'Custom reaction'**
  String get customReaction;

  /// No description provided for @unexpectedVerificationMessage.
  ///
  /// In en, this message translates to:
  /// **'Unexpected message received during verification.'**
  String get unexpectedVerificationMessage;

  /// No description provided for @financeLoading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get financeLoading;

  /// No description provided for @financePleaseWaitLoadWallet.
  ///
  /// In en, this message translates to:
  /// **'Please wait while we load your wallet'**
  String get financePleaseWaitLoadWallet;

  /// No description provided for @financeWelcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get financeWelcome;

  /// No description provided for @financeRegistrationCompleted.
  ///
  /// In en, this message translates to:
  /// **'Registration completed successfully!'**
  String get financeRegistrationCompleted;

  /// No description provided for @financeFailedToUpdate.
  ///
  /// In en, this message translates to:
  /// **'Failed to update: {error}'**
  String financeFailedToUpdate(String error);

  /// No description provided for @financeStatusRefreshed.
  ///
  /// In en, this message translates to:
  /// **'Status refreshed successfully'**
  String get financeStatusRefreshed;

  /// No description provided for @financeFailedToRefresh.
  ///
  /// In en, this message translates to:
  /// **'Failed to refresh: {error}'**
  String financeFailedToRefresh(String error);

  /// No description provided for @financeFailedToStartKYC.
  ///
  /// In en, this message translates to:
  /// **'Failed to start KYC Retry'**
  String get financeFailedToStartKYC;

  /// No description provided for @financeAccountFullyVerified.
  ///
  /// In en, this message translates to:
  /// **'Your account is fully verified and active'**
  String get financeAccountFullyVerified;

  /// No description provided for @financeAccountVerificationFailed.
  ///
  /// In en, this message translates to:
  /// **'Your account verification was not successful'**
  String get financeAccountVerificationFailed;

  /// No description provided for @financeAccountUnderReview.
  ///
  /// In en, this message translates to:
  /// **'Your account is under review'**
  String get financeAccountUnderReview;

  /// No description provided for @financeAdditionalVerificationRequired.
  ///
  /// In en, this message translates to:
  /// **'Additional verification required'**
  String get financeAdditionalVerificationRequired;

  /// No description provided for @financeManageWalletServices.
  ///
  /// In en, this message translates to:
  /// **'Manage your Wallet services'**
  String get financeManageWalletServices;

  /// No description provided for @financeAccountRejected.
  ///
  /// In en, this message translates to:
  /// **'Account Rejected'**
  String get financeAccountRejected;

  /// No description provided for @financeAccountUnderReviewTitle.
  ///
  /// In en, this message translates to:
  /// **'Account Under Review'**
  String get financeAccountUnderReviewTitle;

  /// No description provided for @financeAccountIncomplete.
  ///
  /// In en, this message translates to:
  /// **'Account Incomplete'**
  String get financeAccountIncomplete;

  /// No description provided for @financeFinishVerification.
  ///
  /// In en, this message translates to:
  /// **'Finish Your Verification'**
  String get financeFinishVerification;

  /// No description provided for @financeAccountIssues.
  ///
  /// In en, this message translates to:
  /// **'Account Issues'**
  String get financeAccountIssues;

  /// No description provided for @financeBankAccounts.
  ///
  /// In en, this message translates to:
  /// **'Virtual Accounts'**
  String get financeBankAccounts;

  /// No description provided for @financeBankAccountsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Virtual Bank account for receive payments'**
  String get financeBankAccountsSubtitle;

  /// No description provided for @financeExternalAccount.
  ///
  /// In en, this message translates to:
  /// **'External Account'**
  String get financeExternalAccount;

  /// No description provided for @financeExternalAccountSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Add your bank accounts for send money by ACH o Wire'**
  String get financeExternalAccountSubtitle;

  /// No description provided for @financeDigitalWallets.
  ///
  /// In en, this message translates to:
  /// **'Digital Wallets'**
  String get financeDigitalWallets;

  /// No description provided for @financeDigitalWalletsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Access your digital wallets'**
  String get financeDigitalWalletsSubtitle;

  /// No description provided for @financeDedicatedAddresses.
  ///
  /// In en, this message translates to:
  /// **'Dedicated Addresses'**
  String get financeDedicatedAddresses;

  /// No description provided for @financeDedicatedAddressesSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Address for instant transfers'**
  String get financeDedicatedAddressesSubtitle;

  /// No description provided for @financeMainWallet.
  ///
  /// In en, this message translates to:
  /// **'Main Wallet'**
  String get financeMainWallet;

  /// No description provided for @financeTotalBalance.
  ///
  /// In en, this message translates to:
  /// **'Total balance'**
  String get financeTotalBalance;

  /// No description provided for @financeNoCardsAvailable.
  ///
  /// In en, this message translates to:
  /// **'No Cards Available'**
  String get financeNoCardsAvailable;

  /// No description provided for @financeCreateFirstCard.
  ///
  /// In en, this message translates to:
  /// **'Create your first card to get started'**
  String get financeCreateFirstCard;

  /// No description provided for @financeViewCards.
  ///
  /// In en, this message translates to:
  /// **'View Cards'**
  String get financeViewCards;

  /// No description provided for @financeMyCards.
  ///
  /// In en, this message translates to:
  /// **'Cards'**
  String get financeMyCards;

  /// No description provided for @financeNoCards.
  ///
  /// In en, this message translates to:
  /// **'No Cards'**
  String get financeNoCards;

  /// No description provided for @financeCreateCardToGetStarted.
  ///
  /// In en, this message translates to:
  /// **'Create a new card to get started'**
  String get financeCreateCardToGetStarted;

  /// No description provided for @financeCreateNewCard.
  ///
  /// In en, this message translates to:
  /// **'Create New Card'**
  String get financeCreateNewCard;

  /// No description provided for @financeVirtualCard.
  ///
  /// In en, this message translates to:
  /// **'Virtual Card'**
  String get financeVirtualCard;

  /// No description provided for @financeActivatingCard.
  ///
  /// In en, this message translates to:
  /// **'Activating Card'**
  String get financeActivatingCard;

  /// No description provided for @financeAlmostReady.
  ///
  /// In en, this message translates to:
  /// **'Almost Ready'**
  String get financeAlmostReady;

  /// No description provided for @financeCardActivationInProgress.
  ///
  /// In en, this message translates to:
  /// **'Activation in progress...'**
  String get financeCardActivationInProgress;

  /// No description provided for @financeCardActivationUnderReview.
  ///
  /// In en, this message translates to:
  /// **'Card activation is under review. Please wait.'**
  String get financeCardActivationUnderReview;

  /// No description provided for @financeCardVerificationFailed.
  ///
  /// In en, this message translates to:
  /// **'Card verification failed. Please contact support.'**
  String get financeCardVerificationFailed;

  /// No description provided for @financeCardCreationFailed.
  ///
  /// In en, this message translates to:
  /// **'Card creation failed. Please try again later.'**
  String get financeCardCreationFailed;

  /// No description provided for @financeCardActivationSuccess.
  ///
  /// In en, this message translates to:
  /// **'Card activated successfully!'**
  String get financeCardActivationSuccess;

  /// No description provided for @financeCardActivationError.
  ///
  /// In en, this message translates to:
  /// **'Error activating card. Please try again.'**
  String get financeCardActivationError;

  /// No description provided for @financeCardActivationInfo.
  ///
  /// In en, this message translates to:
  /// **'Your card is being activated. This may take a few moments. Please do not close the app.'**
  String get financeCardActivationInfo;

  /// No description provided for @financeCompleteIdentityVerification.
  ///
  /// In en, this message translates to:
  /// **'Complete your identity verification to create and manage virtual cards.'**
  String get financeCompleteIdentityVerification;

  /// No description provided for @financeKYCVerificationRequired.
  ///
  /// In en, this message translates to:
  /// **'KYC Verification Required'**
  String get financeKYCVerificationRequired;

  /// No description provided for @financeStartKYCVerification.
  ///
  /// In en, this message translates to:
  /// **'Start KYC Verification'**
  String get financeStartKYCVerification;

  /// No description provided for @financeKYCActivationInProgress.
  ///
  /// In en, this message translates to:
  /// **'Card activation in progress...'**
  String get financeKYCActivationInProgress;

  /// No description provided for @financeKYCUnderReview.
  ///
  /// In en, this message translates to:
  /// **'The card activation is under review. Please wait.'**
  String get financeKYCUnderReview;

  /// No description provided for @financeKYCVerificationFailed.
  ///
  /// In en, this message translates to:
  /// **'Card verification failed. Please contact support.'**
  String get financeKYCVerificationFailed;

  /// No description provided for @financeKYCCardCreationFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to create card. Please try again.'**
  String get financeKYCCardCreationFailed;

  /// No description provided for @financeKYCFailedToActivate.
  ///
  /// In en, this message translates to:
  /// **'Failed to activate card'**
  String get financeKYCFailedToActivate;

  /// No description provided for @financeKYCRejected.
  ///
  /// In en, this message translates to:
  /// **'KYC Rejected'**
  String get financeKYCRejected;

  /// No description provided for @financeKYCRejectedMessage.
  ///
  /// In en, this message translates to:
  /// **'Your identity verification has been rejected. Please review your details and try again.'**
  String get financeKYCRejectedMessage;

  /// No description provided for @financeKYCCommonIssues.
  ///
  /// In en, this message translates to:
  /// **'Common Issues:'**
  String get financeKYCCommonIssues;

  /// No description provided for @financeKYCUnderReviewTitle.
  ///
  /// In en, this message translates to:
  /// **'KYC Under Review'**
  String get financeKYCUnderReviewTitle;

  /// No description provided for @financeKYCUnderReviewMessage.
  ///
  /// In en, this message translates to:
  /// **'Your KYC application is currently under review. This usually takes 1-3 business days.'**
  String get financeKYCUnderReviewMessage;

  /// No description provided for @financeKYCPendingTitle.
  ///
  /// In en, this message translates to:
  /// **'Verification in Progress'**
  String get financeKYCPendingTitle;

  /// No description provided for @financeKYCPendingMessage.
  ///
  /// In en, this message translates to:
  /// **'We\'re currently reviewing your documents. You\'ll be notified once the verification is complete.'**
  String get financeKYCPendingMessage;

  /// No description provided for @financeKYCDocumentUploaded.
  ///
  /// In en, this message translates to:
  /// **'Uploaded'**
  String get financeKYCDocumentUploaded;

  /// No description provided for @financeKYCIdentityVerified.
  ///
  /// In en, this message translates to:
  /// **'Identity Verified'**
  String get financeKYCIdentityVerified;

  /// No description provided for @financeKYCPersonalInfoVerified.
  ///
  /// In en, this message translates to:
  /// **'Personal Info Verified'**
  String get financeKYCPersonalInfoVerified;

  /// No description provided for @financeKYCAddressVerified.
  ///
  /// In en, this message translates to:
  /// **'Address Verified'**
  String get financeKYCAddressVerified;

  /// No description provided for @financeKYCStartVerification.
  ///
  /// In en, this message translates to:
  /// **'Start Verification'**
  String get financeKYCStartVerification;

  /// No description provided for @financeKYCContinueVerification.
  ///
  /// In en, this message translates to:
  /// **'Continue Verification'**
  String get financeKYCContinueVerification;

  /// No description provided for @financeKYCCheckStatus.
  ///
  /// In en, this message translates to:
  /// **'Check Status'**
  String get financeKYCCheckStatus;

  /// No description provided for @financeKYCTryAgain.
  ///
  /// In en, this message translates to:
  /// **'Try Again'**
  String get financeKYCTryAgain;

  /// No description provided for @financeCardStatusActive.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get financeCardStatusActive;

  /// No description provided for @financeCardStatusInactive.
  ///
  /// In en, this message translates to:
  /// **'Inactive'**
  String get financeCardStatusInactive;

  /// No description provided for @financeCardStatusFrozen.
  ///
  /// In en, this message translates to:
  /// **'Frozen'**
  String get financeCardStatusFrozen;

  /// No description provided for @financeCardStatusUnderReview.
  ///
  /// In en, this message translates to:
  /// **'Under Review'**
  String get financeCardStatusUnderReview;

  /// No description provided for @financeCardStatusFailed.
  ///
  /// In en, this message translates to:
  /// **'Verification Failed'**
  String get financeCardStatusFailed;

  /// No description provided for @financeCardActivationTitle.
  ///
  /// In en, this message translates to:
  /// **'Activating Card'**
  String get financeCardActivationTitle;

  /// No description provided for @financeCardAlmostReady.
  ///
  /// In en, this message translates to:
  /// **'It\'s almost ready'**
  String get financeCardAlmostReady;

  /// No description provided for @financeCardActivationMessage.
  ///
  /// In en, this message translates to:
  /// **'Your card is being activated. This may take a few moments. Please do not close the app.'**
  String get financeCardActivationMessage;

  /// No description provided for @financeCardActivationCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get financeCardActivationCancel;

  /// No description provided for @financeCardActivationActivate.
  ///
  /// In en, this message translates to:
  /// **'Activate Now'**
  String get financeCardActivationActivate;

  /// No description provided for @financeCardUnderReview.
  ///
  /// In en, this message translates to:
  /// **'Card activation is under review. Please wait.'**
  String get financeCardUnderReview;

  /// No description provided for @financeUSD.
  ///
  /// In en, this message translates to:
  /// **'USD'**
  String get financeUSD;

  /// No description provided for @financeViewAll.
  ///
  /// In en, this message translates to:
  /// **'View All'**
  String get financeViewAll;

  /// No description provided for @financeNoAccount.
  ///
  /// In en, this message translates to:
  /// **'No Account'**
  String get financeNoAccount;

  /// No description provided for @financeCreateNewAccountSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Create a new account to get started'**
  String get financeCreateNewAccountSubtitle;

  /// No description provided for @financeCreateNewAccount.
  ///
  /// In en, this message translates to:
  /// **'Create a New Account'**
  String get financeCreateNewAccount;

  /// No description provided for @financeSourceOfFundsQuestionnaire.
  ///
  /// In en, this message translates to:
  /// **'Complete Source of Funds Questionnaire'**
  String get financeSourceOfFundsQuestionnaire;

  /// No description provided for @financeSanctionsScreen.
  ///
  /// In en, this message translates to:
  /// **'Complete Sanctions Screening'**
  String get financeSanctionsScreen;

  /// No description provided for @financePEPScreen.
  ///
  /// In en, this message translates to:
  /// **'Complete PEP (Politically Exposed Person) Screening'**
  String get financePEPScreen;

  /// No description provided for @financeBlocklistLookup.
  ///
  /// In en, this message translates to:
  /// **'Complete Blocklist Verification'**
  String get financeBlocklistLookup;

  /// No description provided for @financeAdverseMediaScreen.
  ///
  /// In en, this message translates to:
  /// **'Complete Adverse Media Screening'**
  String get financeAdverseMediaScreen;

  /// No description provided for @financeGovernmentIDVerification.
  ///
  /// In en, this message translates to:
  /// **'Complete Government ID Verification'**
  String get financeGovernmentIDVerification;

  /// No description provided for @financeServiceNotAvailableInRegion.
  ///
  /// In en, this message translates to:
  /// **'This service is not available in your current region'**
  String get financeServiceNotAvailableInRegion;

  /// No description provided for @financeSSN.
  ///
  /// In en, this message translates to:
  /// **'Social Security Number (SSN)'**
  String get financeSSN;

  /// No description provided for @financeTIN.
  ///
  /// In en, this message translates to:
  /// **'Tax Identification Number (TIN)'**
  String get financeTIN;

  /// No description provided for @financeSIN.
  ///
  /// In en, this message translates to:
  /// **'Social Insurance Number (SIN)'**
  String get financeSIN;

  /// No description provided for @financeNIF.
  ///
  /// In en, this message translates to:
  /// **'Tax Identification Number (NIF)'**
  String get financeNIF;

  /// No description provided for @financePAN.
  ///
  /// In en, this message translates to:
  /// **'Permanent Account Number (PAN)'**
  String get financePAN;

  /// No description provided for @financeCPF.
  ///
  /// In en, this message translates to:
  /// **'Individual Taxpayer Registry (CPF)'**
  String get financeCPF;

  /// No description provided for @financeRFC.
  ///
  /// In en, this message translates to:
  /// **'Federal Taxpayer Registry (RFC)'**
  String get financeRFC;

  /// No description provided for @financeNINO.
  ///
  /// In en, this message translates to:
  /// **'National Insurance Number (NINO)'**
  String get financeNINO;

  /// No description provided for @financePassport.
  ///
  /// In en, this message translates to:
  /// **'Passport'**
  String get financePassport;

  /// No description provided for @financeNationalID.
  ///
  /// In en, this message translates to:
  /// **'National ID Number'**
  String get financeNationalID;

  /// No description provided for @financeDriversLicense.
  ///
  /// In en, this message translates to:
  /// **'Driver\'s License Number'**
  String get financeDriversLicense;

  /// No description provided for @financeITIN.
  ///
  /// In en, this message translates to:
  /// **'Individual Taxpayer ID (ITIN)'**
  String get financeITIN;

  /// No description provided for @financeCUIL.
  ///
  /// In en, this message translates to:
  /// **'Unique Labor ID Code (CUIL)'**
  String get financeCUIL;

  /// No description provided for @financeRUT.
  ///
  /// In en, this message translates to:
  /// **'Unique Tax Roll (RUT)'**
  String get financeRUT;

  /// No description provided for @financeNIT.
  ///
  /// In en, this message translates to:
  /// **'Tax ID Number (NIT)'**
  String get financeNIT;

  /// No description provided for @financeCPR.
  ///
  /// In en, this message translates to:
  /// **'Civil Personal Registration (CPR)'**
  String get financeCPR;

  /// No description provided for @financeTFN.
  ///
  /// In en, this message translates to:
  /// **'Tax File Number (TFN)'**
  String get financeTFN;

  /// No description provided for @financeHETU.
  ///
  /// In en, this message translates to:
  /// **'Personal Identity Code (HETU)'**
  String get financeHETU;

  /// No description provided for @financePESEL.
  ///
  /// In en, this message translates to:
  /// **'Universal Electronic System (PESEL)'**
  String get financePESEL;

  /// No description provided for @financeVOEN.
  ///
  /// In en, this message translates to:
  /// **'Tax Identification Number (VOEN)'**
  String get financeVOEN;

  /// No description provided for @financeOtherID.
  ///
  /// In en, this message translates to:
  /// **'Other ID Number'**
  String get financeOtherID;

  /// No description provided for @financeSelectImageSource.
  ///
  /// In en, this message translates to:
  /// **'Select Image Source'**
  String get financeSelectImageSource;

  /// No description provided for @financeCamera.
  ///
  /// In en, this message translates to:
  /// **'Camera'**
  String get financeCamera;

  /// No description provided for @financeGallery.
  ///
  /// In en, this message translates to:
  /// **'Gallery'**
  String get financeGallery;

  /// No description provided for @financeTermsError.
  ///
  /// In en, this message translates to:
  /// **'Terms Error'**
  String get financeTermsError;

  /// No description provided for @financeTermOfService.
  ///
  /// In en, this message translates to:
  /// **'Term of service'**
  String get financeTermOfService;

  /// No description provided for @financeTermsAcceptanceMessage.
  ///
  /// In en, this message translates to:
  /// **'You must accept the terms of service before updating customer information.'**
  String get financeTermsAcceptanceMessage;

  /// No description provided for @financeAcceptTerms.
  ///
  /// In en, this message translates to:
  /// **'I accept the terms of service'**
  String get financeAcceptTerms;

  /// No description provided for @financeTermsAccepted.
  ///
  /// In en, this message translates to:
  /// **'Terms of service accepted'**
  String get financeTermsAccepted;

  /// No description provided for @financeCustomerType.
  ///
  /// In en, this message translates to:
  /// **'Customer Type'**
  String get financeCustomerType;

  /// No description provided for @financeIndividual.
  ///
  /// In en, this message translates to:
  /// **'Individual'**
  String get financeIndividual;

  /// No description provided for @financeCustomerTypeRequired.
  ///
  /// In en, this message translates to:
  /// **'Customer type is required'**
  String get financeCustomerTypeRequired;

  /// No description provided for @financeEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get financeEmail;

  /// No description provided for @financeBirthday.
  ///
  /// In en, this message translates to:
  /// **'Birthday'**
  String get financeBirthday;

  /// No description provided for @financeBirthDateRequired.
  ///
  /// In en, this message translates to:
  /// **'Birth date is required'**
  String get financeBirthDateRequired;

  /// No description provided for @financeMinimumAge.
  ///
  /// In en, this message translates to:
  /// **'You must be at least 18 years old'**
  String get financeMinimumAge;

  /// No description provided for @financeUploadFrontID.
  ///
  /// In en, this message translates to:
  /// **'Upload Front ID'**
  String get financeUploadFrontID;

  /// No description provided for @financeUploadBackID.
  ///
  /// In en, this message translates to:
  /// **'Upload Back ID'**
  String get financeUploadBackID;

  /// No description provided for @financeUploadBothImages.
  ///
  /// In en, this message translates to:
  /// **'Please upload both front and back ID images'**
  String get financeUploadBothImages;

  /// No description provided for @financePrimaryIDRequired.
  ///
  /// In en, this message translates to:
  /// **'Primary ID (SSN/ITIN) is required'**
  String get financePrimaryIDRequired;

  /// No description provided for @financeSSNLabel.
  ///
  /// In en, this message translates to:
  /// **'Social Security Number (SSN)'**
  String get financeSSNLabel;

  /// No description provided for @financeITINLabel.
  ///
  /// In en, this message translates to:
  /// **'Individual Taxpayer ID (ITIN)'**
  String get financeITINLabel;

  /// No description provided for @financePrimaryIDRequiredUSA.
  ///
  /// In en, this message translates to:
  /// **'Primary ID is required for USA'**
  String get financePrimaryIDRequiredUSA;

  /// No description provided for @financeSelectPrimaryIDType.
  ///
  /// In en, this message translates to:
  /// **'Please select a Primary ID type'**
  String get financeSelectPrimaryIDType;

  /// No description provided for @financeSecondaryIDRequired.
  ///
  /// In en, this message translates to:
  /// **'Secondary ID is required'**
  String get financeSecondaryIDRequired;

  /// No description provided for @financeDriversLicenseLabel.
  ///
  /// In en, this message translates to:
  /// **'Driver\'s License'**
  String get financeDriversLicenseLabel;

  /// No description provided for @financePassportLabel.
  ///
  /// In en, this message translates to:
  /// **'Passport'**
  String get financePassportLabel;

  /// No description provided for @financeNationalIDLabel.
  ///
  /// In en, this message translates to:
  /// **'National ID'**
  String get financeNationalIDLabel;

  /// No description provided for @financeSecondaryIDRequiredUSA.
  ///
  /// In en, this message translates to:
  /// **'Secondary ID is required for USA'**
  String get financeSecondaryIDRequiredUSA;

  /// No description provided for @financeSelectSecondaryIDType.
  ///
  /// In en, this message translates to:
  /// **'Please select a Secondary ID type'**
  String get financeSelectSecondaryIDType;

  /// No description provided for @financeIDTypeRequired.
  ///
  /// In en, this message translates to:
  /// **'ID type is required'**
  String get financeIDTypeRequired;

  /// No description provided for @financeSelectIDType.
  ///
  /// In en, this message translates to:
  /// **'Please select an ID type'**
  String get financeSelectIDType;

  /// No description provided for @financeNumber.
  ///
  /// In en, this message translates to:
  /// **'Number'**
  String get financeNumber;

  /// No description provided for @financeNumberRequired.
  ///
  /// In en, this message translates to:
  /// **'number is required'**
  String get financeNumberRequired;

  /// No description provided for @financeEditCustomer.
  ///
  /// In en, this message translates to:
  /// **'Edit Customer'**
  String get financeEditCustomer;

  /// No description provided for @financePleaseWait.
  ///
  /// In en, this message translates to:
  /// **'Please wait '**
  String get financePleaseWait;

  /// No description provided for @financeUpdate.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get financeUpdate;

  /// No description provided for @financeChooseImageSource.
  ///
  /// In en, this message translates to:
  /// **'Choose how you want to add your image:'**
  String get financeChooseImageSource;

  /// No description provided for @financeImageError.
  ///
  /// In en, this message translates to:
  /// **'Image Error'**
  String get financeImageError;

  /// No description provided for @financeFailedToPickImage.
  ///
  /// In en, this message translates to:
  /// **'Failed to pick image: {error}'**
  String financeFailedToPickImage(String error);

  /// No description provided for @financeChoose.
  ///
  /// In en, this message translates to:
  /// **'Choose'**
  String get financeChoose;

  /// No description provided for @financeTermsRequired.
  ///
  /// In en, this message translates to:
  /// **'Terms Required'**
  String get financeTermsRequired;

  /// No description provided for @financeAcceptToSBeforeUpdate.
  ///
  /// In en, this message translates to:
  /// **'Please accept the Terms of Service before updating'**
  String get financeAcceptToSBeforeUpdate;

  /// No description provided for @financeUpdateFailed.
  ///
  /// In en, this message translates to:
  /// **'Update Failed'**
  String get financeUpdateFailed;

  /// No description provided for @financePleaseComplete.
  ///
  /// In en, this message translates to:
  /// **'Please complete: {fields}'**
  String financePleaseComplete(String fields);

  /// No description provided for @financeTakeNewPhoto.
  ///
  /// In en, this message translates to:
  /// **'Take a new photo'**
  String get financeTakeNewPhoto;

  /// No description provided for @financeChooseExistingPhotos.
  ///
  /// In en, this message translates to:
  /// **'Choose from existing photos'**
  String get financeChooseExistingPhotos;

  /// No description provided for @financeCameraAccessRequired.
  ///
  /// In en, this message translates to:
  /// **'Camera access is required to take photos. Please allow camera permission and try again.'**
  String get financeCameraAccessRequired;

  /// No description provided for @financeGalleryAccessRequired.
  ///
  /// In en, this message translates to:
  /// **'Gallery access is required to select images. Please allow photo/storage permission and try again.'**
  String get financeGalleryAccessRequired;

  /// No description provided for @financeCameraAccessDenied.
  ///
  /// In en, this message translates to:
  /// **'Camera access has been permanently denied. Please enable camera permission in your device settings to take photos.'**
  String get financeCameraAccessDenied;

  /// No description provided for @financeGalleryAccessDenied.
  ///
  /// In en, this message translates to:
  /// **'Gallery access has been permanently denied. Please enable photo/storage permission in your device settings to select images.'**
  String get financeGalleryAccessDenied;

  /// No description provided for @financeCameraAccessRestricted.
  ///
  /// In en, this message translates to:
  /// **'Camera access is restricted on this device.'**
  String get financeCameraAccessRestricted;

  /// No description provided for @financeGalleryAccessRestricted.
  ///
  /// In en, this message translates to:
  /// **'Gallery access is restricted on this device.'**
  String get financeGalleryAccessRestricted;

  /// No description provided for @financeCameraPermissionRequired.
  ///
  /// In en, this message translates to:
  /// **'Camera permission is required to take photos.'**
  String get financeCameraPermissionRequired;

  /// No description provided for @financeGalleryPermissionRequired.
  ///
  /// In en, this message translates to:
  /// **'Gallery permission is required to select images. Please enable photo/storage permission in settings.'**
  String get financeGalleryPermissionRequired;

  /// No description provided for @financeFailedToAccessImage.
  ///
  /// In en, this message translates to:
  /// **'Failed to access image'**
  String get financeFailedToAccessImage;

  /// No description provided for @financeCameraAccessWasDenied.
  ///
  /// In en, this message translates to:
  /// **'Camera access was denied. Please enable camera permission in settings.'**
  String get financeCameraAccessWasDenied;

  /// No description provided for @financeGalleryAccessWasDenied.
  ///
  /// In en, this message translates to:
  /// **'Gallery access was denied. Please enable photo/storage permission in settings.'**
  String get financeGalleryAccessWasDenied;

  /// No description provided for @financeNoCameraAvailable.
  ///
  /// In en, this message translates to:
  /// **'No camera is available on this device.'**
  String get financeNoCameraAvailable;

  /// No description provided for @financeInvalidImageFile.
  ///
  /// In en, this message translates to:
  /// **'Selected file is not a valid image. Please choose a different file.'**
  String get financeInvalidImageFile;

  /// No description provided for @financeUnableToTakePhoto.
  ///
  /// In en, this message translates to:
  /// **'Unable to take photo. Please try again.'**
  String get financeUnableToTakePhoto;

  /// No description provided for @financeUnableToSelectImage.
  ///
  /// In en, this message translates to:
  /// **'Unable to select image. Please try again.'**
  String get financeUnableToSelectImage;

  /// No description provided for @financeFailedToCreateCustomer.
  ///
  /// In en, this message translates to:
  /// **'Failed to create customer'**
  String get financeFailedToCreateCustomer;

  /// No description provided for @financeFailedToSendOTP.
  ///
  /// In en, this message translates to:
  /// **'Failed to send OTP: {message}'**
  String financeFailedToSendOTP(String message);

  /// No description provided for @financeInvalidOTP.
  ///
  /// In en, this message translates to:
  /// **'Invalid OTP: {message}'**
  String financeInvalidOTP(String message);

  /// No description provided for @financeCustomerCreatedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Customer created successfully!'**
  String get financeCustomerCreatedSuccess;

  /// No description provided for @financeCountryRequired.
  ///
  /// In en, this message translates to:
  /// **'Country is required'**
  String get financeCountryRequired;

  /// No description provided for @financeIdentificationtype.
  ///
  /// In en, this message translates to:
  /// **'Identification type'**
  String get financeIdentificationtype;

  /// No description provided for @financeUploadBothImagesSecondaryID.
  ///
  /// In en, this message translates to:
  /// **'Please upload both front and back images for secondary ID'**
  String get financeUploadBothImagesSecondaryID;

  /// No description provided for @financeUploadBothIDImages.
  ///
  /// In en, this message translates to:
  /// **'Please upload both front and back ID images'**
  String get financeUploadBothIDImages;

  /// No description provided for @financeAcceptToSBeforeCreating.
  ///
  /// In en, this message translates to:
  /// **'Please accept the Terms of Service before creating a customer'**
  String get financeAcceptToSBeforeCreating;

  /// No description provided for @financeWalletDashboard.
  ///
  /// In en, this message translates to:
  /// **'Wallet Dashboard'**
  String get financeWalletDashboard;

  /// No description provided for @financeVirtualCards.
  ///
  /// In en, this message translates to:
  /// **'Virtual Cards'**
  String get financeVirtualCards;

  /// No description provided for @financeCreateNewWallet.
  ///
  /// In en, this message translates to:
  /// **'Create New \n Wallet'**
  String get financeCreateNewWallet;

  /// No description provided for @financeAllWalletsCreated.
  ///
  /// In en, this message translates to:
  /// **'All available wallets have been created'**
  String get financeAllWalletsCreated;

  /// No description provided for @financeCustomerIDNotFound.
  ///
  /// In en, this message translates to:
  /// **'Customer ID not found. Please login again.'**
  String get financeCustomerIDNotFound;

  /// No description provided for @financeFailedToCreateWallet.
  ///
  /// In en, this message translates to:
  /// **'Failed to create wallet'**
  String get financeFailedToCreateWallet;

  /// No description provided for @financeWalletDetails.
  ///
  /// In en, this message translates to:
  /// **'Wallet Details'**
  String get financeWalletDetails;

  /// No description provided for @financeLoadingWalletDetails.
  ///
  /// In en, this message translates to:
  /// **'Loading wallet details...'**
  String get financeLoadingWalletDetails;

  /// No description provided for @financeWalletNotFound.
  ///
  /// In en, this message translates to:
  /// **'Wallet Not Found'**
  String get financeWalletNotFound;

  /// No description provided for @financeWalletNotFoundMessage.
  ///
  /// In en, this message translates to:
  /// **'The requested wallet could not be found'**
  String get financeWalletNotFoundMessage;

  /// No description provided for @financeGoBack.
  ///
  /// In en, this message translates to:
  /// **'Go Back'**
  String get financeGoBack;

  /// No description provided for @financeNoWalletsFound.
  ///
  /// In en, this message translates to:
  /// **'No Wallets Found'**
  String get financeNoWalletsFound;

  /// No description provided for @finanaceCreateAccountSubtitle.
  ///
  /// In en, this message translates to:
  /// **'We need some information from you to set up your wallet'**
  String get finanaceCreateAccountSubtitle;

  /// No description provided for @financeNoWalletsMessage.
  ///
  /// In en, this message translates to:
  /// **'You don\'t have any wallets yet. Create your first wallet to get started.'**
  String get financeNoWalletsMessage;

  /// No description provided for @financeRetry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get financeRetry;

  /// No description provided for @financeWalletOverview.
  ///
  /// In en, this message translates to:
  /// **'Wallet Overview'**
  String get financeWalletOverview;

  /// No description provided for @financeManageAssets.
  ///
  /// In en, this message translates to:
  /// **'Manage your digital assets and transactions'**
  String get financeManageAssets;

  /// No description provided for @financeWalletInformation.
  ///
  /// In en, this message translates to:
  /// **'Wallet information'**
  String get financeWalletInformation;

  /// No description provided for @financeCreated.
  ///
  /// In en, this message translates to:
  /// **'Created'**
  String get financeCreated;

  /// No description provided for @financeWalletAddress.
  ///
  /// In en, this message translates to:
  /// **'Wallet address'**
  String get financeWalletAddress;

  /// No description provided for @financeTokenBalances.
  ///
  /// In en, this message translates to:
  /// **'Token Balances'**
  String get financeTokenBalances;

  /// No description provided for @financeNoTokenBalances.
  ///
  /// In en, this message translates to:
  /// **'No token balances available'**
  String get financeNoTokenBalances;

  /// No description provided for @financeCopied.
  ///
  /// In en, this message translates to:
  /// **'Copied!'**
  String get financeCopied;

  /// No description provided for @financeAddressCopied.
  ///
  /// In en, this message translates to:
  /// **'Address copied to clipboard'**
  String get financeAddressCopied;

  /// No description provided for @financeInvalidDestinationAddress.
  ///
  /// In en, this message translates to:
  /// **'Invalid destination address or parameters. Please check your input.'**
  String get financeInvalidDestinationAddress;

  /// No description provided for @financeAuthenticationError.
  ///
  /// In en, this message translates to:
  /// **'Authentication error. Please try logging in again.'**
  String get financeAuthenticationError;

  /// No description provided for @financeInsufficientBalance.
  ///
  /// In en, this message translates to:
  /// **'Insufficient balance for this transaction.'**
  String get financeInsufficientBalance;

  /// No description provided for @financeNetworkError.
  ///
  /// In en, this message translates to:
  /// **'Network error. Please check your internet connection.'**
  String get financeNetworkError;

  /// No description provided for @financeRequestTimeout.
  ///
  /// In en, this message translates to:
  /// **'Request timeout. Please try again.'**
  String get financeRequestTimeout;

  /// No description provided for @financeRecentTransactions.
  ///
  /// In en, this message translates to:
  /// **'Recent transactions'**
  String get financeRecentTransactions;

  /// No description provided for @financeNoTransactionsYet.
  ///
  /// In en, this message translates to:
  /// **'No transactions yet'**
  String get financeNoTransactionsYet;

  /// No description provided for @financeTransactionsWillAppear.
  ///
  /// In en, this message translates to:
  /// **'Your transactions and deposits will appear here'**
  String get financeTransactionsWillAppear;

  /// No description provided for @financeTransactionReceipt.
  ///
  /// In en, this message translates to:
  /// **'Transaction Receipt'**
  String get financeTransactionReceipt;

  /// No description provided for @financeTransactionID.
  ///
  /// In en, this message translates to:
  /// **'Transaction ID'**
  String get financeTransactionID;

  /// No description provided for @financeAmount.
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get financeAmount;

  /// No description provided for @financeStatus.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get financeStatus;

  /// No description provided for @financeFromCurrency.
  ///
  /// In en, this message translates to:
  /// **'From Currency'**
  String get financeFromCurrency;

  /// No description provided for @financeToCurrency.
  ///
  /// In en, this message translates to:
  /// **'To Currency'**
  String get financeToCurrency;

  /// No description provided for @financeToAddress.
  ///
  /// In en, this message translates to:
  /// **'To Address'**
  String get financeToAddress;

  /// No description provided for @financeNetwork.
  ///
  /// In en, this message translates to:
  /// **'Network'**
  String get financeNetwork;

  /// No description provided for @financeDate.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get financeDate;

  /// No description provided for @financeTransactionCompleted.
  ///
  /// In en, this message translates to:
  /// **'Transaction completed successfully'**
  String get financeTransactionCompleted;

  /// No description provided for @financeCopiedToClipboard.
  ///
  /// In en, this message translates to:
  /// **'Copied to clipboard'**
  String get financeCopiedToClipboard;

  /// No description provided for @financeVerifyAddress.
  ///
  /// In en, this message translates to:
  /// **'Verify address before sending'**
  String get financeVerifyAddress;

  /// No description provided for @financeLoadingTransfers.
  ///
  /// In en, this message translates to:
  /// **'Loading transfers...'**
  String get financeLoadingTransfers;

  /// No description provided for @financeNoTransfersYet.
  ///
  /// In en, this message translates to:
  /// **'No Transfers Yet'**
  String get financeNoTransfersYet;

  /// No description provided for @financeTransfersWillAppear.
  ///
  /// In en, this message translates to:
  /// **'Your crypto transfers will appear here'**
  String get financeTransfersWillAppear;

  /// No description provided for @financeCryptoTransfer.
  ///
  /// In en, this message translates to:
  /// **'Crypto Transfer'**
  String get financeCryptoTransfer;

  /// No description provided for @financeNoItemsFound.
  ///
  /// In en, this message translates to:
  /// **'No items found'**
  String get financeNoItemsFound;

  /// No description provided for @financePleaseEnterAmount.
  ///
  /// In en, this message translates to:
  /// **'Please enter amount'**
  String get financePleaseEnterAmount;

  /// No description provided for @financePleaseEnterAllFields.
  ///
  /// In en, this message translates to:
  /// **'Please fill all fields'**
  String get financePleaseEnterAllFields;

  /// No description provided for @financeCustomerNotFound.
  ///
  /// In en, this message translates to:
  /// **'Customer not found. Please try again.'**
  String get financeCustomerNotFound;

  /// No description provided for @financeInfo.
  ///
  /// In en, this message translates to:
  /// **'Info'**
  String get financeInfo;

  /// No description provided for @financeProcessingTransfer.
  ///
  /// In en, this message translates to:
  /// **'Processing transfer...'**
  String get financeProcessingTransfer;

  /// No description provided for @financeTransferSuccessful.
  ///
  /// In en, this message translates to:
  /// **'Transfer Successful'**
  String get financeTransferSuccessful;

  /// No description provided for @financeSentTo.
  ///
  /// In en, this message translates to:
  /// **'sent to'**
  String get financeSentTo;

  /// No description provided for @financeDone.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get financeDone;

  /// No description provided for @financeDepositInstructions.
  ///
  /// In en, this message translates to:
  /// **'Deposit Instructions'**
  String get financeDepositInstructions;

  /// No description provided for @financeImportantDepositMessage.
  ///
  /// In en, this message translates to:
  /// **'Important Deposit Message'**
  String get financeImportantDepositMessage;

  /// No description provided for @financeAccountNumber.
  ///
  /// In en, this message translates to:
  /// **'Account Number'**
  String get financeAccountNumber;

  /// No description provided for @financeRoutingNumber.
  ///
  /// In en, this message translates to:
  /// **'Routing Number'**
  String get financeRoutingNumber;

  /// No description provided for @financeBankName.
  ///
  /// In en, this message translates to:
  /// **'Bank Name'**
  String get financeBankName;

  /// No description provided for @financeBankAddress.
  ///
  /// In en, this message translates to:
  /// **'Bank Address'**
  String get financeBankAddress;

  /// No description provided for @financeBeneficiaryName.
  ///
  /// In en, this message translates to:
  /// **'Beneficiary Name'**
  String get financeBeneficiaryName;

  /// No description provided for @financeAccountBlocked.
  ///
  /// In en, this message translates to:
  /// **'Account Blocked'**
  String get financeAccountBlocked;

  /// No description provided for @financePINVerificationFailed.
  ///
  /// In en, this message translates to:
  /// **'PIN Verification'**
  String get financePINVerificationFailed;

  /// No description provided for @financeOK.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get financeOK;

  /// No description provided for @financeTransferFailed.
  ///
  /// In en, this message translates to:
  /// **'Transfer Failed'**
  String get financeTransferFailed;

  /// No description provided for @financeDepositFailed.
  ///
  /// In en, this message translates to:
  /// **'Deposit Failed'**
  String get financeDepositFailed;

  /// No description provided for @financeDestination.
  ///
  /// In en, this message translates to:
  /// **'Destination'**
  String get financeDestination;

  /// No description provided for @financeSelectBlockchain.
  ///
  /// In en, this message translates to:
  /// **'Select blockchain for your'**
  String get financeSelectBlockchain;

  /// No description provided for @financeNewWallet.
  ///
  /// In en, this message translates to:
  /// **'new wallet'**
  String get financeNewWallet;

  /// No description provided for @financeCryptocurrencySearch.
  ///
  /// In en, this message translates to:
  /// **'Cryptocurrency Search'**
  String get financeCryptocurrencySearch;

  /// No description provided for @financeSearch.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get financeSearch;

  /// No description provided for @financeEthereumETH.
  ///
  /// In en, this message translates to:
  /// **'Ethereum (ETH)'**
  String get financeEthereumETH;

  /// No description provided for @financeConfirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get financeConfirm;

  /// No description provided for @financeRequired.
  ///
  /// In en, this message translates to:
  /// **'Required'**
  String get financeRequired;

  /// No description provided for @financeInvalidAmount.
  ///
  /// In en, this message translates to:
  /// **'Invalid amount'**
  String get financeInvalidAmount;

  /// No description provided for @financeMinAmount.
  ///
  /// In en, this message translates to:
  /// **'Min \$1'**
  String get financeMinAmount;

  /// No description provided for @financeMaxAmount.
  ///
  /// In en, this message translates to:
  /// **'Max \$10,000'**
  String get financeMaxAmount;

  /// No description provided for @financeInvalidAddress.
  ///
  /// In en, this message translates to:
  /// **'Invalid address'**
  String get financeInvalidAddress;

  /// No description provided for @financeSelect.
  ///
  /// In en, this message translates to:
  /// **'Select'**
  String get financeSelect;

  /// No description provided for @financeStates.
  ///
  /// In en, this message translates to:
  /// **'States'**
  String get financeStates;

  /// No description provided for @financeDateRange.
  ///
  /// In en, this message translates to:
  /// **'10 May - 30 Sept'**
  String get financeDateRange;

  /// No description provided for @financeIncome.
  ///
  /// In en, this message translates to:
  /// **'Income'**
  String get financeIncome;

  /// No description provided for @financeEnterCode.
  ///
  /// In en, this message translates to:
  /// **'Enter Code'**
  String get financeEnterCode;

  /// No description provided for @financeEnter4DigitCode.
  ///
  /// In en, this message translates to:
  /// **'Enter your 4 digit transaction code to proceed'**
  String get financeEnter4DigitCode;

  /// No description provided for @financeForgotPIN.
  ///
  /// In en, this message translates to:
  /// **'Forgot PIN?'**
  String get financeForgotPIN;

  /// No description provided for @financeVerifyOTP.
  ///
  /// In en, this message translates to:
  /// **'Verify OTP'**
  String get financeVerifyOTP;

  /// No description provided for @financeEnter6DigitCodeSent.
  ///
  /// In en, this message translates to:
  /// **'Enter the 6-digit code sent to'**
  String get financeEnter6DigitCodeSent;

  /// No description provided for @financeVerify.
  ///
  /// In en, this message translates to:
  /// **'Verify'**
  String get financeVerify;

  /// No description provided for @financeDidntReceiveCode.
  ///
  /// In en, this message translates to:
  /// **'Didn\'t receive code? '**
  String get financeDidntReceiveCode;

  /// No description provided for @financeResend.
  ///
  /// In en, this message translates to:
  /// **'Resend'**
  String get financeResend;

  /// No description provided for @financeResendIn.
  ///
  /// In en, this message translates to:
  /// **'Resend in {seconds}s'**
  String financeResendIn(Object seconds);

  /// No description provided for @financeOTPMust6Digits.
  ///
  /// In en, this message translates to:
  /// **'OTP must be 6 digits'**
  String get financeOTPMust6Digits;

  /// No description provided for @financeWrongOTP.
  ///
  /// In en, this message translates to:
  /// **'Wrong OTP. Please enter the correct OTP again.'**
  String get financeWrongOTP;

  /// No description provided for @financeInvalidOTPRestart.
  ///
  /// In en, this message translates to:
  /// **'Invalid OTP. Please start registration again.'**
  String get financeInvalidOTPRestart;

  /// No description provided for @financeSendingOTP.
  ///
  /// In en, this message translates to:
  /// **'Sending OTP'**
  String get financeSendingOTP;

  /// No description provided for @financePleaseWaitSendingCode.
  ///
  /// In en, this message translates to:
  /// **'Please wait while we send verification code to your email'**
  String get financePleaseWaitSendingCode;

  /// No description provided for @financeOTPSentTo.
  ///
  /// In en, this message translates to:
  /// **'OTP sent to: {email}'**
  String financeOTPSentTo(String email);

  /// No description provided for @financeExpenses.
  ///
  /// In en, this message translates to:
  /// **'Expenses'**
  String get financeExpenses;

  /// No description provided for @financeTransferOptions.
  ///
  /// In en, this message translates to:
  /// **'Transfer Options'**
  String get financeTransferOptions;

  /// No description provided for @financeDepositFounds.
  ///
  /// In en, this message translates to:
  /// **'Deposit Founds'**
  String get financeDepositFounds;

  /// No description provided for @financeAddMoneyFromBank.
  ///
  /// In en, this message translates to:
  /// **'Add money from bank to wallet'**
  String get financeAddMoneyFromBank;

  /// No description provided for @financeTransfer.
  ///
  /// In en, this message translates to:
  /// **'Transfer'**
  String get financeTransfer;

  /// No description provided for @financeTransferToWalletAddress.
  ///
  /// In en, this message translates to:
  /// **'Transfer to another wallet address'**
  String get financeTransferToWalletAddress;

  /// No description provided for @financeWithdrawToExternalAccount.
  ///
  /// In en, this message translates to:
  /// **'Withdraw to External Account'**
  String get financeWithdrawToExternalAccount;

  /// No description provided for @financeTransferToBankAccount.
  ///
  /// In en, this message translates to:
  /// **'Transfer to your bank account'**
  String get financeTransferToBankAccount;

  /// No description provided for @financeWithdraw.
  ///
  /// In en, this message translates to:
  /// **'withdraw'**
  String get financeWithdraw;

  /// No description provided for @financeLoadingWallets.
  ///
  /// In en, this message translates to:
  /// **'Loading wallets...'**
  String get financeLoadingWallets;

  /// No description provided for @financeZeroBalance.
  ///
  /// In en, this message translates to:
  /// **'0.00 usd'**
  String get financeZeroBalance;

  /// No description provided for @financeNoWallet.
  ///
  /// In en, this message translates to:
  /// **'No Wallet'**
  String get financeNoWallet;

  /// No description provided for @financeCreateCardMessage.
  ///
  /// In en, this message translates to:
  /// **'Create a new card to get started!'**
  String get financeCreateCardMessage;

  /// No description provided for @financeCreateANewWallet.
  ///
  /// In en, this message translates to:
  /// **'Create a New Wallet'**
  String get financeCreateANewWallet;

  /// No description provided for @financeSendCryptoToWallet.
  ///
  /// In en, this message translates to:
  /// **'Send crypto to another wallet address'**
  String get financeSendCryptoToWallet;

  /// No description provided for @financeHowMuch.
  ///
  /// In en, this message translates to:
  /// **'How much?'**
  String get financeHowMuch;

  /// No description provided for @financeTransfer_money_to_any_user.
  ///
  /// In en, this message translates to:
  /// **'transfer money to any user'**
  String get financeTransfer_money_to_any_user;

  /// No description provided for @financeCurrency.
  ///
  /// In en, this message translates to:
  /// **'Currency'**
  String get financeCurrency;

  /// No description provided for @financeDestinationChain.
  ///
  /// In en, this message translates to:
  /// **'Destination Chain'**
  String get financeDestinationChain;

  /// No description provided for @financeDestinationAddress.
  ///
  /// In en, this message translates to:
  /// **'Destination Address'**
  String get financeDestinationAddress;

  /// No description provided for @financeDepositFunds.
  ///
  /// In en, this message translates to:
  /// **'Deposit Funds'**
  String get financeDepositFunds;

  /// No description provided for @financeSelectCurrency.
  ///
  /// In en, this message translates to:
  /// **'Source Currency'**
  String get financeSelectCurrency;

  /// No description provided for @financePaymentMethod.
  ///
  /// In en, this message translates to:
  /// **'Payment method'**
  String get financePaymentMethod;

  /// No description provided for @financeACHPush.
  ///
  /// In en, this message translates to:
  /// **'ACH Push'**
  String get financeACHPush;

  /// No description provided for @financeDestinationCurrency.
  ///
  /// In en, this message translates to:
  /// **'Destination Currency'**
  String get financeDestinationCurrency;

  /// No description provided for @financeBankAccount.
  ///
  /// In en, this message translates to:
  /// **'Bank Account'**
  String get financeBankAccount;

  /// No description provided for @financeExternalAccountAdd.
  ///
  /// In en, this message translates to:
  /// **'Add External Account'**
  String get financeExternalAccountAdd;

  /// No description provided for @financeExternalAccountEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit External Account'**
  String get financeExternalAccountEdit;

  /// No description provided for @financeExternalAccountStepBank.
  ///
  /// In en, this message translates to:
  /// **'Bank\nInfo'**
  String get financeExternalAccountStepBank;

  /// No description provided for @financeExternalAccountStepPersonal.
  ///
  /// In en, this message translates to:
  /// **'Personal\nInfo'**
  String get financeExternalAccountStepPersonal;

  /// No description provided for @financeExternalAccountStepAccount.
  ///
  /// In en, this message translates to:
  /// **'Account\nDetail'**
  String get financeExternalAccountStepAccount;

  /// No description provided for @financeExternalAccountStepAddress.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get financeExternalAccountStepAddress;

  /// No description provided for @financeExternalAccountAccountName.
  ///
  /// In en, this message translates to:
  /// **'Account Name'**
  String get financeExternalAccountAccountName;

  /// No description provided for @financeExternalAccountGetProfileInfo.
  ///
  /// In en, this message translates to:
  /// **'Get info from your profile'**
  String get financeExternalAccountGetProfileInfo;

  /// No description provided for @financeExternalAccountGoBackTitle.
  ///
  /// In en, this message translates to:
  /// **'Go Back?'**
  String get financeExternalAccountGoBackTitle;

  /// No description provided for @financeExternalAccountGoBackMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to go back? All entered information will be lost.'**
  String get financeExternalAccountGoBackMessage;

  /// No description provided for @financeExternalAccountAccountInfo.
  ///
  /// In en, this message translates to:
  /// **'Account Information'**
  String get financeExternalAccountAccountInfo;

  /// No description provided for @financeExternalAccountUpdateAddress.
  ///
  /// In en, this message translates to:
  /// **'Update Address'**
  String get financeExternalAccountUpdateAddress;

  /// No description provided for @financeExternalAccountAccountOwner.
  ///
  /// In en, this message translates to:
  /// **'Account Owner'**
  String get financeExternalAccountAccountOwner;

  /// No description provided for @financeExternalAccountAccountType.
  ///
  /// In en, this message translates to:
  /// **'Account Type'**
  String get financeExternalAccountAccountType;

  /// No description provided for @financeExternalAccountActive.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get financeExternalAccountActive;

  /// No description provided for @financeExternalAccountInactive.
  ///
  /// In en, this message translates to:
  /// **'Inactive'**
  String get financeExternalAccountInactive;

  /// No description provided for @financeExternalAccountErrorLoading.
  ///
  /// In en, this message translates to:
  /// **'Error Loading Account'**
  String get financeExternalAccountErrorLoading;

  /// No description provided for @financeExternalAccountNotFound.
  ///
  /// In en, this message translates to:
  /// **'Account Not Found'**
  String get financeExternalAccountNotFound;

  /// No description provided for @financeExternalAccountNotFoundMessage.
  ///
  /// In en, this message translates to:
  /// **'The external account could not be found'**
  String get financeExternalAccountNotFoundMessage;

  /// No description provided for @financeExternalAccountAddressUpdated.
  ///
  /// In en, this message translates to:
  /// **'Address updated successfully!'**
  String get financeExternalAccountAddressUpdated;

  /// No description provided for @financeExternalAccountNoCustomer.
  ///
  /// In en, this message translates to:
  /// **'No Customer Found'**
  String get financeExternalAccountNoCustomer;

  /// No description provided for @financeExternalAccountNoCustomerMessage.
  ///
  /// In en, this message translates to:
  /// **'Please create a customer profile first to manage external accounts'**
  String get financeExternalAccountNoCustomerMessage;

  /// No description provided for @financeExternalAccountLoadingAccounts.
  ///
  /// In en, this message translates to:
  /// **'Loading external accounts...'**
  String get financeExternalAccountLoadingAccounts;

  /// No description provided for @financeExternalAccountLetsStart.
  ///
  /// In en, this message translates to:
  /// **'Let\'s start\n an external account'**
  String get financeExternalAccountLetsStart;

  /// No description provided for @financeExternalAccountSetupMessage.
  ///
  /// In en, this message translates to:
  /// **'We need some information from you to set up the external account'**
  String get financeExternalAccountSetupMessage;

  /// No description provided for @financeExternalAccountBankInfo.
  ///
  /// In en, this message translates to:
  /// **'Bank information'**
  String get financeExternalAccountBankInfo;

  /// No description provided for @financeExternalAccountAccountDetails.
  ///
  /// In en, this message translates to:
  /// **'Account details'**
  String get financeExternalAccountAccountDetails;

  /// No description provided for @financeExternalAccountOwnerInfo.
  ///
  /// In en, this message translates to:
  /// **'Owner information'**
  String get financeExternalAccountOwnerInfo;

  /// No description provided for @financeExternalAccountTimestamps.
  ///
  /// In en, this message translates to:
  /// **'Timestamps'**
  String get financeExternalAccountTimestamps;

  /// No description provided for @financeExternalAccountOwnerType.
  ///
  /// In en, this message translates to:
  /// **'Owner Type'**
  String get financeExternalAccountOwnerType;

  /// No description provided for @financeExternalAccountUpdated.
  ///
  /// In en, this message translates to:
  /// **'Updated'**
  String get financeExternalAccountUpdated;

  /// No description provided for @financeExternalAccountNumberCopied.
  ///
  /// In en, this message translates to:
  /// **'Account number copied!'**
  String get financeExternalAccountNumberCopied;

  /// No description provided for @financeExternalAccountOwnerTypeLabel.
  ///
  /// In en, this message translates to:
  /// **'Account Type'**
  String get financeExternalAccountOwnerTypeLabel;

  /// No description provided for @financeExternalAccountIndividual.
  ///
  /// In en, this message translates to:
  /// **'Individual'**
  String get financeExternalAccountIndividual;

  /// No description provided for @financeExternalAccountChecking.
  ///
  /// In en, this message translates to:
  /// **'Checking'**
  String get financeExternalAccountChecking;

  /// No description provided for @financeExternalAccountSavings.
  ///
  /// In en, this message translates to:
  /// **'Savings'**
  String get financeExternalAccountSavings;

  /// No description provided for @financeExternalAccountUnitedStates.
  ///
  /// In en, this message translates to:
  /// **'United States'**
  String get financeExternalAccountUnitedStates;

  /// No description provided for @financeExternalAccountRequired.
  ///
  /// In en, this message translates to:
  /// **'Required'**
  String get financeExternalAccountRequired;

  /// No description provided for @financeExternalAccountStreetAddressTooShort.
  ///
  /// In en, this message translates to:
  /// **'Street address too short'**
  String get financeExternalAccountStreetAddressTooShort;

  /// No description provided for @financeExternalAccountPleaseSelectState.
  ///
  /// In en, this message translates to:
  /// **'Please select a state'**
  String get financeExternalAccountPleaseSelectState;

  /// No description provided for @financeExternalAccountPleaseEnterCity.
  ///
  /// In en, this message translates to:
  /// **'Please enter city'**
  String get financeExternalAccountPleaseEnterCity;

  /// No description provided for @financeExternalAccountCityNameTooShort.
  ///
  /// In en, this message translates to:
  /// **'City name too short'**
  String get financeExternalAccountCityNameTooShort;

  /// No description provided for @financeExternalAccountPleaseEnterZIP.
  ///
  /// In en, this message translates to:
  /// **'Please enter ZIP'**
  String get financeExternalAccountPleaseEnterZIP;

  /// No description provided for @financeExternalAccountMustBe5Digits.
  ///
  /// In en, this message translates to:
  /// **'Must be 5 digits'**
  String get financeExternalAccountMustBe5Digits;

  /// No description provided for @financeExternalAccountNumbersOnly.
  ///
  /// In en, this message translates to:
  /// **'Numbers only'**
  String get financeExternalAccountNumbersOnly;

  /// No description provided for @financeExternalAccountBankNameRequired.
  ///
  /// In en, this message translates to:
  /// **'Bank name is required'**
  String get financeExternalAccountBankNameRequired;

  /// No description provided for @financeExternalAccountBankNameMin.
  ///
  /// In en, this message translates to:
  /// **'Bank name must be at least 3 characters'**
  String get financeExternalAccountBankNameMin;

  /// No description provided for @financeExternalAccountBankNameMax.
  ///
  /// In en, this message translates to:
  /// **'Bank name too long (max 50 characters)'**
  String get financeExternalAccountBankNameMax;

  /// No description provided for @financeExternalAccountInvalidCharacters.
  ///
  /// In en, this message translates to:
  /// **'Invalid characters in bank name'**
  String get financeExternalAccountInvalidCharacters;

  /// No description provided for @financeExternalAccountAccountNameRequired.
  ///
  /// In en, this message translates to:
  /// **'Account name is required'**
  String get financeExternalAccountAccountNameRequired;

  /// No description provided for @financeExternalAccountAccountNameMin.
  ///
  /// In en, this message translates to:
  /// **'Account name must be at least 2 characters'**
  String get financeExternalAccountAccountNameMin;

  /// No description provided for @financeExternalAccountAccountNameMax.
  ///
  /// In en, this message translates to:
  /// **'Account name too long (max 40 characters)'**
  String get financeExternalAccountAccountNameMax;

  /// No description provided for @financeExternalAccountOnlyLetters.
  ///
  /// In en, this message translates to:
  /// **'Only letters, spaces, dots and hyphens allowed'**
  String get financeExternalAccountOnlyLetters;

  /// No description provided for @financeExternalAccountOwnerTypeRequired.
  ///
  /// In en, this message translates to:
  /// **'Account owner type is required'**
  String get financeExternalAccountOwnerTypeRequired;

  /// No description provided for @financeExternalAccountFirstNameRequired.
  ///
  /// In en, this message translates to:
  /// **'First name is required'**
  String get financeExternalAccountFirstNameRequired;

  /// No description provided for @financeExternalAccountFirstNameTooShort.
  ///
  /// In en, this message translates to:
  /// **'First name too short'**
  String get financeExternalAccountFirstNameTooShort;

  /// No description provided for @financeExternalAccountLastNameRequired.
  ///
  /// In en, this message translates to:
  /// **'Last name is required'**
  String get financeExternalAccountLastNameRequired;

  /// No description provided for @financeExternalAccountLastNameTooShort.
  ///
  /// In en, this message translates to:
  /// **'Last name too short'**
  String get financeExternalAccountLastNameTooShort;

  /// No description provided for @financeExternalAccountRoutingNumberRequired.
  ///
  /// In en, this message translates to:
  /// **'Routing number is required'**
  String get financeExternalAccountRoutingNumberRequired;

  /// No description provided for @financeExternalAccountMustBe9Digits.
  ///
  /// In en, this message translates to:
  /// **'Must be exactly 9 digits'**
  String get financeExternalAccountMustBe9Digits;

  /// No description provided for @financeExternalAccountAccountNumberRequired.
  ///
  /// In en, this message translates to:
  /// **'Account number is required'**
  String get financeExternalAccountAccountNumberRequired;

  /// No description provided for @financeExternalAccountAccountNumberTooShort.
  ///
  /// In en, this message translates to:
  /// **'Account number too short'**
  String get financeExternalAccountAccountNumberTooShort;

  /// No description provided for @financeExternalAccountAccountTypeRequired.
  ///
  /// In en, this message translates to:
  /// **'Account type is required'**
  String get financeExternalAccountAccountTypeRequired;

  /// No description provided for @financeExternalAccountStreetAddressRequired.
  ///
  /// In en, this message translates to:
  /// **'Street address is required'**
  String get financeExternalAccountStreetAddressRequired;

  /// No description provided for @financeExternalAccountCountryRequired.
  ///
  /// In en, this message translates to:
  /// **'Country is required'**
  String get financeExternalAccountCountryRequired;

  /// No description provided for @financeExternalAccountCityRequired.
  ///
  /// In en, this message translates to:
  /// **'City is required'**
  String get financeExternalAccountCityRequired;

  /// No description provided for @financeExternalAccountStateRequired.
  ///
  /// In en, this message translates to:
  /// **'State is required'**
  String get financeExternalAccountStateRequired;

  /// No description provided for @financeExternalAccountPostalCodeRequired.
  ///
  /// In en, this message translates to:
  /// **'Postal code is required'**
  String get financeExternalAccountPostalCodeRequired;

  /// No description provided for @financeExternalAccountNoCustomerFound.
  ///
  /// In en, this message translates to:
  /// **'No customer found. Please create a customer first.'**
  String get financeExternalAccountNoCustomerFound;

  /// No description provided for @financeExternalAccountFailedToUpdate.
  ///
  /// In en, this message translates to:
  /// **'Failed to update address'**
  String get financeExternalAccountFailedToUpdate;

  /// No description provided for @financeExternalAccountSubmit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get financeExternalAccountSubmit;

  /// No description provided for @financePayCryptoCreateVirtualCard.
  ///
  /// In en, this message translates to:
  /// **'Create Virtual Card'**
  String get financePayCryptoCreateVirtualCard;

  /// No description provided for @financePayCryptoSelectCardType.
  ///
  /// In en, this message translates to:
  /// **'Select Card Type'**
  String get financePayCryptoSelectCardType;

  /// No description provided for @financePayCryptoChooseCardType.
  ///
  /// In en, this message translates to:
  /// **'Choose the type of virtual card you want to create'**
  String get financePayCryptoChooseCardType;

  /// No description provided for @financePayCryptoNoCardTypes.
  ///
  /// In en, this message translates to:
  /// **'No card types available'**
  String get financePayCryptoNoCardTypes;

  /// No description provided for @financePayCryptoContinue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get financePayCryptoContinue;

  /// No description provided for @financePayCryptoVirtualCard.
  ///
  /// In en, this message translates to:
  /// **'Virtual Card'**
  String get financePayCryptoVirtualCard;

  /// No description provided for @financePayCryptoCurrency.
  ///
  /// In en, this message translates to:
  /// **'Currency: {currency}'**
  String financePayCryptoCurrency(String currency);

  /// No description provided for @financePayCryptoType.
  ///
  /// In en, this message translates to:
  /// **'Type: {type}'**
  String financePayCryptoType(String type);

  /// No description provided for @financePayCryptoPhysical.
  ///
  /// In en, this message translates to:
  /// **'Physical'**
  String get financePayCryptoPhysical;

  /// No description provided for @financePayCryptoVirtual.
  ///
  /// In en, this message translates to:
  /// **'Virtual'**
  String get financePayCryptoVirtual;

  /// No description provided for @financePayCryptoKYCRequired.
  ///
  /// In en, this message translates to:
  /// **'KYC Required'**
  String get financePayCryptoKYCRequired;

  /// No description provided for @financePayCryptoCompleteKYCFirst.
  ///
  /// In en, this message translates to:
  /// **'Please complete KYC verification first'**
  String get financePayCryptoCompleteKYCFirst;

  /// No description provided for @financePayCryptoCardCreatedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Card created successfully!'**
  String get financePayCryptoCardCreatedSuccess;

  /// No description provided for @financePayCryptoCardDetails.
  ///
  /// In en, this message translates to:
  /// **'Card Details'**
  String get financePayCryptoCardDetails;

  /// No description provided for @financePayCryptoCardFound.
  ///
  /// In en, this message translates to:
  /// **'Card Found'**
  String get financePayCryptoCardFound;

  /// No description provided for @financePayCryptoActivateCard.
  ///
  /// In en, this message translates to:
  /// **'Activate your card to access all features.'**
  String get financePayCryptoActivateCard;

  /// No description provided for @financePayCryptoWelcomeBack.
  ///
  /// In en, this message translates to:
  /// **'Welcome Back'**
  String get financePayCryptoWelcomeBack;

  /// No description provided for @financePayCryptoCardActive.
  ///
  /// In en, this message translates to:
  /// **'Your card is active and ready to use.'**
  String get financePayCryptoCardActive;

  /// No description provided for @financePayCryptoBalanceOverview.
  ///
  /// In en, this message translates to:
  /// **'Balance Overview'**
  String get financePayCryptoBalanceOverview;

  /// No description provided for @financePayCryptoCurrentBalance.
  ///
  /// In en, this message translates to:
  /// **'Current balance'**
  String get financePayCryptoCurrentBalance;

  /// No description provided for @financePayCryptoAvailableBalance.
  ///
  /// In en, this message translates to:
  /// **'Available balance'**
  String get financePayCryptoAvailableBalance;

  /// No description provided for @financePayCryptoCardInformation.
  ///
  /// In en, this message translates to:
  /// **'Card Information'**
  String get financePayCryptoCardInformation;

  /// No description provided for @financePayCryptoCardNumber.
  ///
  /// In en, this message translates to:
  /// **'Card number'**
  String get financePayCryptoCardNumber;

  /// No description provided for @financePayCryptoCVV.
  ///
  /// In en, this message translates to:
  /// **'CVV'**
  String get financePayCryptoCVV;

  /// No description provided for @financePayCryptoExpires.
  ///
  /// In en, this message translates to:
  /// **'Expires'**
  String get financePayCryptoExpires;

  /// No description provided for @financePayCryptoCardholder.
  ///
  /// In en, this message translates to:
  /// **'Cardholder'**
  String get financePayCryptoCardholder;

  /// No description provided for @financePayCryptoShowDetails.
  ///
  /// In en, this message translates to:
  /// **'Show Details'**
  String get financePayCryptoShowDetails;

  /// No description provided for @financePayCryptoHideDetails.
  ///
  /// In en, this message translates to:
  /// **'Hide Details'**
  String get financePayCryptoHideDetails;

  /// No description provided for @financePayCryptoActivateCardMessage.
  ///
  /// In en, this message translates to:
  /// **'Activate your card to view sensitive details'**
  String get financePayCryptoActivateCardMessage;

  /// No description provided for @financePayCryptoFreezeCard.
  ///
  /// In en, this message translates to:
  /// **'Freeze Card'**
  String get financePayCryptoFreezeCard;

  /// No description provided for @financePayCryptoEnterReason.
  ///
  /// In en, this message translates to:
  /// **'Enter reason for freezing'**
  String get financePayCryptoEnterReason;

  /// No description provided for @financePayCryptoConfirmFreeze.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to freeze this card?'**
  String get financePayCryptoConfirmFreeze;

  /// No description provided for @financePayCryptoFreeze.
  ///
  /// In en, this message translates to:
  /// **'Freeze'**
  String get financePayCryptoFreeze;

  /// No description provided for @financePayCryptoUnfreeze.
  ///
  /// In en, this message translates to:
  /// **'Unfreeze'**
  String get financePayCryptoUnfreeze;

  /// No description provided for @financePayCryptoCardFrozenSuccess.
  ///
  /// In en, this message translates to:
  /// **'Card frozen successfully'**
  String get financePayCryptoCardFrozenSuccess;

  /// No description provided for @financePayCryptoCardUnfrozenSuccess.
  ///
  /// In en, this message translates to:
  /// **'Card unfrozen successfully'**
  String get financePayCryptoCardUnfrozenSuccess;

  /// No description provided for @financePayCryptoFailedToFreezeCard.
  ///
  /// In en, this message translates to:
  /// **'Failed to freeze card'**
  String get financePayCryptoFailedToFreezeCard;

  /// No description provided for @financePayCryptoFailedToUnfreezeCard.
  ///
  /// In en, this message translates to:
  /// **'Failed to unfreeze card'**
  String get financePayCryptoFailedToUnfreezeCard;

  /// No description provided for @financePayCryptoRecentTransactions.
  ///
  /// In en, this message translates to:
  /// **'Recent transactions'**
  String get financePayCryptoRecentTransactions;

  /// No description provided for @financePayCryptoNoTransactionsYet.
  ///
  /// In en, this message translates to:
  /// **'No transactions yet'**
  String get financePayCryptoNoTransactionsYet;

  /// No description provided for @financePayCryptoDeposit.
  ///
  /// In en, this message translates to:
  /// **'Deposit'**
  String get financePayCryptoDeposit;

  /// No description provided for @financePayCryptoCompleted.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get financePayCryptoCompleted;

  /// No description provided for @financePayCryptoPending.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get financePayCryptoPending;

  /// No description provided for @financePayCryptoDepositDetails.
  ///
  /// In en, this message translates to:
  /// **'Deposit Details'**
  String get financePayCryptoDepositDetails;

  /// No description provided for @financePayCryptoCryptoAmount.
  ///
  /// In en, this message translates to:
  /// **'Crypto Amount'**
  String get financePayCryptoCryptoAmount;

  /// No description provided for @financePayCryptoCoinPrice.
  ///
  /// In en, this message translates to:
  /// **'Coin Price'**
  String get financePayCryptoCoinPrice;

  /// No description provided for @financePayCryptoExchangeRate.
  ///
  /// In en, this message translates to:
  /// **'Exchange Rate'**
  String get financePayCryptoExchangeRate;

  /// No description provided for @financePayCryptoLoadingFee.
  ///
  /// In en, this message translates to:
  /// **'Loading Fee'**
  String get financePayCryptoLoadingFee;

  /// No description provided for @financePayCryptoExchangeFee.
  ///
  /// In en, this message translates to:
  /// **'Exchange Fee'**
  String get financePayCryptoExchangeFee;

  /// No description provided for @financePayCryptoCustomerTXID.
  ///
  /// In en, this message translates to:
  /// **'Customer TX ID'**
  String get financePayCryptoCustomerTXID;

  /// No description provided for @financePayCryptoCopyNumber.
  ///
  /// In en, this message translates to:
  /// **'Copy Number'**
  String get financePayCryptoCopyNumber;

  /// No description provided for @financePayCryptoCopyAll.
  ///
  /// In en, this message translates to:
  /// **'Copy All'**
  String get financePayCryptoCopyAll;

  /// No description provided for @financePayCryptoSecurityTips.
  ///
  /// In en, this message translates to:
  /// **'Security Tips'**
  String get financePayCryptoSecurityTips;

  /// No description provided for @financePayCryptoSecurityMessage.
  ///
  /// In en, this message translates to:
  /// **'Do not share your PIN or card details.\nOnly shop on secure sites (https).\nEnable alerts and blocking from the app.\nCheck your transactions regularly.'**
  String get financePayCryptoSecurityMessage;

  /// No description provided for @financePayCryptoCardNumberCopied.
  ///
  /// In en, this message translates to:
  /// **'Card number copied to clipboard'**
  String get financePayCryptoCardNumberCopied;

  /// No description provided for @financePayCryptoAllDetailsCopied.
  ///
  /// In en, this message translates to:
  /// **'All card details copied to clipboard'**
  String get financePayCryptoAllDetailsCopied;

  /// No description provided for @financePayCryptoSeeCardDetails.
  ///
  /// In en, this message translates to:
  /// **'see your card details'**
  String get financePayCryptoSeeCardDetails;

  /// No description provided for @financePayCryptoNoCards.
  ///
  /// In en, this message translates to:
  /// **'No Cards'**
  String get financePayCryptoNoCards;

  /// No description provided for @financePayCryptoCreateNewCard.
  ///
  /// In en, this message translates to:
  /// **'Create a new card to get started'**
  String get financePayCryptoCreateNewCard;

  /// No description provided for @financePayCryptoCreateANewCard.
  ///
  /// In en, this message translates to:
  /// **'Create a New Card           '**
  String get financePayCryptoCreateANewCard;

  /// No description provided for @financePayCryptoCardActivatedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Card activated successfully!'**
  String get financePayCryptoCardActivatedSuccess;

  /// No description provided for @financePayCryptoFailedToActivateCard.
  ///
  /// In en, this message translates to:
  /// **'Failed to activate card. Please try again.'**
  String get financePayCryptoFailedToActivateCard;

  /// No description provided for @financePayCryptoActivationRequired.
  ///
  /// In en, this message translates to:
  /// **'Activation Required'**
  String get financePayCryptoActivationRequired;

  /// No description provided for @financePayCryptoActivateCardFirst.
  ///
  /// In en, this message translates to:
  /// **'Please activate your card first to view details'**
  String get financePayCryptoActivateCardFirst;

  /// No description provided for @financePayCryptoNewDeposit.
  ///
  /// In en, this message translates to:
  /// **'New Deposit'**
  String get financePayCryptoNewDeposit;

  /// No description provided for @financePayCryptoDepositMoney.
  ///
  /// In en, this message translates to:
  /// **'Deposit money from user to receive from that person.'**
  String get financePayCryptoDepositMoney;

  /// No description provided for @financePayCryptoSelectCryptocurrency.
  ///
  /// In en, this message translates to:
  /// **'Select Cryptocurrency'**
  String get financePayCryptoSelectCryptocurrency;

  /// No description provided for @financePayCryptoAmountUSDT.
  ///
  /// In en, this message translates to:
  /// **'Amount ({currency})'**
  String financePayCryptoAmountUSDT(String currency);

  /// No description provided for @financePayCryptoMinimumAmount.
  ///
  /// In en, this message translates to:
  /// **'Minimum amount: 1 USDT'**
  String get financePayCryptoMinimumAmount;

  /// No description provided for @financePayCryptoRemarkOptional.
  ///
  /// In en, this message translates to:
  /// **'Remark (Optional)'**
  String get financePayCryptoRemarkOptional;

  /// No description provided for @financePayCryptoDepositFunds.
  ///
  /// In en, this message translates to:
  /// **'Deposit Funds'**
  String get financePayCryptoDepositFunds;

  /// No description provided for @financePayCryptoInvalidAmount.
  ///
  /// In en, this message translates to:
  /// **'Invalid Amount'**
  String get financePayCryptoInvalidAmount;

  /// No description provided for @financePayCryptoAmountMustBeAtLeast.
  ///
  /// In en, this message translates to:
  /// **'Amount must be at least 1 {currency}'**
  String financePayCryptoAmountMustBeAtLeast(String currency);

  /// No description provided for @financePayCryptoDepositSuccess.
  ///
  /// In en, this message translates to:
  /// **'Deposit Success'**
  String get financePayCryptoDepositSuccess;

  /// No description provided for @financePayCryptoDepositInitiated.
  ///
  /// In en, this message translates to:
  /// **'Deposit initiated: {transactionId}'**
  String financePayCryptoDepositInitiated(String transactionId);

  /// No description provided for @financePayCryptoDepositFailed.
  ///
  /// In en, this message translates to:
  /// **'Deposit Failed'**
  String get financePayCryptoDepositFailed;

  /// No description provided for @financePayCryptoFailedToProcessDeposit.
  ///
  /// In en, this message translates to:
  /// **'Failed to process deposit'**
  String get financePayCryptoFailedToProcessDeposit;

  /// No description provided for @financePayCryptoHistory.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get financePayCryptoHistory;

  /// No description provided for @financePayCryptoTransferMoney.
  ///
  /// In en, this message translates to:
  /// **'transfer money to any user'**
  String get financePayCryptoTransferMoney;

  /// No description provided for @financePayCryptoNoHistoryYet.
  ///
  /// In en, this message translates to:
  /// **'No History Yet'**
  String get financePayCryptoNoHistoryYet;

  /// No description provided for @financePayCryptoTransactionsWillAppear.
  ///
  /// In en, this message translates to:
  /// **'Your transactions will appear here'**
  String get financePayCryptoTransactionsWillAppear;

  /// No description provided for @financePayCryptoKYCVerification.
  ///
  /// In en, this message translates to:
  /// **'KYC Verification'**
  String get financePayCryptoKYCVerification;

  /// No description provided for @financeKYCSectionPersonalInfo.
  ///
  /// In en, this message translates to:
  /// **'Personal\nInfo'**
  String get financeKYCSectionPersonalInfo;

  /// No description provided for @financeKYCSectionAddress.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get financeKYCSectionAddress;

  /// No description provided for @financeKYCSectionDocuments.
  ///
  /// In en, this message translates to:
  /// **'Documents'**
  String get financeKYCSectionDocuments;

  /// No description provided for @financeKYCSectionReview.
  ///
  /// In en, this message translates to:
  /// **'Review & Submit'**
  String get financeKYCSectionReview;

  /// No description provided for @financeKYCBtnPrevious.
  ///
  /// In en, this message translates to:
  /// **'Previous'**
  String get financeKYCBtnPrevious;

  /// No description provided for @financeKYCBtnNext.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get financeKYCBtnNext;

  /// No description provided for @financeKYCBtnSubmit.
  ///
  /// In en, this message translates to:
  /// **'Submit KYC'**
  String get financeKYCBtnSubmit;

  /// No description provided for @financeKYCBtnCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get financeKYCBtnCancel;

  /// No description provided for @financePayCryptoPersonalInfo.
  ///
  /// In en, this message translates to:
  /// **'Personal\nInfo'**
  String get financePayCryptoPersonalInfo;

  /// No description provided for @financePayCryptoAddress.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get financePayCryptoAddress;

  /// No description provided for @financePayCryptoDocument.
  ///
  /// In en, this message translates to:
  /// **'Document'**
  String get financePayCryptoDocument;

  /// No description provided for @financePayCryptoReview.
  ///
  /// In en, this message translates to:
  /// **'Review'**
  String get financePayCryptoReview;

  /// No description provided for @financePayCryptoFirstName.
  ///
  /// In en, this message translates to:
  /// **'First Name'**
  String get financePayCryptoFirstName;

  /// No description provided for @financePayCryptoLastName.
  ///
  /// In en, this message translates to:
  /// **'Last Name'**
  String get financePayCryptoLastName;

  /// No description provided for @financePayCryptoFirstNameRequired.
  ///
  /// In en, this message translates to:
  /// **'First name is required'**
  String get financePayCryptoFirstNameRequired;

  /// No description provided for @financePayCryptoFirstNameMinLength.
  ///
  /// In en, this message translates to:
  /// **'First name must be at least 3 characters'**
  String get financePayCryptoFirstNameMinLength;

  /// No description provided for @financePayCryptoLastNameRequired.
  ///
  /// In en, this message translates to:
  /// **'Last name is required'**
  String get financePayCryptoLastNameRequired;

  /// No description provided for @financePayCryptoLastNameMinLength.
  ///
  /// In en, this message translates to:
  /// **'Last name must be at least 3 characters'**
  String get financePayCryptoLastNameMinLength;

  /// No description provided for @financePayCryptoZipMinLength.
  ///
  /// In en, this message translates to:
  /// **'ZIP code must be at least 4 characters'**
  String get financePayCryptoZipMinLength;

  /// No description provided for @financePayCryptoFixFollowingIssues.
  ///
  /// In en, this message translates to:
  /// **'Please fix the following issues'**
  String get financePayCryptoFixFollowingIssues;

  /// No description provided for @financePayCryptoPleaseEnterFirstName.
  ///
  /// In en, this message translates to:
  /// **'Please enter your first name'**
  String get financePayCryptoPleaseEnterFirstName;

  /// No description provided for @financePayCryptoPleaseEnterLastName.
  ///
  /// In en, this message translates to:
  /// **'Please enter your last name'**
  String get financePayCryptoPleaseEnterLastName;

  /// No description provided for @financePayCryptoPleaseEnterEmail.
  ///
  /// In en, this message translates to:
  /// **'Please enter your email address'**
  String get financePayCryptoPleaseEnterEmail;

  /// No description provided for @financePayCryptoPleaseEnterValidEmail.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email address'**
  String get financePayCryptoPleaseEnterValidEmail;

  /// No description provided for @financePayCryptoPleaseEnterPhone.
  ///
  /// In en, this message translates to:
  /// **'Please enter your phone number'**
  String get financePayCryptoPleaseEnterPhone;

  /// No description provided for @financePayCryptoPleaseSelectDOB.
  ///
  /// In en, this message translates to:
  /// **'Please select your date of birth'**
  String get financePayCryptoPleaseSelectDOB;

  /// No description provided for @financePayCryptoAgeVerificationError.
  ///
  /// In en, this message translates to:
  /// **'You must be at least 18 years old to proceed'**
  String get financePayCryptoAgeVerificationError;

  /// No description provided for @financePayCryptoPleaseEnterAddress.
  ///
  /// In en, this message translates to:
  /// **'Please enter your address'**
  String get financePayCryptoPleaseEnterAddress;

  /// No description provided for @financePayCryptoPleaseEnterCity.
  ///
  /// In en, this message translates to:
  /// **'Please enter your city'**
  String get financePayCryptoPleaseEnterCity;

  /// No description provided for @financePayCryptoPleaseSelectState.
  ///
  /// In en, this message translates to:
  /// **'Please select your state/province'**
  String get financePayCryptoPleaseSelectState;

  /// No description provided for @financePayCryptoPleaseEnterZip.
  ///
  /// In en, this message translates to:
  /// **'Please enter your ZIP code'**
  String get financePayCryptoPleaseEnterZip;

  /// No description provided for @financePayCryptoPleaseSelectCountry.
  ///
  /// In en, this message translates to:
  /// **'Please select your country'**
  String get financePayCryptoPleaseSelectCountry;

  /// No description provided for @financePayCryptoPleaseEnterDocNumber.
  ///
  /// In en, this message translates to:
  /// **'Please enter your document number'**
  String get financePayCryptoPleaseEnterDocNumber;

  /// No description provided for @financePayCryptoDocNumberMinLength.
  ///
  /// In en, this message translates to:
  /// **'Document number must be at least 4 characters'**
  String get financePayCryptoDocNumberMinLength;

  /// No description provided for @financePayCryptoPleaseEnterMothersName.
  ///
  /// In en, this message translates to:
  /// **'Please enter your mother\'s maiden name'**
  String get financePayCryptoPleaseEnterMothersName;

  /// No description provided for @financePayCryptoMothersNameMinLength.
  ///
  /// In en, this message translates to:
  /// **'Mother\'s maiden name must be at least 2 characters'**
  String get financePayCryptoMothersNameMinLength;

  /// No description provided for @financePayCryptoUploadFrontDoc.
  ///
  /// In en, this message translates to:
  /// **'Please upload the front of your document'**
  String get financePayCryptoUploadFrontDoc;

  /// No description provided for @financePayCryptoUploadBackDoc.
  ///
  /// In en, this message translates to:
  /// **'Please upload the back of your document'**
  String get financePayCryptoUploadBackDoc;

  /// No description provided for @financePayCryptoUploadSelfieDoc.
  ///
  /// In en, this message translates to:
  /// **'Please upload a selfie holding your document clearly visible'**
  String get financePayCryptoUploadSelfieDoc;

  /// No description provided for @financePayCryptoEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get financePayCryptoEmail;

  /// No description provided for @financePayCryptoEmailRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter your email address'**
  String get financePayCryptoEmailRequired;

  /// No description provided for @financePayCryptoEmailInvalid.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email address'**
  String get financePayCryptoEmailInvalid;

  /// No description provided for @financePayCryptoFetchingEmail.
  ///
  /// In en, this message translates to:
  /// **'Fetching email for user'**
  String get financePayCryptoFetchingEmail;

  /// No description provided for @financePayCryptoEmailFetchResponse.
  ///
  /// In en, this message translates to:
  /// **'Email fetch response'**
  String get financePayCryptoEmailFetchResponse;

  /// No description provided for @financePayCryptoEmailExtracted.
  ///
  /// In en, this message translates to:
  /// **'Extracted email from response'**
  String get financePayCryptoEmailExtracted;

  /// No description provided for @financePayCryptoEmailFetchError.
  ///
  /// In en, this message translates to:
  /// **'Error fetching email'**
  String get financePayCryptoEmailFetchError;

  /// No description provided for @financePayCryptoLoadingEmail.
  ///
  /// In en, this message translates to:
  /// **'Loading email for user'**
  String get financePayCryptoLoadingEmail;

  /// No description provided for @financePayCryptoExtractedUsername.
  ///
  /// In en, this message translates to:
  /// **'Extracted username: {username}'**
  String financePayCryptoExtractedUsername(Object username);

  /// No description provided for @financePayCryptoInvalidUserId.
  ///
  /// In en, this message translates to:
  /// **'Invalid user ID format'**
  String get financePayCryptoInvalidUserId;

  /// No description provided for @financePayCryptoCountryRequired.
  ///
  /// In en, this message translates to:
  /// **'Country is required'**
  String get financePayCryptoCountryRequired;

  /// No description provided for @financePayCryptoDocumentsUnderReview.
  ///
  /// In en, this message translates to:
  /// **'Documents Under Review'**
  String get financePayCryptoDocumentsUnderReview;

  /// No description provided for @personal.
  ///
  /// In en, this message translates to:
  /// **'Personal'**
  String get personal;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// No description provided for @review.
  ///
  /// In en, this message translates to:
  /// **'Review'**
  String get review;

  /// No description provided for @financePayCryptoDocumentNumberMinLength.
  ///
  /// In en, this message translates to:
  /// **'Document number must be at least 4 characters'**
  String get financePayCryptoDocumentNumberMinLength;

  /// No description provided for @financePayCryptoMothersMaidenName.
  ///
  /// In en, this message translates to:
  /// **'Mother\'s Maiden Name'**
  String get financePayCryptoMothersMaidenName;

  /// No description provided for @financePayCryptoMothersMaidenNameRequired.
  ///
  /// In en, this message translates to:
  /// **'Mother\'s maiden name is required'**
  String get financePayCryptoMothersMaidenNameRequired;

  /// No description provided for @financePayCryptoCountryCode.
  ///
  /// In en, this message translates to:
  /// **'Country Code'**
  String get financePayCryptoCountryCode;

  /// No description provided for @financePayCryptoPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get financePayCryptoPhoneNumber;

  /// No description provided for @financePayCryptoPhoneRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter your phone number'**
  String get financePayCryptoPhoneRequired;

  /// No description provided for @financePayCryptoPhoneMinLength.
  ///
  /// In en, this message translates to:
  /// **'Phone number must be at least 5 digits'**
  String get financePayCryptoPhoneMinLength;

  /// No description provided for @financePayCryptoGender.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get financePayCryptoGender;

  /// No description provided for @financePayCryptoMale.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get financePayCryptoMale;

  /// No description provided for @financePayCryptoFemale.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get financePayCryptoFemale;

  /// No description provided for @financePayCryptoDateOfBirth.
  ///
  /// In en, this message translates to:
  /// **'Date of Birth'**
  String get financePayCryptoDateOfBirth;

  /// No description provided for @financePayCryptoDobRequired.
  ///
  /// In en, this message translates to:
  /// **'Date of birth is required'**
  String get financePayCryptoDobRequired;

  /// No description provided for @financePayCryptoAddressRequired.
  ///
  /// In en, this message translates to:
  /// **'Address is required'**
  String get financePayCryptoAddressRequired;

  /// No description provided for @financePayCryptoAddressMinLength.
  ///
  /// In en, this message translates to:
  /// **'Address must be at least 5 characters'**
  String get financePayCryptoAddressMinLength;

  /// No description provided for @financePayCryptoCity.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get financePayCryptoCity;

  /// No description provided for @financePayCryptoCityRequired.
  ///
  /// In en, this message translates to:
  /// **'City is required'**
  String get financePayCryptoCityRequired;

  /// No description provided for @financePayCryptoCountry.
  ///
  /// In en, this message translates to:
  /// **'Country'**
  String get financePayCryptoCountry;

  /// No description provided for @financePayCryptoState.
  ///
  /// In en, this message translates to:
  /// **'State/Province'**
  String get financePayCryptoState;

  /// No description provided for @financePayCryptoStateRequired.
  ///
  /// In en, this message translates to:
  /// **'State/Province is required'**
  String get financePayCryptoStateRequired;

  /// No description provided for @financePayCryptoStateProvince.
  ///
  /// In en, this message translates to:
  /// **'State/Province'**
  String get financePayCryptoStateProvince;

  /// No description provided for @financePayCryptoSelectCountryFirst.
  ///
  /// In en, this message translates to:
  /// **'Select a country first'**
  String get financePayCryptoSelectCountryFirst;

  /// No description provided for @financePayCryptoZipCode.
  ///
  /// In en, this message translates to:
  /// **'ZIP Code'**
  String get financePayCryptoZipCode;

  /// No description provided for @financePayCryptoZipRequired.
  ///
  /// In en, this message translates to:
  /// **'ZIP code is required'**
  String get financePayCryptoZipRequired;

  /// No description provided for @financePayCryptoDocumentType.
  ///
  /// In en, this message translates to:
  /// **'Document Type'**
  String get financePayCryptoDocumentType;

  /// No description provided for @financePayCryptoPassport.
  ///
  /// In en, this message translates to:
  /// **'Passport'**
  String get financePayCryptoPassport;

  /// No description provided for @financePayCryptoIdCard.
  ///
  /// In en, this message translates to:
  /// **'ID Card'**
  String get financePayCryptoIdCard;

  /// No description provided for @financePayCryptoDriversLicense.
  ///
  /// In en, this message translates to:
  /// **'Driver\'s License'**
  String get financePayCryptoDriversLicense;

  /// No description provided for @financePayCryptoDocumentNumber.
  ///
  /// In en, this message translates to:
  /// **'Document Number'**
  String get financePayCryptoDocumentNumber;

  /// No description provided for @financePayCryptoDocumentNumberRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter document number'**
  String get financePayCryptoDocumentNumberRequired;

  /// No description provided for @financePayCryptoFrontDocument.
  ///
  /// In en, this message translates to:
  /// **'Front of Document'**
  String get financePayCryptoFrontDocument;

  /// No description provided for @financePayCryptoBackDocument.
  ///
  /// In en, this message translates to:
  /// **'Back of Document'**
  String get financePayCryptoBackDocument;

  /// No description provided for @financePayCryptoSelfieWithDocument.
  ///
  /// In en, this message translates to:
  /// **'Selfie with Document'**
  String get financePayCryptoSelfieWithDocument;

  /// No description provided for @financePayCryptoUploadPhoto.
  ///
  /// In en, this message translates to:
  /// **'Upload Photo'**
  String get financePayCryptoUploadPhoto;

  /// No description provided for @financePayCryptoTakePhoto.
  ///
  /// In en, this message translates to:
  /// **'Take Photo'**
  String get financePayCryptoTakePhoto;

  /// No description provided for @financePayCryptoChooseFromGallery.
  ///
  /// In en, this message translates to:
  /// **'Choose from Gallery'**
  String get financePayCryptoChooseFromGallery;

  /// No description provided for @financePayCryptoCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get financePayCryptoCancel;

  /// No description provided for @financePayCryptoNext.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get financePayCryptoNext;

  /// No description provided for @financePayCryptoPrevious.
  ///
  /// In en, this message translates to:
  /// **'Previous'**
  String get financePayCryptoPrevious;

  /// No description provided for @financePayCryptoSubmit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get financePayCryptoSubmit;

  /// No description provided for @financePayCryptoReviewYourInfo.
  ///
  /// In en, this message translates to:
  /// **'Review Your Information'**
  String get financePayCryptoReviewYourInfo;

  /// No description provided for @financePayCryptoPleaseReview.
  ///
  /// In en, this message translates to:
  /// **'Please review your information before submitting.'**
  String get financePayCryptoPleaseReview;

  /// No description provided for @financePayCryptoDocumentRequired.
  ///
  /// In en, this message translates to:
  /// **'{documentType} is required'**
  String financePayCryptoDocumentRequired(Object documentType);

  /// No description provided for @financePayCryptoKYCSubmitConfirmTitle.
  ///
  /// In en, this message translates to:
  /// **'Submit KYC Information'**
  String get financePayCryptoKYCSubmitConfirmTitle;

  /// No description provided for @financePayCryptoKYCSubmitConfirmMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to submit your KYC information? You won\'t be able to make changes after submission.'**
  String get financePayCryptoKYCSubmitConfirmMessage;

  /// No description provided for @financePayCryptoKYCSubmitSuccess.
  ///
  /// In en, this message translates to:
  /// **'KYC information submitted successfully!'**
  String get financePayCryptoKYCSubmitSuccess;

  /// No description provided for @financePayCryptoKYCSubmitError.
  ///
  /// In en, this message translates to:
  /// **'Failed to submit KYC information. Please try again.'**
  String get financePayCryptoKYCSubmitError;

  /// No description provided for @financePayCryptoKYCProcessing.
  ///
  /// In en, this message translates to:
  /// **'Your identity verification is being processed. We\'ll notify you once approved.'**
  String get financePayCryptoKYCProcessing;

  /// No description provided for @financePayCryptoKYCUnderReviewTitle.
  ///
  /// In en, this message translates to:
  /// **'Under Review'**
  String get financePayCryptoKYCUnderReviewTitle;

  /// No description provided for @financePayCryptoKYCUnderReviewMessage.
  ///
  /// In en, this message translates to:
  /// **'Your KYC information is being reviewed. We\'ll notify you once it\'s approved.'**
  String get financePayCryptoKYCUnderReviewMessage;

  /// No description provided for @financePayCryptoKYCAwaitingApproval.
  ///
  /// In en, this message translates to:
  /// **'Awaiting Approval'**
  String get financePayCryptoKYCAwaitingApproval;

  /// No description provided for @financePayCryptoKYCDocumentsReceived.
  ///
  /// In en, this message translates to:
  /// **'Documents Received'**
  String get financePayCryptoKYCDocumentsReceived;

  /// No description provided for @financePayCryptoKYCDocumentsUnderReview.
  ///
  /// In en, this message translates to:
  /// **'Documents Under Review'**
  String get financePayCryptoKYCDocumentsUnderReview;

  /// No description provided for @financePayCryptoKYCApprovalPending.
  ///
  /// In en, this message translates to:
  /// **'Approval Pending'**
  String get financePayCryptoKYCApprovalPending;

  /// No description provided for @financePayCryptoKYCCheckStatus.
  ///
  /// In en, this message translates to:
  /// **'Check Status'**
  String get financePayCryptoKYCCheckStatus;

  /// No description provided for @financePayCryptoKYCBackToHome.
  ///
  /// In en, this message translates to:
  /// **'Back to Home'**
  String get financePayCryptoKYCBackToHome;

  /// No description provided for @financeKYCFirstName.
  ///
  /// In en, this message translates to:
  /// **'First Name'**
  String get financeKYCFirstName;

  /// No description provided for @financeKYCLastName.
  ///
  /// In en, this message translates to:
  /// **'Last Name'**
  String get financeKYCLastName;

  /// No description provided for @financeKYCEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get financeKYCEmail;

  /// No description provided for @financeKYCCountryCode.
  ///
  /// In en, this message translates to:
  /// **'Country Code'**
  String get financeKYCCountryCode;

  /// No description provided for @financeKYCPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get financeKYCPhoneNumber;

  /// No description provided for @financeKYCGender.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get financeKYCGender;

  /// No description provided for @financeKYCMale.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get financeKYCMale;

  /// No description provided for @financeKYCFemale.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get financeKYCFemale;

  /// No description provided for @financeKYCDateOfBirth.
  ///
  /// In en, this message translates to:
  /// **'Date of Birth'**
  String get financeKYCDateOfBirth;

  /// No description provided for @financeKYCAddress.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get financeKYCAddress;

  /// No description provided for @financeKYCCity.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get financeKYCCity;

  /// No description provided for @financeKYCState.
  ///
  /// In en, this message translates to:
  /// **'State/Province'**
  String get financeKYCState;

  /// No description provided for @financeKYCZipCode.
  ///
  /// In en, this message translates to:
  /// **'ZIP Code'**
  String get financeKYCZipCode;

  /// No description provided for @financeKYCSelectCountryFirst.
  ///
  /// In en, this message translates to:
  /// **'Select a country first'**
  String get financeKYCSelectCountryFirst;

  /// No description provided for @financePayCryptoPleaseEnterCountryCode.
  ///
  /// In en, this message translates to:
  /// **'Please enter country code'**
  String get financePayCryptoPleaseEnterCountryCode;

  /// No description provided for @financePayCryptoPleaseEnterPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Please enter your phone number'**
  String get financePayCryptoPleaseEnterPhoneNumber;

  /// No description provided for @financePayCryptoKYCUnderReview.
  ///
  /// In en, this message translates to:
  /// **'KYC Under Review'**
  String get financePayCryptoKYCUnderReview;

  /// No description provided for @financePayCryptoDocumentsReceived.
  ///
  /// In en, this message translates to:
  /// **'Documents Received'**
  String get financePayCryptoDocumentsReceived;

  /// No description provided for @financePayCryptoUnderReview.
  ///
  /// In en, this message translates to:
  /// **'Under Review'**
  String get financePayCryptoUnderReview;

  /// No description provided for @financePayCryptoApprovalPending.
  ///
  /// In en, this message translates to:
  /// **'Approval Pending'**
  String get financePayCryptoApprovalPending;

  /// No description provided for @financePayCryptoCheckStatus.
  ///
  /// In en, this message translates to:
  /// **'Check Status'**
  String get financePayCryptoCheckStatus;

  /// No description provided for @financePayCryptoZIPCode.
  ///
  /// In en, this message translates to:
  /// **'ZIP Code'**
  String get financePayCryptoZIPCode;

  /// No description provided for @financePayCryptoMotherMaidenName.
  ///
  /// In en, this message translates to:
  /// **'Mother\'s Maiden Name'**
  String get financePayCryptoMotherMaidenName;

  /// No description provided for @financePayCryptoUploadFrontID.
  ///
  /// In en, this message translates to:
  /// **'Upload Front ID'**
  String get financePayCryptoUploadFrontID;

  /// No description provided for @financePayCryptoUploadBackID.
  ///
  /// In en, this message translates to:
  /// **'Upload Back ID'**
  String get financePayCryptoUploadBackID;

  /// No description provided for @financePayCryptoUploadSelfie.
  ///
  /// In en, this message translates to:
  /// **'Upload Selfie with Document'**
  String get financePayCryptoUploadSelfie;

  /// No description provided for @financePayCryptoUploaded.
  ///
  /// In en, this message translates to:
  /// **'Uploaded'**
  String get financePayCryptoUploaded;

  /// No description provided for @financePayCryptoUploadImage.
  ///
  /// In en, this message translates to:
  /// **'Upload image'**
  String get financePayCryptoUploadImage;

  /// No description provided for @financePayCryptoName.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get financePayCryptoName;

  /// No description provided for @financePayCryptoPhone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get financePayCryptoPhone;

  /// No description provided for @financePayCryptoFrontImage.
  ///
  /// In en, this message translates to:
  /// **'Front Image'**
  String get financePayCryptoFrontImage;

  /// No description provided for @financePayCryptoBackImage.
  ///
  /// In en, this message translates to:
  /// **'Back Image'**
  String get financePayCryptoBackImage;

  /// No description provided for @financePayCryptoMixedImage.
  ///
  /// In en, this message translates to:
  /// **'Mixed Image'**
  String get financePayCryptoMixedImage;

  /// No description provided for @financePayCryptoNotUploaded.
  ///
  /// In en, this message translates to:
  /// **'Not uploaded'**
  String get financePayCryptoNotUploaded;

  /// No description provided for @financePayCryptoSubmitKYC.
  ///
  /// In en, this message translates to:
  /// **'Submit KYC'**
  String get financePayCryptoSubmitKYC;

  /// No description provided for @financePayCryptoMissingInfo.
  ///
  /// In en, this message translates to:
  /// **'Missing Information'**
  String get financePayCryptoMissingInfo;

  /// No description provided for @financePayCryptoKYCApproved.
  ///
  /// In en, this message translates to:
  /// **'KYC Approved'**
  String get financePayCryptoKYCApproved;

  /// No description provided for @financePayCryptoVerificationComplete.
  ///
  /// In en, this message translates to:
  /// **'Your identity verification is complete'**
  String get financePayCryptoVerificationComplete;

  /// No description provided for @financePayCryptoGoToWallet.
  ///
  /// In en, this message translates to:
  /// **'Go to Wallet'**
  String get financePayCryptoGoToWallet;

  /// No description provided for @financePayCryptoDefaultCard.
  ///
  /// In en, this message translates to:
  /// **'Default card'**
  String get financePayCryptoDefaultCard;

  /// No description provided for @financePayCryptoUseAsDefault.
  ///
  /// In en, this message translates to:
  /// **'Use this card as default'**
  String get financePayCryptoUseAsDefault;

  /// No description provided for @financePayCryptoContactlessPayment.
  ///
  /// In en, this message translates to:
  /// **'Contactless payment'**
  String get financePayCryptoContactlessPayment;

  /// No description provided for @financePayCryptoEnableContactless.
  ///
  /// In en, this message translates to:
  /// **'Enable contactless payments'**
  String get financePayCryptoEnableContactless;

  /// No description provided for @financePayCryptoPINCode.
  ///
  /// In en, this message translates to:
  /// **'PIN code'**
  String get financePayCryptoPINCode;

  /// No description provided for @financePayCryptoAskPINWhenPaying.
  ///
  /// In en, this message translates to:
  /// **'Ask for a PIN code when paying'**
  String get financePayCryptoAskPINWhenPaying;

  /// No description provided for @financePayCryptoSpending.
  ///
  /// In en, this message translates to:
  /// **'Spending'**
  String get financePayCryptoSpending;

  /// No description provided for @financePayCryptoTransactionHistory.
  ///
  /// In en, this message translates to:
  /// **'Transaction'**
  String get financePayCryptoTransactionHistory;

  /// No description provided for @financePayCryptoActivateNow.
  ///
  /// In en, this message translates to:
  /// **'Activate Now'**
  String get financePayCryptoActivateNow;

  /// No description provided for @financePayCryptoActivating.
  ///
  /// In en, this message translates to:
  /// **'Activating...'**
  String get financePayCryptoActivating;

  /// No description provided for @financePayCryptoNoDeposits.
  ///
  /// In en, this message translates to:
  /// **'No Deposits'**
  String get financePayCryptoNoDeposits;

  /// No description provided for @financeExternalAccountPleaseCreateCustomer.
  ///
  /// In en, this message translates to:
  /// **'Please create a customer profile first to manage external accounts'**
  String get financeExternalAccountPleaseCreateCustomer;

  /// No description provided for @financeExternalAccountWeNeedInfo.
  ///
  /// In en, this message translates to:
  /// **'We need some information from you to set up the external account'**
  String get financeExternalAccountWeNeedInfo;

  /// No description provided for @financeExternalAccountCreate.
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get financeExternalAccountCreate;

  /// No description provided for @financeExternalAccountBankName.
  ///
  /// In en, this message translates to:
  /// **'Bank name'**
  String get financeExternalAccountBankName;

  /// No description provided for @financeExternalAccountCreated.
  ///
  /// In en, this message translates to:
  /// **'Created'**
  String get financeExternalAccountCreated;

  /// No description provided for @financeExternalAccountTitle.
  ///
  /// In en, this message translates to:
  /// **'External Accounts'**
  String get financeExternalAccountTitle;

  /// No description provided for @financeExternalAccountSingular.
  ///
  /// In en, this message translates to:
  /// **'External account'**
  String get financeExternalAccountSingular;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @financeLiquidationAddresses.
  ///
  /// In en, this message translates to:
  /// **'Liquidation Addresses'**
  String get financeLiquidationAddresses;

  /// No description provided for @financeLiquidationAddressDetails.
  ///
  /// In en, this message translates to:
  /// **'Liquidation Address Details'**
  String get financeLiquidationAddressDetails;

  /// No description provided for @financeCreateLiquidationAddress.
  ///
  /// In en, this message translates to:
  /// **'Create liquidation address'**
  String get financeCreateLiquidationAddress;

  /// No description provided for @financeLetsStartLiquidation.
  ///
  /// In en, this message translates to:
  /// **'Let\'s start\na liquidation address'**
  String get financeLetsStartLiquidation;

  /// No description provided for @financeWeNeedInfoLiquidation.
  ///
  /// In en, this message translates to:
  /// **'We need some information from you to set up a Liquidation address'**
  String get financeWeNeedInfoLiquidation;

  /// No description provided for @financeManageLiquidationAddresses.
  ///
  /// In en, this message translates to:
  /// **'Manage cryptocurrency liquidation addresses for automatic conversions'**
  String get financeManageLiquidationAddresses;

  /// No description provided for @financeLoadingLiquidationAddresses.
  ///
  /// In en, this message translates to:
  /// **'Loading Liquidation Addresses...'**
  String get financeLoadingLiquidationAddresses;

  /// No description provided for @financeClientReferenceID.
  ///
  /// In en, this message translates to:
  /// **'Client Reference ID'**
  String get financeClientReferenceID;

  /// No description provided for @financeClientReferenceIDRequired.
  ///
  /// In en, this message translates to:
  /// **'Client reference ID is required'**
  String get financeClientReferenceIDRequired;

  /// No description provided for @financeWireMessage.
  ///
  /// In en, this message translates to:
  /// **'Wire Message'**
  String get financeWireMessage;

  /// No description provided for @financeWireMessageRequired.
  ///
  /// In en, this message translates to:
  /// **'Wire message is required'**
  String get financeWireMessageRequired;

  /// No description provided for @financeSelectCurrencyLabel.
  ///
  /// In en, this message translates to:
  /// **'Select currency'**
  String get financeSelectCurrencyLabel;

  /// No description provided for @financeCurrencyRequired.
  ///
  /// In en, this message translates to:
  /// **'Currency is required'**
  String get financeCurrencyRequired;

  /// No description provided for @financeChain.
  ///
  /// In en, this message translates to:
  /// **'Chain'**
  String get financeChain;

  /// No description provided for @financeSelectChain.
  ///
  /// In en, this message translates to:
  /// **'Select chain'**
  String get financeSelectChain;

  /// No description provided for @financeChainRequired.
  ///
  /// In en, this message translates to:
  /// **'Chain is required'**
  String get financeChainRequired;

  /// No description provided for @financeSelectExternalAccount.
  ///
  /// In en, this message translates to:
  /// **'Select external account'**
  String get financeSelectExternalAccount;

  /// No description provided for @financeAddressInvalidWarning.
  ///
  /// In en, this message translates to:
  /// **'The address for this external account is invalid'**
  String get financeAddressInvalidWarning;

  /// No description provided for @financeAddressInformation.
  ///
  /// In en, this message translates to:
  /// **'Address Information'**
  String get financeAddressInformation;

  /// No description provided for @financeActiveBalance.
  ///
  /// In en, this message translates to:
  /// **'Active Balance'**
  String get financeActiveBalance;

  /// No description provided for @financePendingBalance.
  ///
  /// In en, this message translates to:
  /// **'Pending Balance'**
  String get financePendingBalance;

  /// No description provided for @financeBalanceNotAvailable.
  ///
  /// In en, this message translates to:
  /// **'Balance information not available'**
  String get financeBalanceNotAvailable;

  /// No description provided for @financeTransactionHistory.
  ///
  /// In en, this message translates to:
  /// **'Transaction History'**
  String get financeTransactionHistory;

  /// No description provided for @financeNoTransactions.
  ///
  /// In en, this message translates to:
  /// **'No transactions'**
  String get financeNoTransactions;

  /// No description provided for @financeNoDrainTransactions.
  ///
  /// In en, this message translates to:
  /// **'No drain transactions found for this address'**
  String get financeNoDrainTransactions;

  /// No description provided for @financePaymentRail.
  ///
  /// In en, this message translates to:
  /// **'Payment Rail'**
  String get financePaymentRail;

  /// No description provided for @financeDestinationCurrencyLabel.
  ///
  /// In en, this message translates to:
  /// **'Destination Currency'**
  String get financeDestinationCurrencyLabel;

  /// No description provided for @financeViewLiquidationInfo.
  ///
  /// In en, this message translates to:
  /// **'View liquidation address information and transaction history'**
  String get financeViewLiquidationInfo;

  /// No description provided for @financeCouldNotLoadDetails.
  ///
  /// In en, this message translates to:
  /// **'Could not load liquidation address details'**
  String get financeCouldNotLoadDetails;

  /// No description provided for @financeBalance.
  ///
  /// In en, this message translates to:
  /// **'Balance'**
  String get financeBalance;

  /// No description provided for @financeFailedToLoad.
  ///
  /// In en, this message translates to:
  /// **'Failed to Load'**
  String get financeFailedToLoad;

  /// No description provided for @financeVirtualAccounts.
  ///
  /// In en, this message translates to:
  /// **'Virtual Accounts'**
  String get financeVirtualAccounts;

  /// No description provided for @financeLoadingVirtualAccount.
  ///
  /// In en, this message translates to:
  /// **'Loading Virtual account...'**
  String get financeLoadingVirtualAccount;

  /// No description provided for @financeCreateVirtualAccount.
  ///
  /// In en, this message translates to:
  /// **'Create virtual account'**
  String get financeCreateVirtualAccount;

  /// No description provided for @financeCustomerRequired.
  ///
  /// In en, this message translates to:
  /// **'Customer Required'**
  String get financeCustomerRequired;

  /// No description provided for @financePleaseCreateCustomerFirst.
  ///
  /// In en, this message translates to:
  /// **'Please create a customer account first'**
  String get financePleaseCreateCustomerFirst;

  /// No description provided for @financeCreateVirtualAddress.
  ///
  /// In en, this message translates to:
  /// **'Create Virtual address'**
  String get financeCreateVirtualAddress;

  /// No description provided for @financeDestinationAddressRequired.
  ///
  /// In en, this message translates to:
  /// **'Destination address is required'**
  String get financeDestinationAddressRequired;

  /// No description provided for @financeAddressTooShort.
  ///
  /// In en, this message translates to:
  /// **'Address too short'**
  String get financeAddressTooShort;

  /// No description provided for @financeSelectSourceCurrency.
  ///
  /// In en, this message translates to:
  /// **'Select source currency'**
  String get financeSelectSourceCurrency;

  /// No description provided for @financeSelectCurrencyRequired.
  ///
  /// In en, this message translates to:
  /// **'Select currency is required'**
  String get financeSelectCurrencyRequired;

  /// No description provided for @financeSelectDestinationChain.
  ///
  /// In en, this message translates to:
  /// **'Select destination chain'**
  String get financeSelectDestinationChain;

  /// No description provided for @financeDestinationChainRequired.
  ///
  /// In en, this message translates to:
  /// **'Destination chain is required'**
  String get financeDestinationChainRequired;

  /// No description provided for @financeSelectDestinationCurrency.
  ///
  /// In en, this message translates to:
  /// **'Select destination currency'**
  String get financeSelectDestinationCurrency;

  /// No description provided for @financeDestinationCurrencyRequired.
  ///
  /// In en, this message translates to:
  /// **'Destination currency is required'**
  String get financeDestinationCurrencyRequired;

  /// No description provided for @financeFailedToCreateVirtualAccount.
  ///
  /// In en, this message translates to:
  /// **'Failed to create virtual account'**
  String get financeFailedToCreateVirtualAccount;

  /// No description provided for @financeInvalidPINTryAgain.
  ///
  /// In en, this message translates to:
  /// **'Invalid PIN. Please try again.'**
  String get financeInvalidPINTryAgain;

  /// No description provided for @financePINVerificationFailedTryAgain.
  ///
  /// In en, this message translates to:
  /// **'PIN verification failed. Please try again.'**
  String get financePINVerificationFailedTryAgain;

  /// No description provided for @financeDetails.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get financeDetails;

  /// No description provided for @financeAccountNumberCopiedShort.
  ///
  /// In en, this message translates to:
  /// **'Account number copied'**
  String get financeAccountNumberCopiedShort;

  /// No description provided for @financeAccountNumberCopied.
  ///
  /// In en, this message translates to:
  /// **'Account number copied to clipboard'**
  String get financeAccountNumberCopied;

  /// No description provided for @financeVirtualAccountDetails.
  ///
  /// In en, this message translates to:
  /// **'Virtual account details'**
  String get financeVirtualAccountDetails;

  /// No description provided for @financeBankInformation.
  ///
  /// In en, this message translates to:
  /// **'Bank information'**
  String get financeBankInformation;

  /// No description provided for @financeBeneficiaryInformation.
  ///
  /// In en, this message translates to:
  /// **'Beneficiary information'**
  String get financeBeneficiaryInformation;

  /// No description provided for @financeBeneficiaryAddress.
  ///
  /// In en, this message translates to:
  /// **'Beneficiary Address'**
  String get financeBeneficiaryAddress;

  /// No description provided for @financeDestinationDetails.
  ///
  /// In en, this message translates to:
  /// **'Destination details'**
  String get financeDestinationDetails;

  /// No description provided for @financeLetsStartVirtualAccount.
  ///
  /// In en, this message translates to:
  /// **'Let\'s start\na Virtual account'**
  String get financeLetsStartVirtualAccount;

  /// No description provided for @financeWeNeedInfoVirtualAccount.
  ///
  /// In en, this message translates to:
  /// **'We need some information from you\nto set up the Virtual account'**
  String get financeWeNeedInfoVirtualAccount;

  /// No description provided for @financePayCryptoCardActivationUnderReview.
  ///
  /// In en, this message translates to:
  /// **'Card activation is under review'**
  String get financePayCryptoCardActivationUnderReview;

  /// No description provided for @financePayCryptoCardVerificationFailed.
  ///
  /// In en, this message translates to:
  /// **'Card verification failed'**
  String get financePayCryptoCardVerificationFailed;

  /// No description provided for @financePayCryptoCardCreationFailed.
  ///
  /// In en, this message translates to:
  /// **'Card creation failed'**
  String get financePayCryptoCardCreationFailed;

  /// No description provided for @financePayCryptoCardReadyActivation.
  ///
  /// In en, this message translates to:
  /// **'Your card is ready for activation'**
  String get financePayCryptoCardReadyActivation;

  /// No description provided for @financePayCryptoActivateToAccess.
  ///
  /// In en, this message translates to:
  /// **'Activate your card to access all features'**
  String get financePayCryptoActivateToAccess;

  /// No description provided for @financePayCryptoKYCCompletedSuccess.
  ///
  /// In en, this message translates to:
  /// **'KYC completed successfully!'**
  String get financePayCryptoKYCCompletedSuccess;

  /// No description provided for @financePayCryptoFailedToCreateCard.
  ///
  /// In en, this message translates to:
  /// **'Failed to create card'**
  String get financePayCryptoFailedToCreateCard;

  /// No description provided for @financePayCryptoErrorLoadingCard.
  ///
  /// In en, this message translates to:
  /// **'Error loading card'**
  String get financePayCryptoErrorLoadingCard;

  /// No description provided for @financePayCryptoAccountNotFound.
  ///
  /// In en, this message translates to:
  /// **'Account number not found'**
  String get financePayCryptoAccountNotFound;

  /// No description provided for @financeMain_Wallet.
  ///
  /// In en, this message translates to:
  /// **'Wallet'**
  String get financeMain_Wallet;

  /// No description provided for @financeResetYourPIN.
  ///
  /// In en, this message translates to:
  /// **'Reset your PIN'**
  String get financeResetYourPIN;

  /// No description provided for @financeEnterOTPAndNewPIN.
  ///
  /// In en, this message translates to:
  /// **'Enter OTP sent to your email and set your new PIN'**
  String get financeEnterOTPAndNewPIN;

  /// No description provided for @financeEnterNewPINToReset.
  ///
  /// In en, this message translates to:
  /// **'Enter your new PIN to reset it.'**
  String get financeEnterNewPINToReset;

  /// No description provided for @financeOTPCode.
  ///
  /// In en, this message translates to:
  /// **'OTP Code'**
  String get financeOTPCode;

  /// No description provided for @financeEnter6DigitOTP.
  ///
  /// In en, this message translates to:
  /// **'Enter 6-digit OTP'**
  String get financeEnter6DigitOTP;

  /// No description provided for @financeNewPIN.
  ///
  /// In en, this message translates to:
  /// **'New PIN'**
  String get financeNewPIN;

  /// No description provided for @financeConfirmPIN.
  ///
  /// In en, this message translates to:
  /// **'Confirm PIN'**
  String get financeConfirmPIN;

  /// No description provided for @financePINMust4Digits.
  ///
  /// In en, this message translates to:
  /// **'PIN must be 4 digits'**
  String get financePINMust4Digits;

  /// No description provided for @financePINsDoNotMatch.
  ///
  /// In en, this message translates to:
  /// **'PINs do not match'**
  String get financePINsDoNotMatch;

  /// No description provided for @financeOTPSentToEmail.
  ///
  /// In en, this message translates to:
  /// **'OTP sent to your email'**
  String get financeOTPSentToEmail;

  /// No description provided for @subscriptionInformation.
  ///
  /// In en, this message translates to:
  /// **'Subscription Information'**
  String get subscriptionInformation;

  /// No description provided for @subscriptionMessage.
  ///
  /// In en, this message translates to:
  /// **'You are about to download the beta version of Be-MindPower. After testing the bank account, wallet, and debit card services, an initial charge of 30 USD will be applied. If you decide to continue, the subscription will be 17.5 USD per month. If you agree, please press to continue.'**
  String get subscriptionMessage;

  /// No description provided for @noItemsFound.
  ///
  /// In en, this message translates to:
  /// **'No items found'**
  String get noItemsFound;

  /// No description provided for @uploaded.
  ///
  /// In en, this message translates to:
  /// **'Uploaded'**
  String get uploaded;

  /// No description provided for @uploadImage.
  ///
  /// In en, this message translates to:
  /// **'Upload image'**
  String get uploadImage;

  /// No description provided for @addressCopiedToClipboard.
  ///
  /// In en, this message translates to:
  /// **'Address copied to clipboard'**
  String get addressCopiedToClipboard;

  /// No description provided for @recentTransactions.
  ///
  /// In en, this message translates to:
  /// **'Recent transactions'**
  String get recentTransactions;

  /// No description provided for @attention.
  ///
  /// In en, this message translates to:
  /// **'Attention'**
  String get attention;

  /// No description provided for @usdcPaymentWarning.
  ///
  /// In en, this message translates to:
  /// **'To ensure that your payment is received correctly, we only accept transfers in USDC (USD Coin). Payments sent in other cryptocurrencies cannot be credited or processed.'**
  String get usdcPaymentWarning;

  /// No description provided for @iAgree.
  ///
  /// In en, this message translates to:
  /// **'I Agree'**
  String get iAgree;

  /// No description provided for @noCountriesAvailable.
  ///
  /// In en, this message translates to:
  /// **'No countries available'**
  String get noCountriesAvailable;

  /// No description provided for @noCountriesFound.
  ///
  /// In en, this message translates to:
  /// **'No countries found'**
  String get noCountriesFound;

  /// No description provided for @january.
  ///
  /// In en, this message translates to:
  /// **'January'**
  String get january;

  /// No description provided for @february.
  ///
  /// In en, this message translates to:
  /// **'February'**
  String get february;

  /// No description provided for @march.
  ///
  /// In en, this message translates to:
  /// **'March'**
  String get march;

  /// No description provided for @april.
  ///
  /// In en, this message translates to:
  /// **'April'**
  String get april;

  /// No description provided for @may.
  ///
  /// In en, this message translates to:
  /// **'May'**
  String get may;

  /// No description provided for @june.
  ///
  /// In en, this message translates to:
  /// **'June'**
  String get june;

  /// No description provided for @july.
  ///
  /// In en, this message translates to:
  /// **'July'**
  String get july;

  /// No description provided for @august.
  ///
  /// In en, this message translates to:
  /// **'August'**
  String get august;

  /// No description provided for @september.
  ///
  /// In en, this message translates to:
  /// **'September'**
  String get september;

  /// No description provided for @october.
  ///
  /// In en, this message translates to:
  /// **'October'**
  String get october;

  /// No description provided for @november.
  ///
  /// In en, this message translates to:
  /// **'November'**
  String get november;

  /// No description provided for @december.
  ///
  /// In en, this message translates to:
  /// **'December'**
  String get december;

  /// No description provided for @selectMonth.
  ///
  /// In en, this message translates to:
  /// **'Select month'**
  String get selectMonth;

  /// No description provided for @selectYear.
  ///
  /// In en, this message translates to:
  /// **'Select year'**
  String get selectYear;

  /// No description provided for @birthday.
  ///
  /// In en, this message translates to:
  /// **'Birthday'**
  String get birthday;

  /// No description provided for @sunday.
  ///
  /// In en, this message translates to:
  /// **'Su'**
  String get sunday;

  /// No description provided for @monday.
  ///
  /// In en, this message translates to:
  /// **'Mo'**
  String get monday;

  /// No description provided for @tuesday.
  ///
  /// In en, this message translates to:
  /// **'Tu'**
  String get tuesday;

  /// No description provided for @wednesday.
  ///
  /// In en, this message translates to:
  /// **'We'**
  String get wednesday;

  /// No description provided for @thursday.
  ///
  /// In en, this message translates to:
  /// **'Th'**
  String get thursday;

  /// No description provided for @friday.
  ///
  /// In en, this message translates to:
  /// **'Fr'**
  String get friday;

  /// No description provided for @saturday.
  ///
  /// In en, this message translates to:
  /// **'Sa'**
  String get saturday;

  /// No description provided for @virtualCard.
  ///
  /// In en, this message translates to:
  /// **'Virtual Card'**
  String get virtualCard;

  /// No description provided for @cardType.
  ///
  /// In en, this message translates to:
  /// **'Card Type'**
  String get cardType;

  /// No description provided for @financeErrorCountryLoadFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load countries data'**
  String get financeErrorCountryLoadFailed;

  /// No description provided for @financeErrorRegistrationFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to register customer after retries'**
  String get financeErrorRegistrationFailed;

  /// No description provided for @financeErrorOTPVerificationFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to verify OTP after retries'**
  String get financeErrorOTPVerificationFailed;

  /// No description provided for @financeErrorCustomerStatusFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to get customer status'**
  String get financeErrorCustomerStatusFailed;

  /// No description provided for @financeErrorKYCLinkFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to get KYC link'**
  String get financeErrorKYCLinkFailed;

  /// No description provided for @financeErrorTermsAcceptFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to accept terms of service'**
  String get financeErrorTermsAcceptFailed;

  /// No description provided for @financeErrorUsernameCheckFailed.
  ///
  /// In en, this message translates to:
  /// **'Username check failed'**
  String get financeErrorUsernameCheckFailed;

  /// No description provided for @financeErrorVerificationStatusFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to get customer verification status'**
  String get financeErrorVerificationStatusFailed;

  /// No description provided for @financeErrorCustomerUpdateFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to update customer'**
  String get financeErrorCustomerUpdateFailed;

  /// No description provided for @financeErrorKYCCreateFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to create KYC link'**
  String get financeErrorKYCCreateFailed;

  /// No description provided for @financeErrorKYCStatusFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to get KYC status'**
  String get financeErrorKYCStatusFailed;

  /// No description provided for @financeErrorCustomerDeleteFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to delete customer'**
  String get financeErrorCustomerDeleteFailed;

  /// No description provided for @financeErrorCustomerIDNotFound.
  ///
  /// In en, this message translates to:
  /// **'Customer ID not found. Please login again.'**
  String get financeErrorCustomerIDNotFound;

  /// No description provided for @financeErrorNoCustomerID.
  ///
  /// In en, this message translates to:
  /// **'Customer ID not found'**
  String get financeErrorNoCustomerID;

  /// No description provided for @financeErrorPINVerificationFailed.
  ///
  /// In en, this message translates to:
  /// **'PIN verification'**
  String get financeErrorPINVerificationFailed;

  /// No description provided for @financeErrorInvalidPIN.
  ///
  /// In en, this message translates to:
  /// **'Invalid PIN'**
  String get financeErrorInvalidPIN;

  /// No description provided for @financeErrorWalletCreateFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to create wallet'**
  String get financeErrorWalletCreateFailed;

  /// No description provided for @financeErrorWalletDetailsFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load wallet details'**
  String get financeErrorWalletDetailsFailed;

  /// No description provided for @financeErrorWalletLoadFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load wallets'**
  String get financeErrorWalletLoadFailed;

  /// No description provided for @financeErrorTransferFailed.
  ///
  /// In en, this message translates to:
  /// **'Transfer failed'**
  String get financeErrorTransferFailed;

  /// No description provided for @financeErrorExternalTransferFailed.
  ///
  /// In en, this message translates to:
  /// **'External transfer failed'**
  String get financeErrorExternalTransferFailed;

  /// No description provided for @financeErrorNoTransferHistory.
  ///
  /// In en, this message translates to:
  /// **'No transfer history found'**
  String get financeErrorNoTransferHistory;

  /// No description provided for @financeErrorDepositFailed.
  ///
  /// In en, this message translates to:
  /// **'Deposit failed'**
  String get financeErrorDepositFailed;

  /// No description provided for @financeErrorCustomerIDRequired.
  ///
  /// In en, this message translates to:
  /// **'Customer ID is required'**
  String get financeErrorCustomerIDRequired;

  /// No description provided for @financeErrorCustomerIDRequiredDeposit.
  ///
  /// In en, this message translates to:
  /// **'Customer ID is required for deposit'**
  String get financeErrorCustomerIDRequiredDeposit;

  /// No description provided for @financeErrorNetworkUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Network connection unavailable. Please check your internet connection.'**
  String get financeErrorNetworkUnavailable;

  /// No description provided for @financeErrorInstitutionBalanceFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to get institution balance'**
  String get financeErrorInstitutionBalanceFailed;

  /// No description provided for @financeErrorCardTypesFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to get card types'**
  String get financeErrorCardTypesFailed;

  /// No description provided for @financeErrorExchangeRatesFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to get exchange rates'**
  String get financeErrorExchangeRatesFailed;

  /// No description provided for @financeErrorCurrencyEstimationFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to calculate currency estimation'**
  String get financeErrorCurrencyEstimationFailed;

  /// No description provided for @financeErrorCryptoEstimationFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to calculate crypto estimation'**
  String get financeErrorCryptoEstimationFailed;

  /// No description provided for @financeErrorKYCSubmitFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to submit KYC'**
  String get financeErrorKYCSubmitFailed;

  /// No description provided for @financeErrorCardCreateFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to create card'**
  String get financeErrorCardCreateFailed;

  /// No description provided for @financeErrorCardBalanceFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to get card balance'**
  String get financeErrorCardBalanceFailed;

  /// No description provided for @financeErrorTransactionHistoryFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to get transaction history'**
  String get financeErrorTransactionHistoryFailed;

  /// No description provided for @financeErrorDepositUSDTFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to deposit USDT'**
  String get financeErrorDepositUSDTFailed;

  /// No description provided for @financeErrorDepositCryptoFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to deposit crypto'**
  String get financeErrorDepositCryptoFailed;

  /// No description provided for @financeErrorDepositFiatFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to deposit fiat amount'**
  String get financeErrorDepositFiatFailed;

  /// No description provided for @financeErrorDepositStatusFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to get deposit status'**
  String get financeErrorDepositStatusFailed;

  /// No description provided for @financeErrorDepositTransactionsFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to get deposit transactions'**
  String get financeErrorDepositTransactionsFailed;

  /// No description provided for @financeSecurityPINSetSuccess.
  ///
  /// In en, this message translates to:
  /// **'PIN set successfully'**
  String get financeSecurityPINSetSuccess;

  /// No description provided for @financeSecurityPINResetSuccess.
  ///
  /// In en, this message translates to:
  /// **'PIN reset successfully'**
  String get financeSecurityPINResetSuccess;

  /// No description provided for @financeSecurityCustomerIDNotFound.
  ///
  /// In en, this message translates to:
  /// **'Customer ID not found. Please login again.'**
  String get financeSecurityCustomerIDNotFound;

  /// No description provided for @financeSecurityPINVerificationCompleted.
  ///
  /// In en, this message translates to:
  /// **'PIN verification'**
  String get financeSecurityPINVerificationCompleted;

  /// No description provided for @financeSecurityPINVerificationFailed.
  ///
  /// In en, this message translates to:
  /// **'PIN verification'**
  String get financeSecurityPINVerificationFailed;

  /// No description provided for @financeSecurityOTPSentSuccess.
  ///
  /// In en, this message translates to:
  /// **'OTP sent successfully'**
  String get financeSecurityOTPSentSuccess;

  /// No description provided for @financeSecurityOTPVerifiedSuccess.
  ///
  /// In en, this message translates to:
  /// **'OTP verified successfully'**
  String get financeSecurityOTPVerifiedSuccess;

  /// No description provided for @financeSecurityTokenGeneratedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Token generated successfully'**
  String get financeSecurityTokenGeneratedSuccess;

  /// No description provided for @financeSecurityTokenGenerationFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to generate token'**
  String get financeSecurityTokenGenerationFailed;

  /// No description provided for @financeSecurityRequestTimeout.
  ///
  /// In en, this message translates to:
  /// **'Request timed out - please check your network connection'**
  String get financeSecurityRequestTimeout;

  /// No description provided for @financeSecurityNetworkError.
  ///
  /// In en, this message translates to:
  /// **'Network error - unable to connect to server'**
  String get financeSecurityNetworkError;

  /// No description provided for @financeSecurityNoTokenFound.
  ///
  /// In en, this message translates to:
  /// **'No security token found. Please generate token first.'**
  String get financeSecurityNoTokenFound;

  /// No description provided for @financeSecurityCSRFRetrievedSuccess.
  ///
  /// In en, this message translates to:
  /// **'CSRF token retrieved successfully'**
  String get financeSecurityCSRFRetrievedSuccess;

  /// No description provided for @financeSecurityCSRFRetrievalFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to get CSRF token'**
  String get financeSecurityCSRFRetrievalFailed;

  /// No description provided for @financeSecurityJWTExpiredRefreshFailed.
  ///
  /// In en, this message translates to:
  /// **'JWT token expired and refresh failed'**
  String get financeSecurityJWTExpiredRefreshFailed;

  /// No description provided for @financeSecurityMissingJWTToken.
  ///
  /// In en, this message translates to:
  /// **'Missing JWT token. Please generate security token first.'**
  String get financeSecurityMissingJWTToken;

  /// No description provided for @financeSecuritySignatureGeneratedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Signature generated successfully'**
  String get financeSecuritySignatureGeneratedSuccess;

  /// No description provided for @financeErrorServiceUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Service temporarily unavailable. Please try again.'**
  String get financeErrorServiceUnavailable;

  /// No description provided for @financeErrorInvalidRequest.
  ///
  /// In en, this message translates to:
  /// **'Invalid request. Please check your information and try again.'**
  String get financeErrorInvalidRequest;

  /// No description provided for @financeUnknownError.
  ///
  /// In en, this message translates to:
  /// **'An unknown error occurred'**
  String get financeUnknownError;

  /// No description provided for @financeErrorAuthenticationFailed.
  ///
  /// In en, this message translates to:
  /// **'Authentication failed. Please login again.'**
  String get financeErrorAuthenticationFailed;

  /// No description provided for @financeErrorAccessDenied.
  ///
  /// In en, this message translates to:
  /// **'Access denied. Please contact support.'**
  String get financeErrorAccessDenied;

  /// No description provided for @financeErrorToSLinkFailed.
  ///
  /// In en, this message translates to:
  /// **'Unable to generate terms of service link. Please try again.'**
  String get financeErrorToSLinkFailed;

  /// No description provided for @financeErrorToSError.
  ///
  /// In en, this message translates to:
  /// **'Terms of Service Error'**
  String get financeErrorToSError;

  /// No description provided for @financeLoadingToS.
  ///
  /// In en, this message translates to:
  /// **'Loading Terms of Service...'**
  String get financeLoadingToS;

  /// No description provided for @financeVerification.
  ///
  /// In en, this message translates to:
  /// **'Verification'**
  String get financeVerification;

  /// No description provided for @financeLoadingKycVerification.
  ///
  /// In en, this message translates to:
  /// **'Loading KYC Verification...'**
  String get financeLoadingKycVerification;

  /// No description provided for @financeCompleted.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get financeCompleted;

  /// No description provided for @financeSubmitted.
  ///
  /// In en, this message translates to:
  /// **'Submitted'**
  String get financeSubmitted;

  /// No description provided for @financeInReview.
  ///
  /// In en, this message translates to:
  /// **'In Review'**
  String get financeInReview;

  /// No description provided for @financeReceived.
  ///
  /// In en, this message translates to:
  /// **'Received'**
  String get financeReceived;

  /// No description provided for @financeScheduled.
  ///
  /// In en, this message translates to:
  /// **'Scheduled'**
  String get financeScheduled;

  /// No description provided for @financeAwaiting.
  ///
  /// In en, this message translates to:
  /// **'Awaiting'**
  String get financeAwaiting;

  /// No description provided for @financeFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed'**
  String get financeFailed;

  /// No description provided for @financeReturned.
  ///
  /// In en, this message translates to:
  /// **'Returned'**
  String get financeReturned;

  /// No description provided for @financeRefunded.
  ///
  /// In en, this message translates to:
  /// **'Refunded'**
  String get financeRefunded;

  /// No description provided for @financeCanceled.
  ///
  /// In en, this message translates to:
  /// **'Canceled'**
  String get financeCanceled;

  /// No description provided for @financeUnknown.
  ///
  /// In en, this message translates to:
  /// **'Unknown'**
  String get financeUnknown;

  /// No description provided for @financeTransactionInfo.
  ///
  /// In en, this message translates to:
  /// **'Transaction Info'**
  String get financeTransactionInfo;

  /// No description provided for @financeType.
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get financeType;

  /// No description provided for @financeReceipt.
  ///
  /// In en, this message translates to:
  /// **'Receipt'**
  String get financeReceipt;

  /// No description provided for @financeInitialAmount.
  ///
  /// In en, this message translates to:
  /// **'Initial Amount'**
  String get financeInitialAmount;

  /// No description provided for @financeFinalAmount.
  ///
  /// In en, this message translates to:
  /// **'Final Amount'**
  String get financeFinalAmount;

  /// No description provided for @financeSource.
  ///
  /// In en, this message translates to:
  /// **'Source'**
  String get financeSource;

  /// No description provided for @financeSender.
  ///
  /// In en, this message translates to:
  /// **'Sender'**
  String get financeSender;

  /// No description provided for @financeBlockchain.
  ///
  /// In en, this message translates to:
  /// **'Blockchain'**
  String get financeBlockchain;

  /// No description provided for @financeTxHash.
  ///
  /// In en, this message translates to:
  /// **'Tx Hash'**
  String get financeTxHash;

  /// No description provided for @financeTransactionDetails.
  ///
  /// In en, this message translates to:
  /// **'Transaction Details'**
  String get financeTransactionDetails;

  /// No description provided for @financeStreetAddressRequired.
  ///
  /// In en, this message translates to:
  /// **'Street address is required'**
  String get financeStreetAddressRequired;

  /// No description provided for @financeCityRequired.
  ///
  /// In en, this message translates to:
  /// **'City is required'**
  String get financeCityRequired;

  /// No description provided for @financePleaseSelectCountry.
  ///
  /// In en, this message translates to:
  /// **'Please select a country'**
  String get financePleaseSelectCountry;

  /// No description provided for @financeStateRequired.
  ///
  /// In en, this message translates to:
  /// **'State is required'**
  String get financeStateRequired;

  /// No description provided for @financePleaseSelectCountryFirst.
  ///
  /// In en, this message translates to:
  /// **'Please select a country first'**
  String get financePleaseSelectCountryFirst;

  /// No description provided for @financeRequirementAddressOfIncorporation.
  ///
  /// In en, this message translates to:
  /// **'(business) registered_address has not been provided'**
  String get financeRequirementAddressOfIncorporation;

  /// No description provided for @financeRequirementAddressOfOperation.
  ///
  /// In en, this message translates to:
  /// **'(business) physical_address has not been provided'**
  String get financeRequirementAddressOfOperation;

  /// No description provided for @financeRequirementAddressOfResidence.
  ///
  /// In en, this message translates to:
  /// **'(individual, associated person) physical_address has not been provided'**
  String get financeRequirementAddressOfResidence;

  /// No description provided for @financeRequirementBusinessDescription.
  ///
  /// In en, this message translates to:
  /// **'(business) business_description has not been provided'**
  String get financeRequirementBusinessDescription;

  /// No description provided for @financeRequirementBusinessFormationDocument.
  ///
  /// In en, this message translates to:
  /// **'(business) no document including business_formation as a purpose has been provided'**
  String get financeRequirementBusinessFormationDocument;

  /// No description provided for @financeRequirementBusinessIndustry.
  ///
  /// In en, this message translates to:
  /// **'(business) business_industry has not been provided'**
  String get financeRequirementBusinessIndustry;

  /// No description provided for @financeRequirementBusinessName.
  ///
  /// In en, this message translates to:
  /// **'(business) business_legal_name has not been provided'**
  String get financeRequirementBusinessName;

  /// No description provided for @financeRequirementBusinessOwnershipDocument.
  ///
  /// In en, this message translates to:
  /// **'(business) no document including ownership_information as a purpose has been provided'**
  String get financeRequirementBusinessOwnershipDocument;

  /// No description provided for @financeRequirementBusinessWebsite.
  ///
  /// In en, this message translates to:
  /// **'(business) primary_website has not been provided'**
  String get financeRequirementBusinessWebsite;

  /// No description provided for @financeRequirementControlPerson.
  ///
  /// In en, this message translates to:
  /// **'(business) no one in associated_persons has has_control set to true'**
  String get financeRequirementControlPerson;

  /// No description provided for @financeRequirementDateOfBirth.
  ///
  /// In en, this message translates to:
  /// **'(individual, associated person) birth_date has not been provided'**
  String get financeRequirementDateOfBirth;

  /// No description provided for @financeRequirementEmailAddress.
  ///
  /// In en, this message translates to:
  /// **'email has not been provided'**
  String get financeRequirementEmailAddress;

  /// No description provided for @financeRequirementFirstName.
  ///
  /// In en, this message translates to:
  /// **'(individual, associated person) first_name has not been provided'**
  String get financeRequirementFirstName;

  /// No description provided for @financeRequirementHasBase.
  ///
  /// In en, this message translates to:
  /// **'indicates that another endorsement needs to be approved to unblock the current one'**
  String get financeRequirementHasBase;

  /// No description provided for @financeRequirementHasSepa.
  ///
  /// In en, this message translates to:
  /// **'indicates that another endorsement needs to be approved to unblock the current one'**
  String get financeRequirementHasSepa;

  /// No description provided for @financeRequirementIsDao.
  ///
  /// In en, this message translates to:
  /// **'(business) is_dao has not been provided'**
  String get financeRequirementIsDao;

  /// No description provided for @financeRequirementLastName.
  ///
  /// In en, this message translates to:
  /// **'(individual, associated person) last-name has not been provided'**
  String get financeRequirementLastName;

  /// No description provided for @financeRequirementMinAge18.
  ///
  /// In en, this message translates to:
  /// **'(individual, associated person) have not been able to confirm a person meets age requirements'**
  String get financeRequirementMinAge18;

  /// No description provided for @financeRequirementMinAge60.
  ///
  /// In en, this message translates to:
  /// **'(individual, associated person) have not been able to confirm a person meets age requirements'**
  String get financeRequirementMinAge60;

  /// No description provided for @financeRequirementMinimalSourceOfFundsData.
  ///
  /// In en, this message translates to:
  /// **'(business) account_purpose and source_of_funds have not been supplied'**
  String get financeRequirementMinimalSourceOfFundsData;

  /// No description provided for @financeRequirementOwnershipStructureAttestation.
  ///
  /// In en, this message translates to:
  /// **'(business) no one in associated_persons has provided attested_ownership_structure_at'**
  String get financeRequirementOwnershipStructureAttestation;

  /// No description provided for @financeRequirementPersonaSanctionsScreen.
  ///
  /// In en, this message translates to:
  /// **'sanctions screening has not been performed'**
  String get financeRequirementPersonaSanctionsScreen;

  /// No description provided for @financeRequirementProofOfAddressDocument.
  ///
  /// In en, this message translates to:
  /// **'(business) no document including proof_of_address as a purpose has been provided'**
  String get financeRequirementProofOfAddressDocument;

  /// No description provided for @financeRequirementProofOfNatureOfBusinessDocument.
  ///
  /// In en, this message translates to:
  /// **'(business) no document including proof_of_nature_of_business as a purpose has been provided'**
  String get financeRequirementProofOfNatureOfBusinessDocument;

  /// No description provided for @financeRequirementProofOfNatureOfBusinessDocumentInPersona.
  ///
  /// In en, this message translates to:
  /// **'(business) no document including proof_of_nature_of_business as a purpose has been provided'**
  String get financeRequirementProofOfNatureOfBusinessDocumentInPersona;

  /// No description provided for @financeRequirementSourceOfFundsQuestionnaire.
  ///
  /// In en, this message translates to:
  /// **'customer has been flagged as requiring SoF but has not submitted the full questionnaire'**
  String get financeRequirementSourceOfFundsQuestionnaire;

  /// No description provided for @financeRequirementSubdivisionNotAkUsa.
  ///
  /// In en, this message translates to:
  /// **'have not been able to confirm the location of the customer'**
  String get financeRequirementSubdivisionNotAkUsa;

  /// No description provided for @financeRequirementSubdivisionNotNyUsa.
  ///
  /// In en, this message translates to:
  /// **'have not been able to confirm the location of the customer'**
  String get financeRequirementSubdivisionNotNyUsa;

  /// No description provided for @financeRequirementTaxIdentificationNumber.
  ///
  /// In en, this message translates to:
  /// **'no tax identification number suitable for the country of residence/operation has been provided'**
  String get financeRequirementTaxIdentificationNumber;

  /// No description provided for @financeRequirementTermsOfServiceV1.
  ///
  /// In en, this message translates to:
  /// **'customer has not accepted the minimum required version of Bridge\'s terms of service'**
  String get financeRequirementTermsOfServiceV1;

  /// No description provided for @financeRequirementTermsOfServiceV2.
  ///
  /// In en, this message translates to:
  /// **'customer has not accepted the minimum required version of Bridge\'s terms of service'**
  String get financeRequirementTermsOfServiceV2;

  /// No description provided for @financeIssueBeneficialOwnerTooYoung.
  ///
  /// In en, this message translates to:
  /// **'individual is under the minimum required age (18 years old)'**
  String get financeIssueBeneficialOwnerTooYoung;

  /// No description provided for @financeIssueCustomerTooYoung.
  ///
  /// In en, this message translates to:
  /// **'individual is under the minimum required age (18 years old)'**
  String get financeIssueCustomerTooYoung;

  /// No description provided for @financeIssueBeneficialOwnerOverAge.
  ///
  /// In en, this message translates to:
  /// **'individual exceeds maximum age'**
  String get financeIssueBeneficialOwnerOverAge;

  /// No description provided for @financeIssueCustomerOverAge.
  ///
  /// In en, this message translates to:
  /// **'individual exceeds maximum age'**
  String get financeIssueCustomerOverAge;

  /// No description provided for @financeIssueDeveloperNotCompatible.
  ///
  /// In en, this message translates to:
  /// **'developer account is not compatible with the endorsement'**
  String get financeIssueDeveloperNotCompatible;

  /// No description provided for @financeIssueCustomerNotCompatible.
  ///
  /// In en, this message translates to:
  /// **'customer profile is not compatible with requirements'**
  String get financeIssueCustomerNotCompatible;

  /// No description provided for @financeIssueTaxIdentificationNumberNotCompatible.
  ///
  /// In en, this message translates to:
  /// **'the format of the TIN did not pass validation'**
  String get financeIssueTaxIdentificationNumberNotCompatible;

  /// No description provided for @financeIssueEndorsementNotAvailableInCustomersRegion.
  ///
  /// In en, this message translates to:
  /// **'endorsement not available in customer\'s geographic region'**
  String get financeIssueEndorsementNotAvailableInCustomersRegion;

  /// No description provided for @financeIssueResidenceAddressInvalidCity.
  ///
  /// In en, this message translates to:
  /// **'Residence address city is invalid'**
  String get financeIssueResidenceAddressInvalidCity;

  /// No description provided for @financeIssueResidenceAddressInvalidAddressLine1.
  ///
  /// In en, this message translates to:
  /// **'Residence address line 1 is invalid'**
  String get financeIssueResidenceAddressInvalidAddressLine1;

  /// No description provided for @financeIssueResidenceAddressInvalidAddressLine2.
  ///
  /// In en, this message translates to:
  /// **'Residence address line 2 is invalid'**
  String get financeIssueResidenceAddressInvalidAddressLine2;

  /// No description provided for @financeIssueResidenceAddressInvalidPostalCode.
  ///
  /// In en, this message translates to:
  /// **'Residence address postal code is invalid'**
  String get financeIssueResidenceAddressInvalidPostalCode;

  /// No description provided for @financeIssueResidenceAddressInvalidSubdivisionCode.
  ///
  /// In en, this message translates to:
  /// **'Residence address subdivision code is invalid'**
  String get financeIssueResidenceAddressInvalidSubdivisionCode;

  /// No description provided for @financeIssueAdverseMediaReportMatch.
  ///
  /// In en, this message translates to:
  /// **'potential adverse media match found; customer will need a manual review'**
  String get financeIssueAdverseMediaReportMatch;

  /// No description provided for @financeIssueWatchlistReportMatch.
  ///
  /// In en, this message translates to:
  /// **'potential sanctions watchlist match found; customer will need a manual review'**
  String get financeIssueWatchlistReportMatch;

  /// No description provided for @financeIssueBusinessFormationDocumentVerificationFailed.
  ///
  /// In en, this message translates to:
  /// **'Business formation document verification failed'**
  String get financeIssueBusinessFormationDocumentVerificationFailed;

  /// No description provided for @financeIssueBusinessOwnershipDocumentVerificationFailed.
  ///
  /// In en, this message translates to:
  /// **'Business ownership document verification failed'**
  String get financeIssueBusinessOwnershipDocumentVerificationFailed;

  /// No description provided for @financeIssueGovernmentIdVerificationFailed.
  ///
  /// In en, this message translates to:
  /// **'government ID verification failed'**
  String get financeIssueGovernmentIdVerificationFailed;

  /// No description provided for @financeIssueFundsSourcedPensionOrRetirement.
  ///
  /// In en, this message translates to:
  /// **'funds sourced from pension/retirement (flagged)'**
  String get financeIssueFundsSourcedPensionOrRetirement;

  /// No description provided for @financeIssueHighExpectedMonthlyPayments.
  ///
  /// In en, this message translates to:
  /// **'high expected monthly payments (flagged)'**
  String get financeIssueHighExpectedMonthlyPayments;

  /// No description provided for @financeIssueHighRiskBusinessActivities.
  ///
  /// In en, this message translates to:
  /// **'customer engages in high-risk business activities'**
  String get financeIssueHighRiskBusinessActivities;

  /// No description provided for @financeIssueOperatesInProhibitedCountries.
  ///
  /// In en, this message translates to:
  /// **'customer operates in prohibited countries'**
  String get financeIssueOperatesInProhibitedCountries;

  /// No description provided for @financeIssuePoaInvalidDocumentType.
  ///
  /// In en, this message translates to:
  /// **'Proof of Address document type is not accepted'**
  String get financeIssuePoaInvalidDocumentType;

  /// No description provided for @financeIssuePoaManipulated.
  ///
  /// In en, this message translates to:
  /// **'Proof of Address document appears to be manipulated'**
  String get financeIssuePoaManipulated;

  /// No description provided for @financeIssuePoaNameMismatch.
  ///
  /// In en, this message translates to:
  /// **'Proof of Address document name doesn\'t match customer name'**
  String get financeIssuePoaNameMismatch;

  /// No description provided for @financeIssuePoaPast90Days.
  ///
  /// In en, this message translates to:
  /// **'Proof of Address document is older than 90 days'**
  String get financeIssuePoaPast90Days;

  /// No description provided for @financeIssuePoaVirtualOrPoBox.
  ///
  /// In en, this message translates to:
  /// **'proof of Address is a virtual address or PO Box (not allowed)'**
  String get financeIssuePoaVirtualOrPoBox;

  /// No description provided for @financeIssueProofOfNatureOfBusinessDocumentVerificationFailed.
  ///
  /// In en, this message translates to:
  /// **'Proof of nature of business document verification failed'**
  String get financeIssueProofOfNatureOfBusinessDocumentVerificationFailed;

  /// No description provided for @financeIssueSuspiciousPrimaryPurpose.
  ///
  /// In en, this message translates to:
  /// **'primary purpose appears suspicious'**
  String get financeIssueSuspiciousPrimaryPurpose;

  /// No description provided for @financeIssueSuspiciousSourceOfFunds.
  ///
  /// In en, this message translates to:
  /// **'source of funds appears suspicious'**
  String get financeIssueSuspiciousSourceOfFunds;

  /// No description provided for @financeIssueUnemployedUsingSalary.
  ///
  /// In en, this message translates to:
  /// **'unemployed person claiming salary income (flagged)'**
  String get financeIssueUnemployedUsingSalary;

  /// No description provided for @financeIssueBusinessLookupNoMatch.
  ///
  /// In en, this message translates to:
  /// **'found no matches in the business registry; customer will need a manual review'**
  String get financeIssueBusinessLookupNoMatch;

  /// No description provided for @financeIssueBusinessRegistryNoMatch.
  ///
  /// In en, this message translates to:
  /// **'found no matches in the business registry; customer will need a manual review'**
  String get financeIssueBusinessRegistryNoMatch;

  /// No description provided for @financeIssueBusinessEinNoMatch.
  ///
  /// In en, this message translates to:
  /// **'EIN validation failed'**
  String get financeIssueBusinessEinNoMatch;

  /// No description provided for @financeIssueBusinessWebsiteFailure.
  ///
  /// In en, this message translates to:
  /// **'validation of the provided website failed; customer will need a manual review'**
  String get financeIssueBusinessWebsiteFailure;

  /// No description provided for @financeIssueDatabaseCheckFailedOnNameLast.
  ///
  /// In en, this message translates to:
  /// **'database check failed on last name'**
  String get financeIssueDatabaseCheckFailedOnNameLast;

  /// No description provided for @financeIssueDatabaseCheckFailedOnSocialSecurityNumber.
  ///
  /// In en, this message translates to:
  /// **'database check failed on SSN'**
  String get financeIssueDatabaseCheckFailedOnSocialSecurityNumber;

  /// No description provided for @financeIssueDatabaseCheckFailedOnTinValidation.
  ///
  /// In en, this message translates to:
  /// **'database check failed on TIN validation'**
  String get financeIssueDatabaseCheckFailedOnTinValidation;

  /// No description provided for @financeIssueDatabaseCheckFailedOnHouseNumber.
  ///
  /// In en, this message translates to:
  /// **'database check failed on house number'**
  String get financeIssueDatabaseCheckFailedOnHouseNumber;

  /// No description provided for @financeIssueDatabaseCheckFailedOnStreetName.
  ///
  /// In en, this message translates to:
  /// **'database check failed on street name'**
  String get financeIssueDatabaseCheckFailedOnStreetName;

  /// No description provided for @financeIssueDatabaseCheckFailedOnStreetType.
  ///
  /// In en, this message translates to:
  /// **'database check failed on street type'**
  String get financeIssueDatabaseCheckFailedOnStreetType;

  /// No description provided for @financeIssueDatabaseCheckFailedOnCity.
  ///
  /// In en, this message translates to:
  /// **'database check failed on city'**
  String get financeIssueDatabaseCheckFailedOnCity;

  /// No description provided for @financeIssueDatabaseCheckFailedOnPostalCode.
  ///
  /// In en, this message translates to:
  /// **'database check failed on postal code'**
  String get financeIssueDatabaseCheckFailedOnPostalCode;

  /// No description provided for @financeIssueDatabaseCheckFailedOnSubdivision.
  ///
  /// In en, this message translates to:
  /// **'database check failed on subdivision'**
  String get financeIssueDatabaseCheckFailedOnSubdivision;

  /// No description provided for @financeIssueDatabaseCheckFailedOnCountryCode.
  ///
  /// In en, this message translates to:
  /// **'database check failed on country code'**
  String get financeIssueDatabaseCheckFailedOnCountryCode;

  /// No description provided for @financeIssuePoaFailed.
  ///
  /// In en, this message translates to:
  /// **'proof of Address verification failed'**
  String get financeIssuePoaFailed;

  /// No description provided for @financeIssueBlocklistCheckFailed.
  ///
  /// In en, this message translates to:
  /// **'identifying information provided is for a person that Bridge will not support'**
  String get financeIssueBlocklistCheckFailed;

  /// No description provided for @financeIssueManualReviewRejected.
  ///
  /// In en, this message translates to:
  /// **'manual review was rejected'**
  String get financeIssueManualReviewRejected;

  /// No description provided for @financeIssuePendingRfi.
  ///
  /// In en, this message translates to:
  /// **'request for Information (RFI) is pending'**
  String get financeIssuePendingRfi;

  /// No description provided for @financeIssueRejectedDueToUnsupportedGeo.
  ///
  /// In en, this message translates to:
  /// **'rejected due to unsupported geography'**
  String get financeIssueRejectedDueToUnsupportedGeo;

  /// No description provided for @financeIssueRejectedDueToUnsupportedBusinessActivities.
  ///
  /// In en, this message translates to:
  /// **'rejected due to unsupported business activities'**
  String get financeIssueRejectedDueToUnsupportedBusinessActivities;

  /// No description provided for @financeIssueRejectedDueToInaccurateOnboardingDetails.
  ///
  /// In en, this message translates to:
  /// **'rejected due to inaccurate onboarding details'**
  String get financeIssueRejectedDueToInaccurateOnboardingDetails;

  /// No description provided for @financeIssueRejectedDueToUnidentifiableBusinessEntity.
  ///
  /// In en, this message translates to:
  /// **'rejected due to unidentifiable business entity'**
  String get financeIssueRejectedDueToUnidentifiableBusinessEntity;

  /// No description provided for @youAreConnected.
  ///
  /// In en, this message translates to:
  /// **'You are connected!'**
  String get youAreConnected;

  /// No description provided for @youCanNowTalkTo.
  ///
  /// In en, this message translates to:
  /// **'You can now talk to @{contactName}'**
  String youCanNowTalkTo(String contactName);

  /// No description provided for @goChat.
  ///
  /// In en, this message translates to:
  /// **'go chat'**
  String get goChat;

  /// No description provided for @verifyingOtherAccount.
  ///
  /// In en, this message translates to:
  /// **'Verifying the \n other account'**
  String get verifyingOtherAccount;

  /// No description provided for @waitingForContactToAccept.
  ///
  /// In en, this message translates to:
  /// **'Waiting for {contactName} to \n accept the invitation.'**
  String waitingForContactToAccept(String contactName);

  /// No description provided for @noInternetConnection.
  ///
  /// In en, this message translates to:
  /// **'No internet connection!'**
  String get noInternetConnection;

  /// No description provided for @pleaseCheckYourInternetConnection.
  ///
  /// In en, this message translates to:
  /// **'Please check your internet\nconnection'**
  String get pleaseCheckYourInternetConnection;

  /// No description provided for @enableWiFi.
  ///
  /// In en, this message translates to:
  /// **'Enable WiFi'**
  String get enableWiFi;

  /// No description provided for @testingExternalAccountCreationAPI.
  ///
  /// In en, this message translates to:
  /// **'Testing External Account Creation API'**
  String get testingExternalAccountCreationAPI;

  /// No description provided for @payload.
  ///
  /// In en, this message translates to:
  /// **'Payload'**
  String get payload;

  /// No description provided for @responseStatus.
  ///
  /// In en, this message translates to:
  /// **'Response Status'**
  String get responseStatus;

  /// No description provided for @responseHeaders.
  ///
  /// In en, this message translates to:
  /// **'Response Headers'**
  String get responseHeaders;

  /// No description provided for @responseBody.
  ///
  /// In en, this message translates to:
  /// **'Response Body'**
  String get responseBody;

  /// No description provided for @successExternalAccountCreated.
  ///
  /// In en, this message translates to:
  /// **'Success! External account created successfully'**
  String get successExternalAccountCreated;

  /// No description provided for @responseStructure.
  ///
  /// In en, this message translates to:
  /// **'Response structure'**
  String get responseStructure;

  /// No description provided for @errorDetails.
  ///
  /// In en, this message translates to:
  /// **'Error details'**
  String get errorDetails;

  /// No description provided for @rawError.
  ///
  /// In en, this message translates to:
  /// **'Raw error'**
  String get rawError;

  /// No description provided for @exception.
  ///
  /// In en, this message translates to:
  /// **'Exception'**
  String get exception;

  /// No description provided for @testingCustomerVerificationStatus.
  ///
  /// In en, this message translates to:
  /// **'Testing Customer Verification Status'**
  String get testingCustomerVerificationStatus;

  /// No description provided for @customerID.
  ///
  /// In en, this message translates to:
  /// **'Customer ID'**
  String get customerID;

  /// No description provided for @customerFound.
  ///
  /// In en, this message translates to:
  /// **'Customer found'**
  String get customerFound;

  /// No description provided for @hasAcceptedTerms.
  ///
  /// In en, this message translates to:
  /// **'Has accepted terms'**
  String get hasAcceptedTerms;

  /// No description provided for @rejectionReasons.
  ///
  /// In en, this message translates to:
  /// **'Rejection reasons'**
  String get rejectionReasons;

  /// No description provided for @requirementsDue.
  ///
  /// In en, this message translates to:
  /// **'Requirements due'**
  String get requirementsDue;

  /// No description provided for @canCreateExternalAccounts.
  ///
  /// In en, this message translates to:
  /// **'Can create external accounts'**
  String get canCreateExternalAccounts;

  /// No description provided for @issuesPreventingExternalAccountCreation.
  ///
  /// In en, this message translates to:
  /// **'Issues preventing external account creation:'**
  String get issuesPreventingExternalAccountCreation;

  /// No description provided for @termsOfServiceNotAccepted.
  ///
  /// In en, this message translates to:
  /// **'Terms of service not accepted'**
  String get termsOfServiceNotAccepted;

  /// No description provided for @accountHasRejectionReasons.
  ///
  /// In en, this message translates to:
  /// **'Account has rejection reasons'**
  String get accountHasRejectionReasons;

  /// No description provided for @authFixCheckingClient.
  ///
  /// In en, this message translates to:
  /// **'AuthFix: Checking client'**
  String get authFixCheckingClient;

  /// No description provided for @isLogged.
  ///
  /// In en, this message translates to:
  /// **'isLogged'**
  String get isLogged;

  /// No description provided for @userID.
  ///
  /// In en, this message translates to:
  /// **'userID'**
  String get userID;

  /// No description provided for @authFixStoredMatrixId.
  ///
  /// In en, this message translates to:
  /// **'AuthFix: Stored matrix_id'**
  String get authFixStoredMatrixId;

  /// No description provided for @authFixFixingMatrixId.
  ///
  /// In en, this message translates to:
  /// **'AuthFix: Fixing matrix_id from'**
  String get authFixFixingMatrixId;

  /// No description provided for @authFixGeneratingTokens.
  ///
  /// In en, this message translates to:
  /// **'AuthFix: Generating tokens for username'**
  String get authFixGeneratingTokens;

  /// No description provided for @authFixJwtTokenGenerated.
  ///
  /// In en, this message translates to:
  /// **'AuthFix: JWT token generated and stored'**
  String get authFixJwtTokenGenerated;

  /// No description provided for @authFixCsrfTokenGenerated.
  ///
  /// In en, this message translates to:
  /// **'AuthFix: CSRF token generated and refresh initialized'**
  String get authFixCsrfTokenGenerated;

  /// No description provided for @authFixCsrfTokenFailed.
  ///
  /// In en, this message translates to:
  /// **'AuthFix: CSRF token generation failed'**
  String get authFixCsrfTokenFailed;

  /// No description provided for @authFixJwtTokenFailed.
  ///
  /// In en, this message translates to:
  /// **'AuthFix: JWT token generation failed'**
  String get authFixJwtTokenFailed;

  /// No description provided for @authFixMatrixIdCorrect.
  ///
  /// In en, this message translates to:
  /// **'AuthFix: Matrix ID already correct, no fix needed'**
  String get authFixMatrixIdCorrect;

  /// No description provided for @authFixClientNotLoggedIn.
  ///
  /// In en, this message translates to:
  /// **'AuthFix: Client not logged in or no userID'**
  String get authFixClientNotLoggedIn;

  /// No description provided for @authFixException.
  ///
  /// In en, this message translates to:
  /// **'AuthFix: Exception'**
  String get authFixException;

  /// No description provided for @autoEncryptionSetupFailed.
  ///
  /// In en, this message translates to:
  /// **'Auto encryption setup failed'**
  String get autoEncryptionSetupFailed;

  /// No description provided for @autoDeviceVerificationFailed.
  ///
  /// In en, this message translates to:
  /// **'Auto device verification failed'**
  String get autoDeviceVerificationFailed;

  /// No description provided for @autoRoomEncryptionFailed.
  ///
  /// In en, this message translates to:
  /// **'Auto room encryption failed'**
  String get autoRoomEncryptionFailed;

  /// No description provided for @messageSentToRoom.
  ///
  /// In en, this message translates to:
  /// **'Message sent to room'**
  String get messageSentToRoom;

  /// No description provided for @roomNotFound.
  ///
  /// In en, this message translates to:
  /// **'Room not found'**
  String get roomNotFound;

  /// No description provided for @errorSendingMessage.
  ///
  /// In en, this message translates to:
  /// **'Error sending message'**
  String get errorSendingMessage;

  /// No description provided for @messageSentToRoomAlias.
  ///
  /// In en, this message translates to:
  /// **'Message sent to room alias'**
  String get messageSentToRoomAlias;

  /// No description provided for @errorSendingMessageToAlias.
  ///
  /// In en, this message translates to:
  /// **'Error sending message to alias'**
  String get errorSendingMessageToAlias;

  /// No description provided for @directMessageSentTo.
  ///
  /// In en, this message translates to:
  /// **'Direct message sent to'**
  String get directMessageSentTo;

  /// No description provided for @errorSendingDirectMessage.
  ///
  /// In en, this message translates to:
  /// **'Error sending direct message'**
  String get errorSendingDirectMessage;

  /// No description provided for @passwordMinLength.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 6 characters'**
  String get passwordMinLength;

  /// No description provided for @contactSearch.
  ///
  /// In en, this message translates to:
  /// **'Contact Search'**
  String get contactSearch;

  /// No description provided for @noChatsFound.
  ///
  /// In en, this message translates to:
  /// **'No chats found'**
  String get noChatsFound;

  /// No description provided for @emoji.
  ///
  /// In en, this message translates to:
  /// **'Emoji'**
  String get emoji;

  /// No description provided for @contactsAccessRequired.
  ///
  /// In en, this message translates to:
  /// **'Contacts Access Required'**
  String get contactsAccessRequired;

  /// No description provided for @myCard.
  ///
  /// In en, this message translates to:
  /// **'My Card'**
  String get myCard;

  /// No description provided for @favoriteMessage.
  ///
  /// In en, this message translates to:
  /// **'Favorite message'**
  String get favoriteMessage;

  /// No description provided for @messageContentUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Message content unavailable'**
  String get messageContentUnavailable;

  /// No description provided for @storageAccessRequired.
  ///
  /// In en, this message translates to:
  /// **'Storage Access Required'**
  String get storageAccessRequired;

  /// No description provided for @searchFiles.
  ///
  /// In en, this message translates to:
  /// **'Search files'**
  String get searchFiles;

  /// No description provided for @noFilesFound.
  ///
  /// In en, this message translates to:
  /// **'No files found'**
  String get noFilesFound;

  /// No description provided for @refresh.
  ///
  /// In en, this message translates to:
  /// **'Refresh'**
  String get refresh;

  /// No description provided for @sendPhotos.
  ///
  /// In en, this message translates to:
  /// **'Send {count} Photo{plural}'**
  String sendPhotos(int count, String plural);

  /// No description provided for @locationAccessRequired.
  ///
  /// In en, this message translates to:
  /// **'Location Access Required'**
  String get locationAccessRequired;

  /// No description provided for @failedToGetLocation.
  ///
  /// In en, this message translates to:
  /// **'Failed to get location'**
  String get failedToGetLocation;

  /// No description provided for @tapToGetCurrentLocation.
  ///
  /// In en, this message translates to:
  /// **'Tap to get current location'**
  String get tapToGetCurrentLocation;

  /// No description provided for @getLocation.
  ///
  /// In en, this message translates to:
  /// **'Get Location'**
  String get getLocation;

  /// No description provided for @currentLocation.
  ///
  /// In en, this message translates to:
  /// **'Current Location'**
  String get currentLocation;

  /// No description provided for @sendCurrentLocation.
  ///
  /// In en, this message translates to:
  /// **'Send Current Location'**
  String get sendCurrentLocation;

  /// No description provided for @chooseOnMap.
  ///
  /// In en, this message translates to:
  /// **'Choose on Map'**
  String get chooseOnMap;

  /// No description provided for @refreshLocation.
  ///
  /// In en, this message translates to:
  /// **'Refresh Location'**
  String get refreshLocation;

  /// No description provided for @debug.
  ///
  /// In en, this message translates to:
  /// **'Debug'**
  String get debug;

  /// No description provided for @weak.
  ///
  /// In en, this message translates to:
  /// **'Weak'**
  String get weak;

  /// No description provided for @medium.
  ///
  /// In en, this message translates to:
  /// **'Medium'**
  String get medium;

  /// No description provided for @good.
  ///
  /// In en, this message translates to:
  /// **'Good'**
  String get good;

  /// No description provided for @strong.
  ///
  /// In en, this message translates to:
  /// **'Strong'**
  String get strong;

  /// No description provided for @confirmGoBack.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirmGoBack;

  /// No description provided for @goBackProgressLost.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to go back? Your progress will be lost.'**
  String get goBackProgressLost;

  /// No description provided for @createAccount.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get createAccount;

  /// No description provided for @verifyPhone.
  ///
  /// In en, this message translates to:
  /// **'Let\'s verify your phone number.'**
  String get verifyPhone;

  /// No description provided for @isItCorrectOrModify.
  ///
  /// In en, this message translates to:
  /// **'Is it correct, or do you want to modify it?'**
  String get isItCorrectOrModify;

  /// No description provided for @waitingToDetectSms.
  ///
  /// In en, this message translates to:
  /// **'Waiting to automatically detect the SMS sent to'**
  String get waitingToDetectSms;

  /// No description provided for @verificationCode.
  ///
  /// In en, this message translates to:
  /// **'Verification code'**
  String get verificationCode;

  /// No description provided for @resendCode.
  ///
  /// In en, this message translates to:
  /// **'Resend code'**
  String get resendCode;

  /// No description provided for @sendAgain.
  ///
  /// In en, this message translates to:
  /// **'Send again'**
  String get sendAgain;

  /// No description provided for @fullName.
  ///
  /// In en, this message translates to:
  /// **'Full name'**
  String get fullName;

  /// No description provided for @exampleEmail.
  ///
  /// In en, this message translates to:
  /// **'example@mail.com'**
  String get exampleEmail;

  /// No description provided for @continueButton.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueButton;

  /// No description provided for @atLeast6Characters.
  ///
  /// In en, this message translates to:
  /// **'at least 6 characters'**
  String get atLeast6Characters;

  /// No description provided for @backToLogin.
  ///
  /// In en, this message translates to:
  /// **'Back to Login'**
  String get backToLogin;

  /// No description provided for @usernameOrEmailRequired.
  ///
  /// In en, this message translates to:
  /// **'Username or email is required'**
  String get usernameOrEmailRequired;

  /// No description provided for @invalidEmailOrPassword.
  ///
  /// In en, this message translates to:
  /// **'Invalid email or password'**
  String get invalidEmailOrPassword;

  /// No description provided for @invalidUsernameOrPassword.
  ///
  /// In en, this message translates to:
  /// **'Invalid username or password'**
  String get invalidUsernameOrPassword;

  /// No description provided for @emailNotFoundSignUp.
  ///
  /// In en, this message translates to:
  /// **'Email not found. Please check your email or sign up first.'**
  String get emailNotFoundSignUp;

  /// No description provided for @tooManyLoginAttempts.
  ///
  /// In en, this message translates to:
  /// **'Too many login attempts. Please try again later.'**
  String get tooManyLoginAttempts;

  /// No description provided for @serverErrorTryAgain.
  ///
  /// In en, this message translates to:
  /// **'Server error. Please try again later.'**
  String get serverErrorTryAgain;

  /// No description provided for @loginFailed.
  ///
  /// In en, this message translates to:
  /// **'Login failed: {loginError}'**
  String loginFailed(Object loginError);

  /// No description provided for @serverConfigError.
  ///
  /// In en, this message translates to:
  /// **'Server configuration error. Please contact support.'**
  String get serverConfigError;

  /// No description provided for @serverError.
  ///
  /// In en, this message translates to:
  /// **'Server error. Email service may not be configured.'**
  String get serverError;

  /// No description provided for @requestTimeout.
  ///
  /// In en, this message translates to:
  /// **'Request timeout. Please try again.'**
  String get requestTimeout;

  /// No description provided for @emailServiceNotAvailable.
  ///
  /// In en, this message translates to:
  /// **'Email service not available. Please contact support.'**
  String get emailServiceNotAvailable;

  /// No description provided for @serverErrorTryLater.
  ///
  /// In en, this message translates to:
  /// **'Server error. Please try again later.'**
  String get serverErrorTryLater;

  /// No description provided for @passwordIsRequired.
  ///
  /// In en, this message translates to:
  /// **'Password is required'**
  String get passwordIsRequired;

  /// No description provided for @confirmPasswordRequired.
  ///
  /// In en, this message translates to:
  /// **'Confirm password is required'**
  String get confirmPasswordRequired;

  /// No description provided for @emailNotVerified.
  ///
  /// In en, this message translates to:
  /// **'You have not verified your email yet.\\nPlease check your email and click the verification link first.'**
  String get emailNotVerified;

  /// No description provided for @weSentResetLink.
  ///
  /// In en, this message translates to:
  /// **'We sent a reset link to {email}'**
  String weSentResetLink(String email);

  /// No description provided for @verificationWarning.
  ///
  /// In en, this message translates to:
  /// **'Not verified yet. Please click the verification link in your email, then enter your new password below.'**
  String get verificationWarning;

  /// No description provided for @enterNewPassword.
  ///
  /// In en, this message translates to:
  /// **'Enter new password'**
  String get enterNewPassword;

  /// No description provided for @confirmNewPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm new password'**
  String get confirmNewPassword;

  /// No description provided for @connectionError.
  ///
  /// In en, this message translates to:
  /// **'Connection error. Please check your internet connection.'**
  String get connectionError;

  /// No description provided for @enterEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter email'**
  String get enterEmail;

  /// No description provided for @forgotYourPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot your Password?'**
  String get forgotYourPassword;

  /// No description provided for @orLoginWith.
  ///
  /// In en, this message translates to:
  /// **'or Login with'**
  String get orLoginWith;

  /// No description provided for @doYouHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Do you have an account?'**
  String get doYouHaveAccount;

  /// No description provided for @usernameMinLength.
  ///
  /// In en, this message translates to:
  /// **'Username must be at least 3 characters'**
  String get usernameMinLength;

  /// No description provided for @usernameMaxLength.
  ///
  /// In en, this message translates to:
  /// **'Username must be 20 characters or less'**
  String get usernameMaxLength;

  /// No description provided for @usernameInvalidFormat.
  ///
  /// In en, this message translates to:
  /// **'Username can only contain lowercase letters, numbers, underscore (_), and dot (.)'**
  String get usernameInvalidFormat;

  /// No description provided for @usernameCannotStartWith.
  ///
  /// In en, this message translates to:
  /// **'Username cannot start with underscore (_) or dot (.)'**
  String get usernameCannotStartWith;

  /// No description provided for @usernameCannotEndWith.
  ///
  /// In en, this message translates to:
  /// **'Username cannot end with underscore (_) or dot (.)'**
  String get usernameCannotEndWith;

  /// No description provided for @usernameConsecutiveChars.
  ///
  /// In en, this message translates to:
  /// **'Username cannot have consecutive special characters'**
  String get usernameConsecutiveChars;

  /// No description provided for @usernameMustContainLetter.
  ///
  /// In en, this message translates to:
  /// **'Username must contain at least one letter'**
  String get usernameMustContainLetter;

  /// No description provided for @fullNameIsRequired.
  ///
  /// In en, this message translates to:
  /// **'Full name is required'**
  String get fullNameIsRequired;

  /// No description provided for @usernameAlreadyTaken.
  ///
  /// In en, this message translates to:
  /// **'Username Already Taken'**
  String get usernameAlreadyTaken;

  /// No description provided for @usernameAlreadyInUse.
  ///
  /// In en, this message translates to:
  /// **'This username is already in use. Please choose a different username.'**
  String get usernameAlreadyInUse;

  /// No description provided for @emailAlreadyInUse.
  ///
  /// In en, this message translates to:
  /// **'This email is already in use.'**
  String get emailAlreadyInUse;

  /// No description provided for @langEnglish.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get langEnglish;

  /// No description provided for @langSpanish.
  ///
  /// In en, this message translates to:
  /// **'Spanish'**
  String get langSpanish;

  /// No description provided for @countrySpain.
  ///
  /// In en, this message translates to:
  /// **'Spain'**
  String get countrySpain;

  /// No description provided for @countryUS.
  ///
  /// In en, this message translates to:
  /// **'US'**
  String get countryUS;

  /// No description provided for @countryUnitedStates.
  ///
  /// In en, this message translates to:
  /// **'United States'**
  String get countryUnitedStates;

  /// No description provided for @countryFrance.
  ///
  /// In en, this message translates to:
  /// **'France'**
  String get countryFrance;

  /// No description provided for @countryGermany.
  ///
  /// In en, this message translates to:
  /// **'Germany'**
  String get countryGermany;

  /// No description provided for @countryItaly.
  ///
  /// In en, this message translates to:
  /// **'Italy'**
  String get countryItaly;

  /// No description provided for @countryAustralia.
  ///
  /// In en, this message translates to:
  /// **'Australia'**
  String get countryAustralia;

  /// No description provided for @countryBrazil.
  ///
  /// In en, this message translates to:
  /// **'Brazil'**
  String get countryBrazil;

  /// No description provided for @enterText.
  ///
  /// In en, this message translates to:
  /// **'Enter text'**
  String get enterText;

  /// No description provided for @recordingFailed.
  ///
  /// In en, this message translates to:
  /// **'Recording failed!'**
  String get recordingFailed;

  /// No description provided for @rememberMe.
  ///
  /// In en, this message translates to:
  /// **'Remember me'**
  String get rememberMe;

  /// No description provided for @otpVerificationFailed.
  ///
  /// In en, this message translates to:
  /// **'OTP verification failed'**
  String get otpVerificationFailed;

  /// No description provided for @customerNotFound.
  ///
  /// In en, this message translates to:
  /// **'Customer not found'**
  String get customerNotFound;

  /// No description provided for @failedToGetCustomerStatus.
  ///
  /// In en, this message translates to:
  /// **'Failed to get customer status'**
  String get failedToGetCustomerStatus;

  /// No description provided for @failedToGetCustomerStatusAfterCsrfRefresh.
  ///
  /// In en, this message translates to:
  /// **'Failed to get customer status after CSRF refresh'**
  String get failedToGetCustomerStatusAfterCsrfRefresh;

  /// No description provided for @failedToUpdateCustomer.
  ///
  /// In en, this message translates to:
  /// **'Failed to update customer'**
  String get failedToUpdateCustomer;

  /// No description provided for @failedToCreateKycLink.
  ///
  /// In en, this message translates to:
  /// **'Failed to create KYC link'**
  String get failedToCreateKycLink;

  /// No description provided for @failedToGetKycStatus.
  ///
  /// In en, this message translates to:
  /// **'Failed to get KYC status'**
  String get failedToGetKycStatus;

  /// No description provided for @usernameCheckFailed.
  ///
  /// In en, this message translates to:
  /// **'Username check failed'**
  String get usernameCheckFailed;

  /// No description provided for @failedToRegisterCustomerAfterRetries.
  ///
  /// In en, this message translates to:
  /// **'Failed to register customer after all retry attempts'**
  String get failedToRegisterCustomerAfterRetries;

  /// No description provided for @failedToVerifyOtpAfterRetries.
  ///
  /// In en, this message translates to:
  /// **'Failed to verify OTP after all retry attempts'**
  String get failedToVerifyOtpAfterRetries;

  /// No description provided for @fullNameRequired.
  ///
  /// In en, this message translates to:
  /// **'Full name is required'**
  String get fullNameRequired;

  /// No description provided for @usernameRequired.
  ///
  /// In en, this message translates to:
  /// **'Username is required'**
  String get usernameRequired;

  /// No description provided for @usernameCannotContainSpaces.
  ///
  /// In en, this message translates to:
  /// **'Username cannot contain spaces'**
  String get usernameCannotContainSpaces;

  /// Title for API error snackbar
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get apiErrorTitle;

  /// Default error message when no specific message is provided
  ///
  /// In en, this message translates to:
  /// **'An error occurred'**
  String get apiErrorDefaultMessage;

  /// Default message for invalid field errors
  ///
  /// In en, this message translates to:
  /// **'Invalid field'**
  String get apiErrorInvalidField;

  /// No description provided for @financeKYCAgeRestrictionError.
  ///
  /// In en, this message translates to:
  /// **'You must be at least 18 years old to register'**
  String get financeKYCAgeRestrictionError;

  /// No description provided for @financeKYCDocumentUpload.
  ///
  /// In en, this message translates to:
  /// **'Upload image'**
  String get financeKYCDocumentUpload;

  /// No description provided for @financeKYCPreviousButton.
  ///
  /// In en, this message translates to:
  /// **'Previous'**
  String get financeKYCPreviousButton;

  /// No description provided for @financeKYCCancelButton.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get financeKYCCancelButton;

  /// No description provided for @financeKYCNextButton.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get financeKYCNextButton;

  /// No description provided for @financeKYCSubmitButton.
  ///
  /// In en, this message translates to:
  /// **'Submit KYC'**
  String get financeKYCSubmitButton;

  /// No description provided for @financeKYCPersonalInfoStep.
  ///
  /// In en, this message translates to:
  /// **'Personal Info'**
  String get financeKYCPersonalInfoStep;

  /// No description provided for @financeKYCAddressStep.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get financeKYCAddressStep;

  /// No description provided for @financeKYCDocumentStep.
  ///
  /// In en, this message translates to:
  /// **'Document'**
  String get financeKYCDocumentStep;

  /// No description provided for @financeKYCReviewStep.
  ///
  /// In en, this message translates to:
  /// **'Review'**
  String get financeKYCReviewStep;

  /// No description provided for @financeKYCFrontDocument.
  ///
  /// In en, this message translates to:
  /// **'Front of Document'**
  String get financeKYCFrontDocument;

  /// No description provided for @financeKYCBackDocument.
  ///
  /// In en, this message translates to:
  /// **'Back of Document'**
  String get financeKYCBackDocument;

  /// No description provided for @financeKYCSelfieWithDocument.
  ///
  /// In en, this message translates to:
  /// **'Selfie with Document'**
  String get financeKYCSelfieWithDocument;

  /// No description provided for @financeKYCErrorTitle.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get financeKYCErrorTitle;

  /// No description provided for @financeKYCProcessingMessage.
  ///
  /// In en, this message translates to:
  /// **'Your KYC submission is being processed. We\'ll notify you once it\'s complete.'**
  String get financeKYCProcessingMessage;

  /// No description provided for @financeKYCDocumentsReceived.
  ///
  /// In en, this message translates to:
  /// **'Documents Received'**
  String get financeKYCDocumentsReceived;

  /// No description provided for @financeKYCUnderReviewStatus.
  ///
  /// In en, this message translates to:
  /// **'Under Review'**
  String get financeKYCUnderReviewStatus;

  /// No description provided for @financeKYCApprovalPending.
  ///
  /// In en, this message translates to:
  /// **'Approval Pending'**
  String get financeKYCApprovalPending;

  /// No description provided for @createStory.
  ///
  /// In en, this message translates to:
  /// **'Create Story'**
  String get createStory;

  /// No description provided for @text.
  ///
  /// In en, this message translates to:
  /// **'Text'**
  String get text;

  /// No description provided for @photo.
  ///
  /// In en, this message translates to:
  /// **'Photo'**
  String get photo;

  /// No description provided for @video.
  ///
  /// In en, this message translates to:
  /// **'Video'**
  String get video;

  /// No description provided for @typeYourStory.
  ///
  /// In en, this message translates to:
  /// **'Type your story...'**
  String get typeYourStory;

  /// No description provided for @videoSelected.
  ///
  /// In en, this message translates to:
  /// **'Video Selected'**
  String get videoSelected;

  /// No description provided for @tapToSelectPhoto.
  ///
  /// In en, this message translates to:
  /// **'Tap to select photo'**
  String get tapToSelectPhoto;

  /// No description provided for @tapToSelectVideo.
  ///
  /// In en, this message translates to:
  /// **'Tap to select video'**
  String get tapToSelectVideo;

  /// No description provided for @storyCreatedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Story created successfully!'**
  String get storyCreatedSuccessfully;

  /// No description provided for @pleaseEnterSomeText.
  ///
  /// In en, this message translates to:
  /// **'Please enter some text'**
  String get pleaseEnterSomeText;

  /// No description provided for @pleaseSelectAPhoto.
  ///
  /// In en, this message translates to:
  /// **'Please select a photo'**
  String get pleaseSelectAPhoto;

  /// No description provided for @pleaseSelectAVideo.
  ///
  /// In en, this message translates to:
  /// **'Please select a video'**
  String get pleaseSelectAVideo;

  /// No description provided for @errorPickingMedia.
  ///
  /// In en, this message translates to:
  /// **'Error picking media: {error}'**
  String errorPickingMedia(String error);

  /// No description provided for @errorCreatingStory.
  ///
  /// In en, this message translates to:
  /// **'Error creating story: {error}'**
  String errorCreatingStory(String error);

  /// No description provided for @storyViews.
  ///
  /// In en, this message translates to:
  /// **'Story Views'**
  String get storyViews;

  /// No description provided for @views.
  ///
  /// In en, this message translates to:
  /// **'{count} views'**
  String views(int count);

  /// No description provided for @noViewsYet.
  ///
  /// In en, this message translates to:
  /// **'No views yet'**
  String get noViewsYet;

  /// No description provided for @videoStory.
  ///
  /// In en, this message translates to:
  /// **'Video Story'**
  String get videoStory;

  /// No description provided for @justNow.
  ///
  /// In en, this message translates to:
  /// **'Just now'**
  String get justNow;

  /// No description provided for @minutesAgo.
  ///
  /// In en, this message translates to:
  /// **'{minutes}m ago'**
  String minutesAgo(int minutes);

  /// No description provided for @hoursAgo.
  ///
  /// In en, this message translates to:
  /// **'{hours}h ago'**
  String hoursAgo(int hours);

  /// No description provided for @couldNotOpenFile.
  ///
  /// In en, this message translates to:
  /// **'Could not open file'**
  String get couldNotOpenFile;

  /// No description provided for @noStoriesAvailable.
  ///
  /// In en, this message translates to:
  /// **'No stories available'**
  String get noStoriesAvailable;

  /// No description provided for @mediaUploadIssue.
  ///
  /// In en, this message translates to:
  /// **'Media Upload Issue'**
  String get mediaUploadIssue;

  /// No description provided for @checkSynapseMediaConfiguration.
  ///
  /// In en, this message translates to:
  /// **'Check Synapse media configuration'**
  String get checkSynapseMediaConfiguration;

  /// No description provided for @replyToStory.
  ///
  /// In en, this message translates to:
  /// **'Reply to story...'**
  String get replyToStory;

  /// No description provided for @view.
  ///
  /// In en, this message translates to:
  /// **'View'**
  String get view;

  /// No description provided for @mapUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Map unavailable'**
  String get mapUnavailable;

  /// No description provided for @locationPreview.
  ///
  /// In en, this message translates to:
  /// **'Location Preview'**
  String get locationPreview;

  /// No description provided for @selectFilesUsingButtonsAbove.
  ///
  /// In en, this message translates to:
  /// **'Select files using the buttons above'**
  String get selectFilesUsingButtonsAbove;

  /// No description provided for @viewedBy.
  ///
  /// In en, this message translates to:
  /// **'Viewed by {count}'**
  String viewedBy(int count);

  /// No description provided for @replySent.
  ///
  /// In en, this message translates to:
  /// **'Reply sent!'**
  String get replySent;

  /// No description provided for @deleteStory.
  ///
  /// In en, this message translates to:
  /// **'Delete Story'**
  String get deleteStory;

  /// No description provided for @areYouSureDeleteStory.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this story?'**
  String get areYouSureDeleteStory;

  /// No description provided for @noBlockedUsers.
  ///
  /// In en, this message translates to:
  /// **'No blocked users'**
  String get noBlockedUsers;

  /// No description provided for @incomingCall.
  ///
  /// In en, this message translates to:
  /// **'Incoming call...'**
  String get incomingCall;

  /// No description provided for @profileSettings.
  ///
  /// In en, this message translates to:
  /// **'Profile Settings'**
  String get profileSettings;

  /// No description provided for @flightMode.
  ///
  /// In en, this message translates to:
  /// **'Flight Mode'**
  String get flightMode;

  /// No description provided for @manageYourFlightMode.
  ///
  /// In en, this message translates to:
  /// **'Manage your flight mode'**
  String get manageYourFlightMode;

  /// No description provided for @passwordAndSecurity.
  ///
  /// In en, this message translates to:
  /// **'Password & Security'**
  String get passwordAndSecurity;

  /// No description provided for @twoFactorAuthentication.
  ///
  /// In en, this message translates to:
  /// **'Two-factor authentication'**
  String get twoFactorAuthentication;

  /// No description provided for @enableTwoFactorAuthentication.
  ///
  /// In en, this message translates to:
  /// **'Enable two-factor authentication'**
  String get enableTwoFactorAuthentication;

  /// No description provided for @viewActiveSessions.
  ///
  /// In en, this message translates to:
  /// **'View active sessions'**
  String get viewActiveSessions;

  /// No description provided for @signingIn.
  ///
  /// In en, this message translates to:
  /// **'Signing in'**
  String get signingIn;

  /// No description provided for @usernameInvalidCharacters.
  ///
  /// In en, this message translates to:
  /// **'Username can only contain letters, numbers, dots, underscores, and hyphens'**
  String get usernameInvalidCharacters;

  /// No description provided for @emailRequired.
  ///
  /// In en, this message translates to:
  /// **'Email is required'**
  String get emailRequired;

  /// No description provided for @pleaseEnterValidEmail.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email address'**
  String get pleaseEnterValidEmail;

  /// No description provided for @passwordRequired.
  ///
  /// In en, this message translates to:
  /// **'Password is required'**
  String get passwordRequired;

  /// No description provided for @passwordMustContainUppercase.
  ///
  /// In en, this message translates to:
  /// **'Password must contain at least 1 uppercase letter (A-Z)'**
  String get passwordMustContainUppercase;

  /// No description provided for @passwordMustContainLowercase.
  ///
  /// In en, this message translates to:
  /// **'Password must contain at least 1 lowercase letter (a-z)'**
  String get passwordMustContainLowercase;

  /// No description provided for @passwordMustContainNumber.
  ///
  /// In en, this message translates to:
  /// **'Password must contain at least 1 number (0-9)'**
  String get passwordMustContainNumber;

  /// No description provided for @passwordMustContainSpecialChar.
  ///
  /// In en, this message translates to:
  /// **'Password must contain at least 1 special character (!@#\$%^&*?)'**
  String get passwordMustContainSpecialChar;

  /// No description provided for @passwordCannotContainUsername.
  ///
  /// In en, this message translates to:
  /// **'Password cannot contain your username'**
  String get passwordCannotContainUsername;

  /// No description provided for @passwordCannotContainCommonWords.
  ///
  /// In en, this message translates to:
  /// **'Password cannot contain common words'**
  String get passwordCannotContainCommonWords;

  /// No description provided for @passwordCannotContainSequences.
  ///
  /// In en, this message translates to:
  /// **'Password cannot contain simple sequences'**
  String get passwordCannotContainSequences;

  /// No description provided for @noPendingVerification.
  ///
  /// In en, this message translates to:
  /// **'No pending verification found. Please start registration again.'**
  String get noPendingVerification;

  /// No description provided for @emailVerificationRequiredMessage.
  ///
  /// In en, this message translates to:
  /// **'Email verification required. Please check your email and click the verification link. Make sure to click the link in the email before trying to complete registration.'**
  String get emailVerificationRequiredMessage;

  /// No description provided for @failedToStartEmailVerification.
  ///
  /// In en, this message translates to:
  /// **'Failed to start email verification'**
  String get failedToStartEmailVerification;

  /// No description provided for @personalAccount.
  ///
  /// In en, this message translates to:
  /// **'Personal Account'**
  String get personalAccount;

  /// No description provided for @provideIdentificationDetails.
  ///
  /// In en, this message translates to:
  /// **'Please provide your identification details in the space below.'**
  String get provideIdentificationDetails;

  /// No description provided for @processingData.
  ///
  /// In en, this message translates to:
  /// **'Processing Data'**
  String get processingData;

  /// No description provided for @firstName.
  ///
  /// In en, this message translates to:
  /// **'First Name'**
  String get firstName;

  /// No description provided for @pleaseEnterFirstName.
  ///
  /// In en, this message translates to:
  /// **'Please enter your first name'**
  String get pleaseEnterFirstName;

  /// No description provided for @middleNameOptional.
  ///
  /// In en, this message translates to:
  /// **'Middle Name (optional)'**
  String get middleNameOptional;

  /// No description provided for @lastName.
  ///
  /// In en, this message translates to:
  /// **'Last Name'**
  String get lastName;

  /// No description provided for @pleaseEnterLastName.
  ///
  /// In en, this message translates to:
  /// **'Please enter your last name'**
  String get pleaseEnterLastName;

  /// No description provided for @idOrPassportType.
  ///
  /// In en, this message translates to:
  /// **'ID or Passport Type'**
  String get idOrPassportType;

  /// No description provided for @pleaseSelectDocumentType.
  ///
  /// In en, this message translates to:
  /// **'Please select a document type'**
  String get pleaseSelectDocumentType;

  /// No description provided for @dni.
  ///
  /// In en, this message translates to:
  /// **'DNI'**
  String get dni;

  /// No description provided for @passport.
  ///
  /// In en, this message translates to:
  /// **'Passport'**
  String get passport;

  /// No description provided for @driverLicense.
  ///
  /// In en, this message translates to:
  /// **'Driver License'**
  String get driverLicense;

  /// No description provided for @otherId.
  ///
  /// In en, this message translates to:
  /// **'Other ID'**
  String get otherId;

  /// No description provided for @documentNumber.
  ///
  /// In en, this message translates to:
  /// **'Document Number'**
  String get documentNumber;

  /// No description provided for @pleaseEnterDocumentNumber.
  ///
  /// In en, this message translates to:
  /// **'Please enter your document number'**
  String get pleaseEnterDocumentNumber;

  /// No description provided for @resetPassword.
  ///
  /// In en, this message translates to:
  /// **'Reset Password'**
  String get resetPassword;

  /// No description provided for @checkYourEmail.
  ///
  /// In en, this message translates to:
  /// **'Check Your Email'**
  String get checkYourEmail;

  /// No description provided for @enterYourEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get enterYourEmail;

  /// No description provided for @emailIsRequired.
  ///
  /// In en, this message translates to:
  /// **'Email is required'**
  String get emailIsRequired;

  /// No description provided for @sendResetLink.
  ///
  /// In en, this message translates to:
  /// **'Send Reset Link'**
  String get sendResetLink;

  /// No description provided for @failedToSendResetEmail.
  ///
  /// In en, this message translates to:
  /// **'Failed to send reset email'**
  String get failedToSendResetEmail;

  /// No description provided for @emailNotFound.
  ///
  /// In en, this message translates to:
  /// **'Email address not found. Please check your email or sign up first.'**
  String get emailNotFound;

  /// No description provided for @myStory.
  ///
  /// In en, this message translates to:
  /// **'My Story'**
  String get myStory;

  /// No description provided for @today.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get today;

  /// No description provided for @yesterday.
  ///
  /// In en, this message translates to:
  /// **'Yesterday'**
  String get yesterday;

  /// No description provided for @financeDeleteAccount.
  ///
  /// In en, this message translates to:
  /// **'Delete External Account'**
  String get financeDeleteAccount;

  /// No description provided for @financeDeleteAccountConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this external account? This action cannot be undone.'**
  String get financeDeleteAccountConfirmation;

  /// No description provided for @financeAccountDeleted.
  ///
  /// In en, this message translates to:
  /// **'External account deleted successfully'**
  String get financeAccountDeleted;

  /// No description provided for @financeKYCStepPersonalInfo.
  ///
  /// In en, this message translates to:
  /// **'Personal\nInfo'**
  String get financeKYCStepPersonalInfo;

  /// No description provided for @financeKYCStepAddress.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get financeKYCStepAddress;

  /// No description provided for @financeKYCStepDocument.
  ///
  /// In en, this message translates to:
  /// **'Document'**
  String get financeKYCStepDocument;

  /// No description provided for @financeKYCStepReview.
  ///
  /// In en, this message translates to:
  /// **'Review'**
  String get financeKYCStepReview;

  /// No description provided for @financeKYCDocumentType.
  ///
  /// In en, this message translates to:
  /// **'Document Type'**
  String get financeKYCDocumentType;

  /// No description provided for @financeKYCPassport.
  ///
  /// In en, this message translates to:
  /// **'Passport'**
  String get financeKYCPassport;

  /// No description provided for @financeKYCDocumentNumber.
  ///
  /// In en, this message translates to:
  /// **'Document Number'**
  String get financeKYCDocumentNumber;

  /// No description provided for @financePayCryptoDocNumberRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter your document number'**
  String get financePayCryptoDocNumberRequired;

  /// No description provided for @financeKYCMotherMaidenName.
  ///
  /// In en, this message translates to:
  /// **'Mother\'s Maiden Name'**
  String get financeKYCMotherMaidenName;

  /// No description provided for @financePayCryptoMaidenNameRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter mother\'s maiden name'**
  String get financePayCryptoMaidenNameRequired;

  /// No description provided for @financeKYCUploadFrontID.
  ///
  /// In en, this message translates to:
  /// **'Upload Front ID'**
  String get financeKYCUploadFrontID;

  /// No description provided for @financeKYCUploadBackID.
  ///
  /// In en, this message translates to:
  /// **'Upload Back ID'**
  String get financeKYCUploadBackID;

  /// No description provided for @financeKYCUploadSelfieWithDoc.
  ///
  /// In en, this message translates to:
  /// **'Upload Selfie with Document'**
  String get financeKYCUploadSelfieWithDoc;

  /// No description provided for @financeKYCReviewName.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get financeKYCReviewName;

  /// No description provided for @financeKYCReviewEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get financeKYCReviewEmail;

  /// No description provided for @financeKYCReviewPhone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get financeKYCReviewPhone;

  /// No description provided for @financeKYCReviewAddress.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get financeKYCReviewAddress;

  /// No description provided for @financeKYCReviewDocumentType.
  ///
  /// In en, this message translates to:
  /// **'Document Type'**
  String get financeKYCReviewDocumentType;

  /// No description provided for @financeKYCReviewDocumentNumber.
  ///
  /// In en, this message translates to:
  /// **'Document Number'**
  String get financeKYCReviewDocumentNumber;

  /// No description provided for @financeKYCReviewFrontImage.
  ///
  /// In en, this message translates to:
  /// **'Front Image'**
  String get financeKYCReviewFrontImage;

  /// No description provided for @financeKYCReviewBackImage.
  ///
  /// In en, this message translates to:
  /// **'Back Image'**
  String get financeKYCReviewBackImage;

  /// No description provided for @financeKYCReviewMixedImage.
  ///
  /// In en, this message translates to:
  /// **'Mixed Image'**
  String get financeKYCReviewMixedImage;

  /// No description provided for @financeKYCReviewUploaded.
  ///
  /// In en, this message translates to:
  /// **'Uploaded'**
  String get financeKYCReviewUploaded;

  /// No description provided for @financeKYCReviewNotUploaded.
  ///
  /// In en, this message translates to:
  /// **'Not uploaded'**
  String get financeKYCReviewNotUploaded;

  /// No description provided for @financeKYCUploadImage.
  ///
  /// In en, this message translates to:
  /// **'Upload image'**
  String get financeKYCUploadImage;

  /// No description provided for @financeKYCMustBe18.
  ///
  /// In en, this message translates to:
  /// **'You must be at least 18 years old to register'**
  String get financeKYCMustBe18;

  /// No description provided for @financeKYCPleaseFixIssues.
  ///
  /// In en, this message translates to:
  /// **'Please fix the following issues:'**
  String get financeKYCPleaseFixIssues;

  /// No description provided for @financeKYCPleaseSelectStateProvince.
  ///
  /// In en, this message translates to:
  /// **'Please select your state/province'**
  String get financeKYCPleaseSelectStateProvince;

  /// No description provided for @financePayCryptoMaidenNameMinLength.
  ///
  /// In en, this message translates to:
  /// **'Mother\'s maiden name must be at least 2 characters'**
  String get financePayCryptoMaidenNameMinLength;

  /// No description provided for @financeKYCUploadFrontDoc.
  ///
  /// In en, this message translates to:
  /// **'Please upload the front of your document'**
  String get financeKYCUploadFrontDoc;

  /// No description provided for @financeKYCUploadBackDoc.
  ///
  /// In en, this message translates to:
  /// **'Please upload the back of your document'**
  String get financeKYCUploadBackDoc;

  /// No description provided for @financeKYCUploadSelfieWithDocClear.
  ///
  /// In en, this message translates to:
  /// **'Please upload a selfie holding your document clearly visible'**
  String get financeKYCUploadSelfieWithDocClear;

  /// No description provided for @financeKYCSubmissionFailed.
  ///
  /// In en, this message translates to:
  /// **'KYC submission failed'**
  String get financeKYCSubmissionFailed;

  /// No description provided for @financeKYCSubmissionFailedCheckDocs.
  ///
  /// In en, this message translates to:
  /// **'KYC submission failed. Please check your documents and try again.'**
  String get financeKYCSubmissionFailedCheckDocs;

  /// No description provided for @financeKYCFailedToSubmit.
  ///
  /// In en, this message translates to:
  /// **'Failed to submit KYC'**
  String get financeKYCFailedToSubmit;

  /// No description provided for @financeKYCErrorProcessingImages.
  ///
  /// In en, this message translates to:
  /// **'Error processing images: {error}'**
  String financeKYCErrorProcessingImages(String error);

  /// No description provided for @financeKycNotStarted.
  ///
  /// In en, this message translates to:
  /// **'KYC Not Started'**
  String get financeKycNotStarted;

  /// No description provided for @financeKycIncomplete.
  ///
  /// In en, this message translates to:
  /// **'KYC Incomplete'**
  String get financeKycIncomplete;

  /// No description provided for @financeKycQuestionnaireRequired.
  ///
  /// In en, this message translates to:
  /// **'Questionnaire Required'**
  String get financeKycQuestionnaireRequired;

  /// No description provided for @financeKycUboDetailsRequired.
  ///
  /// In en, this message translates to:
  /// **'UBO Details Required'**
  String get financeKycUboDetailsRequired;

  /// No description provided for @financeKycUnderReview.
  ///
  /// In en, this message translates to:
  /// **'Under Review'**
  String get financeKycUnderReview;

  /// No description provided for @financeKycApproved.
  ///
  /// In en, this message translates to:
  /// **'KYC Approved'**
  String get financeKycApproved;

  /// No description provided for @financeKycRejected.
  ///
  /// In en, this message translates to:
  /// **'KYC Rejected'**
  String get financeKycRejected;

  /// No description provided for @financeKycAccountPaused.
  ///
  /// In en, this message translates to:
  /// **'Account Paused'**
  String get financeKycAccountPaused;

  /// No description provided for @financeKycAccountClosed.
  ///
  /// In en, this message translates to:
  /// **'Account Closed'**
  String get financeKycAccountClosed;

  /// No description provided for @financeKycStatusUnknown.
  ///
  /// In en, this message translates to:
  /// **'Status Unknown'**
  String get financeKycStatusUnknown;

  /// No description provided for @financeKycNotStartedDesc.
  ///
  /// In en, this message translates to:
  /// **'Identity verification has not been started yet'**
  String get financeKycNotStartedDesc;

  /// No description provided for @financeKycIncompleteDesc.
  ///
  /// In en, this message translates to:
  /// **'Please complete all required verification steps'**
  String get financeKycIncompleteDesc;

  /// No description provided for @financeKycQuestionnaireRequiredDesc.
  ///
  /// In en, this message translates to:
  /// **'Additional questionnaire needs to be completed'**
  String get financeKycQuestionnaireRequiredDesc;

  /// No description provided for @financeKycUboDetailsRequiredDesc.
  ///
  /// In en, this message translates to:
  /// **'Ultimate Beneficial Owner details are required'**
  String get financeKycUboDetailsRequiredDesc;

  /// No description provided for @financeKycUnderReviewDesc.
  ///
  /// In en, this message translates to:
  /// **'Your verification is currently being reviewed'**
  String get financeKycUnderReviewDesc;

  /// No description provided for @financeKycApprovedDesc.
  ///
  /// In en, this message translates to:
  /// **'Your identity has been successfully verified'**
  String get financeKycApprovedDesc;

  /// No description provided for @financeKycRejectedDesc.
  ///
  /// In en, this message translates to:
  /// **'Verification was rejected. Please review and resubmit'**
  String get financeKycRejectedDesc;

  /// No description provided for @financeKycAccountPausedDesc.
  ///
  /// In en, this message translates to:
  /// **'Your account has been temporarily paused'**
  String get financeKycAccountPausedDesc;

  /// No description provided for @financeKycAccountClosedDesc.
  ///
  /// In en, this message translates to:
  /// **'Your account has been closed'**
  String get financeKycAccountClosedDesc;

  /// No description provided for @financeKycUnknownStatusDesc.
  ///
  /// In en, this message translates to:
  /// **'Unable to determine verification status'**
  String get financeKycUnknownStatusDesc;

  /// No description provided for @financeKycStartVerification.
  ///
  /// In en, this message translates to:
  /// **'Start Verification'**
  String get financeKycStartVerification;

  /// No description provided for @financeKycCompleteVerification.
  ///
  /// In en, this message translates to:
  /// **'Complete Verification'**
  String get financeKycCompleteVerification;

  /// No description provided for @financeKycCompleteQuestionnaire.
  ///
  /// In en, this message translates to:
  /// **'Complete Questionnaire'**
  String get financeKycCompleteQuestionnaire;

  /// No description provided for @financeKycProvideUboDetails.
  ///
  /// In en, this message translates to:
  /// **'Provide UBO Details'**
  String get financeKycProvideUboDetails;

  /// No description provided for @financeKycRetryVerification.
  ///
  /// In en, this message translates to:
  /// **'Retry Verification'**
  String get financeKycRetryVerification;

  /// No description provided for @financeKycContinueVerification.
  ///
  /// In en, this message translates to:
  /// **'Continue Verification'**
  String get financeKycContinueVerification;

  /// No description provided for @financeKycLoadingStatus.
  ///
  /// In en, this message translates to:
  /// **'Loading Status...'**
  String get financeKycLoadingStatus;

  /// No description provided for @financeKycOpenLink.
  ///
  /// In en, this message translates to:
  /// **'Open Link'**
  String get financeKycOpenLink;

  /// No description provided for @financeKycViewTerms.
  ///
  /// In en, this message translates to:
  /// **'View Terms'**
  String get financeKycViewTerms;

  /// No description provided for @financeKycRefreshStatus.
  ///
  /// In en, this message translates to:
  /// **'Refresh Status'**
  String get financeKycRefreshStatus;

  /// No description provided for @financeKycCannotOpenLink.
  ///
  /// In en, this message translates to:
  /// **'Cannot Open Link'**
  String get financeKycCannotOpenLink;

  /// No description provided for @financeKycFailedToOpenLink.
  ///
  /// In en, this message translates to:
  /// **'Failed to open verification link'**
  String get financeKycFailedToOpenLink;

  /// No description provided for @financeKycTosAcceptedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Terms of Service accepted successfully'**
  String get financeKycTosAcceptedSuccess;

  /// No description provided for @customerKycLoadingUserInfo.
  ///
  /// In en, this message translates to:
  /// **'Loading user information...'**
  String get customerKycLoadingUserInfo;

  /// No description provided for @customerKycCreateCustomerAccount.
  ///
  /// In en, this message translates to:
  /// **'Create Customer Account'**
  String get customerKycCreateCustomerAccount;

  /// No description provided for @customerKycCompleteKycSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Complete KYC verification to access financial services'**
  String get customerKycCompleteKycSubtitle;

  /// No description provided for @customerKycCustomerType.
  ///
  /// In en, this message translates to:
  /// **'Customer Type'**
  String get customerKycCustomerType;

  /// No description provided for @customerKycIndividual.
  ///
  /// In en, this message translates to:
  /// **'Individual'**
  String get customerKycIndividual;

  /// No description provided for @customerKycCompany.
  ///
  /// In en, this message translates to:
  /// **'Company'**
  String get customerKycCompany;

  /// No description provided for @customerKycFullName.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get customerKycFullName;

  /// No description provided for @customerKycEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get customerKycEmail;

  /// No description provided for @customerKycGenerateKycLink.
  ///
  /// In en, this message translates to:
  /// **'Generate KYC Link'**
  String get customerKycGenerateKycLink;

  /// No description provided for @customerKycNameRequired.
  ///
  /// In en, this message translates to:
  /// **'Name is required'**
  String get customerKycNameRequired;

  /// No description provided for @customerKycEmailRequired.
  ///
  /// In en, this message translates to:
  /// **'Email is required'**
  String get customerKycEmailRequired;

  /// No description provided for @customerKycInvalidEmailFormat.
  ///
  /// In en, this message translates to:
  /// **'Invalid email format'**
  String get customerKycInvalidEmailFormat;

  /// No description provided for @customerKycSelectEndorsement.
  ///
  /// In en, this message translates to:
  /// **'Please select at least one endorsement'**
  String get customerKycSelectEndorsement;

  /// No description provided for @customerKycSelectPaymentService.
  ///
  /// In en, this message translates to:
  /// **'Please select at least one payment service'**
  String get customerKycSelectPaymentService;

  /// No description provided for @customerKycUsernameNotFound.
  ///
  /// In en, this message translates to:
  /// **'Username not found. Please login again.'**
  String get customerKycUsernameNotFound;

  /// No description provided for @customerKycFailedSendOtp.
  ///
  /// In en, this message translates to:
  /// **'Failed to send OTP'**
  String get customerKycFailedSendOtp;

  /// No description provided for @customerKycVerificationFailed.
  ///
  /// In en, this message translates to:
  /// **'Verification failed'**
  String get customerKycVerificationFailed;

  /// No description provided for @customerKycFailedCreateLink.
  ///
  /// In en, this message translates to:
  /// **'Failed to create KYC link'**
  String get customerKycFailedCreateLink;

  /// No description provided for @customerKycCustomerIdNotFound.
  ///
  /// In en, this message translates to:
  /// **'Customer ID not found in response'**
  String get customerKycCustomerIdNotFound;

  /// No description provided for @customerKycLinkAlreadyExists.
  ///
  /// In en, this message translates to:
  /// **'A KYC link already exists for this email'**
  String get customerKycLinkAlreadyExists;

  /// No description provided for @customerKycCannotOpenLink.
  ///
  /// In en, this message translates to:
  /// **'Cannot open this link'**
  String get customerKycCannotOpenLink;

  /// No description provided for @customerKycFailedOpenLink.
  ///
  /// In en, this message translates to:
  /// **'Failed to open link'**
  String get customerKycFailedOpenLink;

  /// No description provided for @customerKycLinkGeneratedSuccess.
  ///
  /// In en, this message translates to:
  /// **'KYC link generated successfully'**
  String get customerKycLinkGeneratedSuccess;

  /// No description provided for @customerKycVerification.
  ///
  /// In en, this message translates to:
  /// **'KYC Verification'**
  String get customerKycVerification;

  /// No description provided for @customerKycOpenKycLink.
  ///
  /// In en, this message translates to:
  /// **'Open KYC Link'**
  String get customerKycOpenKycLink;

  /// No description provided for @customerKycViewTermsOfService.
  ///
  /// In en, this message translates to:
  /// **'View Terms of Service'**
  String get customerKycViewTermsOfService;

  /// No description provided for @customerKycCreateAccount.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get customerKycCreateAccount;

  /// No description provided for @customerKycPaymentServices.
  ///
  /// In en, this message translates to:
  /// **'Payment Services'**
  String get customerKycPaymentServices;

  /// No description provided for @customerKycPaymentServicesSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Select the payment methods and currencies you want to use. You can choose multiple options.'**
  String get customerKycPaymentServicesSubtitle;

  /// No description provided for @customerKycAllServices.
  ///
  /// In en, this message translates to:
  /// **'All Services'**
  String get customerKycAllServices;

  /// No description provided for @customerKycUsdAchWire.
  ///
  /// In en, this message translates to:
  /// **'USD (ACH/Wire)'**
  String get customerKycUsdAchWire;

  /// No description provided for @customerKycEurSepa.
  ///
  /// In en, this message translates to:
  /// **'EUR (SEPA)'**
  String get customerKycEurSepa;

  /// No description provided for @customerKycMxnSpei.
  ///
  /// In en, this message translates to:
  /// **'MXN (SPEI)'**
  String get customerKycMxnSpei;

  /// No description provided for @customerKycBrlPix.
  ///
  /// In en, this message translates to:
  /// **'BRL (Pix)'**
  String get customerKycBrlPix;

  /// No description provided for @customerKycUsdTooltip.
  ///
  /// In en, this message translates to:
  /// **'Supports USD payments via ACH or Wire transfers for US dollar transactions.'**
  String get customerKycUsdTooltip;

  /// No description provided for @customerKycEurTooltip.
  ///
  /// In en, this message translates to:
  /// **'Provides EUR payments through SEPA for European transactions.'**
  String get customerKycEurTooltip;

  /// No description provided for @customerKycMxnTooltip.
  ///
  /// In en, this message translates to:
  /// **'Enables MXN payments via SPEI for Mexican peso transactions.'**
  String get customerKycMxnTooltip;

  /// No description provided for @customerKycBrlTooltip.
  ///
  /// In en, this message translates to:
  /// **'Allows BRL payments via Pix for Brazilian real transactions.'**
  String get customerKycBrlTooltip;

  /// No description provided for @customerKycStatusNotStarted.
  ///
  /// In en, this message translates to:
  /// **'KYC not started. Please begin verification.'**
  String get customerKycStatusNotStarted;

  /// No description provided for @customerKycStatusInProgress.
  ///
  /// In en, this message translates to:
  /// **'KYC in progress. Please complete verification.'**
  String get customerKycStatusInProgress;

  /// No description provided for @customerKycStatusApproved.
  ///
  /// In en, this message translates to:
  /// **'KYC approved! You can now create your account.'**
  String get customerKycStatusApproved;

  /// No description provided for @customerKycStatusRejected.
  ///
  /// In en, this message translates to:
  /// **'KYC rejected. Please review and retry.'**
  String get customerKycStatusRejected;

  /// No description provided for @customerKycStatusUnderReview.
  ///
  /// In en, this message translates to:
  /// **'KYC under review. Please wait for approval.'**
  String get customerKycStatusUnderReview;

  /// No description provided for @customerKycStatusUnknown.
  ///
  /// In en, this message translates to:
  /// **'Unknown status'**
  String get customerKycStatusUnknown;

  /// No description provided for @customerKycDialogGotIt.
  ///
  /// In en, this message translates to:
  /// **'Got it'**
  String get customerKycDialogGotIt;

  /// No description provided for @exit.
  ///
  /// In en, this message translates to:
  /// **'Exit'**
  String get exit;

  /// No description provided for @doYouWantToExitTheApp.
  ///
  /// In en, this message translates to:
  /// **'Do you want to exit the app?'**
  String get doYouWantToExitTheApp;

  /// No description provided for @newChatRequests.
  ///
  /// In en, this message translates to:
  /// **'New Chat Requests'**
  String get newChatRequests;

  /// No description provided for @changeLanguageTitle.
  ///
  /// In en, this message translates to:
  /// **'Change Language'**
  String get changeLanguageTitle;

  /// No description provided for @selectLanguage.
  ///
  /// In en, this message translates to:
  /// **'Select Language'**
  String get selectLanguage;

  /// No description provided for @messageQuestionWillBeAvailable.
  ///
  /// In en, this message translates to:
  /// **'Message Question will be available soon!'**
  String get messageQuestionWillBeAvailable;

  /// No description provided for @enter4DigitPin.
  ///
  /// In en, this message translates to:
  /// **'Enter a 4-digit PIN'**
  String get enter4DigitPin;

  /// No description provided for @createPinCode.
  ///
  /// In en, this message translates to:
  /// **'Create your PIN code'**
  String get createPinCode;

  /// No description provided for @welcomeTo.
  ///
  /// In en, this message translates to:
  /// **'Welcome to'**
  String get welcomeTo;

  /// No description provided for @enjoyFullExperience.
  ///
  /// In en, this message translates to:
  /// **'Enjoy the full experience that BMP offers you'**
  String get enjoyFullExperience;

  /// No description provided for @signUpForAccount.
  ///
  /// In en, this message translates to:
  /// **'Sign up For an\naccount'**
  String get signUpForAccount;

  /// No description provided for @enterYourPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter your phone number'**
  String get enterYourPhoneNumber;

  /// No description provided for @verificationSMSMessage.
  ///
  /// In en, this message translates to:
  /// **'BMP will send you an SMS message to verify your phone number.'**
  String get verificationSMSMessage;

  /// No description provided for @phoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone number'**
  String get phoneNumber;

  /// No description provided for @ageRestrictionMessage.
  ///
  /// In en, this message translates to:
  /// **'You must be at least 16 years old to register. Learn more about how BMP works.'**
  String get ageRestrictionMessage;

  /// No description provided for @enterPhoneNumberError.
  ///
  /// In en, this message translates to:
  /// **'Please enter a phone number'**
  String get enterPhoneNumberError;

  /// No description provided for @pinSetSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'PIN set successfully'**
  String get pinSetSuccessfully;

  /// No description provided for @selectCountry.
  ///
  /// In en, this message translates to:
  /// **'Select Country'**
  String get selectCountry;

  /// No description provided for @searchYourCountry.
  ///
  /// In en, this message translates to:
  /// **'Search your country'**
  String get searchYourCountry;

  /// No description provided for @groupChats.
  ///
  /// In en, this message translates to:
  /// **'Group Chats'**
  String get groupChats;

  /// No description provided for @myQR.
  ///
  /// In en, this message translates to:
  /// **'My QR'**
  String get myQR;

  /// No description provided for @tapToStartConversation.
  ///
  /// In en, this message translates to:
  /// **'Tap to start conversation'**
  String get tapToStartConversation;

  /// No description provided for @changeProfilePicture.
  ///
  /// In en, this message translates to:
  /// **'Change Profile Picture'**
  String get changeProfilePicture;

  /// No description provided for @displayName.
  ///
  /// In en, this message translates to:
  /// **'Display Name'**
  String get displayName;

  /// No description provided for @editContact.
  ///
  /// In en, this message translates to:
  /// **'Edit Contact'**
  String get editContact;

  /// No description provided for @pleaseEnterYourPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Please enter your phone number'**
  String get pleaseEnterYourPhoneNumber;

  /// No description provided for @otpSentSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'OTP sent successfully'**
  String get otpSentSuccessfully;

  /// No description provided for @otpSendFailed.
  ///
  /// In en, this message translates to:
  /// **'OTP send failed'**
  String get otpSendFailed;

  /// No description provided for @otpVerifiedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'OTP verified successfully'**
  String get otpVerifiedSuccessfully;

  /// No description provided for @sessionIdIsMissing.
  ///
  /// In en, this message translates to:
  /// **'Session ID is missing'**
  String get sessionIdIsMissing;

  /// No description provided for @verificationSuccessful.
  ///
  /// In en, this message translates to:
  /// **'Verification successful'**
  String get verificationSuccessful;

  /// No description provided for @pleaseEnterPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Please enter phone number'**
  String get pleaseEnterPhoneNumber;

  /// No description provided for @phoneNumberMustBeDigits.
  ///
  /// In en, this message translates to:
  /// **'Phone number must be {requiredLength} digits'**
  String phoneNumberMustBeDigits(Object requiredLength);

  /// No description provided for @phoneNumberCannotExceedDigits.
  ///
  /// In en, this message translates to:
  /// **'Phone number cannot exceed {requiredLength} digits'**
  String phoneNumberCannotExceedDigits(Object requiredLength);

  /// No description provided for @phoneNumberMustContainOnlyDigits.
  ///
  /// In en, this message translates to:
  /// **'Phone number must contain only digits'**
  String get phoneNumberMustContainOnlyDigits;

  /// No description provided for @ibanNumber.
  ///
  /// In en, this message translates to:
  /// **'IBAN Number'**
  String get ibanNumber;

  /// No description provided for @bicSwift.
  ///
  /// In en, this message translates to:
  /// **'BIC / SWIFT'**
  String get bicSwift;

  /// No description provided for @encryptionSetupTitle.
  ///
  /// In en, this message translates to:
  /// **'Encryption Setup Required'**
  String get encryptionSetupTitle;

  /// No description provided for @encryptionSetupMessage.
  ///
  /// In en, this message translates to:
  /// **'Your device encryption is not properly set up. This is required for secure messaging.\n\nWould you like to complete the encryption setup now?'**
  String get encryptionSetupMessage;

  /// No description provided for @encryptionSetupOk.
  ///
  /// In en, this message translates to:
  /// **'Complete Setup'**
  String get encryptionSetupOk;

  /// No description provided for @encryptionDisableNotAllowed.
  ///
  /// In en, this message translates to:
  /// **'You cannot disable the encryption in a room. If you want to disable the encryption, then create a new room without encryption.'**
  String get encryptionDisableNotAllowed;

  /// No description provided for @publicRoomEncryptionNotAllowed.
  ///
  /// In en, this message translates to:
  /// **'Public rooms cannot be encrypted.'**
  String get publicRoomEncryptionNotAllowed;

  /// No description provided for @encryptionPermissionDenied.
  ///
  /// In en, this message translates to:
  /// **'You do not have permission to change this.'**
  String get encryptionPermissionDenied;

  /// No description provided for @encryptionSetupCompleted.
  ///
  /// In en, this message translates to:
  /// **'Encryption setup completed! You can now enable encryption.'**
  String get encryptionSetupCompleted;

  /// No description provided for @enableEncryptionFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to enable encryption: {error}'**
  String enableEncryptionFailed(Object error);

  /// No description provided for @completeEncryptionSetupFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to complete encryption setup: {error}. Please try again or contact support.'**
  String completeEncryptionSetupFailed(Object error);

  /// No description provided for @encryptionIrreversibleWarning.
  ///
  /// In en, this message translates to:
  /// **'Enabling encryption in this room is irreversible! Are you sure?'**
  String get encryptionIrreversibleWarning;

  /// No description provided for @encryptionEnabledSuccess.
  ///
  /// In en, this message translates to:
  /// **'Encryption enabled successfully!'**
  String get encryptionEnabledSuccess;

  /// No description provided for @encryptionError.
  ///
  /// In en, this message translates to:
  /// **'Encryption Error'**
  String get encryptionError;

  /// No description provided for @encryptionSetupFailedTitle.
  ///
  /// In en, this message translates to:
  /// **'Encryption Setup Failed'**
  String get encryptionSetupFailedTitle;

  /// No description provided for @noTransactionHistoryAvailable.
  ///
  /// In en, this message translates to:
  /// **'No transaction history available'**
  String get noTransactionHistoryAvailable;

  /// No description provided for @approved.
  ///
  /// In en, this message translates to:
  /// **'Approved'**
  String get approved;

  /// No description provided for @active.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get active;

  /// No description provided for @rejected.
  ///
  /// In en, this message translates to:
  /// **'Rejected'**
  String get rejected;

  /// No description provided for @pending.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get pending;

  /// No description provided for @under_review.
  ///
  /// In en, this message translates to:
  /// **'Under Review'**
  String get under_review;

  /// No description provided for @incomplete.
  ///
  /// In en, this message translates to:
  /// **'Incomplete'**
  String get incomplete;

  /// No description provided for @not_started.
  ///
  /// In en, this message translates to:
  /// **'Not Started'**
  String get not_started;

  /// No description provided for @awaiting_questionnaire.
  ///
  /// In en, this message translates to:
  /// **'Awaiting Questionnaire'**
  String get awaiting_questionnaire;

  /// No description provided for @awaiting_ubo.
  ///
  /// In en, this message translates to:
  /// **'Awaiting UBO'**
  String get awaiting_ubo;

  /// No description provided for @paused.
  ///
  /// In en, this message translates to:
  /// **'Paused'**
  String get paused;

  /// No description provided for @offboarded.
  ///
  /// In en, this message translates to:
  /// **'Offboarded'**
  String get offboarded;

  /// No description provided for @virtual.
  ///
  /// In en, this message translates to:
  /// **'Virtual'**
  String get virtual;

  /// No description provided for @physical.
  ///
  /// In en, this message translates to:
  /// **'Physical'**
  String get physical;

  /// No description provided for @selectCardType.
  ///
  /// In en, this message translates to:
  /// **'Select Card Type'**
  String get selectCardType;

  /// No description provided for @chooseCardTypeDescription.
  ///
  /// In en, this message translates to:
  /// **'Choose the type of card you want to create'**
  String get chooseCardTypeDescription;

  /// No description provided for @chooseVirtualAccountType.
  ///
  /// In en, this message translates to:
  /// **'Choose the type of virtual account you want to create'**
  String get chooseVirtualAccountType;

  /// No description provided for @noStoriesToShow.
  ///
  /// In en, this message translates to:
  /// **'No Stories to Show'**
  String get noStoriesToShow;

  /// No description provided for @noExternalAccountsAvailable.
  ///
  /// In en, this message translates to:
  /// **'No external account'**
  String get noExternalAccountsAvailable;

  /// No description provided for @editAddress.
  ///
  /// In en, this message translates to:
  /// **'Edit Address'**
  String get editAddress;

  /// No description provided for @inactive.
  ///
  /// In en, this message translates to:
  /// **'Inactive'**
  String get inactive;

  /// No description provided for @activated.
  ///
  /// In en, this message translates to:
  /// **'Activated'**
  String get activated;

  /// No description provided for @editAccount.
  ///
  /// In en, this message translates to:
  /// **'Edit Account'**
  String get editAccount;

  /// No description provided for @networkConnectionFailed.
  ///
  /// In en, this message translates to:
  /// **'Network connection failed. Please make sure that you are connected to the internet.'**
  String get networkConnectionFailed;

  /// No description provided for @networkErrorTitle.
  ///
  /// In en, this message translates to:
  /// **'Network Error'**
  String get networkErrorTitle;

  /// No description provided for @maxTwoVideos.
  ///
  /// In en, this message translates to:
  /// **'You can select up to 2 videos'**
  String get maxTwoVideos;

  /// No description provided for @maxEightImages.
  ///
  /// In en, this message translates to:
  /// **'You can select up to 8 images'**
  String get maxEightImages;

  /// No description provided for @initiateKycProcess.
  ///
  /// In en, this message translates to:
  /// **'Initiate KYC Process'**
  String get initiateKycProcess;

  /// No description provided for @acceptTermsAndConditions.
  ///
  /// In en, this message translates to:
  /// **'Accept Terms & Conditions'**
  String get acceptTermsAndConditions;

  /// No description provided for @setTransactionPin.
  ///
  /// In en, this message translates to:
  /// **'Set Transaction PIN'**
  String get setTransactionPin;

  /// No description provided for @createFourDigitPin.
  ///
  /// In en, this message translates to:
  /// **'Create a 4-digit PIN for transactions'**
  String get createFourDigitPin;
}

class _L10nDelegate extends LocalizationsDelegate<L10n> {
  const _L10nDelegate();

  @override
  Future<L10n> load(Locale locale) {
    return lookupL10n(locale);
  }

  @override
  bool isSupported(Locale locale) => <String>[
        'ar',
        'be',
        'bn',
        'bo',
        'ca',
        'cs',
        'da',
        'de',
        'el',
        'en',
        'eo',
        'es',
        'et',
        'eu',
        'fa',
        'fi',
        'fil',
        'fr',
        'ga',
        'gl',
        'he',
        'hi',
        'hr',
        'hu',
        'ia',
        'id',
        'ie',
        'it',
        'ja',
        'ka',
        'ko',
        'lt',
        'lv',
        'nb',
        'nl',
        'pl',
        'pt',
        'ro',
        'ru',
        'sk',
        'sl',
        'sr',
        'sv',
        'ta',
        'te',
        'th',
        'tr',
        'uk',
        'vi',
        'yue',
        'zh'
      ].contains(locale.languageCode);

  @override
  bool shouldReload(_L10nDelegate old) => false;
}

Future<L10n> lookupL10n(Locale locale) {
  // Lookup logic when language+script codes are specified.
  switch (locale.languageCode) {
    case 'zh':
      {
        switch (locale.scriptCode) {
          case 'Hant':
            return l10n_zh
                .loadLibrary()
                .then((dynamic _) => l10n_zh.L10nZhHant());
        }
        break;
      }
  }

  // Lookup logic when language+country codes are specified.
  switch (locale.languageCode) {
    case 'pt':
      {
        switch (locale.countryCode) {
          case 'BR':
            return l10n_pt
                .loadLibrary()
                .then((dynamic _) => l10n_pt.L10nPtBr());
          case 'PT':
            return l10n_pt
                .loadLibrary()
                .then((dynamic _) => l10n_pt.L10nPtPt());
        }
        break;
      }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return l10n_ar.loadLibrary().then((dynamic _) => l10n_ar.L10nAr());
    case 'be':
      return l10n_be.loadLibrary().then((dynamic _) => l10n_be.L10nBe());
    case 'bn':
      return l10n_bn.loadLibrary().then((dynamic _) => l10n_bn.L10nBn());
    case 'bo':
      return l10n_bo.loadLibrary().then((dynamic _) => l10n_bo.L10nBo());
    case 'ca':
      return l10n_ca.loadLibrary().then((dynamic _) => l10n_ca.L10nCa());
    case 'cs':
      return l10n_cs.loadLibrary().then((dynamic _) => l10n_cs.L10nCs());
    case 'da':
      return l10n_da.loadLibrary().then((dynamic _) => l10n_da.L10nDa());
    case 'de':
      return l10n_de.loadLibrary().then((dynamic _) => l10n_de.L10nDe());
    case 'el':
      return l10n_el.loadLibrary().then((dynamic _) => l10n_el.L10nEl());
    case 'en':
      return l10n_en.loadLibrary().then((dynamic _) => l10n_en.L10nEn());
    case 'eo':
      return l10n_eo.loadLibrary().then((dynamic _) => l10n_eo.L10nEo());
    case 'es':
      return l10n_es.loadLibrary().then((dynamic _) => l10n_es.L10nEs());
    case 'et':
      return l10n_et.loadLibrary().then((dynamic _) => l10n_et.L10nEt());
    case 'eu':
      return l10n_eu.loadLibrary().then((dynamic _) => l10n_eu.L10nEu());
    case 'fa':
      return l10n_fa.loadLibrary().then((dynamic _) => l10n_fa.L10nFa());
    case 'fi':
      return l10n_fi.loadLibrary().then((dynamic _) => l10n_fi.L10nFi());
    case 'fil':
      return l10n_fil.loadLibrary().then((dynamic _) => l10n_fil.L10nFil());
    case 'fr':
      return l10n_fr.loadLibrary().then((dynamic _) => l10n_fr.L10nFr());
    case 'ga':
      return l10n_ga.loadLibrary().then((dynamic _) => l10n_ga.L10nGa());
    case 'gl':
      return l10n_gl.loadLibrary().then((dynamic _) => l10n_gl.L10nGl());
    case 'he':
      return l10n_he.loadLibrary().then((dynamic _) => l10n_he.L10nHe());
    case 'hi':
      return l10n_hi.loadLibrary().then((dynamic _) => l10n_hi.L10nHi());
    case 'hr':
      return l10n_hr.loadLibrary().then((dynamic _) => l10n_hr.L10nHr());
    case 'hu':
      return l10n_hu.loadLibrary().then((dynamic _) => l10n_hu.L10nHu());
    case 'ia':
      return l10n_ia.loadLibrary().then((dynamic _) => l10n_ia.L10nIa());
    case 'id':
      return l10n_id.loadLibrary().then((dynamic _) => l10n_id.L10nId());
    case 'ie':
      return l10n_ie.loadLibrary().then((dynamic _) => l10n_ie.L10nIe());
    case 'it':
      return l10n_it.loadLibrary().then((dynamic _) => l10n_it.L10nIt());
    case 'ja':
      return l10n_ja.loadLibrary().then((dynamic _) => l10n_ja.L10nJa());
    case 'ka':
      return l10n_ka.loadLibrary().then((dynamic _) => l10n_ka.L10nKa());
    case 'ko':
      return l10n_ko.loadLibrary().then((dynamic _) => l10n_ko.L10nKo());
    case 'lt':
      return l10n_lt.loadLibrary().then((dynamic _) => l10n_lt.L10nLt());
    case 'lv':
      return l10n_lv.loadLibrary().then((dynamic _) => l10n_lv.L10nLv());
    case 'nb':
      return l10n_nb.loadLibrary().then((dynamic _) => l10n_nb.L10nNb());
    case 'nl':
      return l10n_nl.loadLibrary().then((dynamic _) => l10n_nl.L10nNl());
    case 'pl':
      return l10n_pl.loadLibrary().then((dynamic _) => l10n_pl.L10nPl());
    case 'pt':
      return l10n_pt.loadLibrary().then((dynamic _) => l10n_pt.L10nPt());
    case 'ro':
      return l10n_ro.loadLibrary().then((dynamic _) => l10n_ro.L10nRo());
    case 'ru':
      return l10n_ru.loadLibrary().then((dynamic _) => l10n_ru.L10nRu());
    case 'sk':
      return l10n_sk.loadLibrary().then((dynamic _) => l10n_sk.L10nSk());
    case 'sl':
      return l10n_sl.loadLibrary().then((dynamic _) => l10n_sl.L10nSl());
    case 'sr':
      return l10n_sr.loadLibrary().then((dynamic _) => l10n_sr.L10nSr());
    case 'sv':
      return l10n_sv.loadLibrary().then((dynamic _) => l10n_sv.L10nSv());
    case 'ta':
      return l10n_ta.loadLibrary().then((dynamic _) => l10n_ta.L10nTa());
    case 'te':
      return l10n_te.loadLibrary().then((dynamic _) => l10n_te.L10nTe());
    case 'th':
      return l10n_th.loadLibrary().then((dynamic _) => l10n_th.L10nTh());
    case 'tr':
      return l10n_tr.loadLibrary().then((dynamic _) => l10n_tr.L10nTr());
    case 'uk':
      return l10n_uk.loadLibrary().then((dynamic _) => l10n_uk.L10nUk());
    case 'vi':
      return l10n_vi.loadLibrary().then((dynamic _) => l10n_vi.L10nVi());
    case 'yue':
      return l10n_yue.loadLibrary().then((dynamic _) => l10n_yue.L10nYue());
    case 'zh':
      return l10n_zh.loadLibrary().then((dynamic _) => l10n_zh.L10nZh());
  }

  throw FlutterError(
      'L10n.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
