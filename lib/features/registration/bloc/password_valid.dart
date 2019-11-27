import 'package:rxdart/rxdart.dart';
class PasswordValidator {
  
  // Stream<bool> get registerValid => Observable.combineLatest3(
  //                                     email, 
  //                                     password, 
  //                                     confirmPassword, 
  //                                     (e, p, c) => (0 == p.compareTo(c))
  //                                   );

Stream<String> get confirmPassword => _passwordConfirmController.stream.transform(validatePassword)
    .doOnData((String c){
      // If the password is accepted (after validation of the rules)
      // we need to ensure both password and retyped password match
      if (0 != _passwordController.value.compareTo(c)){
        // If they do not match, add an error
        _passwordConfirmController.addError("No Match");
      }
    });
}