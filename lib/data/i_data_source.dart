import 'package:avtoservicelocator/model/address.dart';
import 'package:avtoservicelocator/model/autoservice.dart';
import 'package:avtoservicelocator/model/request.dart';
import 'package:avtoservicelocator/model/user.dart';
import 'package:flutter/foundation.dart';

abstract class IDataSource {
  bool isInitialized;

  Future<bool> initialize();

  Future<User> getUserByPhone({@required String phoneNumber});

  Future<bool> updateUser({@required User user});

  Future<bool> updateRequest({@required Request request});

  Future<bool> addRequest({@required Request request});

  Future<List<Request>> loadRequests({@required User user});

  Future<List<AutoService>> loadAutoServices({@required User user});

  Future<List<Address>> loadAddresses();

  Future<Map<String, List<String>>> loadCarReferenceList();
}

enum DataSourceEvent { ALL_REFRESH, REQUESTS_REFRESH, MESSAGES_REFRESH }
