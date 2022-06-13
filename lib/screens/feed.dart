import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instafire_flutter/utils/colors.dart';
import 'package:instafire_flutter/utils/global_key.dart';
import 'package:instafire_flutter/widgets/post_card.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: width > webscreensize
          ? null
          : AppBar(
              backgroundColor: width > webscreensize
                  ? webbackgroundcolor
                  : mobilebackgroundcolor,
              title: SvgPicture.asset(
                'assets/ic_instagram.svg',
                color: primarycolor,
                height: 32,
              ),
              actions: [
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.message_outlined))
              ],
            ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('posts').snapshots(),
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) => Container(
              margin: EdgeInsets.symmetric(
                  horizontal: width > webscreensize ? width * 0.3 : 0,
                  vertical: width > webscreensize ? 15 : 0),
              child: PostCard(
                snap: snapshot.data!.docs[index].data(),
              ),
            ),
          );
        },
      ),
    );
  }
}
