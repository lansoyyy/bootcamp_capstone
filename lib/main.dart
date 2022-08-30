import 'package:capston/data/providers/dataonmap_provider.dart';
import 'package:capston/data/providers/joboffer_details_provider.dart';
import 'package:capston/data/providers/worker_details_provider.dart';
import 'package:capston/presentation/screens/loading_screen.dart';
import 'package:capston/presentation/screens/onboarding_screen.dart';
import 'package:capston/presentation/utils/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) => PostProvider(),
    ),
    ChangeNotifierProvider(
      create: (_) => JobOfferProvider(),
    ),
    ChangeNotifierProvider(
      create: (_) => MapDataProvider(),
    ),
  ], child: MaterialApp(home: MyApp())));
}

class MyApp extends StatelessWidget {
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return LoadingScreenToHome();
          } else {
            return OnboardingScreen();
          }
        });
  }
}
