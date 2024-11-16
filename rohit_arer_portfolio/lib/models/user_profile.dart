class UserProfile {
  final String id;
  final String name;
  final String bio;
  final String profileImageUrl;
  final String email;
  final String linkedInUrl;
  final String githubUrl;
  final String twitterUrl;

  UserProfile({
    required this.id,
    required this.name,
    required this.bio,
    required this.profileImageUrl,
    required this.email,
    this.linkedInUrl = '',
    this.githubUrl = '',
    this.twitterUrl = '',
  });

  // Factory method to create a UserProfile from a Firestore document
  factory UserProfile.fromFirestore(Map<String, dynamic> data, String id) {
    return UserProfile(
      id: id,
      name: data['name'] ?? '',
      bio: data['bio'] ?? '',
      profileImageUrl: data['profileImageUrl'] ?? '',
      email: data['email'] ?? '',
      linkedInUrl: data['linkedInUrl'] ?? '',
      githubUrl: data['githubUrl'] ?? '',
      twitterUrl: data['twitterUrl'] ?? '',
    );
  }

  // Method to convert a UserProfile to a Firestore-compatible map
  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'bio': bio,
      'profileImageUrl': profileImageUrl,
      'email': email,
      'linkedInUrl': linkedInUrl,
      'githubUrl': githubUrl,
      'twitterUrl': twitterUrl,
    };
  }
}
