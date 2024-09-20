import 'package:easy_localization/easy_localization.dart';
import 'package:gooto/models/comments.dart';
import 'package:gooto/models/hotel_model.dart';
import 'package:gooto/models/posts.model.dart';

import '../models/card.dart';

List<HotelModel> hotels = [
  HotelModel(
      title: "Eden Andalou",
      img:
          "https://cf.bstatic.com/xdata/images/hotel/square600/538663555.webp?k=3ef2ac64d443fa9695d61b3b1945899a1e3521d2d87f585c4f093608af8092d8&o=",
      price: "MAD 500",
      rating: "4.3",
      location: "Km 4 road of Amizmiz, 40000 Marrakech",
      url:
          "https://www.booking.com/hotel/ma/eden-andalou-spa-resort.en-gb.html?aid=2311236&label=en-ma-booking-desktop-HFqwIxxzRAmHDiKj_ApqpgS652796016120%253Apl%253Ata%253Ap1%253Ap2%253Aac%253Aap%253Aneg%253Afi%253Atikwd-65526620%253Alp1009985%253Ali%253Adec%253Adm&sid=ec972651f7369da168f3d4d97321b0d1&age=1&all_sr_blocks=9874349_87788343_2_85_0&checkin=2025-05-02&checkout=2025-05-09&dest_id=-38833&dest_type=city&dist=0&group_adults=2&group_children=1&hapos=1&highlighted_blocks=9874349_87788343_2_85_0&hpos=1&matching_block_id=9874349_87788343_2_85_0&no_rooms=1&req_adults=2&req_age=1&req_children=1&room1=A%2CA%2C1&sb_price_type=total&sr_order=popularity&sr_pri_blocks=9874349_87788343_2_85_0__1540000&srepoch=1722338264&srpvid=dd784f67166a0253&type=total&ucfs=1&activeTab=main"),
  HotelModel(
      title: "Savoy Le Grand",
      img:
          "https://cf.bstatic.com/xdata/images/hotel/max1024x768/474656748.jpg?k=3f511d8a7de370ec912d62ffc0f9666b0995d5a97b556a81b2492a07d2ae84af&o=&hp=1",
      price: "MAD 1200",
      rating: "4.4",
      location: "Avenue de la ménara BP 528, Marrakech",
      url: "https://www.booking.com/hotel/ma/savoy-le-grand.en-gb.html"),
  HotelModel(
      title: "Mazagan Beach",
      img:
          "https://cf.bstatic.com/xdata/images/hotel/max1024x768/582102204.jpg?k=d651128c152cc4920d081a8983bf7c283d248601117e29eb20e98e6654faec36&o=&hp=1",
      price: "MAD 1350",
      rating: "4.1",
      location: "El Haouzia, 24000 El Jadida",
      url:
          "https://www.booking.com/hotel/ma/mazagan-beach-resort.en-gb.html?aid=2311236&label=en-ma-booking-desktop-HFqwIxxzRAmHDiKj_ApqpgS652796016120%3Apl%3Ata%3Ap1%3Ap2%3Aac%3Aap%3Aneg%3Afi%3Atikwd-65526620%3Alp1009985%3Ali%3Adec%3Adm&sid=ec972651f7369da168f3d4d97321b0d1&checkin=2025-05-02;checkout=2025-05-09;dist=0;group_adults=2;group_children=0;hapos=1;hpos=1;no_rooms=1;req_adults=2;req_children=0;room1=A%2CA;sb_price_type=total;soh=1;sr_order=popularity;srepoch=1722340462;srpvid=f40553b3ba1e0122;type=total;ucfs=1&"),
  HotelModel(
      title: "Hivernage Hotel & Spa",
      img:
          "https://cf.bstatic.com/xdata/images/hotel/max1024x768/60787753.jpg?k=cbd0ee7912d5c7f49429ad7a3c5a32c296456e74f3b99d39a2b8ee4f2c005340&o=&hp=1",
      price: "MAD 1740",
      rating: "4.2",
      location: "Rue Des Temples, Hivernage",
      url: "https://www.booking.com/hotel/ma/hivernage-spa.en-gb.html"),
];
List<Posts> Listposts=[
  Posts(name: "Amine Banmoussa",
   image: "assets/posts/amine.jpeg",
    imageprofile: "assets/posts/amine3.png", 
    local: "Oued kanare",
    comments: [
     // Comments(name: name, comment: comment, photoprofil: photoprofil)
      ],
    Like: 6, 
    description: 'oued knare best place for travel'
    ),
      Posts(
        name: "omar",
   image: "assets/posts/jbalebayda.jpeg",
    imageprofile: "assets/posts/park1.jpeg", 
    local: "khnifra",
    comments:[] ,
    Like: 3, 
    description: 'climbing with good teams🔥'
    ),
      Posts(
        name: "yassine",
   image:"assets/posts/yassine.png" ,
    imageprofile: "assets/posts/yassine1.png", 
    local: "Hociema",
    comments: [],
    Like: 1,
    description: "the best place in north Morroco"
    ),
  //     Posts(name: name,
  //  image: image,
  //   imageprofile: imageprofile, 
  //   local: local,
  //   comments: comments,
  //   Like: Like
  //   ),
  //     Posts(name: name,
  //  image: image,
  //   imageprofile: imageprofile, 
  //   local: local,
  //   comments: comments,
  //   Like: Like
  //   ),
  //     Posts(name: name,
  //  image: image,
  //   imageprofile: imageprofile, 
  //   local: local,
  //   comments: comments,
  //   Like: Like
  //   ),
  //     Posts(name: name,
  //  image: image,
  //   imageprofile: imageprofile, 
  //   local: local,
  //   comments: comments,
  //   Like: Like
  //   ),
  //     Posts(name: name,
  //  image: image,
  //   imageprofile: imageprofile, 
  //   local: local,
  //   comments: comments,
  //   Like: Like
  //   ),
  
];

