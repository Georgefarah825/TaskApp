// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'theme_bloc_bloc.dart';

class ThemeBlocState extends Equatable {
  final bool isDarkMode;

  ThemeBlocState({required this.isDarkMode});

  @override
  List<Object?> get props => [isDarkMode];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'isDarkMode': isDarkMode,
    };
  }

  factory ThemeBlocState.fromMap(Map<String, dynamic> map) {
    return ThemeBlocState(
      isDarkMode: map['isDarkMode'] as bool,
    );
  }
}

class ThemeBlocInitial extends ThemeBlocState {
  ThemeBlocInitial({required bool isDarkMode}) : super(isDarkMode: isDarkMode);
}
