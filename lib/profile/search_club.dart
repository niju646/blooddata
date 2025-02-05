import 'package:flutter/material.dart';

class SearchClub extends StatefulWidget {
  const SearchClub({super.key});

  @override
  State<SearchClub> createState() => _SearchClubState();
}

class _SearchClubState extends State<SearchClub> {
String searchQuery = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              onChanged: (value) {
                setState((){
                  searchQuery = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'search Club',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)
              )
              ),
            
            ),
 
         ),
         //display search result
         Expanded(
          child:Center(
            child: Text(
              searchQuery.isEmpty
                        ? "Type something to search....."
                        : "Searching for: $searchQuery",
                      style: const TextStyle(fontSize: 18),
             
            ),
          )
           )
        ],
      )
      
      );
  }
}