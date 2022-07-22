import 'package:app_travel_ui/widgets/adentures_carousel.dart';
import 'package:app_travel_ui/widgets/circle_tab_indicator.dart';
import 'package:app_travel_ui/widgets/destination_carousel.dart';
import 'package:app_travel_ui/widgets/informations_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  bool clickedFAB = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainPage(clicked_fab: clickedFAB,),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: FloatingActionButton(
            onPressed: (){
              setState((){
                clickedFAB = !clickedFAB;
              });
            },
          tooltip: 'Location',
          elevation: 10.0,
          backgroundColor: Colors.white,
          child: Icon(
            Icons.compass_calibration_sharp,
            color: Theme.of(context).primaryColor,
            size: 22,
          ),
        ),
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({
    required this.clicked_fab,
    Key? key,
  }) : super(key: key);

  final bool clicked_fab;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
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
                    const Text(
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
              const SizedBox(height: 20.0,),
              const InformationsCarousel(),
              const SizedBox(height: 30,),
            ],
          ),
        ),
        Align(
          alignment: FractionalOffset.bottomCenter,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            height: widget.clicked_fab ? MediaQuery.of(context).size.height : 10.0,
            width: widget.clicked_fab ? MediaQuery.of(context).size.width : 10.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(widget.clicked_fab ? 0.0 : 300),
              color: Theme.of(context).primaryColor
            ),
          ),
        ),
        _bottomBar()
      ],
    );
  }

  _updateTabSelection(int index){
    setState((){
      selectedTab = index;
    });
  }

  _bottomBar() {
    return Positioned(
      bottom: 0.0,
        left: 0.0,
        right: 0.0,
        child: Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          height: 60.0,
          decoration:  BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20)
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black12.withOpacity(0.1),
                offset: const Offset(0, -2),
                blurRadius: 10.0,
                spreadRadius: 2.0
              )
            ],
            color: Colors.white,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: (){
                    _updateTabSelection(0);
                  },
                  icon: Icon(
                      Icons.home,
                    color: selectedTab == 0
                    ? Theme.of(context).primaryColor
                        : Theme.of(context).accentColor,
                  )
              ),
              IconButton(
                  onPressed: (){
                    _updateTabSelection(1);
                  },
                  icon: Icon(
                      Icons.notifications,
                    color: selectedTab == 1
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).accentColor,
                  )
              ),

              SizedBox(width: 50.0,),
              IconButton(
                  onPressed: (){
                    _updateTabSelection(2);
                  },
                  icon: Icon(
                      Icons.bookmark,
                    color: selectedTab == 2
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).accentColor,
                  )
              ),
              IconButton(
                  onPressed: (){
                    _updateTabSelection(3);
                  },
                  icon: Icon(
                      Icons.person,
                    color: selectedTab == 3
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).accentColor,
                  )
              ),
            ],
          ),
        )
    );
  }
}
