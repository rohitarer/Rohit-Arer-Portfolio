class FirebasePaths {
  // Collection paths
  static const String usersCollection = 'users';
  static const String projectsCollection = 'projects';
  static const String contactMessagesCollection = 'contactMessages';

  // Document paths for a specific user (e.g., user data, portfolio items)
  static String userDocument(String userId) => '$usersCollection/$userId';
  static String userProjectsCollection(String userId) =>
      '${userDocument(userId)}/$projectsCollection';

  // Document path for a specific project in the main projects collection
  static String projectDocument(String projectId) =>
      '$projectsCollection/$projectId';

  // Document path for storing contact messages
  static String contactMessageDocument(String messageId) =>
      '$contactMessagesCollection/$messageId';
}
