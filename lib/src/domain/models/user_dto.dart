class UserDto {
  final String id;
  final String email;
  final String name;
  final String username;
  final String birthPlace;
  final String birthDate;
  final String gender;
  final String avatar;
  final String createdAt;
  final String updatedAt;

  const UserDto({
    this.id = '',
    this.email = '',
    this.name = '',
    this.username = '',
    this.birthPlace = '',
    this.birthDate = '',
    this.gender = '',
    this.avatar = '',
    this.createdAt = '',
    this.updatedAt = '',
  });

  @override
  String toString() {
    return 'UserDto{id: $id, email: $email, name: $name, username: $username, birthPlace: $birthPlace, birthDate: $birthDate, gender: $gender, avatar: $avatar, createdAt: $createdAt, updatedAt: $updatedAt}';
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'username': username,
      'birth_place': birthPlace,
      'birth_date': birthDate,
      'gender': gender,
      'avatar': avatar,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  factory UserDto.fromMap(Map<String, dynamic> map) {
    return UserDto(
      id: map['id'] ?? '',
      email: map['email'] ?? '',
      name: map['name'] ?? '',
      username: map['username'] ?? '',
      birthPlace: map['birth_place'] ?? '',
      birthDate: map['birth_date'] ?? '',
      gender: map['gender'] ?? '',
      avatar: map['avatar'] ?? '',
      createdAt: map['created_at'] ?? '',
      updatedAt: map['updated_at'] ?? '',
    );
  }
}
