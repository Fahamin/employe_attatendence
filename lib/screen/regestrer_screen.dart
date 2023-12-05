import 'package:employe_attatendence/services/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../route/routes.dart';
import '../services/db_service.dart';

class RegistrationScreen extends ConsumerWidget {
  RegistrationScreen({super.key});

  var emailControler = TextEditingController();
  var passwordControler = TextEditingController();
  final SupabaseClient _supabaseClient = Supabase.instance.client;
  final DbService dbService = DbService();

  @override
  Widget build(BuildContext context, ref) {
    var screenWitdth = MediaQuery.of(context).size.width;
    var screenHight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Registration"),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        children: [
          Container(
            width: screenWitdth,
            height: screenHight / 4,
            decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(70))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.qr_code,
                  color: Colors.white,
                  size: 80,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "FANG",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Expanded(
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      label: Text("Email ID"),
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(),
                    ),
                    controller: emailControler,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      label: Text("Password at least 6 digit"),
                      prefixIcon: Icon(Icons.password),
                      border: OutlineInputBorder(),
                    ),
                    controller: passwordControler,
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (emailControler.text.isNotEmpty &&
                            passwordControler.text.isNotEmpty) {
                         /* ref.read(authProvider.notifier).registerEmploye(
                              emailControler.text.trim(),
                              passwordControler.text.trim(),
                              context);*/

                          AuthResponse response = await _supabaseClient.auth.signUp(
                            email: emailControler.text,
                            password: passwordControler.text,
                          );

                          if (response.user!.email!.isNotEmpty) {
                            await dbService.insertUser(emailControler.text, response.user!.id);
                            Get.toNamed(Routes.mainPage);
                          } else {
                            Fluttertoast.showToast(
                              msg: "not singup",
                            );
                          }
                        } else {
                          Fluttertoast.showToast(
                            msg: "not singup",
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                      ),
                      child: Text(
                        "Sing UP",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
