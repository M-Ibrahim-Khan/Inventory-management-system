import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'info page.dart';

class SellPage extends StatefulWidget {
  const SellPage({Key? key}) : super(key: key);

  @override
  _SellPageState createState() => _SellPageState();
}

class _SellPageState extends State<SellPage> {

  CollectionReference stuff = FirebaseFirestore.instance.collection('history');
  final Stream<QuerySnapshot> detailing = FirebaseFirestore.instance.collection('history').snapshots();

  final int count=0;

  //I am just gonna use another list down like storedocs so i can get it done simply

  Future<void>changeValue(id , quantity) {
    return stuff.doc(id).update({
      'Quantity' : quantity,
    }).then((value) => print ('stuff updated'))
        .catchError((error) => print('error updating stuff: $error'));
  }

  @override
  Widget build(BuildContext context) {

    return StreamBuilder<QuerySnapshot>(
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

          final List counter = [];
          counter.add(count);


            final List storedocs = [];
                 snapshot.data!.docs.map((DocumentSnapshot document) {
                   Map a = document.data() as Map<String, dynamic>;
                     storedocs.add(a);
                     a['fid'] = document.id;
                   }).toList();

             void incrementcount(int index){
               setState(() {
                 counter[index].count++;
               });
             }
            void decrementcount(int index){
              if(count!=0)
                setState(() {
                  counter[index].count--;
                });
            }

            return Scaffold(
                appBar: AppBar(
               backgroundColor: Colors.white,
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back,
                   color:Colors.black,),
                    onPressed: () {
                      Navigator.of(context).pop();
                      },
                  ),

                  actions: [
                    ElevatedButton(onPressed: () {
                      for(var i=0; i<storedocs.length ;i++) {
                        if (count != 0) {

                          showDialog(
                            barrierDismissible: true,
                            context: context,
                            builder: (_) => AlertDialog(
                              title: Text('Transaction'),
                              content: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Table(
                                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                                    children: [
                                      TableRow(
                                   children:[
                                     TableCell(child: Text('No.')),
                                     TableCell(child: Text('Name')),
                                     TableCell(child: Text('Quantity')),
                                     TableCell(child: Text('Price')),
                                   ]
                                 ),

                                 for(var i=0; i<storedocs.length ;i++) ...[
                                   TableRow(
                                     children:[

                                       TableCell( child: Text('$i') ),
                                       TableCell( child: Text( storedocs[i]['Name']) ),
                                       TableCell( child: Text( storedocs[i]['Counter'].toString()), ),
                                       TableCell( child: Text( storedocs[i]['Sell Price'].toString()), ),

                                     ],
                                   ),
                                 ]
                               ]
                             ),
                           ),

                           actions: [

                             ElevatedButton(
                               style: ElevatedButton.styleFrom(
                                   primary: Colors.white),
                               onPressed: ()
                               {

                               },
                               child: Text('Submit',
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
                               child: Text('Cancel',
                                 style: TextStyle(
                                     color: Colors.black87
                                 ),
                               ),
                             ),

                           ],
                         ),
                       );



                       // quantity = storedocs[i]['Quantity'];
                       // id = storedocs[i]['fid'];
                       // quantity = quantity - count;
                       // changeValue(id, quantity);
                       break;
                     }

                   }
                   },
                     child: Text("Submit"))

            ],

            elevation:0,
            ),

                body:ListView(
                  children:[
                    DataTable(
                        showCheckboxColumn: false,
                        columnSpacing: 20,
                        columns: [
                      DataColumn( label: Text("Name"),
                          tooltip: "This is the product's name"),
                      DataColumn( label: Text("Quantity"),
                          tooltip: "This is the product's quantity"),
                      DataColumn( label: Text("Price"),
                        tooltip: "This is the product's Selling Price",
                      ),
                      DataColumn( label: Text("Action"),
                          numeric: false,
                          tooltip: "For an action"),
            ],

                        rows: [
                      for(var i=0; i<storedocs.length ;i++) ...[
                        DataRow(
                            onSelectChanged: (newValue) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>
                                    InfoPage(id:storedocs[i]['fid'])
                    ),
                  );
                },
                            cells: [
                              DataCell( Text(storedocs[i]['Name']), ),
                              DataCell( Text((storedocs[i]['Quantity'].toString())), ),
                              DataCell( Text((storedocs[i]['Sell Price'].toString())), ),
                              //DataCell(Counter(count: count[i],)),
                              DataCell(
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container( height: 45, width: 45,
                                      child: InkWell( borderRadius: BorderRadius.circular(20), splashColor: Colors.white10, onTap: () {decrementcount(i);},
                                        child: Icon( Icons.remove_rounded, size: 42, color: Colors.red, ),
                                      ),
                                    ),
                                    ConstrainedBox(constraints: BoxConstraints(minWidth: 45),
                                        child:Center(child: Text('$count'))
                                    ),
                                    Expanded(
                                      child: Container( height: 45, width: 45,
                                        child: InkWell( borderRadius: BorderRadius.circular(20), splashColor: Colors.white10, onTap: () {incrementcount(i);},
                                          child: Icon(Icons.add_rounded, size: 42, color: Colors.green, ),
                                        ),
                                      ),
                                    ),

                                  ],
                                ),
                              ),

                            ]
                        ),
            ]
            ]

            ),





],
            )
         );

   });



  }

  // Widget buildDataTable() {
  //
  //   return DataTable(
  //     columns: [
  //       DataColumn(
  //           label: Text("Name"),
  //           numeric: false,
  //           tooltip: "This is the product's name"),
  //       DataColumn(
  //           label: Text("Quantity"),
  //           numeric: false,
  //           tooltip:
  //           "This is the product's quantity"),
  //       DataColumn(
  //         label: Text("Selling Price"),
  //         numeric: true,
  //         tooltip:
  //         "This is the product's Selling Price",
  //       ),
  //       DataColumn(
  //           label: Text("Action"),
  //           numeric: true,
  //           tooltip: "For an action"),
  //     ],
  //       rows: [
  //         DataRow(
  //             cells: [
  //               DataCell(
  //                   Text('The ')
  //               ),
  //               DataCell(
  //                   Text('Learn')
  //               ),
  //               DataCell(
  //                   Text('do')
  //               ),
  //               DataCell(
  //                   Text('Then')
  //               ),
  //             ]
  //         ),
  //       ]
  //      rows: getRows(rows),
  //   );
  // }


  // List<DataColumn> getColumns(List<String> columns) =>
  //     columns.map( (String column) => DataColumn(label: Text(column),)).toList();
  //
  //  List<DataRow> getRows(List<String> rows) =>
  //      rows.map ( (User user) {
  //
  //        final cells = [user.firstname, same likethis];
  //        return DataRow( cells: getCells(cells) );
  //      } ).toList();
  //
  // List<DataCell> getCells(List<dynamic> cells) =>
  //     cells.map( (data) => ).toList();

//                                This a Compact way of creating data table so will try to do it when I know more




  // void onSort(int columnIndex, bool ascending) {
  //
  //   if(columnIndex==0){
  //     storedocs.sort((user1 , user2) =>
  //     compareString(ascending, storedocs.'Name', .'Name'));
  //   }
  //
  //   setState(() {
  //    this.sortColumnIndex = columnIndex;
  //    this.isAscending = ascending;
  //   });
  // }



}

