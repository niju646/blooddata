import 'package:blooddata/userpage/widgets/user_page.dart';
import 'package:flutter/material.dart';

class BloddDataBottonNavigation extends StatelessWidget {
  const BloddDataBottonNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return  ValueListenableBuilder(
      valueListenable: UserPage.selectedIndexNotifier,
      builder:(BuildContext ctx, int updatedIndex, Widget? _){
        return  BottomNavigationBar(
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.grey,
        currentIndex: updatedIndex,
        onTap: (newIndex){
          UserPage.selectedIndexNotifier.value = newIndex;
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home),
          label: 'home',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.search),
          label: 'search club')
          
        ]
        );
      } ,
    );
  }
  }
