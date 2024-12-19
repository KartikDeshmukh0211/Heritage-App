import 'package:flutter/material.dart';
import 'package:heritage_app/widget/drawers/button.dart';
import 'package:heritage_app/data/homescreen/drawer/buttons_data.dart';

class HomeScreenDrawer extends StatelessWidget {
  HomeScreenDrawer({super.key});

  final List<Button> allButtons = butt.entries.map((ele) {
    return Button(icon: ele.value, name: ele.key);
  }).toList();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Kartik Deshmukh"),
            accountEmail: Text("kartikdeshmukh58@gmail.com"),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  'https://image.lexica.art/full_jpg/19f280a2-2b97-4be2-b782-1fd5c70b84f4',
                  width: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: const BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                image: NetworkImage(
                    'https://img.freepik.com/free-vector/copy-space-bokeh-spring-lights-background_52683-55649.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true, // Prevents infinite height issue
            physics:
                const NeverScrollableScrollPhysics(), // Disable scrolling for the inner ListView
            itemCount: allButtons.length,
            itemBuilder: (ctx, idx) => allButtons[idx],
          ),
        ],
      ),
    );
  }
}
