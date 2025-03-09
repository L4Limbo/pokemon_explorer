import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_explorer/data/repositories/connectivity_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'connectivity_viewmodel.g.dart';

@riverpod
Stream<bool> connectivityViewModel(Ref ref) async* {
  final connectivityRepository = ref.read(connectivityRepositoryProvider);

  yield* connectivityRepository.internetConnectionStatus;
}
