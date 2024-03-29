import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Carousel',
      home: ImageCarousel(),
    );
  }
}

class ImageCarousel extends StatefulWidget {
  _ImageCarouselState createState() => new _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    animation = new Tween(begin: 0.0, end: 18.0).animate(controller)
      ..addListener(() {
        setState(() {
          // the state that has changed here is the animation object’s value
        });
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    Widget carousel = new Carousel(
      boxFit: BoxFit.cover,
      images: [
        // new AssetImage('assets/1.jpg'),
        // new AssetImage('assets/2.jpg'),
        // new AssetImage('assets/3.jpg'),
        new NetworkImage('http://www.manoelfigueiredo.com/app/1.png'),
        new NetworkImage('http://www.manoelfigueiredo.com/app/2.png'),
        //new NetworkImage('http://www.manoelfigueiredo.com/app/3.jpg'),
        //new NetworkImage('http://www.manoelfigueiredo.com/app/1.mp4'),
      ],
      animationCurve: Curves.fastOutSlowIn,
      animationDuration: Duration(seconds: 5),
    );

    Widget banner = new Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 20.0),
        child: new Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.0),
                bottomRight: Radius.circular(15.0)),
            color: Colors.amber.withOpacity(0.5),
          ),
          padding: const EdgeInsets.all(5.0),
          child: new Text(
            'Manoel Figueiredo',
            style: TextStyle(
              fontFamily: 'fira',
              fontSize: animation.value,//18.0,
              //color: Colors.white,
            ),
          ),
        ),
      // ),
    //  ),
    );

    return new Scaffold(
      backgroundColor: Colors.black,
      body: new Center(
        child: new Container(
          padding: const EdgeInsets.all(5.0),
          height: screenHeight,
          child: new ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: new Stack(
              children: [
                carousel,
                banner,
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Increment',
        child: Icon(Icons.power_settings_new),
      ),
    );
  }

  dispose() {
    controller.dispose();
    super.dispose();
  }
}
