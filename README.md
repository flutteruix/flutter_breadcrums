# flutter_breadcrums

This package helps in creation of Flutter Breadcrum similar to the html/css Breadcrum.

## Simple Usage

To use this plugin, add flutter_breadcrums aas a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/).

## Example 

```dart
import 'package:flutter_breadcrums/flutter_breadcrums.dart';
```

```dart
    ListView(
            scrollDirection: Axis.horizontal,
            children: ['Item 1','Item 2','Item 3'].map((e) {
            return BreadCrum(
                title: e,
                widthFactor: 0.9,
                width: 100,
                style: Style.angled,
                onPressed: () {
                    print(e);
                });
            }).toList(),
        )
```
| Attribute          | Type                       | Default              | Description   


|`title`             |`String`                   | `Title` | null child will overweite by title
|`onPressed`         |                           | `null`  | This will trigger when breadcrum is pressed  
|`padding`           |`EdgeInsetsGeometry`       | `const EdgeInsets.fromLTRB(20.0, 3, 20.0, 3)`| Padding between child and breadcrum edge
|`margin`            |`EdgeInsetsGeometry`       | `const EdgeInsets.symmetric(horizontal: 5)`| Margin ardound breadcrum
|`radius`            |`double`                   | `20` | Tapering width of angled,circle,etc bareadcrum style 
|`width`             |`double`                   | `80` | Width of the breadcrum
|`child`             |`Widget`                   | `null` | By default it is false, if provided it will overwrite title
|`colors`            |`List<Color>`              | `const [Colors.orangeAccent, Colors.yellow]` | gradient colors 
|`widthFactor`       |`double`                   | `0.8` | Widthfactor (Overlapping factor) is defined how much part should overlap on previous child 
|`style`             |`Style`                    |Style.Angled | this defines the shape of breadcrum

