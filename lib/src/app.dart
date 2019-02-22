import 'package:flutter/material.dart';
import 'screans/login_screan.dart';
import 'blocs/provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
        mchild: MaterialApp(
      title: 'Log me IN',
      home: Scaffold(
        body: LoginScrean(),
        //body: HomePage(),
      ),
    ));
  }
}
