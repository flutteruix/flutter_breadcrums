import 'package:flutter/material.dart';

class BreadStyle {
  final double w;
  final double h;
  final double radius;
  final path = Path();
  BreadStyle(this.w, this.h, this.radius);

  angled() {
    path.moveTo(0, 0);
    path.lineTo(w - radius, 0);
    path.lineTo(w, h / 2);
    path.lineTo(w - radius, h);
    path.lineTo(0, h);
    path.lineTo(radius, h / 2);
    path.lineTo(0, 0);
    return path;
  }

  rect() {
    path.moveTo(0, 0);
    path.lineTo(w, 0);
    path.lineTo(w, h);
    path.lineTo(0, h);
    path.lineTo(0, 0);
    return path;
  }

  arrow() {
    path.moveTo(0, h * 0.2);
    path.lineTo(w - radius, h * 0.2);
    path.lineTo(w - radius, 0);
    path.lineTo(w, h / 2);
    path.lineTo(w - radius, h);
    path.lineTo(w - radius, h - h * 0.2);
    path.lineTo(0, h - h * 0.2);
    return path;
  }

  capsule() {
    path.moveTo(radius, 0);
    path.lineTo(w - radius, 0);
    path.quadraticBezierTo(w, h / 2, w - radius, h);
    path.lineTo(radius, h);
    path.quadraticBezierTo(0, h / 2, radius, 0);
    return path;
  }

  capsuleCurve() {
    path.moveTo(0, 0);
    path.lineTo(w - radius, 0);
    path.quadraticBezierTo(w, h / 2, w - radius, h);
    path.lineTo(0, h);
    path.quadraticBezierTo(radius, h / 2, 0, 0);
    return path;
  }
}
