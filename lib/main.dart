import 'package:flutter/material.dart';
import 'package:shop/core/constants/app_constants.dart';
import 'package:shop/features/shops/presentation/screens/main/shops_screen.dart';
import 'package:shop/services/di/get_it.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appTitle,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),
      home: const ShopsScreen(),
    );
  }
}
