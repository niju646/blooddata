import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  String? selectedOption;

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Row(
          children: [
            Icon(Icons.bloodtype, color: Colors.red),
            SizedBox(width: 5),
            Text(
              'Blood Data',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: const Column(
        children: [
        
        ],
      ),
    );
  }

 
}
