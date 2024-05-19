import 'package:flutter/material.dart';
import 'package:master_travel/utils/util_service.dart';
import 'package:master_travel/views/buyers/nav_screens/widgets/banner_widget.dart';
import 'package:master_travel/views/buyers/nav_screens/widgets/popular_places.dart';

import 'package:master_travel/views/buyers/nav_screens/widgets/recent_text_widget.dart';
import 'package:master_travel/views/buyers/nav_screens/widgets/search_input_widget.dart';
import 'package:master_travel/views/buyers/nav_screens/widgets/text_widget.dart';

import 'package:master_travel/views/buyers/nav_screens/widgets/welcome_text_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
   Size size= Utils(context).getScreenSize; 
    
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/images/b-home.jpg",),
        fit: BoxFit.cover,
        opacity: 0.5,
        
        ),
        
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WelcomeText(),
           // SizedBox(height: 2,),
            SearchInputWidget(),
            BannerWidget(),
           // SizedBox(height: 1,),
            RecentPlaces(),
            PopularPlaces(),
         //  SingleChildScrollView(
           //  child: Row(
             //  children: [
               // RotatedBox(
                 // quarterTurns: -1,
          //        child: Row(children: [
            //        TextWidget(text: "Most Popular", textSize: 20,isTitle: true,)
              //    ],),
                //),
              //   Flexible(
                //   child: SizedBox(
                  //  height: size.height*0.24,
                    // child: ListView.builder(
             //         itemCount: 5,
               //       scrollDirection: Axis.horizontal,
                 //     itemBuilder: (ctx, index){
                   //   return PopularPlaces();
                     //}),
               //    ),
                 //),
                 
             //  ],
               
                 
           //  ),
              
         //  ),
           //Spacer(),
             //    TextButton(onPressed: (){}, child: TextWidget(text: "choose place", textSize: 16)),
            
            
            
            
            
          ],
        ),
      ),
    );
  }
}
