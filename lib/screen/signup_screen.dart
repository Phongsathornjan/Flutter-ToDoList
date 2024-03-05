import 'package:flutter/material.dart';
import 'package:onboarding_screen/component/my_botton.dart';
import 'package:onboarding_screen/component/my_textfield.dart';
import 'package:onboarding_screen/screen/signin_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final namecontroller = TextEditingController();

  final emailcontroller = TextEditingController();

  final pass1controller = TextEditingController();

  final pass2controller = TextEditingController();

  signUp() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailcontroller.text,
        password: pass1controller.text,
      );
      print('Create successfully');
      _showMyDialog('Successfully');
    } on FirebaseAuthException catch (e) {
      print('Failed with error code : ${e.code}');
      print(e.message);

      if (e.code == 'weak-password') {
        _showMyDialog('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        _showMyDialog('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
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
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        Center(
          child: Form(
            child: Container(
              decoration: const BoxDecoration(
                  color: Color.fromARGB(230, 240, 233, 233),
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              width: 300,
              height: 510,
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  MyTextFiled(
                      controller: namecontroller,
                      hintText: 'Enter your name.',
                      obscureText: false,
                      labelText: 'Name'),
                  const SizedBox(
                    height: 25,
                  ),
                  MyTextFiled(
                      controller: emailcontroller,
                      hintText: 'Enter your email',
                      obscureText: false,
                      labelText: 'Email'),
                  const SizedBox(
                    height: 25,
                  ),
                  MyTextFiled(
                      controller: pass1controller,
                      hintText: 'Enter your password',
                      obscureText: true,
                      labelText: 'Password'),
                  const SizedBox(
                    height: 25,
                  ),
                  MyTextFiled(
                      controller: pass2controller,
                      hintText: 'Enter your password again',
                      obscureText: true,
                      labelText: 'Re-Password'),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MyButton(onTap: signUp, hinText: 'Sign in'),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Have a member ? '),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomeScreen()));
                        },
                        child: Text('Sign in.'),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
