import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

   static final List<Map<String, String>> clubs=[
    {'name':'club1'},
    {'name':'club2'},
    {'name':'club3'},
    {'name':'club4'},
    {'name':'club5'},
  ];

  @override
  Widget build(BuildContext context) {

  //
     final String username  = ModalRoute.of(context)?.settings.arguments as String;
     //final String blood  = ModalRoute.of(context)?.settings.arguments as String;
//     final Map<String, String> args =
//         ModalRoute.of(context)?.settings.arguments as Map<String, String>;

//  final String username = args['name'] ?? 'name';
//    final String blood = args['blood'] ?? 'Not specified';


    //

    return Center(
      child: Column(
        children: [
          const SizedBox(height: 20,),
          const CircleAvatar(
            radius: 50,
            backgroundColor: Colors.blue,
            child:  Icon(Icons.person,size: 40,color: Colors.white,),
          ),
          const SizedBox(height: 10,),
           Text(username),//
           

          const SizedBox(height: 20,),
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text('My Clubs',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              ),
          ),
          const SizedBox(height: 20,),
          

          Expanded(child: ListView.builder(
                itemCount: clubs.length,
                itemBuilder: (context,index){
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13),
                        ),
                        elevation: 1,
                          child: ListTile(
                            contentPadding: const EdgeInsets.symmetric(vertical: 10,horizontal: 5),
                            leading:const CircleAvatar(
                              
                              backgroundColor: Colors.blue, 
                              child: Icon(Icons.person,color: Colors.white,),
                            ),
                            title: Text(clubs[index]['name']!,style: const TextStyle(color: Colors.black),),
                            trailing: GestureDetector(
                              onTap: (){
                                 Navigator.of(context).pushNamed('clubprofile');
                                //Navigator.of(context).pushNamed('');
                              },
                              child:  CircleAvatar(
                                backgroundColor: Colors.grey[400],
                                child: const Icon(Icons.arrow_forward_ios,
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
    );
  }
}