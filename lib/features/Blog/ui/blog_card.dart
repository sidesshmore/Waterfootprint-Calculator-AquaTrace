import 'package:aqua_trace/features/Blog/ui/blog_content_page.dart';
import 'package:flutter/material.dart';

class BlogCard extends StatelessWidget {
  final String postTitle;
  final String postContent;
  final String imageUrl;

  const BlogCard(
      {super.key, required this.postTitle,
      required this.postContent,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BlogContentPage(
                postTitle: postTitle,
                postContent: postContent,
                imageUrl: imageUrl,
              ),
            ),
          );
        },
        child: Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Column(
                  children: [
                    Image(
                      image: NetworkImage(
                        imageUrl,
                      ),
                      width: 200,
                      height: 168,
                    ),
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        postTitle,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Expanded(
                        child: Text(
                          postContent,
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
