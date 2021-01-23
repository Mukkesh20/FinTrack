import 'package:flutter/material.dart';

Widget roundButton({onPressed, buttonText, buttonIcon}) {
  return OutlineButton(
    splashColor: Colors.grey,
    onPressed: onPressed,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
    highlightElevation: 0,
    borderSide: BorderSide(color: Colors.grey),
    child: Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          buttonIcon,
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              buttonText,
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey,
              ),
            ),
          )
        ],
      ),
    ),
  );
}
