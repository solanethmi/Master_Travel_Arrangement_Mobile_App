import 'package:flutter/material.dart';
import 'package:master_travel/views/buyers/nav_screens/widgets/text_widget.dart';

class PopularDescription extends StatelessWidget {
  const PopularDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Row(
        children: [
          TextWidget(
            text: "22km", 
            textSize: 18),
            const SizedBox(width: 5,),
            Text("C. 22km", style: TextStyle(fontSize: 15,color: Colors.blue,decoration: TextDecoration.lineThrough,),)
            ],
      ),
    );
  }
}