import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:master_travel/controllers/auth_controllers.dart';
import 'package:master_travel/utils/show_snackBar.dart';
import 'package:master_travel/views/buyers/auth/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final AuthController _authController = AuthController();  

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late String email;

  late String fullName;

  late String phoneNumber;

  late String password;

  bool _isLoading = false;

  Uint8List ? _image;

  _signUpUser() async{
    setState(() {
      _isLoading = true;
    });
   if(_formKey.currentState!.validate()){
    await _authController.signUpUsers(
    email, fullName, phoneNumber, password, _image).whenComplete(() {
      setState(() {
        _formKey.currentState!.reset();
        _isLoading = false;
      });
    });
    return showSnack(
      context, 'Congratulations Account has been create for you');
   }else{
    setState(() {
      _isLoading = false;
    });
    return showSnack(context, 'Please Fields must not be empty ');
   }
  }

  selectGalleryImage() async{
   Uint8List im= await _authController.pickProfileImage(ImageSource.gallery);
   setState(() {
     _image = im;
   });
  }

  selectCameraImage() async{
   Uint8List im= await _authController.pickProfileImage(ImageSource.camera);
   setState(() {
     _image = im;
   });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Container(
              height: 900,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/images/b2-reg.jpg",),
        fit: BoxFit.cover,
        opacity: 0.9,
            ) ,
            ),
            
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Create Account.',
                  style: TextStyle(fontSize: 35),
                  ),
                  Stack(
                    children: [
                    _image != null 
                      ? CircleAvatar(
                          radius: 50,
                          backgroundColor: Color.fromARGB(255, 130, 220, 224),
                          backgroundImage: MemoryImage(_image!),
                        )
                      : CircleAvatar(
                          radius: 50,
                          backgroundColor: Color.fromARGB(255, 110, 219, 229),
                          //backgroundImage: NetworkImage('https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.freepik.com%2Ffree-photos-vectors%2Fdefault-user&psig=AOvVaw1Jc668_Ko7c3sJ2xKpPbSx&ust=1699071440127000&source=images&cd=vfe&ved=0CBIQjRxqFwoTCNC-tr_8poIDFQAAAAAdAAAAABAE'),
                        ),
                  Positioned(
                    right: 5,
                    top: 5,
                    child: IconButton(
                    onPressed: () {
                     selectGalleryImage();
                    },
                    icon: Icon(
                      CupertinoIcons.photo,
                      
                      ),
                    ),
                    ),
                  ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextFormField(
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Email not be empty';
                        }else{
                          return null;
                        }
                      },
                      onChanged: (value) {
                        email = value;
                      },
                      decoration: InputDecoration(
                      labelText: 'Enter Email',
                      
                    ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Full Name not be empty';
                        }else{
                          return null;
                        }
                      },
                      onChanged: (value) {
                        fullName = value;
                      },
                      decoration: InputDecoration(
                      labelText: 'Enter Full Name',
                    ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Phone Number not be empty';
                        }else{
                          return null;
                        }
                      },
                      onChanged: (value) {
                        phoneNumber = value;
                      },
                      decoration: InputDecoration(
                      labelText: 'Enter Phone Number',
                    ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      obscureText: true
                      ,
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Password not be empty';
                        }else{
                          return null;
                        }
                      },
                      onChanged: (value) {
                        password = value;
                      },
                      decoration: InputDecoration(
                      labelText: 'Password',
                    ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  GestureDetector(
                    onTap: (){
                      _signUpUser();
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width -40,
                      height: 50,
                      decoration: BoxDecoration(
                      color: Color.fromARGB(255, 12, 83, 18),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: _isLoading? CircularProgressIndicator(
                        color: Colors.white,
                      ): Text(
                        'REGISTER',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 5,
                          ),
                          )
                          ),
                    ),
                  ),
                    
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already Have an Account',style: TextStyle(fontSize: 20,),),
                      TextButton(onPressed: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context){
                          return LoginScreen();
                        }));
                      },
                       child: Text('Log in',style: TextStyle(fontSize: 25,),),
                       ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}