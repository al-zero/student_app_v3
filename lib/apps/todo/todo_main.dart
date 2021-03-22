import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_app_v3/apps/todo/screens/addTodo.dart';
import 'package:student_app_v3/views/home_view.dart';
import '../../home.dart';
import '../../pages.dart';
import 'api/api.dart';


class TodoMain extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodoProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: TodoHomePage(),
      ),
    );
  }
}

class TodoHomePage extends StatefulWidget {
  @override
  _TodoHomePageState createState() => _TodoHomePageState();
}

class _TodoHomePageState extends State<TodoHomePage> {
  bool _isLoading = true;

  void loadingStateController(){
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    loadingStateController();
  }

  @override
  Widget build(BuildContext context) {
    final todoP = Provider.of<TodoProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Todo App"),
        leading: BackButton(
          color: Colors.black,
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));

          },

),
      ),
      body: _isLoading ? Center(child: Container(child: CircularProgressIndicator(),)) : ListView.builder(

        itemCount: todoP.todos.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(left:10.0, right: 10.0, top: 15),
            child: InkWell(
              onTap: (){},
              child: Card(
                elevation: 20.0,
                child: ListTile(
                  trailing: IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red[900],
                      ),
                      onPressed: () {
                        todoP.deleteTodo(todoP.todos[index]);
                      }),
                  title: Text(
                    todoP.todos[index].title,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    todoP.todos[index].description,
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            size: 30.0,
          ),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (ctx) => AddTodoScreen()));
          }),
    );
  }
}
