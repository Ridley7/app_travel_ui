import 'package:app_travel_ui/models/activity_model.dart';
import 'package:flutter/material.dart';

class DestinationCarousel extends StatefulWidget {
  const DestinationCarousel({Key? key}) : super(key: key);

  @override
  State<DestinationCarousel> createState() => _DestinationCarouselState();
}

class _DestinationCarouselState extends State<DestinationCarousel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350.0,
      child: ListView.builder(
        padding: const EdgeInsets.only(left: 5.0, right: 25.0),
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          itemCount: activities.length,
          itemBuilder: (BuildContext context, int index){
            Activity activity = activities[index];
            return Container(
              margin: const EdgeInsets.only(left: 20.0),
              width: 250.0,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image(
                      height: 350.0,
                      width: 250.0,
                      image: AssetImage(activity.image),
                      fit: BoxFit.cover,
                    ),
                  ),

                  Positioned(
                    top: -15.0,
                    right: 10.0,
                    child: IconButton(
                      onPressed: (){
                        setState((){
                          activity.isMarked = !activity.isMarked;
                        });
                      },
                      icon: Icon(
                        Icons.bookmark,
                        size: 40.0,
                        color: activity.isMarked ? Theme.of(context).primaryColor : Colors.white,
                      ),
                    ),
                  ),

                  Positioned(
                    bottom: 0.0,
                      child: Container(
                        height: 140.0,
                        width: 250.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
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
                    left: 20.0,
                      right: 20.0,
                      bottom: 20.0,
                      child: Column(
                        children: [
                          Text(
                            activity.name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18.0  ,
                              fontWeight: FontWeight.w600,
                            ),
                            maxLines: 2,
                          ),
                          const SizedBox(height: 10.0,),
                          Row(
                            children: [
                              const Icon(
                                Icons.location_on,
                                color: Colors.white,
                                size: 15.0,
                              ),
                              const SizedBox(width: 10.0,),
                              Text(
                                activity.location,
                                style: const TextStyle(
                                  color: Colors.white
                                ),
                              )
                            ],
                          )
                        ],
                      )
                  )
                ],
              ),
            );

          }
      ),
    );
  }
}
