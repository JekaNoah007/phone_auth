part of '../phone_auth_screen.dart';

class BodyAuth extends StatelessWidget {
  const BodyAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<ProviderPhoneAuth>();
    final providerRead = context.read<ProviderPhoneAuth>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Укажите номер телефона \nдля авторизации",
          style:
              TextStyle(fontSize: 18, height: 1.5, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 50),
        TextField(
          controller: vm.controller,
          onChanged: (value) {
            if (value.length == 10) {
              providerRead.setIsFullFilled();
            } else {
              providerRead.setNotFullFilled();
            }
          },
          decoration: InputDecoration(
              labelText: "Введите номер телефона",
              border: OutlineInputBorder(
                borderRadius: AppTheme.br,
                borderSide: const BorderSide(width: 2),
              )),
        ),
        const SizedBox(
          height: 24,
        ),
        const ButtonWidget(),
      ],
    );
  }
}
