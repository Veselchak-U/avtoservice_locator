import 'package:avtoservicelocator/data/utils.dart';
import 'package:avtoservicelocator/model/extention/datetime_extension.dart';

class Car {
  Car(
      {String id,
      this.mark,
      this.model,
      this.releaseDate,
      this.vinCode,
      this.stateNumber,
      this.odometer})
      : id = id ?? Utils.getRandomUUID();

  Car.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String,
        mark = json['mark'] as String,
        model = json['model'] as String,
        releaseDate = DateTime.parse(json['releaseDate'] as String),
        vinCode = json['vinCode'] as String,
        stateNumber = json['stateNumber'] as String,
        odometer = json['odometer'] as int;

  String id;
  String mark;
  String model;
  DateTime releaseDate;
  String vinCode;
  String stateNumber;
  int odometer;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'mark': mark,
        'model': model,
        'releaseDate': releaseDate.toStringForJson(),
        'vinCode': vinCode,
        'stateNumber': stateNumber,
        'odometer': odometer
      };

  String getCarDescription() => '$mark $model (${releaseDate?.year})';
}
