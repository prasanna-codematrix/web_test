import 'package:flutter/material.dart';

class DashboardWidget extends StatelessWidget {
  late String users;
  late String time;
  late String bottomText;
  bool margin;

  DashboardWidget(
      {required this.time,
      required this.bottomText,
      required this.users,
      this.margin = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: margin ? MediaQuery.of(context).size.width / 52 : 0),
      padding: EdgeInsets.all(15),
      color: Colors.white,
      width: MediaQuery.of(context).size.width / 9,
      height: 130,
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
          users,
          style: TextStyle(
              fontSize: MediaQuery.of(context).size.width / 58,
              fontWeight: FontWeight.bold),
        ),
        Row(
          children: [
            Text(
              time,
              style: TextStyle(color: Colors.grey),
            ),
            Spacer(),
            CircleAvatar(
              radius: 10,
              backgroundColor: Colors.grey.withOpacity(.2),
              child: Icon(
                Icons.arrow_downward_sharp,
                color: Colors.pinkAccent,
                size: 12,
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              bottomText,
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width / 98,
                  fontWeight: FontWeight.bold),
            ),
          ],
        )
      ]),
    );
  }
}
