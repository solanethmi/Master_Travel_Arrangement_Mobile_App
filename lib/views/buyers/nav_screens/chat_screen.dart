import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatefulWidget {
  static const String routeName = '/chatScreen';

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _teamMembersController = TextEditingController();
  final TextEditingController _tripDateController = TextEditingController();
  bool _needGuide = false;

  Future<void> _submitTripDetails() async {
    String name = _nameController.text.trim();
    String phoneNumber = _phoneNumberController.text.trim();
    String location = _locationController.text.trim();
    String teamMembers = _teamMembersController.text.trim();
    String tripDate = _tripDateController.text.trim();

    if (name.isNotEmpty &&
        phoneNumber.isNotEmpty &&
        location.isNotEmpty &&
        teamMembers.isNotEmpty &&
        tripDate.isNotEmpty) {
      await FirebaseFirestore.instance.collection('trips').add({
        'name': name,
        'phoneNumber': phoneNumber,
        'location': location,
        'teamMembers': teamMembers,
        'tripDate': tripDate,
        'needGuide': _needGuide,
      });

      // Add any additional logic or navigation after submitting to Firebase

      // Clear text fields after submission
      _nameController.clear();
      _phoneNumberController.clear();
      _locationController.clear();
      _teamMembersController.clear();
      _tripDateController.clear();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Trip details submitted successfully!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill in all fields')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Make a Trip'),
        backgroundColor: Color.fromARGB(255, 233, 177, 114), // Set AppBar color
      ),
      body: Container(
        height: 900,
        decoration: BoxDecoration(
           image: DecorationImage(image: AssetImage("assets/images/b-chat.jpg",),
        fit: BoxFit.cover,
        opacity: 0.4,
        
        ),),
       // color: Colors.yellow, // Set the remaining screen space color
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Your Name'),
              ),
              SizedBox(height: 28),
              TextFormField(
                controller: _phoneNumberController,
                decoration: InputDecoration(labelText: 'Your Phone Number'),
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 28),
              TextFormField(
                controller: _locationController,
                decoration: InputDecoration(labelText: 'Location'),
              ),
              SizedBox(height: 28),
              TextFormField(
                controller: _teamMembersController,
                decoration: InputDecoration(labelText: 'Number of Team Members'),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 28),
              TextFormField(
                controller: _tripDateController,
                decoration: InputDecoration(labelText: 'Trip Date',),
              ),
              SizedBox(height: 28),
              Row(
                children: [
                  Text('Need a Trip Guide?',style: TextStyle(fontSize: 20,),),
                  SizedBox(width: 12),
                  Checkbox(
                    value: _needGuide,
                    onChanged: (value) {
                      setState(() {
                        _needGuide = value!;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 120),
              ElevatedButton(
                onPressed: _submitTripDetails,
                child: Text('Submit',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
