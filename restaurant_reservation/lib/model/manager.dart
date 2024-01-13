class Manager {
  final String id;
  final String username;
  final String password;
  final String restName;
  final String restId; // Reference to the corresponding restaurant

  Manager({
    required this.id,
    required this.username,
    required this.password,
    required this.restName,
    required this.restId,
  });
}
