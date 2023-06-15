// ignore_for_file: no_logic_in_create_state

import 'package:d/core/constant/color_constant.dart';
import 'package:d/view/home/create/eating/model/eating_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DropDownWidget extends StatefulWidget {
  const DropDownWidget(
      {super.key,
      required this.selectedValue,
      required this.width,
      required this.selectedTitle,
      required,
      required this.isItFirst,
      required this.items});
  final String selectedValue;
  final String selectedTitle;
  final double width;
  final List<DropdownMenuItem<String>> items;
  final bool isItFirst;
  @override
  State<DropDownWidget> createState() => _DropDownWidgetState(selectedValue);
}

class _DropDownWidgetState extends State<DropDownWidget> {
  _DropDownWidgetState(this.selectedValue);
  String selectedValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
      decoration: BoxDecoration(
        color: ColorConst.mainBoxBg,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
        borderRadius: BorderRadius.circular(30),
      ),
      width: widget.width / 1.15,
      child: DropdownButton(
        icon: const Icon(
          Icons.keyboard_arrow_down,
          color: Colors.black,
          size: 30,
        ),
        isExpanded: true,
        borderRadius: BorderRadius.circular(30),
        elevation: 2,
        alignment: Alignment.center,
        underline: Container(
          height: 0,
        ),
        onChanged: (newValue) {
          setState(() {
            selectedValue = newValue.toString();

            if (widget.isItFirst) {
              Provider.of<FoodsModel>(context, listen: false).selectedValue =
                  selectedValue;
              Provider.of<FoodsModel>(context, listen: false).menuItems1 =
                  widget.items;
            } else {
              Provider.of<FoodsModel>(context, listen: false).selectedValue2 =
                  selectedValue;
              Provider.of<FoodsModel>(context, listen: false).menuItems2 =
                  widget.items;
            }
          });
        },
        value: selectedValue,
        dropdownColor: ColorConst.mainBoxBg,
        items: widget.items,
      ),
    );
  }
}
