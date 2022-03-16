part of '../sms_screen.dart';

class BodySms extends StatelessWidget {
  const BodySms({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mv = context.watch<ProviderSms>();
    final providerRead = context.read<ProviderSms>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Введите код из смс",
          style:
              TextStyle(fontSize: 18, height: 1.5, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 50),
        TextField(
          controller: mv.controller,
          onChanged: (value) {
            if (value.length == 4) {
              providerRead.setIsFullFilled();
            } else {
              providerRead.setNotFullFilled();
            }
          },
          decoration: InputDecoration(
            labelText: "Введите код",
            border: OutlineInputBorder(
              borderRadius: AppTheme.br,
              borderSide: const BorderSide(width: 2),
            ),
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        const ButtonWidget(),
      ],
    );
  }
}
