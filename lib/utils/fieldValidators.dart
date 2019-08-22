import 'dart:core';

String passwordValidator(String value) {
  if (value.isEmpty) {
    return 'Please enter password';
  } else if (value.length < 6) {
    return 'Password should contains atlease 6 letters';
  }
  return null;
}

String emptyValidator(String value) {
  if (value.isEmpty) {
    return 'Field cannot be empty';
  }
  return null;
}

String numberValidator(String value) {
  final numeric = RegExp(r'^[0-9]*$');

  if (value.isEmpty) {
    return 'Field cannot be Empty';
  } else if (!numeric.hasMatch(value)) {
    return "Price can be only number";
  }
  return null;
}
