class UserProgress {
  final bool reachMax;
  final bool collection;
  final double progress;

  UserProgress(
      {required this.reachMax,
      required this.collection,
      required this.progress});

  factory UserProgress.fromJson(Map<String, dynamic> json) {
    return UserProgress(
      reachMax: json['reachMax'],
      collection: json['collection'],
      progress: json['progress'],
    );
  }
}
