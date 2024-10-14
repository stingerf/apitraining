import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PagePAIOne extends StatefulWidget {
  const PagePAIOne({super.key});

  @override
  State<PagePAIOne> createState() => _PagePAIOneState();
}

class _PagePAIOneState extends State<PagePAIOne> {
  @override
  List<dynamic> users = [];
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Get API 1', style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.purple,
        centerTitle: true,
      ),

      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index){
          final user = users[index];  
          final name = user['first_name'] + '' + ['last_name'];
          final email = user['email'];
          final imageURL = user['avatar'];
          return ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(imageURL),
            ),
            title: Text(name),
            subtitle: Text(email),
          );
        }
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          getData();
        },
        backgroundColor: Colors.purple,
        child: const Icon(
          Icons.download,
          color: Colors.white,
        ),
        ),
    );
  }

  void getData () async {
    const url = 'https://api.api-ninjas.com/v1/randomimage?category={}';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    setState(() {
      users = json;
    });
  }


}