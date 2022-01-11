import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
//import 'package:firebase_core/firebase_core.dart';

class Add extends StatefulWidget {


  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {

  // firestore
  CollectionReference stuff = FirebaseFirestore.instance.collection('stuff');
  //CollectionReference history = FirebaseFirestore.instance.collection('history');

  // key
  final _formKey = GlobalKey<FormState>();

  // strings and ints
  String name = '';
  String country = '';
  String weight = '';
  late String docid;
  late int quantity;
  late int buy;
  late int sell;
//tried to int it with int.parse (texteditor) but didnt show at detail (have to do toString)

  //text editors
  final nameController = TextEditingController();
  final countryController = TextEditingController();
  final weightController = TextEditingController();
  final quantityController = TextEditingController();
  final buyController = TextEditingController();
  final sellController = TextEditingController();

  @override
  //dispose the data
  void dispose(){

    nameController.dispose();
    countryController.dispose();
    weightController.dispose();
    quantityController.dispose();
    buyController.dispose();
    sellController.dispose();

    super.dispose();
  }

  //function
  Future<void>addUser() async {
    await stuff.add({
      'Name' : name,
      'Country' : country,
      'Quantity' : quantity,
      'Weight' : weight,
      'Buy Price' : buy,
      'Sell Price' : sell,
      'Creationtime' : DateTime.now(),
    })
    //     .then( (value) {
    //      print (value.id);
    // history.doc(docid).set({
    //   'Name' : name,
    //   'Country' : country,
    //   'Quantity' : quantity,
    //   'Weight' : weight,
    //   'Buy Price' : buy,
    //   'Sell Price' : sell,
    //   'Creationtime' : DateTime.now(),
    // }).then((value) => print('User added to history.'))
    // .catchError((error) => print('Failed to add user to history: $error'))
    ;
  }

  //function
  clear(){
    nameController.clear();
    countryController.clear();
    weightController.clear();
    quantityController.clear();
    buyController.clear();
    sellController.clear();
  }

  @override
  Widget build(BuildContext context) {
     return Scaffold(

        appBar:AppBar(
          title: Text('Add Page'),
          elevation: 0.0,
       ),


         body:Center(
           child: SingleChildScrollView(




             child: Form(
               key: _formKey,

               child: Column(
                  children:[

                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10.0 , horizontal: 10.0),
                      child: TextFormField(
                        autofocus: false,
                        decoration: InputDecoration(
                          labelText: 'Name',
                          border: OutlineInputBorder(),
                          errorStyle: TextStyle(
                              color: Colors.red,
                              fontSize: 20
                          ),
                        ),
                        controller: nameController,
                        validator: (value) {
                          if(value==null || value.isEmpty) {
                            return 'Enter a name.';
                          }
                          return null;
                          },
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10.0 , horizontal: 10.0),
                      child: TextFormField(
                        autofocus: false,
                        decoration: InputDecoration(
                          labelText: 'Country',
                          border: OutlineInputBorder(),
                          errorStyle: TextStyle(
                              color: Colors.red,
                              fontSize: 20
                          ),
                        ),
                        controller: countryController,
                        validator: (value) {
                          if(value==null || value.isEmpty) {
                            return 'Enter a Country.';
                          }
                          return null;
                          },
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10.0 , horizontal: 10.0),
                      child: TextFormField(
                        autofocus: false,
                        decoration: InputDecoration(
                          labelText: 'Weight',
                          border: OutlineInputBorder(),
                          errorStyle: TextStyle(
                              color: Colors.red,
                              fontSize: 20
                          ),
                        ),
                        controller: weightController,
                        validator: (value) {
                          if(value==null || value.isEmpty) {
                            return 'Enter  weight.';
                          }
                          return null;
                        },
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10.0 , horizontal: 10.0),
                      child: TextFormField(
                        autofocus: false,
                        decoration: InputDecoration(
                          labelText: 'Quantity',
                          border: OutlineInputBorder(),
                          errorStyle: TextStyle(
                              color: Colors.red,
                              fontSize: 20
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        controller: quantityController,
                        validator: (value) {
                          if(value==null || value.isEmpty) {
                            return 'Enter quantity.';
                          }
                          return null;
                        },
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10.0 , horizontal: 10.0),
                      child: TextFormField(
                        autofocus: false,
                        decoration: InputDecoration(
                          labelText: 'Buy Price',
                          border: OutlineInputBorder(),
                          errorStyle: TextStyle(
                              color: Colors.red,
                              fontSize: 20
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        controller: buyController,
                        validator: (value) {
                          if(value==null || value.isEmpty) {
                            return 'Enter a price.';
                          }
                          return null;
                        },
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10.0 , horizontal: 10.0),
                      child: TextFormField(
                        autofocus: false,
                        decoration: InputDecoration(
                          labelText: 'Sell Price',
                          border: OutlineInputBorder(),
                          errorStyle: TextStyle(
                              color: Colors.red,
                              fontSize: 20
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        controller: sellController,
                        validator: (value) {
                          if(value==null || value.isEmpty) {
                            return 'Enter a price.';
                          }
                          return null;
                        },
                      ),
                    ),

                    ElevatedButton
                      (onPressed: () => {
                      if (_formKey.currentState!.validate()){
                        setState((){
                          name=nameController.text;
                          country=countryController.text;
                          weight=weightController.text;
                          quantity=int.parse(quantityController.text);
                          buy=int.parse(buyController.text);
                          sell=int.parse(sellController.text);
                          addUser();
                          clear();
                        })
                      }
                      },
                      child: Text('Submit'),),


                  ],
               ),

             ),




           ),
         ),


    );
  }
}

//      Expanded(
//       child: StreamBuilder(stream: users.snapshots(),
//           builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
//
//             if(snapshot.hasData){
//               return ListView(
//                 children: snapshot.data!.docs.map((e) => ListTile(title: Text(e['Name']),
//                 )).toList(),
//               );
//             }
//
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//       ),
//     ),
//
//
//   ],
// ),