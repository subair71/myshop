// ignore_for_file: non_constant_identifier_names

import 'package:hive_flutter/hive_flutter.dart';
import 'package:myshop/canteen/domain/model/canteen.dart';



Future<Iterable<CanteenElement>> getAllCanteens() async {
  final canteen_db = await Hive.openBox<CanteenElement>('product');
  return canteen_db.values;
}

