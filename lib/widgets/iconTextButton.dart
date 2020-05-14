import 'package:flutter/material.dart';

class IconTextButton extends StatelessWidget {
  IconTextButton({@required this.onPressed, this.color, this.icon, this.label});
  final GestureTapCallback onPressed;
  final Color color;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                icon,
                color: color,
              ),
              SizedBox(
                width: 10.0,
              ),
              Text(
                label,
                maxLines: 1,
                style: TextStyle(color: color),
              ),
            ],
          ),
        ),
      ),
      onTap: onPressed,
    );
  }
}