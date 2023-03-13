import 'package:atreeon_menu_flutter/menuItem.dart';
import 'package:atreeon_menu_flutter/menuSand.dart';
import 'package:flutter/material.dart';
import 'package:atreeon_svg_tools/ConvertSvg.dart';
import 'package:atreeon_svg_tools/StandardiseSinglePath.dart';

class HomePage extends StatelessWidget {
  final String title;

  const HomePage({super.key, required this.title});

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: MenuSand(
        "SVG Tools",
        [
          MenuItemAdi("Standardise Single Path", () => StandardiseSinglePath()),
          MenuItemAdi("ConvertSvg - not functional", () => ConvertSvg()),
        ],
      ),
    );
  }
}
