import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_poc/view/home_screen.dart';
import 'package:provider_poc/view_model/user_view_model.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => UserListViewModel(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
