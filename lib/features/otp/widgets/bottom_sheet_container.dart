
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomSheetContainer extends StatelessWidget{
  const BottomSheetContainer({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Expanded(
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(40))),
        child: child,
        ),);
  }
}