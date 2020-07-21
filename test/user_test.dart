import 'dart:convert';

import 'package:avtoservicelocator/model/user.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('User.fromJson()', () {
    var jsonString =
        '{"id":"3314bed4-d8a8-4a44-bff1-435dbc204bb4","phoneNumber":"+78885551111","name":null,"eMail":null,"country":"Россия","region":"Белгородская область","city":null,"location":null,"cars":{"0":{"id":"6c5e41fa-81af-4138-9a79-ff509c7a2507","mark":"Hyundai","model":"Accent","releaseDate":"20070515","vinCode":"VINCODE","stateNumber":"A123AA","odometer":127000},"1":{"id":"d8c39d65-9dfb-4c13-99a3-f724b1e42afc","mark":"Nissan","model":"350Z","releaseDate":"20050616","vinCode":"JN1VINCODE","stateNumber":"C061CC","odometer":130000},"2":{"id":"a223e9e0-3f96-4dcb-9b57-5ed15ade26c2","mark":"Hyundai","model":"Accent","releaseDate":"20070515","vinCode":"VINCODE","stateNumber":"A123AA","odometer":127000},"3":{"id":"e435633b-de7d-4f4b-9919-6e26f117c766","mark":"Nissan","model":"350Z","releaseDate":"20050616","vinCode":"JN1VINCODE","stateNumber":"C061CC","odometer":130000},"4":{"id":"643ab682-78be-4242-b9c9-f18bf84728d9","mark":"Nissan","model":"350Z","releaseDate":"20050616","vinCode":"JN1VINCODE","stateNumber":"C061CC","odometer":130000}}}';
    var json = jsonDecode(jsonString) as Map<String, dynamic>;
    var result = User.fromJson(json);

//    expect(userInitials, "HD");
  });
}
