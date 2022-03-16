import 'package:flutter/cupertino.dart';

class ProviderPhoneAuth with ChangeNotifier {
  final controller = TextEditingController();

  final isFullFilled = ValueNotifier<bool>(false);

  void setIsFullFilled() {
    isFullFilled.value = true;
    notifyListeners();
  }

  void setNotFullFilled() {
    isFullFilled.value = false;
    notifyListeners();
  }

  @override
  void dispose() {
    controller.dispose();
    isFullFilled.dispose();
    super.dispose();
  }
}
