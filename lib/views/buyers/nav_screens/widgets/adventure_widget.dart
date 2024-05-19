import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AdventureWidget extends StatefulWidget {
  @override
  State<AdventureWidget> createState() => _AdventureWidgetState();
}

class _AdventureWidgetState extends State<AdventureWidget> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final List _adventureImage = [];

  getAdventures(){
    return _firestore
        .collection('adventures')
        .get()
        .then((QuerySnapshot querySnapshot){

      querySnapshot.docs.forEach((doc) { 
        setState(() {
          _adventureImage.add(doc['image']);
        });
      });
    });
  }

  @override
  void initState() {
    getAdventures();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50.0),
      
        child: Container(
          height: 170,
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 45, 251, 241),
            borderRadius: BorderRadius.circular(20)
          ),
      
          child:PageView.builder(
            itemCount: _adventureImage.length,
            itemBuilder: (context,index){
            return ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                _adventureImage[index],
                fit: BoxFit.cover,
              ),
            );
          },
          ),
          ),
      
        );
  }
  }