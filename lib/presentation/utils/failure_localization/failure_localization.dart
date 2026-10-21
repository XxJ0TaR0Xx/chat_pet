import 'package:chat_pet/core/common/failures/failure.dart';
import 'package:chat_pet/core/localization/l10n.dart';
import 'package:chat_pet/domain/failures/auth_failures/auth_failure.dart';
import 'package:chat_pet/domain/failures/chat_failure/chat_failure.dart';
import 'package:chat_pet/domain/failures/contacts_failure/contacts_failure.dart';
import 'package:chat_pet/domain/failures/user_failures/user_failures.dart' as user_failures;

extension FailureLocalization on Failure {
  String localize(S s) => switch (this) {
    // --- Auth ---
    WrongCredentialsFailure() => s.FailureWrongCredentials,
    UserDisabledFailure() => s.FailureAccountDisabled,
    SessionExpiredFailure() => s.FailureSessionExpired,
    EmailAlreadyInUseFailure() => s.FailureEmailAlreadyInUse,
    TooManyRequestsFailure() => s.FailureTooManyRequests,
    OperationNotAllowedFailure() => s.FailureOperationNotAllowed,

    // --- User ---
    user_failures.UserEmailTakenFailure() => s.FailureUserEmailTaken,
    user_failures.UserInvalidFileTypeFailure() => s.FailureInvalidFileType,
    user_failures.UserFileTooLargeFailure() => s.FailureFileTooLarge,

    // --- Chat ---
    ChatNotFoundFailure() => s.FailureChatNotFound,

    // --- Contacts ---
    ContactsAlreadyAddedFailure() => s.FailureContactAlreadyAdded,
    ContactsRequestAlreadySentFailure() => s.FailureRequestAlreadySent,
    ContactsCannotAddYourselfFailure() => s.FailureCannotAddYourself,

    // --- "Not found", same copy across auth/user/contacts ---
    UserNotFoundFailure() ||
    user_failures.UserNotFoundFailure() ||
    ContactsNotFoundFailure() => s.FailureUserNotFound,

    // --- "Unauthorized", same copy across user/chat/contacts ---
    user_failures.UserUnauthorizedFailure() ||
    ChatUnauthorizedFailure() ||
    ContactsUnauthorizedFailure() => s.FailureUnauthorized,

    // --- "Forbidden", same copy across user/chat/contacts ---
    user_failures.UserForbiddenFailure() ||
    ChatForbiddenFailure() ||
    ContactsForbiddenFailure() => s.FailureForbidden,

    // --- "Validation", same copy across auth/user/chat/contacts ---
    ValidationFailure() ||
    user_failures.UserValidationFailure() ||
    ChatValidationFailure() ||
    ContactsValidationFailure() => s.FailureValidation,

    // --- "No internet connection", same copy across auth/user/chat/contacts ---
    NetworkFailure() ||
    user_failures.UserNetworkFailure() ||
    ChatNetworkFailure() ||
    ContactsNetworkFailure() => s.FailureNoInternetConnection,

    // --- "Server error", same copy across auth/user/chat/contacts ---
    ServerFailure() ||
    user_failures.UserServerFailure() ||
    ChatServerFailure() ||
    ContactsServerFailure() => s.FailureServerError,

    // --- "Unknown error", same copy across auth/user/chat/contacts ---
    UnknownAuthFailure() ||
    user_failures.UserUnknownFailure() ||
    ChatUnknownFailure() ||
    ContactsUnknownFailure() => s.FailureUnknown,

    // UnexpectedFailure, DisposedFailure and anything not mapped above are
    // internal/programmer-facing failures that should never reach the UI as-is.
    _ => s.SomethingWentWrong,
  };
}
