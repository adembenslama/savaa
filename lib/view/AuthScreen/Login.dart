// ignore_for_file: camel_case_types

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sav/constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../controller/AuthController.dart';

class loginScreen extends StatelessWidget {
  loginScreen({super.key});
  final SupabaseClient supabaseClient = AuthController.instance.supabaseClient;
  final TextEditingController mailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthController _authController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: mailController,
                textInputAction: TextInputAction.next,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (email) =>
                    email != null && !EmailValidator.validate(email)
                        ? 'enter valid email'
                        : null,
                decoration: const InputDecoration(
                  labelText: 'E-mail',
                  hintText: 'entrer votre e-mail',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.mail),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                obscureText: true,
                controller: passwordController,
                textInputAction: TextInputAction.done,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) =>
                    value != null && value.length < 8 ? 'too short' : null,
                decoration: const InputDecoration(
                  labelText: 'mot de passe',
                  hintText: 'entrer votre mot de passe',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    _authController.loginSupa(mailController.text.trim(),
                        passwordController.text.trim());
                  },
                  child: const Text("se connecter")),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
