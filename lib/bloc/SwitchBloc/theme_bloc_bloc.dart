import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import 'package:taskapp/blocs/bloc/bloc_exports.dart';
import '../bloc_exports.dart';

part 'theme_bloc_event.dart';
part 'theme_bloc_state.dart';

class ThemeBlocBloc extends HydratedBloc<ThemeBlocEvent, ThemeBlocState> {
  ThemeBlocBloc() : super(ThemeBlocInitial(isDarkMode: false)) {
    on<LightMode>((event, emit) {
      emit(ThemeBlocState(isDarkMode: true));
    });

    on<DarkMode>((event, emit) {
      emit(ThemeBlocState(isDarkMode: false));
    });
  }

  @override
  ThemeBlocState? fromJson(Map<String, dynamic> json) {
    return ThemeBlocState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(ThemeBlocState state) {
    return state.toMap();
  }
}
