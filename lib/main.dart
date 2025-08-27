import 'package:flutter/material.dart';

void main() {
  runApp(MyInstagram());
}

class MyInstagram extends StatefulWidget {
  @override
  _MyInstagramState createState() => _MyInstagramState();
}

class _MyInstagramState extends State<MyInstagram> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    SearchPage(),
    ReelsPage(),
    ShopPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Instagram",
      theme: ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Instagram",
            style: TextStyle(
              fontFamily: 'Billabong', // Instagram style font qo‘yish mumkin
              fontSize: 28,
            ),
          ),
          centerTitle: false,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 1,
        ),
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.video_collection), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
          ],
        ),
      ),
    );
  }
}

// === Home Page ===
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        PostWidget(
          username: "flutter_dev",
          image: "assets/images/post1.jpg",
        ),
        PostWidget(
          username: "openai",
          image: "assets/images/post2.jpg",
        ),
      ],
    );
  }
}

class PostWidget extends StatelessWidget {
  final String username;
  final String image;

  PostWidget({required this.username, required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage("assets/images/avatar.png"),
          ),
          title: Text(username, style: TextStyle(fontWeight: FontWeight.bold)),
          trailing: Icon(Icons.more_vert),
        ),
        Image.asset(image, fit: BoxFit.cover),
        Row(
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border)),
            IconButton(onPressed: () {}, icon: Icon(Icons.comment_outlined)),
            IconButton(onPressed: () {}, icon: Icon(Icons.send)),
            Spacer(),
            IconButton(onPressed: () {}, icon: Icon(Icons.bookmark_border)),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text("Liked by user123 and others"),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}

// === Search Page ===
class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(2),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 2,
        crossAxisSpacing: 2,
      ),
      itemCount: 12,
      itemBuilder: (context, index) {
        return Image.asset("assets/images/post${(index % 3) + 1}.jpg", fit: BoxFit.cover);
      },
    );
  }
}

// === Reels Page ===
class ReelsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("📹 Reels (video page)", style: TextStyle(fontSize: 22)));
  }
}

// === Shop Page ===
class ShopPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("🛍 Shop page", style: TextStyle(fontSize: 22)));
  }
}

// === Profile Page ===
class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(height: 20),
        CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage("assets/images/avatar.png"),
        ),
        SizedBox(height: 10),
        Center(
          child: Text("Alisher", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ),
        Center(child: Text("Flutter Developer 🚀")),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(children: [Text("12", style: TextStyle(fontWeight: FontWeight.bold)), Text("Posts")]),
            Column(children: [Text("500", style: TextStyle(fontWeight: FontWeight.bold)), Text("Followers")]),
            Column(children: [Text("300", style: TextStyle(fontWeight: FontWeight.bold)), Text("Following")]),
          ],
        ),
        SizedBox(height: 20),
        GridView.builder(
          padding: EdgeInsets.all(2),
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 2,
            crossAxisSpacing: 2,
          ),
          itemCount: 9,
          itemBuilder: (context, index) {
            return Image.asset("assets/images/post${(index % 3) + 1}.jpg", fit: BoxFit.cover);
          },
        ),
      ],
    );
  }
}
