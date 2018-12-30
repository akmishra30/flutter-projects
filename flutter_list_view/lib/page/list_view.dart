import 'package:flutter/material.dart';
import 'package:flutter_list_view/model/Car.dart';

class ListViewPage extends StatelessWidget{

  List<Car> getCarsList() {
    return List<Car>.generate(
    100, (i) => Car("Car $i", "Model $i", "Model $i is a nice car "
    "and it has sporty look as well. There are limited editions available in the market"
    ". This car is in both varient 1. Petrol and 2. Diseal")
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List View Widget"),
      ),
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      body: Container(
        child: ListView.builder(itemBuilder: (BuildContext context, int index) {
          return buildListCard(getCarsList()[index], context);
        }),
      )
    );
  }

  Card buildListCard(Car car, BuildContext context) => Card(
    elevation: 5.0,
    margin: new EdgeInsets.symmetric(horizontal: 8.0, vertical: 3.0),
    child: Container(
      decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
      child: buildListTile(car, context),
      height: 70.0,
    ),
  );

  ListTile buildListTile(Car car, BuildContext context) => ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
      leading: Container(
        padding: EdgeInsets.only(right: 12.0),
        decoration: new BoxDecoration(
            border: new Border(
                right: new BorderSide(width: 1.0, color: Colors.white24))),
        child: Icon(Icons.account_box, color: Colors.white),
      ),
      title: Text(
        car.name,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      subtitle: Row(
        children: <Widget>[
          Icon(Icons.linear_scale, color: Colors.yellowAccent),
          Text(car.model, style: TextStyle(color: Colors.white)),
          //Text(car.description, style: TextStyle(color: Colors.white))
        ],
      ),
      trailing:
      Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
      onTap: (){
        return showDialog(context: context, builder: (context){
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: BorderSide.none
            ),
            title: new Text("Flutter Alert", style: TextStyle(color: Colors.blue)),
            content: Text(car.description),
            actions: <Widget>[
              new IconButton(onPressed: (){
                Navigator.of(context).pop();
              }, icon: Icon(Icons.close, color: Colors.black, size: 30.0))
            ],
          );
        });
      }
  );
}