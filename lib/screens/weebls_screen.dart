import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:web_test/graphql/graphql.dart';
import 'package:web_test/models/pagination_model.dart';
import 'package:web_test/models/weebl_model.dart';
import 'package:web_test/widgets/pagination_widget.dart';
import 'package:web_test/widgets/table_item.dart';

class WeeblsScreen extends StatefulWidget {
  const WeeblsScreen({Key? key}) : super(key: key);

  @override
  State<WeeblsScreen> createState() => _WeeblsScreenState();
}

class _WeeblsScreenState extends State<WeeblsScreen> {
  bool selectAll = false;
  int selectedIndex = 0;
  List<WeeblModel> weeblList = [];
  List<PaginationModel> paginationList = [];

  @override
  void initState() {
    _addWeebl();

    for (var i = 0; i < 5; i++) {
      paginationList.add(PaginationModel(index: i, count: (i + 1).toString()));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Future.delayed(Duration(seconds: 2),(){
    //   setState(() {});
    //
    // });
    return weeblList.isEmpty
        ? Center(
            child: CircularProgressIndicator(
              color: Colors.red,
            ),
          )
        : SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width / 36,
                  right: MediaQuery.of(context).size.width / 36,
                  top: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Weebls',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 32),
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(.2),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                        ),
                        width: MediaQuery.of(context).size.width,
                        child: Table(
                          defaultVerticalAlignment:
                              TableCellVerticalAlignment.middle,
                          children: [
                            TableRow(children: [
                              Row(
                                children: [
                                  Checkbox(
                                      value: selectAll,
                                      onChanged: (value) {
                                        selectAll = value!;
                                        if (selectAll) {
                                          weeblList.forEach((element) {
                                            element.isSelected = true;
                                          });
                                        } else {
                                          weeblList.forEach((element) {
                                            element.isSelected = false;
                                          });
                                        }
                                        setState(() {});
                                      }),
                                  Text('Id',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 6),
                                    width: 2,
                                    height: 20,
                                    color: Colors.grey.withOpacity(.3),
                                  ),
                                  Text('Full Name',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 6),
                                    width: 2,
                                    height: 20,
                                    color: Colors.grey.withOpacity(.3),
                                  ),
                                  Text('Username',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 6),
                                    width: 2,
                                    height: 20,
                                    color: Colors.grey.withOpacity(.3),
                                  ),
                                  Text('Country code',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 6),
                                    width: 2,
                                    height: 20,
                                    color: Colors.grey.withOpacity(.3),
                                  ),
                                  Text('Phone Number',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 6),
                                    width: 2,
                                    height: 20,
                                    color: Colors.grey.withOpacity(.3),
                                  ),
                                  Text('is_blockable',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ]),
                          ],
                        ),
                      )
                    ],
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: weeblList.length,
                      itemBuilder: (context, index) {
                        return TableItem(weeblModel: weeblList[index]);
                      }),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                          onTap: () async {
                            selectedIndex != 0 &&
                                    selectedIndex <= paginationList.length
                                ? selectedIndex = selectedIndex - 1
                                : selectedIndex = 0;
                            await _addWeebl();
                            setState(() {});
                          },
                          child: Text('Previous')),
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        height: 60,
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: paginationList.length,
                            itemBuilder: (context, index) {
                              return PaginationWidget(
                                  paginationModel: paginationList[index],
                                  selectedIndex: selectedIndex,
                                  onTapNumber: (value) async {
                                    selectedIndex = value;
                                    await _addWeebl();
                                    setState(() {});
                                  });
                            }),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      GestureDetector(
                          onTap: () async {
                            selectedIndex >= 0 &&
                                    selectedIndex <= paginationList.length
                                ? selectedIndex = selectedIndex + 1
                                : selectedIndex = 0;
                            await _addWeebl();
                            setState(() {});
                          },
                          child: Text('Next')),
                    ],
                  )
                ],
              ),
            ),
          );
  }

  _addWeebl() async {
    // for (var i = 0; i < 16; i++) {
    //   if (i.isEven) {
    //     weeblList.add(WeeblModel(
    //         id: '1cln-csss-nckj',
    //         ansOne: 'Hi',
    //         ansTwo: 'Hello',
    //         owner: 'User A',
    //         question: 'Hi There',
    //         isPublic: true));
    //   } else {
    //     weeblList.add(WeeblModel(
    //         id: 'tesols-sdsf-kssl',
    //         ansOne: 'Yes',
    //         ansTwo: 'No',
    //         owner: 'User B',
    //         question: 'Is it ok?',
    //         isPublic: false));
    //   }
    // }
    print('SELECTED INDEX--->$selectedIndex');
    weeblList.clear();

    String queryDoc = '''
query {
  getAllUsers(user_id: "test", skip: "${selectedIndex * 20}", limit: "15") {
    message
    data {
      count
      user {
        id
        phone_number
        full_name
        username
        profile_message
        email
        account_status
        is_blockable
        country_code
        user_roles
        social_profiles
      }
    }
  }
}
    ''';
    QueryResult result = await GraphQl().query(queryDoc);
    log('DATA--->${result.data?['getAllUsers']['data']['user'].length.toString()}');

    result.data?['getAllUsers']['data']['user'].forEach((element) {
      weeblList.add(WeeblModel(
          isSelected: false,
          id: element['id'],
          ansOne: element['username'],
          ansTwo: element['country_code'],
          owner: element['phone_number'],
          question: element['full_name'],
          isPublic: element['is_blockable']));
    });
    setState(() {});
  }
}
