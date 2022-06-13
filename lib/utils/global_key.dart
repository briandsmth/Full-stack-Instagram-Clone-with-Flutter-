import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instafire_flutter/screens/add_post.dart';
import 'package:instafire_flutter/screens/feed.dart';
import 'package:instafire_flutter/screens/porfile.dart';
import 'package:instafire_flutter/screens/search.dart';

const webscreensize = 600;
List<Widget> homeScreenItems = [
  const FeedScreen(),
  const SearchScreen(),
  const AddPostScreen(),
  const Text('favorite'),
  ProfileScreen(
    uid: FirebaseAuth.instance.currentUser!.uid,
  ),
];
