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
class UsersRepositoryImpl implements UserRepository {
  const UsersRepositoryImpl(this._dio);
  final Dio _dio;

  @override
  Future<Either<UserFailure, UserModel>> getMe() async {
    try {
      final response = await _dio.get('users/me');

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
    try {
      final response = await _dio.patch(
        'users/me',
        data: user.toJson(),
      );

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

      return Right(UserModel.fromJson(response.data));
    } on DioException catch (e, st) {
      return Left(UserFailure.fromDioException(e, st));
    } catch (e, st) {
      talk.error('UsersRepositoryImpl updateAvatar error: $e, st $st');
      return Left(UserUnknownFailure(stackTrace: st));
    }
  }
}
