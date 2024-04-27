class ImagesModel {
  String? title;
  String? image;
  String? description;
  ImagesModel(
      {required this.title, required this.image, required this.description});
}

List<ImagesModel> imagesModel = [
  ImagesModel(
      image: "assets/image/one.png",
      title: "Express",
      description:
          "Show up as yourself. share what you’re up to, or ask your community for local tips + tricks."),
  ImagesModel(
      image: "assets/image/two.png",
      title: "Discover",
      description:
          "Discover nearby  events, community conversations, or short-term rentals available for your everyday lifestyle"),
  ImagesModel(
      image: "assets/image/three.png",
      title: "Connect",
      description:
          "Connect with your community easily with local in-app transit micro-mobility sharing. Letting you discover the most affordable and accessible options"),
];
