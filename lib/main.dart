
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temp_mail/data/models/domain_model.dart';
import 'package:temp_mail/data/repositories/domain_repository.dart';
import 'package:temp_mail/logic/Routes/Route.dart';
import 'package:temp_mail/logic/cubits/domain_cubit/domain_cubit.dart';


void main() async {
 // DomainRepository domainRepository = DomainRepository();
  //List<DomainModel> response = await domainRepository.fetchDoamins();
  //print(response.toString());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DomainCubit(),
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: Routes.onGenerateRoute,
        initialRoute: '/inbox',
      ),
    );
  }
}
