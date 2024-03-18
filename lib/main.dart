import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:taskapp/servcies/AppRouter.dart';
import 'package:taskapp/servcies/app_theme.dart';
import '../screens/tabs_screen.dart';
import 'package:taskapp/blocs/bloc/bloc_exports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());
  HydratedBlocOverrides.runZoned(
      () => runApp(MyApp(
            appRouter: AppRouter(),
          )),
      storage: storage);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.appRouter}) : super(key: key);

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: ((context) => TaskBloc())),
        BlocProvider(create: ((context) => ThemeBlocBloc())),
      ],
      child: BlocBuilder<ThemeBlocBloc, ThemeBlocState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'My Tasks App',
            theme: state.isDarkMode
                ? AppThemes.appThemeData[AppTheme.darkTheme]
                : AppThemes.appThemeData[AppTheme.lightTheme],
            home: TabsScreen(),
            onGenerateRoute: appRouter.onGeneraRoute,
          );
        },
      ),
    );
  }
}
