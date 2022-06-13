import 'package:flutter/material.dart';
import 'package:movie_api/view/screens/home_screen.dart';
import 'package:movie_api/viewmodel/details_viewmodel.dart';
import 'package:movie_api/viewmodel/main_view_model.dart';
import  'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_)=>MainViewModel()),
    ChangeNotifierProvider(create: (_)=> DetailsViewModel()),
  ],
  child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData.dark(),
      home: const HomeScreen(),
    );
  }
}
