import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:motomechdashboard/ui/auth/signup_screen.dart';
import 'package:motomechdashboard/ui/screens/main_dashboard.dart';

import '../../utils/utils.dart';
import '../../widgets/roundButton.dart';
import 'login_with_phone.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool loading = false;
  final _formKey= GlobalKey<FormState>();
  final emailController= TextEditingController();
  final passwordController = TextEditingController();

  final _auth = FirebaseAuth.instance;  //to create auth for login with mail

  @override
  void dispose() {
    super.dispose();
    // to remove these fields when not in use
    emailController.dispose();
    passwordController.dispose();
  }

  void login(){
    setState(() {
      loading = true; // since its loading while in setState
    });
    _auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text.toString()).then((value){
          Utils().toastMessage(value.user!.email.toString());  // to get user login mail id frm front end
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainDashboard())
              // to transit to next page >PostScreen
          );
          setState(() {
            loading = false; // now the page is already loaded so stop the circle
          });
        }).onError((error, stackTrace){
          debugPrint(error.toString());   // don't use print only debug caz that makes it slow ; to handle multiple login attempt error
          //above line used when access is disabled due to many attempts
          Utils().toastMessage(error.toString());
          setState(() {
            loading = false; // since error occured so dont load now
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      //used willpop incase of Scaffold to make user exit frm app with back  button
      onWillPop: ()async{
        SystemNavigator.pop();
        return true;
        },
      child: Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,   // to remove the back button
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal:20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      // to take input email from user
                      keyboardType: TextInputType.text,
                      controller: emailController,
                      decoration: const InputDecoration(
                          hintText: 'Email',
                          //helperText: 'Enter email eg. jon@email.com',   //to show help option
                          prefixIcon: Icon(Icons.alternate_email)
                      ),

                      //to make it a necessary field
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Enter email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20,),
                    TextFormField(
                      // to take input password from user
                      keyboardType: TextInputType.text,
                      controller: passwordController,
                      obscureText: true, //to make it look encrypted
                      decoration: const InputDecoration(
                          hintText: 'Password',
                          prefixIcon: Icon(Icons.lock_open_outlined)
                      ),

                      //to make it a necessary field
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Enter email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20,),
                  ],

                )
            ),

            const SizedBox(height: 20,),
            RoundButton(
              title: 'Login',
              loading: loading,
              onTap:(){
                if(_formKey.currentState!.validate()){
                  //no stmt to make email and password necessary
                  login();
                }
              } ,
            ),
            const SizedBox(height: 20,),
            Row(
              children: [
                const Text("Dont' have account??"),
                TextButton(onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context)=> const SignupScreen())
                  );
                },
                    child: const Text("Sign Up")
                )
              ],
            ),
            const SizedBox(height: 30,),
            InkWell(
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LoginWithPhoneNo())
                // to transit to next page >LoginWithPhoneNo
                );

              },
              child: Container(
                height: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: Colors.black)
                  ),
                child: const Center(
                  child: Text('Login with Phone no'),
                ),
              ),
            )


          ]
        )
      ),
    )
    );
  }
}
