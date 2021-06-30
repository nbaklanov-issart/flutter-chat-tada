import 'package:flutter/material.dart';
import 'package:tada_chat/model/consts/colors.dart';
import 'package:tada_chat/model/system/screen_dimensions.dart';
import 'package:tada_chat/screens/tabs/server_rooms_screen.dart';
import 'package:tada_chat/screens/tabs/server_settings_screen.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({ Key? key }) : super(key: key);

  @override
  _MainScreenWidgetState createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  static const int roomsScreenIndex = 0;
  static const int settingScreenIndex = 1;
  static const int userScreenIndex = 2;

  int _selectedIndex = roomsScreenIndex;

  @override
  Widget build(BuildContext context) {
    ScreenDimensions dimensions = ScreenDimensions(context);
    return Scaffold(
      extendBody: true,
      body: _buildTabScreen(),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: tabSelectedColor,
        type: BottomNavigationBarType.fixed,                
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(                        
            icon: Icon(Icons.chat, size: dimensions.width * 0.05),            
            label: 'Rooms',
          ),
          BottomNavigationBarItem(                        
            icon: Icon(Icons.settings, size: dimensions.width * 0.05),            
            label: 'Settings',
          ),
          BottomNavigationBarItem(                        
            icon: Icon(Icons.supervised_user_circle, size: dimensions.width * 0.05),            
            label: 'User',
          )
        ],
        currentIndex: _selectedIndex,
        onTap: _changeIndex
      )        
    );
  }

  void _changeIndex(int newIndex) {    
    setState(() {
      _selectedIndex = newIndex;
    });
  }

  Widget _buildTabScreen() {
    switch(_selectedIndex) {
      case roomsScreenIndex:
        return ServerRoomsScreen();
      case settingScreenIndex:
        return ServerSettingsScreen();
      default:
        return Container();
    }
  }
}