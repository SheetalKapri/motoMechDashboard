import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:motomechdashboard/ui/screens/main_dashboard.dart';

import '../../utils/utils.dart';
import '../../widgets/roundButton.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  bool loading= false;
  final _formKey= GlobalKey<FormState>();
  final emailController= TextEditingController();
  final passwordController = TextEditingController();

  //to connect with firebase
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void signup()
  {
    //fun to add sign up functionalities
    setState(() {
      loading= true;
    });
    _auth.createUserWithEmailAndPassword(
        email: emailController.text.toString(),
        password: passwordController.text.toString()).then((value){

      Utils().toastMessage(value.user!.email.toString());  // to get user login mail id frm front end
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const MainDashboard())
        // to transit to next page >PostScreen
      );
      setState(() {
        loading = false; // now the page is already loaded so stop the circle
      });
      //to handle error messages using utils.dart file
    }).onError((error, stackTrace){
      //to handle errors ans display error msgs
      Utils().toastMessage(error.toString());
      setState(() {
        loading= false;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    // to remove these fields when not in use
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Center(
          //padding: const EdgeInsets.symmetric(horizontal:20),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 20.0),
            margin: const EdgeInsets.all(40.0),
            height: 400,
            width: 700,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(color: Colors.teal.shade800,
                blurRadius: 15.0,spreadRadius: 5.0,offset: Offset(5.0,5.0))
              ] ),
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
                          const SizedBox(height: 30,),
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
                          const SizedBox(height: 30,),
                        ],

                      )
                  ),

                  const SizedBox(height: 30,),
                  RoundButton(
                    title: 'Sign Up',
                    loading: loading,
                    onTap:(){
                      if(_formKey.currentState!.validate()){
                        signup();
                        //no stmt to make email and password necessary
                      }
                    } ,
                  ),
                  const SizedBox(height: 30,),
                  Row(
                    children: [
                      const Text("Already have an account??"),
                      TextButton(onPressed: (){
                        Navigator.push(context,
                            MaterialPageRoute(
                                builder: (context)=> const LoginScreen())
                        );
                      },
                          child: const Text("Login")
                      )
                    ],
                  )

                ]
            ),
          )
      ),
    );
  }
}
