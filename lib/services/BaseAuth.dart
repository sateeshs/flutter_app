//https://medium.com/coding-with-flutter/take-your-flutter-tests-to-the-next-level-e2fb15641809
abstract class BaseAuth {
  Future<String> signIn(String email, String password);
}