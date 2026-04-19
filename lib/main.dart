import 'package:api_session/models/todoList.dart';
import 'package:flutter/material.dart';
import 'package:api_session/Servis/servis.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: FutureBuilder(
            future: TodoApiService().getTodos(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (snapshot.hasError) {
                return Center(
                  child: Text("Error: ${snapshot.error}"),
                );
              }

              List<todoModel> todos = snapshot.data!;

              return ListView.builder(
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  
                  return Text(todos[index].todo);
                },
              );
            },
          )
      ),
    );
  }
}
