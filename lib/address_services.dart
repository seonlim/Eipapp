import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter/widgets.dart';


class Address extends StatefulWidget {

  final String city;
  final List<String> streets;

  Address({
    required this.city,
    required this.streets,
  });

  factory Address.fromJson(Map<String, dynamic> parsedJson) {
    parsedJson = {
     "city": "anjdal",
    "streets": [
    "address1",
    "adress2"
    ]
    };

    var streetsFromJson = parsedJson['streets'];
    print(streetsFromJson.runtimeType);
    List<String> streetsList = List<String>.from(streetsFromJson);

    return Address(
      city: parsedJson['city'], streets: parsedJson['streets'],
    );
  }

  @override
  _AddressState createState() => _AddressState();
}

class _AddressState extends State<Address> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
    );
  }
}

