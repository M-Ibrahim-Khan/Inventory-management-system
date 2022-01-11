// import 'package:flutter/material.dart';
//
// class AddStuff extends StatefulWidget {
//   final String labeltext;
//   final putcontroller;
//
//   const AddStuff({Key? key, required this.labeltext, required this.putcontroller}) : super(key: key);
//
//   @override
//   _AddStuffState createState() => _AddStuffState();
// }
//
// class _AddStuffState extends State<AddStuff> {
//
//   final putcontroller=TextEditingController();
//
//
//   @override
//   Widget build(BuildContext context) {
//     return  Container(
//       margin: EdgeInsets.symmetric(vertical: 10.0 , horizontal: 10.0),
//       child: TextFormField(
//         autofocus: false,
//         decoration: InputDecoration(
//           labelText: 'Name',
//           border: OutlineInputBorder(),
//           errorStyle: TextStyle(
//               color: Colors.red,
//               fontSize: 20
//           ),
//         ),
//         controller: putcontroller,
//         validator: (value) {
//           if(value==null || value.isEmpty) {
//             return 'Enter a name.';
//           }
//           return null;
//         },
//       ),
//     );
//   }
// }
