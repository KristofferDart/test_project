

import 'package:flutter/cupertino.dart';
import 'package:test_project/utlities/asset_images.dart';

class DrinkConfigItem extends StatelessWidget{
  const DrinkConfigItem({Key? key, required this.value, required this.icon, required this.label, this.iconValue}) : super(key: key);

  final String? value;
  final String icon;
  final String label;
  final String? iconValue;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      children: [
        Image.asset(icon, height: 25, width: 25,),
        SizedBox(width: 5,),
        Text("${label} :", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
        SizedBox(width: 10,),
        Text(value??"", style: TextStyle(fontSize: 14),),
        iconValue == null ? Container() : Image.asset(iconValue??"", height: 20, width: 20,),
      ],
    );
  }
}