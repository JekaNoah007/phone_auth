part of '../sms_screen.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mv = context.watch<ProviderSms>();
    return RepositoryProvider(
      create: (context) => AuthRepoImpl(),
      child: BlocProvider.value(
        value: AuthBloc(
          repo: RepositoryProvider.of<AuthRepoImpl>(context),
        ),
        child: BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
          if (state is AuthSuccess) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const UserAuth(),
              ),
            );
          }
          if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("ERROR"),
              ),
            );
          }
        }, builder: (context, state) {
          return SizedBox(
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (state is! AuthLoading && mv.isFullFilled.value) {
                  BlocProvider.of<AuthBloc>(context).add(
                    AuthSendCodeEvent(codeNumber: mv.controller.text),
                  );
                }
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  mv.isFullFilled.value
                      ? Colors.blue
                      : Colors.blue.withOpacity(0.5),
                ),
              ),
              child: state is AuthLoading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : Text(
                      "Отправить смс-код".toUpperCase(),
                    ),
            ),
          );
        }),
      ),
    );
  }
}
