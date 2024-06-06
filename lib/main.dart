import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_quote_generator/home_screen.dart';
import 'package:random_quote_generator/provider/random_text_provider.dart';
import 'package:random_quote_generator/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_)=>RandomTextProvider(),
         child: MaterialApp(
           debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
         theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
         ),
         home: SplashScreen(),
    ),
    );
  }
}

