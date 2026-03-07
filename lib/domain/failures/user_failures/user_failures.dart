import 'package:chat_pet/domain/failures/failure.dart';

abstract class UserFailures extends Failure {
  UserFailures(super.message);
}

class CantUpdateUser extends UserFailures {
  CantUpdateUser() : super('Cant update user');
}

class NoFindUser extends UserFailures {
  NoFindUser() : super('No find user');
}
