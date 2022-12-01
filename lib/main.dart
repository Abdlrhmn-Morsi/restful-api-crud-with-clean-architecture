import 'package:api_with_solid/inject.dart';
import 'package:api_with_solid/presentation/logic/api_cubit/api_cubit.dart';
import 'package:api_with_solid/presentation/logic/crud_cubit/crud_cubit.dart';
import 'package:api_with_solid/presentation/screens/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initGetIt();
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ApiCubit>(
          create: (context) => sl<ApiCubit>()..readData(),
        ),
        BlocProvider<CrudCubit>(
          create: (context) => sl<CrudCubit>(),
        )
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'api with solid',
        home: HomeView(),
      ),
    );
  }
}
