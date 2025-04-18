class Category {
  final String category;
  final String description;
  final String image;

  const Category({
    required this.category,
    required this.description,
    required this.image,
  });

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      category: map['strCategory'] ?? '',
      description: map['strCategoryDescription'] ?? '',
      image: map['strCategoryThumb'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'strCategory': category,
      'strCategoryDescription': description,
      'strCategoryThumb': image,
    };
  }

  Category copyWith({
    String? category,
    String? description,
    String? image,
  }) {
    return Category(
      category: category ?? this.category,
      description: description ?? this.description,
      image: image ?? this.image,
    );
  }

  @override
  String toString() =>
      'Category(category: $category, description: $description, image: $image)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Category &&
        other.category == category &&
        other.description == description &&
        other.image == image;
  }

  @override
  int get hashCode => category.hashCode ^ description.hashCode ^ image.hashCode;
}