List<CardModule> cardsList =  [
   CardModule(
      id: 1,
      price: 30,
      location: 'Moroccan Sahara',
      productImg: 'assets/popular/Sahara.jpeg',
      productName: 'Sahara',
      rating: "5",
      description:
          "The Moroccan Sahara: A Treasure of Beauty and Culture The Moroccan Sahara is a stunning expanse of desert that captures the imagination of visitors from around the world. Spanning a vast area, this region is not only a geographical marvel but also a cultural treasure that embodies the spirit of Morocco.",
      previewImgs: [
        "assets/popular/sahara2.jpeg",
        "assets/popular/Sahara.jpeg",
        "assets/popular/sahara1.jpeg",
        "assets/popular/Sahara4.jpeg",
        "assets/popular/Sahara3.jpeg"
      ],
       listcoments: []),
    CardModule(
    id: 3,
    price: 5.00,
    location: 'Located 28 km from Azilal',
    productImg: 'assets/popular/BinelOuidane.jpg',
    productName: 'Bin el Ouidane lake',
    rating: "4.8",
    description:
        "Lake Bin el Ouidane is a stunning artificial lake nestled in the heart of the Atlas Mountains, Morocco. Created by the Bin el Ouidane Dam, the lake is a popular destination for those seeking tranquility and natural beauty.Surrounded by lush greenery and with the majestic mountains as a backdrop, the lake offers a peaceful escape from the bustling city. Visitors can enjoy various water activities such as swimming, boating, and fishing. The lake is particularly famous for its large carp population, making it a dream spot for anglers.Beyond the lake, the surrounding area provides opportunities for hiking and exploring Berber villages, offering a glimpse into traditional Moroccan life. Bin el Ouidane is a perfect destination for those who appreciate nature, outdoor activities, and cultural experiences.",
    previewImgs: [
      "assets/popular/akchour2.jpeg",
      "assets/popular/akchour1.png"
    ],
    listcoments: []
  ),
  CardModule(
      id: 21,
      price: 16.00,
      location: 'Sidi Kaouki, Essaouira Province',
      productImg: 'assets/popular/sidikaouki.jpg',
      productName: 'Sidi Kaouki',
      rating: "4.8",
      description:
          """Sidi Kaouki is a charming coastal village located just south of Essaouira, renowned for its stunning beaches and world-class surf breaks. This laid-back destination offers a perfect escape from the hustle and bustle of city life.With its consistent waves and pristine coastline, Sidi Kaouki has become a favorite among surfers from around the globe. However, the village also caters to those seeking relaxation and natural beauty. Sunbathing, swimming, and long walks on the beach are popular activities.""",
      previewImgs: [
        "assets/popular/sidikaouki1.jpeg",
        "assets/popular/sidikaouki2.jpeg",
        "assets/popular/sidikaouki3.jpeg",
      ],
      listcoments: []),
   CardModule(
      id: 1,
      price: 30,
      location: 'Rmilat',
      productImg: 'assets/popular/rmilat3.jpeg',
      productName: 'Tanger,Rmilat',
      rating: "4.8",
      description:
          "The Perdicaris Park, also known as the Rmilat Forest and formerly as Villa Aidonia or Place of the Nightingales, is a public park covering 70 hectares in the Rmilat neighborhood of Tangier, Morocco. It is located on the northern slopes of the Jebel Kebir hill facing the Strait of Gibraltar, between the Cape Spartel reserve to its west and the Jebel Kebir Royal Palace to its east. It is named after Greek-American notable Ion Hanford Perdicaris, who created it in the 1870s and was kidnapped there in the mid-1904",
      previewImgs: [
        "assets/popular/rmilat1.jpeg",
        "assets/popular/rmilat2.jpeg",
        "assets/popular/rmilat.jpeg",
        "assets/popular/rmilat4.jpeg",
        "assets/popular/rmilat5.jpeg",
        "assets/popular/rmilat6.jpeg",
        
      ],
       listcoments: [Comments(name: "Zaroual Omar", comment: "wow this place is Amazing is real this place in Morroco??", photoprofil: "assets/ai.jpg"),Comments(name: "Zaroual Omar", comment: "wow this place is Amazing is real this place in Morroco??", photoprofil: "assets/ai.jpg"),Comments(name: "Zaroual Omar", comment: "wow this place is Amazing is real this place in Morroco??", photoprofil: "assets/ai.jpg")]
       ),
   CardModule(
      id: 1,
      price: 30,
      location: 'jebha',
      productImg: 'assets/popular/jebha.jpeg',
      productName: 'Tetoune,jebha',
      rating: "4.8",
      description:
          "El Jebha is a little port town in the northern part of Morocco. This Mediterranean coastal place is situated in the Rif Mountains, and across the route that takes traffic from the Northwestern part to the Northeastern part of Morocco.[1] El Jebha, is the capital of the district (cercle) Mtiwa, which is part of Chefchaouen Province in the region of Tanger-Tetouan-Al Hoceima.",
      previewImgs: [
        "assets/popular/jebha1.jpeg",
        "assets/popular/jebha2.jpeg",
        "assets/popular/jebha3.jpeg",
        "assets/popular/jebha4.jpeg",
        "assets/popular/jebha5.jpeg",
        "assets/popular/jebha6.jpeg"
      ],
       listcoments: [Comments(name: "Zaroual Omar", comment: "wow this place is Amazing is real this place in Morroco??", photoprofil: "assets/ai.jpg"),Comments(name: "Zaroual Omar", comment: "wow this place is Amazing is real this place in Morroco??", photoprofil: "assets/ai.jpg"),Comments(name: "Zaroual Omar", comment: "wow this place is Amazing is real this place in Morroco??", photoprofil: "assets/ai.jpg")]
       ),
        CardModule(
      id: 1,
      price: 30,
      location: 'Mountain Irhoud',
      productImg: 'assets/popular/jbelrhoud.jpeg',
      productName: 'Youssoufia,Mountain Irhoud',
      rating: "4.8",
      description:
          "Jebel Irhoud or Adrar n Ighoud (Standard Moroccan Tamazight: ⴰⴷⵔⴰⵔ ⵏ ⵉⵖⵓⴷ, romanized: Adrar n Iɣud; Arabic: جبل إيغود, Moroccan Arabic: žbəl iġud), is an archaeological site located just north of the town of Tlet Ighoud in Youssoufia Province, approximately 50 km (30 mi) south-east of the city of Safi in Morocco. It is noted for the hominin fossils that have been found there since the discovery of the site in 1960. Originally thought to be Neanderthals, the specimens have since been assigned to Homo sapiens and, as reported in 2017, have been dated to roughly 300,000 years ago (286±32 ka for the Irhoud 3 mandible, 315±34 ka based on other fossils and the flint artefacts found nearby)",
      previewImgs: [
        "assets/popular/jbelrhoud2.jpeg",
        "assets/popular/jbelrhoud3.jpeg",
        "assets/popular/jbelrhoud4.jpeg",
        "assets/popular/jbelrhoud5.jpeg",
        "assets/popular/jbelrhoud6.jpeg"
      ],
       listcoments: [Comments(name: "Zaroual Omar", comment: "wow this place is Amazing is real this place in Morroco??", photoprofil: "assets/ai.jpg"),Comments(name: "Zaroual Omar", comment: "wow this place is Amazing is real this place in Morroco??", photoprofil: "assets/ai.jpg"),Comments(name: "Zaroual Omar", comment: "wow this place is Amazing is real this place in Morroco??", photoprofil: "assets/ai.jpg")]
       ),

   
    CardModule(
      id: 1,
      price: 30,
      location: 'oum rabia',
      productImg: 'assets/popular/oumrabia5.jpeg',
      productName: 'Khenifra,oum rabia',
      rating: "4.8",
      description:
          "Which means The Green Lake in Berber, is a landlocked natural lake occupying a depressed area with a depth of 26m, it is surrounded by limestone reliefs, covered with a forest predominantly cedars and oaks, its location in the heart of Middle Atlas cedar gives it a marvelous beauty.",
      previewImgs: [
        "assets/popular/oumrabia1.jpeg",
        "assets/popular/oumrabia2.jpeg",
        "assets/popular/oumrabia3.jpeg",
        "assets/popular/oumrabia4.jpeg",
        "assets/popular/oumrabia.jpeg"
      ],
       listcoments: [Comments(name: "Zaroual Omar", comment: "wow this place is Amazing is real this place in Morroco??", photoprofil: "assets/ai.jpg"),Comments(name: "Zaroual Omar", comment: "wow this place is Amazing is real this place in Morroco??", photoprofil: "assets/ai.jpg"),Comments(name: "Zaroual Omar", comment: "wow this place is Amazing is real this place in Morroco??", photoprofil: "assets/ai.jpg")]
       ),
  CardModule(
      id: 1,
      price: 30,
      location: 'Aguelmam Azigza',
      productImg: 'assets/popular/Aguelmam.jpeg',
      productName: 'Khenifra,Aguelmam Azigza',
      rating: "4.8",
      description:
          "Which means The Green Lake in Berber, is a landlocked natural lake occupying a depressed area with a depth of 26m, it is surrounded by limestone reliefs, covered with a forest predominantly cedars and oaks, its location in the heart of Middle Atlas cedar gives it a marvelous beauty.",
      previewImgs: [
        "assets/popular/Aguelmam5.jpeg",
        "assets/popular/Aguelmam1.jpeg",
        "assets/popular/Aguelmam4.jpeg",
        "assets/popular/Aguelmam3.jpeg",
        "assets/popular/Aguelmam6.jpeg"
      ],
       listcoments: [Comments(name: "Zaroual Omar", comment: "wow this place is Amazing is real this place in Morroco??", photoprofil: "assets/ai.jpg"),Comments(name: "Zaroual Omar", comment: "wow this place is Amazing is real this place in Morroco??", photoprofil: "assets/ai.jpg"),Comments(name: "Zaroual Omar", comment: "wow this place is Amazing is real this place in Morroco??", photoprofil: "assets/ai.jpg")]
       ),

     CardModule(
      id: 1,
      price: 30,
      location: 'Arougou',
      productImg: 'assets/popular/jbeldahdouh.jpeg',
      productName: 'Khenifra,Arougou',
      rating: "4.8",
      description:
          "The mountainous commune of Aguelmam Azegza, in the province of Khénifra, is home to an exceptional tourist site called Arougou, well protected between the cedars and holm oaks of the Atlas, a few steps from Lake Aguelmam Azegza.The road to Arougou is truly charming, passing through natural landscapes that extend into vast areas along the Oum Errabia River, offering picturesque beauty. It is surrounded by lakes and dense forests, its ease of access throughout the year, both in summer and in winter, makes it a privileged destination.",
      previewImgs: [
        "assets/popular/jbeldahdouh6.jpeg",
        "assets/popular/jbeldahdouh1.jpeg",
        "assets/popular/jbeldahdouh3.jpeg",
        "assets/popular/jbeldahdouh4.jpeg",
        "assets/popular/jbeldahdouh5.jpeg"
      ],
       listcoments: [Comments(name: "Zaroual Omar", comment: "wow this place is Amazing is real this place in Morroco??", photoprofil: "assets/ai.jpg"),Comments(name: "Zaroual Omar", comment: "wow this place is Amazing is real this place in Morroco??", photoprofil: "assets/ai.jpg"),Comments(name: "Zaroual Omar", comment: "wow this place is Amazing is real this place in Morroco??", photoprofil: "assets/ai.jpg")]
       ),
    CardModule(
      id: 1,
      price: 30,
      location: 'Mountain Dahdouh',
      productImg: 'assets/popular/jbeldahdouh.jpeg',
      productName: 'Youssoufia,Mountain Dahdouh',
      rating: "4.8",
      description:
          "The Rif — in Rif: ⴰⵔⵔⵉⴼ, Arrif (“shore, edge”), is the northern region of Morocco, bordered by the Mediterranean Sea to the north, Algeria to the east, the plains separating it from the Middle Atlas to the south and the Atlantic Ocean to the west. Made up of mountains and plains, the Rif extends over nearly 500 km from Tangier to Moulouya.",
      previewImgs: [
        "assets/popular/jbeldahdouh6.jpeg",
        "assets/popular/jbeldahdouh1.jpeg",
        "assets/popular/jbeldahdouh3.jpeg",
        "assets/popular/jbeldahdouh4.jpeg",
        "assets/popular/jbeldahdouh5.jpeg"
      ],
       listcoments: [Comments(name: "Zaroual Omar", comment: "wow this place is Amazing is real this place in Morroco??", photoprofil: "assets/ai.jpg"),Comments(name: "Zaroual Omar", comment: "wow this place is Amazing is real this place in Morroco??", photoprofil: "assets/ai.jpg"),Comments(name: "Zaroual Omar", comment: "wow this place is Amazing is real this place in Morroco??", photoprofil: "assets/ai.jpg")]
       ),
 
    
  CardModule(
      id: 1,
      price: 30,
      location: 'Akchour , Chefchaouen',
      productImg: 'assets/popular/akchour1.png',
      productName: 'Akchour',
      rating: "4.3",
      description:
          "Akchour is a small town nestled in the Rif Mountains of Morocco, renowned for its stunning natural beauty. It's a popular day trip destination from nearby Chefchaouen, offering a refreshing escape from the bustling city.The town's main attraction is its series of cascading waterfalls, surrounded by lush greenery and offering inviting swimming holes. Hiking trails lead to these natural wonders, making it a paradise for outdoor enthusiasts. Akchour also boasts the impressive God's Bridge, a natural rock formation that adds to the area's allure.While primarily a nature destination, Akchour provides a glimpse into traditional Moroccan mountain life, with its charming local atmosphere and opportunities to interact with friendly locals.",
      previewImgs: [
        "assets/popular/akchour2.jpeg",
        "assets/popular/akchour1.png"
      ],
      listcoments: []
      ),
  CardModule(
      id: 2,
      price: 4.50,
      location: 'Taghazout, Agadir',
      productImg: 'assets/popular/taghazout.jpg',
      productName: 'Taghazout',
      rating: "4.8",
      description:
          "Taghazout is a charming fishing village nestled on Morocco's Atlantic coast, renowned as a surfer's haven. Known for its consistent waves and laid-back atmosphere, it has become a popular destination for both seasoned surfers and beginners.Beyond the surf, Taghazout offers a taste of authentic Moroccan life. Visitors can explore the local souk, indulge in fresh seafood, and relax on the beautiful beaches. The nearby Paradise Valley is a must-visit for nature lovers, featuring stunning waterfalls and swimming holes.While the village has seen an increase in tourism, it still retains its traditional charm. A perfect blend of adventure, relaxation, and cultural immersion awaits those who choose to explore Taghazout.",
      previewImgs: [
        "assets/popular/akchour2.jpeg",
        "assets/popular/akchour1.png"
      ],
      listcoments: []
      ),

  CardModule(
      id: 4,
      price: 5.00,
      location: 'town in Al Haouz Province, Marrakesh',
      productImg: 'assets/popular/Lallatakerkoust.jpeg',
      productName: 'Lalla Takerkoust',
      rating: "4.8",
      description:
          "Lalla Takerkoust is a charming town located in the Al Haouz province, just a short distance from the bustling city of Marrakech. It's primarily known for its namesake lake, a vast reservoir created by a dam built in 1929. This artificial lake offers a stunning backdrop of the Atlas Mountains, making it a popular escape for locals and tourists alike.While the lake is the main attraction, Lalla Takerkoust also offers opportunities to explore the surrounding countryside, with its traditional Berber villages and breathtaking landscapes. It's a perfect place to relax, enjoy water sports, or simply soak up the peaceful atmosphere.",
      previewImgs: [
        "assets/popular/akchour2.jpeg",
        "assets/popular/akchour1.png"
      ],
      listcoments: []
      ),
  CardModule(
      id: 5,
      price: 10.00,
      location: 'Ouzoud Waterfalls, Azilal',
      productImg: 'assets/popular/OuzoudWaterfalls.jpg',
      productName: 'Ouzoud Waterfalls',
      description:
          "Ouzoud Waterfalls are a breathtaking natural wonder nestled in the heart of Morocco's Middle Atlas Mountains. Known as Morocco's answer to Niagara Falls, these cascading waterfalls plunge into a dramatic gorge, creating a stunning spectacle.Surrounded by lush greenery and Berber villages, Ouzoud offers a perfect escape from the bustling cities. Visitors can enjoy hiking along the gorge's edge, taking refreshing swims in the natural pools, or simply marveling at the falls' beauty. For the adventurous, there's the option of boat rides through the gorge, offering a unique perspective of the waterfalls.Ouzoud is not just about natural beauty; it's also a cultural experience. The surrounding area is home to Berber communities, allowing visitors a glimpse into traditional Moroccan life.",
      rating: "4.8",
      previewImgs: [
        "assets/popular/akchour2.jpeg",
        "assets/popular/akchour1.png"
      ],
      listcoments: []),
  CardModule(
      id: 6,
      price: 20.00,
      location: 'Dades Gorges, Tinghir',
      productImg: 'assets/popular/DadesGorges.jpg',
      productName: 'Dades Gorges',
      description:
          "The Dades Gorges are a breathtaking series of canyons carved by the Dades River through the High Atlas Mountains in Morocco. Renowned for their dramatic red rock formations, winding roads, and lush oasis-like valleys, they offer a stunning contrast to the surrounding desert landscape.Visitors can explore the gorges by car, hiking, or even on horseback, taking in the awe-inspiring scenery. The winding road, often referred to as the Road of a Thousand Kasbahs, is lined with traditional Berber villages and fortified houses perched on the cliff edges.Beyond the stunning landscapes, the Dades Gorges offer a glimpse into traditional Berber culture. Visitors can interact with locals, explore local markets, and experience the warm hospitality of the region.",
      rating: "4.8",
      previewImgs: [
        "assets/popular/akchour2.jpeg",
        "assets/popular/akchour1.png"
      ],
      listcoments: []
      ),
  CardModule(
      id: 7,
      price: 7.00,
      location: 'Legzira Beach, Sidi Ifni',
      productImg: 'assets/popular/lagzira.jpg',
      productName: 'Legzira Beach',
      rating: "4.8",
      description:
          "Legzira Beach is a world-renowned coastal gem on Morocco's Atlantic coast, famous for its dramatic red sandstone arches that once framed the golden sands. Unfortunately, one of these iconic arches collapsed in 2016 due to erosion. However, the remaining arch, though unstable, still offers a breathtaking sight.The beach itself is a haven for relaxation, with soft sands and the rhythmic sound of waves. Surfers also find the waves here enticing. The surrounding area is relatively unspoiled, offering a peaceful escape from the tourist crowds.While the loss of the second arch is a significant change, Legzira Beach continues to be a must-visit destination for its natural beauty and unique atmosphere.",
      previewImgs: [
        "assets/popular/akchour2.jpeg",
        "assets/popular/akchour1.png"
      ],
      listcoments: []
      ),
  CardModule(
      id: 8,
      price: 15.00,
      location: 'Paradise Valley, Agadir',
      productImg: 'assets/popular/pardisevalley.png',
      productName: 'Paradise Valley',
      rating: "4.8",
      description:
          "Paradise Valley is a hidden gem nestled in the High Atlas Mountains, near Agadir. This idyllic oasis is characterized by lush greenery, cascading waterfalls, and crystal-clear natural pools.It's a perfect escape from the bustling city, offering visitors a chance to relax, swim, and hike in a breathtaking natural setting. The valley is also home to various wildlife, making it a nature lover's paradise.Whether you're seeking adventure or relaxation, Paradise Valley has something to offer everyone.",
      previewImgs: [
        "assets/popular/akchour2.jpeg",
        "assets/popular/akchour1.png"
      ],
      listcoments: []
      ),
  CardModule(
      id: 9,
      price: 25.00,
      location: 'Merzouga Desert, Merzouga',
      productImg: 'assets/popular/Merzouga.jpeg',
      productName: 'Merzouga Desert',
      rating: "4.8",
      description:
          "Merzouga Desert is synonymous with the Sahara, offering a quintessential desert experience. Home to the breathtaking Erg Chebbi dunes, this vast expanse of golden sand is a photographer's dream and an adventurer's playground.Camel treks at sunset, stargazing under the clearest skies, and spending nights in traditional Berber tents are some of the unforgettable experiences Merzouga offers. Beyond the dunes, visitors can explore nearby villages, ride ATVs, or simply soak in the tranquility of the desert.Merzouga is a gateway to the heart of the Sahara, promising an adventure unlike any other.",
      previewImgs: [
        "assets/popular/akchour2.jpeg",
        "assets/popular/akchour1.png"
      ],
      listcoments: []),
  CardModule(
      id: 11,
      price: 8.00,
      location: 'Ait Benhaddou, Ouarzazate',
      productImg: 'assets/popular/aitbenhaddou.jpg',
      productName: 'Ait Benhaddou',
      rating: "4.8",
      description:
          "Ait Benhaddou is a stunning fortified village, or ksar, located in the Ouarzazate province of Morocco. Renowned for its iconic earthen architecture, the village has served as a backdrop for numerous films, including Game of Thrones and Gladiator.Declared a UNESCO World Heritage Site, Ait Benhaddou offers a glimpse into Morocco's rich history and traditional Berber lifestyle. Visitors can explore the winding alleyways, climb the fortified walls, and imagine life in this ancient settlement. The surrounding landscape, with its dramatic mountains and palm groves, adds to the allure of this magical place.",
      previewImgs: [
        "assets/popular/akchour2.jpeg",
        "assets/popular/akchour1.png"
      ],
      listcoments: []),
  CardModule(
      id: 12,
      price: 5.00,
      location: 'Rif Mountains, Northern Morocco',
      productImg: 'assets/popular/rifmountains.jpg',
      productName: 'Rif Mountains',
      rating: "4.8",
      description:
          "The Rif Mountains are a dramatic mountain range in northern Morocco, known for their rugged beauty, diverse ecosystems, and rich cultural heritage. Rising steeply from the Mediterranean Sea, they offer stunning coastal views, lush forests, and charming Berber villages.The Rif is home to a unique blend of cultures, with Berber traditions deeply rooted in the region. Hiking, trekking, and exploring the region's natural wonders are popular activities. Cities like Chefchaouen, with its blue-washed buildings, and Tetouan, with its Spanish colonial influence, are must-visit destinations in the Rif.",
      previewImgs: [
        "assets/popular/akchour2.jpeg",
        "assets/popular/akchour1.png"
      ],
      listcoments: []),
  CardModule(
      id: 14,
      price: 6.00,
      location: 'Ourika Valley, High Atlas Mountains',
      productImg: 'assets/popular/ourikavalley.jpg',
      productName: 'Ourika Valley',
      rating: "4.8",
      description:
          "The Ourika Valley is a lush haven nestled within the High Atlas Mountains, just a short drive from Marrakech. Known for its verdant landscapes, cascading waterfalls, and charming Berber villages, it's a popular day trip for those seeking a respite from the city.Visitors can explore the valley on foot, hiking through terraced fields and encountering traditional Berber life. The highlight of the valley is the Setti Fatma waterfalls, a series of cascades that offer refreshing swimming holes.Beyond the natural beauty, the Ourika Valley is also renowned for its argan oil production. Visitors can learn about the process and purchase authentic products from local cooperatives.A day spent in the Ourika Valley is a perfect way to experience the natural beauty and cultural richness of Morocco.",
      previewImgs: [
        "assets/popular/akchour2.jpeg",
        "assets/popular/akchour1.png"
      ],
      listcoments: []),
  CardModule(
      id: 17,
      price: 11.00,
      location: 'Ouarzazate, Film Studio',
      productImg: 'assets/popular/filmstudio.jpg',
      productName: 'Ouarzazate',
      rating: "4.8",
      description:
          "Ouarzazate is often referred to as the gateway to the Sahara, serving as a base for exploring the desert landscapes and the Atlas Mountains. This vibrant city is a melting pot of Berber and Arab cultures, offering a unique blend of traditional and modern Morocco.Known for its stunning kasbahs, including the impressive Taourirt Kasbah, Ouarzazate is a visual feast for history buffs and photography enthusiasts. The city also boasts a thriving film industry, with many international productions choosing this location for its dramatic landscapes.Beyond its cultural attractions, Ouarzazate offers a convenient starting point for excursions to the nearby Dades and Todra Gorges, as well as the vast expanse of the Sahara Desert.",
      previewImgs: [
        "assets/popular/akchour2.jpeg",
        "assets/popular/akchour1.png"
      ],
      listcoments: []),
  CardModule(
      id: 18,
      price: 20.00,
      location: 'Atlas Mountains, Central Morocco',
      productImg: 'assets/popular/atlasmountains.jpg',
      productName: 'Atlas Mountains',
      rating: "4.8",
      description:
          "The Atlas Mountains are the spine of Morocco, stretching from the Atlantic coast to the Algerian border. This impressive range is a world of contrasts, offering everything from snow-capped peaks to lush valleys, Berber villages, and bustling cities.The High Atlas is the most renowned part, home to North Africa's highest peak, Mount Toubkal. It's a paradise for hikers and climbers, with stunning trails and breathtaking scenery. The Middle Atlas is known for its cedar forests and Berber culture, while the Anti-Atlas boasts dramatic landscapes and ancient kasbahs.The Atlas Mountains are also home to a rich biodiversity, including rare flora and fauna. Berber villages dot the mountains, offering a glimpse into traditional Moroccan life.",
      previewImgs: [
        "assets/popular/akchour2.jpeg",
        "assets/popular/akchour1.png"
      ],
      listcoments: []),
  CardModule(
      id: 19,
      price: 8.00,
      location: 'Volubilis, Near Meknes',
      productImg: 'assets/popular/volubilis.jpeg',
      productName: 'Meknes',
      rating: "4.8",
      description:
          "Volubilis is a captivating archaeological site near Meknes, showcasing remarkably well-preserved Roman ruins. Once a thriving Roman city, Volubilis offers a fascinating glimpse into the past Wander through the ancient streets, marvel at the triumphal arch, and admire the intricate mosaic floors. The site is a testament to the Romans' engineering and artistic prowess. Its strategic location on the trade routes contributed to its prosperity, and the ruins reflect this opulent past.A visit to Volubilis is a journey back in time, allowing you to explore the remnants of a once-powerful civilization.",
      previewImgs: [
        "assets/popular/akchour2.jpeg",
        "assets/popular/akchour1.png"
      ],
      listcoments: []),
  CardModule(
      id: 20,
      price: 13.00,
      location: 'Citerne Portugaise , El Jadida',
      productImg: 'assets/popular/citernep.jpeg',
      productName: 'El Jadida',
      rating: "4.8",
      description:
          """The Portuguese Cistern is a hidden architectural masterpiece nestled beneath the citadel of El Jadida, formerly known as Mazagan. Built by the Portuguese in the 16th century, this cistern is an impressive testament to their engineering and hydraulic expertise.""",
      previewImgs: [
        "assets/popular/akchour2.jpeg",
        "assets/popular/akchour1.png"
      ],
      listcoments: []),
  
  CardModule(
      id: 22,
      price: 10.00,
      location: 'Moulay Idriss',
      productImg: 'assets/popular/moulayidriss.jpg',
      productName: 'Moulay Idriss Zerhoun',
      rating: "4.8",
      description:
          """Moulay Idriss Zerhoun is a revered holy city in Morocco, named after Idris I, the founder of the Idrisid dynasty and the first Islamic ruler of the country. Located at the foot of Mount Zerhoun, the town exudes a spiritual aura and offers a glimpse into traditional Moroccan life.As a sacred place, Moulay Idriss Zerhoun maintains a strong religious atmosphere. The town's architecture reflects its historical significance, with traditional Moroccan houses and narrow winding streets. Visitors are often drawn to the shrine of Moulay Idriss, a place of pilgrimage for Muslims.""",
      previewImgs: [
        "assets/popular/akchour2.jpeg",
        "assets/popular/akchour1.png"
      ],
      listcoments: []),
  CardModule(
      id: 23,
      price: 12.00,
      location: 'Tafraoute, Anti-Atlas Mountains',
      productImg: 'assets/popular/tafraoute.jpg',
      productName: 'Tafraoute',
      rating: "4.8",
      description:
          """Tafraoute is a captivating town nestled amidst the pink granite mountains of the Anti-Atlas, offering a unique and enchanting experience. Known for its stunning natural beauty, the town is a haven for nature lovers and those seeking a peaceful retreat.The surrounding landscape is characterized by dramatic rock formations, lush oases, and Berber villages, creating a picturesque setting. Visitors can enjoy hiking, exploring the local area, or simply relaxing amidst the tranquil ambiance.Tafraoute is also renowned for its vibrant art scene, with colorful murals adorning the town's buildings. This artistic touch adds a playful and bohemian atmosphere to the already charming destination.""",
      previewImgs: [
        "assets/popular/akchour2.jpeg",
        "assets/popular/akchour1.png"
      ],
      listcoments: []),
  CardModule(
      id: 24,
      price: 15.00,
      location: 'Ifrane, Middle Atlas Mountains',
      productImg: 'assets/popular/ifrane.jpeg',
      productName: 'Ifrane',
      rating: "4.8",
      description:
          """Ifrane is often referred to as the "Switzerland of Morocco" due to its charming Alpine architecture and cool climate. Nestled in the Middle Atlas Mountains, this picturesque town offers a refreshing escape from the bustling cities.Known for its clean air, stunning natural surroundings, and outdoor activities, Ifrane is a popular destination for both Moroccans and international visitors. The town boasts beautiful lakes, lush forests, and charming parks, making it an ideal spot for relaxation and recreation.Ifrane is also a gateway to exploring the Middle Atlas Mountains, offering opportunities for hiking, trekking, and discovering the region's unique flora and fauna.""",
      previewImgs: [
        "assets/popular/akchour2.jpeg",
        "assets/popular/akchour1.png"
      ],
      listcoments: []),
];
