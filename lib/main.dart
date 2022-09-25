import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: FirstPage(),
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
                height: 12.0,
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
                subtitle: Material(
                  color: Colors.lightBlue,
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(25.0),
                  child: MaterialButton(
                    onPressed: () {},
                    child: Text(
                      'Search',
                      style: TextStyle(
                          fontSize: 22.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
