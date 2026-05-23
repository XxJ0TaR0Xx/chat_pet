import 'package:chat_pet/core/storages/exceptions/secure_storage_exception.dart';
import 'package:chat_pet/core/storages/interfaces/secure_storage_service.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: SecureStorageService)
final class SecureStorageServiceImpl implements SecureStorageService {
  const SecureStorageServiceImpl(this._storage);

  final FlutterSecureStorage _storage;

  @override
  Future<String?> read(String key) async {
    try {
      return await _storage.read(key: key);
    } on PlatformException catch (e, st) {
      throw SecureStorageException(
        operation: 'read',
        message: e.message ?? 'Unknown error',
        stackTrace: st,
      );
    }
  }

  @override
  Future<void> write({required String key, required String value}) async {
    try {
      await _storage.write(key: key, value: value);
    } on PlatformException catch (e, st) {
      throw SecureStorageException(
        operation: 'write',
        message: e.message ?? 'Unknown error',
        stackTrace: st,
      );
    }
  }

  @override
  Future<void> delete(String key) async {
    try {
      await _storage.delete(key: key);
    } on PlatformException catch (e, st) {
      throw SecureStorageException(
        operation: 'delete',
        message: e.message ?? 'Unknown error',
        stackTrace: st,
      );
    }
  }

  @override
  Future<void> deleteAll() async {
    try {
      await _storage.deleteAll();
    } on PlatformException catch (e, st) {
      throw SecureStorageException(
        operation: 'deleteAll',
        message: e.message ?? 'Unknown error',
        stackTrace: st,
      );
    }
  }
}
