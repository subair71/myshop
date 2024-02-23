// ignore_for_file: non_constant_identifier_names, unnecessary_cast, override_on_non_overriding_member

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import '../../../cores/resources/api_endpoints.dart';
import '../../../hive/db_functions.dart';
import '../../../shared/main_failure.dart';

@LazySingleton(as: CanteenService)
class CanteenRepository implements CanteenService {
  @override
  Future<Either<MainFailure, List<CanteenElement>>>
      fetchCanteensFromLocal() async {
    // ignore: todo
    // TODO: implement fetchEventsFromLocal

    try {
      final eventListIterable = await getAllCanteens();
      final CanteenList = eventListIterable.map((e) => e).toList();
      return Right(CanteenList);
    } catch (e) {
      return const Left(MainFailure.clientFailure());
    }
  }

  @override
  Future<Either<MainFailure, List<CanteenElement>>>
      fetchCanteensFromServer() async {
    // ignore: todo
    // TODO: implement getQuestionaires

    try {
      final Response response =
          await Dio(BaseOptions()).post(ApiEndPoints.canteen);
      final Canteen_db = await Hive.openBox<CanteenElement>('canteen1');
      await Canteen_db.clear();
      final data = await json.decode(response.data);
      final CanteenList = (data['CANTEEN'] as List).map((e) {
        Canteen_db.add(CanteenElement.fromJson(e as Map<String, dynamic>));
        return CanteenElement.fromJson(e as Map<String, dynamic>);
      }).toList();
      await getAllCanteens();
      return Right(CanteenList);
    } catch (e) {
      if (kDebugMode) {
        print('Exception : $e');
      }
      return const Left(MainFailure.clientFailure());
    }
  }

  @override
  Future<Either<MainFailure, Map<String, dynamic>>> getEventExpansion(
      int index) {
    // ignore: todo
    // TODO: implement getEventExpansion
    throw UnimplementedError();
  }
}
