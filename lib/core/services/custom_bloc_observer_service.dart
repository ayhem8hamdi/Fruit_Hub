import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';

class BlocObserverService extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);

    if (kDebugMode) {
      log('[BLOC] ${bloc.runtimeType} changed: $change');
      log('  Current State: ${change.currentState}');
    }
  }
}
