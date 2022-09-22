import 'package:flutter/material.dart';
import 'package:promethean/utils/unitls.dart';
import 'package:upi_payment_qrcode_generator/upi_payment_qrcode_generator.dart';
import 'payment.dart';

class TeamRegistrationScreen extends StatefulWidget {
  TeamRegistrationScreen(
      {super.key,
      required this.maxcount,
      required this.id,
      required this.upiID,
      required this.cost,
      required this.name,
      required this.count});
  int maxcount;
  String upiID;
  String id;
  int cost;
  int count;
  String name;

  @override
  State<TeamRegistrationScreen> createState() => _TeamRegistrationScreenState();
}

class _TeamRegistrationScreenState extends State<TeamRegistrationScreen> {
  Map<String, dynamic> details = {};
  int itemCount = 1;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.backGoundColor,
      body: ListView(
        children: [
          Container(
            height: height,
            child: Column(
              children: [
                Container(
                  height: height * 0.9,
                  child: ListView.builder(
                      itemCount: itemCount + 1,
                      itemBuilder: (context, index) {
                        return index == 0
                            ? Container(
                                // height: height * 0.9,
                                width: width,
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Align(
                                            alignment:
                                                FractionalOffset.centerLeft,
                                            child: FloatingActionButton(
                                              mini: true,
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              // focusColor: AppColors.focusColor,
                                              backgroundColor:
                                                  AppColors.focusColor,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              child: Padding(
                                                padding:
                                                    EdgeInsets.only(left: 10),
                                                child: Icon(
                                                  Icons.arrow_back_ios,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 9,
                                          child: Align(
                                            alignment: FractionalOffset.center,
                                            child: Text(
                                              "Register",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Color(0xfffefefe),
                                                fontSize: 22,
                                                fontFamily: "Urbanist",
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: height * 0.05,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: width * 0.6,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Event name",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: width * 0.065,
                                                  fontFamily: "Urbanist",
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              SizedBox(height: 12.50),
                                              Text(
                                                "October 13, 2022",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: width * 0.04,
                                                  fontFamily: "Urbanist",
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              SizedBox(height: 12.50),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 15.0),
                                                child: Text(
                                                  "Thursday, 10:00 - 12:30 PM",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: width * 0.04,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                              width * 0.1),
                                          child: Image.asset(
                                            "assets/images/rectangle.png",
                                            fit: BoxFit.cover,
                                            width: width * 0.15,
                                            height: width * 0.15,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            : Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: width * 0.1),
                                  child: Form(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          "Team Member ${index}",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontFamily: "Lato",
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Text(
                                            "Full Name",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontFamily: "Lato",
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: width * 0.75,
                                          height: 41,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            border: Border.all(
                                              color: Colors.white,
                                              width: 1,
                                            ),
                                            color: Color(0x00c4c4c4),
                                          ),
                                          child: TextFormField(
                                            onChanged: (val) {
                                              details
                                                  .addAll({"Name$index": val});
                                              print(details);
                                            },
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: width * 0.04,
                                            ),
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 15),
                                        Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Text(
                                            "College Name",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontFamily: "Lato",
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        Container(
                                            width: width * 0.75,
                                            height: 41,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              border: Border.all(
                                                color: Colors.white,
                                                width: 1,
                                              ),
                                              color: Color(0x00c4c4c4),
                                            ),
                                            child: TextFormField(
                                              onChanged: (val) {
                                                details.addAll(
                                                    {"CollegeName$index": val});
                                                print(details);
                                              },
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: width * 0.04,
                                              ),
                                              decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              )),
                                            )),
                                        SizedBox(height: 15),
                                        Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Text(
                                            "Email ID (College mail ID)",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontFamily: "Lato",
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        Container(
                                            width: width * 0.75,
                                            height: 41,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              border: Border.all(
                                                color: Colors.white,
                                                width: 1,
                                              ),
                                              color: Color(0x00c4c4c4),
                                            ),
                                            child: TextFormField(
                                              onChanged: (val) {
                                                details.addAll(
                                                    {"email$index": val});
                                                print(details);
                                              },
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: width * 0.04,
                                              ),
                                              decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              )),
                                            )),
                                        SizedBox(height: 15),
                                        Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Text(
                                            "Contact No",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontFamily: "Lato",
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        Container(
                                            width: width * 0.75,
                                            height: 41,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              border: Border.all(
                                                color: Colors.white,
                                                width: 1,
                                              ),
                                              color: Color(0x00c4c4c4),
                                            ),
                                            child: TextFormField(
                                              onChanged: (val) {
                                                details.addAll(
                                                    {"Contact$index": val});
                                                print(details);
                                              },
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: width * 0.04,
                                              ),
                                              decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              )),
                                            )),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            index == itemCount
                                                ? GestureDetector(
                                                    onTap: (() {
                                                      setState(() {
                                                        if (itemCount !=
                                                            widget.maxcount) {
                                                          setState(() {
                                                            itemCount += 1;
                                                          });
                                                        } else {
                                                          const snackBar =
                                                              SnackBar(
                                                            content: Text(
                                                                'Team reached maximum participants'),
                                                          );

                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                                  snackBar);
                                                        }
                                                      });
                                                    }),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        IconButton(
                                                            onPressed: () {},
                                                            icon: Icon(
                                                              Icons.add_circle,
                                                              color:
                                                                  Colors.grey,
                                                            )),
                                                        Text(
                                                          "Add team member",
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize:
                                                                width * 0.03,
                                                            fontFamily: "Lato",
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                : Container(),
                                            index > 1
                                                ? GestureDetector(
                                                    onTap: (() {
                                                      setState(() {
                                                        details.remove(
                                                            "Name$index");

                                                        details.remove(
                                                            "CollegeName$index");
                                                        details.remove(
                                                            "email$index");
                                                        details.remove(
                                                            "Contact$index");
                                                        setState(() {
                                                          itemCount -= 1;
                                                        });
                                                      });
                                                    }),
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        IconButton(
                                                          onPressed: () {},
                                                          icon: Icon(
                                                            Icons.remove_circle,
                                                            color: Colors.grey,
                                                          ),
                                                        ),
                                                        Text(
                                                          "Delete team member",
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize:
                                                                width * 0.03,
                                                            fontFamily: "Lato",
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                : Container()
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                      }),
                ),
                Expanded(
                  child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Container(
                        width: width * 0.8,
                        height: 56,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: MaterialButton(
                            onPressed: () {
                              if (details.length >= 4 &&
                                  details.length % 4 == 0) {
                                print(widget.cost * itemCount);
                                var upiDetails = UPIDetails(
                                  upiID: widget.upiID,
                                  payeeName: widget.name,
                                  amount: double.parse(
                                      "${widget.cost * itemCount}"),
                                );
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PaymentScreen(
                                              count: widget.count + 1,
                                              id: widget.id,
                                              paymentQR: UPIPaymentQRCode(
                                                  upiDetails: upiDetails,
                                                  size: 200),
                                              details: details,
                                              amount:
                                                  "${widget.cost * itemCount}",
                                            )),
                                    (route) => true);
                              } else {
                                const snackBar = SnackBar(
                                  content:
                                      Text('Please enter details correctly'),
                                );

                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              }
                            },
                            child: Center(
                              child: Text(
                                "Register and pay",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: width * 0.04,
                                  fontFamily: "Urbanist",
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
