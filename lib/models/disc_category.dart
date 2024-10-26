class DiscCategory {
  String name;
  int year;
  String imageUrl;

  DiscCategory(
    this.name,
    this.year,
    // this.description,
    this.imageUrl,
  );
}

List<DiscCategory> categories = [
  DiscCategory(
    'Mayhem',
    1987,
    'assets/categories/mayhem.jpg',
  ),
  DiscCategory(
    'Dessert',
    16,
    'assets/categories/dessert.png',
  ),
  DiscCategory(
    'Vegetarian',
    20,
    'assets/categories/vegetarian.png',
  ),
  DiscCategory(
    'Burger',
    21,
    'assets/categories/burger.png',
  ),
  DiscCategory(
    'Asian',
    16,
    'assets/categories/asian.png',
  ),
  DiscCategory(
    'Italian',
    18,
    'assets/categories/italian.png',
  ),
  DiscCategory(
    'Mexican',
    15,
    'assets/categories/mexican.png',
  ),
  DiscCategory(
    'Seafood',
    14,
    'assets/categories/seafood.png',
  ),
  DiscCategory(
    'Pizza',
    19,
    'assets/categories/pizza.png',
  ),
  DiscCategory(
    'Sushi',
    15,
    'assets/categories/sushi.png',
  ),
  DiscCategory(
    'Coffee',
    22,
    'assets/categories/coffee.png',
  ),
  DiscCategory(
    'Fast Food',
    23,
    'assets/categories/fast_food.png',
  ),
  DiscCategory(
    'Salad',
    18,
    'assets/categories/salad.png',
  ),
];
