class AppConfig {
  static const String geminiApiKey = String.fromEnvironment(
    'GEMINI_API_KEY',
    defaultValue: 'AIzaSyCmwKFVgDxJUChTR9Jo8zwcIzuLoeXuCtM',
  );
}
