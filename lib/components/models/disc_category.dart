class DiscCategory {
  String name;
  int year;
  String description;
  String imageUrl;

  DiscCategory(this.name, this.year, this.description, this.imageUrl);
}

List<DiscCategory> categories = [
  DiscCategory(
    'Mayhem',
    1987,
    'Though influential to black metal, its lyrics and sound were largely influenced by thrash metal bands. After vocalist Dead joined the group, the band adopted darker lyrical topics and guitarist Euronymous (Øystein Aarseth) started rejecting most other metal bands as their lyrics turned towards "social awareness"[3] and "normal" topics[4] instead of death worship;[3] he "wanted things to be more serious and extreme".[4] Dead stated that the lyrics.',
    'assets/categories/mayhem.jpg',
  ),
  // FoodCategory('Dessert', 16, 'assets/categories/dessert.png'),
  // FoodCategory('Vegetarian', 20, 'assets/categories/vegetarian.png'),
  // FoodCategory('Burger', 21, 'assets/categories/burger.png'),
  // FoodCategory('Asian', 16, 'assets/categories/asian.png'),
  // FoodCategory('Italian', 18, 'assets/categories/italian.png'),
  // FoodCategory('Mexican', 15, 'assets/categories/mexican.png'),
  // FoodCategory('Seafood', 14, 'assets/categories/seafood.png'),
  // FoodCategory('Pizza', 19, 'assets/categories/pizza.png'),
  // FoodCategory('Sushi', 15, 'assets/categories/sushi.png'),
  // FoodCategory('Coffee', 22, 'assets/categories/coffee.png'),
  // FoodCategory('Fast Food', 23, 'assets/categories/fast_food.png'),
  // FoodCategory('Salad', 18, 'assets/categories/salad.png'),
];
