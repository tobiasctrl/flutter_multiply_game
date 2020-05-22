// import 'package:admob_flutter/admob_flutter.dart';
// import 'dart:io';
// import 'package:flutter/material.dart';

// import 'admob_service.dart';
// class WidgetBanner extends StatefulWidget{

//   AdWidgetBanner createState() => AdWidgetBanner();

// }

// class AdWidgetBanner extends State {
//   final ams = AdMobService();
//   void initState(){
    
//     super.initState();
//     Admob.initialize(ams.getAdMobAppId());
    
//   }
// Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Container(
//         height: 100,
//         width: 100,
//       child: AdmobBanner(adUnitId: ams.getBannerAdId(), adSize: AdmobBannerSize.FULL_BANNER,
//         ),),
//       )
//     );
// }
// }
