import 'package:flutter/material.dart';

class IconReusable extends StatelessWidget {
  final IconData icon;
  final double sizeIcon;
  final Color color;

  const IconReusable({
    super.key,
    required this.icon,
    required this.sizeIcon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: sizeIcon,
      color: color,
    );
  }
}
