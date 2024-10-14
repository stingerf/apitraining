import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class API2 extends StatefulWidget {
  const API2({super.key});

  @override
  State<API2> createState() => _API2State();
}

class _API2State extends State<API2> {
  @override
  List<dynamic> datas = [];
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Get API 2',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.purple,
        centerTitle: true,
      ),
      body: GridView.builder(
          itemCount: datas.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            final data = datas[index];
            final imageURL = data['image'];
            final name = data['title'];
            final desc = data['description'];
            final price = data['price'];
            return GridTile(
                child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        imageURL,
                        height: 120,
                        width: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 8,),
                    Text(
                      name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        overflow: TextOverflow.ellipsis
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '\$${price}',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      desc,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: const TextStyle(
                        fontSize: 8,
                      ),
                    ),
                  ],
                ),
              ),
            ));
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          DataCall();
        },
        backgroundColor: Colors.purple,
        child: const Icon(
          Icons.download,
          color: Colors.white,
        ),
      ),
    );
  }

  void DataCall() async {
    const url = "https://fakestoreapi.com/products";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    setState(() {
      datas = json;
    });
  }
}
