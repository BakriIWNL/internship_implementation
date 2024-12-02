class ValidationConditions{

  static final Map<String,String? Function(String?)?> validator = {
    "Email":emailValidator,
    "Password": passwordValidator,
    "Name":nameValidator
  };

  static String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is Empty!';
    }
    if (!RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)) {
      return 'Enter a Valid Email';
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is Empty!';
    }
    if (!RegExp(r'^(?=.*?[A-Z])').hasMatch(value)) {
      return 'Password Must Contain One Uppercase Letter';
    }
    if (!RegExp(r'^(?=.*?[a-z])').hasMatch(value)) {
      return 'Password Must Contain One Lowercase Letter';
    }
    if (!RegExp(r'^(?=.*?[0-9])').hasMatch(value)) {
      return 'Password Must Contain One Number';
    }
    if (!RegExp(r'^(?=.*?[!@#\$&*~])').hasMatch(value)) {
      return 'Password Must Contain One Special Character';
    }
    if (!RegExp(r'^.{8,}$').hasMatch(value)) {
      return 'Password Must Be 8 Characters Or Longer';
    }
    return null;
  }

  static String? nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name is Empty!';
    }
    return null;
  }
}