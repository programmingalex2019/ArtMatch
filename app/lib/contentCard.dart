import 'package:flutter/material.dart';

class ContentCard extends StatelessWidget {

  final int index;
  final String path;

  const ContentCard({
    Key? key,
    required this.index,
    required this.path, 

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(path);
  }
}
