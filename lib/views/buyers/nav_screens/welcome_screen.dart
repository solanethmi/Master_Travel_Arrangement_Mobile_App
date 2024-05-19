import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:master_travel/views/buyers/auth/login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/images/bg.jpg"),
        fit: BoxFit.cover,
        opacity: 0.9),
        
      ),
      child: Material(
        color: Colors.transparent,
        child: SafeArea(child: Padding(padding: EdgeInsets.symmetric(vertical: 65,horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Enjoy",
              style: TextStyle(
                color: Colors.white,
                fontSize: 35,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
            SizedBox(height: 2,),
            Text(
              "the world!",
              style: TextStyle(
                color: Colors.white,
                fontSize: 35,
                fontWeight: FontWeight.w400,
                letterSpacing: 1.5,
              ),
            ),
            SizedBox(height: 12,),
            Text(
              "Embark on a seamless journey with our intuitive travel app. Discover destinations, plan itineraries, and access real-time updates. Your passport to hassle-free adventures awaits",
              style: TextStyle(
                color: Color.fromARGB(255, 10, 10, 10),
                fontSize: 16,
                letterSpacing: 1.2,
              ),
            ),
            SizedBox(height: 20,),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen(),
                ));

              },
              child: Ink(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Icon(CupertinoIcons.arrow_right_square,
                color: Colors.black,
                size: 30,),
              ),
            )
          ],
        ),)),
      ),
    );
  }
}