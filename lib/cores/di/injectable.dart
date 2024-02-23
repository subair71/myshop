// ignore_for_file: await_only_futures

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import '../di/injectable.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
    // initializerName: r'$initGetIt', // default
    // preferRelativeImports: true, // default
    // asExtension: false, // default
    )
Future<void> configureDependencies() async {
  await $initGetIt(getIt, environment: Environment.prod);
}
