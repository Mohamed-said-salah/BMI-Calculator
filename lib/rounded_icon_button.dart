import 'package:flutter/material.dart';

class RoundedIconButton extends StatelessWidget {
  RoundedIconButton(
      {@required this.icon, @required this.onPressed, this.onLongPressed});
  final IconData icon;
  final Function onPressed;
  final Function onLongPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      onLongPress: onLongPressed,
      child: Icon(
        icon,
        size: 25.0,
      ),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xff4c4f5e),
    );
  }
}
