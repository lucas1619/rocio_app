import 'package:flutter/material.dart';

class PrimarySelect extends StatefulWidget {
  final String label;
  final String value;
  final List<String> items;
  final ValueChanged<String?> onChanged;

  const PrimarySelect({
    Key? key,
    required this.label,
    required this.value,
    required this.items,
    required this.onChanged,
  }) : super(key: key);

  @override
  PrimarySelectState createState() => PrimarySelectState();
}

class PrimarySelectState extends State<PrimarySelect> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black),
          ),
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: DropdownButton<String>(
            underline: Container(),
            isExpanded: true,
            value: widget.value,
            onChanged: widget.onChanged,
            items: widget.items.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
        Positioned(
          left: 18,
          top: -10,
          child: Text(
            widget.label,
            style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w800,
                backgroundColor: Color(0xFFFAFAFA)),
          ),
        ),
      ],
    );
  }
}
