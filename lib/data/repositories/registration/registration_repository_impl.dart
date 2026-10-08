import 'package:chat_pet/data/mappers/user/user_mapper.dart';
import 'package:chat_pet/data/models/user/user_dto.dart';
import 'package:chat_pet/domain/custom_talker/custom_talker.dart';
import 'package:chat_pet/domain/failures/auth_failures/auth_failure.dart';
import 'package:chat_pet/domain/interfaces/registration/registration_repository.dart';
import 'package:chat_pet/domain/models/user/user_model.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: RegistrationRepository)
class RegistrationRepositoryImpl implements RegistrationRepository {
  const RegistrationRepositoryImpl(@Named('basicDio') this._dio);

  final Dio _dio;

  @override
  Future<Either<AuthFailure, UserModel>> registration(String userName, String email, String password) async {
    try {
      final response = await _dio.post(
        'auth/register',
        data: {
          'username': userName,
          'email': email,
          'password': password,
        },
      );

      return Right(UserDto.fromJson(response.data as Map<String, dynamic>).toDomain());
    } on DioException catch (e, st) {
      return Left(AuthFailure.fromDioException(e, st));
    } catch (e, st) {
      talk.error('Register error: $e, st: $st');
      return Left(EmailAlreadyInUseFailure(stackTrace: st));
    }
  }
}
