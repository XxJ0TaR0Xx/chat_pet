import 'package:chat_pet/domain/failures/auth_failures/auth_failure.dart';
import 'package:chat_pet/domain/interfaces/auth/auth_repository.dart';
import 'package:chat_pet/domain/interfaces/registration/registration_repository.dart';
import 'package:chat_pet/domain/models/user/user_model.dart';
import 'package:chat_pet/domain/usecases/auth/login_use_case.dart';
import 'package:chat_pet/domain/usecases/auth/logout_use_case.dart';
import 'package:chat_pet/domain/usecases/auth/registration_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth_user_case_test.mocks.dart';

@GenerateMocks([AuthRepository, RegistrationRepository])
void main() {
  provideDummy<Either<AuthFailure, void>>(const Right(null));
  provideDummy<Either<AuthFailure, UserModel>>(const Right(UserModel(id: '', userTag: '')));

  late MockAuthRepository mockAuthRepository;
  late MockRegistrationRepository mockRegistrationRepository;

  late LoginUseCase loginUseCase;
  late LogoutUseCase logoutUseCase;
  late RegistrationUseCase registrationUseCase;

  const email = 'test@test.com';
  const password = '123';

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    mockRegistrationRepository = MockRegistrationRepository();
  });

  group('Login Use Case', () {
    setUp(() => loginUseCase = LoginUseCase(mockAuthRepository));

    test('Success', () async {
      when(mockAuthRepository.login(email: email, password: password)).thenAnswer((_) async => const Right(null));

      await loginUseCase.call(email: email, password: password);

      verify(mockAuthRepository.login(email: email, password: password)).called(1);
    });

    test('Error', () async {
      when(
        mockAuthRepository.login(email: anyNamed('email'), password: anyNamed('password')),
      ).thenAnswer((_) async => Left(UnknownAuthFailure(stackTrace: StackTrace.current)));

      final result = await loginUseCase.call(email: '', password: '');

      expect(result.isLeft(), isTrue);
      result.fold(
        (failure) => expect(failure, isA<AuthFailure>()),
        (r) => fail('Expected Left, but got Right'),
      );
    });
  });

  group('Logout Use Case', () {
    setUp(() => logoutUseCase = LogoutUseCase(mockAuthRepository));

    test('Success', () async {
      when(mockAuthRepository.logout()).thenAnswer((_) async => const Right(null));

      await logoutUseCase.call();

      verify(mockAuthRepository.logout()).called(1);
    });

    test('Error', () async {
      when(
        mockAuthRepository.logout(),
      ).thenAnswer((_) async => Left(UnknownAuthFailure(stackTrace: StackTrace.current)));

      await logoutUseCase.call();

      verify(mockAuthRepository.logout()).called(1);
    });
  });

  group('Registration Use Case', () {
    const userName = 'userName';
    const userModel = UserModel(id: 'id', userTag: 'userTag');

    setUp(() => registrationUseCase = RegistrationUseCase(mockRegistrationRepository));

    test('Success', () async {
      when(mockRegistrationRepository.registration(userName, email, password)).thenAnswer((_) async => const Right(userModel));

      final result = await registrationUseCase.call(email: email, password: password, userName: userName);
      expect(result.isRight(), isTrue);

      final user = result.getOrElse((_) => const UserModel(id: '', userTag: ''));
      expect(user, userModel);

      verify(mockRegistrationRepository.registration(userName, email, password)).called(1);
    });

    test('Error', () async {
      when(
        mockRegistrationRepository.registration(userName, email, password),
      ).thenAnswer((_) async => Left(UnknownAuthFailure(stackTrace: StackTrace.current)));

      final result = await registrationUseCase.call(email: email, password: password, userName: userName);
      expect(result.isLeft(), isTrue);

      result.fold(
        (failure) => expect(failure, isA<AuthFailure>()),
        (r) => fail('Expected Left, but got Right'),
      );

      verify(mockRegistrationRepository.registration(userName, email, password)).called(1);
    });
  });
}
