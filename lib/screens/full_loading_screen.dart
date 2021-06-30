import 'package:flutter/material.dart';
import 'package:tada_chat/model/system/screen_dimensions.dart';

class FullLoadingScreen extends StatelessWidget {
  const FullLoadingScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenDimensions dimen = ScreenDimensions(context);    
    return Scaffold(      
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: dimen.width / 3,
                height: dimen.width / 3,
                child: CircularProgressIndicator()
              )
            ]
          )
        ]
      )
    );
  }
}