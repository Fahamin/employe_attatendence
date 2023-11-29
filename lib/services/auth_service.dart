import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../model/auth_model.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AuthModel>((ref) {
  return AuthNotifier();
});

class AuthNotifier extends StateNotifier<AuthModel> {
  AuthNotifier() : super(AuthModel());
  final SupabaseClient _supabaseClient = Supabase.instance.client;

  Future registerEmploye(var email, var pass, BuildContext context) async {
    try {
      AuthResponse response =
          await _supabaseClient.auth.signUp(password: pass, email: email);



    } catch (e) {}
  }

  Future loginEmploye(var email, var pass, BuildContext context) async {
    try {
      AuthResponse response = await _supabaseClient.auth
          .signInWithPassword(password: pass, email: email);
    } catch (e) {}
  }

  Future singOut() async {
    await _supabaseClient.auth.signOut();
  }

  User? get currentUser => _supabaseClient.auth.currentUser;
}

class AuthService extends ChangeNotifier {}
