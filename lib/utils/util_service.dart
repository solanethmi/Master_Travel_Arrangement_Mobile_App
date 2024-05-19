import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Utils{
  BuildContext context;
  Utils(this.context);

  Size get getScreenSize => MediaQuery.of(context).size;

}