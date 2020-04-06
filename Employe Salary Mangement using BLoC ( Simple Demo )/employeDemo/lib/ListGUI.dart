import 'package:employeDemo/Employe.dart';
import 'package:employeDemo/EmployeBLOC.dart';
import 'package:flutter/material.dart';

class ListGUI extends StatefulWidget {
  @override
  _ListGUIState createState() => _ListGUIState();
}

class _ListGUIState extends State<ListGUI> {
  EmployeBLOC _employeBlock=EmployeBLOC();

  @override
  void dispose(){
    _employeBlock.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _employeBlock.employeListStream,
      builder: (BuildContext contex,AsyncSnapshot<List<Employe>> snapshot){
        return snapshot.hasData?ListView.builder(
        itemCount: snapshot.data.length,
        itemBuilder:(context, index) {
         return  Card(
        elevation: 12,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text("${snapshot.data[index].id}"),
            Text("${snapshot.data[index].name}"),
            Text("${snapshot.data[index].salary}"),
            IconButton(
              color: Colors.green,
            icon:Icon(
               Icons.thumb_up), 
            onPressed: (){
             _employeBlock.employeSalaryIncrement.add(snapshot.data[index]);
            }),
            IconButton(
              color: Colors.red,
            icon:Icon(
               Icons.thumb_down), 
            onPressed: (){
              _employeBlock.employeSalaryDecrement.add(snapshot.data[index]);
            }),
          ],
        ),
      );  
        }, 
          ):Text("");  
   });
  }
}