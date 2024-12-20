import 'package:flutter/material.dart';
import 'package:heritage_app/data/more_feature/more_feature_data.dart';

class MoreFeatureScreen extends StatelessWidget {
  const MoreFeatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "HERITAGE APP",
          style: TextStyle(
            fontFamily: 'Georgia',
            fontSize: 20,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.5,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        elevation: 5,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(26),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 30, // Spacing between rows
          crossAxisSpacing: 26, // Spacing between columns
        ),
        itemBuilder: (ctx, idx) => GestureDetector(
          onTap: (){},
          child: Card(
            // color: const Color(0xFFC9C8CD), // Applied #C9C8CD as card color
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  features[idx]['icon'] as IconData,
                  size: 50,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 9),
                  child: Text(
                    features[idx]['name'] as String,
                    textAlign: TextAlign.center, // Center the text
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 2, // Ensures text stays within 2 lines
                    softWrap: true,
                  ),
                ),
              ],
            ),
          ),
        ),
        itemCount: features.length,
      ),
    );
  }
}