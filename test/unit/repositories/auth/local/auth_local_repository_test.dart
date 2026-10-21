import 'package:chat_pet/core/storages/interfaces/secure_storage_service.dart';
import 'package:chat_pet/data/repositories/auth/auth_local_repository_impl.dart';
import 'package:chat_pet/domain/interfaces/auth/auth_local_repository.dart';
import 'package:chat_pet/domain/models/auth/tokens.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth_local_repository_test.mocks.dart';

@GenerateMocks([SecureStorageService])
void main() {
  late MockSecureStorageService mockStorage;
  late AuthLocalRepository authLocalRepository;

  const writingToken = Tokens(accessToken: 'accessToken', refreshToken: 'refreshToken');
  const writingOneEmptyToken = Tokens(accessToken: 'accessToken', refreshToken: '');

  setUp(() {
    mockStorage = MockSecureStorageService();
    authLocalRepository = AuthLocalRepositoryImpl(mockStorage);
  });

  test('Проверка получения пустых токенов из кеша', () async {
    when(mockStorage.read('access_token')).thenAnswer((_) async => null);
    when(mockStorage.read('refresh_token')).thenAnswer((_) async => null);

    final tokenResult = await authLocalRepository.readTokens();

    expect(tokenResult, null);
  });

  test('Проверка записи токенов в кеш', () async {
    when(mockStorage.write(key: 'access_token', value: writingToken.accessToken)).thenAnswer((_) async {});
    when(mockStorage.write(key: 'refresh_token', value: writingToken.refreshToken)).thenAnswer((_) async {});

    await authLocalRepository.writeTokens(writingToken);

    verify(mockStorage.write(key: 'access_token', value: writingToken.accessToken)).called(1);
    verify(mockStorage.write(key: 'refresh_token', value: writingToken.refreshToken)).called(1);
  });

  test('Проверка получения токенов из кеша', () async {
    when(mockStorage.write(key: 'access_token', value: writingToken.accessToken)).thenAnswer((_) async {});
    when(mockStorage.write(key: 'refresh_token', value: writingToken.refreshToken)).thenAnswer((_) async {});
    when(mockStorage.read('access_token')).thenAnswer((_) async => writingToken.accessToken);
    when(mockStorage.read('refresh_token')).thenAnswer((_) async => writingToken.refreshToken);

    await authLocalRepository.writeTokens(writingToken);
    final tokenResult = await authLocalRepository.readTokens();

    expect(tokenResult, writingToken);
  });

  test('Проверка удаления токенов из кеша', () async {
    when(mockStorage.write(key: 'access_token', value: writingToken.accessToken)).thenAnswer((_) async {});
    when(mockStorage.write(key: 'refresh_token', value: writingToken.refreshToken)).thenAnswer((_) async {});
    when(mockStorage.delete('access_token')).thenAnswer((_) async {});
    when(mockStorage.delete('refresh_token')).thenAnswer((_) async {});
    when(mockStorage.read('access_token')).thenAnswer((_) async => null);
    when(mockStorage.read('refresh_token')).thenAnswer((_) async => null);

    await authLocalRepository.writeTokens(writingToken);
    await authLocalRepository.removeTokens();
    final tokenResult = await authLocalRepository.readTokens();

    expect(tokenResult, null);
    verify(mockStorage.delete('access_token')).called(1);
    verify(mockStorage.delete('refresh_token')).called(1);
  });

  test('Проверка получения одного пустого токена из кеша', () async {
    when(mockStorage.write(key: 'access_token', value: writingOneEmptyToken.accessToken)).thenAnswer((_) async {});
    when(mockStorage.write(key: 'refresh_token', value: writingOneEmptyToken.refreshToken)).thenAnswer((_) async {});
    when(mockStorage.read('access_token')).thenAnswer((_) async => writingOneEmptyToken.accessToken);
    when(mockStorage.read('refresh_token')).thenAnswer((_) async => writingOneEmptyToken.refreshToken);

    await authLocalRepository.writeTokens(writingOneEmptyToken);
    final tokenResult = await authLocalRepository.readTokens();

    expect(tokenResult, null);
  });
}
