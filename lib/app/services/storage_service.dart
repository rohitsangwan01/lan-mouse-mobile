import 'package:lan_mouse_mobile/app/models/client.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  StorageService._privateConstructor();
  static final StorageService instance = StorageService._privateConstructor();
  late final SharedPreferencesWithCache _storage;

  Future<void> init() async {
    _storage = await SharedPreferencesWithCache.create(
      cacheOptions: const SharedPreferencesWithCacheOptions(),
    );
  }

  Future<void> addClient(Client client) async {
    await _storage.setString(client.storageKey, client.toJsonString());
  }

  Future<void> deleteClient(Client client) async {
    await _storage.remove(client.storageKey);
  }

  List<Client> getClients() {
    return _storage.keys
        .where((e) => e.startsWith(Client.storagePrefix))
        .map((key) => _storage.getString(key))
        .nonNulls
        .map(Client.fromJsonString)
        .toList();
  }
}
