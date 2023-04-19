import 'package:flutter/material.dart';
import 'package:rocio_app/components/navigation_bar/navigation_items.dart';

class RocioNavigationBar extends StatelessWidget {
  final int selectedIndex;

  const RocioNavigationBar({
    Key? key,
    required this.selectedIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: (int index) {
        Navigator.of(context).pushNamed(navigationItems[index].route);
      },
      items: navigationItems
          .map(
            (item) => BottomNavigationBarItem(
          icon: selectedIndex == navigationItems.indexOf(item)
              ? CircleAvatar(
            backgroundColor: const Color(0xFF0AABE4),
            child: Icon(
              item.iconData,
              color: Colors.white,
            ),
          )
              : Icon(item.iconData, color: Colors.black,),
          label: item.label,
        ),
      )
          .toList(),
    );
  }
}
