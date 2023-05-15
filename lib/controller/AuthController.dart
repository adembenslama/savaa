// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sav/view/AuthScreen/Login.dart';
import 'package:sav/view/LoadingScreen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../model/User.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.put(AuthController());
  late Rx<User?> _user;
  Rx<UserClass>? CurrentUserData;
  final Rx<AuthState?> _authState = Rx<AuthState?>(null);
  final RxBool _isLogedIn = false.obs;
  final RxBool _isLoaded = false.obs;
  bool get isLogedIn => _isLogedIn.value;
  bool get isLoaded => _isLoaded.value;
  get user => _user.value;

  final SupabaseClient supabaseClient = Supabase.instance.client;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _user = Rx<User?>(supabaseClient.auth.currentUser);
  }

  @override
  void onReady() {
    _user = Rx<User?>(supabaseClient.auth.currentUser);
    _authState.bindStream(supabaseClient.auth.onAuthStateChange);
    _initialScreen(_authState.value);
    ever(_authState, _initialScreen);

    super.onReady();
  }

  _initialScreen(AuthState? authState) async {
    if (authState?.session != null) {
      Get.offAll(() => const LoadingSreen());
      await initialiseUserData();
    } else {
      Get.offAll(() => loginScreen());
    }
  }

  Future initialiseUserData() async {
    _isLoaded(false);
    bool hasUID = false;
    await Supabase.instance.client
        .from('users')
        .select()
        .eq('email', _user.value!.email)
        .then((value) {
      value.forEach((element) {
        element['uid'] == null ? hasUID = false : hasUID = true;
      });
    });
    if (!hasUID) {
      print('First login Dont have UID  waaaaaaaaaaaaa');
      await Supabase.instance.client
          .from('users')
          .update({'uid': _user.value!.id}).eq('email', _user.value!.email);
    }
    await Supabase.instance.client
        .from('users')
        .select()
        .eq("uid", _user.value!.id)
        .then((value) {
      value.forEach((element) {
        CurrentUserData = Rx<UserClass>(UserClass.fromJson(element));
      });
    });
    if (CurrentUserData!.value.status == "banned") {
      logoutSupa();
      Get.snackbar("Erreur", "Compte Suspendu", backgroundColor: Colors.red);
    }
    await Future.delayed(const Duration(seconds: 2));
    _isLoaded(true);
  }

  void loginSupa(String email, String password) async {
    if (await isMailValid(email)) {
      try {
        await supabaseClient.auth
            .signInWithPassword(email: email, password: password);
        await initialiseUserData();
      } catch (e) {
        Get.snackbar('error', e.toString());
      }
    } else {
      Get.snackbar("Erreur", "Email non valide", backgroundColor: Colors.red);
    }
  }

  Future<bool> isMailValid(String email) async {
    bool found = false;
    print("seriching for $email");
    await Supabase.instance.client
        .from('users')
        .select()
        .eq("email", email)
        .then((value) {
      if (value.isEmpty) {
        found = false;
      } else {
        print("found ittttttttttttttttttttttttttttttttt");
        print("found ittttttttttttttttttttttttttttttttt");
        found = true;
      }
    });

    return found;
  }

  void resetPassword(String mail) async {
    try {
      await supabaseClient.auth.signUp(email: mail, password: "123456");
    } catch (e) {
      Get.snackbar('error', e.toString());
    }
    await supabaseClient.auth.resetPasswordForEmail(mail);
  }

  void logoutSupa() async {
    _isLoaded(false);

    await supabaseClient.auth.signOut();
  }
}
