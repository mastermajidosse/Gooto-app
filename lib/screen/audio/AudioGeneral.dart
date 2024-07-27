import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gooto/config/demo.dart';
import 'package:gooto/models/audio_model.dart';
import 'package:gooto/models/card.dart';
import 'package:gooto/screen/audio/audio.dart';
import 'package:gooto/screen/exolore/explore_detail.dart';

class PodcastDiscoveryScreen extends StatefulWidget {
  @override
  _PodcastDiscoveryScreenState createState() => _PodcastDiscoveryScreenState();
}

class _PodcastDiscoveryScreenState extends State<PodcastDiscoveryScreen> {
  TextEditingController  _searchController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Align(alignment: Alignment.topCenter,child:Text('Audio General',textAlign: TextAlign.center,) ,) 
      ),
      body:SingleChildScrollView(

      child: 
       Column(
        children: [
          Align( 
            //alignment: Alignment.topLeft,
            // margin: EdgeInsets.only(left:30 ),
            child: Text(
              'Discover Our Best Audio\nStories🎤',
              style: 
              TextStyle(
                fontFamily: 'Arial',
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                  ),
            ),
          ),
            
            SizedBox(height: 6,),
            Padding(
            padding: const EdgeInsets.all(30),
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
          SizedBox(height:5,),
          
           Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Top Cities 🔥',
                    style: TextStyle(
                    fontFamily: 'Arial',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                    ),
                  ),
                  Container(),
                //   InkWell(
                //     onTap: () {
                //       // Navigator.push(
                //       //     context,
                //       //     MaterialPageRoute(
                //       //         builder: (context) => PopularPlacesScreen()));
                //     },
                //     child: Text(
                //       'View More',
                //       style: TextStyle(
                //     fontFamily: 'Arial',
                // fontSize: 16,
                // fontWeight: FontWeight.bold,
                // color: Colors.blue,
                //     ),
                //     ),
                 // ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            
            
              Container(
                 width: 400,
              height: 200,
                child: 
              ListView.builder(
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                
                itemBuilder:(context, index){
                   final AudioModel Audio = audio[index];
      return InkWell(
        child:  Container(
        margin: EdgeInsets.all(10),
        width: 380,
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Audio.color,
              ),

     child:  Row(
                children: [
                 
                  Column(
                    // crossAxisAlignment: CrossAxisAlignment.,
                    children: [
                   
                     Container(
                       margin: EdgeInsets.only(left: 12,top: 7),
                      child:
                       Text(Audio.name
                        // "Rabat\nCapital History🇲🇦"
                        ,
                      style: TextStyle(
                           fontFamily: 'Arial',
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                      ),), 
                     ),
                      
                      // SizedBox(width: 12,),
                       
                     Text(Audio.duration
                     // "🎙️Audio 2 m 23s"
                      ,
                      style: TextStyle(
                           fontFamily: 'Arial',
                fontSize: 22,
                 fontWeight: FontWeight.w200,
                color: Colors.white,
                      ),),
                Row(
                  children: [
Icon(IconData(0xe4cc, fontFamily: 'MaterialIcons'),size: 50.sp,
                      color: Colors.white,),
                         Text("Play now",
                      style: TextStyle(
                           fontFamily: 'Arial',
                fontSize: 22.sp,
                 fontWeight: FontWeight.w300,
                color: Colors.white,
                      ),),
                  ],
                )
                         

                    ],
                  ),
                  SizedBox(width: 8,),
                  Container(
                    width: 150.w,
                    height: 150.h,
                    decoration:BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(image: 
                      
                      AssetImage(Audio.imagecover))
                    ),
                  )
                  // Image.asset(
                  //   
                  //   Audio.imagecover)
                ],
              ),
      ),
        onTap: (){
                          Navigator.push(context,MaterialPageRoute(builder: (context)=>AudioPlayerScreen(Audio.photos,Audio.name,Audio.audio,Audio.desc)));
        },
      );
     
                }
              )
              ),
            
                
               
              //  ),
              //  )
              //  ),
              
SizedBox(height: 30,),
         Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Cities',
                    style: TextStyle(
                    fontFamily: 'Arial',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                    ),
                  ),
                  Container(),
                //   InkWell(
                //     onTap: () {
                //       // Navigator.push(
                //       //     context,
                //       //     MaterialPageRoute(
                //       //         builder: (context) => PopularPlacesScreen()));
                //     },
                //     child: Text(
                //       'View More',
                //       style: TextStyle(
                //     fontFamily: 'Arial',
                // fontSize: 16,
                // fontWeight: FontWeight.bold,
                // color: Colors.blue,
                //     ),
                //     ),
                //   ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Container(
              // color: Colors.red,
              height: 200.h,
              child: ListView.builder(
               
                padding: EdgeInsets.symmetric(horizontal: 8.0),
               itemCount: 10,
                scrollDirection: Axis.horizontal,
             itemBuilder: (context,index){
              final List<CardModule> test=List.from(cardsList.toSet())..shuffle();
               final CardModule card = test[index];
 return InkWell(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (_) => DetailsExplore(activity),
                      //   ),
                      // );
                    },
                    child:       Column(
                      
              children: [
Container(
  margin: EdgeInsets.all(10),
            width: 150,
            height: 150,
                      decoration: BoxDecoration(
                        //color: Colors.grey,
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage(card.productImg),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      margin: EdgeInsets.only(right: 20),
                     // alignment: Alignment.,
                      child:Text(card.productName,style: TextStyle(color: Colors.grey[600],fontFamily: 'Arial',fontWeight: FontWeight.bold,fontSize: 20,)
                      ,textAlign: TextAlign.left,), 
                    )
                      
              ]

            )
 );

             }
                                     
                    // Container(
                    //   decoration: BoxDecoration(
                    //     color: Colors.grey,
                    //     borderRadius: BorderRadius.circular(14.r),
                    //     image: DecorationImage(
                    //       image: NetworkImage(activity.imgurl.toString()),
                    //       fit: BoxFit.cover,
                    //     ),
                    //   ),
                    // ),
                  )
        
              ),
            
      
            SizedBox(height: 30,),
         Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recently add',
                    style: TextStyle(
                    fontFamily: 'Arial',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                    ),
                  ),
                  Container(),
                //   InkWell(
                //     onTap: () {
                //       // Navigator.push(
                //       //     context,
                //       //     MaterialPageRoute(
                //       //         builder: (context) => PopularPlacesScreen()));
                //     },
                //     child: Text(
                //       'View More',
                //       style: TextStyle(
                //     fontFamily: 'Arial',
                // fontSize: 16,
                // fontWeight: FontWeight.bold,
                // color: Colors.blue,
                //     ),
                //     ),
                //   ),
                ],
              ),
            ),
            SizedBox(height: 15,),
             Container(
              // color: Colors.red,
              height: 200.h,
              child: ListView.builder(
               
                padding: EdgeInsets.symmetric(horizontal: 8.0),
               itemCount: cardsList.length,
                scrollDirection: Axis.horizontal,
             itemBuilder: (context,index){
              
               final CardModule card = cardsList[index];
 return InkWell(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (_) => DetailsExplore(activity),
                      //   ),
                      // );
                    },
                    child:       Column(
                      
              children: [
Container(
  margin: EdgeInsets.all(10),
            width: 150,
            height: 150,
                      decoration: BoxDecoration(
                        //color: Colors.grey,
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage(card.productImg),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      margin: EdgeInsets.only(right: 20),
                     // alignment: Alignment.,
                      child:Text(card.productName,style: TextStyle(color: Colors.grey[600],fontFamily: 'Arial',fontWeight: FontWeight.bold,fontSize: 20,)
                      ,textAlign: TextAlign.left,), 
                    )
                      
              ]

            )
 );

             }
                                     
                    // Container(
                    //   decoration: BoxDecoration(
                    //     color: Colors.grey,
                    //     borderRadius: BorderRadius.circular(14.r),
                    //     image: DecorationImage(
                    //       image: NetworkImage(activity.imgurl.toString()),
                    //       fit: BoxFit.cover,
                    //     ),
                    //   ),
                    // ),
                  )
        
              ),

//             Column(
//               children: [
// Container(
//             width: 150,
//             height: 150,
//                       decoration: BoxDecoration(
//                         //color: Colors.grey,
//                         borderRadius: BorderRadius.circular(20),
//                         image: DecorationImage(
//                           image: AssetImage("assets/rabat.jpeg"),
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 10,),
//                     Container(
//                       margin: EdgeInsets.only(right: 55),
//                      // alignment: Alignment.,
//                       child:Text("Rabat",style: TextStyle(color: Colors.grey[600],fontFamily: 'Arial',fontWeight: FontWeight.bold,fontSize: 20,)
//                       ,textAlign: TextAlign.left,), 
//                     )
                      
//               ]

//             )
           
        
             
          
        ],
      )
      )
    );
  }
}
  