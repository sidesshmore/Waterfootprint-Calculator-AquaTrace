import 'package:aqua_trace/features/Blog/ui/blog_card.dart';
import 'package:aqua_trace/models/blogTextContent.dart';
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


final List<BlogTextContent> blogPosts = [
  BlogTextContent(
    postTitle: 'Beyond the Tap: The Hidden Water Footprints in Our Lives',
    postContent:
        'Water footprint is a measure of the total volume of freshwater used to produce goods and services consumed by an individual, community, or nation. It includes the water used directly and indirectly throughout the entire supply chain.',
    imageUrl:
        'https://www.chaitanyaproducts.com/blog/wp-content/uploads/2020/01/water-footprint.jpg',
  ),
  BlogTextContent(
    postTitle: 'From Soil to Sewage: Decoding Water Footprints',
    postContent:
        'There are many ways to reduce your water footprint at home, such as fixing leaks, installing water-efficient appliances, practicing water-saving habits, and reducing consumption of water-intensive foods.',
    imageUrl:
        'https://www.livpuresmart.com/blog/wp-content/uploads/2023/07/Water-Footrpint.jpg',
  ),
  BlogTextContent(
    postTitle: 'From Drip Irrigation to Aquaponics',
    postContent:
        'Agriculture accounts for a significant portion of the world\'s water footprint, mainly due to irrigation of crops. Sustainable agricultural practices, such as precision irrigation and crop rotation, can help reduce the water footprint of agriculture.',
    imageUrl:
        'https://agri-route.com/cdn/shop/articles/Micro-Irrigation-Fund.jpg?v=1687588515',
  ),
  BlogTextContent(
    postTitle: 'Practical Tips for Lowering Water Footprints on the Farm',
    postContent:
        'Virtual water is the water embedded in the production and trade of goods and services. Understanding virtual water can help countries make informed decisions about water use and trade policies to manage their water resources more sustainably.',
    imageUrl:
        'https://cdn.britannica.com/70/156670-050-7E37C3D6/Irrigation-canal-farm-field.jpg',
  ),
  BlogTextContent(
    postTitle: 'Corporate Responsibility for Water Footprint',
    postContent:
        'Many companies are recognizing the importance of reducing their water footprint and implementing water stewardship practices throughout their operations and supply chains. Corporate responsibility for water footprint is crucial for sustainable water management.',
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTlezMQibwls2HFFKn9I4vSggS1PmCTIlU1DVxBfVwrkp6hjK7PDt1lUtRZE4fTPZktUNg&usqp=CAU',
  ),
 BlogTextContent(
    postTitle: 'Decoding Grey Water Footprints: A Sustainable Perspective',
    postContent:
        'Decoding Grey Water Footprints: A Sustainable Perspective.',
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwGtv6hDfSRPKIXAKIzBW_5jWXkYdgIvvUWg&usqp=CAU',
  ),
 BlogTextContent(
    postTitle: 'Navigating the Shades of Grey: Understanding Water Reuse',
    postContent:
        'Grey water footprint is a major issue for industries.',
    imageUrl:
        'https://i0.wp.com/atlas-scientific.com/files/industrial-waste-disposal-083123.jpg?resize=1000%2C501&ssl=1',
  )
];