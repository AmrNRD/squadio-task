import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


final LinkedHashMap<String, IconData> icons = {
  // Generic
  "add": FontAwesomeIcons.plus,

  // Vehicles
  "bicycle": FontAwesomeIcons.bicycle,
  "car": FontAwesomeIcons.car,
  "bus": FontAwesomeIcons.busAlt,
  "motorcycle": FontAwesomeIcons.motorcycle,
  "gas_pump": FontAwesomeIcons.gasPump,
  "charging_station": FontAwesomeIcons.chargingStation,
  "tractor": FontAwesomeIcons.tractor,

  // Computers & electronics
  "gamepad": FontAwesomeIcons.gamepad,
  "steam":  FontAwesomeIcons.steam,
  "laptop": Icons.laptop_mac,
  "desktop": Icons.desktop_windows,
  "mobile": FontAwesomeIcons.mobile,
  "server": FontAwesomeIcons.server,
  "tablet": Icons.tablet_mac,
  "tv": Icons.tv,
  "watch": Icons.watch,

  // Clothes
  "tshirt": FontAwesomeIcons.tshirt,

  // Food & drink
  "food": Icons.fastfood,
  "restaurant": Icons.restaurant,
  "beer": FontAwesomeIcons.beer,
  "birthday_cake": FontAwesomeIcons.birthdayCake,
  "candy": FontAwesomeIcons.candyCane,
  "cocktail": FontAwesomeIcons.cocktail,
  "glass_martini": FontAwesomeIcons.glassMartiniAlt,
  "wine_glass": FontAwesomeIcons.wineGlassAlt,
  "glass_whiskey": FontAwesomeIcons.glassWhiskey,
  "wine_bottle": FontAwesomeIcons.wineBottle,
  "coffee": FontAwesomeIcons.coffee,
  "cookie": FontAwesomeIcons.cookie,
  "egg": FontAwesomeIcons.egg,
  "fish": FontAwesomeIcons.fish,
  "hotdog": FontAwesomeIcons.hotdog,
  "icecream": FontAwesomeIcons.iceCream,
  "gem": FontAwesomeIcons.gem,
  "house-damage": FontAwesomeIcons.houseDamage,
  "lemon": FontAwesomeIcons.lemon,
  "mortar_pestle": FontAwesomeIcons.mortarPestle,

  // Sports
  "basketball": FontAwesomeIcons.basketballBall,
  "baseball": FontAwesomeIcons.baseballBall,
  "bowling": FontAwesomeIcons.bowlingBall,
  "football": FontAwesomeIcons.footballBall,
  "futbal": FontAwesomeIcons.futbol,
  "golfball": FontAwesomeIcons.golfBall,
  "chess": FontAwesomeIcons.chess,
  "skating": FontAwesomeIcons.skating,
  "skiing": FontAwesomeIcons.skiing,
  "skiing_nordic": FontAwesomeIcons.skiingNordic,
  "snowboarding": FontAwesomeIcons.snowboarding,

  // Shopping & currency
  "bitcoin": FontAwesomeIcons.bitcoin,
  "ethereum": FontAwesomeIcons.ethereum,
  "gifts": FontAwesomeIcons.gifts,
  "gift": FontAwesomeIcons.gift,
  "money": Icons.attach_money,
  "money_bill": FontAwesomeIcons.moneyBill,
  "shopping_cart": Icons.local_grocery_store,
  "store": Icons.store,
  "shopping_basket": FontAwesomeIcons.shoppingBasket,

  // Travel & sightseeing
  "binoculars": FontAwesomeIcons.binoculars,
  "briefcase": FontAwesomeIcons.briefcase,
  "camera": FontAwesomeIcons.cameraRetro,
  "fly": FontAwesomeIcons.fly,
  "hotel": FontAwesomeIcons.hotel,
  "mountains": Icons.terrain,
  "plane": FontAwesomeIcons.plane,
  "spa": FontAwesomeIcons.spa,
  "suitcase": FontAwesomeIcons.suitcaseRolling,
  "taxi": FontAwesomeIcons.taxi,
  "train": Icons.train,
  "tram": Icons.tram,

  // Health & beauty
  "bath": FontAwesomeIcons.bath,
  "briefcase_medical": FontAwesomeIcons.briefcaseMedical,
  "flask": FontAwesomeIcons.flask,
  "heartbeat": FontAwesomeIcons.heartbeat,
  "heart": FontAwesomeIcons.heart,
  "solid_heart": FontAwesomeIcons.solidHeart,
  "medkit": FontAwesomeIcons.medkit,
  "microscope": FontAwesomeIcons.microscope,
  "prescription_bottle": FontAwesomeIcons.prescriptionBottleAlt,
  "pills": FontAwesomeIcons.pills,

  // Religion
  "mosque": FontAwesomeIcons.mosque,
  "curch": FontAwesomeIcons.church,
  "place_of_worship": FontAwesomeIcons.cross,

  // House
  "home": FontAwesomeIcons.home,
  "couch": FontAwesomeIcons.couch,
  "open_box": FontAwesomeIcons.boxOpen,
  "paint_roller": FontAwesomeIcons.paintRoller,
  "palette": FontAwesomeIcons.palette,
  "spray_can": FontAwesomeIcons.sprayCan,
  "toolbox": FontAwesomeIcons.toolbox,
  "tools": FontAwesomeIcons.tools,
  "trash": FontAwesomeIcons.trashAlt,

  // Other
  "bone": FontAwesomeIcons.bone,
  "concierge": FontAwesomeIcons.conciergeBell,
  "dog": FontAwesomeIcons.dog,
  "pets": Icons.pets,
  "graduation_cap": FontAwesomeIcons.graduationCap,
  "tree": FontAwesomeIcons.tree,
  "child": Icons.child_friendly,
} as LinkedHashMap<String, IconData>;
