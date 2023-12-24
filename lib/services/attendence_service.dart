
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AttendenceSrvice extends ChangeNotifier{
  final SupabaseClient _supabaseClient = Supabase.instance.client;
  String todayDate = DateFormat("dd MMMM YYYY").format(DateTime.now());

}