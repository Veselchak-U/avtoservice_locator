import 'package:avtoservicelocator/data/utils.dart';

class UserFeedback {
  String id;
  DateTime date;
  String userName;
  String text;
  double rating;

  UserFeedback({DateTime date, String userName, String text, double rating})
      : this.id = Utils.getRandomUUID(),
        this.date = date,
        this.userName = userName,
        this.text = text,
        this.rating = rating;
}
