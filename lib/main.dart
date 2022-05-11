import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test/login_provider.dart';
import 'package:riverpod_test/login_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var loginState = ref.watch(loginProvider);

    if (loginState is LoginLoading) {
      return Scaffold(
        body: const Center(
          child: CupertinoActivityIndicator(),
        ),
      );
    } else {
      return Scaffold(
        body: Center(
          child: CupertinoButton(
              child: Text('Login Success'),
              onPressed: () {
                ref.read(loginProvider.notifier).login();
              }),
        ),
      );
    }
  }
}
