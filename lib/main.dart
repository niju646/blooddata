import 'package:blooddata/club_admin_view.dart';
import 'package:blooddata/donation_view.dart';
import 'package:blooddata/hospital.dart';
import 'package:blooddata/new_club.dart';
import 'package:blooddata/profile/admin.dart';
import 'package:blooddata/adminview.dart';
import 'package:blooddata/club_card/club_card.dart';
import 'package:blooddata/front_page/club_any_search.dart';
import 'package:blooddata/front_page/screen_one.dart';
import 'package:blooddata/front_page/screen_two.dart';
import 'package:blooddata/profile/club_profile.dart';
import 'package:blooddata/profile/donation_details/donation.dart';
import 'package:blooddata/profile/user_profile.dart';
import 'package:blooddata/registration/club.dart';
import 'package:blooddata/registration/user_reg.dart';
import 'package:blooddata/userpage/settings/settings.dart';
import 'package:blooddata/userpage/widgets/user_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
   

      debugShowCheckedModeBanner: false,
      home: const ScreenOne(),
      routes: {
        'Screentwo': (context) => const ScreenTwo(),
        'clubusersearch': (context) => const ClubAnySearch(),
        'clubprofile': (context) => const ClubProfile(), 
        'Profile': (context) => const Profile(),
        'clubLoginpage': (context) => const ClubRegister(), 
        'Screenthree': (context) => const ScreenThree(),
        'Userpage': (context) => const UserPage(),
        'clubcard': (context) => const ClubCard(),
        'settings': (context) => const Settings(),
        'donation': (context) => const Donation(),
        'adminview':(context) => const Adminview(),
        'admin':(context) => const Admin(),
        'hospital' :(context) => const Hospital(),
        'adminviewclub':(context)=> const ClubAdminView(),
        'donationview':(context)=> const DonationView(),
        'NewClub':(context)=> const NewClub(),
      },
    );
  }
}
