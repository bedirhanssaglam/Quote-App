import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:bloc_pattern/core/init/provider/page_controller.dart';
import 'package:bloc_pattern/view/quotes/repository/quote_repository.dart';
import 'core/init/navigation/app_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CurrentPage(),
      child: RepositoryProvider(
        create: (context) => QuotesRepository(),
        child: Sizer(
          builder: (context, orientation, deviceType) => MaterialApp.router(
            routeInformationParser: _appRouter.defaultRouteParser(),
            routerDelegate: _appRouter.delegate(),
            debugShowCheckedModeBanner: false,
            title: 'Quotes',
          ),
        ),
      ),
    );
  }
}
