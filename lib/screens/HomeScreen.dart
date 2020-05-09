import 'package:flutter/material.dart';
import 'package:korean_news_app/models/news_model.dart';
import 'package:korean_news_app/screens/ContentScroll.dart';

import 'CollapsingNewsScreen.dart';
import 'NewsScreen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 1, viewportFraction: 0.8);
  }

  _newsSelector(int index) {
    return AnimatedBuilder(
        animation: _pageController,
        builder: (BuildContext context, Widget widget) {
          double value = 1;
          if (_pageController.position.haveDimensions) {
            value = _pageController.page - index;
            value = (1 - (value.abs() * 0.3) + 0.6).clamp(0.0, 1.0);
          }
          return Center(
            child: SizedBox(
              height: Curves.easeInOut.transform(value) * 270.0,
              width: Curves.easeInOut.transform(value) * 400.0,
              child: widget,
            ),
          );
        },
        child: GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => CollapsingNewsScreen(news: news[index]),
            ),
          ),
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: <Widget>[
              Center(
                child: Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54,
                        offset: Offset(0.0, 4.0),
                        blurRadius: 10.0,
                      )
                    ],
                  ),
                  child: Center(
                    child: Hero(
                      tag: news[index].imageUrl,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image(
                          image: AssetImage(news[index].imageUrl),
                          height: 220.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 40.0,
                left: 30.0,
                right: 40.0,
                child: Container(
                  width: 250.0,
                  child: Text(
                    news[index].title.toUpperCase(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 21.0,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            blurRadius: 10.0,
                            color: Colors.black87,
                            offset: Offset(5.0, 5.0),
                          ),
                          Shadow(
                            blurRadius: 10.0,
                            color: Colors.black87,
                            offset: Offset(-5.0, -5.0),
                          ),
                        ]),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: AspectRatio(
          aspectRatio: 8 / 1,
          child: Image(
            image: AssetImage('assets/images/demo_logo.png'),
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.menu),
          padding: EdgeInsets.only(left: 30.0),
          onPressed: () => print('Menu'),
          iconSize: 30.0,
          color: Colors.black,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            padding: EdgeInsets.only(right: 30.0),
            onPressed: () => print('Search'),
            iconSize: 30.0,
            color: Colors.black,
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 280.0,
            width: double.infinity,
            child: PageView.builder(
                controller: _pageController,
                itemCount: news.length,
                itemBuilder: (BuildContext context, int index) {
                  return _newsSelector(index);
                }),
          ),
          Container(
            height: 90.0,
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              scrollDirection: Axis.horizontal,
              itemCount: labels.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.all(10.0),
                  width: 160.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFFD45253),
                        Color(0xFF9E12F28),
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF9E12F28),
                        offset: Offset(0.0, 2.0),
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      labels[index].toUpperCase(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.8),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          ContentScroll(
            images: myList,
            title: 'My List',
            imageHeight: 250.0,
            imageWidth: 300.0,
          ),
          SizedBox(height: 10.0),
          ContentScroll(
            images: hangeul,
            title: 'About Hangeul Letters',
            imageHeight: 250.0,
            imageWidth: 300.0,
          ),
        ],
      ),
    );
  }
}
