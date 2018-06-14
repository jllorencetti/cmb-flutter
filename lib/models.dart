class Pet {
  final String name;
  final String description;
  final String profilePicUrl;
  final String thumbPicUrl;
  final String status;
  final String city;

  const Pet(
      {this.name,
      this.description,
      this.profilePicUrl,
      this.status,
      this.city,
      this.thumbPicUrl});

  factory Pet.fromJson(Map<String, dynamic> json) {
    return Pet(
      name: json['name'],
      description: json['description'],
      profilePicUrl: json['profile_picture'],
      thumbPicUrl: json['thumb_picture'],
      status: json['status'],
      city: json['city']['name'],
    );
  }
}
