import 'package:blooddata/profile/user_profile.dart';
import 'package:blooddata/profile/search_club.dart';
import 'package:blooddata/userpage/widgets/bottom_navigation.dart';
import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  static ValueNotifier<int> selectedIndexNotifier =
      ValueNotifier(0); // bottom navigation

  final _pages = const [
    Profile(),
    SearchClub(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      bottomNavigationBar:
          const BloddDataBottonNavigation(), // bottom navigation
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.bloodtype, color: Colors.red),
            SizedBox(width: 5),
            Text(
              'Blood Data',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.red),
              child: Text(
                'BloodData',
                style: TextStyle(color: Colors.black, fontSize: 24),
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  
                  ListTile(
                    leading: const Icon(Icons.handshake),
                    title: const Text('Donation Details'),
                    onTap: () {
                      Navigator.of(context).pushNamed('donation');
                    },
                  ),
//club
                   ListTile(
                    leading:const Icon(Icons.group),
                    title:const Text('clubs'),
                    onTap: (){
                        // Navigator.of(context).pushNamed('Userpage');
                    }
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
                // Add logout functionality here
                //Navigator.of(context).pushNamed('Screentwo');
                _showLogoutConfirmation(context);

              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: selectedIndexNotifier,
          builder: (BuildContext context, int updatedIndex, _) {
            return _pages[updatedIndex];
          },
        ),
      ),
    );
  }
void _showLogoutConfirmation(BuildContext context){
  showDialog(context: context,
   builder: (BuildContext context){
      return AlertDialog(
        title: const Text('Log out'),
        content:const Text('Are you sure want to logout'),
        actions: [

          TextButton(
              onPressed: () {
                Navigator.of(context).pop(); 
              },
              child: const Text('Cancel'),),

          TextButton(onPressed: (){
              Navigator.of(context).pushNamed('Screentwo');
          }
          , child:const Text('logout')),
          
        ],
        
      );
   }
   
   );
}

}
