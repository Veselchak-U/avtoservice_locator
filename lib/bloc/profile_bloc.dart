import 'dart:convert';

import 'package:avtoservicelocator/bloc/common/base_bloc.dart';
import 'package:avtoservicelocator/data/repository.dart';
import 'package:avtoservicelocator/model/car.dart';
import 'package:avtoservicelocator/model/user.dart';
import 'package:avtoservicelocator/service/current_user_service.dart';
import 'package:avtoservicelocator/service/screen_builder_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fimber/flutter_fimber.dart';
import 'package:image_picker/image_picker.dart';
import 'package:page_transition/page_transition.dart';

class ProfileBloc extends BlocBase {
  ProfileBloc(
      {@required CurrentUserService currentUserService,
      @required ScreenBuilderService screenBuilderService,
      @required Repository repository})
      : _currentUserService = currentUserService,
        _screenBuilderService = screenBuilderService,
        _repository = repository,
        currentUser = currentUserService.getCurrentUser() {
    initReferenceList();
    _log.d('ProfileBloc create');
  }

  final CurrentUserService _currentUserService;
  final ScreenBuilderService _screenBuilderService;
  final Repository _repository;
  final User currentUser;
  List<String> listCountries;
  List<String> listRegions;
  List<String> listCarMarks;
  List<String> listCarModels;
  Map<String, String> mapCities;
  String _oldUserAvatar;
  BuildContext context;
  final int bottomNavigationBarIndex = 2;
  final FimberLog _log = FimberLog('AvtoService Locator');

  void initReferenceList() {
    listCountries = _repository.getAddressElements();
    if (currentUser.country != null) {
      listRegions =
          _repository.getAddressElements(country: currentUser.country);
    }
    if (currentUser.region != null) {
      mapCities = _repository.getCityAddress(
          country: currentUser.country, region: currentUser.region);
    }
    listCarMarks = _repository.getCarElements();
    listCarModels = [];
  }

  void updateAddressReferenceList() {
    listCountries = _repository.getAddressElements();
    listRegions =
        _repository.getAddressElements(country: currentUser.country ?? '');
    mapCities = _repository.getCityAddress(
        country: currentUser.country ?? '', region: currentUser.region ?? '');
  }

  void updateCarReferenceList({String carMark}) {
    listCarModels = _repository.getCarElements(carMark: carMark ?? '');
    _log.d('ProfileBloc.updateCarReferenceList($carMark): $listCarModels');
  }

  void onTapBottomNavigationBar(int index) {
    Widget Function() nextScreen;
    if (index == 0) {
      nextScreen = _screenBuilderService.getRequestScreenBuilder();
    } else if (index == 1) {
      nextScreen = _screenBuilderService.getSearchScreenBuilder();
    } else {
      return;
    }
    Navigator.pushReplacement(
        context,
        PageTransition<Widget>(
            type: PageTransitionType.fade, child: nextScreen()));
  }

  void logoutUser() {
    _repository.logoutCurrentUser();
    var nextScreen = _screenBuilderService.getLoginScreenBuilder();
    Navigator.pushAndRemoveUntil(
        context,
        PageTransition<Widget>(
            type: PageTransitionType.fade, child: nextScreen()),
        (route) => false);
  }

  void saveProfile() {
    var _stubCars = [
      Car(
          mark: 'Hyundai',
          model: 'Accent',
          releaseDate: DateTime.parse('2007-05-15 13:27:00'),
          vinCode: 'VINCODE',
          stateNumber: 'A123AA',
          odometer: 127000),
      Car(
          mark: 'Nissan',
          model: '350Z',
          releaseDate: DateTime.parse('2005-06-16 13:27:00'),
          vinCode: 'JN1VINCODE',
          stateNumber: 'C061CC',
          odometer: 130000),
      Car(
          mark: 'Hyundai',
          model: 'Accent',
          releaseDate: DateTime.parse('2007-05-15 13:27:00'),
          vinCode: 'VINCODE',
          stateNumber: 'A123AA',
          odometer: 127000),
      Car(
          mark: 'Nissan',
          model: '350Z',
          releaseDate: DateTime.parse('2005-06-16 13:27:00'),
          vinCode: 'JN1VINCODE',
          stateNumber: 'C061CC',
          odometer: 130000),
      Car(
          mark: 'Nissan',
          model: '350Z',
          releaseDate: DateTime.parse('2005-06-16 13:27:00'),
          vinCode: 'JN1VINCODE',
          stateNumber: 'C061CC',
          odometer: 130000)
    ];
//    currentUser.cars = _stubCars;
    _currentUserService.setCurrentUser(newUser: currentUser);
  }

  bool isValidEmail({String email}) {
    var result = true;
    var regExp = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
        /*r'\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,6}',*/
        caseSensitive: false,
        multiLine: false);

    result = regExp.hasMatch(email);

/*    if (email != null && email.isNotEmpty) {
      var indexMonkey = email.indexOf('@');
      if (indexMonkey == -1 ||
          indexMonkey == 0 ||
          indexMonkey == email.length - 1) {
        result = false;
      } else {
        var secondPart = email.substring(indexMonkey + 1);
        var indexDot = secondPart.indexOf('.');
        if (indexDot == -1 ||
            indexDot == 0 ||
            indexDot == secondPart.length - 1) {
          result = false;
        }
      }
    }*/
    return result;
  }

  void deleteCar({Car car}) {
    var index = currentUser.cars.indexOf(car);
    currentUser.cars.removeAt(index);
    saveProfile();
  }

  void addCar(
      {String mark,
      String model,
      DateTime releaseDate,
      String vinCode,
      String stateNumber,
      int odometer}) {
    var newCar = Car(
        mark: mark,
        model: model,
        releaseDate: releaseDate,
        vinCode: vinCode,
        stateNumber: stateNumber,
        odometer: odometer);
    currentUser.cars ??= [];
    currentUser.cars.add(newCar);
    saveProfile();
  }

  ImageProvider getUserAvatar() {
    ImageProvider result;
    if (currentUser.avatar == null || currentUser.avatar.isEmpty) {
      result = AssetImage('assets/images/user.png');
    } else {
      result = MemoryImage(base64Decode(currentUser.avatar));
    }
    return result;
  }

  Future<bool> getNewUserAvatar() async {
    bool result = false;

    final pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      var fileBytes = await pickedFile.readAsBytes();
      String base64Image = base64Encode(fileBytes);
      _oldUserAvatar = currentUser.avatar;
      currentUser.avatar = base64Image;
      result = true;
    }
    return result;
  }

  void rollbackUserProfileChanges() {
    if (_oldUserAvatar != null) {
      currentUser.avatar = _oldUserAvatar;
      _oldUserAvatar = null;
    }
  }

  @override
  void dispose() {
    _log.d('ProfileBloc dispose');
  }
}
