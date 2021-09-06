import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class PostSchema {
  int id;
  String title;
  String time;
  String subreddit;
  int voteCount;
  int commentCount;

  PostSchema({
    Key? key,
    required this.id,
    required this.title,
    required this.time,
    required this.subreddit,
    required this.voteCount,
    required this.commentCount,
  });
}

List<PostSchema> postData = [
  PostSchema(
      id: 0,
      title: "Lorem Ipsum",
      time: "3h",
      subreddit: "r/LoremIpsum",
      voteCount: 17,
      commentCount: 7),
  PostSchema(
      id: 1,
      title: "Dolor sit amet",
      time: "4h",
      subreddit: "r/LoremIpsum",
      voteCount: 72,
      commentCount: 81),
  PostSchema(
      id: 2,
      title: "consectetur adipiscing elit",
      time: "4h",
      subreddit: "r/LoremIpsum",
      voteCount: 42,
      commentCount: 12),
  PostSchema(
      id: 3,
      title: "Morbi sit amet sem",
      time: "4h",
      subreddit: "r/LoremIpsum",
      voteCount: 30,
      commentCount: 29),
];

class MyApp extends StatelessWidget {
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
          floatingActionButton: FloatingActionButton(
            onPressed: () => print("Tombol diklik!"),
            backgroundColor: Colors.deepOrange,
            child: Icon(Icons.refresh),
          ),
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
                  Icon(Icons.trending_up, color: Colors.grey.shade400),
                  Text(
                    "Best",
                    style: TextStyle(color: Colors.grey.shade400),
                  ),
                  Icon(Icons.expand_more, color: Colors.grey.shade400)
                ]),
            Row(children: <Widget>[
              Icon(Icons.view_compact, color: Colors.grey.shade400),
              Icon(Icons.expand_more, color: Colors.grey.shade400)
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
        children: List.generate(postData.length, (index) {
      return PostItem(data: postData[index]);
    }));
  }
}

class PostItem extends StatefulWidget {
  const PostItem({Key? key, required this.data}) : super(key: key);
  final PostSchema data;

  static const TextStyle _headlinePostBold =
      TextStyle(fontWeight: FontWeight.bold);
  static const TextStyle _headlinePostSecondary = TextStyle(
    fontWeight: FontWeight.w400,
    color: Colors.grey,
  );

  static const TextStyle _contentPostTitle =
      TextStyle(fontWeight: FontWeight.bold, fontSize: 18);

  @override
  _PostItemState createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  int isUpvoted = 0;
  int isDownvoted = 0;
  int randomSeed = new Random().nextInt(100);
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
                        "https://picsum.photos/seed/$randomSeed/50"),
                    backgroundColor: Colors.blue,
                    radius: 15.0,
                  ),
                  SizedBox(width: 10.0),
                  TextButton(
                    onPressed: () => print("judul diklik!"),
                    child: Text("${widget.data.subreddit}"),
                    style: TextButton.styleFrom(
                        primary: Colors.black,
                        backgroundColor: Colors.white,
                        textStyle: PostItem._headlinePostBold),
                  ),
                  Text(" · ", style: PostItem._headlinePostSecondary),
                  Text("${widget.data.time}",
                      style: PostItem._headlinePostSecondary)
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
            child: TextButton(
              onPressed: () => print("judul diklik!"),
              child: Text("${widget.data.title}"),
              style: TextButton.styleFrom(
                primary: Colors.black,
                backgroundColor: Colors.white,
                alignment: Alignment.centerLeft,
                textStyle: PostItem._contentPostTitle,
              ),
            ),
          ),
          Image.network(
            "https://picsum.photos/seed/${randomSeed + 1}/250",
            fit: BoxFit.fill,
            height: 60,
            width: 75,
          )
        ],
      ),
    );
  }

  Widget _rateSection() {
    BoxDecoration __boxDecoration = BoxDecoration(
        border: Border.all(width: 0.1, color: Colors.grey),
        borderRadius: BorderRadius.circular(100));
    EdgeInsets __padding = EdgeInsets.symmetric(vertical: 1.0, horizontal: 2.0);

    Widget __voteGiver = Container(
      padding: __padding,
      decoration: __boxDecoration,
      child: Row(
        children: [
          IconButton(
              padding: EdgeInsets.all(0),
              onPressed: () {
                setState(() {
                  if (isUpvoted == 1) return;
                  postData[widget.data.id].voteCount += (1 + isDownvoted);
                  isUpvoted = 1;
                  isDownvoted = 0;
                });
              },
              icon: Icon(
                  isUpvoted == 1 ? Icons.thumb_up : Icons.thumb_up_outlined),
              color: isUpvoted == 1 ? Colors.deepOrange : Colors.grey.shade500),
          SizedBox(width: 6.0),
          Text("${widget.data.voteCount}",
              style: PostItem._headlinePostSecondary),
          SizedBox(width: 6.0),
          IconButton(
              padding: EdgeInsets.all(0),
              onPressed: () {
                setState(() {
                  if (isDownvoted == 1) return;
                  postData[widget.data.id].voteCount -= (1 + isUpvoted);
                  isDownvoted = 1;
                  isUpvoted = 0;
                });
              },
              icon: Icon(isDownvoted == 1
                  ? Icons.thumb_down
                  : Icons.thumb_down_outlined),
              color:
                  isDownvoted == 1 ? Colors.deepOrange : Colors.grey.shade500),
        ],
      ),
    );

    Widget __addEmblem = Container(
      padding: __padding,
      decoration: __boxDecoration,
      child: IconButton(
          padding: EdgeInsets.all(0),
          onPressed: () => print("Tombol diklik!"),
          icon: Icon(Icons.add_circle_outline),
          color: Colors.grey.shade500),
    );

    Widget __comment = Container(
      padding: __padding,
      decoration: __boxDecoration,
      child: Row(children: <Widget>[
        IconButton(
            padding: EdgeInsets.all(0),
            onPressed: () => print("Tombol diklik!"),
            icon: Icon(Icons.add_comment_outlined),
            color: Colors.grey.shade500),
        SizedBox(width: 6.0),
        Text("${widget.data.commentCount}",
            style: PostItem._headlinePostSecondary),
        SizedBox(width: 6.0),
      ]),
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              __voteGiver,
              SizedBox(width: 10.0),
              __addEmblem,
              SizedBox(width: 10.0),
              __comment
            ],
          ),
        ),
        Container(
          padding: __padding,
          decoration: __boxDecoration,
          child: IconButton(
              padding: EdgeInsets.all(0),
              onPressed: () => print("Tombol diklik!"),
              icon: Icon(Icons.ios_share),
              color: Colors.grey.shade500),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 2.0),
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
        child: Column(
          children: [_headPost(), _content(), _rateSection()],
        ));
  }
}
