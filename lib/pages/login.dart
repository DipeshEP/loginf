import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loginf/pages/home_page.dart';
import 'package:loginf/pages/repo/repo.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();

  GlobalKey<FormState>formKey=GlobalKey<FormState>();
  Repo repo=Repo();

  login()async{
    UserCredential userCredential=await repo.loginWithEmailPassword(emailController.text, passwordController.text);
    Response response= userCredential as Response;
    if(response.statusCode==200||response.statusCode==201){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyHomePage(userCredential: userCredential,)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("LOGIN"),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
              controller: emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (value){
                if(value!.isEmpty){
                  return "Enter Email";
                }else {
                  return null;
                }
                },
                decoration: InputDecoration(
                  label: Text("Email Address"),
                  border: OutlineInputBorder()
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                controller: passwordController,
                obscureText: true,
                validator: (value){
                  if(value!.isEmpty){
                    return "Enter Email";
                  }else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                    label: Text("Password"),
                    border: OutlineInputBorder()
                ),
              ),
            ),
             ElevatedButton(onPressed: (){
               if(formKey.currentState!.validate()){
                 formKey.currentState!.save();
                 login();
               }
             }, child: Text("Login"))
          ],
        ),
      ),
    );
  }
}
