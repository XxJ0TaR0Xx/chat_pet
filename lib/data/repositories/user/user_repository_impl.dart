import 'dart:async';

import 'package:chat_pet/data/mappers/user/user_mapper.dart';
import 'package:chat_pet/data/models/user/user_dto.dart';
import 'package:chat_pet/domain/custom_talker/custom_talker.dart';
import 'package:chat_pet/domain/failures/user_failures/user_failures.dart';
import 'package:chat_pet/domain/interfaces/token/token_manager.dart';
import 'package:chat_pet/domain/interfaces/user/user_repository.dart';
import 'package:chat_pet/domain/models/user/user_model.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl(this._dio, TokenManager tokenManager) {
    _authSub = tokenManager.isAuthorized.where((auth) => !auth).listen((_) => _setUser(null));
  }

  final Dio _dio;
  late final StreamSubscription<bool> _authSub;
  final _controller = StreamController<UserModel?>.broadcast();
  UserModel? _currentUser;

  @override
  Future<Either<UserFailure, UserModel>> getMe() async {
    talk.info('Start get me call');

    try {
      final response = await _dio.get('users/me');
      final userModel = _setUser(UserDto.fromJson(response.data as Map<String, dynamic>).toDomain())!;

      talk.info('Get me success $response');
      return Right(userModel);
    } on DioException catch (e, st) {
      return Left(UserFailure.fromDioException(e, st));
    } catch (e, st) {
      talk.error('UsersRepositoryImpl getMe error: $e, st $st');
      return Left(UserUnknownFailure(stackTrace: st));
    }
  }

  @override
  Future<Either<UserFailure, UserModel>> updateMe(UserModel user) async {
    talk.info('Start update me call');

    try {
      final response = await _dio.patch(
        'users/me',
        data: user.toUpdateDto().toJson(),
      );

      final updatedUserModel = _setUser(UserDto.fromJson(response.data as Map<String, dynamic>).toDomain())!;

      talk.info('Update me success $response');
      return Right(updatedUserModel);
    } on DioException catch (e, st) {
      return Left(UserFailure.fromDioException(e, st));
    } catch (e, st) {
      talk.error('UsersRepositoryImpl updateMe error: $e, st $st');
      return Left(UserUnknownFailure(stackTrace: st));
    }
  }

  @override
  Future<Either<UserFailure, UserModel>> updateAvatar(String imagePath) async {
    talk.info('Start update avatar call');

    try {
      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(
          imagePath,
          filename: 'avatar.jpg',
          contentType: DioMediaType('image', 'jpeg'),
        ),
      });

      final response = await _dio.post(
        'users/me/avatar',
        data: formData,
        options: Options(contentType: 'multipart/form-data'),
      );

      talk.info('Update avatar success $response');

      final updatedUserModel = _setUser(UserDto.fromJson(response.data as Map<String, dynamic>).toDomain())!;

      return Right(updatedUserModel);
    } on DioException catch (e, st) {
      return Left(UserFailure.fromDioException(e, st));
    } catch (e, st) {
      talk.error('UsersRepositoryImpl updateAvatar error: $e, st $st');
      return Left(UserUnknownFailure(stackTrace: st));
    }
  }

  @override
  Stream<UserModel?> watchCurrentUser() => Stream.multi(
    (controller) {
      controller.add(_currentUser);
      final sub = _controller.stream.listen(
        controller.add,
        onError: controller.addError,
        onDone: controller.close,
      );
      controller.onCancel = sub.cancel;
    },
    isBroadcast: true,
  );

  @override
  @disposeMethod
  Future<void> dispose() async {
    await _authSub.cancel();
    await _controller.close();
  }

  UserModel? _setUser(UserModel? user) {
    if (user == _currentUser) return user;
    _currentUser = user;
    _controller.add(user);
    return user;
  }
}
