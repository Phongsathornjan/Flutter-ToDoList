import 'package:flutter/material.dart';
import 'package:onboarding_screen/component/my_botton.dart';
import 'package:onboarding_screen/component/my_textfield.dart';
import 'package:onboarding_screen/screen/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:onboarding_screen/screen/todolist_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //text editing controller
  final emailcontroller = TextEditingController();
  final passcontroller = TextEditingController();

  signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailcontroller.text,
        password: passcontroller.text,
      );
      print('Login successfully');
      _showMyDialog('Login successfully');
    } on FirebaseAuthException catch (e) {
      print('Failed to login');
      print('Failed with error code : ${e.code}');
      print(e.message);

      if (e.code == 'invalid-credential') {
        _showMyDialog('Invalid email or password');
      }
    }
  }

  void _showMyDialog(String txtMsg) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Expanded(
              child: AlertDialog(
            backgroundColor: Color.fromARGB(255, 233, 135, 7),
            title: const Text('status'),
            content: Text(txtMsg),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text('Cancel'),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ToDoListScreen()));
                  },
                  child: const Text('OK'))
            ],
          ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Positioned(
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/background.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 45, vertical: 141),
              child: Form(
                child: Container(
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(220, 255, 255, 255),
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  width: 300,
                  height: 500,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      MyTextFiled(
                          controller: emailcontroller,
                          hintText: 'Enter your email.',
                          obscureText: false,
                          labelText: 'Email'),
                      const SizedBox(
                        height: 25,
                      ),
                      MyTextFiled(
                          controller: passcontroller,
                          hintText: 'Enter your password',
                          obscureText: true,
                          labelText: 'Password'),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 140,
                          ),
                          Text('Forgot Password?'),
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      MyButton(onTap: signIn, hinText: 'Sign in'),
                      const SizedBox(
                        height: 25,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Row(
                          children: [
                            const Expanded(
                              child: Divider(
                                thickness: 0.5,
                                color: Colors.grey,
                              ),
                            ),
                            Text('Or continue with?'),
                            const Expanded(
                              child: Divider(
                                thickness: 0.5,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              decoration: const BoxDecoration(
                                  color: Color.fromARGB(132, 255, 255, 255),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              width: 70,
                              height: 70,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/images/googleicon.png",
                                    width: 50,
                                    height: 50,
                                  )
                                ],
                              )),
                          const SizedBox(
                            width: 15,
                          ),
                          Container(
                              decoration: const BoxDecoration(
                                  color: Color.fromARGB(132, 255, 255, 255),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              width: 70,
                              height: 70,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/images/appleicon.png",
                                    width: 50,
                                    height: 50,
                                  )
                                ],
                              )),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Not a member ? '),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUpScreen()));
                            },
                            child: Text('Register now.'),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 140, vertical: 70),
              child: Container(
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(120, 255, 255, 255),
                      borderRadius: BorderRadius.all(Radius.circular(90))),
                  width: 100,
                  height: 100,
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/logo.png",
                      )
                    ],
                  )),
            ),
          ],
        ));
  }
}
