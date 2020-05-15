import 'dart:wasm';
import 'package:flutter/material.dart';
import 'dart:async';

void main() => runApp(MaterialApp(
  home: Home(),
));


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  void first() async{
    await Future.delayed(Duration(seconds: 2), (){
    Navigator.push(context, MaterialPageRoute<void>(

      builder: (BuildContext context){
        return Scaffold(
          body: getListView()
        );
      }
    )
    );
    });
  }

  @override
  void initState() {
    super.initState();
    first();
  }

  //la premiere acitivite
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Image(
            image: AssetImage('assets/image.webp'),
          ),
      ),
    );
  }
}

List<String> getListElement(){
  List<String> number = [];
  bool val = true;

  for(var j in number){
    number.remove('$j');
   }

  for(int i = 1; i <= 1000000; i++){
      number.add('$i');
      if(i % 2 == 0){
        val = true;
      }else{
        val = false;
      }
  }

  return number;
}

Widget getListView(){
  var listItems = getListElement();  // je converti cela en int

  var i = int.parse(listItems.first);
  var j = listItems.length;

  var listView = ListView.builder(
    itemBuilder: (context, index){

      if(j % 2 == 0){
        j++;
        return Card(
          color: Colors.white, //#FFFFFF
          child: Row(
            children: <Widget>[
              Text(
                listItems[index],
                style: TextStyle(fontSize: 25.0),
              ),
              Image.asset('assets/image.webp', width: 70,)
            ],

          ),
        );

      }else{
        j++;
        return Card(
          color: Colors.grey,
          child: Row(
            children: <Widget>[
              Text(
                listItems[index],
                style: TextStyle(fontSize: 25.0),
              ),

              Image.asset('assets/image.webp', width: 70,)
            ],

          ),
        );
      }
    }
  );

  return listView;
}


