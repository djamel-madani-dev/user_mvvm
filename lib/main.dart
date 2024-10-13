import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'view_models/user_view_model.dart';
import 'screens/user_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserViewModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MVVM avec Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Liste des Utilisateurs'),
        ),
        body: const UsersScreen(),
      ),
    );
  }
}
