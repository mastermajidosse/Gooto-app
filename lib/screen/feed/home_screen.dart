import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:gooto/models/card.dart';
import 'package:gooto/widgets/custm_card.dart';

import '../../config/demo.dart';
import '../../utils/MyStyle.dart';
import '../widgets/custom_card_two.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> items = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf4f4f4),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Container(
            //       // width: 45,
            //       // height: 45,
            //       margin: EdgeInsets.all(8),
            //       child: Text(
            //         'Discover',
            //         style: MyStyle.blackalarmTextStyle,
            //       ),
            //     ),
            //     Container(
            //       margin: EdgeInsets.all(8),
            //       width: 45,
            //       height: 45,
            //       child: IconButton(
            //         color: Colors.black,
            //         onPressed: () {},
            //         icon: Icon(
            //           Icons.search,
            //         ),
            //       ),

            //     ),
            //   ],
            // ),
            Container(
              alignment: Alignment.bottomLeft,
              margin: EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                'the Moroccan Switzerland :',
                style: MyStyle.buttwhtieTextStyle,
              ),
            ),
            Container(
              margin: EdgeInsets.all(8),
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: AssetImage(
                    "assets/ifran.jpg",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // containerRow(),
            Gap(10),
            Container(
              height: 350.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: cardsList.length,
                itemBuilder: (context, index) {
                  final CardModule card = cardsList[index];
                  // return CustomCard(card: card);
                  return CustomCards(
                    imageUrl: card.productImg,
                    title: card.productName,
                    description: card.price.toString(),
                    onTap: () {
                      print('Icon button tapped!');
                    },
                  );
                },
              ),
            ),
            Gap(15),
            containerRow(),
            Gap(15),
            // Container(
            //   height: 350,
            //   child: ListView.builder(
            //     itemCount: 2,
            //     itemBuilder: (context, index) {
            //       final CardModule card = cardsList[index];
            //       return CustomCardTwo(card: card);
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Container containerRow() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Popular Places',
            style: MyStyle.blackalarmTextStyle,
          ),
          InkWell(
            child: Text(
              'View More',
              style: MyStyle.buttTextStyle,
            ),
          ),
        ],
      ),
    );
  }

  containerWid(text, onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20),
        child: Text(
          text,
          style: MyStyle.regularwhiteTextStyle,
          overflow: TextOverflow.clip, // Truncate if needed
        ),
      ),
    );
  }
}
