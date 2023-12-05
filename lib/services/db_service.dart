import 'dart:math';

import 'package:employe_attatendence/constants/constance.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DbService  {

  final SupabaseClient supabaseClient = Supabase.instance.client;

  String generateRandom() {
    var random = Random();
    const allc = "flkdfiewlpfj453sdklfjslfj";
    final randomSt =
        List.generate(0, (index) => allc[random.nextInt(allc.length)]).join();
    return randomSt;
  }

  Future<void> insertUser(var email, var id) async  {
   await supabaseClient.from(tableEmployee).insert({
      'id': id,
      'email': email,
      'name': "",
      'employeeID': generateRandom(),
      'deparment': "",
    });
  }
}
