import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patientmobileapplication/features/Data/profile_data.dart';
import 'package:patientmobileapplication/features/main_screens/home_tab/components/search_bar.dart';

class TopNavBar extends StatelessWidget {
  final ProfileController profileController = Get.put(ProfileController());
  Profile current_user = new Profile();
  final String TabName;
  final bool NeedSearchBar;
  TopNavBar({
    super.key,
    required this.NeedSearchBar,
    required this.TabName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
              Row(
                children: [
                  CircleAvatar(
                      child: CircleAvatar(
                        backgroundImage: AssetImage(current_user.img),
                        radius: 25.0,
                      ),
                      backgroundColor: Colors.white,
                      radius: 30.0),
                  SizedBox(
                    width: 10.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.pin_drop_outlined,
                            size: 35.0,
                            color: Colors.white,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width - 210.0,
                            child: Text(
                              " ${profileController.currentUser.value.addressStreet}, ${profileController.currentUser.value.addressCity}, ${profileController.currentUser.value.addressDistrict}",
                              softWrap: true,
                              textAlign: TextAlign.left,
                              style: GoogleFonts.poppins(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFFFDFDFC),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 210.0,
                        child: Text(
                          "Hello, ${profileController.currentUser.value.name}",
                          textAlign: TextAlign.left,
                          style: GoogleFonts.poppins(
                            fontSize: 22.0,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFFFDFDFC),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.shopping_bag_outlined,
                    size: 25.0,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Icon(
                    Icons.notification_add_outlined,
                    size: 25.0,
                    color: Colors.white,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          NeedSearchBar
              ? HomeSearchBar()
              : Text(
                  TabName,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 27.0,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFFFDFDFC),
                  ),
                ),
          SizedBox(
            height: 20.0,
          ),
        ],
      ),
    );
  }
}
