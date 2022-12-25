import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../utils/utils.dart';
import '../../widgets/roundButton.dart';
import '../posts/sample_uploads.dart';

class VerifyCodeScreen extends StatefulWidget {
  final String verificationID; //received from login_with_phone page for authentication
  const VerifyCodeScreen({Key? key,required this.verificationID}) : super(key: key);

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  bool loading=false;
  final verificationCodeController= TextEditingController();
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verification'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 80,),

            TextFormField(
              //to type the phone number
              controller: verificationCodeController, // takes the ip
              keyboardType:  TextInputType.number,
              decoration: const InputDecoration(
                  hintText: '6 digit code'
              ),
            ),
            const SizedBox(height: 80,),
            RoundButton(title: 'Verify', loading: loading, onTap: ()async {
              setState(() {
                loading = true;
              });
              final credential = PhoneAuthProvider.credential(
                  verificationId: widget.verificationID,
                  //received from login_with_phone page
                  smsCode: verificationCodeController.text.toString());

              try {
                await auth.signInWithCredential(credential);
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>  SampleUploads())
                  // to transit to next page >LoginWithPhoneNo
                );
              } catch (e) {
                setState(() {
                  loading= false;
                });
                Utils().toastMessage(e.toString());

              }
            }
            )

          ],
        ),
      ),
    );
  }

}
