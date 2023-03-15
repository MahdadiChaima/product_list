import 'package:flutter/material.dart';

// Function to navigate to a new screen
void navigateTo(context, widget) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => widget),
  );
}

// Function to navigate to a new screen and remove all previous screens from the stack
void navigateAndFinish(context, widget) {
  Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => widget),
          (Route<dynamic> route) => false);
}

