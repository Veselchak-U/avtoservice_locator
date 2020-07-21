import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uuid/uuid.dart';

class Utils {
  static String getRandomUUID() {
    var uuid = Uuid();
    // Generate a v4 (random) id
    return uuid.v4();
  }

  static String counterFeedbacksToText({@required int count}) {
    var result = "";
    if (count >= 11 && count <= 14) {
      result = "$count отзывов";
    } else if (count % 10 == 1) {
      result = "$count отзыв";
    } else if (count % 10 >= 2 && count % 10 <= 4) {
      result = "$count отзыва";
    } else {
      result = "$count отзывов";
    }
    return result;
  }

  static LatLng stringToLatLng({@required String location}) {
    LatLng result;
    if (location != null && location.isNotEmpty) {
      var arr = location.split(",");
      result = LatLng(double.parse(arr[0]), double.parse(arr[1]));
    }
    return result;
  }
}
