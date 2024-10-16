import 'package:intl/intl.dart';

mixin FieldsValidation {
  String? validateEmail(email) {
    final bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    if (email.isEmpty) {
      return "Required*";
    } else if (!emailValid) {
      return "Invalid email adress";
    } else {
      return null;
    }
  }

  String? dateValidation(String startDateString, DateTime endDate) {
    DateTime startDate = DateTime(
        int.parse(startDateString.split('-')[2]),
        int.parse(startDateString.split('-')[1]),
        int.parse(startDateString.split('-')[0]));
    if (endDate.isAfter(startDate)) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(endDate);
      return formattedDate;
    } else {
      return "To date should be greater than or equal to from date.";
    }
  }

  String? dateReminderValidation(String startDateString, DateTime endDate) {
    DateTime startDate = DateTime(
        int.parse(startDateString.split('-')[2]),
        int.parse(startDateString.split('-')[1]),
        int.parse(startDateString.split('-')[0]));
    if (endDate.isAfter(startDate)) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(endDate);
      return formattedDate;
    } else {
      return "End date should be greater than start date";
    }
  }

  String? validateTextWithNumber(value) {
    String pattern = r'^(([a-zA-Z])+(-||_)?(([0-9])*((.)([0-9]))?))$';
    RegExp regex = RegExp(pattern);
    if (value.isEmpty) {
      return "Required*";
    } else if (!regex.hasMatch(value!)) {
      return "Invalid Input";
    } else {
      return null;
    }
  }

  String? validateTextOnly(value) {
    String pattern = r'^([a-zA-Z ])+$';
    RegExp regex = RegExp(pattern);
    if (value.isEmpty) {
      return "Required*";
    } else if (!regex.hasMatch(value!)) {
      return "Invalid Input";
    } else {
      return null;
    }
  }

  String? validateNonMandatoryTextOnly(value) {
    String pattern = r'^([a-zA-Z ])+$';
    RegExp regex = RegExp(pattern);
    if (value.isEmpty) {
      return null;
    }
    if (!regex.hasMatch(value!)) {
      return "Invalid Input";
    } else {
      return null;
    }
  }

  String? validateNonMandatoryNumberOnly(String? value) {
    String pattern = r'^([0-9])+$';
    RegExp regex = RegExp(pattern);
    if (value!.isEmpty) {
      return null;
    } else if (!regex.hasMatch(value)) {
      return "Invalid Input please enter numbers only";
    } else {
      return null;
    }
  }

  String? validateOnlyIntNumber(String? value) {
    String pattern = r'^([0-9])+$';
    RegExp regex = RegExp(pattern);
    if (value!.isEmpty) {
      return "Required*";
    } else if (!regex.hasMatch(value)) {
      return "Invalid Input";
    } else {
      return null;
    }
  }

  String? salaryLimit(value) {
    String pattern = r'^([0-9])+$';
    RegExp regex = RegExp(pattern);
    if (value.isEmpty) {
      return "Required*";
    } else if (!regex.hasMatch(value!)) {
      return "Invalid Input";
    } else if ((int.parse(value) < 5000)) {
      return "value should be greater than starting range ";
    } else {
      return null;
    }
  }

  String? validateOnlyNumberWithDecimal(value) {
    String pattern = r'^([0-9])+(.)+([0-9])$';
    RegExp regex = RegExp(pattern);
    if (value.isEmpty) {
      return "Required*";
    } else if (!regex.hasMatch(value!)) {
      return "Invalid Input";
    } else {
      return null;
    }
  }

  String? validateNumberWithDashes(String? value) {
    String pattern = r'^(([0-9])+?(-)?)+?$';
    RegExp regex = RegExp(pattern);
    if (value!.isEmpty) {
      return "Required*";
    } else if (value[value.length - 1] == '-') {
      return "Invalid Input";
    } else if (!regex.hasMatch(value)) {
      return "Invalid Input";
    } else {
      return null;
    }
  }

  String? passwordValidation(value) {
    String pattern = r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)";
    RegExp regex = RegExp(pattern);
    if (value.isEmpty) {
      return "Required*";
    } else if (!regex.hasMatch(value!)) {
      return "Hint: Aabc@123";
    } else {
      return null;
    }
  }

  String? validatePhone(value) {
    String pattern = r'^\+?1?[-\.\s]?\(?\d{3}\)?[-\.\s]?\d{3}[-\.\s]?\d{4}$';
    RegExp regex = RegExp(pattern);
    if (value.isEmpty) {
      return "Required*";
    } else if (!regex.hasMatch(value!)) {
      return "Invalid Phone Number";
    } else {
      return null;
    }
  }

  String? emptyFieldValidation(String? value) {
    String text = value!.trim();
    if (text.startsWith(' ')) {
      return "Required*";
    } else if (text.isEmpty) {
      return "Required*";
    } else {
      return null;
    }
  }

  String? matchPass(value, value2) {
    if (value.isEmpty) {
      return "Required*";
    } else if (value != value2) {
      return "*password does not match";
    } else {
      return null;
    }
  }

  String? validateNumberAndAlphabetsOnly(String? value) {
    String pattern = r'^([0-9])*([A-Za-z])\w+$';
    RegExp regex = RegExp(pattern);
    if (value!.isEmpty) {
      return "Required*";
    } else if (!regex.hasMatch(value)) {
      return "Invalid Input";
    } else {
      return null;
    }
  }

  String? validateTextOnlyDropdown<T>(T? value) {
    if (value == null || value.toString().isEmpty) {
      return "Required*";
    } else if (value == '') {
      return "is Empty*";
    }
    return null;
  }

  String? validateVin(String? vin) {
    String pattern = r"^[A-HJ-NPR-Z0-9]{17}$";
    RegExp regex = RegExp(pattern, caseSensitive: false);
    if (vin!.isEmpty) {
      return "Required*";
    } else if (vin.length != 17) {
      return "VIN must be exactly 17 characters";
    } else if (!regex.hasMatch(vin)) {
      return "Invalid Input";
    } else {
      return null;
    }
  }

  String? zipCodeOptionalValidation(String? zipCode) {
    bool isZipValid = RegExp(
            r'^[A-Za-z]\d[A-Za-z] \d[A-Za-z]\d$|^\d{5}(-\d{4})?$',
            caseSensitive: false)
        .hasMatch(zipCode!);
    if (!isZipValid) {
      return "Zip/Postal code invalid!";
    } else {
      return null;
    }
  }
}
