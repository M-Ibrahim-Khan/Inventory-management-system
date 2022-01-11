import 'package:flutter/material.dart';
import 'add page.dart';
import 'record page.dart';
import 'graph page.dart';
import 'sell page.dart';
import '../button.dart';

class First extends StatelessWidget {
  const First({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body:SafeArea(



        child:Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            Container(
              width: 350, height: 100,

              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Center(
                child: Text('Store management system',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Colors.white70,
                  ),
                ),
              ),
            ),



            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [



                MainPageButton(
                    onClicked: () {
                      Navigator.push(context,
                        MaterialPageRoute(
                          builder: (context) => Add(),
                        ),
                      );
                    },
                    icon: Icons.add_rounded,
                    iconcolor: 0xFF4CAF50,
                    text: 'Buy'
                ),

                MainPageButton(
                    onClicked: () {
                      Navigator.push(context,
                        MaterialPageRoute(
                          builder: (context) => SellPage(),
                        ),
                      );
                    },
                    icon: Icons.remove_rounded,
                    iconcolor: 0xFFF44336,
                    text: 'Sell'
                ),


              ],
            ),



            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [



                MainPageButton(
                    onClicked: () {
                      Navigator.push(context,
                        MaterialPageRoute(
                          builder: (context) => Detail(),
                        ),
                      );
                    },
                    icon: Icons.description,
                    iconcolor: 0xFF448AFF,
                    text: 'Record'
                ),


                MainPageButton(
                    onClicked: () {
                      Navigator.push(context,
                        MaterialPageRoute(
                          builder: (context) => Sales(),
                        ),
                      );
                    },
                    icon: Icons.bar_chart_sharp,
                    iconcolor: 0xFF9C27B0,
                    text: 'Graph'
                ),

              ],
            ),


          ],
        ),




      ),
    );
  }
}