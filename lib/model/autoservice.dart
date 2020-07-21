import 'package:avtoservicelocator/data/utils.dart';
import 'package:avtoservicelocator/model/autoservice_item.dart';
import 'package:avtoservicelocator/model/user_feedback.dart';

class AutoService {
  AutoService(
      {this.name,
      this.address,
      this.location,
      this.description,
      this.photos,
      this.userRating,
      this.stars,
      this.feedbacks})
      : id = Utils.getRandomUUID();

  String id;
  String name;
  String address;
  String location;
  String description;
  List<String> photos;
  double userRating;
  int stars;
  List<UserFeedback> feedbacks;

  AutoServiceItem toAutoServiceItem() {
    return AutoServiceItem(
        id: id,
        name: name,
        address: address,
        location: location,
        description: description,
        userRating: userRating,
        stars: stars,
        counterFeedbacks: feedbacks?.length);
  }
}
