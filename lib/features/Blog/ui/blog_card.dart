import 'package:aqua_trace/features/Blog/ui/blog_content_page.dart';
import 'package:flutter/material.dart';

class BlogCard extends StatelessWidget {
  final String postTitle;
  final String thumbnailContent;
  final String postContent;
  final String imageUrl;

  const BlogCard(
      {super.key,
      required this.postTitle,
      required this.thumbnailContent,
      required this.imageUrl,
      required this.postContent});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BlogContentPage(
              postTitle: postTitle,
              postContent: postContent,
              thumbnailContent: thumbnailContent,
              imageUrl: imageUrl,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.all(10),
        height: height * 0.37,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.network(
              imageUrl,
              height: height * 0.2,
              fit: BoxFit.fill,
            ),
            Text(
              postTitle,
              style: TextStyle(
                fontSize: width * 0.05,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              thumbnailContent,
              style: TextStyle(
                  fontSize: width * 0.04,
                  fontWeight: FontWeight.w500,
                  overflow: TextOverflow.fade),
            ),
          ],
        ),
      ),
    );
  }
}