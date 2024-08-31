import 'dart:html';

import 'package:finalapp/widget/Container.dart';
import 'package:finalapp/widget/contor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Todo_app(),
    );
  }
}

// ignore: must_be_immutable
class Todo_app extends StatefulWidget {
  @override
  State<Todo_app> createState() => _Todo_appState();
}

class swalah {
  String title;
  bool status;
  swalah({required this.title, required this.status});
}

class _Todo_appState extends State<Todo_app> {
  List Books = [
    swalah(title: 'Hamoda', status: true),
    swalah(title: 'nasilm', status: true)
  ];

  Add() {
    setState(() {
      Books.add(swalah(title: myController.text, status: false));
    });
  }

  changestatu(int taskIndex) {
    setState(() {
      Books[taskIndex].status = !Books[taskIndex].status;
    });
  }

  int hsab() {
    int lwl = 0;
    Books.forEach((element) {
      if (element.status) {
        lwl++;
      }
    });
    return lwl;
  }

  remove(taskIndex) {
    setState(() {
      Books.removeAt(taskIndex);
    });
  }

  final myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "Todo App",
          style:
              TextStyle(
              fontFamily: 'erox',  
              fontSize: 35,
               color: Color.fromARGB(255, 0, 57, 243)),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        
        onPressed: () {
          setState(() {
            showDialog(
                context: context,
                builder: (BuildContext context) => Dialog(
                      backgroundColor: Color.fromARGB(255, 2, 33, 173),
                      child: Container(
                        height: 200,
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextField(
                                
                                maxLength : 15,
                                textAlign: TextAlign.center,
                                controller: myController,
                                
                                decoration: InputDecoration(
                                  
                                  fillColor: Color.fromARGB(255, 89, 86, 131),
                                  border: OutlineInputBorder(borderRadius:BorderRadius.circular(20) ),
                                  filled: true,
                                  disabledBorder: InputBorder.none,
                                  hintText: "Put your text here",
                                  
                                  hintStyle: TextStyle(fontFamily: 'erox', fontSize: 20),
                                  
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextButton(
                                  onPressed: () {
                                    Add();
                                    Navigator.pop(context);
                                  },
                                  child: Text("Add",style: TextStyle(
                                    fontFamily: 'erox',
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 0, 0, 0)

                                  ),))
                            ],
                          ),
                        ),
                      ),
                    ));
          });
        },
        backgroundColor: Color.fromARGB(255, 51, 50, 50),
        child: Icon(
          shadows: [
            Shadow(color: Colors.red, blurRadius: 30.0)],
          Icons.add,
          color: Color.fromARGB(255, 221, 208, 208),
          size: 30,
        ),
      ),
      body:
      
       SingleChildScrollView(
        child: Container(
        color: Color.fromARGB(255, 22, 22, 22),
          child: Column(
            children: [
              contor(hsab: hsab(), all: Books.length),
              //cont(),
              Container(
                height: 600,
                child: ListView.builder(
                    itemCount: Books.length,
                    itemBuilder: (BuildContext context, int Index) {
                      return cont(
                        changestatu: changestatu,
                        remove: remove,
                        iii: Index,
                        doneOrnote: Books[Index].status,
                        vartext: Books[Index].title,
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
