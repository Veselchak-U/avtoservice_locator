
import 'package:avtoservicelocator/data/dummy_data_generator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  var _carReferenceList = DummyDataGenerator.getCarReferenceList();

  List<String> getCarElements({String carMark}) {
    List<String> result = [];
    if (carMark == null) {
      result = _carReferenceList.keys.toList();
    } else {
      result = _carReferenceList[carMark];
    }
    return result;
  }

  test('Repository.getCarElements()', () {
    print(getCarElements());
    print(getCarElements(carMark: ''));
    print(getCarElements(carMark: 'Audi'));
//    expect(userInitials, "HD");
    });


}