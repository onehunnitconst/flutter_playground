import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  static const String routeName = "/profile";

  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            automaticallyImplyLeading: false,
            leading: Center(
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    shape: BoxShape.circle,
                  ),
                  width: 40,
                  height: 40,
                  child: Icon(Icons.arrow_back, color: Colors.white) 
                ),
              ),
            ),
            expandedHeight: 150.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                  "https://upload.wikimedia.org/wikipedia/commons/d/d2/Uhu-muc.jpg",
                  fit: BoxFit.cover),
              stretchModes: [
                StretchMode.blurBackground,
              ],
              centerTitle: false,
              title: Text("뚜")
            ),
            backgroundColor: Colors.transparent,
          ),
          SliverList.separated(
            itemBuilder: (context, index) =>
                Container(height: 100.0, color: Colors.black12),
            separatorBuilder: (context, index) =>
                Container(height: 1.0, color: Colors.black38),
          ),
        ],
      ),
    );
  }
}
