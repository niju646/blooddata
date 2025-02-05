import 'package:flutter/material.dart';

class DonationView extends StatefulWidget {
  const DonationView({super.key});

  @override
  State<DonationView> createState() => _DonationViewState();
}

class _DonationViewState extends State<DonationView> {
  final List<Map<String, String>> donar = [
    {'name': 'vivek', 'hospital': 'hospital 1'},
    {'name': 'thejus', 'hospital': 'hospital 2'},
    {'name': 'shyam', 'hospital': 'hospital 3'},
    {'name': 'sreerag', 'hospital': 'hospital 4'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        backgroundColor: Colors.white,
        title: const Row(
          children: [
            Icon(Icons.bloodtype, color: Colors.red),
            SizedBox(width: 8),
            Text(
              'Blood Data',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search Bar and Add Button
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration:  InputDecoration(
                        hintText: 'Search clubs',
                        border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                       // contentPadding: EdgeInsets.symmetric(horizontal: 12),
                      ),
                    ),
                  ),
                 const SizedBox(width: 10,),
                  Container(
                    decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  
                    child: IconButton(
                      onPressed: () {
                        // Add your "Add" functionality here
                        Navigator.of(context).pushNamed('donation');
                      },
                      icon: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // donors List
            Expanded(
              child: ListView.builder(
                itemCount: donar.length,
                itemBuilder: (context, index) {
                  final club = donar[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: const CircleAvatar(
                              radius: 30,
                              child: Icon(Icons.person, size: 30),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  club['name']!,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.local_hospital_outlined,
                                      size: 14,
                                      color: Colors.grey,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      club['hospital']!,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              ElevatedButton.icon(
                                onPressed: () {
                                  // Add your "View" functionality here
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.grey[200],
                                  foregroundColor: Colors.black,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 8),
                                ),
                                icon: const Icon(Icons.remove_red_eye, size: 16),
                                label: const Text('View'),
                              ),
                              const SizedBox(height: 8),
                              
                            ],
                          ),
                        ],
                      ),
                    ),
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
