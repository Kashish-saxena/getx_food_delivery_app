import 'package:get_storage/get_storage.dart';

class GetStorageBox {
  GetStorageBox._privateStorage();

  static final GetStorageBox _instance = GetStorageBox._privateStorage();
  static GetStorageBox get instance => _instance;

  final String emailKey = 'email';
  final String passwordKey = 'password';
  final String loginKey = "false";

  final _storage = GetStorage();

  void setIsLogin(String islogin){
    _storage.write(loginKey, islogin);
  }

  String getIsLogin(){
    return _storage.read(loginKey)??"";
  }

  void setEmail(String email) {
    _storage.write(emailKey, email);
  }

  void setPassword(String password) {
    _storage.write(passwordKey, password);
  }

  String getEmail() {
    return _storage.read(emailKey)??"";
  }

  String getPassword() {
    return _storage.read(passwordKey)??"";
  }

  removeData(){
    _storage.remove(emailKey);
    _storage.remove(passwordKey);
  }
}
