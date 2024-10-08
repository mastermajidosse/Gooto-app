import 'package:flutter/material.dart';
import 'package:gooto/models/audio_model.dart';
import 'package:gooto/screen/audio/audio.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllaudioScreen extends StatefulWidget {
  const AllaudioScreen({super.key});

  @override
  State<AllaudioScreen> createState() => _AllaudioScreenState();
}

class _AllaudioScreenState extends State<AllaudioScreen> {
  TextEditingController _searchController = TextEditingController();
  List<AudioModel> _filteredItems = [];

  @override
  void initState() {
    super.initState();
    _filteredItems = audio;
    _searchController.addListener(_filterItems);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterItems() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      _filteredItems = audio.where((item) {
        return item.name.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("All Audio"),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                contentPadding: EdgeInsets.zero,
                fillColor: Colors.grey[200],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(0),
            child: MasonryGridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              primary: false,
              gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: _filteredItems.length,
              itemBuilder: (context, index) {
                final AudioModel card = _filteredItems[index];
                return PlaceCard(audio: card);
              },
            ),
          )
        ]),
      ),
    );
  }
}

class PlaceCard extends StatelessWidget {
  final AudioModel audio;

  PlaceCard({required this.audio});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  AudioPlayerScreen(audio.photos, audio.name, audio.audio, audio.desc))),
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  audio.logo,
                  width: double.infinity,
                  height: 200.h,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(audio.name, style: TextStyle(fontWeight: FontWeight.bold)),
                    // Text(place.location.toString(), style: TextStyle()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
