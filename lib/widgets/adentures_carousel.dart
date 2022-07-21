import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AdventuresCarousel extends StatelessWidget {
   AdventuresCarousel({Key? key}) : super(key: key);

  List<Map<String, String>> _icons = [
    {
      "image": "assets/icons/kayak.svg",
      "text": "KAYAKING"
    },
    {
      "image": "assets/icons/hot-air-balloon.svg",
      "text": "BALLOONING"
    },
    {
      "image": "assets/icons/mountains.svg",
      "text": "HIKING"
    },
    {
      "image": "assets/icons/snorkel.svg",
      "text": "SNORKELING"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.only(left: 10.0, right: 25.0),
          itemCount: _icons.length,
          itemBuilder: (BuildContext context, int index){
          return Container(
            margin: const EdgeInsets.only(left: 43.0),
            child: Column(
              children: [
                SvgPicture.asset(
                  _icons![index]!["image"]!,
                    //"assets/icons/kayak.svg",
                  width: 35.0,
                  height: 35.0,
                ),
                const SizedBox(height: 15.0 ,),
                Text(
                  _icons![index]!["text"]!,
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Theme.of(context).accentColor,
                    letterSpacing: 0.8,
                  ),
                )
              ],
            ),
          );
          }
      ),
    );
  }
}
