import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class draw extends StatefulWidget {
  const draw({Key key}) : super(key: key);

  @override
  _drawState createState() => _drawState();
}

class _drawState extends State<draw> {
  List<Offset> _points = <Offset>[];
  String localFilePath;

  var mainColor = Colors.blueGrey;
  var secondColor = Colors.blueGrey;
  var thirdColor = Colors.blueGrey;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width / 2;
    var smallContainer = MediaQuery.of(context).size.height / 7;

    return Scaffold(
      body: new Container(
        height: double.infinity,
        width: double.infinity,
        child: new GestureDetector(
          onPanUpdate: (DragUpdateDetails details) {
            setState(() {
              RenderBox object = context.findRenderObject();
              Offset _localPosition =
                  object.globalToLocal(details.globalPosition);
              _points = new List.from(_points)..add(_localPosition);
            });
          },
          onPanEnd: (DragEndDetails details) => _points.add(null),
          child: new CustomPaint(
            painter: new Signature(points: _points),
            size: Size.infinite,
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            left: BorderSide(color: Colors.blue, width: 10),
            right: BorderSide(color: Colors.blue, width: 10),
            top: BorderSide(color: Colors.blue, width: 10),
            bottom: BorderSide(color: Colors.blue, width: 10),
          ),
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () => _points.clear(),
        backgroundColor: Colors.white,
        child: Icon(
          Icons.delete,
          color: Colors.red,
        ),
      ),
    );
  }
}

class Signature extends CustomPainter {
  List<Offset> points;

  Signature({this.points});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = Colors.blue
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 15;

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i], points[i + 1], paint);
      }
    }
  }

  @override
  bool shouldRepaint(Signature oldDelegate) => oldDelegate.points != points;
}
