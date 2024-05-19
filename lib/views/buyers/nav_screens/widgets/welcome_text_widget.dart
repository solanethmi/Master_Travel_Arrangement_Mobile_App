import 'package:flutter/material.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top: MediaQuery.of(context).padding.top,left: 25,right: 15),
      child: Row(
              
          
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Enjoy Life\n With Nature 👀',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              ),
              
           ],
          
       
      ),
    );
  }
}