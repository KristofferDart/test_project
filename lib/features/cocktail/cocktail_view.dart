import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:test_project/features/cocktail/cocktail_details_view.dart';
import 'package:test_project/features/cocktail/view_model/cocktail_view_model.dart';
import 'package:test_project/features/cocktail/widgets/cocktail_item.dart';

import '../../components/app_error.dart';
import '../../components/app_loading.dart';
import '../../components/load_more_footer.dart';
import '../../components/shimmer_loader.dart';

class CocktailView extends StatefulWidget {
  const CocktailView({Key? key}) : super(key: key);

  static const String route = 'cocktail-page';

  @override
  State<CocktailView> createState() => _CocktailViewState();
}

class _CocktailViewState extends State<CocktailView> {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CocktailViewModel cocktailViewModel = context.watch<CocktailViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Cocktails"),
      ),
      body: _ui(cocktailViewModel, context),
    );
  }

  _ui(CocktailViewModel cocktailViewModel, BuildContext context) {
    if (cocktailViewModel.loading) {
      return AppLoading();
    }
    if (cocktailViewModel.userError != null) {
      return AppError(error: cocktailViewModel.userError);
    }
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SmartRefresher(
        controller: cocktailViewModel.refreshController,
        onRefresh: () => fetchNewData(cocktailViewModel),
        enablePullUp: true,
        onLoading: () => fetchNewData(cocktailViewModel),
        footer: LoadMoreFooter(),
        child: ListView.separated(
          separatorBuilder: (context, index) => Divider(
            height: 40,
          ),
          itemBuilder: (context, index) {
            return CocktailItem(
                drinks: cocktailViewModel.cocktailModel?.drinks?[index],
                onViewInstructions: () => Navigator.pushNamed(
                    context, CocktailDetailsView.route,
                    arguments: CocktailDetailsViewArgs(
                        drinks:
                            cocktailViewModel.cocktailModel?.drinks?[index])));
          },
          itemCount: cocktailViewModel.cocktailModel?.drinks?.length ?? 0,
        ),
      ),
    );
  }

  fetchNewData(CocktailViewModel cocktailViewModel){
    cocktailViewModel.fetchCocktailNewData();
  }
}
