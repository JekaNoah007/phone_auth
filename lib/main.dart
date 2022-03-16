import 'package:auth_project/feature/screen/auth/auth_phone/phone_auth_screen.dart';
import 'package:auth_project/feature/theme/theme.dart';
import 'package:flutter/material.dart';
import 'feature/screen/widgets/app_unfocuser.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      home: AppUnfocuser(child: AuthScreenPhone()),
    );
  }
}
