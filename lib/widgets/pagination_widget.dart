import 'package:flutter/material.dart';
import 'package:web_test/models/pagination_model.dart';

class PaginationWidget extends StatelessWidget {
  PaginationModel paginationModel;
  int selectedIndex;

  ValueChanged<int> onTapNumber;

  PaginationWidget(
      {required this.paginationModel,
      required this.selectedIndex,
      required this.onTapNumber});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapNumber(paginationModel.index);
      },
      child: CircleAvatar(
        radius: 15,
        backgroundColor:
            paginationModel.index == selectedIndex ? Colors.red : Colors.white,
        child: Text(
          paginationModel.count.toString(),
          style: TextStyle(
              color: paginationModel.index == selectedIndex
                  ? Colors.white
                  : Colors.black),
        ),
      ),
    );
    ;
  }
}
