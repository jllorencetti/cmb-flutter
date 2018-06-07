class Pet {
  final String name;
  final String description;
  final String imageUrl;
  final String status;
  final String city;

  const Pet(
      {this.name, this.description, this.imageUrl, this.status, this.city});

  factory Pet.fromJson(Map<String, dynamic> json) {
    return Pet(
      name: json['name'],
      description: json['description'],
      imageUrl: json['profile_picture'],
      status: json['status'],
      city: json['city']['name'],
    );
  }
}
