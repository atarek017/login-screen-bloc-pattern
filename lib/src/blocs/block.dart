import 'dart:async';
import 'valedators.dart';
import 'package:rxdart/rxdart.dart';

class Block extends Object with Validators{
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  //add data to stream
  Stream<String> get email => _emailController.stream.transform(validatEmail);
  Stream<String> get password => _passwordController.stream.transform(validatPassword);
  Stream<bool> get submitValid => Observable.combineLatest2(email, password, (e,p)=>true);


  submit(){
    final validEmail=_emailController.value;
    final validPassword=_passwordController.value;

    print("Email : $validEmail");
    print("Password : $validPassword");
    
  }

  //change data
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changepassword => _passwordController.sink.add;

  dispose(){
    _emailController.close();
    _passwordController.close();
  }
}


