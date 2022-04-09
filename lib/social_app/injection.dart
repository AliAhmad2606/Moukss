import 'package:get_it/get_it.dart';

import 'cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(
    () => AppBloc(),
  );
}
