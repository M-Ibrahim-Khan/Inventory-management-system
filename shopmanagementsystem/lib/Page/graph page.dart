import 'package:flutter/material.dart';
import 'package:shopmanagementsystem/Page/record%20page.dart';

class Sales extends StatelessWidget {
  const Sales({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
      appBar : AppBar(elevation: 0,
        //title: Text('Sales Page'),
        bottom: TabBar(
          tabs: [
            Tab(icon: Icon(Icons.category), text:'Record'),
            Tab(icon: Icon(Icons.account_balance_wallet_rounded), text:'Transaction'),
            Tab(icon: Icon(Icons.category), text: 'Later'),
          ],
        ),
      ),


        body:TabBarView(
          children:[
            Detail(),
            Center(child: Text('Tab 2')),
            Center(child: Text('Tab 3')),
          ]
        ),
      ),
    );
  }
}
