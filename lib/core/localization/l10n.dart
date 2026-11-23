// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Select server`
  String get SelectServer {
    return Intl.message(
      'Select server',
      name: 'SelectServer',
      desc: '',
      args: [],
    );
  }

  /// `Choose the server for this session. To change it, restart the app.`
  String get SelectServerDescription {
    return Intl.message(
      'Choose the server for this session. To change it, restart the app.',
      name: 'SelectServerDescription',
      desc: '',
      args: [],
    );
  }

  /// `Prod — production server`
  String get ProductionServer {
    return Intl.message(
      'Prod — production server',
      name: 'ProductionServer',
      desc: '',
      args: [],
    );
  }

  /// `Dev — development server`
  String get DevelopmentServer {
    return Intl.message(
      'Dev — development server',
      name: 'DevelopmentServer',
      desc: '',
      args: [],
    );
  }

  /// `Starting the application…`
  String get InitializingApplication {
    return Intl.message(
      'Starting the application…',
      name: 'InitializingApplication',
      desc: '',
      args: [],
    );
  }

  /// `Unable to start the application`
  String get ServerInitializationFailed {
    return Intl.message(
      'Unable to start the application',
      name: 'ServerInitializationFailed',
      desc: '',
      args: [],
    );
  }

  /// `Initialization failed. Restart the app to try again.`
  String get RestartAfterInitializationFailure {
    return Intl.message(
      'Initialization failed. Restart the app to try again.',
      name: 'RestartAfterInitializationFailure',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get Account {
    return Intl.message('Account', name: 'Account', desc: '', args: []);
  }

  /// `After you log out, you will need to log in to your account again for the app to work properly`
  String get AfterYouLogOut {
    return Intl.message(
      'After you log out, you will need to log in to your account again for the app to work properly',
      name: 'AfterYouLogOut',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to get out?`
  String get AreYouSureYouWantToGetOut {
    return Intl.message(
      'Are you sure you want to get out?',
      name: 'AreYouSureYouWantToGetOut',
      desc: '',
      args: [],
    );
  }

  /// `Calls`
  String get Calls {
    return Intl.message('Calls', name: 'Calls', desc: '', args: []);
  }

  /// `Chat`
  String get Chat {
    return Intl.message('Chat', name: 'Chat', desc: '', args: []);
  }

  /// `Chat history,theme,wallpapers`
  String get ChatHistoryThemeWallpapers {
    return Intl.message(
      'Chat history,theme,wallpapers',
      name: 'ChatHistoryThemeWallpapers',
      desc: '',
      args: [],
    );
  }

  /// `Chatbox`
  String get Chatbox {
    return Intl.message('Chatbox', name: 'Chatbox', desc: '', args: []);
  }

  /// `Confirm password`
  String get ConfirmPassword {
    return Intl.message(
      'Confirm password',
      name: 'ConfirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Connect friends easily quickly`
  String get ConnectFriendsEasilyQuickly {
    return Intl.message(
      'Connect friends easily quickly',
      name: 'ConnectFriendsEasilyQuickly',
      desc: '',
      args: [],
    );
  }

  /// `Contacts`
  String get Contacts {
    return Intl.message('Contacts', name: 'Contacts', desc: '', args: []);
  }

  /// `Create an account`
  String get CreateAnAccount {
    return Intl.message(
      'Create an account',
      name: 'CreateAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get Email {
    return Intl.message('Email', name: 'Email', desc: '', args: []);
  }

  /// `Existing account`
  String get ExistingAccount {
    return Intl.message(
      'Existing account',
      name: 'ExistingAccount',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password`
  String get ForgotPassword {
    return Intl.message(
      'Forgot password',
      name: 'ForgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Get chatting with friends`
  String get GetChattingWithFriends {
    return Intl.message(
      'Get chatting with friends',
      name: 'GetChattingWithFriends',
      desc: '',
      args: [],
    );
  }

  /// `Help`
  String get Help {
    return Intl.message('Help', name: 'Help', desc: '', args: []);
  }

  /// `Help center,contact us, privacy policy`
  String get HelpCenter {
    return Intl.message(
      'Help center,contact us, privacy policy',
      name: 'HelpCenter',
      desc: '',
      args: [],
    );
  }

  /// `Invite a friend`
  String get InviteAFriend {
    return Intl.message(
      'Invite a friend',
      name: 'InviteAFriend',
      desc: '',
      args: [],
    );
  }

  /// `Log in`
  String get LogIn {
    return Intl.message('Log in', name: 'LogIn', desc: '', args: []);
  }

  /// `Log in to Chatbox`
  String get LogInToChatbox {
    return Intl.message(
      'Log in to Chatbox',
      name: 'LogInToChatbox',
      desc: '',
      args: [],
    );
  }

  /// `Log out of your account`
  String get LogOutOfYouAccount {
    return Intl.message(
      'Log out of your account',
      name: 'LogOutOfYouAccount',
      desc: '',
      args: [],
    );
  }

  /// `Message`
  String get Message {
    return Intl.message('Message', name: 'Message', desc: '', args: []);
  }

  /// `Network usage, stogare usage`
  String get NetworkUsage {
    return Intl.message(
      'Network usage, stogare usage',
      name: 'NetworkUsage',
      desc: '',
      args: [],
    );
  }

  /// `New message`
  String get NewMessage {
    return Intl.message('New message', name: 'NewMessage', desc: '', args: []);
  }

  /// `No`
  String get No {
    return Intl.message('No', name: 'No', desc: '', args: []);
  }

  /// `Not founded`
  String get NotFounded {
    return Intl.message('Not founded', name: 'NotFounded', desc: '', args: []);
  }

  /// `Notifications`
  String get Notifications {
    return Intl.message(
      'Notifications',
      name: 'Notifications',
      desc: '',
      args: [],
    );
  }

  /// `Or`
  String get Or {
    return Intl.message('Or', name: 'Or', desc: '', args: []);
  }

  /// `Our chat app is the perfect way to stay connected with friends and family.`
  String get OurChatAppIsThePerfectWay {
    return Intl.message(
      'Our chat app is the perfect way to stay connected with friends and family.',
      name: 'OurChatAppIsThePerfectWay',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get Password {
    return Intl.message('Password', name: 'Password', desc: '', args: []);
  }

  /// `Privacy, security, change number`
  String get PrivacySecurityChange {
    return Intl.message(
      'Privacy, security, change number',
      name: 'PrivacySecurityChange',
      desc: '',
      args: [],
    );
  }

  /// `Repeat`
  String get Repeat {
    return Intl.message('Repeat', name: 'Repeat', desc: '', args: []);
  }

  /// `Setting`
  String get Setting {
    return Intl.message('Setting', name: 'Setting', desc: '', args: []);
  }

  /// `Settings`
  String get Settings {
    return Intl.message('Settings', name: 'Settings', desc: '', args: []);
  }

  /// `Sign up with`
  String get SignUpWith {
    return Intl.message('Sign up with', name: 'SignUpWith', desc: '', args: []);
  }

  /// `Sign up with email`
  String get SignUpWithEmail {
    return Intl.message(
      'Sign up with email',
      name: 'SignUpWithEmail',
      desc: '',
      args: [],
    );
  }

  /// `Sign up with mail`
  String get SignUpWithMail {
    return Intl.message(
      'Sign up with mail',
      name: 'SignUpWithMail',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong`
  String get SomethingWentWrong {
    return Intl.message(
      'Something went wrong',
      name: 'SomethingWentWrong',
      desc: '',
      args: [],
    );
  }

  /// `Storage and data`
  String get StorageAndData {
    return Intl.message(
      'Storage and data',
      name: 'StorageAndData',
      desc: '',
      args: [],
    );
  }

  /// `Welcome back sign in using`
  String get WelcomeBackSignInUsing {
    return Intl.message(
      'Welcome back sign in using',
      name: 'WelcomeBackSignInUsing',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get Yes {
    return Intl.message('Yes', name: 'Yes', desc: '', args: []);
  }

  /// `Your email`
  String get YourEmail {
    return Intl.message('Your email', name: 'YourEmail', desc: '', args: []);
  }

  /// `Your name`
  String get YourName {
    return Intl.message('Your name', name: 'YourName', desc: '', args: []);
  }

  /// `Error: {x}`
  String ErrorMsg(Object x) {
    return Intl.message('Error: $x', name: 'ErrorMsg', desc: '', args: [x]);
  }

  /// `Couldn't find the user, please try again`
  String get CouldntFindTheUser {
    return Intl.message(
      'Couldn\'t find the user, please try again',
      name: 'CouldntFindTheUser',
      desc: '',
      args: [],
    );
  }

  /// `Editing`
  String get Editing {
    return Intl.message('Editing', name: 'Editing', desc: '', args: []);
  }

  /// `Cancel`
  String get Cancel {
    return Intl.message('Cancel', name: 'Cancel', desc: '', args: []);
  }

  /// `Save`
  String get Save {
    return Intl.message('Save', name: 'Save', desc: '', args: []);
  }

  /// `Enter new value`
  String get EnterNewValue {
    return Intl.message(
      'Enter new value',
      name: 'EnterNewValue',
      desc: '',
      args: [],
    );
  }

  /// `Select your address`
  String get SelectYourAddress {
    return Intl.message(
      'Select your address',
      name: 'SelectYourAddress',
      desc: '',
      args: [],
    );
  }

  /// `Active now`
  String get ActiveNow {
    return Intl.message('Active now', name: 'ActiveNow', desc: '', args: []);
  }

  /// `Is't active now`
  String get ActiveNotNow {
    return Intl.message(
      'Is\'t active now',
      name: 'ActiveNotNow',
      desc: '',
      args: [],
    );
  }

  /// `Under development`
  String get UnderDevelopment {
    return Intl.message(
      'Under development',
      name: 'UnderDevelopment',
      desc: '',
      args: [],
    );
  }

  /// `My contact`
  String get MyContact {
    return Intl.message('My contact', name: 'MyContact', desc: '', args: []);
  }

  /// `No one was found`
  String get NoOneWasFound {
    return Intl.message(
      'No one was found',
      name: 'NoOneWasFound',
      desc: '',
      args: [],
    );
  }

  /// `There's no one here yet, find your first friends`
  String get FindYourFirstFriends {
    return Intl.message(
      'There\'s no one here yet, find your first friends',
      name: 'FindYourFirstFriends',
      desc: '',
      args: [],
    );
  }

  /// `Start your search`
  String get StartYourSearch {
    return Intl.message(
      'Start your search',
      name: 'StartYourSearch',
      desc: '',
      args: [],
    );
  }

  /// `Incoming requests`
  String get IncomingRequests {
    return Intl.message(
      'Incoming requests',
      name: 'IncomingRequests',
      desc: '',
      args: [],
    );
  }

  /// `No chats yet`
  String get NoChatsYet {
    return Intl.message('No chats yet', name: 'NoChatsYet', desc: '', args: []);
  }

  /// `Start a conversation with your friends and family`
  String get NoChatsYetDescription {
    return Intl.message(
      'Start a conversation with your friends and family',
      name: 'NoChatsYetDescription',
      desc: '',
      args: [],
    );
  }

  /// `Find friends`
  String get FindFriends {
    return Intl.message(
      'Find friends',
      name: 'FindFriends',
      desc: '',
      args: [],
    );
  }

  /// `Selected`
  String get Selected {
    return Intl.message('Selected', name: 'Selected', desc: '', args: []);
  }

  /// `Home`
  String get Home {
    return Intl.message('Home', name: 'Home', desc: '', args: []);
  }

  /// `Are you sure you want to delete the selected message?`
  String get AreYouSureToDeleteThisMessage {
    return Intl.message(
      'Are you sure you want to delete the selected message?',
      name: 'AreYouSureToDeleteThisMessage',
      desc: '',
      args: [],
    );
  }

  /// `Delete this message for everyone?`
  String get DeleteThisMessageForAll {
    return Intl.message(
      'Delete this message for everyone?',
      name: 'DeleteThisMessageForAll',
      desc: '',
      args: [],
    );
  }

  /// `just now`
  String get JustNow {
    return Intl.message('just now', name: 'JustNow', desc: '', args: []);
  }

  /// `{count, plural, one{{count} second ago} other{{count} seconds ago}}`
  String SecondsAgo(int count) {
    return Intl.plural(
      count,
      one: '$count second ago',
      other: '$count seconds ago',
      name: 'SecondsAgo',
      desc: '',
      args: [count],
    );
  }

  /// `{count, plural, one{{count} minute ago} other{{count} minutes ago}}`
  String MinutesAgo(int count) {
    return Intl.plural(
      count,
      one: '$count minute ago',
      other: '$count minutes ago',
      name: 'MinutesAgo',
      desc: '',
      args: [count],
    );
  }

  /// `{count, plural, one{{count} hour ago} other{{count} hours ago}}`
  String HoursAgo(int count) {
    return Intl.plural(
      count,
      one: '$count hour ago',
      other: '$count hours ago',
      name: 'HoursAgo',
      desc: '',
      args: [count],
    );
  }

  /// `{count, plural, one{{count} day ago} other{{count} days ago}}`
  String DaysAgo(int count) {
    return Intl.plural(
      count,
      one: '$count day ago',
      other: '$count days ago',
      name: 'DaysAgo',
      desc: '',
      args: [count],
    );
  }

  /// `{count, plural, one{{count} month ago} other{{count} months ago}}`
  String MonthsAgo(int count) {
    return Intl.plural(
      count,
      one: '$count month ago',
      other: '$count months ago',
      name: 'MonthsAgo',
      desc: '',
      args: [count],
    );
  }

  /// `{count, plural, one{{count} year ago} other{{count} years ago}}`
  String YearsAgo(int count) {
    return Intl.plural(
      count,
      one: '$count year ago',
      other: '$count years ago',
      name: 'YearsAgo',
      desc: '',
      args: [count],
    );
  }

  /// `Calls are coming soon`
  String get callsAreComingSoon {
    return Intl.message(
      'Calls are coming soon',
      name: 'callsAreComingSoon',
      desc: '',
      args: [],
    );
  }

  /// `No account?`
  String get NoAccount {
    return Intl.message('No account?', name: 'NoAccount', desc: '', args: []);
  }

  /// `This field cannot be empty`
  String get ThisFieldCannotBeEmpty {
    return Intl.message(
      'This field cannot be empty',
      name: 'ThisFieldCannotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Today`
  String get Today {
    return Intl.message('Today', name: 'Today', desc: '', args: []);
  }

  /// `edited`
  String get Edited {
    return Intl.message('edited', name: 'Edited', desc: '', args: []);
  }

  /// `Reply`
  String get Reply {
    return Intl.message('Reply', name: 'Reply', desc: '', args: []);
  }

  /// `Forward`
  String get Forward {
    return Intl.message('Forward', name: 'Forward', desc: '', args: []);
  }

  /// `Edit`
  String get Edit {
    return Intl.message('Edit', name: 'Edit', desc: '', args: []);
  }

  /// `Copy`
  String get Copy {
    return Intl.message('Copy', name: 'Copy', desc: '', args: []);
  }

  /// `Select`
  String get Select {
    return Intl.message('Select', name: 'Select', desc: '', args: []);
  }

  /// `Delete`
  String get Delete {
    return Intl.message('Delete', name: 'Delete', desc: '', args: []);
  }

  /// `Editing message`
  String get EditingMessage {
    return Intl.message(
      'Editing message',
      name: 'EditingMessage',
      desc: '',
      args: [],
    );
  }

  /// `Write your message`
  String get WriteYourMessage {
    return Intl.message(
      'Write your message',
      name: 'WriteYourMessage',
      desc: '',
      args: [],
    );
  }

  /// `Display name`
  String get DisplayName {
    return Intl.message(
      'Display name',
      name: 'DisplayName',
      desc: '',
      args: [],
    );
  }

  /// `Email address`
  String get EmailAddress {
    return Intl.message(
      'Email address',
      name: 'EmailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get Address {
    return Intl.message('Address', name: 'Address', desc: '', args: []);
  }

  /// `Phone number`
  String get PhoneNumber {
    return Intl.message(
      'Phone number',
      name: 'PhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Created at`
  String get CreatedAt {
    return Intl.message('Created at', name: 'CreatedAt', desc: '', args: []);
  }

  /// `Media shared`
  String get MediaShared {
    return Intl.message(
      'Media shared',
      name: 'MediaShared',
      desc: '',
      args: [],
    );
  }

  /// `View all`
  String get ViewAll {
    return Intl.message('View all', name: 'ViewAll', desc: '', args: []);
  }

  /// `An error occurred: {error}`
  String AnErrorOccurred(Object error) {
    return Intl.message(
      'An error occurred: $error',
      name: 'AnErrorOccurred',
      desc: '',
      args: [error],
    );
  }

  /// `Never give up 💪`
  String get DefaultUserStatus {
    return Intl.message(
      'Never give up 💪',
      name: 'DefaultUserStatus',
      desc: '',
      args: [],
    );
  }

  /// `Your address`
  String get YourAddress {
    return Intl.message(
      'Your address',
      name: 'YourAddress',
      desc: '',
      args: [],
    );
  }

  /// `Address cannot be empty`
  String get AddressCannotBeEmpty {
    return Intl.message(
      'Address cannot be empty',
      name: 'AddressCannotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Couldn't create chat`
  String get CouldntCreateChat {
    return Intl.message(
      'Couldn\'t create chat',
      name: 'CouldntCreateChat',
      desc: '',
      args: [],
    );
  }

  /// `Not implemented`
  String get NotImplemented {
    return Intl.message(
      'Not implemented',
      name: 'NotImplemented',
      desc: '',
      args: [],
    );
  }

  /// `Enter email`
  String get EnterEmail {
    return Intl.message('Enter email', name: 'EnterEmail', desc: '', args: []);
  }

  /// `Enter a valid email`
  String get EnterValidEmail {
    return Intl.message(
      'Enter a valid email',
      name: 'EnterValidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Email must contain @`
  String get EmailMustContainAt {
    return Intl.message(
      'Email must contain @',
      name: 'EmailMustContainAt',
      desc: '',
      args: [],
    );
  }

  /// `Invalid domain`
  String get InvalidDomain {
    return Intl.message(
      'Invalid domain',
      name: 'InvalidDomain',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 6 characters`
  String get PasswordMinLength {
    return Intl.message(
      'Password must be at least 6 characters',
      name: 'PasswordMinLength',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get PasswordsDoNotMatch {
    return Intl.message(
      'Passwords do not match',
      name: 'PasswordsDoNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `Invalid phone number`
  String get InvalidPhoneNumber {
    return Intl.message(
      'Invalid phone number',
      name: 'InvalidPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `User not found`
  String get FailureUserNotFound {
    return Intl.message(
      'User not found',
      name: 'FailureUserNotFound',
      desc: '',
      args: [],
    );
  }

  /// `No internet connection`
  String get FailureNoInternetConnection {
    return Intl.message(
      'No internet connection',
      name: 'FailureNoInternetConnection',
      desc: '',
      args: [],
    );
  }

  /// `Server error, please try again later`
  String get FailureServerError {
    return Intl.message(
      'Server error, please try again later',
      name: 'FailureServerError',
      desc: '',
      args: [],
    );
  }

  /// `Authorization required`
  String get FailureUnauthorized {
    return Intl.message(
      'Authorization required',
      name: 'FailureUnauthorized',
      desc: '',
      args: [],
    );
  }

  /// `Insufficient permissions`
  String get FailureForbidden {
    return Intl.message(
      'Insufficient permissions',
      name: 'FailureForbidden',
      desc: '',
      args: [],
    );
  }

  /// `Please check the entered data`
  String get FailureValidation {
    return Intl.message(
      'Please check the entered data',
      name: 'FailureValidation',
      desc: '',
      args: [],
    );
  }

  /// `Unknown error`
  String get FailureUnknown {
    return Intl.message(
      'Unknown error',
      name: 'FailureUnknown',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email or password`
  String get FailureWrongCredentials {
    return Intl.message(
      'Invalid email or password',
      name: 'FailureWrongCredentials',
      desc: '',
      args: [],
    );
  }

  /// `Account disabled`
  String get FailureAccountDisabled {
    return Intl.message(
      'Account disabled',
      name: 'FailureAccountDisabled',
      desc: '',
      args: [],
    );
  }

  /// `Session expired, please sign in again`
  String get FailureSessionExpired {
    return Intl.message(
      'Session expired, please sign in again',
      name: 'FailureSessionExpired',
      desc: '',
      args: [],
    );
  }

  /// `Email is already in use`
  String get FailureEmailAlreadyInUse {
    return Intl.message(
      'Email is already in use',
      name: 'FailureEmailAlreadyInUse',
      desc: '',
      args: [],
    );
  }

  /// `Too many requests, please try again later`
  String get FailureTooManyRequests {
    return Intl.message(
      'Too many requests, please try again later',
      name: 'FailureTooManyRequests',
      desc: '',
      args: [],
    );
  }

  /// `Operation not allowed`
  String get FailureOperationNotAllowed {
    return Intl.message(
      'Operation not allowed',
      name: 'FailureOperationNotAllowed',
      desc: '',
      args: [],
    );
  }

  /// `This email is already in use`
  String get FailureUserEmailTaken {
    return Intl.message(
      'This email is already in use',
      name: 'FailureUserEmailTaken',
      desc: '',
      args: [],
    );
  }

  /// `Unsupported file format. Allowed: JPG, PNG, WEBP, GIF`
  String get FailureInvalidFileType {
    return Intl.message(
      'Unsupported file format. Allowed: JPG, PNG, WEBP, GIF',
      name: 'FailureInvalidFileType',
      desc: '',
      args: [],
    );
  }

  /// `File is too large. Maximum size is 5MB`
  String get FailureFileTooLarge {
    return Intl.message(
      'File is too large. Maximum size is 5MB',
      name: 'FailureFileTooLarge',
      desc: '',
      args: [],
    );
  }

  /// `Chat not found`
  String get FailureChatNotFound {
    return Intl.message(
      'Chat not found',
      name: 'FailureChatNotFound',
      desc: '',
      args: [],
    );
  }

  /// `This user is already in your contacts`
  String get FailureContactAlreadyAdded {
    return Intl.message(
      'This user is already in your contacts',
      name: 'FailureContactAlreadyAdded',
      desc: '',
      args: [],
    );
  }

  /// `Request already sent`
  String get FailureRequestAlreadySent {
    return Intl.message(
      'Request already sent',
      name: 'FailureRequestAlreadySent',
      desc: '',
      args: [],
    );
  }

  /// `You can't add yourself`
  String get FailureCannotAddYourself {
    return Intl.message(
      'You can\'t add yourself',
      name: 'FailureCannotAddYourself',
      desc: '',
      args: [],
    );
  }

  /// `Reply to {name}`
  String ReplyTo(Object name) {
    return Intl.message(
      'Reply to $name',
      name: 'ReplyTo',
      desc: '',
      args: [name],
    );
  }

  /// `You`
  String get You {
    return Intl.message('You', name: 'You', desc: '', args: []);
  }

  /// `Attachment`
  String get Attachment {
    return Intl.message('Attachment', name: 'Attachment', desc: '', args: []);
  }

  /// `Message deleted`
  String get MessageDeleted {
    return Intl.message(
      'Message deleted',
      name: 'MessageDeleted',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete the chat?`
  String get AreYouSureDeleteTheChat {
    return Intl.message(
      'Are you sure you want to delete the chat?',
      name: 'AreYouSureDeleteTheChat',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
