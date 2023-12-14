import 'package:assignment/Authentication/bloc/auth_bloc.dart';
import 'package:assignment/Authentication/presentation/Screens/Home.dart';
import 'package:assignment/Authentication/presentation/Screens/SignUp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is Authenticated) {
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context){return  HomeScreen();}), (route) => false);
        }
        if (state is AuthFailure) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
        }
        },
        builder: (context,state){
          if (state is AuthLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          else{
            return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 8.0),
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              const SizedBox(height: 24.0),
              ElevatedButton(
                child: const Text('Login'),
                onPressed: () {
                  BlocProvider.of<AuthBloc>(context).add(LoginEvent(_emailController.text,_passwordController.text));
                },
              ),
              TextButton(
                child: const Text('Don\'t have an account? Sign Up'),
                onPressed: () {
                  Navigator.pushReplacement(context,MaterialPageRoute(builder: (context){
                    return SignUp();
                  }));
                },
              ),
            ],
          ),
        );
          }
        },
      ),
    );
  }
}
