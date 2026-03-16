class AdminUser {
  const AdminUser({
    required this.uid,
    required this.email,
    required this.name,
    required this.resumeCount,
    required this.joinedAt,
    required this.isBlocked,
  });

  final String uid;
  final String email;
  final String name;
  final int resumeCount;
  final DateTime joinedAt;
  final bool isBlocked;

  AdminUser copyWith({
    String? uid,
    String? email,
    String? name,
    int? resumeCount,
    DateTime? joinedAt,
    bool? isBlocked,
  }) {
    return AdminUser(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      name: name ?? this.name,
      resumeCount: resumeCount ?? this.resumeCount,
      joinedAt: joinedAt ?? this.joinedAt,
      isBlocked: isBlocked ?? this.isBlocked,
    );
  }

  factory AdminUser.fromMap(String uid, Map<String, dynamic> map) {
    return AdminUser(
      uid: uid,
      email: map['email'] as String? ?? '',
      name: map['name'] as String? ?? '',
      resumeCount: map['resumeCount'] as int? ?? 0,
      joinedAt:
          DateTime.tryParse(map['joinedAt'] as String? ?? '') ?? DateTime.now(),
      isBlocked: map['isBlocked'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toMap() => {
    'email': email,
    'name': name,
    'resumeCount': resumeCount,
    'joinedAt': joinedAt.toIso8601String(),
    'isBlocked': isBlocked,
  };
}
