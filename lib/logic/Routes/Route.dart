import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temp_mail/logic/cubits/account_cubit/account_cubit.dart';
import 'package:temp_mail/logic/cubits/domain_cubit/domain_cubit.dart';
import 'package:temp_mail/logic/cubits/inbox_cubit/inbox_cubit.dart';
import 'package:temp_mail/presentation/account_screen/create_account_page.dart';
import 'package:temp_mail/presentation/account_screen/login_page.dart';
import 'package:temp_mail/presentation/domain_screen/home_page.dart';
import 'package:temp_mail/presentation/inbox_screen/inbox_page.dart';

class Routes{
  static Route? onGenerateRoute(RouteSettings settings){
    switch (settings.name) {
      case "/home": return MaterialPageRoute(
        builder: (context) => BlocProvider(
          create: (context) => DomainCubit(),
          child: const MyHomePage(),
        ));
        break;

      case "/create_account": 
      //Map<String, dynamic> arguments = settings.arguments as Map<String, dynamic>;
      return MaterialPageRoute(
        builder: (context)=> BlocProvider(
          create: (context)=> AccountsCubit(),
          child:  
          //CreateAccountPage(domain: arguments['domain'],),
          CreateAccountPage(domain: "abc@gmail.com",),
          ));
          break;

      case "/login": 
      return MaterialPageRoute(
        builder: (context)=> BlocProvider(
          create: (context)=> AccountsCubit(),
          child: const LoginPage()
          ));
          break;

      case "/inbox": 
      //Map<String, dynamic> arguments = settings.arguments as Map<String, dynamic>;
      return MaterialPageRoute(
        builder: (context)=> BlocProvider(
          create: (context)=> InboxCubit(),
          child: 
           InboxPage(address: "abc@gmail.com", token: "sdkjfsg"),

          //InboxPage(address: arguments['address'], token: arguments['token']),
          ));
          break;
      default: null;
    }
  }
}