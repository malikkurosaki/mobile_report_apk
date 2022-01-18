import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

extension Textputih on Text {
  Text txtMenu() {
    return Text(
      data!,
      style:
          TextStyle(color: Colors.blue[200], fontSize: 16, fontWeight: FontWeight.bold),
    );
  }

  txtMenuBold() => Text(
        data!,
        style: TextStyle(
          color: Colors.grey[200],
          fontSize: 16,
        ),
      );
}
