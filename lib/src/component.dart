library breadcrum;

import 'package:flutter/material.dart';

import 'bread_style.dart';
import 'enums.dart';

class BreadCrum extends StatelessWidget {
  /// Breadcrum
  /// ```Dart
  /// BreadCrum(
  ///   title: "Title",
  /// )
  /// ```    


  ///text to be shown as breadcrum 
  final String title;
  
  final Function() onPressed;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  
  ///width of extra part i.e [curve],[pointed conic]
  final double radius;
  
  
  /// with of breadcrum
  final double width;
  
  
  ///if child is specified then title will be overwrite
  final Widget child;
  
  ///Gradient color 
  final List<Color> colors;
  
  /// If non-null, sets its height to the child's height multiplied by this factor.
  /// Can be both greater and less than 1.0 but must be positive.
  final double widthFactor;
  
  ///breadcrum type default is [Style.Angled]
  final Style style;

  BreadCrum({
    Key key, 
    this.title = "Title",
    this.onPressed, 
    this.padding = const EdgeInsets.fromLTRB(20.0, 3, 20.0, 3), 
    this.margin = const EdgeInsets.symmetric(horizontal: 5), 
    this.radius = 20,
    this.width = 80,
    this.child, 
    this.colors = const [Colors.orangeAccent, Colors.yellow],
    this.widthFactor = 0.8, 
    this.style = Style.Angled,
    }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      widthFactor: widthFactor,
      child: Container(
        margin: margin,
        child: CustomPaint(
          painter: CustomShape(
            radius: radius,
            colors: colors,
            style: style
            ),
          child: InkWell(
            onTap: onPressed,
              child: Container(
                width: width,
                alignment: Alignment.center,
                padding: padding,
                child: child ?? Text(
                  title,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
              )
            ),
          ),
        ),
      ),
    );
  }
}

class CustomShape extends CustomPainter {
  final double radius;
  final List<Color> colors;
  final Style style;
  CustomShape({this.style = Style.Oval,this.colors,this.radius});
  @override
  void paint(Canvas canvas, Size size) {
    var w = size.width;
    var h = size.height;

    final Gradient gradient = new LinearGradient(
      begin: Alignment.centerRight,
      end: Alignment.bottomLeft,
      colors: colors,
      tileMode: TileMode.clamp,
    );

    final Rect colorBounds = Rect.fromLTRB(0, 0, size.width, size.height);
    final Paint paint = new Paint()
      ..shader = gradient.createShader(colorBounds);
    BreadStyle breadStyle = BreadStyle(w,h,radius);
    Path path;

    switch (style) {
      case Style.Angled : path = breadStyle.angled(); break;
      case Style.Capsule : path = breadStyle.capsule(); break;
      case Style.CapsuleCurve : path = breadStyle.capsuleCurve(); break;
      case Style.Rect : path = breadStyle.rect(); break;
      case Style.Arrow : path = breadStyle.arrow(); break;      
      case Style.Rocket : path = breadStyle.angled();break; 
      case Style.Oval:break;
    }

    //Both for rocket
    if(style != Style.Oval)
    canvas.drawPath(path, paint);

    //For circle
    if(style == Style.Oval || style == Style.Rocket)
    canvas.drawOval(colorBounds, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
