import 'package:auth_project/feature/bloc/auth_bloc.dart';
import 'package:auth_project/feature/repositories/api_repo_impl.dart';
import 'package:auth_project/feature/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../sms/sms_screen.dart';
import 'provider.dart';

part 'widgets/body_auth.dart';
part 'widgets/button_widget.dart';

class AuthScreenPhone extends StatelessWidget {
  const AuthScreenPhone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProviderPhoneAuth(),
      child: const Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: BodyAuth(),
          ),
        ),
      ),
    );
  }
}
