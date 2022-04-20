import 'package:flutter/material.dart';
import 'package:web_test/models/weebl_model.dart';

class TableItem extends StatefulWidget {
  WeeblModel weeblModel;

  TableItem({required this.weeblModel});

  @override
  State<TableItem> createState() => _TableItemState();
}

class _TableItemState extends State<TableItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 3, top: 2),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
        child: Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: [
            TableRow(children: [
              Row(
                children: [
                  Checkbox(
                      value: widget.weeblModel.isSelected,
                      onChanged: (value) {
                        widget.weeblModel.isSelected = value!;
                        setState(() {});
                      }),
                  SizedBox(
                    width: 15,
                  ),
                  Flexible(
                    child: Text(
                      widget.weeblModel.id.toString(),
                      style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                      ),
                      maxLines: 1,
                    ),
                  ),
                ],
              ), SizedBox(
                height: 10,
              ),
              Text(
                widget.weeblModel.question.toString(),
              ),
              Text(
                widget.weeblModel.ansOne.toString(),
              ),
              Text(
                widget.weeblModel.ansTwo.toString(),
              ),
              Text(
                widget.weeblModel.owner.toString(),
              ),
              Text(
                widget.weeblModel.isPublic.toString(),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
