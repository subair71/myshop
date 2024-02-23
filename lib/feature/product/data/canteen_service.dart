import 'package:dartz/dartz.dart';

import '../../../shared/main_failure.dart';
import '../domain/model/canteen.dart';

abstract class CanteenService {
  Future<Either<MainFailure, List<CanteenElement>>> fetchCanteensFromServer();
  Future<Either<MainFailure, List<CanteenElement>>> fetchCanteensFromLocal();
}
