// lib/main.dart

import 'package:finance_vertexware/views/login_page.dart';
import 'package:finance_vertexware/views/home_page.dart'; // Página inicial a ser criada
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controllers/auth_controller.dart';

void main() {
  runApp(const PersonalFinanceApp());
}

class PersonalFinanceApp extends StatelessWidget {
  const PersonalFinanceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Personal Finance',
        theme: ThemeData(
          primaryColor: Color(0xFF1A237E),
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: Color(0xFF1A237E),
            secondary: Color(0xFFF57C00),
          ),
          textTheme: const TextTheme(
            bodyLarge: TextStyle(color: Color(0xFF1A237E)),
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/login',
        routes: {
          '/login': (context) => LoginPage(),
          '/home': (context) => HomePage(),
        },
      ),
    );
  }
}
