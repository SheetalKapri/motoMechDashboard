import 'package:flutter/material.dart';
import 'package:motomechdashboard/utils/constants.dart';

class RoundButton extends StatelessWidget {
  final String title;   //since used everywhere
  final VoidCallback onTap;
  final bool loading;

  const RoundButton({Key? key,
      required this.title,
      required this.onTap,
      this.loading = false,  // to show loading circle while loading initially should be false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell (
      onTap: onTap,
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width*0.3,
        decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(10)
        ),

      child: Center(child: loading ? const CircularProgressIndicator(strokeWidth: 3, color: Colors.white):
        Text(title,style: const TextStyle(color: Colors.white),),),
      //to show loading circle if child is loading thn show icon else display text->Title
      ),
    );
  }
}
