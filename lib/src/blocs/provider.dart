import 'package:flutter/material.dart';
import 'block.dart';

class Provider  extends InheritedWidget  {

  final block=Block();

  Provider({Key mkey,Widget mchild})
  :super(key:mkey,child:mchild);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
  
  static Block of (BuildContext context){
    return (context.inheritFromWidgetOfExactType(Provider) as Provider).block;
  }


}