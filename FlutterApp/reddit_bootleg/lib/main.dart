import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Reddit - Dive into anything',
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xff1D2535),
            automaticallyImplyLeading: false,
            title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Image.asset(
                      'assets/reddit-logo.png',
                      fit: BoxFit.contain,
                      height: 50,
                      width: 100,
                    ),
                  ),
                ]),
            actions: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Icon(Icons.edit),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Icon(Icons.menu),
              )
            ],
          ),
          body: HomePage(),
        ));
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color(0xffEFEFED),
        child: ListView(
          children: <Widget>[SubnavBar(), PostList()],
        ));
  }
}

class SubnavBar extends StatelessWidget {
  const SubnavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color greySecondary = Color(0xffCCCCCA);
    return Container(
        margin: EdgeInsets.symmetric(vertical: 4.0),
        padding: EdgeInsets.all(10.0),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Icon(Icons.trending_up, color: greySecondary),
                  Text(
                    "Best",
                    style: TextStyle(color: greySecondary),
                  ),
                  Icon(Icons.expand_more, color: greySecondary)
                ]),
            Row(children: <Widget>[
              Icon(Icons.view_compact, color: greySecondary),
              Icon(Icons.expand_more, color: greySecondary)
            ])
          ],
        ));
  }
}

class PostList extends StatelessWidget {
  const PostList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[PostItem()],
    );
  }
}

class PostItem extends StatelessWidget {
  const PostItem({Key? key}) : super(key: key);
  static const TextStyle _headlinePostBold =
      TextStyle(fontWeight: FontWeight.bold);
  static const TextStyle _headlinePostSecondary = TextStyle(
    fontWeight: FontWeight.w400,
    color: Colors.grey,
  );
  static const TextStyle _contentPostTitle =
      TextStyle(fontWeight: FontWeight.bold, fontSize: 18);

  Widget _headPost() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://source.unsplash.com/random/50x50"),
                    backgroundColor: Colors.blue,
                    radius: 15.0,
                  ),
                  SizedBox(width: 10.0),
                  TextButton(
                    onPressed: () => print("judul diklik!"),
                    child: Text("r/LoremIpsum"),
                    style: TextButton.styleFrom(
                        primary: Colors.black,
                        backgroundColor: Colors.white,
                        textStyle: _headlinePostBold),
                  ),
                  Text(" · ", style: _headlinePostSecondary),
                  Text("6h", style: _headlinePostSecondary)
                ]),
          ),
          Icon(Icons.more_horiz, color: Colors.grey)
        ]);
  }

  Widget _content() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text("Lorem Ipsum", style: _contentPostTitle),
          ),
          Image.network(
            "https://source.unsplash.com/random/250x250",
            fit: BoxFit.fill,
            height: 60,
            width: 75,
          )
        ],
      ),
    );
  }

  Widget _rateSection() {
    return Row(
      //alignment: WrapAlignment.spaceBetween,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
              border: Border.all(width: 0.1, color: Colors.grey),
              borderRadius: BorderRadius.circular(100)),
          child: Row(
            children: [
              Icon(Icons.thumb_up_outlined, color: Colors.grey.shade500),
              SizedBox(width: 6.0),
              Text("17", style: _headlinePostSecondary),
              SizedBox(width: 6.0),
              Icon(Icons.thumb_down_outlined, color: Colors.grey.shade500),
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
        child: Column(
          children: [_headPost(), _content(), _rateSection()],
        ));
  }
}
