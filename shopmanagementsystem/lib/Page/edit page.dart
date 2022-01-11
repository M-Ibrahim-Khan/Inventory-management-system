import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EditPage extends StatefulWidget {

  //obtain flutter document id
  final String id;

  const EditPage({Key? key, required this.id}) : super(key: key);

  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  //key
  final _formKey = GlobalKey<FormState>();

  //firestore
  CollectionReference stuff = FirebaseFirestore.instance.collection('stuff');

//function
  Future<void>updateUser(id ,name ,country ,weight ,quantity ,buyprice ,sellprice) {
    return stuff.doc(id).update({
      'Name' : name,
      'Country' : country,
      'Weight' : weight,
      'Quantity' : quantity,
      'Buy Price' : buyprice,
      'Sell Price' : sellprice,
    }).then((value) => print ('stuff updated'))
    .catchError((error) => print('error updating stuff: $error'));
  }

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
          appBar: AppBar(
            title: Text('Edit Page'),
          ),
        body: Form(
          key: _formKey,

          //we get the data from document id received at start by this method
          child: FutureBuilder<DocumentSnapshot  <Map <String , dynamic>>>(

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
              var quantity = data['Quantity'];
              var buyprice = data['Buy Price'];
              var sellprice  = data['Sell Price'];

              return Center(

                child: SingleChildScrollView(
                  child: Column(
                    children:[

                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10.0 , horizontal: 10.0),
                        child: TextFormField(
                          initialValue: name,
                          autofocus: false,
                          onChanged: (value) => name = value,
                          decoration: InputDecoration(
                            labelText: 'Name',
                            border: OutlineInputBorder(),
                            errorStyle: TextStyle(
                                color: Colors.red,
                                fontSize: 20
                            ),
                          ),
                          validator: (value) {
                            if(value==null || value.isEmpty) {
                              return 'Please enter a name.';
                            }
                            return null;
                            },
                        ),
                      ),

                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10.0 , horizontal: 10.0),
                      child: TextFormField(
                        initialValue: country,
                        autofocus: false,
                        onChanged: (value) => country = value,
                        decoration: InputDecoration(
                          labelText: 'Country',
                          border: OutlineInputBorder(),
                          errorStyle: TextStyle(
                              color: Colors.red,
                              fontSize: 20
                          ),
                        ),
                        validator: (value) {
                          if(value==null || value.isEmpty) {
                            return 'Please enter a Country.';
                          }
                          return null;
                        },
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10.0 , horizontal: 10.0),
                      child: TextFormField(
                        initialValue: weight,
                        autofocus: false,
                        onChanged: (value) => weight = value,
                        decoration: InputDecoration(
                          labelText: 'Weight',
                          border: OutlineInputBorder(),
                          errorStyle: TextStyle(
                              color: Colors.red,
                              fontSize: 20
                          ),
                        ),
                        validator: (value) {
                          if(value==null || value.isEmpty) {
                            return 'Please enter weight.';
                          }
                          return null;
                        },
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10.0 , horizontal: 10.0),
                      child: TextFormField(
                        initialValue: quantity.toString(),
                        autofocus: false,
                        onChanged: (value) => quantity = value,
                        decoration: InputDecoration(
                          labelText: 'Quantity',
                          border: OutlineInputBorder(),
                          errorStyle: TextStyle(
                              color: Colors.red,
                              fontSize: 20
                          ),
                        ),
                        validator: (value) {
                          if(value==null || value.isEmpty) {
                            return 'Please enter quantity.';
                          }
                          return null;
                        },
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10.0 , horizontal: 10.0),
                      child: TextFormField(
                        initialValue: buyprice.toString(),
                        autofocus: false,
                        onChanged: (value) => buyprice = value,
                        decoration: InputDecoration(
                          labelText: 'Buy Price',
                          border: OutlineInputBorder(),
                          errorStyle: TextStyle(
                              color: Colors.red,
                              fontSize: 20
                          ),
                        ),
                        validator: (value) {
                          if(value==null || value.isEmpty) {
                            return 'Please enter Price.';
                          }
                          return null;
                        },
                      ),
                    ),

                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10.0 , horizontal: 10.0),
                        child: TextFormField(
                          initialValue: sellprice.toString(),
                          autofocus: false,
                          onChanged: (value) => sellprice = value,
                          decoration: InputDecoration(
                            labelText: 'Sell Price',
                            border: OutlineInputBorder(),
                            errorStyle: TextStyle(
                                color: Colors.red,
                                fontSize: 20
                            ),
                          ),
                          validator: (value) {
                            if(value==null || value.isEmpty) {
                              return 'Please enter Price.';
                            }
                            return null;
                          },
                        ),
                      ),

                    ElevatedButton(
                        onPressed: () => {
                      if (_formKey.currentState!.validate()){
                        updateUser(widget.id ,name ,country ,weight ,quantity ,buyprice ,sellprice),
                        Navigator.pop(context)
                        }
                    },
                      child: Text('Submit'),),


                  ],
                ),
              ),

            );
            },

  ),
        ),

      );
  }
}
