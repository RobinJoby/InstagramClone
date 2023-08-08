import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String email;
  final String uid;
  final String photoUrl;
  final String username;
  final String bio;
  final List followers;
  final List following;

  UserModel({
    required this.username,
    required this.uid,
    required this.email,
    required this.bio,
    required this.followers,
    required this.following,
    required this.photoUrl,
  });

  Map<String, dynamic> toJson() => {
        'username': username,
        'uid': uid,
        'email': email,
        'bio': bio,
        'followers': followers,
        'following': following,
        'photoUrl': photoUrl,
      };

  static UserModel fromSnap(DocumentSnapshot snap) {
    final data = snap.data() as Map<String, dynamic>;

    return UserModel(
      username: data['username'],
      uid: data['uid'],
      email: data['email'],
      bio: data['bio'],
      followers: data['followers'],
      following: data['following'],
      photoUrl: data['photoUrl'],
    );
  }
}
