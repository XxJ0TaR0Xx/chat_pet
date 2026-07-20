import 'dart:async';

import 'package:chat_pet/data/common/custom_talker/custom_talker.dart';
import 'package:chat_pet/domain/failures/user_failures/user_failures.dart';
import 'package:chat_pet/domain/interfaces/user/user_repository.dart';
import 'package:chat_pet/domain/models/user/user_model.dart';
import 'package:dio/dio.dart';
// ignore: implementation_imports
import 'package:fpdart/src/either.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  const UserRepositoryImpl(this._dio);
  final Dio _dio;

  @override
  Future<Either<UserFailure, UserModel>> getMe() async {
    talk.info('Start get me call');

    try {
      final response = await _dio.get('users/me');

      talk.info('Get me success $response');
      return Right(UserModel.fromJson(response.data));
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
        data: user.toJson(),
      );

      talk.info('Update me success $response');
      return Right(UserModel.fromJson(response.data));
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
      return Right(UserModel.fromJson(response.data));
    } on DioException catch (e, st) {
      return Left(UserFailure.fromDioException(e, st));
    } catch (e, st) {
      talk.error('UsersRepositoryImpl updateAvatar error: $e, st $st');
      return Left(UserUnknownFailure(stackTrace: st));
    }
  }
}
