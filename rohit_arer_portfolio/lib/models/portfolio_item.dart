class PortfolioItem {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final String projectLink;

  PortfolioItem({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.projectLink,
  });

  // Factory method to create a PortfolioItem from a Firestore document
  factory PortfolioItem.fromFirestore(Map<String, dynamic> data, String id) {
    return PortfolioItem(
      id: id,
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      imageUrl: data['imageUrl'] ?? '',
      projectLink: data['projectLink'] ?? '',
    );
  }

  // Method to convert a PortfolioItem to a Firestore-compatible map
  Map<String, dynamic> toFirestore() {
    return {
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'projectLink': projectLink,
    };
  }
}
