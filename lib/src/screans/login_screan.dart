import 'package:flutter/material.dart';
import '../blocs/block.dart';
import '../blocs/provider.dart';

class LoginScrean extends StatelessWidget {
  Widget build(context) {
    final bloc = Provider.of(context); // is eaual to  final bloc=Block();

    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          emailField(bloc),
          passwordFiled(bloc),
          SizedBox(
            height: 25,
          ),
          sbmitButton(bloc),
        ],
      ),
    );
  }

  Widget emailField(Block bloc) {
    return StreamBuilder(
      stream: bloc.email,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.changeEmail,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              hintText: 'you@sample.com',
              labelText: 'Email Address',
              errorText: snapshot.error),
        );
      },
    );
  }

  Widget passwordFiled(Block bloc) {
    return StreamBuilder(
      stream: bloc.password,
      builder: (context, snapshot) {
        return TextField(
          obscureText: true,
          keyboardType: TextInputType.text,
          onChanged: bloc.changepassword,
          decoration: InputDecoration(
              hintText: 'password',
              labelText: 'Password',
              errorText: snapshot.error),
        );
      },
    );
  }

  Widget sbmitButton(Block bloc) {
    return StreamBuilder(
      stream: bloc.submitValid,
      builder: (context, snapshot) {
        return RaisedButton(
          child: Text('Login'),
          color: Colors.blue,
          onPressed: snapshot.hasData ? bloc.submit : null,
        );
      },
    );
  }
}
