import 'package:avtoservicelocator/model/request.dart';

class RequestItem {
  RequestItem(
      {this.id,
      this.number,
      this.status,
      this.descCar,
      this.descRequest,
      this.descProposals});

  String id;
  int number;
  RequestStatus status;
  String descCar;
  String descRequest;
  List<String> descProposals;

  String get statusText {
    var result = '';
    if (status == RequestStatus.ACTIVE) {
      result = 'Ожидание';
    } else if (status == RequestStatus.WORK) {
      result = 'В работе';
    } else if (status == RequestStatus.DONE) {
      result = 'Завершена';
    } else if (status == RequestStatus.CANCEL) {
      result = 'Отменена';
    }
    return result;
  }
}
