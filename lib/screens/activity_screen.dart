import 'package:app_travel_ui/models/activity_model.dart';
import 'package:app_travel_ui/screens/home_screen.dart';
import 'package:app_travel_ui/widgets/circle_tab_indicator.dart';
import 'package:flutter/material.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({Key? key, required this.activity}) : super(key: key);

  final Activity activity;

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 80,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),

          child: RaisedButton(
            onPressed: (){},
            textColor: Colors.white,
            color: Theme.of(context).primaryColor,
            child: Text("Book now"),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 700.0,
                        child: ClipRRect(
                          child: Image(
                            image: AssetImage(widget.activity.image),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 50),
                        child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              color: Colors.white,
                                onPressed: (){
                                //Navigator.pop(context);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => HomeScreen())
                                  );
                                },
                                icon: const Icon(Icons.arrow_back_ios)
                            ),

                            IconButton(
                              color: Colors.white,
                                icon: const Icon(Icons.more_vert),
                                onPressed: (){},
                            )
                          ],
                        ),
                      ),

                      Positioned(
                        top: 400,
                          child: Container(
                            height: 500,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                begin: FractionalOffset.bottomCenter,
                                end: FractionalOffset.topCenter,
                                colors: [
                                  Colors.black.withOpacity(0.8),
                                  Colors.black87.withOpacity(0.7),
                                  Colors.black54.withOpacity(0.6),
                                  Colors.black38.withOpacity(0.1),
                                ],
                                stops: const [0.2, 0.4, 0.6, 0.9],
                              )
                            ),
                          )
                      ),

                      Positioned(
                        top: 400,
                          left: 15,
                          right: 15,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                  child: Text(
                                    widget.activity.name,
                                    style: const TextStyle(
                                      fontSize: 35.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 1.2
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,
                                  )
                              ),
                              SizedBox(width: 20,),
                              Column(
                                children: [
                                  Text(
                                    "⭐ ${widget.activity.rating}",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w500
                                    ),
                                  ),
                                  const SizedBox(height: 10,),
                                  Text(
                                    "⭐ ${widget.activity.reviews} reviews",
                                    style: TextStyle(
                                        color: Colors.grey[200],
                                        fontSize: 15,
                                    ),
                                  )
                                ],
                              )
                            ],
                          )
                      ),

                      Container(
                        margin: EdgeInsets.only(top: 590),
                        padding: EdgeInsets.only(top: 30),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            topLeft: Radius.circular(30)
                          ),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 5.0, right: 180.0),
                              child: DefaultTabController(
                                length: 2,
                                child: TabBar(
                                  labelColor: Theme.of(context).primaryColor,
                                  unselectedLabelColor: Theme.of(context).accentColor,
                                  indicator: CircleTabIndicator(color: Theme.of(context).primaryColor, radius: 3.0),
                                  isScrollable: true,
                                  tabs: const [
                                    Tab(
                                      child: Text(
                                        "Overview",
                                        style: TextStyle(fontSize: 18.0),
                                      ),
                                    ),

                                    Tab(
                                      child: Text(
                                        "Reviews",
                                        style: TextStyle(fontSize: 18.0),
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ),

                            const SizedBox(height: 20,),

                            Padding(
                                padding: EdgeInsets.only(left: 25, right: 25),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.label,
                                      size: 40,
                                      color: Theme.of(context).primaryColor,
                                      ),

                                      const SizedBox(width: 10,),

                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              "PRICE",
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Theme.of(context).accentColor,
                                            ),
                                          ),

                                          Row(
                                            children: [
                                              Text(
                                                "from",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold
                                                ),
                                              ),

                                              Text(
                                                "\$${widget.activity.price}",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ],
                                  ),

                                  Row(
                                    children: [
                                      Icon(Icons.punch_clock,
                                        size: 40,
                                        color: Theme.of(context).primaryColor,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "DURATION",
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Theme.of(context).accentColor,
                                            ),
                                          ),

                                          Row(
                                            children: [
                                              Text(
                                                "${widget.activity.duration}",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold
                                                ),
                                              ),

                                              Text(
                                                " hours",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold
                                                ) ,
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ],
                                  )

                                ],
                              ),
                            ),

                            const SizedBox(height: 20,),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 25, right: 25, bottom: 30
                              ),
                              child: Text(
                                widget.activity.description,
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            )
                          ],
                        ),
                      ),

                      Positioned(
                        top: 550,
                          right: 25,
                          child: Container(
                            height: 90,
                            width: 90,
                            child: FloatingActionButton(
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.bookmark,
                                size: 40,
                                color: widget.activity.isMarked
                                ? Theme.of(context).primaryColor
                                : Colors.grey[300],
                              ),
                              onPressed: (){
                                setState((){
                                  widget.activity.isMarked = !widget.activity.isMarked;
                                });
                              },
                            ),
                          )
                      )

                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
