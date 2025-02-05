import 'package:flutter/material.dart';

class ScreenOne extends StatelessWidget {
  const ScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       backgroundColor: Colors.grey[400],
      body:Stack(
        children: [
          Container(
            
          ),
          SizedBox(width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [const Text('BloodData',style: TextStyle(color: Colors.black,fontSize: 50,fontStyle: FontStyle.normal ,fontWeight: FontWeight.bold),),
             const SizedBox(height: 20,),

              const SizedBox(height: 15,),
              SizedBox(
                height: 40,width: 300,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 224, 70, 59),
                ),
                  onPressed: (){
                    Navigator.of(context).pushNamed('Screentwo');
                  },
                 child: const Text('Login',style: TextStyle(color: Colors.white),)),
              ),
              const SizedBox(height: 15,),
              
          
              
              SizedBox(height: 40,width: 300,
                child: ElevatedButton( style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 224, 70, 59), // Set background color directly
                    ),
                  onPressed: (){
                  Navigator.of(context).pushNamed('Screenthree');
                
                }, child: const Text('Create Account',style: TextStyle(color: Colors.white),)),
              ),

             const SizedBox(height: 15,),

              SizedBox(width: 300,height: 40,
                child: ElevatedButton(style: ElevatedButton.styleFrom(
                  backgroundColor:  const Color.fromARGB(255, 224, 70, 59),
                ),
                  onPressed: (){
                  Navigator.of(context).pushNamed('clubLoginpage');
                }, 
                child:const Text('Create Club',style: TextStyle(color: Colors.white,)),
              )
              ),

              //clubs button
             const SizedBox(height: 15,),
              SizedBox(
                height: 40,width: 300,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 224, 70, 59),
                ),
                  onPressed: (){
                    Navigator.of(context).pushNamed('clubusersearch');
                  },
                 child: const Text('Clubs',style: TextStyle(color: Colors.white),)),
              )
            
            ],),
          ),
        ],
      ),
    );
  }
}