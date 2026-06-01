abstract final class AppRoutes {
  // Root paths
  static const String loading = '/loading';
  static const String start = '/start';
  static const String chats = '/chats';
  static const String calls = '/calls';
  static const String contacts = '/contacts';
  static const String settings = '/settings';

  // Child segments — used in GoRoute.path for nested routes
  static const String loginSegment = 'login';
  static const String signUpSegment = 'sing-up';
  static const String profileSegment = 'profile';
  static const String chatSegment = ':id';

  // Full paths — used for navigation (push/go/redirect)
  static const String login = '$start/$loginSegment';
  static const String signUp = '$start/$signUpSegment';
  static const String settingsProfile = '$settings/$profileSegment';
  static const String chatId = '$chats/$chatSegment';
}
