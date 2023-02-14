import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final int splashTimeout = 5;
  SplashBloc() : super(SplashInitial()) {
    on<SplashStartLoadingEvent>(onSplashStarted);
  }

  onSplashStarted(
      SplashStartLoadingEvent event, Emitter<SplashState> emit) async {
    await Future.delayed(Duration(seconds: splashTimeout), () {
      emit(
        SplashFinished(),
      );
    });
  }
}
