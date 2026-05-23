import 'package:chat_pet/data/common/custom_talker/custom_talker.dart';
import 'package:chat_pet/data/common/services/api_service.dart';
import 'package:chat_pet/domain/failures/auth_failures/auth_failure.dart';
import 'package:chat_pet/domain/interfaces/registration/registration_repository.dart';
import 'package:chat_pet/domain/models/user/user_model.dart';
import 'package:dio/dio.dart';
// ignore: implementation_imports
import 'package:fpdart/src/either.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: RegistrationRepository)
class RegistrationRepositoryImpl implements RegistrationRepository {
  const RegistrationRepositoryImpl();

  @override
  Future<Either<AuthFailure, UserModel>> registration(String userName, String email, String password) async {
    final dio = APIService.instants.dio;
    try {
      final response = await dio.post(
        'auth/register',
        data: {
          'username': userName,
          'email': email,
          'password': password,
        },
      );

      return Right(UserModel.fromJson(response.data));
    } on DioException catch (e, st) {
      return Left(AuthFailure.fromDioException(e, st));
    } catch (e, st) {
      talk.error('Register error: $e, st: $st');
      return Left(EmailAlreadyInUseFailure(stackTrace: st));
    }
  }
}
