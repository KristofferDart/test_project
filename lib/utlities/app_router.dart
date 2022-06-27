import 'package:flutter/material.dart';
import 'package:test_project/features/cocktail/cocktail_details_view.dart';

import '../features/cocktail/cocktail_view.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case CocktailView.route:
        return MaterialPageRoute<dynamic>(builder: (_) => const CocktailView());

      case CocktailDetailsView.route:
        final args = settings.arguments as CocktailDetailsViewArgs;
        return MaterialPageRoute<dynamic>(
            builder: (_) => CocktailDetailsView(
              args: args,
            ));

      default:
        return MaterialPageRoute<dynamic>(builder: (_) {
          return Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          );
        });
    }
  }
}
