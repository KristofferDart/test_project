import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_project/features/cocktail/model/cocktail_model.dart';
import 'package:test_project/features/cocktail/view_model/cocktail_view_model.dart';
import 'package:test_project/features/cocktail/widgets/config_item.dart';
import 'package:test_project/utlities/asset_images.dart';

import '../../components/shimmer_loader.dart';

class CocktailDetailsViewArgs {
  CocktailDetailsViewArgs({required this.drinks});

  Drinks? drinks;
}

class CocktailDetailsView extends StatelessWidget {
  const CocktailDetailsView({Key? key, required this.args}) : super(key: key);
  final CocktailDetailsViewArgs args;
  static const String route = 'cocktail-details-page';

  @override
  Widget build(BuildContext context) {
    CocktailViewModel cocktailViewModel = context.watch<CocktailViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: Text("How to make the drink"),
      ),
      body: _ui(cocktailViewModel, context),
    );
  }

  _ui(CocktailViewModel cocktailViewModel, BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  height: MediaQuery.of(context).size.height * 0.25,
                  fit: BoxFit.scaleDown,
                  imageUrl: args.drinks?.strDrinkThumb ?? "",
                  placeholder: (context, string) {
                    return const ShimmerLoader();
                  },
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              args.drinks?.strDrink ?? "",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              maxLines: 2,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              args.drinks?.strCategory ?? "",
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(
              height: 20,
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Instructions",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                )),
            SizedBox(
              height: 10,
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  args.drinks?.strInstructions ?? "",
                  style: TextStyle(fontSize: 14),
                )),
            SizedBox(
              height: 20,
            ),
            DrinkConfigItem(
              label: "Glass",
              icon: AssetImages.icGlass,
              value: args.drinks?.strGlass ?? "",
            ),
            SizedBox(
              height: 10,
            ),
            args.drinks?.strTags == null
                ? Container()
                : DrinkConfigItem(
                    label: "Tags",
                    icon: AssetImages.icTag,
                    value: args.drinks?.strTags ?? "",
                  ),
            SizedBox(
              height: 10,
            ),
            DrinkConfigItem(
              label: "Alcoholic",
              icon: AssetImages.icAlcoholic,
              value: null,
              iconValue: args.drinks?.strAlcoholic == "Alcoholic" ? AssetImages.icCheck : AssetImages.icX
            ),
          ],
        ),
      ),
    );
  }
}
