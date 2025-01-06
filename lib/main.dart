import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:itcores_internship_project/core/utils/app_strings.dart';
import 'package:itcores_internship_project/core/routes/routes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:itcores_internship_project/core/model/user_model.dart';
import 'package:itcores_internship_project/cubits/language_cubit/language_cubit.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:itcores_internship_project/features/log/data/datasource/item_datasource.dart';
import 'package:itcores_internship_project/features/log/data/model/item_model.dart';
import 'package:itcores_internship_project/features/log/data/repository/item_repository.dart';
import 'package:itcores_internship_project/features/log/presentation/cubit/item_cubit.dart';

final getIt = GetIt.instance;
Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());
  Hive.registerAdapter(ItemModelAdapter());
  final itemBox = await Hive.openBox<ItemModel>('items'); 
  itemBox.clear();
  getIt.registerLazySingleton(() => itemBox);
  Hive.openBox<UserModel>('user');
  getIt.registerLazySingleton<ItemRepository>(() => ItemDatasource(getIt()));
  getIt.registerFactory(() => ItemCubit(getIt<ItemRepository>())); 
  

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LanguageCubit(),
      child: const MainApp(),
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, LanguageState>(
      builder: (context, state) {
        return ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) {
            return MaterialApp.router(
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale('en'), // English
                Locale('ar'), // Spanish
              ],
              locale: state.locale,
              routerConfig: Routes.routes,
              title: AppStrings.appName,
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                fontFamily: 'Inter',
              ),
            );
          },
        );
      },
    );
  }
}
