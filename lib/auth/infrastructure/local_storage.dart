import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:sembast/sembast.dart';
import 'package:test_authorization/auth/infrastructure/auth_info_dto.dart';
import 'package:test_authorization/auth/infrastructure/i_local_storage.dart';

import 'sembast_database.dart';

const _storeName = 'phoneNumber';

/// Defines local storage methods.
@LazySingleton(as: ILocalStorage)
class LocalStorage implements ILocalStorage {
  final SembastDatabase _sembastDatabase;
  final _store = intMapStoreFactory.store(_storeName);
  LocalStorage(this._sembastDatabase);

  @override
  Future<bool> chekUserHasAlreadyRegistered(String phoneNumber) async {
    final response = await _store.find(_sembastDatabase.instance);
    return response
        .map((e) => AuthInfoDTO.fromJson(e.value))
        .map((e) => e.phoneNumber)
        .any((element) => element == phoneNumber);
  }

  @override
  Future<void> putAuthInfo(AuthInfoDTO authIndfo) async {
    await _store.record(1).put(_sembastDatabase.instance, authIndfo.toJson());
  }

  @override
  Future<AuthInfoDTO> getAuthInfo(String phoneNumber) async {
    try {
      final response = await _store.find(_sembastDatabase.instance);
      return response
          .map((e) => AuthInfoDTO.fromJson(e.value))
          .toList()
          .firstWhere((element) => element.phoneNumber == phoneNumber);
    } catch (e) {
      throw Exception();
    }
  }
}
