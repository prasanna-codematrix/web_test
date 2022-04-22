import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

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
    return ResponsiveBuilder(
      builder: (context, builder) {
        return Container(
          margin: EdgeInsets.only(
              left: margin ? MediaQuery.of(context).size.width / 52 : 0),
          padding: EdgeInsets.all((builder.screenSize.width / 100) * 1),
          color: Colors.white,
          width: MediaQuery.of(context).size.width / 9,
          height: (builder.screenSize.width / 100) * 10,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  users,
                  style: TextStyle(
                      fontSize: (builder.screenSize.width / 100) * 2,
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Text(
                      time,
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: (builder.screenSize.width / 100) * .9),
                    ),
                    Spacer(),
                    CircleAvatar(
                      radius: 10,
                      backgroundColor: Colors.grey.withOpacity(.2),
                      child: Icon(
                        Icons.arrow_downward_sharp,
                        color: Colors.pinkAccent,
                        size: (builder.screenSize.width / 100) * .8,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      bottomText,
                      style: TextStyle(
                          fontSize: (builder.screenSize.width / 100) * .9,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ]),
        );
      },
    );
  }
}
