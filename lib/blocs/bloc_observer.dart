import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

class SimpleBlocObserver extends BlocObserver {
  Logger logger = Logger(
    printer: PrettyPrinter(
      lineLength: 80,
    ),
  );

  @override
  void onEvent(Bloc bloc, Object event) {
    logger.i('$bloc\n$event');
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, transition) {
    logger.i(transition);
    super.onTransition(bloc, transition);
  }
}
