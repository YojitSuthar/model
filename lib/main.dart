
import 'package:flutter/material.dart';

import 'model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kindacode.com',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late String name1;
  late String age;
  late String address;

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();


  List<namesModel> namel=[
    namesModel(name: "yojit",address: "rajasthan"),
    namesModel(name: "jimmy",address: "sagwara"),
  ];


  void updatedata(TextEditingController names,TextEditingController ages){
    namel.add(namesModel(name: names.text,address: ages.text));
  }

  void editdata(TextEditingController name,TextEditingController age,int index){
    namel[index].name=name.text;
    namel[index].age=age.text;
  }

   _showFrom(String? id,int index)  {
    if (id != null) {
      _titleController.text=namel[index].name!;
      _descriptionController.text=namel[index].age!;
    }

    showModalBottomSheet(
        context: context,
        elevation: 20,
        isScrollControlled: true,
        builder: (_) => Container(
          padding: EdgeInsets.only(
              top: 15,
              bottom: MediaQuery.of(context).viewInsets.bottom + 120,
              left: 15,
              right: 15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _titleController,
                decoration: InputDecoration(hintText: "Title"),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: _descriptionController,
                decoration: InputDecoration(hintText: "description"),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: ()  {
                    if (id == null) {
                      updatedata(_titleController,_descriptionController);
                    }
                    if (id != null) {
                      editdata(_titleController,_descriptionController,index);

                    }
                    _titleController.text="";
                    _descriptionController.text="";
                    Navigator.of(context).pop();
                    setState(() {

                    });
                  },
                  child: Text(id == null ? "Create New" : "Edit"))
            ],
          ),
        ));
  }
  var inf;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        // implement GridView.builder
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            itemCount: namel.length,
            itemBuilder: (BuildContext ctx, index) {
              return Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(15)),
                    child: Text("email${namel[index].name} "),
                  ),
                  TextButton(onPressed: ()
                  {
                    _showFrom(namel[index].name,index);
                    print(namel[index].name);
                    print(index);

                  } ,child:Icon(Icons.earbuds) ),

                ],
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _showFrom(null,0);
        },
        child: Icon(Icons.edit),
      ),


    );
  }
}
