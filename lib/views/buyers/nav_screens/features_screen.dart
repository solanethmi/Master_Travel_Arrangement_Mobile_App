import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:master_travel/views/buyers/nav_screens/widgets/features_widget.dart';
import 'package:master_travel/views/buyers/nav_screens/widgets/text_widget.dart';

class CategoryScreen extends StatelessWidget {
   CategoryScreen({super.key});
List <Color> gridColors= [
  const Color.fromARGB(255, 242, 163, 157),
const Color.fromARGB(255, 134, 250, 138),
const Color.fromARGB(255, 136, 196, 245),
const Color.fromARGB(255, 247, 173, 197),
const Color.fromARGB(255, 244, 236, 158),
const Color.fromARGB(255, 233, 170, 244)
];   
List<Map<String,dynamic>> catInfo =[
  {
    'imgPath': 'assets/category/hiking.jpg',
    'catText': 'Hiking'
  },
  {
    'imgPath': 'assets/category/boat.jpg',
    'catText': 'Boat Tour'
  },
  {
    'imgPath': 'assets/category/cultural.jpg',
    'catText': 'Cultural Places'
  },
  {
    'imgPath': 'assets/category/airballons.jpg',
    'catText': 'Ballon Flight'
  },
  {
    'imgPath': 'assets/category/camping.jpg',
    'catText': 'Camping'
  },
  {
    'imgPath': 'assets/category/bicycle.jpg',
    'catText': 'Riding'
  },
];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0, 
        backgroundColor: Color.fromARGB(255, 248, 194, 129),
        title: TextWidget(text: "Features", textSize: 20),),
      
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.count(
          
          crossAxisCount: 2,
        childAspectRatio: 240/250,
        crossAxisSpacing: 15,
        mainAxisSpacing: 25,
        children: List.generate(6, (index) {
          return FeaturesWidget(
            catText: catInfo[index]['catText'],
            imgPath: catInfo[index]['imgPath'],
            color: gridColors[index],
          );
        }),
        ),
      )
      );
    
  }
}