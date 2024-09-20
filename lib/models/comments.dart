

class Comments {
  String? name;
  String? comment;
  String? photoprofil;
  DateTime? timestamp; 

   Comments({
    required this.name,
    required this.comment,
    required this.photoprofil,
    DateTime? timestamp, 
  }) : this.timestamp = timestamp ?? DateTime.now(); 

  static Comments formatData(Map<String, dynamic> map) {
    return Comments(
      name: map['name'],
      comment: map['comment'],
      photoprofil: map['photoprofil'],
      timestamp: map['timestamp'] != null ? DateTime.parse(map['timestamp']) : null, 
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'comment': comment,
      'photoprofil': photoprofil,
      'timestamp': timestamp?.toIso8601String(), 
    };
  }
}