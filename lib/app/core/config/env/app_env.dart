final class AppEnv {
  static const baseUrl = String.fromEnvironment('BASE_URL');
  static const connectTimeout =
      int.fromEnvironment('CONNECT_TIMEOUT', defaultValue: 10000);
  static const receiveTimeout =
      int.fromEnvironment('RECEIVE_TIMEOUT', defaultValue: 30000);
}
