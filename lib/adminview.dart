import 'package:flutter/material.dart';

class Adminview extends StatefulWidget {
  const Adminview({super.key});

  @override
  State<Adminview> createState() => _AdminviewState();
}

class _AdminviewState extends State<Adminview> {
  
  final List<Map<String, String>> businesses = [
    {'name': 'vivek', 'location': 'kannur'},
    {'name': 'thejus', 'location': 'kannur'},
    {'name': 'shyam', 'location': 'thaliparamba'},
    {'name': 'sreerag', 'location': 'dharmashala'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'BloodData',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
      ),
      body: AdminView2(businesses: businesses),
    );
  }
}

class AdminView2 extends StatelessWidget {
  const AdminView2({
    super.key,
    required this.businesses,
  });

  final List<Map<String, String>> businesses;
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          // Search Bar Row
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
                  onPressed: () {
                    // Add filter functionality here
                    Navigator.of(context).pushNamed('Screenthree');
                  },
                  icon: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // List of Businesses
          Expanded(
            child: ListView.builder(
              itemCount: businesses.length,
              itemBuilder: (context, index) {
                final business = businesses[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        // Circle Avatar Placeholder
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: const CircleAvatar(
                            radius: 30,
                            child: Icon(Icons.person, size: 30),
                          ),
                        ),
                        const SizedBox(width: 12),
                        // Business Details
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                business['name']!,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.location_on,
                                    size: 14,
                                    color: Colors.grey,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    business['location']!,
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
                        // Action Buttons
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
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
                              icon:
                                  const Icon(Icons.remove_red_eye, size: 16),
                              label: const Text('View'),
                            ),
                            const SizedBox(height: 8),
                            ElevatedButton.icon(
                              onPressed: () {
                                // Add your "Call" functionality here
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.yellow[700],
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 8),
                              ),
                              icon: const Icon(Icons.call, size: 16),
                              label: const Text('Call'),
                            ),
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
    );
  }
}
