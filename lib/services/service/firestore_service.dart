// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gooto/models/video_model.dart';

class FirestoreService {
  // Stream<List<VideoModel>> getVideos() {
  // return _db.collection('videos').snapshots().map((snapshot) =>
  //     snapshot.docs.map((doc) => VideoModel.fromFirestore(doc)).toList());
  // }
  List<VideoModel> getVideos() {
    List<VideoModel> videoss = [
      VideoModel(
        id: 1,
        name: "I Can't Believe This Happened To Me in Akchour",
        url:
            'https://firebasestorage.googleapis.com/v0/b/gooto-80b74.appspot.com/o/akchoure.mp4?alt=media&token=cfb88fb8-c018-49ba-a410-8e6310ef6ef9',
      ),
      VideoModel(
        id: 2,
        name: " MOROCCO TRAVEL DOCUMENTARY | The Grand Moroccan Roadtrip ",
        url:
            "https://firebasestorage.googleapis.com/v0/b/gooto-80b74.appspot.com/o/travelmoroco.mp4?alt=media&token=e3cf125d-1b7d-4232-a685-da1ca9ea0dc8",
      ),
      VideoModel(
        id: 3,
        name: "The King of Moroccan Tagine Food 🇲🇦 Crazy Casablanca Food Tour!!",
        url:
            "https://firebasestorage.googleapis.com/v0/b/gooto-80b74.appspot.com/o/tagine.mp4?alt=media&token=7d9c96de-98cc-40a6-b8ba-bcdfd57dd8b4",
      ),
      VideoModel(
        id: 4,
        name: " We are off to a New Continent! (Ferry from Spain to Morocco) ",
        url:
            "https://firebasestorage.googleapis.com/v0/b/gooto-80b74.appspot.com/o/document.mp4?alt=media&token=05f2c549-9ba9-406f-8b84-aea6f434ed6c",
      ),
      VideoModel(
        id: 5,
        name: "10 Beautiful Places to Visit in Morocco 🇲🇦 | Must See Morocco Travel Guide ",
        url:
            "https://firebasestorage.googleapis.com/v0/b/gooto-80b74.appspot.com/o/10days.mp4?alt=media&token=330f86a1-08be-4464-8118-f5460ebd5ed0",
      ),
      VideoModel(
        id: 5,
        name: "Beautiful Places to Visit in Dakhla 🇲🇦 | Must See Morocco Travel Guide ",
        url:
            "https://firebasestorage.googleapis.com/v0/b/gooto-80b74.appspot.com/o/Dakhla.mp4?alt=media&token=fb666e29-5824-4d8d-84c8-b5f978236d75",
      ),
      VideoModel(
        id: 6,
        name: "Beautiful Tagine in Morocco 🇲🇦 | Must See Morocco Travel Guide ",
        url:
            "https://firebasestorage.googleapis.com/v0/b/gooto-80b74.appspot.com/o/tagine.mp4?alt=media&token=7d9c96de-98cc-40a6-b8ba-bcdfd57dd8b4",
      ),
      VideoModel(
        id: 7,
        name: "Beautiful Places to Visit in casablanca 🇲🇦 | Must See Morocco Travel Guide ",
        url:
            "https://firebasestorage.googleapis.com/v0/b/gooto-80b74.appspot.com/o/casablanca.mp4?alt=media&token=cc75894f-4258-4f44-bd23-1c4bd8a7e34d",
      ),
      VideoModel(
        id: 8,
        name: "Beautiful Places to Visit in Marrakech 🇲🇦 | Must See Morocco Travel Guide ",
        url:
            "https://firebasestorage.googleapis.com/v0/b/gooto-80b74.appspot.com/o/Marrakech.mp4?alt=media&token=e16ae312-3077-499f-94dd-90ae3248d98e",
      ),
      VideoModel(
        id: 9,
        name: "Beautiful Places to Visit in Marzouga 🇲🇦 | Must See Morocco Travel Guide ",
        url:
            "https://firebasestorage.googleapis.com/v0/b/gooto-80b74.appspot.com/o/Marzouga.mp4?alt=media&token=7773cbfa-7a1b-4def-8292-01280cc0d12e",
      ),
      VideoModel(
        id: 10,
        name: " Beautiful Places to Visit in Morocco 🇲🇦 | Must See Morocco Travel Guide ",
        url:
            "https://firebasestorage.googleapis.com/v0/b/gooto-80b74.appspot.com/o/Lharba.mp4?alt=media&token=1954f5a3-d850-4b25-b329-ab2ac4cb85a5",
      ),
      VideoModel(
        id: 11,
        name: "Beautiful Places to Visit in Essaouira 🇲🇦 | Must See Morocco Travel Guide ",
        url:
            "https://firebasestorage.googleapis.com/v0/b/gooto-80b74.appspot.com/o/Essaouira.mp4?alt=media&token=6ee6f3fa-b66d-4788-ab75-3f3d22e7d172",
      ),
    ];
    return videoss;
  }
}
