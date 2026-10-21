import 'package:chat_pet/domain/failures/user_failures/user_failures.dart';
import 'package:chat_pet/domain/interfaces/user/user_repository.dart';
import 'package:chat_pet/domain/models/user/user_model.dart';
import 'package:chat_pet/domain/usecases/user/get_me_use_case.dart';
import 'package:chat_pet/domain/usecases/user/update_avatar_use_case.dart';
import 'package:chat_pet/domain/usecases/user/update_me_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'user_use_case_test.mocks.dart';

@GenerateMocks([UserRepository])
void main() {
  const userModel = UserModel(id: 'id', userTag: 'userTag');
  provideDummy<Either<UserFailure, UserModel>>(const Right(userModel));

  late MockUserRepository mockUserRepository;

  setUp(() => mockUserRepository = MockUserRepository());

  group(
    'Get Me Use Case',
    () {
      late GetMeUseCase getMeUseCase;

      setUp(() => getMeUseCase = GetMeUseCase(mockUserRepository));

      test(
        'Success',
        () async {
          when(mockUserRepository.getMe()).thenAnswer((_) async => const Right(userModel));

          final result = await getMeUseCase.call();
          expect(result.isRight(), isTrue);

          verify(mockUserRepository.getMe()).called(1);
        },
      );

      test(
        'Error',
        () async {
          when(mockUserRepository.getMe()).thenAnswer((_) async => Left(UserUnauthorizedFailure(stackTrace: StackTrace.current)));

          final result = await getMeUseCase.call();
          expect(result.isLeft(), isTrue);

          verify(mockUserRepository.getMe()).called(1);
        },
      );
    },
  );

  group(
    'Update Avatar Use Case',
    () {
      late UpdateAvatarUseCase updateAvatarUseCase;
      const imagePath = 'imagePath';

      setUp(() => updateAvatarUseCase = UpdateAvatarUseCase(mockUserRepository));

      test(
        'Success',
        () async {
          when(mockUserRepository.updateAvatar(imagePath)).thenAnswer((_) async => const Right(userModel));

          final result = await updateAvatarUseCase.call(imagePath: imagePath);
          expect(result.isRight(), isTrue);

          verify(mockUserRepository.updateAvatar(imagePath)).called(1);
        },
      );

      test(
        'Error',
        () async {
          when(mockUserRepository.updateAvatar(imagePath)).thenAnswer((_) async => Left(UserUnauthorizedFailure(stackTrace: StackTrace.current)));

          final result = await updateAvatarUseCase.call(imagePath: imagePath);
          expect(result.isLeft(), isTrue);

          verify(mockUserRepository.updateAvatar(imagePath)).called(1);
        },
      );
    },
  );

  group(
    'Update Me Use Case',
    () {
      late UpdateMeUseCase updateMeUseCase;
      final updatedUserModel = userModel.copyWith(email: 'test@test.com');

      setUp(() => updateMeUseCase = UpdateMeUseCase(mockUserRepository));

      test(
        'Success',
        () async {
          when(mockUserRepository.updateMe(updatedUserModel)).thenAnswer((_) async => Right(updatedUserModel));

          final result = await updateMeUseCase.call(user: updatedUserModel);
          expect(result.isRight(), isTrue);

          verify(mockUserRepository.updateMe(updatedUserModel)).called(1);
        },
      );

      test(
        'Error',
        () async {
          when(mockUserRepository.updateMe(updatedUserModel)).thenAnswer((_) async => Left(UserUnauthorizedFailure(stackTrace: StackTrace.current)));

          final result = await updateMeUseCase.call(user: updatedUserModel);
          expect(result.isLeft(), isTrue);

          verify(mockUserRepository.updateMe(updatedUserModel)).called(1);
        },
      );
    },
  );
}
