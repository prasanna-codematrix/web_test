import 'package:flutter/material.dart';
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Dashboard',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
          ),
          SizedBox(
            height: 35,
          ),
          Row(
            children: [
              SizedBox(width: MediaQuery.of(context).size.width / 12,),
              Text(
                'Active Users',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              Spacer(),
              Row(
                children: [
                  Text('Last Updated  '),
                  Text(
                    '14/04/2021',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                    color: Colors.black,
                    width: 70,
                    height: 25,
                    child: Center(
                        child: Text(
                      'Stats',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    )),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                    color: Colors.black,
                    width: 70,
                    height: 25,
                    child: Center(
                      child: Text(
                        'Trends',
                        style: TextStyle(color: Colors.white, fontSize: 12),
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
                  time: 'Today', bottomText: '0', users: 'O', margin: false),
              DashboardWidget(time: 'Month', bottomText: '0', users: 'O'),
              DashboardWidget(time: 'Year', bottomText: '15', users: '8'),
              DashboardWidget(time: 'Year', bottomText: '100', users: '105'),
            ],
          ),
          SizedBox(
            height: 55,
          ),
          Row(
            children: [
              SizedBox(width: MediaQuery.of(context).size.width / 12,),
              Text(
                'Weebls',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
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
                  time: 'Today', bottomText: '0', users: 'O', margin: false),
              DashboardWidget(time: 'Month', bottomText: '0', users: 'O'),
              DashboardWidget(time: 'Year', bottomText: '15', users: '8'),
              DashboardWidget(time: 'Year', bottomText: '100', users: '105'),
            ],
          ),
        ],
      ),
    );
  }
}
