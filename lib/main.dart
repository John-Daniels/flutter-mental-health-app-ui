import 'package:flutter/material.dart';

import 'screens/HomeScreen.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        iconTheme: const IconThemeData(color: Colors.white),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          elevation: 0,
          selectedIconTheme: IconThemeData(
            color: Colors.blue[600],
          ),
          unselectedIconTheme: IconThemeData(
            color: Colors.indigo[100],
          ),
        ),
        bottomSheetTheme: const BottomSheetThemeData(
            backgroundColor: Colors.transparent,
            elevation: 0,
            clipBehavior: Clip.antiAlias,
            modalBackgroundColor: Colors.white,
            modalElevation: 0),
      ),
      home: const HomeScreen(),
    );
  }
}
