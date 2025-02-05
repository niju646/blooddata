import 'package:flutter/material.dart';

class ClubAnySearch extends StatelessWidget {
  const ClubAnySearch({super.key});

  static final List<Map<String, String>> clubs=[
    {'name':'club1'},
    {'name':'club2'},
    {'name':'club3'},
    {'name':'club4'},
    {'name':'club5'},
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.bloodtype,color: Colors.red,),
            SizedBox(width: 8),
            Text(
              'Blood Data',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               const Center(child: Text('Search the clubs',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 44),)),
             const  SizedBox(height: 30,),
              Row(
                children: [
              
                  // Search TextField
                  Expanded(
                    
                    child: TextField(
                      
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Search Clubs',
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      
                    ),
                  ),
                  const SizedBox(width: 10), 
                  // Filter Button
                  ElevatedButton(
                    
                    onPressed: () {
                      // Handle filter button click here
                    },
                    style: ElevatedButton.styleFrom(
                      
                      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)) ,
                      backgroundColor: Colors.red,
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 20,
                      ),
                    ),
                    child: const Text(
                      'Filter',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16), 

              Expanded(child: ListView.builder(
                itemCount: clubs.length,
                itemBuilder: (context,index){
                    return Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: Card(
                          child: ListTile(
                            contentPadding: const EdgeInsets.symmetric(vertical: 20,horizontal: 16),
                            leading:const CircleAvatar(
                              
                              backgroundColor: Colors.blue,
                              child: Icon(Icons.group,color: Colors.white,), 
                            ),
                            title: Text(clubs[index]['name']!,style: const TextStyle(color: Colors.black),),
                            trailing: GestureDetector(
                              onTap: (){
                                Navigator.of(context).pushNamed('clubcard');
                              },
                              child:const CircleAvatar(
                                backgroundColor: Colors.grey,
                                child:  Icon(Icons.arrow_forward_ios,
                                size: 20,color: Color.fromARGB(255, 17, 17, 17),
                                ),
                              ),
                            ),
                            
                          ),
                      ),
                    );
                }
                )
                )
              
            ],
          ),
        ),
      ),
    );
  }
}