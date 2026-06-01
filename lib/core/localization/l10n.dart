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
