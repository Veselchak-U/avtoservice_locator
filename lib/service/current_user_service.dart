import 'dart:convert';

import 'package:avtoservicelocator/data/i_data_source.dart';
import 'package:avtoservicelocator/model/user.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_fimber/flutter_fimber.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CurrentUserService {
  CurrentUserService({@required IDataSource dataSource})
      : _dataSource = dataSource;

  final IDataSource _dataSource;
  bool isInitialized;
  User _currentUser;
  final FimberLog _log = FimberLog('AvtoService Locator');
  static const String _CURRENT_USER_PHONE = 'CURRENT_USER_PHONE';
  static const String _CURRENT_USER = 'CURRENT_USER';

  Future<bool> initialize() async {
    _log.d('CurrentUserService initialize() start');

    _currentUser = await _loadUserFromSPrefs();

    if (_currentUser?.phoneNumber != null) {
      var _savedUser = await _dataSource.getUserByPhone(
          phoneNumber: _currentUser.phoneNumber);
      if (_savedUser != null) {
        _currentUser = _savedUser;
        _saveUserToSPrefs(user: _currentUser);
      }
    }

/*    var phoneNumber = await _loadUserPhoneFromSPrefs();
    if (phoneNumber != null) {
      _currentUser = await _dataSource.getUserByPhone(phoneNumber: phoneNumber);
      if (_currentUser == null) {
        _currentUser = User(phoneNumber: phoneNumber);
        await _dataSource.updateUser(user: _currentUser);
      }
    }*/

    _log.d('CurrentUserService initialize() end');
    return true;
  }

  User getCurrentUser() {
    _log.d('CurrentUserService getCurrentUser()');

    if (_currentUser == null) {
      return null;
    } else {
      // return a copy of current user
      return User(
          id: _currentUser.id,
          phoneNumber: _currentUser.phoneNumber,
          name: _currentUser.name,
          eMail: _currentUser.eMail,
          avatar: _currentUser.avatar,
          country: _currentUser.country,
          region: _currentUser.region,
          city: _currentUser.city,
          location: _currentUser.location,
          cars: _currentUser.cars);
    }
  }

  Future<bool> setCurrentUser({@required User newUser}) async {
    assert(newUser.phoneNumber != null);
    _log.d('CurrentUserService setCurrentUser()');

    var oldCurrentUser = _currentUser;

    // first login OR change user
    if (_currentUser == null ||
        _currentUser.phoneNumber != newUser.phoneNumber) {
      _currentUser =
          await _dataSource.getUserByPhone(phoneNumber: newUser.phoneNumber);
      // new user not found in DataSource
      _currentUser ??= newUser;
    } else {
      // update current user details
      _currentUser = newUser;
    }

    // save new currentUser to DataSource
    var result = await _dataSource.updateUser(user: _currentUser);

    if (result) {
      // save new currentUser to SPrefs
      await _saveUserToSPrefs(user: _currentUser);
    } else {
      // rollback currentUser
      _currentUser = oldCurrentUser;
    }

    return result;
  }

  Future<bool> logoutCurrentUser() async {
    _currentUser = null;
    await _saveUserToSPrefs(user: _currentUser);
/*    await _saveUserPhoneToSPrefs(phoneNumber: null);*/
    return true;
  }

  Future<String> _loadUserPhoneFromSPrefs() async {
    _log.d('CurrentUserService _loadUserPhoneFromSPrefs() start');
    SharedPreferences prefs;
    String phoneNumber;
    try {
      prefs = await SharedPreferences.getInstance();
      phoneNumber = prefs.getString(_CURRENT_USER_PHONE);
    } on Exception catch (error, stackTrace) {
      _handleException(error, stackTrace);
    }
    _log.d('CurrentUserService _loadUserPhoneFromSPrefs() end');
    return phoneNumber;
  }

  Future<bool> _saveUserPhoneToSPrefs({@required String phoneNumber}) async {
    _log.d('CurrentUserService _saveUserPhoneToSPrefs() start');
    SharedPreferences prefs;
    try {
      prefs = await SharedPreferences.getInstance();
      prefs.setString(_CURRENT_USER_PHONE, phoneNumber);
    } on Exception catch (error, stackTrace) {
      _handleException(error, stackTrace);
    }
    _log.d('CurrentUserService _saveUserPhoneToSPrefs() end');
    return true;
  }

  void _handleException(Exception error, StackTrace stackTrace) {
    _log.d('Error in class CurrentUserService',
        ex: error, stacktrace: stackTrace);
  }

  Future<User> _loadUserFromSPrefs() async {
    _log.d('CurrentUserService _loadUserFromSPrefs() start');
    String jsonString;
    User result;
    try {
      var prefs = await SharedPreferences.getInstance();
      jsonString = prefs.getString(_CURRENT_USER);
    } on Exception catch (error, stackTrace) {
      _handleException(error, stackTrace);
    }
    _log.d('CurrentUserService jsonString = $jsonString');
    if (jsonString != null) {
      var json = jsonDecode(jsonString) as Map<String, dynamic>;
      result = User.fromJson(json);
    }

    _log.d('CurrentUserService _loadUserFromSPrefs() end');
    return result;
  }

  Future<bool> _saveUserToSPrefs({@required User user}) async {
    _log.d('CurrentUserService _saveUserToSPrefs() start');
    String jsonString = jsonEncode(user);
    _log.d('CurrentUserService jsonString = $jsonString');
    try {
      var prefs = await SharedPreferences.getInstance();
      prefs.setString(_CURRENT_USER, jsonString);
    } on Exception catch (error, stackTrace) {
      _handleException(error, stackTrace);
    }
    _log.d('CurrentUserService _saveUserToSPrefs() end');
    return true;
  }
}
