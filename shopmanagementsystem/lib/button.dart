import 'package:flutter/material.dart';

class MainPageButton extends StatelessWidget {

  final VoidCallback onClicked;
  final IconData icon;
  //final int containercolor;
  final int iconcolor;
  final String text;



  MainPageButton({
    required this.onClicked,
    required this.icon,
    //required this.containercolor,
    required this.iconcolor,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.grey[800],
        padding: EdgeInsets.fromLTRB(10,10,10,20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),

       onPressed: onClicked,

      child: Column(
        children: [

          Container(
            width : 100,
            height: 100,
            //decoration: BoxDecoration(
              //color: Color(containercolor),
              //borderRadius: BorderRadius.circular(60.0),
            //),
            child: Icon(
                icon,
                size:80,
                color: Color(iconcolor)
            ),
          ),

          SizedBox(height: 10),

          Text(text,
            style: TextStyle
              (fontSize: 25,
              fontWeight: FontWeight.w800,
              color: Colors.white70,
            ),
          ),

        ],
      ),
    );
  }
}


class AddButton extends StatelessWidget {

  late final String ? nametext;
  final String ? hinttext;


  AddButton({required this.nametext , required this.hinttext});


  @override
  Widget build(BuildContext context) {
    return
      Container(
        margin: EdgeInsets.only(top: 10),
        child: TextField(
        onChanged: (value) {
          nametext=value;
        },
        decoration: InputDecoration(
          labelText: hinttext,
          hintText: hinttext,
          border: OutlineInputBorder(),
        ),
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.done,
    ),
      );
  }
}

class Counter extends StatefulWidget {

  int count =0;

  Counter({required this.count});





  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int count=0;



  void incrementcount(){
    setState( () { count++; }
    );
  }

  void decrementcount(){
    setState( () {
      if (count > 0)
        count--;
    } );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

        Container(
          height: 45, width: 45,
          child: InkWell(
            borderRadius: BorderRadius.circular(20),
            splashColor: Colors.white10,
            onTap: () {
              decrementcount();
              },
            child: Icon(Icons.remove_rounded,
              size: 42,
              color: Colors.red,),
          ),
        ),

        ConstrainedBox(constraints: BoxConstraints(minWidth: 45),
            child:Center(child: Text(" $count "))
        ),

        Expanded(
          child: Container(
            height: 45, width: 45,
            child: InkWell(
              borderRadius: BorderRadius.circular(20),
              splashColor: Colors.white10,
              onTap: () {
                incrementcount();
              },
              child: Icon(Icons.add_rounded,
                size: 42,
                color: Colors.green,),
            ),
          ),
        ),

      ],
    );
  }
}


