class SignUpValidations {
  static String? isNameValid(String name) {
    String pattern = r'^[A-Z][a-z]*[a-zA-Z]{3,20}?$';

    RegExp regExp = RegExp(pattern);
    if (name.isEmpty) {
      return "Enter name";
    } else if (!regExp.hasMatch(name)) {
      return "Name is not valid";
    }
    return null;
  }

  static String? isEmailValid(String email) {
    String pattern = r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$";
    RegExp regExp = RegExp(pattern);
    if (email.isEmpty) {
      return "Enter username or email";
    } else if (!regExp.hasMatch(email)) {
      return "Email is not valid";
    }
    return null;
  }

  static String? isPasswordValid(String password) {
    String pattern = r"^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$";
    RegExp regExp = RegExp(pattern);
    if (password.isEmpty) {
      return "Password is empty";
    } else if (!regExp.hasMatch(password)) {
      return "Password is not valid";
    }
    return null;
  }
}
