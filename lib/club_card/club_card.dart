import 'package:flutter/material.dart';

class ClubCard extends StatelessWidget {
  const ClubCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
    appBar: AppBar(
      centerTitle: true,
       title: const Row(
         children: [
         Icon(Icons.bloodtype,color: Colors.red,),
           Text('BloodData',style: TextStyle(color: Colors.black),
           ),
           
         ],
       ),
    backgroundColor: Colors.white,
    leading: IconButton(onPressed: (){
        Navigator.of(context).pop();
    },
     icon:  const Icon(Icons.arrow_back))
    ),
      body: const SafeArea(
        child: Center(
          child: SizedBox(
            width: 500,
            height: 500,
            child:  Card(
              child: 
              Column(
                children: [
                  SizedBox(height: 30,),
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.blue,
                    
                  ),
                  SizedBox(height: 20,),
                  Text('club 1'),
            
                ],
              ),
              
            ),
          ),
        )
        ),

    );
  }
}