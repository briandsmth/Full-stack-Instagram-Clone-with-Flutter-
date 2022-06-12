import 'package:flutter/material.dart';
import 'package:instafire_flutter/screens/add_post.dart';
import 'package:instafire_flutter/screens/feed.dart';

const webscreensize = 600;
List<Widget> homeScreenItems = [
  const FeedScreen(),
  const Text('search'),
  const AddPostScreen(),
  const Text('favorite'),
  const Text('person'),
];
