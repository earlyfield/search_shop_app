import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:search_shop_app/constants.dart';
import 'package:search_shop_app/providers/routerProvider.dart';

void main() {
  // URLに'#'を入らないようにする設定。
  // GoRouterのコンストラクタに入れることも可能だが、その場合はホットリスタートがエラーになる。
  // GoRouter.setUrlPathStrategy(UrlPathStrategy.path);

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routeInformationParser: ref.watch(routerProvider).routeInformationParser,
      routerDelegate: ref.watch(routerProvider).routerDelegate,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
    );
  }
}
