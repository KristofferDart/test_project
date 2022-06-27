import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:test_project/features/cocktail/model/cocktail_model.dart';

import 'api_status.dart';
import 'constants.dart';

class UserServices{
  static Future<Object> getCocktailData() async{
    try{

      var response =  await http.get(Uri.https("thecocktaildb.com", "/api/json/v1/1/search.php", {"s":"margarita"}));

      if(response.statusCode == 200){

        return Success(response: CocktailModel.fromJson(jsonDecode(response.body)));
      }
      return Failure(code: USER_INVALID_RESPONSE, errorResponse: 'Invalid Response');
    } on HttpException{
      return Failure(code: NO_INTERNET, errorResponse: 'No Internet');
    } on FormatException{
      return Failure(code: INVALID_FORMAT, errorResponse: 'Invalid Format');
    } catch (e){
      return Failure(code: UNKNOWN_ERROR, errorResponse: 'Unknown Error');
    }
  }
}