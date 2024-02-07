import 'package:aqua_trace/features/Blog/ui/blog_card.dart';
import 'package:flutter/material.dart';

class BlogPage extends StatelessWidget {
  const BlogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          final post = blogPosts[index];
          return BlogCard(
            postTitle: post.postTitle,
            postContent: post.postContent,
            imageUrl: post.imageUrl,
          );
        },
        itemCount: blogPosts.length,
      ),
    );
  }
}

class BlogTextContent {
  final String postTitle;
  final String postContent;
  final String imageUrl;

  BlogTextContent({
    required this.postTitle,
    required this.postContent,
    required this.imageUrl,
  });
}

final List<BlogTextContent> blogPosts = [
  BlogTextContent(
    postTitle: 'Understanding Water Footprint',
    postContent:
        'Water footprint is a measure of the total volume of freshwater used to produce goods and services consumed by an individual, community, or nation. It includes the water used directly and indirectly throughout the entire supply chain.',
    imageUrl:
        'https://www.chaitanyaproducts.com/blog/wp-content/uploads/2020/01/water-footprint.jpg',
  ),
  BlogTextContent(
    postTitle: 'Reducing Your Water Footprint at Home',
    postContent:
        'There are many ways to reduce your water footprint at home, such as fixing leaks, installing water-efficient appliances, practicing water-saving habits, and reducing consumption of water-intensive foods.',
    imageUrl:
        'https://cdn.agclassroom.org/media/uploads/LP821/Green_blue_gray_water.png',
  ),
  BlogTextContent(
    postTitle: 'Impact of Agriculture on Water Footprint',
    postContent:
        'Agriculture accounts for a significant portion of the world\'s water footprint, mainly due to irrigation of crops. Sustainable agricultural practices, such as precision irrigation and crop rotation, can help reduce the water footprint of agriculture.',
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQRfGgv08exN-rmoz0rbeguSYWQsup7fcsYMw&usqp=CAU',
  ),
  BlogTextContent(
    postTitle: 'Virtual Water and Global Trade',
    postContent:
        'Virtual water is the water embedded in the production and trade of goods and services. Understanding virtual water can help countries make informed decisions about water use and trade policies to manage their water resources more sustainably.',
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQFc-mM-t1zVaN6l4mK-b-YUIU5PjK0hnBLJQ&usqp=CAU',
  ),
  BlogTextContent(
    postTitle: 'Corporate Responsibility for Water Footprint',
    postContent:
        'Many companies are recognizing the importance of reducing their water footprint and implementing water stewardship practices throughout their operations and supply chains. Corporate responsibility for water footprint is crucial for sustainable water management.',
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTlezMQibwls2HFFKn9I4vSggS1PmCTIlU1DVxBfVwrkp6hjK7PDt1lUtRZE4fTPZktUNg&usqp=CAU',
  ),
];
