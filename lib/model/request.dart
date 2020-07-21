import 'package:avtoservicelocator/data/utils.dart';
import 'package:avtoservicelocator/model/car.dart';
import 'package:avtoservicelocator/model/proposal.dart';
import 'package:avtoservicelocator/model/request_item.dart';

class Request {
  Request(
      {this.userId,
      this.date,
      this.number,
      this.status,
      this.car,
      this.description,
      this.photos,
      this.dateRepair,
      this.signYourParts,
      this.signNeedEvacuation,
      this.proposals})
      : id = Utils.getRandomUUID();

  String id;
  String userId;
  DateTime date;
  int number;
  RequestStatus status;
  Car car;
  String description;
  List<String> photos;
  DateTime dateRepair;
  bool signYourParts;
  bool signNeedEvacuation;
  List<Proposal> proposals;

  RequestItem toRequestItem() {
    return RequestItem(
        id: id,
        number: number,
        status: status,
        descCar: car.getCarDescription(),
        descRequest: description,
        descProposals: getProposalsDescription());
  }

  List<String> getProposalsDescription() {
    List<String> result = [];
    if (proposals == null || proposals.length == 0) {
      result.add('Ожидание предложений');
    } else {
      result.add(counterProposalsToText());
      result.add(
          'от ${proposals.reduce((current, next) => current.price < next.price ? current : next).price} \u{20BD}');
    }
    return result;
  }

  String counterProposalsToText() {
    var result = "";
    var count = proposals.length;
    if (count >= 11 && count <= 14) {
      result = "$count предложений";
    } else if (count % 10 == 1) {
      result = "$count предложение";
    } else if (count % 10 >= 2 && count % 10 <= 4) {
      result = "$count предложения";
    } else {
      result = "$count предложений";
    }
    return result;
  }
}

enum RequestStatus { ACTIVE, WORK, DONE, CANCEL }
