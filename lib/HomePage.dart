import 'package:atreeon_menu_flutter/menuItem.dart';
import 'package:atreeon_menu_flutter/menuSand.dart';
import 'package:flutter/material.dart';
import 'package:svg_to_single_line/ConvertSvg.dart';
import 'package:svg_to_single_line/StandardiseSinglePath.dart';

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
