import 'package:flutter/material.dart';
import 'package:korean_news_app/models/news_model.dart';
import 'package:korean_news_app/widgets/CircularClipper.dart';

class CollapsingNewsScreen extends StatefulWidget {
  final News news;

  CollapsingNewsScreen({this.news});

  @override
  _CollapsingNewsScreenState createState() => _CollapsingNewsScreenState();
}

class _CollapsingNewsScreenState extends State<CollapsingNewsScreen> {
  double transparency = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              leading: IconButton(
                padding: EdgeInsets.only(left: 30.0),
                icon: Icon(Icons.arrow_back),
                iconSize: 30.0,
                color: Colors.black,
                onPressed: () => Navigator.pop(context),
              ),
              actions: [
                IconButton(
                  onPressed: () => print('Share'),
                  iconSize: 35.0,
                  color: Colors.black,
                  icon: Icon(Icons.share),
                ),
                IconButton(
                  icon: Icon(Icons.favorite_border),
                  iconSize: 30.0,
                  color: Colors.black,
                  onPressed: () => print('Add to Favorites'),
                ),
              ],
              elevation: 0.0,
              backgroundColor: Colors.white,
              expandedHeight: 350.0,
              floating: false,
              pinned: true,
              flexibleSpace: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  transparency =
                      (1 - (constraints.biggest.height - 80.0) * 1 / 294);
                  return FlexibleSpaceBar(
                    centerTitle: true,
                    title:
                        // Text(
                        //   'THE NUMBER -> $transparency', //374.0 - 80.0
                        //   style: TextStyle(color: Colors.black, fontSize: 12.0),
                        // ),
                        Opacity(
                      opacity: transparency,
                      child: AspectRatio(
                        aspectRatio: 12 / 1,
                        child: Image(
                          image: AssetImage('assets/images/demo_logo.png'),
                        ),
                      ),
                    ),
                    background: Stack(
                      children: <Widget>[
                        Container(
                          color: Colors.white,
                        ),
                        Container(
                          transform: Matrix4.translationValues(0.0, -50.0, 0.0),
                          child: Hero(
                            tag: widget.news.imageUrl,
                            child: ClipShadowPath(
                              clipper: CircularClipper(),
                              shadow: Shadow(blurRadius: 20.0),
                              child: Image(
                                height: 350.0,
                                width: double.infinity,
                                image: AssetImage(widget.news.imageUrl),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Positioned.fill(
                          bottom: 20.0,
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              widget.news.title.toUpperCase(),
                              style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ];
        },
        body: ListView(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 45.0),
              child: Text(widget.news.description,
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                  textAlign: TextAlign.justify),
            ),
          ],
        ),
        // Text(
        //   widget.news.title.toUpperCase(),
        //   style: TextStyle(
        //     fontSize: 20.0,
        //     fontWeight: FontWeight.bold,
        //   ),
        //   textAlign: TextAlign.center,
        // ),
      ),
    );
  }
}
