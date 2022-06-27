
import 'package:flutter/cupertino.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:test_project/features/cocktail/model/cocktail_model.dart';

import '../../../utlities/api_status.dart';
import '../../../utlities/user_services.dart';
import '../model/user_error.dart';

class CocktailViewModel extends ChangeNotifier{
  final TextEditingController _phoneNumberController = TextEditingController();
  bool _loading = false;
  CocktailModel? _cocktailModel;
  UserError? _userError;
  final _refreshController = RefreshController();

  TextEditingController get phoneNumberController => _phoneNumberController;
  bool get loading => _loading;
  CocktailModel? get cocktailModel => _cocktailModel;
  UserError? get userError => _userError;
  RefreshController get refreshController => _refreshController;



  setLoading(bool loading) async{
    _loading = loading;
    notifyListeners();
  }

  CocktailViewModel(){
    fetchCocktailData();
  }

  setRefreshController(){
    refreshController.loadComplete();
    refreshController.refreshCompleted();
    notifyListeners();
  }

  setCocktailModelData(CocktailModel cocktailModel){
    _cocktailModel = cocktailModel;
    notifyListeners();
  }

  setUserError(UserError  userError){
    _userError = userError;
  }

  fetchCocktailData() async{
    setLoading(true);
    var response = await UserServices.getCocktailData();
    if(response is Success){
      setCocktailModelData(response.response as CocktailModel);
    }
    if(response is Failure){
      UserError userError = UserError(code: response.code??-1, errorResponse: response.errorResponse);
      setUserError(userError);
    }
    setLoading(false);
  }

  fetchCocktailNewData() async{
    var response = await UserServices.getCocktailData();
    if(response is Success){
      setCocktailModelData(response.response as CocktailModel);
    }
    if(response is Failure){
      UserError userError = UserError(code: response.code??-1, errorResponse: response.errorResponse);
      setUserError(userError);
    }
    setRefreshController();
  }

}