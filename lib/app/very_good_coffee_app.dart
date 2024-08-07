import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:very_good_coffee/app/app.dart';

class VeryGoodCoffeeApp extends StatelessWidget {
  const VeryGoodCoffeeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => injection<HomeCubit>()),
      ],
      child: MaterialApp(
        title: 'Very Good Coffee',
        debugShowCheckedModeBanner: false,
        theme: ThemeConfig.theme,
        initialRoute: AppRoutes.home,
        routes: AppRoutes.routes,
      ),
    );
  }
}
