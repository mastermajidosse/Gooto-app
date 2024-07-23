import 'package:flutter/material.dart';
import 'package:gooto/config/demo.dart';
import 'package:gooto/models/card.dart';
import 'package:gooto/screen/app_start_screen.dart';
import 'package:gooto/screen/auth/login_screen.dart';
import 'package:gooto/screen/auth/register_screen.dart';
import 'package:gooto/screen/auth/splash_screen.dart';
import 'package:gooto/screen/bottom_tab.dart';
import 'package:gooto/screen/profile/setting_screen.dart';
import 'package:gooto/widgets/all_activities_screen.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gooto/widgets/custm_card.dart';
import 'package:gooto/widgets/search_box.dart';

class PopularPlacesScreen extends StatefulWidget {
  const PopularPlacesScreen({super.key});

  @override
  State<PopularPlacesScreen> createState() => _PopularPlacesScreenState();
}

class _PopularPlacesScreenState extends State<PopularPlacesScreen> {
  TextEditingController _searchController = TextEditingController();
  List<CardModule> _filteredItems = [];

  @override
  void initState() {
    super.initState();
    _filteredItems = cardsList;
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
      _filteredItems = cardsList.where((item) {
        return item.location.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back, color: Colors.black),
        //   onPressed: () {},
        // ),
        title: Text("Popular Destination"),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: SearchBox(controller: _searchController),
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
                final CardModule card = _filteredItems[index];
                return PlaceCard(place: card);
              },
            ),
          )
        ]),
      ),
    );
  }
}

class PlaceCard extends StatelessWidget {
  final CardModule place;

  PlaceCard({required this.place});

  @override
  Widget build(BuildContext context) {
    return Card(
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
                place.productImg,
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
                  Text(place.productName,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(place.location.toString(), style: TextStyle()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
