import 'package:flutter/material.dart';
import 'package:blooddata/adminview.dart';

class Admin extends StatelessWidget {
  const Admin({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock list of businesses to pass to AdminView
    final List<Map<String, String>> businesses = [
      {'name': 'Vivek', 'location': 'Kannur'},
      {'name': 'Thejus', 'location': 'Kannur'},
      {'name': 'Shyam', 'location': 'Thaliparamba'},
      {'name': 'Sreerag', 'location': 'Dharmashala'},
    ];

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center, // Ensures proper alignment
          children: [
            Icon(Icons.bloodtype, color: Colors.red),
            SizedBox(width: 8), // Add spacing
            Text(
              'Blood Data',
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        centerTitle: true,
      ),

      // Drawer
      drawer: Drawer(
        child: Column(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              child: Text(
                'BloodData',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: const Icon(Icons.person_2),
                    title: const Text('User'),
                    onTap: () {
                      Navigator.of(context).pushNamed('adminview');
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.group),
                    title: const Text('Clubs'),
                    onTap: () {
                      Navigator.of(context).pushNamed('adminviewclub');
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.handshake),
                    title: const Text('Donation Details'),
                    onTap: () {
                      Navigator.of(context).pushNamed('donationview');
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.local_hospital),
                    title: const Text('Hospital'),
                    onTap: () {
                      Navigator.of(context).pushNamed('hospital');
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('Settings'),
                    onTap: () {
                      Navigator.of(context).pushNamed('settings');
                    },
                  ),
                ],
              ),
            ),
            // Log Out button at the bottom
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Log Out'),
              onTap: () {
                _showLogoutConfirmation(context);
              },
            ),
          ],
        ),
      ),

      // Body with AdminView
      body: AdminView2(businesses: businesses),
    );
  }

  void _showLogoutConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Log Out'),
          content: const Text('Are you sure you want to log out?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed('Screentwo'); // Navigate to login screen
              },
              child: const Text('Log Out'),
            ),
          ],
        );
      },
    );
  }
}
