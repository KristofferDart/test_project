import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_project/features/otp/view_model/otp_view_model.dart';
import 'package:provider/provider.dart';
import 'package:test_project/features/otp/widgets/app_button.dart';
import 'package:test_project/features/otp/widgets/bottom_sheet_container.dart';
import 'package:test_project/features/otp/widgets/header.dart';
import 'package:test_project/features/otp/widgets/app_textfield.dart';
import 'package:test_project/features/otp/widgets/otp_textfield.dart';


import '../../utlities/asset_images.dart';

class OtpView extends StatelessWidget {
  const OtpView({Key? key}) : super(key: key);

  static const String route = 'otp-page';

  @override
  Widget build(BuildContext context) {
    OtpViewModel otpViewModel = context.watch<OtpViewModel>();
    return Scaffold(
      backgroundColor: Color(0xFFFBFBFB),
      body: _ui(otpViewModel, context),
    );
  }

  _ui(OtpViewModel otpViewModel, BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Header(),
            BottomSheetContainer(
                child: SafeArea(
                  child: Column(
                    children: [
                      const Text(
                        "4 digit OTP is sent in your mobile\nPlease enter the OTP to verify number",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomOTPTextfield(),
                      SizedBox(height: 20,),
                      AppButton(label: 'Submit', callback: ()=> Navigator.pushNamed(context, OtpView.route),),
                      SizedBox(height: 20,),
                      Text("Didn't receive the OTP yet?", style: TextStyle(fontSize: 14, color: Colors.black),),
                      SizedBox(height: 5,),
                      GestureDetector(
                        onTap: ()=>ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Resend OTP"), duration: Duration(milliseconds: 500),
                        )),
                          child: Text("Resend OTP", style: TextStyle(color: Colors.red, fontSize: 14),))
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
