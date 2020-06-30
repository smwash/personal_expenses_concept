import 'package:flutter/material.dart';

// const kTextFieldStyle = InputDecoration(
//    hintText: '',
//     contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 13.0),
//     border: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(25.0),
//     ),
//     enabledBorder: OutlineInputBorder(
//       borderSide: BorderSide(color: Colors.lightBlueAccent),
//       borderRadius: BorderRadius.circular(25.0),
//     ),
//     focusedBorder: OutlineInputBorder(
//       borderSide: BorderSide(color: Colors.orangeAccent, width: 2),
//       borderRadius: BorderRadius.circular(25.0),
//     ),
//    );

const kTextFieldDecoration = InputDecoration(
  hintText: '',
  // hintStyle: TextStyle(color: Colors.black45),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(32.0),
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
    borderRadius: BorderRadius.all(
      Radius.circular(32.0),
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.orangeAccent, width: 2.0),
    borderRadius: BorderRadius.all(
      Radius.circular(32.0),
    ),
  ),
);
