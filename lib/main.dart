import 'package:biemart/config/router/route.dart';
import 'package:biemart/config/theme/theme.dart';
import 'package:biemart/features/auth/presentation/provider/auth/bloc/auth_bloc.dart';
import 'package:biemart/features/home/presentation/pages/home.dart';
import 'package:biemart/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
      url: 'https://pynuktpbbgosmqxeqyyy.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InB5bnVrdHBiYmdvc21xeGVxeXl5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTU2ODM3MzUsImV4cCI6MjAzMTI1OTczNX0.RhvnhDGSYrgW9X5SgdVf2OaFtsfnLRjNCnGklSno4Nw');
  runApp(BlocProvider(
    create: (context) => AuthBloc(sl())..add(AuthInitialCheckRequested()),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: theme(),
        home: BlocConsumer<AuthBloc, AuthStates>(
          listener: (context, state) {
            if (state is AuthUserUnauthenticated) {
              Navigator.of(context).pushReplacementNamed('/login');
            }
            if (state is AuthUserAuthenticated) {
              Navigator.of(context).pushReplacementNamed('/home');
            }
          },
          builder: (context, state) {
            return Scaffold();
          },
        ),
        onGenerateRoute: AppRoute.onGenerateRoute,
      ),
    );
  }
}
