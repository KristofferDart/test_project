
import 'package:flutter/cupertino.dart';

class OtpViewModel extends ChangeNotifier{
  final _phoneNumberController = TextEditingController();

  get phoneNumberController => _phoneNumberController;

}