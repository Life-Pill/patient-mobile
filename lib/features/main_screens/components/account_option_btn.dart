import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountOptionButton extends StatelessWidget {
  final IconData btnIcon;
  final String btnText;


  const AccountOptionButton({super.key, required this.btnIcon, required this.btnText});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: 50.0,

      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(btnIcon),
                  SizedBox(width: 5.0,),
                  Text(
                    btnText,
                    textAlign: TextAlign.left,
                    style: GoogleFonts.roboto(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Icon(Icons.arrow_forward_ios_outlined,size: 20.0,color: Color(0xFF929292),)

            ],

          ),
          Divider(thickness: 2,),


        ],
      ),

    );
  }
}
