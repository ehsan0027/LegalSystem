abstract class AuthRepository {
  Future<String> userAuth(String email, String password);
}

class AuthRepositoryImpl extends AuthRepository {

  @override
  Future<String> userAuth(String email, String password) async{
    return Future.delayed(Duration(seconds: 2), () {
      return "Login Successful";
    });
  }

}
