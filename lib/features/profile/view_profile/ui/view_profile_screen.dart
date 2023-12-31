import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patientmobileapplication/features/profile/components/account_option_btn.dart';
import 'package:patientmobileapplication/features/searching/search_results/ui/search_tabs.dart';

class ViewProfile extends StatefulWidget {

  const ViewProfile({Key? key}) : super(key: key);

  @override
  State<ViewProfile> createState() => _ViewProfileState();
}

class _ViewProfileState extends State<ViewProfile> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height - 60.0,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 275.0,
                    padding: EdgeInsets.only(top: 40.0, right: 20.0, left: 20.0),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(36.0),
                        bottomRight: Radius.circular(36.0),
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image(
                              image: AssetImage("assets/images/app_back_btn.png"),
                              width: 40.0,
                              height: 40.0,
                            ),
                            Text(
                              "Profile",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.manrope(
                                fontSize: 24.0,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFFFDFDFC),
                              ),
                            ),
                            //TODO: change notification icon according to notifications present or not
                            Icon(
                              Icons.notifications_none,
                              size: 40.0,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        //TODO: change the icon to the image of user
                        CircleAvatar(
                          child: Icon(
                            Icons.account_circle_outlined,
                            size: 100.0,
                          ),
                          radius: 60.0,
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        //TODO: change the username to the name of user
                        Text(
                          "USERNAME",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontSize: 24.0,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFFDFDFC),
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        //TODO: change the email to the email of user
                        Text(
                          "EMAIL",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontSize: 13.0,
                            fontWeight: FontWeight.w300,
                            color: Color(0xFFFDFDFC),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40.0,right: 40.0),
                    child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "My Account",

                          style: GoogleFonts.roboto(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        AccountOptionButton(
                            btnIcon: Icons.account_circle_outlined,
                            btnText: "Your profile"),
                        AccountOptionButton(
                            btnIcon: Icons.credit_card, btnText: "Payment methods"),
                        AccountOptionButton(
                            btnIcon: Icons.password, btnText: "Change Password"),
                        AccountOptionButton(btnIcon: Icons.settings, btnText: "Settings"),

                        Text(
                          "General",

                          style: GoogleFonts.roboto(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        AccountOptionButton(
                            btnIcon: Icons.account_circle_outlined,
                            btnText: "Terms & Conditions"),
                        AccountOptionButton(
                            btnIcon: Icons.credit_card, btnText: "Privacy Policy"),
                        AccountOptionButton(
                            btnIcon: Icons.call, btnText: "Customer Services"),
                        AccountOptionButton(btnIcon: Icons.logout_outlined, btnText: "Logout"),
                      ],
                    ),
                  ),


                ],

              ),
            ),
          ),
          BottomNavigationBar(items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home_filled),label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: "Cart"),
            BottomNavigationBarItem(icon: Icon(Icons.camera_alt),label: 'Camera'),
            BottomNavigationBarItem(icon: Icon(Icons.people),label: 'People'),
            BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Profile'),



          ],
            elevation: 5.0,
            showSelectedLabels: false,
            currentIndex:_selectedIndex,
            selectedItemColor: Colors.blue[800],
            onTap: _onItemTapped,
            unselectedItemColor: Colors.lightBlue[100],
          ),

        ],

      ),


    );
  }
}
