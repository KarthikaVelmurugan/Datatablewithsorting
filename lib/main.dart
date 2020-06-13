import 'package:flutter/material.dart';
void main(){
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Sample(),
    )
  );
}
class Sample extends StatefulWidget{
  @override
  _Sample createState() => _Sample();
}
class _Sample extends State<Sample>{
  List<Data> users;
  bool sort;
  @override
  void initState() {
    sort=false;
    users = Data.getData();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        child: DataTable(
          sortColumnIndex: 0,
          sortAscending: sort,
          columns:[
            DataColumn(label: Text("name"),numeric: false,tooltip: "this is my name",
            onSort: (columnIndex, ascending)  {
              setState(() {
                sort = !sort;
              });
              onSortColumn(columnIndex,ascending);
            }),
            DataColumn(label: Text("age"),numeric: true,tooltip: "this is my age")
          ],
          rows: users.map((b) =>
        DataRow(
    cells:[
      DataCell(Text(b.name)),
    DataCell(Text(b.age.toString()))
    ]
    )
        ).toList(),
      ),
    ));
  }
  onSortColumn(int columnIndex,bool ascending){
    if(columnIndex == 0){
      if(ascending){
        users.sort((a,b)=>a.name.compareTo(b.name));

      }
      else
        {
          users.sort((a,b) => b.name.compareTo(a.name));
        }
    }
  }
}

class Data {
  String name;
  int age;
  Data({this.name,this.age});
  static List<Data> getData(){
    return <Data>[

      Data(name:'karthika',age:12),
      Data(name:'Divya',age:11),
    ];
  }
}