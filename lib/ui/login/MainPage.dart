import 'package:flutter/material.dart';
import 'package:flutter_app/app_theme.dart';
import 'package:flutter_app/ui/travel/custom_drawer/NavDrawer.dart';
import 'package:flutter_app/ui/travel/custom_drawer/drawer_user_controller.dart';
import 'package:flutter_app/ui/travel/homepage_screen/home_screen.dart';
import 'package:flutter_app/Constant/Global_variable.dart';

class MainPage extends StatefulWidget{
  final String currentUserId;

  MainPage({Key key, @required this.currentUserId}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState(currentUserId: currentUserId);
}

class _MainPageState extends State<MainPage>{

  _MainPageState({Key key, @required this.currentUserId});

  final String currentUserId;

  Widget screenView;
  DrawerIndex drawerIndex;
  AnimationController sliderAnimationController;
  
  @override
  void initState() {
    drawerIndex = DrawerIndex.HOME;
    screenView = const MyHomePage();
    CurrentUserId.UserId = currentUserId;
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    
    return Container(
      color: AppTheme.nearlyWhite,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          backgroundColor: AppTheme.nearlyWhite,
          body: DrawerUserController(
            screenIndex: drawerIndex,
            drawerWidth: MediaQuery.of(context).size.width * 0.75,
            animationController: (AnimationController animationController){
              sliderAnimationController = animationController;
            },
            onDrawerCall: (DrawerIndex drawerIndexdata){
              changeIndex(drawerIndexdata);
            },
            screenView: screenView

          ),
        ),
      ),
    );
  }

  void changeIndex(DrawerIndex drawerIndexdata){
    if(drawerIndex != drawerIndexdata){
      drawerIndex = drawerIndexdata;
      if(drawerIndex == DrawerIndex.HOME){
        setState(() {
          screenView = const MyHomePage();
        });
      }else if(drawerIndex == DrawerIndex.Help){
        setState(() {

        });
      }else if(drawerIndex == DrawerIndex.FeedBack){
        setState(() {

        });
      }else if(drawerIndex == DrawerIndex.Invite){
        setState(() {

        });
      }else if(drawerIndex == DrawerIndex.Share){
        setState(() {

        });
      }else if(drawerIndex == DrawerIndex.About){
        setState(() {

        });
      }else{

      }
    }
  }
  
}