class UserModel {
  String? fullName;
  String? avatarUrl;

  UserModel({
    this.fullName = 'User Name',
    this.avatarUrl,
  });

  UserModel copyWith({String? fullName, String? avatarUrl}) => UserModel(
      fullName: fullName ?? this.fullName,
      avatarUrl: avatarUrl ?? this.avatarUrl);
}
