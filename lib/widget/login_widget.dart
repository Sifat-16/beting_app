import 'dart:ui';

import 'package:flutter/material.dart';


class LoginWidget extends StatelessWidget {
  const LoginWidget({Key? key,
  required this.child,
  required this.h,
  required this.w
  }) : super(key: key);

  final Widget child;
  final double h;
  final double w;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            blurRadius: 24,
            spreadRadius: 16,
            color: Colors.black.withOpacity(0.07),
          )
        ]),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5.0),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 1.0,
              sigmaY: 1.0,
            ),
            child: Container(
              height: h,
              width: w,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(5.0),
                  border: Border.all(
                    width: 1.5,
                    color: Colors.white.withOpacity(0.2),
                  )),
                  child: child,
            ),
          ),
        ));
  }
}
