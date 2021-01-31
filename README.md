![alt text](https://github.com/Domepo/virometer/blob/dev/.github/images/ReadmeHeader.jpg)
An open soruce app with which you can display the current virus status of a region <br>
![GitHub](https://img.shields.io/github/license/domepo/virometer)
![GitHub issues](https://img.shields.io/github/issues/Domepo/virometer)<br>
![YouTube Video Views](https://img.shields.io/youtube/views/oGL7QCgD3a4)

# Table of contents
- [Important](#Important)
- [Introduction](#Introduction)
- [Features](#Features)
  - [Images](#Images)
- [API](#API)
- [Libaries](#Libaries)
- [Installation](#Installation)
  -[F-Droid](#F-Droid)
  -[Android-IOS](#Android-IOS)
- [Todo](#Todo)
- [License](#License)
# Important
Because in germany you need permission from the federal government or the health department to upload an app that displays corona specific data, the app will only be available on F-Droid<br>
🔴coming soon🔴
<p float="left">
<a href="#Important">
<img src="https://github.com/Domepo/virometer/blob/main/.github/images/get-it-on.png" width="30%" />
 </a>  
</p>


# Introduction
The Virometer-App is based on the [flutter](https://flutter.dev/) framework. <br>Because there are some mutations of the Corona-Virus the app is build modular so its easy to add mutations, viruses or regions.
The data for the german districts are from the [RKI-API](#API)

# Features
Here you can see the main functions of the app
- See all german districts
- Select as much as you want
- Your selections are permanently stored
- Look at the most important numbers:
  - 7 days incidence
  - total deaths
  - total cases
- IOS and Android compatible
- [Todo](#Todo)

## Images
Some screenshots: <br>
<p float="left">
  <img src="https://github.com/Domepo/virometer/blob/main/assets/logos%20and%20screens/screens/VirometerAppScreenshot1.png" width="30%" />
  <img src="https://github.com/Domepo/virometer/blob/main/assets/logos%20and%20screens/screens/VirometerAppScreenshot2.png" width="30%" />
  <img src="https://github.com/Domepo/virometer/blob/main/assets/logos%20and%20screens/screens/VirometerAppScreenshot3.png" width="30%" /> 
</p>

## Video
I have made the video in Adobe After Effects and the design in Adobe XD.<br>
 <a href="https://www.youtube.com/watch?v=oGL7QCgD3a4">
  <img src="https://github.com/Domepo/virometer/blob/main/.github/images/youtube-button.png" width="15%" />
</a>  

# API

I have the data from an API of the Robert Koch Institute, which updates itself every 24 hours.<br>
- [RKI API](https://npgeo-corona-npgeo-de.hub.arcgis.com/datasets/8fc79b6cf7054b1b80385bda619f39b8_0)<br>

This is the JSON I used: <br>

- [JSON](https://services7.arcgis.com/mOBPykOjAyBO2ZKk/arcgis/rest/services/RKI_Landkreisdaten/FeatureServer/0/query?where=1%3D1&outFields=cases,deaths,county&returnGeometry=false&outSR=4326&f=json)

# Libaries
- [Hive](https://pub.dev/packages/hive)
- [latinize](https://pub.dev/packages/latinize)
- [Introduction Screen](https://pub.dev/packages/introduction_screen)

## Dependencies
```yaml
dependencies:
  intl: ^0.16.1
  http: ^0.12.2
  path_provider: ^1.5.0
  hive: ^1.4.4+1
  hive_flutter: ^0.3.1
  latinize: '>=0.0.1 <1.0.0'
  introduction_screen: ^1.0.7
  flutter:
    sdk: flutter
```
# Installation
Coming soon
## F-Droid
Coming soon
## Android-IOS
Coming soon(hopefully)

# Todo
- upload Virometer to F-Droid
- change the input form from ASCII to UTF8 
  - maybe sql instead of hive
- add more regions and viruses
- fix some minor [issues](https://github.com/Domepo/virometer/issues)

# License
![GitHub](https://img.shields.io/github/license/domepo/virometer)
