import 'package:flutter/material.dart';
import 'package:reg_rota_pad/widgets/drawer.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: Image.asset(
          //   'assets/images/rota.png',
          //   height: 40,
          //   width: 40,
          // ),
          ),
      drawer: MainDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Image.asset(
                  //   'assets/images/rota.png',
                  //   height: 40,
                  //   width: 50,
                  // ),
                  // Row(
                  //   children: [
                  //     Column(
                  //       children: [
                  //         Text('Anthony Fulgencio'),
                  //         Text('Oxford Bible Church'),
                  //       ],
                  //     ),
                  //     Image.asset(
                  //       'assets/images/teddy.png',
                  //       height: 40,
                  //     ),
                  //   ],
                  // )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.calendar_month,
                        color: Color(0xff7f00ff),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'March 2023',
                        style: TextStyle(color: Color(0xff7f00ff)),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Image.asset('assets/images/filter.png'),

                    // Container(
                    //   color: Color(0xff7f00ff),
                    //   child: Row(
                    //     children: [
                    //       Icon(
                    //         Icons.turned_in,
                    //         color: Colors.white,
                    //       ),
                    //       Text(
                    //         'Filter',
                    //         style: TextStyle(color: Colors.white),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 24,
                      height: 24,
                      // color: Color(0xff9185DE),
                      child: Center(
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Color(0xff9185DE),
                        ),
                      ),
                      // child: Row(
                      //   children: [
                      //     Icon(
                      //       Icons.arrow_back_ios,
                      //       size: 10,
                      //       color: Colors.white,
                      //     ),
                      //     Text(
                      //       'Prev',
                      //       style: TextStyle(color: Colors.white),
                      //     ),
                      //   ],
                      // ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 24,
                      height: 24,
                      // color: Color(0xff9185DE),
                      child: Center(
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Color(0xff9185DE),
                        ),
                      ),
                      // child: Row(
                      //   children: [
                      //     Text(
                      //       'Next',
                      //       style: TextStyle(color: Colors.white),
                      //     ),
                      //     Icon(
                      //       Icons.arrow_forward_ios,
                      //       size: 10,
                      //       color: Colors.white,
                      //     ),
                      //   ],
                      // ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    // Container(
                    //   color: Color(0xff7f00ff),
                    //   child: Row(
                    //     children: [
                    //       Icon(
                    //         Icons.save,
                    //         size: 15,
                    //         color: Colors.white,
                    //       ),
                    //       Text(
                    //         'Save',
                    //         style: TextStyle(color: Colors.white),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            buildCardDashboard('SUNDAY 5TH', 'MARCH 2023'),
            SizedBox(
              height: 20,
            ),
            buildCardDashboard('SUNDAY 5TH', 'MARCH 2023'),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  // Padding buildCardDashboard(
  //   String title,
  //   String subtitle,
  // ) {
  //   return Padding(
  //     padding: const EdgeInsets.only(left: 8.0, right: 8.0),
  //     child: SingleChildScrollView(
  //       child: Column(
  //         children: [
  //           GestureDetector(
  //             // onTap: () => _startAddNewPasteWaste(context),
  //             child: Container(
  //               height: 250,
  //               width: 400,
  //               color: Colors.white,
  //               child: Card(
  //                   // elevation: 2,
  //                   child: Padding(
  //                 padding: const EdgeInsets.all(8.0),
  //                 child: Column(
  //                   mainAxisAlignment: MainAxisAlignment.start,
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     Text(
  //                       title,
  //                       style: TextStyle(color: Colors.grey),
  //                     ),
  //                     Text(
  //                       title,
  //                       style: TextStyle(color: Color(0xff7f00ff)),
  //                     ),
  //                     SizedBox(
  //                       height: 20,
  //                     ),
  //                     Row(
  //                       children: [
  //                         Icon(
  //                           Icons.person_2_outlined,
  //                           color: Color(0xff92C177),
  //                         ),
  //                         Text(
  //                           '1 Attendee',
  //                           style: TextStyle(color: Color(0xff92C177)),
  //                         )
  //                       ],
  //                     ),
  //                     SizedBox(
  //                       height: 10,
  //                     ),
  //                     Container(
  //                       width: 240,
  //                       height: 50,
  //                       decoration: BoxDecoration(
  //                           borderRadius: BorderRadius.circular(20),
  //                           color: Color(0xff92C177)),
  //                       child: Padding(
  //                         padding: const EdgeInsets.all(8.0),
  //                         child: Row(children: [
  //                           Icon(
  //                             Icons.person,
  //                             color: Colors.white,
  //                           ),
  //                           Text(
  //                             'Anthony Fulgencio',
  //                             style: TextStyle(color: Colors.white),
  //                           ),
  //                           SizedBox(
  //                             width: 10,
  //                           ),
  //                           Icon(
  //                             Icons.cancel_sharp,
  //                             size: 40,
  //                           ),
  //                         ]),
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               )),
  //             ),
  //           ),
  //           Container(
  //             color: Color(0xffEBEBEB),
  //             child: Row(
  //               children: [
  //                 CircleAvatar(
  //                   backgroundColor: Color.fromARGB(255, 230, 213, 247),
  //                   child: Icon(Icons.book),
  //                 ),
  //                 SizedBox(
  //                   width: 20,
  //                 ),
  //                 CircleAvatar(
  //                   backgroundColor: Color.fromARGB(255, 230, 213, 247),
  //                   child: Icon(Icons.chat),
  //                 ),
  //                 SizedBox(
  //                   width: 20,
  //                 ),
  //                 CircleAvatar(
  //                   backgroundColor: Color.fromARGB(255, 230, 213, 247),
  //                   child: Icon(Icons.calendar_month),
  //                 ),
  //                 SizedBox(
  //                   width: 20,
  //                 ),
  //                 CircleAvatar(
  //                   backgroundColor: Color.fromARGB(255, 230, 213, 247),
  //                   child: Icon(Icons.messenger_outline_sharp),
  //                 ),
  //               ],
  //             ),
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Padding buildCardDashboard(
    String title,
    String subtitle,
  ) {
    return Padding(
      padding: EdgeInsets.only(left: 8.0, right: 8.0),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Material(
            elevation: 5,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 21.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xffFFFFFF),
                      // border: Border.all(color: Color(0xffDEDEDE))
                    ),
                    height: 200,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0, top: 13.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            title,
                            style: TextStyle(color: Color(0xff9185DE)),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.person_2_outlined,
                                color: Color(0xff92C177),
                              ),
                              Text(
                                '1 Attendee',
                                style: TextStyle(color: Color(0xff92C177)),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            width: 240.78,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Color(0xff92C177),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  Icons.person_2_outlined,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Anthony Fulgencio',
                                  style: TextStyle(color: Colors.white),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                CircleAvatar(
                                  backgroundColor: Colors.black26,
                                  child: Image.asset('assets/images/ex.png'),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 384,
                  height: 64,
                  color: Color(0xffEBEBEB),
                  child: Row(
                    children: [
                      SizedBox(width: 14.38),
                      CircleAvatar(
                        backgroundColor: Color(0xffD9D9D9),
                        child: Image.asset('assets/images/m1.png'),
                      ),
                      SizedBox(
                        width: 8.21,
                      ),
                      CircleAvatar(
                        backgroundColor: Color(0xffD9D9D9),
                        child: Image.asset('assets/images/m2.png'),
                      ),
                      SizedBox(
                        width: 8.21,
                      ),
                      CircleAvatar(
                        backgroundColor: Color(0xffD9D9D9),
                        child: Image.asset('assets/images/m3.png'),
                      ),
                      SizedBox(
                        width: 8.21,
                      ),
                      CircleAvatar(
                        backgroundColor: Color(0xffD9D9D9),
                        child: Image.asset('assets/images/m4.png'),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
