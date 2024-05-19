import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:master_travel/controllers/auth_controllers.dart';
import 'package:master_travel/utils/show_snackBar.dart';
import 'package:master_travel/views/buyers/auth/register_screen.dart';
import 'package:master_travel/views/buyers/main_screen.dart';

class LoginScreen extends StatefulWidget {
  

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AuthController _authController = AuthController();

  late String email;

  late String password;

  bool _isLoading = false;


  _loginUsers()async{
    setState(() {
      _isLoading = true;
    }); 
    if(_formKey.currentState!.validate()){
      await _authController.loginUsers(email,password);

       return Navigator.pushReplacement(context,
       MaterialPageRoute(builder: (BuildContext context){
        return MainScreen();
       })); 
      
    }else{
      setState(() {
        _isLoading = false;
      });
      return showSnack(context, 'Please fields must not be empty');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      

      backgroundColor: Color.fromARGB(255, 165, 134, 140),
      
      body: Center(

        //decoration: const BoxDecoration(
          //image: DecorationImage(image: AssetImage("assets/images/bg.jpg"),
          //fit: BoxFit.cover,
         // opacity: 0.7)
        //),

        child: SingleChildScrollView(
          
          child: Form(
            key: _formKey,
            child: Container(
              height: 600,
              decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/images/b-log.jpg",),
        fit: BoxFit.cover,
        opacity: 0.9,
        
        ),
        
      ),
              child: Column(
                
                mainAxisAlignment: MainAxisAlignment.center,
                
                children: [
                  Text(
                    'Log In Account',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      ),
                      ),
            
            
            
            
            
            
                    
                    SizedBox(height: 30,),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty){
                              return 'Email Field not be empty';
                            }else{
                              return null;
                            }
                          },
                          onChanged: (value) {
                            email= value;
                          },
                          decoration: InputDecoration(
                          labelText: 'Enter Email',
                        ),
                        ),
                      ),
            
                               
                      Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: TextFormField(
                          obscureText: true,
                          validator: (value){
                            if(value!.isEmpty){
                              return 'Password Field not be Empty';
                            }else{
                              return null;
                            }
                          },
                          onChanged: (value) {
                            password= value;
                          },
                          decoration: InputDecoration(
                          labelText: 'Enter Password',
                          
                          
                        ),
                        ),
                      ),
                      
                      SizedBox(height: 20,),
                      
                      InkWell(
                        onTap: () {
                          _loginUsers();
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width -40,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 174, 124, 80),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Center(
                            child:_isLoading
                            ? CircularProgressIndicator(
                              color: Colors.white,
                            ) 
                            :Text(
                              'LOG IN',
                              style: TextStyle(
                                letterSpacing: 5,
                                color: Colors.white,
                                fontSize: 30,
                                
                              ),
                            ),
                          ),
                        ),
                      ),
                      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        Text('Dont have an Account?',style: TextStyle(fontSize: 20,),),
                        TextButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen()));
                        },
                         child: Text(
                          'Register',
                          style: TextStyle(fontSize: 25,),
                         ),
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