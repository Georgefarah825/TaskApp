// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'theme_bloc_bloc.dart';

abstract class ThemeBlocEvent extends Equatable {
  List<Object?> get props => [];
}

//LightModeEvent
class LightMode extends ThemeBlocEvent {}

//DarkModeEvent
class DarkMode extends ThemeBlocEvent {}
