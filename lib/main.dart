import 'package:assignment/Authentication/bloc/auth_bloc.dart';
import 'package:assignment/Authentication/data/data_provider/auth_caller.dart';
import 'package:assignment/Authentication/presentation/Screens/SignUp.dart';
import 'package:assignment/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => Authenticate(),
      child: BlocProvider(
        create: (context) => AuthBloc(context.read<Authenticate>()),
        child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home:SignUp()),
      ),
    );
  }
}
