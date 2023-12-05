import 'package:employe_attatendence/route/routes.dart';
import 'package:employe_attatendence/services/db_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../model/auth_model.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AuthResponse>((ref) {
  return AuthNotifier();
});

class AuthNotifier extends StateNotifier<AuthResponse> {
  AuthNotifier() : super(AuthResponse());
  final SupabaseClient _supabaseClient = Supabase.instance.client;
  final DbService dbService = DbService();

  Future registerEmploye(var email, var pass, BuildContext context) async {
    try {
      AuthResponse response = await _supabaseClient.auth.signUp(
        email: email,
        password: pass,
      );

      if (response.user!.email!.isNotEmpty) {
        await dbService.insertUser(email, response.user!.id);
        Get.toNamed(Routes.mainPage);
      } else {
        Fluttertoast.showToast(
          msg: "not singup",
        );
      }
    } catch (e) {}
  }

  Future loginEmploye(var email, var pass, BuildContext context) async {
    try {
      AuthResponse response = await _supabaseClient.auth
          .signInWithPassword(password: pass, email: email);
      if (response.user!.email!.isNotEmpty) {
        Get.toNamed(Routes.mainPage);
      }
    } catch (e) {}
  }

  Future singOut() async {
    await _supabaseClient.auth.signOut();
  }

  User? get currentUser => _supabaseClient.auth.currentUser;
}

class AuthService extends ChangeNotifier {}
