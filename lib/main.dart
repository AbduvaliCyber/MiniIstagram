import 'package:flutter/material.dart';

void main() {
  runApp(const MyInstagram());
}

class MyInstagram extends StatefulWidget {
  const MyInstagram({Key? key}) : super(key: key);

  @override
  State<MyInstagram> createState() => _MyInstagramState();
}

class _MyInstagramState extends State<MyInstagram> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
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
          title: const Text(
            "Instagram",
            style: TextStyle(
              fontFamily: 'Billabong',
              fontSize: 32,
            ),
          ),
          centerTitle: false,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 1,
          actions: [
            IconButton(
              icon: const Icon(Icons.favorite_border),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.send),
              onPressed: () {},
            ),
          ],
        ),
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) => setState(() => _selectedIndex = index),
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
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        StoryBar(),
        Divider(height: 1),
        PostWidget(username: "flutter_dev", image: "assets/images/post1.jpg"),
        PostWidget(username: "openai", image: "assets/images/post2.jpg"),
      ],
    );
  }
}

// === Story Bar ===
class StoryBar extends StatelessWidget {
  const StoryBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> users = ["me", "flutter", "dart", "openai", "google", "apple"];

    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(8),
        itemCount: users.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 32,
                  backgroundColor: Colors.purple,
                  child: CircleAvatar(
                    radius: 29,
                    backgroundImage: AssetImage("assets/images/avatar.png"),
                  ),
                ),
                const SizedBox(height: 5),
                Text(users[index], style: const TextStyle(fontSize: 12)),
              ],
            ),
          );
        },
      ),
    );
  }
}

// === Post Widget ===
class PostWidget extends StatefulWidget {
  final String username;
  final String image;

  const PostWidget({Key? key, required this.username, required this.image})
      : super(key: key);

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: const CircleAvatar(
            backgroundImage: AssetImage("assets/images/avatar.png"),
          ),
          title: Text(widget.username,
              style: const TextStyle(fontWeight: FontWeight.bold)),
          trailing: const Icon(Icons.more_vert),
        ),
        Image.asset(widget.image, fit: BoxFit.cover),
        Row(
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  isLiked = !isLiked;
                });
              },
              icon: Icon(
                isLiked ? Icons.favorite : Icons.favorite_border,
                color: isLiked ? Colors.red : Colors.black,
              ),
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.comment_outlined)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.send)),
            const Spacer(),
            IconButton(onPressed: () {}, icon: const Icon(Icons.bookmark_border)),
          ],
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Text("Liked by user123 and others"),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}

// === Search Page ===
class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(2),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 2,
        crossAxisSpacing: 2,
      ),
      itemCount: 12,
      itemBuilder: (context, index) {
        return Image.asset(
          "assets/images/post${(index % 3) + 1}.jpg",
          fit: BoxFit.cover,
        );
      },
    );
  }
}

// === Reels Page ===
class ReelsPage extends StatelessWidget {
  const ReelsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("📹 Reels (video page)", style: TextStyle(fontSize: 22)),
    );
  }
}

// === Shop Page ===
class ShopPage extends StatelessWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("🛍 Shop page", style: TextStyle(fontSize: 22)),
    );
  }
}

// === Profile Page ===
class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 20),
        const CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage("assets/images/avatar.png"),
        ),
        const SizedBox(height: 10),
        const Center(
          child: Text(
            "Alisher",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        const Center(child: Text("Flutter Developer 🚀")),
        const SizedBox(height: 20),

        // Stats
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            _ProfileStat(title: "Posts", value: "12"),
            _ProfileStat(title: "Followers", value: "500"),
            _ProfileStat(title: "Following", value: "300"),
          ],
        ),
        const SizedBox(height: 20),

        // Edit Profile button
        Center(
          child: OutlinedButton(
            onPressed: () {},
            child: const Text("Edit Profile"),
          ),
        ),
        const SizedBox(height: 20),

        // User posts
        GridView.builder(
          padding: const EdgeInsets.all(2),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 2,
            crossAxisSpacing: 2,
          ),
          itemCount: 9,
          itemBuilder: (context, index) {
            return Image.asset(
              "assets/images/post${(index % 3) + 1}.jpg",
              fit: BoxFit.cover,
            );
          },
        ),
      ],
    );
  }
}

class _ProfileStat extends StatelessWidget {
  final String title;
  final String value;

  const _ProfileStat({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        Text(title),
      ],
    );
  }
}
