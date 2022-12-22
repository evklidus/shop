import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:shop/features/shops/presentation/screens/main/shops_screen.dart';
import 'package:shop/services/di/get_it.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Hive.initFlutter();
  di.setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shop',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),
      home: const ShopsScreen(),
    );
  }
}
