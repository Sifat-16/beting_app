import 'package:beting_app/widget/login_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BetingCard extends StatelessWidget {
  const BetingCard({
    Key? key,
    required this.height,
    required this.width,
    required this.matchName,
    this.bordType,
    required this.image,
    required this.winngPrize,
    required this.entryFee,
    required this.matchType,
    required this.matchStart,
    required this.matchEnd,
    required this.joinButtun
  }) : super(key: key);

  final double height;
  final double width;
  final String image;
  final String matchName;
  final String? bordType;
  final String winngPrize;
  final String entryFee;
  final String matchType;
  final String matchStart;
  final String matchEnd;
  final VoidCallback joinButtun;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.24,
      width: width,
      decoration: BoxDecoration(
          color: const Color(0xffEBFCED),
          borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: width * 0.02),
            child: SizedBox(
                height: height * 0.1, child: Image.network(image)),
          ),
          SizedBox(
            width: width * 0.01,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: width * 0.1, top: height * 0.02),
                child: Text(
                  matchName,
                  style: GoogleFonts.ebGaramond(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: const Color(0xff469B4D)),
                ),
              ),
              Text("06/06/22",style: GoogleFonts.lato(
                      fontWeight: FontWeight.w400,
                      fontSize: 10,
                      color:Colors.black),),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Wining prize",
                        style: GoogleFonts.lato(
                            color: Colors.black, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        winngPrize,
                        style: GoogleFonts.lato(
                          color: Colors.green,
                          fontSize: 11,
                        ),
                      ),
                      Text(
                        "Bord Type",
                        style: GoogleFonts.lato(
                            color: Colors.black, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        bordType!,
                        style: GoogleFonts.lato(
                          color: Colors.black,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Entre Fee",
                        style: GoogleFonts.lato(
                            color: Colors.black, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        entryFee,
                        style: GoogleFonts.lato(
                          color: Colors.green,
                          fontSize: 11,
                        ),
                      ),
                      Text(
                        "Match Type",
                        style: GoogleFonts.lato(
                            color: Colors.black, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        matchType,
                        style: GoogleFonts.lato(
                          color: Colors.black,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: width * 0.02),
                    child: Column(
                      children: [
                        LoginWidget(
                          h: height * 0.06,
                          w: width * 0.2,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  "Match started",
                                  style: GoogleFonts.lato(
                                    color: Colors.green,
                                    fontSize: 11,
                                  ),
                                ),
                                Text(matchStart)
                              ],
                            ),
                          ),
                        ),
                        LoginWidget(
                          h: height * 0.06,
                          w: width * 0.2,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  "Slot free",
                                  style: GoogleFonts.lato(
                                    color: Colors.red,
                                    fontSize: 11,
                                  ),
                                ),
                                Text(matchEnd)
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                  height: height * 0.03,
                  width: width * 0.6,
                  child:
                      ElevatedButton(onPressed:joinButtun, child: const Text("Join now")))
            ],
          )
        ],
      ),
    );
  }
}
