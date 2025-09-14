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

  /// `Or`
  String get Or {
    return Intl.message('Or', name: 'Or', desc: '', args: []);
  }

  /// `Our chat appIs the perfect way`
  String get OurChatAppIsThePerfectWay {
    return Intl.message(
      'Our chat appIs the perfect way',
      name: 'OurChatAppIsThePerfectWay',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get Password {
    return Intl.message('Password', name: 'Password', desc: '', args: []);
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

  /// `Welcome back sign in using`
  String get WelcomeBackSignInUsing {
    return Intl.message(
      'Welcome back sign in using',
      name: 'WelcomeBackSignInUsing',
      desc: '',
      args: [],
    );
  }

  /// `Your email`
  String get YourEmail {
    return Intl.message('Your email', name: 'YourEmail', desc: '', args: []);
  }

  /// `Your name`
  String get YourName {
    return Intl.message('Your name', name: 'YourName', desc: '', args: []);
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
