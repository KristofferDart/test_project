
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utlities/asset_images.dart';

class Header extends StatelessWidget{
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        SafeArea(
            child: SizedBox(
              height: 20,
            )),
        Text(
          "Login or Sign up",
          style: TextStyle(
              color: Colors.black87,
              fontSize: 25,
              fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.1,
        ),
        Image.asset(
          AssetImages.logo,
          height: MediaQuery.of(context).size.height * 0.25,
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}