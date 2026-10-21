import 'package:chat_pet/core/auth/interface/token_provide.dart';
import 'package:chat_pet/core/common/disposable.dart';
import 'package:chat_pet/domain/interfaces/token/token_cache.dart';

abstract interface class TokenManager implements TokenProvider, TokenCache, Disposable {}
