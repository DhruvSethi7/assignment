class UserModel{
  String uid;
  String email;
  String displayName;
  UserModel({required this.email,required this.displayName,required this.uid});
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'] as String,
      displayName: json['displayName'] as String,
      uid: json['uid'] as String,
    );
  }
}