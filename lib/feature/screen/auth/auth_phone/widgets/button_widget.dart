part of '../phone_auth_screen.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<ProviderPhoneAuth>();
    return RepositoryProvider(
      create: (context) => AuthRepoImpl(),
      child: BlocProvider(
        create: (context) => AuthBloc(
          repo: RepositoryProvider.of<AuthRepoImpl>(context),
        ),
        child: BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
          if (state is AuthSuccess) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SmsScreen(),
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
                if (state is! AuthLoading && vm.isFullFilled.value) {
                  BlocProvider.of<AuthBloc>(context).add(
                    AuthSendNumberEvent(phoneNumber: vm.controller.text),
                  );
                }
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  vm.isFullFilled.value
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
