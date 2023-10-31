import 'package:flutter/material.dart';

void main() {
  runApp( MaterialApp(
    home: Scaffold(
      backgroundColor: Color.fromARGB(255, 250, 37, 154),
      body:  Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              Image.asset(
                'assets/foto.jpeg',
                width: 250,
                height: 250,
              ),
              Text(
                'Oya Selmin Özcan',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              Text(
                'TOBETO - Mobil Flutter - 1A',
                style: TextStyle(fontSize: 26,color: Colors.white),
              ),
              Text(
                '31.10.2023',
                style: TextStyle(fontSize: 24,color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    ),
  );
  }