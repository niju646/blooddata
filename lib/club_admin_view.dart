import 'package:flutter/material.dart';

class ClubAdminView extends StatefulWidget {
  const ClubAdminView({super.key});

  @override
  State<ClubAdminView> createState() => _ClubAdminViewState();
}

class _ClubAdminViewState extends State<ClubAdminView> {
  final List<Map<String, String>> clubsname = [
    {'name': 'club1', 'location': 'kannur'},
    {'name': 'club2', 'location': 'kannur'},
    {'name': 'club3', 'location': 'thaliparamba'},
    {'name': 'club4', 'location': 'dharmashala'},
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
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Search clubs',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 12),
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
                        Navigator.of(context).pushNamed('clubLoginpage');
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

            // Clubs List
            Expanded(
              child: ListView.builder(
                itemCount: clubsname.length,
                itemBuilder: (context, index) {
                  final club = clubsname[index];
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
                                      Icons.location_on,
                                      size: 14,
                                      color: Colors.grey,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      club['location']!,
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
                              // ElevatedButton.icon(
                              //   onPressed: () {
                              //     // Add your "Call" functionality here
                              //   },
                              //   style: ElevatedButton.styleFrom(
                              //     backgroundColor: Colors.yellow[700],
                              //     foregroundColor: Colors.white,
                              //     padding: const EdgeInsets.symmetric(
                              //         horizontal: 12, vertical: 8),
                              //   ),
                              //   icon: const Icon(Icons.call, size: 16),
                              //   label: const Text('Call'),
                              // ),
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
