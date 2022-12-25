import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app_state/appstate.dart';

class AllCategories extends StatefulWidget {
  AllCategories({Key? key}) : super(key: key);

  @override
  _AllCategoriesState createState() => _AllCategoriesState();
}

class _AllCategoriesState extends State<AllCategories> {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<Appstate>(context);
    return SafeArea(
      child: Scaffold(
        // floatingActionButton:FilterButton(),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10),
              FutureBuilder<void>(
                future: appState.fetchMechanics(),
                builder: (context, snapshot) {
                  //switchCase Loade
                  return Column(
                    children: List<Widget>.generate(
                        appState.mechanicList.length, (index) {
                      // print(index);
                      print("ALLCATEGORIES");
                      print(index);

                      return MechanicWidget(
                        appState: appState,
                        index: index,
                      );
                    }),
                  );
                },
              ),
              SizedBox(height: 10,),
            ],
          ),
        ),
      ),
    );
  }
}

class MechanicWidget extends StatelessWidget {
  const MechanicWidget({Key? key, required this.appState, required this.index})
      : super(key: key);

  final Appstate appState;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: [
        Text(appState.mechanicList[index].mechanicName),
        SizedBox(
          width: 10,
        ),
        Text(appState.mechanicList[index].mechPhone.toString()),
        SizedBox(
          width: 10,
        ),
        Text(appState.mechanicList[index].mechAddress.pincode)
      ]),
    );
  }
}
