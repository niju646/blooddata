import 'package:flutter/material.dart';

class NewClub extends StatefulWidget {
  const NewClub({super.key});

  @override
  State<NewClub> createState() => _NewClubState();
}

class _NewClubState extends State<NewClub> {
  @override
  Widget build(BuildContext context) {
    final String username = ModalRoute.of(context)?.settings.arguments as String;

    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Row(
          children: [
            Icon(
              Icons.bloodtype,
              color: Colors.red,
            ),
            SizedBox(width: 8),
            Text(
              'BloodData',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Center(
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.blue,
                  child: Icon(
                    Icons.group,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Text(
                  username,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'Donors',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
