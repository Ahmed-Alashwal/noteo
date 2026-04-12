class ApiEndpoints {
  static String baseUrl = "https://yemenideveloper.pythonanywhere.com/api/";
  static String register = "accounts/register/";
  static String login = "accounts/token/";
  // If noteId equal to null, that means this endpoint will be used
  // for either fetch or create notes, otherwise for update or delete
  // a note.
  static String notes({String? noteId}) =>
      noteId == null ? "notes/" : "notes/$noteId/";
}

class ApiKey {
  static String authorization = "Authorization";
  static String id = "id";
  static String username = "username";
  static String password = "password";
  static String email = "email";
  static String refreshToken = "refresh";
  static String accessToken = "access";
  static String detailError = "detail";
  static String noteTitle = "title";
  static String noteContent = "content";
  static String noteCreatedAt = "created_at";
  static String noteUpdatedAt = "updated_at";
}
