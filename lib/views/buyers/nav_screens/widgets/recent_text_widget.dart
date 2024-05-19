import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:master_travel/views/buyers/nav_screens/widgets/places_widget.dart';
import 'package:master_travel/views/buyers/nav_screens/widgets/text_widget.dart';

class RecentPlaces extends StatelessWidget {
  const RecentPlaces({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextWidget(text: "Most Famous Places", textSize: 20,isTitle: true,),
          TextButton(onPressed: (){
           // Navigator.pushNamed(context,PlacesWidget.routeName);
          },
           child: TextWidget(text: "view all", textSize: 20))
        ],
      ),
    );
  }
}