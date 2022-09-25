import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SecondPage(),
  ));
}

class FirstPage extends StatelessWidget {
  FirstPage({super.key});
  var _categoryNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
        color: Colors.white,
        child: Center(
          child: ListView(
            children: [
              SizedBox(
                height: 60.0,
              ),
              Image.asset(
                'assets/images/logo.png',
                width: 200.0,
                height: 200.0,
              ),
              SizedBox(
                height: 6.0,
              ),
              ListTile(
                title: TextFormField(
                  controller: _categoryNameController,
                  decoration: InputDecoration(
                      labelText: 'Enter a category',
                      hintText: 'eg: dogs, bikes, cats...',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0)),
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)),
                ),
                subtitle: Column(
                  children: [
                    SizedBox(
                      height: 8.0,
                    ),
                    Material(
                      color: Colors.lightBlue,
                      borderRadius: BorderRadius.circular(25.0),
                      elevation: 8.0,
                      child: MaterialButton(
                        minWidth: double.infinity,
                        onPressed: () {},
                        child: Text(
                          'Search',
                          style: TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        padding: EdgeInsets.all(12.0),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pic Bay',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
