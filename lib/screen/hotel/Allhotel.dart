import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gooto/config/demo.dart';
import 'package:gooto/models/card.dart';
import 'package:gooto/models/hotel_model.dart';
import 'package:gooto/screen/app_start_screen.dart';
import 'package:gooto/screen/auth/fullscreenpopup.dart';
import 'package:gooto/screen/auth/login_screen.dart';
import 'package:gooto/screen/auth/register_screen.dart';
import 'package:gooto/screen/auth/splash_screen.dart';
import 'package:gooto/screen/bottom_tab.dart';
import 'package:gooto/screen/popular_details_screen.dart';
import 'package:gooto/screen/profile/setting_screen.dart';
import 'package:gooto/widgets/all_activities_screen.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gooto/widgets/custm_card.dart';
import 'package:gooto/widgets/search_box.dart';

class AllHotelScreen extends StatefulWidget {
  const AllHotelScreen({super.key});

  @override
  State<AllHotelScreen> createState() => _AllHotelScreenState();
}

class _AllHotelScreenState extends State<AllHotelScreen> {
  TextEditingController _searchController = TextEditingController();
  List<HotelModel> _filteredItems = [];

  @override
  void initState() {
    super.initState();
    _filteredItems = hotels;
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
      _filteredItems = hotels.where((item) {
        return item.title.toLowerCase().contains(query);
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
        title: Text("Hotel Destination".tr()),
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
                final HotelModel card = _filteredItems[index];
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
  final HotelModel place;

  PlaceCard({required this.place});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => FullScreenPop(hotel: place,
              
            ),
          ),
        );
      },
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
                child: Image.network(
                  place.img,
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
                    Text(place.title.tr(),
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(place.location.toString().tr(), style: TextStyle()),
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
