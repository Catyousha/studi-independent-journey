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
];

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
        children: List.generate(
            postData.length, (index) => PostItem(data: postData[index])));
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
    BoxDecoration __boxDecoration = BoxDecoration(
        border: Border.all(width: 0.1, color: Colors.grey),
        borderRadius: BorderRadius.circular(100));
    EdgeInsets __padding = EdgeInsets.symmetric(vertical: 8.0, horizontal: 6.0);

    Widget __voteGiver = Container(
      padding: __padding,
      decoration: __boxDecoration,
      child: Row(
        children: [
          IconButton(
              onPressed: () {
                setState(() {
                  if (isUpvoted == 1) return;
                  postData[widget.data.id].voteCount += (1 + isDownvoted);
                  isUpvoted = 1;
                  isDownvoted = 0;
                });
              },
              icon: Icon(Icons.thumb_up_outlined),
              color: isUpvoted == 1 ? Colors.deepOrange : Colors.grey.shade500),
          SizedBox(width: 6.0),
          Text("${widget.data.voteCount}",
              style: PostItem._headlinePostSecondary),
          SizedBox(width: 6.0),
          IconButton(
              onPressed: () {
                setState(() {
                  if (isDownvoted == 1) return;
                  postData[widget.data.id].voteCount -= (1 + isUpvoted);
                  isDownvoted = 1;
                  isUpvoted = 0;
                });
              },
              icon: Icon(Icons.thumb_down_outlined),
              color: isDownvoted == 1 ? Colors.deepOrange : Colors.grey.shade500),
        ],
      ),
    );

    Widget __addEmblem = Container(
      padding: __padding,
      decoration: __boxDecoration,
      child: Icon(Icons.add_circle_outline, color: Colors.grey.shade500),
    );

    Widget __comment = Container(
      padding: __padding,
      decoration: __boxDecoration,
      child: Row(children: <Widget>[
        Icon(Icons.add_comment_outlined, color: Colors.grey.shade500),
        SizedBox(width: 6.0),
        Text("${widget.data.commentCount}",
            style: PostItem._headlinePostSecondary)
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
            child: Icon(Icons.ios_share_outlined, color: Colors.grey.shade500))
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
