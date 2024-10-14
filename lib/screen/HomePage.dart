import 'package:apipart2/screen/api1.dart';
import 'package:apipart2/screen/api2.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home Page', style: TextStyle(color: Colors.white),
      ),
      centerTitle: true,
      backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return const PagePAIOne();
                }));
              }, 
              child: const Text('API 1')
              ),
              const SizedBox(height: 20,),
              ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return const API2();
                }));
              }, 
              child: const Text('API 2')
              ),
            ],
          ),
        ),
      ),
    );
  }
}