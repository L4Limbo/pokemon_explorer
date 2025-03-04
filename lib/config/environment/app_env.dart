class AppEnv {
  static AppEnv? _instance;

  String? apiHost;

  AppEnv._internal();

  factory AppEnv() {
    _instance ??= AppEnv._internal();
    return _instance!;
  }

  void init({required String host}) {
    apiHost = host;
  }

  String getHost() => apiHost ?? "https://pokeapi.co";
}
