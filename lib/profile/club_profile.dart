
import 'package:flutter/material.dart';

class ClubProfile extends StatelessWidget {
  const ClubProfile({super.key});

  @override
  Widget build(BuildContext context) {
    // List of donors
    final List<Map<String, String>> donors = [
      {'name': 'Vivek', 'location': 'Aandroor, Dharmashala', 'bloodGroup': 'B+'},
      {'name': 'Thejus', 'location': 'Aandroor, Dharmashala', 'bloodGroup': 'O+'},
      {'name': 'Abhi', 'location': 'Thaliparamba, Dharmashala', 'bloodGroup': 'A-'},
      {'name': 'Shyam', 'location': 'Taliparamba, Kannur', 'bloodGroup': 'AB+'},
      {'name': 'Sreerag', 'location': 'Mattannur, Kannur', 'bloodGroup': 'B-'},
      {'name': 'Anjali', 'location': 'Payyannur, Kannur', 'bloodGroup': 'A+'},
      {'name': 'Rajesh', 'location': 'Cherukunnu, Kannur', 'bloodGroup': 'O-'},
      {'name': 'Meera', 'location': 'Valapattanam, Kannur', 'bloodGroup': 'AB-'},
      {'name': 'Arya', 'location': 'Chirakkal, Kannur', 'bloodGroup': 'B+'},
      {'name': 'Kiran', 'location': 'Thalassery, Kannur', 'bloodGroup': 'O+'},
    ];

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
        title: const Text(
          'Blood Donors',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                'Donors',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Search Bar and Filter Icon
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search Donors Nearby',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.filter_list, color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Donor Cards List
            Expanded(
              child: ListView.builder(
                itemCount: donors.length,
                itemBuilder: (context, index) {
                  final donor = donors[index];
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: ListTile(
                          leading: const CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.grey,
                            child: Icon(
                              Icons.person,
                              color: Colors.black,
                            ),
                          ),
                          title: Text(
                            donor['name']!,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          subtitle: Text(
                            donor['location']!,
                            style: const TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                          trailing: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8),
                            decoration: BoxDecoration(
                              color: Colors.red[400],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              donor['bloodGroup']!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            
                          ),
                          
                                            
                        ),
                      ),
                      Center(
                        child: Row(
                          children: [
                            
                         
                            ElevatedButton(onPressed: (){}, child: const Text('view'),),

                           const SizedBox(width: 20,),
                           ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 247, 227, 50)),
                            onPressed: (){}, child: const Text('contact'),),
                          ],
                        ),
                      ),
                 const     SizedBox(height: 20,),
                      const Divider(
                        height: 1,
                        color: Colors.grey,
                      ),
                      
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
