
class CategoryModel {
  final String id;
  final String name;
  final String imageUrl;
  final int productsCount;

  CategoryModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.productsCount,
  });
}

List<CategoryModel> dummyCategories = [
  CategoryModel(
    id: "1",
    name: "New Arrivals",
    imageUrl: "assets/images/new_arrival.jpg",
    productsCount: 200,
  ),
  CategoryModel(
    id: "2",
    name: "Clothes",
    imageUrl: "assets/images/clothes.jpg",
    productsCount: 150,
  ),
  CategoryModel(
    id: "3",
    name: "Electronics",
    imageUrl: "assets/images/electronic.jpg",
    productsCount: 100,
  ),
  CategoryModel(
    id: "4",
    name: "Shoes",
    imageUrl: "assets/images/shoes.jpg",
    productsCount: 120,
  ),
  CategoryModel(
    id: "5",
    name: "Bags",
    imageUrl: "assets/images/bag.jpg",
    productsCount: 80,
  ),
  CategoryModel(
    id: "6",
    name: "groceries",
    imageUrl: "assets/images/grossery.jpg",
    productsCount: 60,
  ),
];
