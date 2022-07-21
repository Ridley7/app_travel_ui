import 'package:app_travel_ui/widgets/adentures_carousel.dart';
import 'package:app_travel_ui/widgets/circle_tab_indicator.dart';
import 'package:app_travel_ui/widgets/destination_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 10.0, top: 70.0, right: 25.0),
              height: 50.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset("assets/icons/menu.svg"),
                  InkWell(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: const Image(
                        image: AssetImage("assets/images/theodore.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const Padding(
                padding:  EdgeInsets.fromLTRB(25.0, 20.0, 15.0, 15.0),
              child: Text(
                "Discover",
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(left: 10.0, right: 30.0),
              child: DefaultTabController(
                length: 3,
                  child: TabBar(
                    labelColor: Theme.of(context).primaryColor,
                    unselectedLabelColor: Theme.of(context).accentColor,
                    indicator: CircleTabIndicator(color: Theme.of(context).primaryColor, radius: 3.0),
                    isScrollable: true,
                    tabs: const [
                      Tab(
                        child: Text(
                          "Experiences",
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ),

                      Tab(
                        child: Text(
                          "Sights",
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ),

                      Tab(
                        child: Text(
                          "Housings",
                          style: TextStyle(fontSize: 18.0),
                        ),
                      )
                    ],
                  ),
              ),
            ),
            const SizedBox(height: 30.0,),
            const DestinationCarousel(),
            const SizedBox(height: 30.0,),
            Padding(
                padding: const EdgeInsets.only(left: 25.0, right: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Feeling Adventurous?",
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Text(
                    "Show all",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).accentColor
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30.0,),
            AdventuresCarousel(),

          ],
        )
      ],
    );
  }
}
