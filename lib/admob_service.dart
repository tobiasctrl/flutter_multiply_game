import 'dart:io';
import 'package:firebase_admob/firebase_admob.dart';
class AdMobService {
  String getAdMobAppId(){
  if(Platform.isAndroid){
    return'ca-app-pub-8791258177277979~6491947777';
  }
  return null;
  }
  String getBannerAdId(){
    if(Platform.isAndroid){
    return'ca-app-pub-3940256099942544/6300978111';
  }
  return null;
  }
  String getInterstitialAdId(){
    if(Platform.isAndroid){
    return'ca-app-pub-3940256099942544/8691691433';
  }
  return null;
  }
  InterstitialAd getLostInterstitial(){
    return InterstitialAd(adUnitId: getInterstitialAdId(),
      
    );
  }
}

  
