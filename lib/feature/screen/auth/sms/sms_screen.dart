import 'package:auth_project/feature/bloc/auth_bloc.dart';
import 'package:auth_project/feature/repositories/api_repo_impl.dart';
import 'package:auth_project/feature/screen/auth/registration/user_auth.dart';
import 'package:auth_project/feature/screen/auth/sms/provider.dart';
import 'package:auth_project/feature/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

part 'widgets/body_sms.dart';
part 'widgets/button_widget.dart';

class SmsScreen extends StatelessWidget {
  const SmsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProviderSms(),
      child: const Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: BodySms(),
          ),
        ),
      ),
    );
  }
}
