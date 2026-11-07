class HomeCarouselItemModel {
  final String imgUrl;
  final String id ;
  HomeCarouselItemModel({
    required this.imgUrl,
    required this.id,
  });
}

List<HomeCarouselItemModel> dummyCarouselItems = [
HomeCarouselItemModel(
    id: '1',
    imgUrl:
        'assets/images/one.jpg',
  ),
  HomeCarouselItemModel(
    id: '2',
    imgUrl:
        'assets/images/two.jpg',
  ),
  HomeCarouselItemModel(
    id: '3',
    imgUrl:
        'assets/images/three.jpg',
  ),
  HomeCarouselItemModel(
    id: '4',
    imgUrl:
        'assets/images/four.jpg',
  ),
];