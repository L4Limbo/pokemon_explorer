import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_explorer/presentation/connectivity/view_models/connectivity_viewmodel.dart';

class NetworkStatusBar extends ConsumerWidget {
  const NetworkStatusBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isConnected = ref.watch(connectivityViewModelProvider);
    return isConnected.when(
      data: (connected) => connected
          ? SizedBox.shrink()
          : Container(
              width: double.infinity,
              padding: EdgeInsets.all(8),
              color: Colors.red,
              child: Center(
                child: Text(
                  "No Internet Connection",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
      loading: () => SizedBox.shrink(),
      error: (_, __) => SizedBox.shrink(),
    );
  }
}
