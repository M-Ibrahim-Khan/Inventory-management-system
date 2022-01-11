import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shopmanagementsystem/Page/edit page.dart';

class Detail extends StatefulWidget {
  const Detail({Key? key}) : super(key: key);

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {

  final Stream<QuerySnapshot> detailing = FirebaseFirestore.instance.collection('stuff').snapshots();

  CollectionReference stuff = FirebaseFirestore.instance.collection('stuff');
  //CollectionReference history = FirebaseFirestore.instance.collection('history');

  Future<void> deleteUser(id) {
    return stuff.doc(id).delete()
        //.then((value) => history.doc(id).delete())
    ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Record Page'),
        elevation: 0.0,
      ),
      body: SafeArea(



      child: StreamBuilder<QuerySnapshot>(
          stream: detailing,
          builder: (BuildContext context,
              AsyncSnapshot<QuerySnapshot> snapshot) {
        if(snapshot.hasError) {
          print('error');
        }
        if(snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child:CircularProgressIndicator(),
          );
        }

        final List storedocs = [];
        snapshot.data!.docs.map((DocumentSnapshot document) {
         Map a = document.data() as Map<String, dynamic>;
         storedocs.add(a);
         a['fid'] = document.id;
        }).toList();

        return Container(
            margin: EdgeInsets.symmetric(horizontal: 2.0 , vertical: 20.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: [



                  TableRow(
                    children: [
                      TableCell(
                        child: Center(
                            child: Text('Name',
                            style: TextStyle(
                            fontWeight: FontWeight.bold,
                            ),
                            )
                        ),
                      ),
                      TableCell(
                        child: Center(
                            child: Text('Quantity',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            )
                        ),
                      ),
                      TableCell(
                        child: Center(
                            child: Text('Price',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            )
                        ),
                      ),
                      TableCell(
                        child: Center(
                            child: Text('Action',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            )
                        ),
                      ),
                    ],
                  ),

                      for(var i=0; i<storedocs.length ;i++) ...[
                  TableRow(
                      children: [

                        TableCell(
                          child: Center(
                              child: Text(storedocs[i]['Name'])
                          ),
                        ),

                        TableCell(
                          child: Center(
                              child: Text(storedocs[i]['Quantity'].toString())
                          ),
                        ),

                        TableCell(
                          child: Center(
                              child: Text(storedocs[i]['Sell Price'].toString())
                          ),
                        ),

                        TableCell(
                          child: Row(
                            children: [

                              Expanded(
                                child: Container(
                                height: 45,
                                width: 30,
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(30),
                                onTap: () {
                                  Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) =>
                                      EditPage(id:storedocs[i]['fid'])
                                  ),
                                  );
                                  },
                                  child: Icon(Icons.edit),
                                ),
                                ),
                              ),

                              Expanded(
                                child:Container(
                                  height: 45,
                                  width: 30,
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(30),
                                    onTap: () {

                                      showDialog(
                                        barrierDismissible: true,
                                        context: context,
                                        builder: (_) => AlertDialog(
                                          title: Text('Delete'),
                                          content: Text('Are you sure?'),
                                          actions: [

                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.white),
                                              onPressed: ()
                                              { deleteUser (storedocs[i]['fid']); },
                                              child: Text('Yes',
                                                style: TextStyle(
                                                    color: Colors.black87
                                                ),
                                              ),
                                            ),

                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.white),
                                              onPressed: ()
                                              { Navigator.pop(context); },
                                              child: Text('No',
                                                style: TextStyle(
                                                    color: Colors.black87
                                                ),
                                              ),
                                            ),

                                          ],
                                        ),
                                      );

            },
                                    child: Icon(Icons.delete,
                                      color: Colors.deepPurpleAccent,),
                                  ),
                                ),
                              )

                            ],
                          ),
                        ),

                      ]
                  ),
                      ]
                ],
              ),
            ),
        );

          })



      ),
    );






  }
}
