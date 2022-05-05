
import 'package:flutter/cupertino.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class CustomOTPTextfield extends StatelessWidget{
  const CustomOTPTextfield({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return OTPTextField(
      length: 4,
      width: 280,
      fieldWidth: 50,
      style: TextStyle(
          fontSize: 14
      ),
      textFieldAlignment: MainAxisAlignment.spaceAround,
      fieldStyle: FieldStyle.box,
      onCompleted: (pin) {
        print("Completed: " + pin);
      },
    );
  }
}