
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
    postTitle:
        'Understanding Your Water Footprint: How Your Daily Choices Impact the Environment',
    thumbnailContent: 'Discover how small actions affect global water usage!',
    postContent:
        '1. Water footprint refers to the total volume of freshwater used directly or indirectly to produce goods and services.\n \n2. It encompasses both the water consumed (withdrawn and not returned to its source) and the water polluted during production.\n \n3. Everyday activities such as showering, doing laundry, and eating contribute to your water footprint.\n \n4. Consuming meat and dairy products typically has a higher water footprint compared to plant-based foods.\n \n5. Manufacturing processes, agriculture, and energy production also significantly contribute to water footprints.\n \n6. By being mindful of water usage and making sustainable choices, individuals can reduce their water footprints and contribute to environmental conservation efforts.\n \n7. Understanding your water footprint empowers you to make informed decisions that promote water conservation and protect our planet’s precious resources.',
    imageUrl: 'assets/blog1.png',
  ),
  BlogTextContent(
    postTitle:
        'The Hidden Water Costs: Unveiling the Impact of Everyday Products on Global Water Resources',
    thumbnailContent:
        'Unlock the secrets behind the water footprint of your purchases!',
    postContent:
        '1. Many products we use daily have a significant water footprint, often unbeknownst to consumers.\n \n2. From clothing to electronics, understanding the water footprint of products can highlight their environmental impact.\n \n3. Cotton, for example, requires vast amounts of water for cultivation, dyeing, and processing.\n \n4. Electronics production involves water-intensive processes like semiconductor manufacturing and circuit board assembly.\n \n5. By choosing products with lower water footprints or opting for recycled and eco-friendly alternatives, consumers can reduce their overall impact.\n \n6. Awareness of hidden water costs encourages responsible consumption and supports sustainable production practices.\n \n7. Together, we can mitigate the strain on global water resources and move towards a more water-conscious society.',
    imageUrl: 'assets/blog2.png',
  ),
  BlogTextContent(
    postTitle:
        'Calculating Your Water Footprint: Tools and Tips for Understanding Personal Water Usage',
    thumbnailContent:
        'Empower yourself with knowledge to track and manage water consumption!',
    postContent:
        '1. Various online calculators and tools are available to help individuals estimate their water footprints.\n \n2. These tools consider factors such as household size, dietary choices, energy usage, and water-saving behaviors.\n \n3. Tracking your water footprint can reveal areas where you can make changes to reduce consumption.\n \n4. Simple actions like fixing leaks, installing water-efficient appliances, and practicing mindful water usage in daily activities can make a big difference.\n \n5. Engaging in water-saving practices not only conserves resources but also lowers utility bills.\n \n6. Educating yourself and others about water footprints fosters a culture of environmental responsibility.\n \n7. By taking steps to monitor and reduce personal water footprints, individuals contribute to global sustainability efforts and protect freshwater ecosystems.',
    imageUrl: 'assets/blog3.png',
  ),
  BlogTextContent(
    postTitle:
        'The Role of Agriculture in Water Footprint: Balancing Food Production with Resource Conservation',
    thumbnailContent:
        'Explore the delicate balance between farming and water conservation!',
    postContent:
        '1. Agriculture is a major contributor to global water footprints, accounting for a significant portion of freshwater usage.\n \n2. Irrigation practices, crop selection, and farming techniques influence the water footprint of agricultural products.\n \n3. Crops like rice and almonds have particularly high water requirements compared to others.\n \n4. Sustainable agricultural practices such as drip irrigation, crop rotation, and soil conservation help minimize water usage.\n \n5. Efficient water management on farms is crucial for balancing food production with environmental sustainability.\n \n6. Consumer awareness and support for sustainable farming practices encourage the adoption of water-saving techniques.\n \n7. By promoting responsible agriculture, we can ensure food security while safeguarding water resources for future generations.',
    imageUrl: 'assets/blog4.png',
  ),
  BlogTextContent(
    postTitle:
        'Measuring Corporate Water Footprints: Assessing Business Impact and Promoting Accountability',
    thumbnailContent: 'Hold businesses accountable for their water usage!',
    postContent:
        '1. Corporations have a significant impact on water resources through their operations and supply chains.\n \n2. Measuring and disclosing water footprints allows businesses to assess their environmental impact and identify areas for improvement.\n \n3. Implementing water-saving technologies and sustainable practices can reduce corporate water footprints.\n \n4. Stakeholder pressure and regulatory requirements play a crucial role in encouraging corporate transparency and accountability.\n \n5. Collaboration among businesses, governments, and NGOs is essential for addressing water-related challenges.\n \n6. Investing in water stewardship initiatives and community engagement helps companies mitigate risks and enhance their reputation.\n \n7. By holding corporations accountable for their water footprints, we can promote responsible business practices and protect precious water resources.',
    imageUrl: 'assets/blog5.png',
  ),
  BlogTextContent(
    postTitle:
        'The Water-Energy Nexus: Understanding the Interplay Between Water Usage and Energy Production',
    thumbnailContent:
        'Explore the intricate relationship between water and energy!',
    postContent:
        '1. Energy production relies heavily on water for extraction, processing, and power generation.\n \n2. Conversely, water distribution and treatment require significant energy inputs.\n \n3. The interdependence of water and energy systems creates challenges and opportunities for resource management.\n \n4. Adopting renewable energy sources can reduce both water and energy footprints, promoting sustainability.\n \n5. Innovations in water-efficient technologies and practices help minimize the environmental impact of energy production.\n \n6. Addressing the water-energy nexus requires holistic approaches that consider the interconnectedness of these vital resources.\n \n7. By optimizing water and energy usage, we can achieve greater efficiency and resilience in our infrastructure.',
    imageUrl: 'assets/blog6.png',
  ),
  BlogTextContent(
    postTitle:
        'From Awareness to Action: Mobilizing Communities to Address Water Footprint Challenges',
    thumbnailContent: 'Join the movement for sustainable water usage!',
    postContent:
        '1. Building awareness about water footprints is the first step towards meaningful action.\n \n2. Community engagement and collaboration are essential for addressing water footprint challenges effectively.\n \n3. Local initiatives like water conservation campaigns, educational programs, and policy advocacy can make a significant impact.\n \n4. Encouraging businesses and industries to adopt sustainable practices helps reduce collective water footprints.\n \n5. Empowering communities to manage water resources responsibly fosters resilience in the face of climate change.\n \n6. By uniting individuals, organizations, and governments, we can create positive change and ensure water security for all.\n \n7. Let\'s work together to build a future where clean water is abundant and accessible to everyone.',
    imageUrl: 'assets/blog7.png',
  ),
  BlogTextContent(
    postTitle:
        'The Ripple Effect: Exploring the Global Implications of Individual Water Footprints',
    thumbnailContent: 'See how your actions send ripples across the globe!',
    postContent:
        '1. Every action that involves water usage has a ripple effect, impacting ecosystems near and far.\n \n2. Water footprints are interconnected, with local decisions affecting water availability and quality globally.\n \n3. Depleting freshwater sources and pollution from agricultural runoff and industrial processes have far-reaching consequences.\n \n4. By reducing personal water footprints, individuals contribute to the preservation of water resources worldwide.\n \n5. Collective efforts to conserve water can mitigate the effects of water scarcity and environmental degradation.\n \n6. Awareness of the interconnectedness of water footprints fosters a sense of responsibility for global water stewardship.\n \n7. Together, we can create positive ripples by making conscious choices that prioritize water conservation and sustainability.',
    imageUrl: 'assets/blog8.png',
  ),
  BlogTextContent(
    postTitle:
        'Water Footprint Reduction: Practical Strategies for Minimizing Your Environmental Impact',
    thumbnailContent: 'Discover easy ways to shrink your water footprint!',
    postContent:
        '1. Start by identifying areas where you use the most water, such as showering, laundry, and irrigation.\n \n2. Install water-saving devices like low-flow showerheads, faucet aerators, and efficient irrigation systems.\n \n3. Practice mindful consumption by only using what you need and avoiding water waste.\n \n4. Choose products with minimal water footprints, such as locally sourced foods and eco-friendly goods.\n \n5. Support companies and brands that prioritize water conservation and sustainable practices.\n \n6. Educate others about the importance of reducing water footprints and encourage collective action.\n \n7. Small changes in daily habits can add up to significant water savings and benefit the planet.',
    imageUrl: 'assets/blog9.png',
  ),
];