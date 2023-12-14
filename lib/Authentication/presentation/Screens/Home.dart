import 'package:assignment/Authentication/bloc/auth_bloc.dart';
import 'package:assignment/Authentication/presentation/Screens/Login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  List<String> str=['APPLE','GOOGLE','MICROSOFT','AZURE','CLOUD','AI','RESTAPI'];
  

  HomeScreen({super.key});@override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SizedBox(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: ListView.builder(
          itemCount: str.length,

          itemBuilder: ((context, index) => Column(
            children: [
              Container(color: Colors.orange,height: 100,width: double.infinity,child: Center(child: Text(str[index],),),),
              const Divider()
            ],
          ))),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label:const Icon(Icons.exit_to_app),
        onPressed: (){
        BlocProvider.of<AuthBloc>(context).add(LogoutEvent());
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context){
          return const LoginScreen();
        }), (route) => false);
      }),
    );
  }
}