class AuthRepoImpl {
  @override
  Future<bool> sendNumber({required String phone}) async {
    if (phone.length == 10) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> sendCodeNumber({required String code}) async {
    if (code.length == 4) {
      return true;
    } else {
      return false;
    }
  }
}
