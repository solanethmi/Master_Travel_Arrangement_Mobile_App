import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:master_travel/views/buyers/nav_screens/widgets/text_widget.dart';

class FeaturesWidget extends StatelessWidget {
  const FeaturesWidget({Key? key,
   required this.catText,
   required this.imgPath,
   required this.color})
   :super(key: key);
  final String catText,imgPath;
  final Color color;

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: (){
        print("Category Pressed");
      },
      child: Container(
       // height: _screenWidth * 0.6,
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color:color.withOpacity(0.7),width: 2)
        ),
        child: Column(children: [
          Container(
            height: _screenWidth * 0.3,
            width: _screenWidth * 0.3,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imgPath,),
            fit: BoxFit.fill)),
          ),
          TextWidget(text: catText,
           textSize: 20,
           isTitle: true,),
        ],),
      ),
    );
  }
}