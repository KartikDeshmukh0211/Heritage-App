import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.item});
  final Map<String, String> item;

  static const List<String> sampleImages = [
    // 'https://img.freepik.com/free-photo/lovely-woman-vintage-outfit-expressing-interest-outdoor-shot-glamorous-happy-girl-sunglasses_197531-11312.jpg',
    // 'https://img.freepik.com/free-photo/shapely-woman-vintage-dress-touching-her-glasses-outdoor-shot-interested-relaxed-girl-brown-outfit_197531-11308.jpg',
    // 'https://img.freepik.com/premium-photo/cheerful-lady-brown-outfit-looking-around-outdoor-portrait-fashionable-caucasian-model-with-short-wavy-hairstyle_197531-25791.jpg',
    'lib/data/shopping/images/image1.png',
    'lib/data/shopping/images/image2.png',
    'lib/data/shopping/images/image3.png',
    'lib/data/shopping/images/image4.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFD9EAD3),
        elevation: 0,
        // leading: IconButton(
        //   icon: const Icon(Icons.arrow_back, color: Colors.black),
        //   onPressed: () {},
        // ),
        title: const Text(
          "Shop with us!",
          style: TextStyle(
            fontFamily: 'Georgia',
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logo_dev_outlined, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FanCarouselImageSlider.sliderType1(
              imagesLink: sampleImages,
              isAssets: true,
              autoPlay: true,
              sliderHeight: 400,
              showIndicator: true,
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    // height: 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['name']!,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          "Traditional with indian look",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),
                  ),
                  Text(
                    item['price']!,
                    style: const TextStyle(
                      fontSize: 23,
                      color: Colors.green,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
            ),
            RatingBar(
              filledIcon: Icons.star,
              emptyIcon: Icons.star_border,
              onRatingChanged: (value) => debugPrint('$value'),
              initialRating: 1,
              maxRating: 5,
              alignment: Alignment.center,
              size: 22,
            ),
            const SizedBox(height: 14),
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor datat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Curabitur pretium tincidunt lacus. Nulla gravida orci a odio. Nullam varius turpis et commodo. Vestibulum lectus mauris, luctus a, mattis ac, tincidunt id.',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16, right: 16, left: 16),
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 40, // Adjust the height
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 59, 191, 125),
                          foregroundColor: Colors.white, // Text color
                          shadowColor: const Color.fromARGB(255, 201, 248, 204),
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "Buy Now",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ), // Adjust text size if needed
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
