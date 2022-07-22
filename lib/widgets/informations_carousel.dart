import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class InformationsCarousel extends StatefulWidget {
  const InformationsCarousel({Key? key}) : super(key: key);

  @override
  State<InformationsCarousel> createState() => _InformationsCarouselState();
}

class _InformationsCarouselState extends State<InformationsCarousel> {
  int _current = 0;

  final List<String> _imgList = [
    "assets/images/travel_p.jpg",
    "assets/images/documents.jpg",
    "assets/images/Travel-tips-Hong-Kong.jpg"
  ];

  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {

    final List<Widget> imageSliders = _imgList.map((item) => Container(
      child: Container(
        margin: const EdgeInsets.only(right: 15.0),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                item,
                fit: BoxFit.cover,
                width: 1000.0,
              ),
            ),
            Positioned(
              top: 20,
                right: 15,
                child: Container(
                  alignment: Alignment.center,
                  width: 120.0,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 9),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(30)
                  ),
                  child: const Text("Preparation", style: TextStyle(fontSize: 13, color: Colors.white ),),
                )
            )
          ],
        ),
      ),
    )).toList();

    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.only(left: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:  [
              const Text("Useful Informations",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold
              ),),
              Padding(
                  padding: const EdgeInsets.only(right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: _imgList.map((img) {
                    int index = _imgList.indexOf(img);
                    return Container(
                      height: 8,
                      width: _current == index ? 23.0 : 8.0,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
                      decoration: BoxDecoration(
                        color: _current == index
                            ? Theme.of(context).primaryColor
                            : Theme.of(context).primaryColor.withOpacity(0.4),
                        shape: _current == index
                          ? BoxShape.rectangle
                            : BoxShape.circle,
                        borderRadius: _current == index
                          ? BorderRadius.circular(20.0)
                            : null
                      ),
                    );
                  }).toList(),
                ),
              )
            ],
          ),
        ),

        const SizedBox(height: 30,),
        
        CarouselSlider(
            items: imageSliders,
            carouselController: _controller,
            options: CarouselOptions(
              aspectRatio: 2.0,
              enlargeCenterPage: false,
              scrollPhysics: const BouncingScrollPhysics(),
              enableInfiniteScroll: false,
              viewportFraction: 0.9,
              onPageChanged: (index, reason){
                setState((){
                  _current = index;
                });
              }
            )
        )

      ],
    );
  }
}
