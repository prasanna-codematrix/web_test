import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:web_test/widgets/dashboard_widget.dart';

class DashScreen extends StatelessWidget {
  const DashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width / 36,
          right: MediaQuery.of(context).size.width / 36,
          top: 40),
      child: ResponsiveBuilder(
        builder: (context, builder) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Dashboard',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: (builder.screenSize.width / 53) * 1.2),
              ),
              SizedBox(
                height: 35,
              ),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 12,
                  ),
                  Text(
                    'Active Users',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: (builder.screenSize.width / 75) * 1.2),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Text(
                        'Last Updated  ',
                        style: TextStyle(
                            fontSize:  (builder.screenSize.width / 100) * .9),
                      ),
                      Text(
                        '14/04/2021',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize:  (builder.screenSize.width / 100) * .9  ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        color: Colors.black,
                        width: (builder.screenSize.width / 100) * 5,
                        height: (builder.screenSize.height / 100) *3 ,
                        child: Center(
                            child: Text(
                          'Stats',
                              style: TextStyle(color: Colors.white, fontSize:  (builder.screenSize.width / 100) * .7),
                        )),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        color: Colors.black,
                        width:  (builder.screenSize.width / 100) * 5,
                        height: (builder.screenSize.height / 100) *3,
                        child: Center(
                          child: Text(
                            'Trends',
                            style: TextStyle(color: Colors.white, fontSize:  (builder.screenSize.width / 100) * .7),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DashboardWidget(
                      time: 'Today',
                      bottomText: '0',
                      users: 'O',
                      margin: false),
                  DashboardWidget(time: 'Month', bottomText: '0', users: 'O'),
                  DashboardWidget(time: 'Year', bottomText: '15', users: '8'),
                  DashboardWidget(
                      time: 'Year', bottomText: '100', users: '105'),
                ],
              ),
              SizedBox(
                height: 55,
              ),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 12,
                  ),
                  Text(
                    'Weebls',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: (builder.screenSize.width / 68) * 1.2),
                  ),
                ],
              ),
              SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DashboardWidget(
                      time: 'Today',
                      bottomText: '0',
                      users: 'O',
                      margin: false),
                  DashboardWidget(time: 'Month', bottomText: '0', users: 'O'),
                  DashboardWidget(time: 'Year', bottomText: '15', users: '8'),
                  DashboardWidget(
                      time: 'Year', bottomText: '100', users: '105'),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
