
import 'package:aqua_trace/features/Blog/ui/blog_card.dart';
import 'package:aqua_trace/models/blogTextContent.dart';
import 'package:flutter/material.dart';

class BlogPage extends StatelessWidget {
  const BlogPage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: ListView.separated(
        itemBuilder: (context, index) {
          final post = blogPosts[index];
          return BlogCard(
            postTitle: post.postTitle,
            thumbnailContent: post.thumbnailContent,
            postContent: post.postContent,
            imageUrl: post.imageUrl,
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            height: height * 0.01,
          );
        },
        itemCount: blogPosts.length,
      ),
    );
  }
}

final List<BlogTextContent> blogPosts = [
  BlogTextContent(
    postTitle: 'Sustainable Practices to Reduce Your Water Footprint',
    thumbnailContent:
        'Discover simple steps to cut water use! Fix leaks, use water-efficient appliances & adopt eco-conscious habits.',
    postContent:
        'Want to lessen your water footprint? Start at home with these sustainable practices:\n\n- **Fix Leaks**: A dripping faucet can waste gallons each day.\n\n- **Eco-Friendly Appliances**: Invest in water-efficient models to save resources.\n\n- **Mindful Consumption**: Choose water-wise foods & minimize waste.\n\nBy adopting these habits, you can make a significant impact on conserving our precious water resources.',
    imageUrl:
        'https://www.livpuresmart.com/blog/wp-content/uploads/2023/07/Water-Footrpint.jpg',
  ),
  BlogTextContent(
    postTitle: 'Revolutionizing Water Use: Smart Solutions for Every Home',
    thumbnailContent:
        'Transform your home into a water-saving haven! Explore efficient appliances & sustainable practices.',
    postContent:
        'Innovative solutions can revolutionize water use:\n\n- **Smart Appliances**: Opt for water-saving models that optimize usage.\n\n- **Rainwater Harvesting**: Utilize rain barrels to collect water for non-potable uses.\n\n- **Greywater Recycling**: Reuse household wastewater for irrigation & flushing.\n\nAdopt these technologies and practices to create a more sustainable future for water consumption.',
    imageUrl:
        'https://cdn.agclassroom.org/media/uploads/LP821/Green_blue_gray_water.png',
  ),
  BlogTextContent(
    postTitle: 'From Field to Fork: Navigating Water Footprint in Agriculture',
    thumbnailContent:
        'Delve into the water-intensive world of agriculture! Discover its impact & sustainable solutions.',
    postContent:
        'Agriculture plays a significant role in water usage:\n\n- **Irrigation Practices**: Optimize irrigation techniques to minimize water wastage.\n\n- **Crop Selection**: Choose drought-resistant crops to conserve water resources.\n\n- **Sustainable Farming**: Implement practices like crop rotation & soil conservation.\n\nUnderstanding these factors is crucial for mitigating agriculture\'s water footprint and ensuring sustainable food production.',
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQRfGgv08exN-rmoz0rbeguSYWQsup7fcsYMw&usqp=CAU',
  ),
  BlogTextContent(
    postTitle: 'Navigating Global Trade: The Virtual Water Phenomenon',
    thumbnailContent:
        'Uncover the hidden water costs in global trade! Explore virtual water & its implications.',
    postContent:
        'Global trade involves more than goods; it also transfers water:\n\n- **Virtual Water**: Understand the water footprint embedded in products traded internationally.\n\n- **Supply Chain Analysis**: Assess water usage throughout the production process.\n\n- **Water Equity**: Address disparities in water access and consumption across nations.\n\nRecognizing virtual water\'s role is essential for sustainable trade practices and equitable resource management.',
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQFc-mM-t1zVaN6l4mK-b-YUIU5PjK0hnBLJQ&usqp=CAU',
  ),
  BlogTextContent(
    postTitle: 'Corporate Stewardship: Responsibility in Water Conservation',
    thumbnailContent:
        'Unlock corporate strategies for water conservation! Explore initiatives & sustainable practices.',
    postContent:
        'Businesses wield influence in water conservation:\n\n- **Efficiency Measures**: Implement water-saving technologies in operations.\n\n- **Stakeholder Engagement**: Collaborate with communities to manage water resources responsibly.\n\n- **Transparency & Accountability**: Report water usage and conservation efforts.\n\nBy embracing corporate stewardship, companies can contribute to water sustainability and foster positive environmental impacts.',
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTlezMQibwls2HFFKn9I4vSggS1PmCTIlU1DVxBfVwrkp6hjK7PDt1lUtRZE4fTPZktUNg&usqp=CAU',
  ),
];