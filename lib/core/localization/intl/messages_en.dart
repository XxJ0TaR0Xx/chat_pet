// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(error) => "An error occurred: ${error}";

  static String m1(count) =>
      "${Intl.plural(count, one: '${count} day ago', other: '${count} days ago')}";

  static String m2(x) => "Error: ${x}";

  static String m3(count) =>
      "${Intl.plural(count, one: '${count} hour ago', other: '${count} hours ago')}";

  static String m4(count) =>
      "${Intl.plural(count, one: '${count} minute ago', other: '${count} minutes ago')}";

  static String m5(count) =>
      "${Intl.plural(count, one: '${count} month ago', other: '${count} months ago')}";

  static String m6(count) =>
      "${Intl.plural(count, one: '${count} second ago', other: '${count} seconds ago')}";

  static String m7(count) =>
      "${Intl.plural(count, one: '${count} year ago', other: '${count} years ago')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "Account": MessageLookupByLibrary.simpleMessage("Account"),
    "ActiveNotNow": MessageLookupByLibrary.simpleMessage("Is\'t active now"),
    "ActiveNow": MessageLookupByLibrary.simpleMessage("Active now"),
    "Address": MessageLookupByLibrary.simpleMessage("Address"),
    "AddressCannotBeEmpty": MessageLookupByLibrary.simpleMessage(
      "Address cannot be empty",
    ),
    "AfterYouLogOut": MessageLookupByLibrary.simpleMessage(
      "After you log out, you will need to log in to your account again for the app to work properly",
    ),
    "AnErrorOccurred": m0,
    "AreYouSureToDeleteThisMessage": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to delete the selected message?",
    ),
    "AreYouSureYouWantToGetOut": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to get out?",
    ),
    "Calls": MessageLookupByLibrary.simpleMessage("Calls"),
    "Cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
    "Chat": MessageLookupByLibrary.simpleMessage("Chat"),
    "ChatHistoryThemeWallpapers": MessageLookupByLibrary.simpleMessage(
      "Chat history,theme,wallpapers",
    ),
    "Chatbox": MessageLookupByLibrary.simpleMessage("Chatbox"),
    "ConfirmPassword": MessageLookupByLibrary.simpleMessage("Confirm password"),
    "ConnectFriendsEasilyQuickly": MessageLookupByLibrary.simpleMessage(
      "Connect friends easily quickly",
    ),
    "Contacts": MessageLookupByLibrary.simpleMessage("Contacts"),
    "Copy": MessageLookupByLibrary.simpleMessage("Copy"),
    "CouldntCreateChat": MessageLookupByLibrary.simpleMessage(
      "Couldn\'t create chat",
    ),
    "CouldntFindTheUser": MessageLookupByLibrary.simpleMessage(
      "Couldn\'t find the user, please try again",
    ),
    "CreateAnAccount": MessageLookupByLibrary.simpleMessage(
      "Create an account",
    ),
    "CreatedAt": MessageLookupByLibrary.simpleMessage("Created at"),
    "DaysAgo": m1,
    "DefaultUserStatus": MessageLookupByLibrary.simpleMessage(
      "Never give up 💪",
    ),
    "Delete": MessageLookupByLibrary.simpleMessage("Delete"),
    "DeleteThisMessageForAll": MessageLookupByLibrary.simpleMessage(
      "Delete this message for everyone?",
    ),
    "DisplayName": MessageLookupByLibrary.simpleMessage("Display name"),
    "Edit": MessageLookupByLibrary.simpleMessage("Edit"),
    "Edited": MessageLookupByLibrary.simpleMessage("edited"),
    "Editing": MessageLookupByLibrary.simpleMessage("Editing"),
    "EditingMessage": MessageLookupByLibrary.simpleMessage("Editing message"),
    "Email": MessageLookupByLibrary.simpleMessage("Email"),
    "EmailAddress": MessageLookupByLibrary.simpleMessage("Email address"),
    "EmailMustContainAt": MessageLookupByLibrary.simpleMessage(
      "Email must contain @",
    ),
    "EnterEmail": MessageLookupByLibrary.simpleMessage("Enter email"),
    "EnterNewValue": MessageLookupByLibrary.simpleMessage("Enter new value"),
    "EnterValidEmail": MessageLookupByLibrary.simpleMessage(
      "Enter a valid email",
    ),
    "ErrorMsg": m2,
    "ExistingAccount": MessageLookupByLibrary.simpleMessage("Existing account"),
    "FailureAccountDisabled": MessageLookupByLibrary.simpleMessage(
      "Account disabled",
    ),
    "FailureCannotAddYourself": MessageLookupByLibrary.simpleMessage(
      "You can\'t add yourself",
    ),
    "FailureChatNotFound": MessageLookupByLibrary.simpleMessage(
      "Chat not found",
    ),
    "FailureContactAlreadyAdded": MessageLookupByLibrary.simpleMessage(
      "This user is already in your contacts",
    ),
    "FailureEmailAlreadyInUse": MessageLookupByLibrary.simpleMessage(
      "Email is already in use",
    ),
    "FailureFileTooLarge": MessageLookupByLibrary.simpleMessage(
      "File is too large. Maximum size is 5MB",
    ),
    "FailureForbidden": MessageLookupByLibrary.simpleMessage(
      "Insufficient permissions",
    ),
    "FailureInvalidFileType": MessageLookupByLibrary.simpleMessage(
      "Unsupported file format. Allowed: JPG, PNG, WEBP, GIF",
    ),
    "FailureNoInternetConnection": MessageLookupByLibrary.simpleMessage(
      "No internet connection",
    ),
    "FailureOperationNotAllowed": MessageLookupByLibrary.simpleMessage(
      "Operation not allowed",
    ),
    "FailureRequestAlreadySent": MessageLookupByLibrary.simpleMessage(
      "Request already sent",
    ),
    "FailureServerError": MessageLookupByLibrary.simpleMessage(
      "Server error, please try again later",
    ),
    "FailureSessionExpired": MessageLookupByLibrary.simpleMessage(
      "Session expired, please sign in again",
    ),
    "FailureTooManyRequests": MessageLookupByLibrary.simpleMessage(
      "Too many requests, please try again later",
    ),
    "FailureUnauthorized": MessageLookupByLibrary.simpleMessage(
      "Authorization required",
    ),
    "FailureUnknown": MessageLookupByLibrary.simpleMessage("Unknown error"),
    "FailureUserEmailTaken": MessageLookupByLibrary.simpleMessage(
      "This email is already in use",
    ),
    "FailureUserNotFound": MessageLookupByLibrary.simpleMessage(
      "User not found",
    ),
    "FailureValidation": MessageLookupByLibrary.simpleMessage(
      "Please check the entered data",
    ),
    "FailureWrongCredentials": MessageLookupByLibrary.simpleMessage(
      "Invalid email or password",
    ),
    "FindFriends": MessageLookupByLibrary.simpleMessage("Find friends"),
    "FindYourFirstFriends": MessageLookupByLibrary.simpleMessage(
      "There\'s no one here yet, find your first friends",
    ),
    "ForgotPassword": MessageLookupByLibrary.simpleMessage("Forgot password"),
    "Forward": MessageLookupByLibrary.simpleMessage("Forward"),
    "GetChattingWithFriends": MessageLookupByLibrary.simpleMessage(
      "Get chatting with friends",
    ),
    "Help": MessageLookupByLibrary.simpleMessage("Help"),
    "HelpCenter": MessageLookupByLibrary.simpleMessage(
      "Help center,contact us, privacy policy",
    ),
    "Home": MessageLookupByLibrary.simpleMessage("Home"),
    "HoursAgo": m3,
    "IncomingRequests": MessageLookupByLibrary.simpleMessage(
      "Incoming requests",
    ),
    "InvalidDomain": MessageLookupByLibrary.simpleMessage("Invalid domain"),
    "InvalidPhoneNumber": MessageLookupByLibrary.simpleMessage(
      "Invalid phone number",
    ),
    "InviteAFriend": MessageLookupByLibrary.simpleMessage("Invite a friend"),
    "JustNow": MessageLookupByLibrary.simpleMessage("just now"),
    "LogIn": MessageLookupByLibrary.simpleMessage("Log in"),
    "LogInToChatbox": MessageLookupByLibrary.simpleMessage("Log in to Chatbox"),
    "LogOutOfYouAccount": MessageLookupByLibrary.simpleMessage(
      "Log out of your account",
    ),
    "MediaShared": MessageLookupByLibrary.simpleMessage("Media shared"),
    "Message": MessageLookupByLibrary.simpleMessage("Message"),
    "MinutesAgo": m4,
    "MonthsAgo": m5,
    "MyContact": MessageLookupByLibrary.simpleMessage("My contact"),
    "NetworkUsage": MessageLookupByLibrary.simpleMessage(
      "Network usage, stogare usage",
    ),
    "NewMessage": MessageLookupByLibrary.simpleMessage("New message"),
    "No": MessageLookupByLibrary.simpleMessage("No"),
    "NoAccount": MessageLookupByLibrary.simpleMessage("No account?"),
    "NoChatsYet": MessageLookupByLibrary.simpleMessage("No chats yet"),
    "NoChatsYetDescription": MessageLookupByLibrary.simpleMessage(
      "Start a conversation with your friends and family",
    ),
    "NoOneWasFound": MessageLookupByLibrary.simpleMessage("No one was found"),
    "NotFounded": MessageLookupByLibrary.simpleMessage("Not founded"),
    "NotImplemented": MessageLookupByLibrary.simpleMessage("Not implemented"),
    "Notifications": MessageLookupByLibrary.simpleMessage("Notifications"),
    "Or": MessageLookupByLibrary.simpleMessage("Or"),
    "OurChatAppIsThePerfectWay": MessageLookupByLibrary.simpleMessage(
      "Our chat app is the perfect way to stay connected with friends and family.",
    ),
    "Password": MessageLookupByLibrary.simpleMessage("Password"),
    "PasswordMinLength": MessageLookupByLibrary.simpleMessage(
      "Password must be at least 6 characters",
    ),
    "PasswordsDoNotMatch": MessageLookupByLibrary.simpleMessage(
      "Passwords do not match",
    ),
    "PhoneNumber": MessageLookupByLibrary.simpleMessage("Phone number"),
    "PrivacySecurityChange": MessageLookupByLibrary.simpleMessage(
      "Privacy, security, change number",
    ),
    "Repeat": MessageLookupByLibrary.simpleMessage("Repeat"),
    "Reply": MessageLookupByLibrary.simpleMessage("Reply"),
    "Save": MessageLookupByLibrary.simpleMessage("Save"),
    "SecondsAgo": m6,
    "Select": MessageLookupByLibrary.simpleMessage("Select"),
    "SelectYourAddress": MessageLookupByLibrary.simpleMessage(
      "Select your address",
    ),
    "Selected": MessageLookupByLibrary.simpleMessage("Selected"),
    "Setting": MessageLookupByLibrary.simpleMessage("Setting"),
    "Settings": MessageLookupByLibrary.simpleMessage("Settings"),
    "SignUpWith": MessageLookupByLibrary.simpleMessage("Sign up with"),
    "SignUpWithEmail": MessageLookupByLibrary.simpleMessage(
      "Sign up with email",
    ),
    "SignUpWithMail": MessageLookupByLibrary.simpleMessage("Sign up with mail"),
    "SomethingWentWrong": MessageLookupByLibrary.simpleMessage(
      "Something went wrong",
    ),
    "StartYourSearch": MessageLookupByLibrary.simpleMessage(
      "Start your search",
    ),
    "StorageAndData": MessageLookupByLibrary.simpleMessage("Storage and data"),
    "ThisFieldCannotBeEmpty": MessageLookupByLibrary.simpleMessage(
      "This field cannot be empty",
    ),
    "Today": MessageLookupByLibrary.simpleMessage("Today"),
    "UnderDevelopment": MessageLookupByLibrary.simpleMessage(
      "Under development",
    ),
    "ViewAll": MessageLookupByLibrary.simpleMessage("View all"),
    "WelcomeBackSignInUsing": MessageLookupByLibrary.simpleMessage(
      "Welcome back sign in using",
    ),
    "WriteYourMessage": MessageLookupByLibrary.simpleMessage(
      "Write your message",
    ),
    "YearsAgo": m7,
    "Yes": MessageLookupByLibrary.simpleMessage("Yes"),
    "YourAddress": MessageLookupByLibrary.simpleMessage("Your address"),
    "YourEmail": MessageLookupByLibrary.simpleMessage("Your email"),
    "YourName": MessageLookupByLibrary.simpleMessage("Your name"),
    "callsAreComingSoon": MessageLookupByLibrary.simpleMessage(
      "Calls are coming soon",
    ),
  };
}
