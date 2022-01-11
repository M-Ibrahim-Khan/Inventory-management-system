//
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class Selling extends StatefulWidget {
//   final String id;
//
//   const Selling({Key? key, required this.id}) : super(key: key);
//
//   @override
//   _SellingState createState() => _SellingState();
// }
//
// class _SellingState extends State<Selling> {
//
//   final _formKey = GlobalKey<FormState>();
//
//   CollectionReference stuff = FirebaseFirestore.instance.collection('stuff');
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Selling"),
//       ),
//
//       body: Form(
//         key: _formKey,
//
//         //we get the data from document id received at start by this method
//         child: FutureBuilder<DocumentSnapshot  <Map <String , dynamic>>>(
//
//           future: FirebaseFirestore.instance.collection('stuff').doc(widget.id).get(),
//           builder: (_, snapshot){
//             if(snapshot.hasError){
//               print('error at edit page snapshot');
//             }
//             if(snapshot.connectionState == ConnectionState.waiting){
//               return Center(child: CircularProgressIndicator(),);
//             }
//             var data = snapshot.data!.data();
//             var name = data!['Name'];
//             var country = data['Country'];
//             var weight = data['Weight'];
//             var quantity = data['Quantity'];
//             var buyprice = data['Buy Price'];
//             var sellprice  = data['Sell Price'];
//
//             return SingleChildScrollView(
//               child: Column(
//                 children:[
//
//                   Container(
//                     margin: EdgeInsets.symmetric(vertical: 10.0 , horizontal: 10.0),
//                     child: TextFormField(
//                       enabled: false,
//                       initialValue: name,
//                       style: TextStyle(fontSize: 20),
//                       autofocus: false,
//                       decoration: InputDecoration(
//                         labelText: 'Name',
//                         labelStyle: TextStyle(height: 0.1,color:Colors.black,fontSize: 30,fontWeight:FontWeight.bold,),
//                         disabledBorder: UnderlineInputBorder(),
//                         errorStyle: TextStyle(
//                             color: Colors.red,
//                             fontSize: 20
//                         ),
//                       ),
//                       validator: (value) {
//                         if(value==null || value.isEmpty) {
//                           return 'Please enter a name.';
//                         }
//                         return null;
//                       },
//                     ),
//                   ),
//
//                   Container(
//                     margin: EdgeInsets.symmetric(vertical: 10.0 , horizontal: 10.0),
//                     child: TextFormField(
//                       enabled: false,
//                       initialValue: country,
//                       style: TextStyle(fontSize: 20),
//                       autofocus: false,
//                       decoration: InputDecoration(
//                         labelText: 'Country',
//                         labelStyle: TextStyle(height: 0.1,color:Colors.black,fontSize: 30,fontWeight:FontWeight.bold,),
//                         disabledBorder: UnderlineInputBorder(),
//                       ),
//                     ),
//                   ),
//
//                   Row(
//                     children: [
//                       Container(
//                         width: 175,
//                         margin: EdgeInsets.symmetric(vertical: 10.0 , horizontal: 10.0),
//                         child: TextFormField(
//                           enabled: false,
//                           initialValue: weight,
//                           style: TextStyle(fontSize: 20),
//                           autofocus: false,
//                           decoration: InputDecoration(
//                             labelText: 'Weight',
//                             labelStyle: TextStyle(height: 0.1,color:Colors.black,fontSize: 30,fontWeight:FontWeight.bold,),
//                             disabledBorder: UnderlineInputBorder(),
//                           ),
//                         ),
//                       ),
//
//
//                   Container(
//                     width: 175,
//                     margin: EdgeInsets.symmetric(vertical: 10.0 , horizontal: 10.0),
//                     child: TextFormField(
//                       enabled: false,
//                       initialValue: quantity,
//                       style: TextStyle(fontSize: 20),
//                       autofocus: false,
//                       decoration: InputDecoration(
//                         labelText: 'Quantity',
//                         labelStyle: TextStyle(height: 0.1,color:Colors.black,fontSize: 30,fontWeight:FontWeight.bold,),
//                         disabledBorder: UnderlineInputBorder(),
//                       ),
//                     ),
//                   ),
//                     ],
//               ),
//
//                   Row(
//                     children: [
//                       Container(
//                         width: 175,
//                         margin: EdgeInsets.symmetric(vertical: 10.0 , horizontal: 10.0),
//                         child: TextFormField(
//                           enabled: false,
//                           initialValue: sellprice,
//                           style: TextStyle(fontSize: 20),
//                           autofocus: false,
//                           onChanged: (value) => buyprice = value,
//                           decoration: InputDecoration(
//                             labelText: 'Price',
//                             labelStyle: TextStyle(height: 0.1,color:Colors.black,fontSize: 20,fontWeight:FontWeight.bold,),
//                             disabledBorder: UnderlineInputBorder(),
//                             //enabledBorder: OutlineInputBorder(),
//                             errorStyle: TextStyle(
//                                 color: Colors.red,
//                                 fontSize: 20
//                             ),
//                           ),
//                           validator: (value) {
//                             if(value==null || value.isEmpty) {
//                               return 'Please enter Price.';
//                             }
//                             return null;
//                           },
//                         ),
//                       ),
//
//
//                   Container(
//                     width: 175,
//                     margin: EdgeInsets.symmetric(vertical: 10.0 , horizontal: 10.0),
//                     child: TextFormField(
//                       style: TextStyle(fontSize: 20),
//                       autofocus: false,
//                       onChanged: (value) => sellprice = value,
//                       decoration: InputDecoration(
//                         labelText: 'Sell',
//                         labelStyle: TextStyle(height: 0.1,color:Colors.black,fontSize: 20,fontWeight:FontWeight.bold,),
//                         border: OutlineInputBorder(),
//                         enabledBorder: OutlineInputBorder(),
//                         errorStyle: TextStyle(
//                             color: Colors.red,
//                             fontSize: 20
//                         ),
//                       ),
//                       keyboardType: TextInputType.number,
//                       validator: (value) {
//                         if(value==null || value.isEmpty) {
//                           return 'Please enter Price.';
//                         }
//                         return null;
//                       },
//                     ),
//                   ),
//                     ],
//               ),
//
//                   ElevatedButton(
//                     onPressed: () => {
//                       if (_formKey.currentState!.validate()){
//                         //updateUser(widget.id ,name ,country ,weight ,quantity ,buyprice ,sellprice),
//                         Navigator.pop(context)
//                       }
//                     },
//                     child: Text('Submit'),),
//
//
//                 ],
//               ),
//             );
//           },
//
//         ),
//       ),
//
//
//
//
//
//     );
//   }
// }