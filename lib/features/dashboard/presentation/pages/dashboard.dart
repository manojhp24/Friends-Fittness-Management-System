import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../authentication/presentation/provider/auth_provider.dart';

class Dashboard extends ConsumerStatefulWidget {
  const Dashboard({super.key});

  @override
  ConsumerState<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends ConsumerState<Dashboard> {
  @override
  Widget build(BuildContext context) {
    final notifier = ref.read(authNotifierProvider.notifier);

    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            notifier.logout();
          },
          child: const Text("Logout"),
        )
        ,
      ),
    );
  }
}
