import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:slide_to_act/slide_to_act.dart';

class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<SlideActionState> key = GlobalKey<SlideActionState>();
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(9),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: 33),
              child: Text(
                "Welcome",
                style: TextStyle(color: Colors.redAccent, fontSize: 32),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Employee Name",
                style: TextStyle(color: Colors.redAccent, fontSize: 25),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: 33),
              child: Text(
                "Todays Status",
                style: TextStyle(color: Colors.redAccent, fontSize: 20),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 33),
                height: 150,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54,
                        blurRadius: 10,
                        offset: Offset(2, 2),
                      ),
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Check In",
                          style: TextStyle(fontSize: 20, color: Colors.black54),
                        ),
                        SizedBox(
                          width: 80,
                          child: Divider(),
                        ),
                        Text(
                          "09:00",
                          style: TextStyle(fontSize: 25),
                        )
                      ],
                    )),
                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Check Out",
                          style: TextStyle(fontSize: 20, color: Colors.black54),
                        ),
                        SizedBox(
                          width: 80,
                          child: Divider(),
                        ),
                        Text(
                          "--/--",
                          style: TextStyle(fontSize: 25),
                        )
                      ],
                    ))
                  ],
                )),
            Container(
              margin: EdgeInsets.only(top: 33),
              alignment: Alignment.centerLeft,
              child: Text(
                "5th april 2023",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "20:00: PM",
                style: TextStyle(fontSize: 20, color: Colors.black54),
              ),
            ),
            Container(
              margin: EdgeInsets.all(25),
              child: Builder(
                builder: (context) {
                  return SlideAction(
                    text: "Slide to check out",
                    textStyle: TextStyle(
                      color: Colors.black54,
                      fontSize: 18,
                    ),
                    outerColor: Colors.white,
                    innerColor: Colors.redAccent,
                    key: key,
                    onSubmit: () {
                      key.currentState!.reset();
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
