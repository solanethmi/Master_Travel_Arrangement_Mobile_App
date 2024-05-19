import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:master_travel/views/buyers/auth/login_screen.dart';
import 'package:master_travel/views/buyers/nav_screens/widgets/text_widget.dart';
import 'package:master_travel/views/buyers/nav_screens/widgets/welcome_text_widget.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final TextEditingController _addressTextController =
      TextEditingController(text: "");
  String _addressText = "My subtitle"; // Add this variable

  @override
  void dispose() {
    _addressTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Account'),
        backgroundColor: Color.fromARGB(255, 242, 197, 139),
      ),
      body: Container(
        height: 900,
       // color: Colors.yellow,
        decoration: BoxDecoration(
        
        image: DecorationImage(image: AssetImage("assets/images/dg-profile.jpg",),
        fit: BoxFit.cover,
        opacity: 0.3,
        
        ),
        
      ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  RichText(
                    text: TextSpan(
                      text: "Hi,   ",
                      style: const TextStyle(
                        color: Colors.cyan,
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: "Nimal",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.normal,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              print("My name is pressed");
                            },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  TextWidget(
                    text: "nimal@gmail.com",
                    textSize: 18,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(
                    thickness: 2,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  _listTiles(
                    title: "Address",
                    subtitle: _addressText, // Use the _addressText variable
                    icon: CupertinoIcons.profile_circled,
                    onPressed: () async {
                      await _showAddressDialog();
                    },
                  ),
                  _listTiles(
                      title: "Age",
                      icon: CupertinoIcons.number,
                      onPressed: () {}),
                  _listTiles(
                      title: "Manage Notifications",
                      icon: CupertinoIcons.mail,
                      onPressed: () {}),
                  _listTiles(
                      title: "Forget Password",
                      icon: CupertinoIcons.lock,
                      onPressed: () {}),
                  _listTiles(
                      title: "Logout",
                      icon: CupertinoIcons.lock_open,
                      onPressed: () {
                        _showLogoutDialog();
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

 Future<void> _showLogoutDialog() async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Row(
            children: [
              Image.asset(
                "assets/images/logout.jpg",
                height: 20,
                width: 20,
                fit: BoxFit.fill,
              ),
              SizedBox(
                width: 17,
              ),
              const Text("Sign out")
            ],
          ),
          content: const Text("Do you want to Sign Out?"),
          actions: [
            TextButton(
              onPressed: () {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
              },
              child: TextWidget(
                text: "Cancel",
                textSize: 18,
              ),
            ),
            TextButton(
              onPressed: () {
                // Navigate to the WelcomeText() screen
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              child: TextWidget(
                text: "OK",
                textSize: 18,
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> _showAddressDialog() async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Update"),
          content: TextField(
            onChanged: (value) {
              print("_addressTextController.text $_addressTextController.text");
            },
            controller: _addressTextController,
            maxLines: 5,
            decoration: const InputDecoration(hintText: "Your Address"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  _addressText = _addressTextController.text;
                });
                Navigator.pop(context);
              },
              child: const Text("Update"),
            ),
          ],
        );
      },
    );
  }

  Widget _listTiles({
    required String title,
    String? subtitle,
    required IconData icon,
    required Function onPressed,
  }) {
    return ListTile(
      title: TextWidget(
        text: title,
        textSize: 22,
      ),
      subtitle: TextWidget(
        text: subtitle == null ? "" : subtitle,
        textSize: 18,
      ),
      leading: Icon(icon),
      trailing: const Icon(CupertinoIcons.arrow_right),
      onTap: () {
        onPressed();
      },
    );
  }
}
