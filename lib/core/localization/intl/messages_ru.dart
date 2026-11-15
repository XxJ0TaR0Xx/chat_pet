// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ru locale. All the
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
  String get localeName => 'ru';

  static String m0(error) => "Произошла ошибка: ${error}";

  static String m1(count) =>
      "${Intl.plural(count, one: '${count} день назад', few: '${count} дня назад', many: '${count} дней назад', other: '${count} дня назад')}";

  static String m2(x) => "Ошибка: ${x}";

  static String m3(count) =>
      "${Intl.plural(count, one: '${count} час назад', few: '${count} часа назад', many: '${count} часов назад', other: '${count} часа назад')}";

  static String m4(count) =>
      "${Intl.plural(count, one: '${count} минуту назад', few: '${count} минуты назад', many: '${count} минут назад', other: '${count} минуты назад')}";

  static String m5(count) =>
      "${Intl.plural(count, one: '${count} месяц назад', few: '${count} месяца назад', many: '${count} месяцев назад', other: '${count} месяца назад')}";

  static String m6(name) => "Ответ: ${name}";

  static String m7(count) =>
      "${Intl.plural(count, one: '${count} секунду назад', few: '${count} секунды назад', many: '${count} секунд назад', other: '${count} секунды назад')}";

  static String m8(count) =>
      "${Intl.plural(count, one: '${count} год назад', few: '${count} года назад', many: '${count} лет назад', other: '${count} года назад')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "Account": MessageLookupByLibrary.simpleMessage("Аккаунт"),
    "ActiveNotNow": MessageLookupByLibrary.simpleMessage("Не в сети"),
    "ActiveNow": MessageLookupByLibrary.simpleMessage("В сети"),
    "Address": MessageLookupByLibrary.simpleMessage("Адрес"),
    "AddressCannotBeEmpty": MessageLookupByLibrary.simpleMessage(
      "Адрес не может быть пустым",
    ),
    "AfterYouLogOut": MessageLookupByLibrary.simpleMessage(
      "После того как вы выйдите, необходимо будет снова войти в аккаунт для корректной работы приложения",
    ),
    "AnErrorOccurred": m0,
    "AreYouSureToDeleteThisMessage": MessageLookupByLibrary.simpleMessage(
      "Вы уверены что хотите удалить выбранное сообщение?",
    ),
    "AreYouSureYouWantToGetOut": MessageLookupByLibrary.simpleMessage(
      "Вы уверены что хотите выйти?",
    ),
    "Attachment": MessageLookupByLibrary.simpleMessage("Вложение"),
    "Calls": MessageLookupByLibrary.simpleMessage("Calls"),
    "Cancel": MessageLookupByLibrary.simpleMessage("Отменить"),
    "Chat": MessageLookupByLibrary.simpleMessage("Чат"),
    "ChatHistoryThemeWallpapers": MessageLookupByLibrary.simpleMessage(
      "История чата,тема,обои для рабочего стола",
    ),
    "Chatbox": MessageLookupByLibrary.simpleMessage("Chatbox"),
    "ConfirmPassword": MessageLookupByLibrary.simpleMessage("Confirm password"),
    "ConnectFriendsEasilyQuickly": MessageLookupByLibrary.simpleMessage(
      "Connect friends easily quickly",
    ),
    "Contacts": MessageLookupByLibrary.simpleMessage("Contacts"),
    "Copy": MessageLookupByLibrary.simpleMessage("Скопировать"),
    "CouldntCreateChat": MessageLookupByLibrary.simpleMessage(
      "Не удалось создать чат",
    ),
    "CouldntFindTheUser": MessageLookupByLibrary.simpleMessage(
      "Couldn\'t find the user, please try again",
    ),
    "CreateAnAccount": MessageLookupByLibrary.simpleMessage(
      "Create an account",
    ),
    "CreatedAt": MessageLookupByLibrary.simpleMessage("Дата регистрации"),
    "DaysAgo": m1,
    "DefaultUserStatus": MessageLookupByLibrary.simpleMessage(
      "Никогда не сдавайся 💪",
    ),
    "Delete": MessageLookupByLibrary.simpleMessage("Удалить"),
    "DeleteThisMessageForAll": MessageLookupByLibrary.simpleMessage(
      "Удалить это сообщение для всех?",
    ),
    "DevelopmentServer": MessageLookupByLibrary.simpleMessage(
      "Dev — сервер разработки",
    ),
    "DisplayName": MessageLookupByLibrary.simpleMessage("Отображаемое имя"),
    "Edit": MessageLookupByLibrary.simpleMessage("Изменить"),
    "Edited": MessageLookupByLibrary.simpleMessage("изменено"),
    "Editing": MessageLookupByLibrary.simpleMessage("Редактирование"),
    "EditingMessage": MessageLookupByLibrary.simpleMessage(
      "Редактирование сообщения",
    ),
    "Email": MessageLookupByLibrary.simpleMessage("Email"),
    "EmailAddress": MessageLookupByLibrary.simpleMessage("Электронная почта"),
    "EmailMustContainAt": MessageLookupByLibrary.simpleMessage(
      "Email должен содержать @",
    ),
    "EnterEmail": MessageLookupByLibrary.simpleMessage("Введите email"),
    "EnterNewValue": MessageLookupByLibrary.simpleMessage(
      "Введите новое значение",
    ),
    "EnterValidEmail": MessageLookupByLibrary.simpleMessage(
      "Введите корректный email",
    ),
    "ErrorMsg": m2,
    "ExistingAccount": MessageLookupByLibrary.simpleMessage(
      "Existing account? ",
    ),
    "FailureAccountDisabled": MessageLookupByLibrary.simpleMessage(
      "Аккаунт заблокирован",
    ),
    "FailureCannotAddYourself": MessageLookupByLibrary.simpleMessage(
      "Нельзя добавить самого себя",
    ),
    "FailureChatNotFound": MessageLookupByLibrary.simpleMessage(
      "Чат не найден",
    ),
    "FailureContactAlreadyAdded": MessageLookupByLibrary.simpleMessage(
      "Этот пользователь уже в контактах",
    ),
    "FailureEmailAlreadyInUse": MessageLookupByLibrary.simpleMessage(
      "Email уже используется",
    ),
    "FailureFileTooLarge": MessageLookupByLibrary.simpleMessage(
      "Файл слишком большой. Максимум 5MB",
    ),
    "FailureForbidden": MessageLookupByLibrary.simpleMessage(
      "Недостаточно прав",
    ),
    "FailureInvalidFileType": MessageLookupByLibrary.simpleMessage(
      "Недопустимый формат файла. Разрешены: JPG, PNG, WEBP, GIF",
    ),
    "FailureNoInternetConnection": MessageLookupByLibrary.simpleMessage(
      "Нет подключения к интернету",
    ),
    "FailureOperationNotAllowed": MessageLookupByLibrary.simpleMessage(
      "Операция не разрешена",
    ),
    "FailureRequestAlreadySent": MessageLookupByLibrary.simpleMessage(
      "Заявка уже отправлена",
    ),
    "FailureServerError": MessageLookupByLibrary.simpleMessage(
      "Ошибка сервера, попробуйте позже",
    ),
    "FailureSessionExpired": MessageLookupByLibrary.simpleMessage(
      "Сессия истекла, войдите снова",
    ),
    "FailureTooManyRequests": MessageLookupByLibrary.simpleMessage(
      "Слишком много запросов, попробуйте позже",
    ),
    "FailureUnauthorized": MessageLookupByLibrary.simpleMessage(
      "Необходима авторизация",
    ),
    "FailureUnknown": MessageLookupByLibrary.simpleMessage(
      "Неизвестная ошибка",
    ),
    "FailureUserEmailTaken": MessageLookupByLibrary.simpleMessage(
      "Этот email уже используется",
    ),
    "FailureUserNotFound": MessageLookupByLibrary.simpleMessage(
      "Пользователь не найден",
    ),
    "FailureValidation": MessageLookupByLibrary.simpleMessage(
      "Проверьте правильность введённых данных",
    ),
    "FailureWrongCredentials": MessageLookupByLibrary.simpleMessage(
      "Неверный email или пароль",
    ),
    "FindFriends": MessageLookupByLibrary.simpleMessage("Найти друзей"),
    "FindYourFirstFriends": MessageLookupByLibrary.simpleMessage(
      "Здесь пока никого нет, найдите своих первых друзей",
    ),
    "ForgotPassword": MessageLookupByLibrary.simpleMessage("Forgot password"),
    "Forward": MessageLookupByLibrary.simpleMessage("Переслать"),
    "GetChattingWithFriends": MessageLookupByLibrary.simpleMessage(
      "Get chatting with friends",
    ),
    "Help": MessageLookupByLibrary.simpleMessage("Помощь"),
    "HelpCenter": MessageLookupByLibrary.simpleMessage(
      "Справочный центр, свяжитесь с нами, политика конфиденциальности",
    ),
    "Home": MessageLookupByLibrary.simpleMessage("Домой"),
    "HoursAgo": m3,
    "IncomingRequests": MessageLookupByLibrary.simpleMessage(
      "Входящие запросы",
    ),
    "InitializingApplication": MessageLookupByLibrary.simpleMessage(
      "Запускаем приложение…",
    ),
    "InvalidDomain": MessageLookupByLibrary.simpleMessage("Некорректный домен"),
    "InvalidPhoneNumber": MessageLookupByLibrary.simpleMessage(
      "Номер телефона неверен",
    ),
    "InviteAFriend": MessageLookupByLibrary.simpleMessage("Пригласить друзей"),
    "JustNow": MessageLookupByLibrary.simpleMessage("только что"),
    "LogIn": MessageLookupByLibrary.simpleMessage("Log in"),
    "LogInToChatbox": MessageLookupByLibrary.simpleMessage("Log in to Chatbox"),
    "LogOutOfYouAccount": MessageLookupByLibrary.simpleMessage(
      "Выйдите из своей учетной записи",
    ),
    "MediaShared": MessageLookupByLibrary.simpleMessage("Общие медиафайлы"),
    "Message": MessageLookupByLibrary.simpleMessage("Message"),
    "MessageDeleted": MessageLookupByLibrary.simpleMessage("Сообщение удалено"),
    "MinutesAgo": m4,
    "MonthsAgo": m5,
    "MyContact": MessageLookupByLibrary.simpleMessage("Мои контакты"),
    "NetworkUsage": MessageLookupByLibrary.simpleMessage(
      "Использование сети, использование данных",
    ),
    "NewMessage": MessageLookupByLibrary.simpleMessage("Новое сообщение"),
    "No": MessageLookupByLibrary.simpleMessage("Нет"),
    "NoAccount": MessageLookupByLibrary.simpleMessage("Нет аккаунта?"),
    "NoChatsYet": MessageLookupByLibrary.simpleMessage("Пока нет чатов"),
    "NoChatsYetDescription": MessageLookupByLibrary.simpleMessage(
      "Начните переписку с друзьями и близкими",
    ),
    "NoOneWasFound": MessageLookupByLibrary.simpleMessage("Никто не найден"),
    "NotFounded": MessageLookupByLibrary.simpleMessage("Not founded"),
    "NotImplemented": MessageLookupByLibrary.simpleMessage("Не реализовано"),
    "Notifications": MessageLookupByLibrary.simpleMessage("Уведомления"),
    "Or": MessageLookupByLibrary.simpleMessage("Or"),
    "OurChatAppIsThePerfectWay": MessageLookupByLibrary.simpleMessage(
      "Our chat app is the perfect way to stay connected with friends and family.",
    ),
    "Password": MessageLookupByLibrary.simpleMessage("Password"),
    "PasswordMinLength": MessageLookupByLibrary.simpleMessage(
      "Пароль должен содержать не менее 6 символов",
    ),
    "PasswordsDoNotMatch": MessageLookupByLibrary.simpleMessage(
      "Пароли не совпадают",
    ),
    "PhoneNumber": MessageLookupByLibrary.simpleMessage("Номер телефона"),
    "PrivacySecurityChange": MessageLookupByLibrary.simpleMessage(
      "Конфиденциальность, безопасность, смена номера",
    ),
    "ProductionServer": MessageLookupByLibrary.simpleMessage(
      "Prod — основной сервер",
    ),
    "Repeat": MessageLookupByLibrary.simpleMessage("Повторить"),
    "Reply": MessageLookupByLibrary.simpleMessage("Ответить"),
    "ReplyTo": m6,
    "RestartAfterInitializationFailure": MessageLookupByLibrary.simpleMessage(
      "Ошибка инициализации. Перезапустите приложение, чтобы попробовать снова.",
    ),
    "Save": MessageLookupByLibrary.simpleMessage("Сохранить"),
    "SecondsAgo": m7,
    "Select": MessageLookupByLibrary.simpleMessage("Выбрать"),
    "SelectServer": MessageLookupByLibrary.simpleMessage("Выберите сервер"),
    "SelectServerDescription": MessageLookupByLibrary.simpleMessage(
      "Выберите сервер для этой сессии. Для смены сервера перезапустите приложение.",
    ),
    "SelectYourAddress": MessageLookupByLibrary.simpleMessage(
      "Выберите ваш адресс",
    ),
    "Selected": MessageLookupByLibrary.simpleMessage("Выбрано"),
    "ServerInitializationFailed": MessageLookupByLibrary.simpleMessage(
      "Не удалось запустить приложение",
    ),
    "Setting": MessageLookupByLibrary.simpleMessage("Настройки"),
    "Settings": MessageLookupByLibrary.simpleMessage("Settings"),
    "SignUpWith": MessageLookupByLibrary.simpleMessage("Sign up with"),
    "SignUpWithEmail": MessageLookupByLibrary.simpleMessage(
      "Sign up with email",
    ),
    "SignUpWithMail": MessageLookupByLibrary.simpleMessage("Sign up with mail"),
    "SomethingWentWrong": MessageLookupByLibrary.simpleMessage(
      "Что-то пошло не так",
    ),
    "StartYourSearch": MessageLookupByLibrary.simpleMessage("Начните поиски"),
    "StorageAndData": MessageLookupByLibrary.simpleMessage(
      "Хранение и передача данных",
    ),
    "ThisFieldCannotBeEmpty": MessageLookupByLibrary.simpleMessage(
      "Это поле не может быть пустым",
    ),
    "Today": MessageLookupByLibrary.simpleMessage("Сегодня"),
    "UnderDevelopment": MessageLookupByLibrary.simpleMessage(
      "Under development",
    ),
    "ViewAll": MessageLookupByLibrary.simpleMessage("Показать все"),
    "WelcomeBackSignInUsing": MessageLookupByLibrary.simpleMessage(
      "Welcome back sign in using",
    ),
    "WriteYourMessage": MessageLookupByLibrary.simpleMessage(
      "Напишите сообщение",
    ),
    "YearsAgo": m8,
    "Yes": MessageLookupByLibrary.simpleMessage("Да"),
    "You": MessageLookupByLibrary.simpleMessage("Вы"),
    "YourAddress": MessageLookupByLibrary.simpleMessage("Ваш адрес"),
    "YourEmail": MessageLookupByLibrary.simpleMessage("Ваша почта"),
    "YourName": MessageLookupByLibrary.simpleMessage("Ваше имя"),
    "callsAreComingSoon": MessageLookupByLibrary.simpleMessage(
      "Звонки скоро появятся",
    ),
  };
}
