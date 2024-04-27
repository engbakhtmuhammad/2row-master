class ValidatorUtils {
  String? validatePassword(value) {
    if (value == null || value.isEmpty) {
      return "Password is required";
    } else if (value.length < 4) {
      return "Password should contain 4 characters";
    }
    return null;
  }

  String? validateOtp(value) {
    if (value == null || value.isEmpty) {
      return "OTP is required";
    } else if (value.length < 6) {
      return "OTP should contain 6 characters";
    }
    return null;
  }

  String? password(value) {
    if (value == null || value.isEmpty) {
      return "Password is required";
    }
    return null;
  }

  String? validateMobileNumber(value) {
    if (value == null || value.isEmpty) {
      return "Enter Valid Mobile Number";
    } else if (value.length <= 9) {
      return "Invalid Mobile Number";
    }
    return null;
  }

  String? validateZip(String? value) {
    String pattern = r"[A-Za-z]\d[A-Za-z] \d[A-Za-z]\d";
    RegExp regex = RegExp(pattern);
    if (value == null || !regex.hasMatch(value)) {
      return 'Enter a valid ZIP Code';
    }
    return null;
  }

  String? validateName(value) {
    if (value == null || value.isEmpty) {
      return 'Name is required';
    }
    return null;
  }

  String? package(field, value) {
    if (value == null || value == "") {
      return "$field is required.";
    }
    return null;
  }

  String? validateEmail(value) {
    String pattern =
        (r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?");
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value) || value == null) {
      return 'Enter a valid email address';
    }
    return null;
  }

  String? validateWeb(value) {
    String pattern =
        (r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?");
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Url is Invalid';
    }
    return null;
  }
}
