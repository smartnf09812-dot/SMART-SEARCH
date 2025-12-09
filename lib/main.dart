import 'package:flutter/material.dart' hide ThemeData;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart' as shadcn;
import 'routes/router.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return shadcn.ShadcnApp.router(
      title: 'Food Delivery App',
      routerConfig: router,
    );
  }
}
