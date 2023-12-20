import 'dart:math';

import 'package:employe_attatendence/constants/constance.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../model/user_model.dart';

class DbService {
  final SupabaseClient supabaseClient = Supabase.instance.client;

  late UserModel? userModel;

  String generateRandom() {
    var random = Random();
    const allc = "flkdfiewlpfj453sdklfjslfj";
    final randomSt =
        List.generate(0, (index) => allc[random.nextInt(allc.length)]).join();
    return randomSt;
  }

  Future<void> insertUser(var email, var id) async {
    await supabaseClient.from(tableEmployee).insert({
      'id': id,
      'email': email,
      'name': "",
      'employeeID': generateRandom(),
      'deparment': "",
    });
  }

  Future<UserModel> getUserData() async {
    var userModel = await supabaseClient
        .from(tableEmployee)
        .select()
        .eq("id", supabaseClient.auth.currentUser!.id)
        .single();

    userModel = UserModel.fromJson(userModel);
    return userModel;
  }
}
