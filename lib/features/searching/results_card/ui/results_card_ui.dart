import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:patientmobileapplication/features/Data/cart_data.dart';
import 'package:patientmobileapplication/features/DataModel/cart_data_model.dart';
import 'package:patientmobileapplication/features/main_screens/cart_tab/components/cart_controller.dart';
import 'package:patientmobileapplication/features/main_screens/components/custom_snackBar.dart';
import 'package:patientmobileapplication/features/searching/results_card/product_counter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';


class ResultsCard extends StatefulWidget {
  final Color blueColor = Color(0xFF277CF4);
  final String medicine_name;
  final String pharmacy_name;
  final String logo;
  final bool isOpen;
  final double price;
  final String unit;
  final double rating;
  final String address;
  final String phone;

  ResultsCard(
      {super.key,
      required this.medicine_name,
      required this.isOpen,
      required this.pharmacy_name,
      required this.logo,
      required this.price,
      required this.unit,
      required this.rating,
      required this.address,
      required this.phone});

  @override
  State<ResultsCard> createState() => _ResultsCardState();
}

class _ResultsCardState extends State<ResultsCard> {
  @override
  Widget build(BuildContext context) {
    int current_count = 0;
    void addToCart(CartItem cartItem) {
      final CartController cartController = Get.find<CartController>();
      if (cartItem.count == 0) {
        return;
      }
      setState(() {
        cartController.addItem(cartItem);
      });
      CustomSnackBar(true, "Added to cart",
          "${cartItem.count} ${cartItem.unit}s of ${cartItem.medicine_name} at ${cartItem.pharmacy_name}");
      print(
          "Cart item count is ${cartItems.length} ${cartItem.medicine_name} ${cartItem.pharmacy_name} ${cartItem.price} ${cartItem.count}");
    
    }



    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        child: Card(
          elevation: 10.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  children: [
                    //TODO: Add the pharmacy image here inside circle avatar
                    CircleAvatar(
                      backgroundImage: AssetImage(widget.logo),
                      radius: 50.0,
                    ),
                    SizedBox(
                      width: 24.0,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        //TODO: Enter relavant pharmacy details below
                        children: [
                          Text(
                            widget.pharmacy_name,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 19.0,
                                color: Colors.black),
                          ),
                          const Divider(
                            height: 5,
                            thickness: 2,
                            color: Colors.black,
                          ),
                          Text(
                            widget.address,
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 11.0,
                              color: Colors.black45,
                            ),
                            softWrap: true,
                          ),
                          Text(
                            widget.phone,
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 11.0,
                              color: Colors.black45,
                            ),
                            softWrap: true,
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Container(
                            height: 25.0,
                            width: 80.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: widget.isOpen
                                  ? Colors.green.shade100
                                  : Colors.red.shade100,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.home,
                                    size: 20.0,
                                    color: widget.isOpen
                                        ? Color(0xFF30C04F)
                                        : Color(0xFFC03030)),
                                Text(
                                  widget.isOpen ? "Open" : "Closed",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 11.0,
                                      color: widget.isOpen
                                          ? Color(0xFF30C04F)
                                          : Color(0xFFC03030)),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          ProductCounter(
                              onCountChange: (count) {
                                current_count = count;
                              },
                              stkCount: 100),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  
                                  // Create a Cart object with sample data
                                  CartItem newCartItem = CartItem(
                                    index: cartItems.length,
                                      count: current_count,
                                      pharmacy_imageUrl: widget.logo,
                                      price: widget.price,
                                      unit: widget.unit,
                                      medicine_name: widget.medicine_name,
                                      pharmacy_name: widget.pharmacy_name);

                                  addToCart(newCartItem); // Add the new cart item to the cart
                                },
                                child: Container(
                                  height: 25.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(color: widget.blueColor),
                                    color: Colors.white,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10.0, right: 10.0),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.shopping_cart,
                                          size: 20.0,
                                          color: widget.blueColor,
                                        ),
                                        SizedBox(
                                          width: 5.0,
                                        ),
                                        Text(
                                          "Add to cart",
                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 11.0,
                                            color: widget.blueColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          //TODO: set price here
                          "Rs. ${widget.price}",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w700,
                              fontSize: 20.0,
                              color: Colors.black),
                        ),
                        Text(
                          "/per ${widget.unit}",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 15.0,
                              color: Color(0xFF848199)),
                        ),
                      ],
                    ),
                    //Interactive rating bar, Ignorepointer added to avoid user changing rating in this screen
                    IgnorePointer(
                      ignoring: true,
                      child: RatingBar.builder(
                        itemSize: 20.0,
                        initialRating: widget.rating,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: false,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (ratingval) {
                          /// print("${widget.name} --> ${widget.rating}");
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 25.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: widget.blueColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.home,
                              size: 20.0,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            GestureDetector(
                              onTap: () =>
                                  MapsLauncher.launchQuery(widget.address),
                              child: Text(
                                "Directions",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 11.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Container(
                      height: 25.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(color: widget.blueColor),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.call,
                              size: 20.0,
                              color: widget.blueColor,
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            GestureDetector(
                              onTap: () async {
                                await _makePhoneCall(widget.phone);
                              },
                              child: Text(
                                "Call",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 11.0,
                                  color: widget.blueColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    GestureDetector(
                      onTap: () => _sharePharmacyDetails(),
                      child: Container(
                        height: 25.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(color: widget.blueColor),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 10.0, right: 10.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.share,
                                size: 20.0,
                                color: widget.blueColor,
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                "Share",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 11.0,
                                  color: widget.blueColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    print("Call btn clicked");
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  Future<void> _sharePharmacyDetails() async {
    final String text = '''
    The medicine ${widget.medicine_name} is available at:
    Pharmacy Name: ${widget.pharmacy_name}
    Phone Number: ${widget.phone}
    Medicine Price: At Rs.${widget.price} per ${widget.unit}
    Medicine Name: ${widget.pharmacy_name}
    Address: ${widget.address}
    ''';

    await Share.share(text, subject: "Pharmacy details for the medicine");
  }
}
