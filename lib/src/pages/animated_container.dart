import 'package:flutter/material.dart';
import 'dart:math';

class AnimatedContainerPage extends StatefulWidget {
  @override
  _AnimatedContainerStatePage createState() => _AnimatedContainerStatePage();
}

class _AnimatedContainerStatePage extends State<AnimatedContainerPage> {
  double _width = 50.0;
  double _height = 50.0;
  Color _color = Colors.pink;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Animated Container'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
      ),
      body: Center(
        child: AnimatedContainer(
          curve: Curves.fastOutSlowIn,
          duration: Duration(seconds: 1),
          width: _width,
          height: _height,
          decoration: BoxDecoration(
            borderRadius: _borderRadius,
            color: _color,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _changeSizeContainer,
        child: Icon(Icons.play_arrow),
      ),
    );
  }

  void _changeSizeContainer() {
    final random = Random();

    setState(() {
      _width = random.nextInt(300).toDouble();
      _height = random.nextInt(300).toDouble();
      _color = Color.fromRGBO(
        random.nextInt(255), //Red
        random.nextInt(255), //Green
        random.nextInt(255), //Blue
        1,
      );
      _borderRadius = BorderRadius.circular(
        random.nextInt(100).toDouble(),
      );
    });
  }
}
