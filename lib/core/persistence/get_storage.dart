import 'package:get_storage/get_storage.dart';

class GetStorageBox {
  GetStorageBox._privateStorage();
  static final GetStorageBox _storage = GetStorageBox._privateStorage();
  static GetStorageBox get storage => _storage;
  String email = 'email';
  String password = 'password';
  final storageBox = GetStorage();

  setEmail(String key, String registerEmail) {
    return storageBox.write(key, registerEmail);
  }

  setPassword(String key, String registerPassword) {
    return storageBox.write(key, registerPassword);
  }

  getEmail(String key) {
    return storageBox.read(key);
  }

  getPassword(String key) {
    return storageBox.read(key);
  }
}
