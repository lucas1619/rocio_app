import 'package:flutter/material.dart';

class NavigationBarItem {
  final IconData iconData;
  final String label;
  final String route;

  NavigationBarItem({
    required this.iconData,
    required this.label,
    required this.route,
  });
}

final List<NavigationBarItem> navigationItems = [
  NavigationBarItem(iconData: Icons.home, label: 'Home', route: '/field'),
  NavigationBarItem(iconData: Icons.sensors, label: 'Sensor', route: '/sensor'),
  NavigationBarItem(
      iconData: Icons.shower, label: 'Aspersor', route: '/sprinkles'),
  NavigationBarItem(
      iconData: Icons.insights, label: 'Reporte', route: '/field'),
  NavigationBarItem(iconData: Icons.person, label: 'Perfil', route: '/field'),
];
