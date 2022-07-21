class Activity {
  final String image;
  final String name;
  final String location;
  final String description;
  final int price;
  final double rating;
  final int duration;
  final int reviews;
  bool isMarked;

  Activity({
    required this.image,
    required this.name,
    required this.location,
    required this.description,
    required this.price,
    required this.rating,
    required this.duration,
    required this.reviews,
    required this.isMarked
  });
}

List<Activity> activities = [
  Activity(
    image: "assets/images/kayaking.jpg",
    name: "Kayaking at the village Gudvangen",
    location: "Norway",
    price: 169,
    rating: 5.0,
    reviews: 500,
    duration: 4,
    isMarked: false,
    description:
    "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum",
  ),
  Activity(
    image: "assets/images/sedona_ufo.jpg",
    name: "Sedona Ufo Night Tour for the whole family",
    location: "Sedona, USA",
    price: 110,
    rating: 4.3,
    reviews: 300,
    duration: 2,
    isMarked: false,
    description:
    "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum",
  ),
  Activity(
    image: "assets/images/canyon.jpeg",
    name: "Breathtaking Antelope Canyon Tour",
    location: "Canyon, USA",
    price: 158,
    rating: 5.0,
    reviews: 472,
    duration: 3,
    isMarked: false,
    description:
    "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum",
  ),
];