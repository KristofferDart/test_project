

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:test_project/features/cocktail/model/cocktail_model.dart';

import '../../../components/shimmer_loader.dart';

class CocktailItem extends StatelessWidget{
  const CocktailItem({Key? key, required this.drinks, required this.onViewInstructions}) : super(key: key);

  final Drinks? drinks;
  final VoidCallback onViewInstructions;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onViewInstructions,
      child: SizedBox(
        height: 120,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                height: 120,
                width: 120,
                fit: BoxFit.cover,
                imageUrl: drinks?.strDrinkThumb ??
                    "",
                placeholder: (context, string) {
                  return const ShimmerLoader();
                },
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          drinks?.strDrink ??
                              "",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          maxLines: 2,
                        ),
                        SizedBox(height: 5,),
                        Text(
                          drinks?.strCategory ??
                              "",
                          style: TextStyle(fontSize: 14),
                        ),

                      ],
                    ),
                  ),
                  Text(
                      "Get instructions >",
                      style: TextStyle(fontSize: 14, color: Colors.blue, decoration: TextDecoration.underline,)
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}