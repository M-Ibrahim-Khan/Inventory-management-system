import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class InfoPage extends StatefulWidget {
  final String id;

  const InfoPage({Key? key ,required this.id}) : super(key: key);

  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {

  CollectionReference stuff = FirebaseFirestore.instance.collection('stuff');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('The info'),
      ),


      body: FutureBuilder<DocumentSnapshot  <Map <String , dynamic>>>(

        future: FirebaseFirestore.instance.collection('stuff').doc(widget.id).get(),
        builder: (_, snapshot){
          if(snapshot.hasError){
            print('error at edit page snapshot');
          }
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }
          var data = snapshot.data!.data();
          var name = data!['Name'];
          var country = data['Country'];
          var weight = data['Weight'];
          var quantity = data['Quantity'].toString();
          // var buyprice = data['Buy Price'];
          var sellprice  = data['Sell Price'].toString();
          var date = data['Creationtime'].toDate();

          // return SingleChildScrollView(
          //   scrollDirection: Axis.vertical,
          //
          //    child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.center,
          //     children:[
          //
          //       SizedBox(height: 40,),
          //
          //       Row(
          //         children : [
          //           SizedBox(width: 50,),
          //          Text('Name',
          //         style: TextStyle(
          //          fontSize: 28,
          //          fontWeight: FontWeight.bold)
          //          ),
          //       SizedBox(width: 130,),
          //       Text('Country',
          //           style: TextStyle(
          //               fontSize: 28,
          //               fontWeight: FontWeight.bold)
          //       ),
          //     ],
          //   ),
          //
          //        Row(
          //          children: [
          //            SizedBox(width: 10,),
          //            Container(height: 50, width: 150,
          //                child: Center(child: Text(name,
          //                style: TextStyle(
          //                  fontSize: 18
          //                )
          //                )
          //                )
          //            ),
          //            SizedBox(width: 70,),
          //            Container(height: 50, width: 150,
          //                child: Center(child: Text(country))),
          //          ],
          //        ),
          //
          //       Row(
          //         children: [
          //           SizedBox(width: 40,),
          //           Text('Weight',
          //               style: TextStyle(
          //                   fontSize: 28,
          //                   fontWeight: FontWeight.bold
          //               )
          //           ),
          //           SizedBox(width: 120,),
          //       Text('Sell Price',
          //           style: TextStyle(
          //               fontSize: 28,
          //               fontWeight: FontWeight.bold
          //           )
          //       ),
          //         ],
          //   ),
          //
          //       Row(
          //         children: [
          //           SizedBox(width: 10,),
          //           Container(height: 50, width: 150,
          //               child: Center(
          //                 child: Text(weight,
          //                 style: TextStyle(
          //                     fontSize: 18
          //                 )),
          //               )
          //           ),
          //           SizedBox(width: 70,),
          //           Container(height: 50, width: 150,
          //             child: Center(child: Text(sellprice,
          //             style: TextStyle(
          //               fontSize: 18
          //             ),
          //             )
          //             )
          //           )
          //     ],
          //    ),
          //
          //       Row(
          //         children: [
          //           Text('Quantity',
          //               style: TextStyle(
          //                   fontSize: 28,
          //                   fontWeight: FontWeight.bold
          //               )
          //           ),
          //
          //       Container(width: 107,
          //           child: Text(quantity)),
          //       Text('Buy Price',
          //           style: TextStyle(
          //               fontSize: 28,
          //               fontWeight: FontWeight.bold
          //           )
          //       ),
          //       Text(buyprice,
          //         style: TextStyle(
          //           fontSize: 18,
          //         ),
          //       ),
          //         ],
          //   ),
          //
          //       Text('Date',
          //           style: TextStyle(
          //               fontSize: 28,
          //               fontWeight: FontWeight.bold
          //           )
          //       ),
          //       Text(DateFormat('d-M-y').format(date)),
          //
          //       // ElevatedButton(
          //       //   onPressed: () => {
          //       //     if (_formKey.currentState!.validate()){
          //       //       updateUser(widget.id ,name ,country ,weight ,quantity ,buyprice ,sellprice),
          //       //       Navigator.pop(context)
          //       //     }
          //       //   },
          //       //   child: Text('Submit'),),
          //       //
          //       //
          //     ],
          //   ),
          // );




          return Center(
            child: SingleChildScrollView(
              child: Column(
                children: [

                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10.0 , horizontal: 10.0),
                    child: TextFormField(
                      //enabled: false,
                      readOnly: true,
                      initialValue: name,
                      style: TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                        labelText: 'Name',
                        labelStyle: TextStyle(height: 0.1,color:Colors.black,fontSize: 30,fontWeight:FontWeight.bold,),
                        disabledBorder: UnderlineInputBorder(),
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10.0 , horizontal: 10.0),
                    child: TextFormField(
                      enabled: false,
                      initialValue: country,
                      style: TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                        labelText: 'Country',
                        labelStyle: TextStyle(height: 0.1,color:Colors.black,fontSize: 30,fontWeight:FontWeight.bold,),
                        disabledBorder: UnderlineInputBorder(),
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10.0 , horizontal: 10.0),
                    child: TextFormField(
                      enabled: false,
                      initialValue: weight,
                      style: TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                        labelText: 'Weight',
                        labelStyle: TextStyle(height: 0.1,color:Colors.black,fontSize: 30,fontWeight:FontWeight.bold,),
                        disabledBorder: UnderlineInputBorder(),
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10.0 , horizontal: 10.0),
                    child: TextFormField(
                      enabled: false,
                      initialValue: quantity,
                      style: TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                        labelText: 'Quantity',
                        labelStyle: TextStyle(height: 0.1,color:Colors.black,fontSize: 30,fontWeight:FontWeight.bold,),
                        disabledBorder: UnderlineInputBorder(),
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10.0 , horizontal: 10.0),
                    child: TextFormField(
                      enabled: false,
                      initialValue: sellprice,
                      style: TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                        labelText: 'Sell Price',
                        labelStyle: TextStyle(height: 0.1,color:Colors.black,fontSize: 30,fontWeight:FontWeight.bold,),
                        disabledBorder: UnderlineInputBorder(),
                      ),
                    ),
                  ),

                  Container(height: 100, width: 196,
                      child: Column(
                        children: [
                          Text('Date',
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600
                              )
                          ),
                          SizedBox(height: 10,),
                          Text(DateFormat('d-M-y').format(date),
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  decorationStyle: TextDecorationStyle.solid,
                                  decorationThickness: 1.5,
                                  decorationColor: Colors.black,
                                  fontSize: 18
                              )
                          )
                        ],
                      )
                  ),



                ],
              ),
            ),


          );




          // return Column(
          //   children: [
          //
          //     SizedBox(height: 90,),
          //
          //     Row(
          //       children:[
          //       Container(height: 150, width: 196,
          //           child: Column(
          //         children: [
          //           Text('Name',
          //           style: TextStyle(
          //             fontSize: 30,
          //             fontWeight: FontWeight.w600
          //           )
          //           ),
          //           SizedBox(height: 10,),
          //           Text(name,
          //           textAlign: TextAlign.justify,
          //           style: TextStyle(
          //             fontSize: 20
          //           )
          //           )
          //         ],
          //       )
          //       ),
          //
          //         Container(height: 150, width: 196,
          //             child: Column(
          //               children: [
          //                 Text('Country',
          //                     style: TextStyle(
          //                         fontSize: 30,
          //                         fontWeight: FontWeight.w600
          //                     )
          //                 ),
          //                 SizedBox(height: 10,),
          //                 Text(country,
          //                     textAlign: TextAlign.justify,
          //                     style: TextStyle(
          //                         fontSize: 20
          //                     )
          //                 )
          //               ],
          //             )
          //         )
          //       ]
          //     ),
          //
          //     Row(
          //         children:[
          //           Container(height: 150, width: 196,
          //               child: Column(
          //                 children: [
          //                   Text('Weight',
          //                       style: TextStyle(
          //                           fontSize: 30,
          //                           fontWeight: FontWeight.w600
          //                       )
          //                   ),
          //                   SizedBox(height: 10,),
          //                   Text(weight,
          //                       textAlign: TextAlign.justify,
          //                       style: TextStyle(
          //                           fontSize: 20
          //                       )
          //                   )
          //                 ],
          //               )
          //           ),
          //
          //           Container(height: 150, width: 196,
          //               child: Column(
          //                 children: [
          //                   Text('Quantity',
          //                       style: TextStyle(
          //                           fontSize: 30,
          //                           fontWeight: FontWeight.w600
          //                       )
          //                   ),
          //                   SizedBox(height: 10,),
          //                   Text(quantity,
          //                       textAlign: TextAlign.justify,
          //                       style: TextStyle(
          //                           fontSize: 20
          //                       )
          //                   )
          //                 ],
          //               )
          //           )
          //         ]
          //     ),
          //
          //     Row(
          //         children:[
          //           Container(height: 150, width: 196,
          //               child: Column(
          //                 children: [
          //                   Text('Buy Price',
          //                       style: TextStyle(
          //                           fontSize: 30,
          //                           fontWeight: FontWeight.w600
          //                       )
          //                   ),
          //                   SizedBox(height: 10,),
          //                   Text(buyprice,
          //                       textAlign: TextAlign.justify,
          //                       style: TextStyle(
          //                           fontSize: 20
          //                       )
          //                   )
          //                 ],
          //               )
          //           ),
          //
          //           Container(height: 150, width: 196,
          //               child: Column(
          //                 children: [
          //                   Text('Sell Price',
          //                       style: TextStyle(
          //                           fontSize: 30,
          //                           fontWeight: FontWeight.w600
          //                       )
          //                   ),
          //                   SizedBox(height: 10,),
          //                   Text(sellprice,
          //                       textAlign: TextAlign.justify,
          //                       style: TextStyle(
          //                           fontSize: 20
          //                       )
          //                   )
          //                 ],
          //               )
          //           )
          //         ]
          //     ),
          //
          //     Container(height: 100, width: 196,
          //         child: Column(
          //           children: [
          //             Text('Date',
          //                 style: TextStyle(
          //                   decoration: TextDecoration.underline,
          //                     decorationStyle: TextDecorationStyle.solid,
          //                     decorationThickness: 1.5,
          //                     decorationColor: Colors.amber,
          //                     fontSize: 30,
          //                     fontWeight: FontWeight.w600
          //                 )
          //             ),
          //             SizedBox(height: 10,),
          //             Text(DateFormat('d-M-y').format(date),
          //                 textAlign: TextAlign.justify,
          //                 style: TextStyle(
          //                     fontSize: 18
          //                 )
          //             )
          //           ],
          //         )
          //     ),
          //
          //   ],
          // );



        },
      ),


    );
  }
}
