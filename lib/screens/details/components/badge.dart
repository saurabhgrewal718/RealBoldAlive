import 'package:flutter/material.dart';

class Badge extends StatelessWidget {
  const Badge({
    Key key,
    @required this.child,
    @required this.value,
    this.color,
  }) : super(key: key);

  final Widget child;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        Positioned(
          right: 8,
          top: 8,
          child: int.parse(value) >0 ? Container(
            padding: EdgeInsets.all(2.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.greenAccent,
            ),
            constraints: BoxConstraints(
              minWidth: 10,
              minHeight: 10,
            ),
            child: Text(
              value,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ) : Container(height: 0,),
        )
      ],
    );
  }
}
