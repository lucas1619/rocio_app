import 'package:flutter/material.dart';

class CustomDropdownButton extends StatefulWidget {
  final String hint;
  final List<String> items;
  final Function(String) onChanged;

  const CustomDropdownButton({
    Key? key,
    required this.hint,
    required this.items,
    required this.onChanged,
  }) : super(key: key);

  @override
  _CustomDropdownButtonState createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  String? _selectedItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(4),
      ),
      height: 60,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: DropdownButton<String>(
        value: _selectedItem,
        hint: Text(widget.hint),
        isExpanded: true,
        underline: SizedBox(),
        items: widget.items.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            _selectedItem = value;
          });
          widget.onChanged(value!);
        },
      ),
    );
  }
}
