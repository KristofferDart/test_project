import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_project/features/otp/otp_view.dart';
import 'package:test_project/features/otp/view_model/otp_view_model.dart';
import 'package:provider/provider.dart';
import 'package:test_project/features/otp/widgets/app_button.dart';
import 'package:test_project/features/otp/widgets/bottom_sheet_container.dart';
import 'package:test_project/features/otp/widgets/header.dart';
import 'package:test_project/features/otp/widgets/app_textfield.dart';

import '../../utlities/asset_images.dart';

class OtpInitialView extends StatelessWidget {
  const OtpInitialView({Key? key}) : super(key: key);

  static const String route = 'otp-initial-page';

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
                    "Please provide your phone number,a\n4 digit OTP will be sent for verification",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  AppTextField(
                    textController: otpViewModel.phoneNumberController,
                    prefix: const Icon(
                      Icons.phone_outlined,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 20,),
                  AppButton(label: 'Send OTP', callback: ()=> Navigator.pushNamed(context, OtpView.route),),
                  Expanded(child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("By continuing, you agree to our", style: TextStyle(fontSize: 14),),
                     SizedBox(height: 3,),
                      Text.rich(
                        TextSpan(
                          style: TextStyle(fontSize: 14),
                          children: [
                            TextSpan(text: 'Terms ', style: TextStyle(color: Colors.red), recognizer: TapGestureRecognizer()..onTap = (){
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text("Terms"), duration: Duration(milliseconds: 500)
                              ));
                            }),
                            TextSpan(
                              text: '&',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(text: ' Condition', style: TextStyle(color: Colors.red), recognizer: TapGestureRecognizer()..onTap = (){
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text("Condition"), duration: Duration(milliseconds: 500),
                              ));
                            }),
                          ],
                        ),
                      ),
                      SizedBox(height: 20,)
                    ],
                  ))
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
