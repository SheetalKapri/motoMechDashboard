import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../widgets/roundButton.dart';
import '../screens/drawer_screen.dart';
//import '../screens/drawer_screen.dart';

class SampleUploads extends StatefulWidget {
   SampleUploads({Key? key}) : super(key: key);

  @override
  State<SampleUploads> createState() => _SampleUploadsState();
}

class _SampleUploadsState extends State<SampleUploads> {
   TextEditingController sample1 = TextEditingController();
   TextEditingController sample2 = TextEditingController();
   bool loading = false;
  //final FirebaseFirestore _db = FirebaseFirestore.instance;

    

  @override
  void nextStep(){
    setState(() {
      loading = true; // since its loading while in setState
    });
    Map <String,dynamic> data ={
      "field1":sample1.text,
      "field2":sample2.text
    };
    FirebaseFirestore.instance.collection("mechanic").add(data);
    setState(() {
      loading = false; // since its loading while in setState
    });
  }


  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width / 6,
            height: 900,
            color: const Color.fromRGBO(5, 75, 70, 1),
            child: const SafeArea(
              child: AppDrawer(),
            ),
          ),

          Expanded(
            child: Container(
              decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                bottomLeft: Radius.circular(25),
              ),
              color: Color.fromARGB(72, 196, 192, 192),
            ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
                //padding: const EdgeInsets.only(top: 20,left: 20),
              child: Column(
                children: [
                  Image.asset("img/mechanic.png",width: 70,),
                  const SizedBox(height: 10.0),
                  //to upload data to firebase
                  TextFormField(
                    controller: sample1,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                        hintText: 'enter data to upload',
                        prefixIcon: Icon(Icons.alternate_email)
                    ),

                    validator: (value){
                      if(value!.isEmpty){
                        return 'Enter data 1';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10.0),
                  TextFormField(
                    controller: sample2,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                        hintText: 'enter data to upload',
                        prefixIcon: Icon(Icons.alternate_email)
                    ),

                    validator: (value){
                      if(value!.isEmpty){
                        return 'Enter data 2';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15.0),
                  RoundButton(
                    title: 'Upload Data',
                    onTap:(){
                      nextStep();
                    } ,
                  ),
                  const SizedBox(height: 15.0),
                  RoundButton(
                    title: 'Display all Data',
                    onTap:(){

                      } ,
                  ),
                ],
              ),
            ),
          ),
        ),
            )
        ],
      ),
      // drawer: const AppDrawer(),

      // appBar: AppBar(
      //   centerTitle: true,
      //   title: const Text('Add Data to Database'),
      //   actions: [
      //     IconButton(
      //         onPressed: () { },
      //         icon: const Icon(Icons.add))
      //   ],
      // ),
    );
  }
}
