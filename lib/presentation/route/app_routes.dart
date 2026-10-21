abstract final class AppRoutes {
  // Root paths
  static const String loading = '/loading';
  static const String start = '/start';
  static const String chats = '/chats';
  static const String calls = '/calls';
  static const String contacts = '/contacts';
  static const String settings = '/settings';
  static const String map = 'map';

  // Child segments — used in GoRoute.path for nested routes
  static const String loginSegment = 'login';
  static const String signUpSegment = 'sing-up';
  static const String profileSegment = 'profile';
  static const String chatSegment = ':id';
  static const String newContacts = 'new-contacts';
  static const String selectContactSegment = 'select';

  // Full paths — used for navigation (push/go/redirect)
  static const String login = '$start/$loginSegment';
  static const String signUp = '$start/$signUpSegment';
  static const String settingsProfile = '$settings/$profileSegment';
  static const String chatId = '$chats/$chatSegment';
  static const String findNewContacts = '$contacts/$newContacts';
  static const String selectContact = '$contacts/$selectContactSegment';
  static const String settingsProfileMap = '$settings/$profileSegment/$map';
}
