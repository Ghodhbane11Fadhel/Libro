import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:libro_proj/views/widgets/carree.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class BlogPage extends StatefulWidget {
  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  @override
  final List<String> imagesList = [
    'images/icons/demonss.png',
    'images/icons/demons.png',
    'images/icons/stranger.png',
    'images/icons/war.png'
  ];
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color(0xffe5ecf5),
          body: Column(
            children: [
              buildSlider(),
              buildFloatingSearchBar(),
              search_items('name', 'images/icons/demons.png', '4.5', 'Name'),
              search_items('name', 'images/icons/demons.png', '4.5', 'Name'),
            ],
          )

          ),
    );
  }

  Widget buildSlider() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
          child: Material(
              borderRadius: BorderRadius.circular(10),
              elevation: 10,
              shadowColor: const Color(0xff3f457b),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "Your books",
                      style: TextStyle(
                          color: Color(0xFF3F457B),
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Pacifico"),
                    ),
                  ),
                  CarouselSlider(
                    options: CarouselOptions(
                      viewportFraction: 0.6,
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 100),
                      autoPlay: true,
                      enlargeCenterPage: true,
                    ),
                    items: imagesList
                        .map(
                          (item) => Center(
                            child: Image.asset(
                              item,
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ],
              )),
        ),
      ],
    );
  }

  Widget buildFloatingSearchBar() {
    //final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return Material(
      borderRadius: BorderRadius.circular(10),
      elevation: 10,
      shadowColor: const Color(0xff3f457b),
      child: Container(
          height: MediaQuery.of(context).size.height * 0.09,
          child: FloatingSearchBar(
            hint: 'Tap here to search for posts',
            scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
            transitionDuration: const Duration(milliseconds: 800),
            transitionCurve: Curves.easeInOut,
            physics: const BouncingScrollPhysics(),
            //axisAlignment: isPortrait ? 0.0 : -1.0,
            openAxisAlignment: 0.0,
            //width: isPortrait ? 600 : 500,
            debounceDelay: const Duration(milliseconds: 500),
            onQueryChanged: (query) {},

            transition: CircularFloatingSearchBarTransition(),
            actions: [
              FloatingSearchBarAction(
                showIfOpened: false,
                child: CircularButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {},
                ),
              ),
              FloatingSearchBarAction.searchToClear(
                showIfClosed: false,
              ),
            ],
            builder: (context, transition) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Material(
                  color: Colors.white,
                  elevation: 4.0,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: Colors.accents.map((color) {
                      return Container(height: 112, color: color);
                    }).toList(),
                  ),
                ),
              );
            },
          )),
    );
  }
}
