
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_project/features/otp/view_model/otp_view_model.dart';
import 'package:provider/provider.dart';

class OtpView extends StatelessWidget{
  const OtpView({Key? key}) : super(key: key);

  static const String route = 'otp-page';

  @override
  Widget build(BuildContext context) {
    OtpViewModel otpViewModel = context.watch<OtpViewModel>();
    return Scaffold(

    );
  }
}