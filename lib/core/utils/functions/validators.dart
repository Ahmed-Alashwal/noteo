String? noteTFFValidator({String? data}) {
  return data == null || data.isEmpty
      ? "This field should not be empty!"
      : null;
}
