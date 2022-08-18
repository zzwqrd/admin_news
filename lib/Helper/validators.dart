class Validator {
  String validateEmail(String value) {
    if (value.isEmpty) return 'Email Should not be empty';
    var emailRegEx = RegExp(r'^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$');
    if (!emailRegEx.hasMatch(value)) return 'Your Email is invalid';
    return '';
  }

  String validatePassword(String value) {
    if (value.length < 4) return 'Password should be four characters or more';
    return '';
  }
}
