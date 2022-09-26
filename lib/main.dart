import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: FirstPage(),
  ));
}

class FirstPage extends StatelessWidget {
  FirstPage({super.key});
  final _categoryNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
        color: Colors.white,
        child: Center(
          child: ListView(
            children: [
              const SizedBox(
                height: 60.0,
              ),
              Image.asset(
                'assets/images/logo.png',
                width: 200.0,
                height: 200.0,
              ),
              const SizedBox(
                height: 6.0,
              ),
              ListTile(
                title: TextFormField(
                  onFieldSubmitted: (value) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SecondPage(
                                  category: value,
                                )));
                  },
                  controller: _categoryNameController,
                  decoration: InputDecoration(
                      labelText: 'Enter a category',
                      hintText: 'eg: dogs, bikes, cats...',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0)),
                      contentPadding:
                          const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)),
                ),
                subtitle: Column(
                  children: [
                    const SizedBox(
                      height: 8.0,
                    ),
                    Material(
                      color: Colors.lightBlue,
                      borderRadius: BorderRadius.circular(25.0),
                      elevation: 8.0,
                      child: MaterialButton(
                        minWidth: double.infinity,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SecondPage(
                                        category: _categoryNameController.text,
                                      )));
                        },
                        padding: const EdgeInsets.all(12.0),
                        child: const Text(
                          'Search',
                          style: TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
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
  String category;
  SecondPage({super.key, required this.category});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pic Bay',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: FutureBuilder(
          future: getPics(widget.category),
          builder: (context, snapshot) {
            Map? data = snapshot.data;
            if (snapshot.hasError) {
              print(snapshot.error);
              return const Text(
                'Failed to get response from the server',
                style: TextStyle(color: Colors.green, fontSize: 22.0),
              );
            } else if (snapshot.hasData) {
              return Center(
                child: ListView.builder(
                    itemCount: data!.length,
                    itemBuilder: ((context, index) {
                      return Column(
                        children: [
                          Container(
                            child: InkWell(
                              onTap: () {},
                              child: Image.network(
                                  '${data!['hits'][index]['largeImageURL']}'),
                            ),
                          ),
                          const SizedBox(
                            height: 8.0,
                          )
                        ],
                      );
                    })),
              );
            } else if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return const Text('Nothing found here');
          }),
    );
  }
}

Future<Map> getPics(String category) async {
  String apiKey = '30112036-5fc592cf8a5e5f679bc48f966';
  Uri uri = Uri(
      scheme: 'https',
      host: 'pixabay.com',
      path: '/api/',
      queryParameters: {'key': apiKey, 'q': category, 'image_type': 'photo'});

  http.Response response = await http.get(uri);

  return json.decode(response.body);
}
