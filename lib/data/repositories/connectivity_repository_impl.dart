import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:pokemon_explorer/domain/repositories/connectivity_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final connectivityRepositoryProvider = Provider<ConnectivityRepository>((ref) {
  return ConnectivityRepositoryImpl();
});

class ConnectivityRepositoryImpl implements ConnectivityRepository {
  final Connectivity _connectivity = Connectivity();

  @override
  Stream<bool> get internetConnectionStatus async* {
    List<ConnectivityResult> result = await _connectivity.checkConnectivity();
    yield !result.contains(ConnectivityResult.none);

    await for (var newResult in _connectivity.onConnectivityChanged) {
      yield !newResult.contains(ConnectivityResult.none);
    }
  }
}
