import 'dart:io';

import 'package:chat_pet/data/repositories/user/user_repository_impl.dart';
import 'package:chat_pet/domain/failures/user_failures/user_failures.dart';
import 'package:chat_pet/domain/interfaces/user/user_repository.dart';
import 'package:chat_pet/domain/models/user/user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'user_repository_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  late MockDio mockDio;
  late UserRepository usersRepository;

  const getMePath = 'users/me';
  final requestOptions = RequestOptions(path: getMePath);

  const emptyUser = UserModel(id: '', userTag: '');
  final userModel = UserModel(
    id: '3fa85f64-5717-4562-b3fc-2c963f66afa6',
    userTag: 'string',
    name: 'string',
    avatarUrl: 'string',
    email: 'string',
    createdAt: DateTime.tryParse('2026-06-22T19:51:17.959Z'),
    lastName: 'string',
    address: 'string',
    number: 'string',
  );

  setUp(() {
    mockDio = MockDio();
    usersRepository = UserRepositoryImpl(mockDio);
  });

  group('UserRepository: Get me', () {
    const getMeData = {
      "id": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
      "username": "string",
      "user_tag": "string",
      "avatar_url": "string",
      "is_active": true,
      "created_at": "2026-06-22T19:51:17.959Z",
      "email": "string",
      "last_name": "string",
      "address": "string",
      "phone_number": "string",
    };

    test('Get me: success', () async {
      when(mockDio.get(getMePath)).thenAnswer(
        (_) async => Response(
          data: getMeData,
          requestOptions: requestOptions,
        ),
      );

      final result = await usersRepository.getMe();
      expect(result.isRight(), isTrue);

      final user = result.getOrElse((_) => emptyUser);
      expect(user, userModel);

      verify(mockDio.get(getMePath)).called(1);
    });

    test('Get me: Error (DioExeption)', () async {
      when(mockDio.get(getMePath)).thenThrow(DioException(requestOptions: requestOptions));

      final result = await usersRepository.getMe();
      expect(result.isLeft(), isTrue);

      result.fold(
        (failure) => expect(failure, isA<UserFailure>()),
        (_) => fail('Expected Left, but got Right'),
      );

      verify(mockDio.get(getMePath)).called(1);
    });
  });

  group(
    'UserRepository: Update me',
    () {
      final updatedUserModel = userModel.copyWith(email: 'test@test.mail');

      const updatedUserModelData = {
        "id": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
        "username": "string",
        "user_tag": "string",
        "avatar_url": "string",
        "is_active": true,
        "created_at": "2026-06-22T19:51:17.959Z",
        "email": "test@test.mail",
        "last_name": "string",
        "address": "string",
        "phone_number": "string",
      };

      test(
        'Update me: Success',
        () async {
          when(mockDio.patch(getMePath, data: updatedUserModel.toJson())).thenAnswer(
            (_) async => Response(
              data: updatedUserModelData,
              requestOptions: requestOptions,
            ),
          );

          final result = await usersRepository.updateMe(updatedUserModel);
          expect(result.isRight(), isTrue);

          final user = result.getOrElse((_) => emptyUser);
          expect(user, updatedUserModel);

          verify(mockDio.patch(getMePath, data: updatedUserModel.toJson())).called(1);
        },
      );

      test(
        'Update me: Error (DioExeption)',
        () async {
          when(mockDio.patch(getMePath, data: updatedUserModel.toJson())).thenThrow(
            DioException(requestOptions: requestOptions),
          );

          final result = await usersRepository.updateMe(updatedUserModel);
          expect(result.isLeft(), isTrue);

          result.fold(
            (failure) => expect(failure, isA<UserFailure>()),
            (_) => fail('Expected Left, but got Right'),
          );

          verify(mockDio.patch(getMePath, data: updatedUserModel.toJson())).called(1);
        },
      );
    },
  );

  group(
    'UserRepository: Update avatar',
    () {
      late Directory tempDir;
      late File tempFile;

      const updateAvatarPath = 'users/me/avatar';
      const userJson = {
        'id': 'id',
        'user_tag': 'tag',
        'avatar_url': 'https://example.com/avatar.jpg',
      };

      final requestOptionsAvatar = RequestOptions(path: updateAvatarPath);

      setUp(() async {
        tempDir = await Directory.systemTemp.createTemp('avatar_test_');
        tempFile = File('${tempDir.path}/avatar.jpg');
        await tempFile.writeAsBytes([0xFF, 0xD8, 0xFF]);
      });

      tearDown(() => tempDir.delete(recursive: true));

      test('Update avatar: success', () async {
        when(
          mockDio.post(
            updateAvatarPath,
            data: anyNamed('data'),
            options: anyNamed('options'),
          ),
        ).thenAnswer(
          (_) async => Response(
            data: userJson,
            requestOptions: requestOptionsAvatar,
          ),
        );

        final result = await usersRepository.updateAvatar(tempFile.path);
        expect(result.isRight(), isTrue);
        verify(
          mockDio.post(
            'users/me/avatar',
            data: anyNamed('data'),
            options: anyNamed('options'),
          ),
        ).called(1);
      });

      test('Update avatar: Error (DioExeption)', () async {
        when(
          mockDio.post(
            updateAvatarPath,
            data: anyNamed('data'),
            options: anyNamed('options'),
          ),
        ).thenThrow(DioException(requestOptions: requestOptionsAvatar));

        final result = await usersRepository.updateAvatar(tempFile.path);
        expect(result.isRight(), isFalse);
        verify(
          mockDio.post(
            'users/me/avatar',
            data: anyNamed('data'),
            options: anyNamed('options'),
          ),
        ).called(1);
      });
    },
  );
}
