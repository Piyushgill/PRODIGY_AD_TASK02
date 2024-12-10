import 'package:flutter/material.dart';
void main(){
  runApp(todolistapp());
}
class todolistapp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: todolist(),
    );
  }
}
class todolist extends StatefulWidget{
  @override
  _todolistState createState()=> _todolistState();
}
class _todolistState extends State<todolist>{
  List<String> tasks=[];
  TextEditingController taskscontroller = TextEditingController();
  void addtasks(){
    final task = taskscontroller.text.trim();
    if(taskscontroller.text.isNotEmpty){
      setState(() {
        tasks.add(taskscontroller.text);
      });
      taskscontroller.clear();
    }
  }
  void removetask(int index){
    setState(() {
      tasks.removeAt(index);
    });
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Todolist'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextField(
              controller: taskscontroller,
              decoration: InputDecoration(
                labelText: 'Enter your task',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(onPressed: addtasks,
              style:ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: Text('add task'),
            ),
            SizedBox(height: 20),
            Expanded(child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context,index){
                  return Card(
                    child: ListTile(
                      title: Text(tasks[index]),
                      trailing: IconButton(icon: Icon(Icons.delete,color: Colors.black),
                        onPressed: ()=> removetask(index),
                      ),
                    ),
                  );
                }
            ),
            ),
          ],
        ),
      ),
    );
  }
}