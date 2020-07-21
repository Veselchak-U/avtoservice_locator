import 'dart:core';
import 'package:avtoservicelocator/data/utils.dart';
import 'package:avtoservicelocator/model/car.dart';
import 'package:flutter/foundation.dart';

class User {
  User(
      {String id,
      @required this.phoneNumber,
      this.name,
      this.eMail,
      this.avatar,
      this.country,
      this.region,
      this.city,
      this.location,
      this.cars})
      : id = id ?? Utils.getRandomUUID();

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String,
        phoneNumber = json['phoneNumber'] as String,
        name = json['name'] as String,
        eMail = json['eMail'] as String,
        avatar = json['avatar'] as String,
        country = json['country'] as String,
        region = json['region'] as String,
        city = json['city'] as String,
        location = json['location'] as String {
    cars = _carsFromJson(json['cars'] as Map<String, dynamic>);
  }

  String id;
  String phoneNumber;
  String name;
  String eMail;
  String avatar;
  String country;
  String region;
  String city;
  String location;
  List<Car> cars;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'phoneNumber': phoneNumber,
        'name': name,
        'eMail': eMail,
        'avatar': avatar,
        'country': country,
        'region': region,
        'city': city,
        'location': location,
        'cars': _carsToJson()
      };

  Map<String, dynamic> _carsToJson() {
    Map<String, dynamic> result = <String, dynamic>{};
    if (cars != null && cars.isNotEmpty) {
      var i = 0;
      cars.forEach((car) {
        result[i.toString()] = car.toJson();
        i++;
      });
    }
    return result.isNotEmpty ? result : null;
  }

  List<Car> _carsFromJson(Map<String, dynamic> json) {
    if (json == null || json.isEmpty) {
      return null;
    } else {
/*      var result = <Car>[];
      for (int i = 0; i < json.length; i++) {
        var carJson = json['$i'] as Map<String, dynamic>;
        var car = Car.fromJson(carJson);
        result.add(car);
      }
      return result;*/
      return Iterable<int>.generate(json.length)
          .toList()
          .map((int index) =>
              Car.fromJson(json['$index'] as Map<String, dynamic>))
          .toList();
    }
  }

  String getUserCarsDescription() {
    if (cars != null && cars.isNotEmpty) {
      return '${cars[0].getCarDescription()} (всего ${cars.length})';
    } else {
      return null;
    }
  }
}
