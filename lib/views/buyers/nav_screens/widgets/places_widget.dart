import 'package:flutter/material.dart';
import 'package:master_travel/utils/util_service.dart';
import 'package:master_travel/views/buyers/nav_screens/widgets/popular_places.dart';

class PlacesWidget extends StatelessWidget {
  static const routeName = "/OnPlacesScreen";
  const PlacesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size= Utils(context).getScreenSize; 
    return Scaffold(
      body: GridView.count(
      //  shrinkWrap: true,
        //physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 1,
        padding: EdgeInsets.all(10.0),
        childAspectRatio: size.width/(size.height * 0.4),
        children: List.generate(1, (index) {
          return  PopularPlaces();
        }),
      ),
    );
  }
}