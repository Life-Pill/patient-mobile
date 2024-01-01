import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsCard extends StatefulWidget {
  final bool shopOpen;
  final Color blueColor = Color(0xFF277CF4);

   ResultsCard({super.key, required this.shopOpen});

  @override
  State<ResultsCard> createState() => _ResultsCardState();
}

class _ResultsCardState extends State<ResultsCard> {
  @override
  Widget build(BuildContext context) {
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
                      child: Icon(Icons.apartment),
                      radius: 50.0,
                    ),
                    SizedBox(
                      width: 24.0,
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        //TODO: Enter relavant pharmacy details below
                        children: [
                          Text(
                            "Pharmacy name",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 19.0,
                                color: Colors.black),
                          ),
                          const Divider(
                            height: 5,
                            thickness: 5,
                            color: Colors.black,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width -
                                200.0, // Set the width to the screen width
                            child: Text(
                              "Pharmacy address should be given in this text widget",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 11.0,
                                color: Color(0xFF9E9EA2),
                              ),
                              softWrap: true,
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Container(
                            height: 25.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: widget.shopOpen
                                  ? Colors.green.shade100
                                  : Colors.red.shade100,
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10.0, right: 10.0),
                              child: Row(
                                children: [
                                  Icon(Icons.home,
                                      size: 20.0,
                                      color: widget.shopOpen
                                          ? Color(0xFF30C04F)
                                          : Color(0xFFC03030)),
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                  Text(
                                    widget.shopOpen ? "Open" : "Closed",
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 11.0,
                                        color: widget.shopOpen
                                            ? Color(0xFF30C04F)
                                            : Color(0xFFC03030)),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ])
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          //TODO: set price here
                          "Rs. 150",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w700,
                              fontSize: 20.0,
                              color: Colors.black),
                        ),
                        Text(
                          "/per tablet",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 15.0,
                              color: Color(0xFF848199)),
                        ),
                      ],
                    ),
                    //Interactive rating bar
                    RatingBar.builder(
                      itemSize: 20.0,
                      initialRating: 3,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: false,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        //TODO: Rating update code
                        print(rating);
                      },
                    ),
                  ],
                ),
                SizedBox(height: 10.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 25.0,

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color:widget.blueColor,
                      ),
                      child: Padding(
                        padding:
                        const EdgeInsets.only(left: 10.0, right: 10.0),
                        child: Row(
                          children: [
                            Icon(Icons.home,
                              size: 20.0,
                              color: Colors.white,),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              "Directions",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 11.0,
                                color: Colors.white,),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 10.0,),
                    Container(

                      height: 25.0,

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border:Border.all(color: widget.blueColor),
                        color:Colors.white,
                      ),
                      child: Padding(
                        padding:
                        const EdgeInsets.only(left: 10.0, right: 10.0),
                        child: Row(
                          children: [
                            Icon(Icons.call,
                              size: 20.0,
                              color: widget.blueColor,),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              "Call",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 11.0,
                                color: widget.blueColor,),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 10.0,),
                    Container(
                      height: 25.0,

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border:Border.all(color: widget.blueColor),
                        color:Colors.white,
                      ),
                      child: Padding(
                        padding:
                        const EdgeInsets.only(left: 10.0, right: 10.0),
                        child: Row(
                          children: [
                            Icon(Icons.share,
                              size: 20.0,
                              color: widget.blueColor,),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              "Share",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 11.0,
                                color: widget.blueColor,),
                            ),
                          ],
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
}
