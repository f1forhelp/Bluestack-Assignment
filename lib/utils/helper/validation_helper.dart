class ValidationHelper {
  static String? validateEmpty(String? value) {
    if (value != null && (value.length > 3 && value.length < 12)) {
      return null;
    } else {
      return "Length must be at least 3";
    }
  }
}
