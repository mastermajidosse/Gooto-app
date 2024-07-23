import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gooto/models/video_model.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> addVideo(VideoModel video) {
    return _db.collection('videos').add(video.toJson());
  }

  Future<void> addVideos(List<VideoModel> videos) {
    WriteBatch batch = _db.batch();
    for (var video in videos) {
      var docRef = _db.collection('videos').doc();
      batch.set(docRef, video.toJson());
    }
    return batch.commit();
  }

  Stream<List<VideoModel>> getVideos() {
    return _db.collection('videos').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => VideoModel.fromFirestore(doc)).toList());
  }
}
