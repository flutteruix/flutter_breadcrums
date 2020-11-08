import 'package:flutter/material.dart';
import 'package:flutter_breadcrums/flutter_breadcrums.dart';

import 'color_picker.dart';

// this.title = "Title",
// this.onPressed,
// this.padding = const EdgeInsets.fromLTRB(20.0, 3, 20.0, 3),
// this.margin = const EdgeInsets.symmetric(horizontal: 5),
// this.radius = 20,
// this.width = 80,
// this.child,
// this.colors = const [Colors.orangeAccent, Colors.yellow],
// this.widthFactor = 0.8,
// this.style = Style.Angled,
class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

enum Orientation { horizontal, vertical }

class _MainScreenState extends State<MainScreen> {
  List<String> list = new List();
  TextEditingController _controller = TextEditingController();

  double padding = 0;
  double margin = 0;
  double radius = 20;
  double width = 80;
  double withFactor = 0.9;
  Orientation _orientation = Orientation.vertical;
  //this.child,
  Color color1 = Colors.orangeAccent;
  Color color2 = Colors.yellow;
  Style style = Style.Angled;
  bool isUseChild = false;

  @override
  void initState() {
    list.addAll(["Item 1", "Item 2"]);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double heigth = MediaQuery.of(context).size.height;
    final _scaffoldKey = GlobalKey<ScaffoldState>();
    _codeView() {
      return Container(
        height: 300,
        child: TextFormField(
          initialValue: '''
           BreadCrum(
                    ${ isUseChild ?  '''child : Container(child : Text("Title")),''':"title: \"${list[0]}\","}                    
                    onPressed: () {
                      print(${list[0]});
                    },
                    padding: EdgeInsets.fromLTRB(${20 + padding.toInt()},
                        ${3 + padding.toInt()}, ${20 + padding.toInt()}, ${3 + padding.toInt()}),
                    margin: EdgeInsets.symmetric(vertical: ${5 + margin.toInt()}),
                    radius: ${radius.toInt()},
                    width: ${width.toInt()},                   
                    colors:  [$color1, $color2],
                    widthFactor: $withFactor,
                    style: $style,
                  );
                
           ''',
          maxLines: null,
        ),
      );
    }

    _breadcrum() {
      return Container(
        height: heigth * 0.4,
        child: Center(
          child: Container(
            height: _orientation == Orientation.horizontal
                ? heigth * 0.1
                : heigth * 0.4,
            child: ListView(
                scrollDirection: _orientation == Orientation.horizontal
                    ? Axis.horizontal
                    : Axis.vertical,
                children: list.map<Widget>((e) {
                  print(e);
                  return BreadCrum(
                    title: e,
                    onPressed: () {
                      final snackBar = SnackBar(content: Text(e));
                      _scaffoldKey.currentState.showSnackBar(snackBar);
                    },
                    padding: EdgeInsets.fromLTRB(
                        20 + padding, 3 + padding, 20 + padding, 3 + padding),
                    margin: EdgeInsets.symmetric(vertical: 5 + margin),
                    radius: radius,
                    width: width,
                    child : isUseChild ? Container(child : Text("Title")):null,
                    colors: [color1, color2],
                    widthFactor: withFactor,
                    style: style,
                  );
                }).toList()),
          ),
        ),
      );
    }

    return DefaultTabController(
        length: 2,
        child: Scaffold(
            key: _scaffoldKey,
            appBar: AppBar(
                title: Text("Breadcrum Example"),
                bottom: TabBar(
                  tabs: [
                    Tab(
                      child: Text("View"),
                    ),
                    Tab(
                      child: Text("Code"),
                    )
                  ],
                )),
            body: TabBarView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      _breadcrum(),
                      Row(
                        children: [
                          Expanded(
                              child: TextField(
                            controller: _controller,
                          )),
                          RaisedButton(
                            onPressed: () {
                              list.add(_controller.text);
                              setState(() {});
                            },
                            child: Text("ADD"),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text("Width"),
                          Slider(
                            value: width,
                            onChanged: (value) {
                              setState(() {
                                width = value;
                              });
                            },
                            max: 300,
                          ),
                          Expanded(
                            child: DropdownButton(
                                isExpanded: true,
                                value: style,
                                items: Style.values.map((e) {
                                  String title = "Angled";
                                  switch (e) {
                                    case Style.Angled:
                                      title = "Angled";
                                      break;
                                    case Style.Capsule:
                                      title = "Capsule";
                                      break;
                                    case Style.CapsuleCurve:
                                      title = "CapsuleCurve";
                                      break;
                                    case Style.Rect:
                                      title = "Rect";
                                      break;
                                    case Style.Arrow:
                                      title = "Arrow";
                                      break;
                                    case Style.Rocket:
                                      title = "Rocket";
                                      break;
                                    case Style.Oval:
                                      title = "Oval";
                                      break;
                                  }
                                  return DropdownMenuItem(
                                      value: e, child: Text(title));
                                }).toList(),
                                onChanged: (val) {
                                  setState(() {
                                    style = val;
                                  });
                                }),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text("Radius"),
                          Slider(
                            value: radius,
                            onChanged: (value) {
                              setState(() {
                                radius = value;
                              });
                            },
                            max: 50,
                          ),
                          Text("Horizontal"),
                          Spacer(),
                          Radio(
                              value: Orientation.horizontal,
                              groupValue: _orientation,
                              onChanged: (val) {
                                setState(() {
                                  _orientation = val;
                                });
                              })
                        ],
                      ),
                      Row(
                        children: [
                          Text("Padding"),
                          Slider(
                            value: padding,
                            onChanged: (value) {
                              setState(() {
                                padding = value;
                              });
                            },
                            max: 50,
                          ),
                          Text("Vertical"),
                          Spacer(),
                          Radio(
                              value: Orientation.vertical,
                              groupValue: _orientation,
                              onChanged: (val) {
                                setState(() {
                                  _orientation = val;
                                });
                              })
                        ],
                      ),
                      Row(
                        children: [
                          Text("Margin"),
                          Slider(
                            value: margin,
                            onChanged: (value) {
                              setState(() {
                                margin = value;
                              });
                            },
                            max: 20,
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () async {
                               var color = await showDialog(context: context,
                                builder: (_){
                                  return new SimpleDialog(
                                  title: Text("Select a color"),
                                  children: <Widget>[
                                    new ColorPicker(currentColor: color1),
                                  ],
                                );
                                }
                                );
                                setState(() {
                                  color1 = color;
                                });
                               
                              },
                              child: Container(
                                padding: EdgeInsets.all(8),
                                color: color1,
                                child: Center(child: Text("Color 1")),
                              ),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () async {
                               var color = await showDialog(context: context,
                                builder: (_){
                                  return new SimpleDialog(
                                  title: Text("Select a color"),
                                  children: <Widget>[
                                    new ColorPicker(currentColor: color1),
                                  ],
                                );
                                }
                                );
                                setState(() {
                                  color2 = color;
                                });
                               
                              },
                              child: Container(
                                padding: EdgeInsets.all(8),
                                color: color2,
                                child: Center(child: Text("Color 2")),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text("Width Factor"),
                          Slider(
                            min: 0.5,
                            max: 1,
                            value: withFactor,
                            onChanged: (value) {
                              setState(() {
                                withFactor = value;
                              });
                            },
                          ),
                           Text("Use Child"),
                           Spacer(),
                          Checkbox(value: isUseChild, onChanged: (val){
                            setState(() {                              
                              isUseChild = val;
                            });
                          }),
                         
                        ],
                      ),
                       ],
                  ),
                ),
                _codeView()
              ],
            )));
  }
}
