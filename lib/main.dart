import 'package:flutter/material.dart';
import 'package:flutter_mvvm/view/github_user_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter MVVM',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: GithubUserListScreen.id,
      routes: {
        GithubUserListScreen.id: (context) => GithubUserListScreen(),
      },
      home: GithubUserListScreen(),
    );
  }
}
