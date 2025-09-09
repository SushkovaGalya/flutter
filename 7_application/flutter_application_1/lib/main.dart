import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/weatherCubit.dart';
import 'cubit/historyCubit.dart';
import 'screens/homeScreen.dart';

 void main() {
   runApp(MyApp());
 }

 class MyApp extends StatelessWidget {
   @override
   Widget build(BuildContext context) {
     return MultiBlocProvider(
       providers: [
         BlocProvider(create: (_) => WeatherCubit()),
         BlocProvider(create: (_) => HistoryCubit()..loadAll()),
       ],
       child: MaterialApp(
         debugShowCheckedModeBanner: false,
         title: 'Weather App',
         theme: ThemeData(primarySwatch: Colors.blue),
         home: HomeScreen(),
       ),
     );
   }
 }