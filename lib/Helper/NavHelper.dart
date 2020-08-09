import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class NavHelper
{

  static push(c, t)
  {
    Navigator.push(
        c,
        PageTransition(
            type: PageTransitionType.upToDown, child: t));
  }

  static pushR(c, t)
  {
    Navigator.pushReplacement(
        c,
        PageTransition(
            type: PageTransitionType.upToDown, child: t));
  }

}