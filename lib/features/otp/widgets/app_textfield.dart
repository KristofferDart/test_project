
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextField extends StatelessWidget{
  const AppTextField({Key? key, required this.textController, this.prefix}) : super(key: key);

  final TextEditingController textController;
  final Widget? prefix;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 50,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: textController,
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ],
        decoration: InputDecoration(
            isDense: true,
            hintText: "Phone Number",
            border: OutlineInputBorder(
                borderSide:
                BorderSide(color: Colors.black38, width: 0.3),
                borderRadius: BorderRadius.circular(10)),
            enabledBorder: OutlineInputBorder(
                borderSide:
                BorderSide(color: Colors.black38, width: 0.3),
                borderRadius: BorderRadius.circular(10)),
            focusedBorder: OutlineInputBorder(
                borderSide:
                BorderSide(color: Colors.black38, width: 0.3),
                borderRadius: BorderRadius.circular(10)),
            prefixIcon: prefix
        ),
      ),
    );
  }
}