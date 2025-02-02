import 'package:flutter/material.dart';
import 'package:flutter_fb_auth/models/app_user.dart';
import 'package:flutter_fb_auth/providers/auth_provider.dart';
import 'package:flutter_fb_auth/screens/profile/profile.dart';
import 'package:flutter_fb_auth/screens/welcome/welcome.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const ProviderScope(
    child: MyApp()
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Consumer(
        builder: (context, ref, child) {
          final AsyncValue<AppUser?> user = ref.watch(authProvider);

          return user.when(
            data: (value) {
              if (value == null) {
                return const WelcomeScreen();
              }
              return ProfileScreen(user: value);
            },
            error: (error, _) => const Text('error loading auth status...'),
            loading: () => const Text('loading...'),
          );
        },
      ),
    );
  }
}