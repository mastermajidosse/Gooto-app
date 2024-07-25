class AudioModel {
  String audio;
  int? id;
  String name;
  String logo;
  List<String> desc;
  List<String> photos;
  String flagname;

  AudioModel({
    required this.audio,
    required this.desc,
    this.id,
    required this.name,
    required this.logo,
    required this.flagname,
    required this.photos,
  });
  static AudioModel fromData(map) {
    print(map['tags'].toString());
    return AudioModel(
      id: map['id'],
      desc: map['description'],
      name: map['name'].toString(),
      flagname: map['country']['flagname'].toString(),
      logo: map['images'][0].toString(),
      photos: map['photo'],
       audio: '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      // 'id': id,
      'desc': desc,
      "name": name,
      "image": logo,
    };
  }
}
List<AudioModel> audio=[
  AudioModel(
    audio: 'Rabat.mp3',
    flagname: "Create By GooTo",
    desc:["Rabat, the stunning capital city of Morocco, is a captivating blend of ancient history and modern sophistication,",
    ". Located along the Atlantic coast, this vibrant metropolis serves as the political and administrative center of the Kingdom of Morocco.",
    " One of the most distinctive features of Rabat is its well -preserved historic core, the Khazba of the Udayas.",
    " This UNESCO World Heritage site dates back to the 12th century and features impressive fortified walls,",
    " intricate Islamic architecture, and winding narrow streets that evoke these rich past. Visitors can explore the Khazba's picturesque blue and white houses,",
    " ornate gateways, and the magnificent Andalusian gardens. The Hassan Tower, an unfinished 12th century minaret,",
    " is another iconic landmark that dominates Rabat's skyline. Standing at an impressive 140 feet tall,",
    " the tower was intended to be part of one of the but construction was halted in the early 1200s. Nearby,",
    " the mausoleum of Muhammad V is a stunning example of Alawit dynasty architecture with its mix of Moorish and modern styles.",
    " Beyond the historic district, Rabat boasts a vibrant contemporary culture. The Vilnouvelle, or New City, features wide boulevards,",
    " impressive government buildings, and a thriving commercial district. Visitors can explore the lively Medina, browse the bustling markets,",
    " and savor the diverse culinary offerings that reflect Morocco's rich gastronomic traditions. The picturesque Buregreg River,",
    " which flows through the heart of Rabat, is another highlight of the city. Strolling along the river's banks or taking a boat tour provides visitors with stunning views of the city's landmarks and the Atlantic Ocean.",
    " Overall, Rabat is a captivating destination that offers a unique blend of ancient history, cultural richness, and modern urban life." ],
    id:1 ,
    logo:"assets/popular/rabat.jpeg" ,
    name: "Rabat,CapitalHistory",
    photos: ["assets/Rabat.webp","assets/theatreRabat.jpeg","assets/rabatcapitale.jpg","assets/popular/rabat.jpeg"]),
     AudioModel(
    audio: 'agadir.wav',
    flagname: "Create By GooTo",
    desc:["In the south of the country, bordered by the waves of the Atlantic,",
    " Agadir is one of the pearls of Morocco. Whatever the season,",
    " the sun pours its rays, and the city enjoys a pleasant climate that the trade winds still soften.",
    " Above all, its 10 -kilometer -long seafront offers tourists magnificent views of the blue ocean and the opportunity to laze around in the best conditions.",
    " The main seaside resort of the country, the city, with 300 days of sunshine per year, ",
    "is full of activities. At the water's edge, CAF -S and restaurants open their doors to you, introduce you to the local gastronomy,",
    " and submit their specialities to the enlightened judgments of your taste buds. Further on in the city, ",
    "the el had souk spreads out through the streets, deploys its stalls, more than 6 ,000 shops offer themselves to your curiosity,",
    " and you will enjoy strolling in this atmosphere animated by the negotiations of the merchants. Never sleepy",
    " the city welcomes every summer the Timatar festival dedicated to world music and more specifically to amazing music dot open to the ocean and the world.",
    " Agadir is an active city where it is good to relax."] ,
    id:1 ,
    logo:"assets/popular/Agadire.jpeg" ,
    name: "Agadir,Bride of the South ",
    photos: ["assets/popular/agadire2.jpeg","assets/popular/agadire3.jpeg","assets/popular/agadire4.jpeg","assets/popular/Agadirs-beach.webp"]),
     AudioModel(
    audio: 'chaoun.wav',
    flagname: "Create By GooTo",
    desc:["Built on a mountainside, Chef Shawan is a city with a special vibes.", 
    "It unique charm gives an impression of unreality. With its blue rinsed houses,",
     "the whole city seems to be bathed in azure. You walk around us if you were in a dream. More than just an ornament,",
     " the beautiful Chef Shawan brims with attractions. Its heritage is rich. ",
     'The inescapable Medina with its famous narrow winding alleys is an opportunity to mingle with the local population and to smell',
     " and tasted lights from freshly baked bread to skillfully prepared teagans. ",
     "There is also the Casbah, which stands in the middle of the old quarter.",
     " Its lush gardens, located in the center of the city, are a haven of freshness.",
     " Its museum, which is home to a collection of old weapons, some photos of the city and textiles,",
     " is a must -see. Boasting its unique geographical position, Chef Shawan is a paradise for walkers.",
     " Paths of the surrounding mountains offer pleasant hiking activities ",
     ".ul explore a new side of Morocco, that of the Rift Mountain Range, as you stroll them.",
     " Make the most of your stay in the picture -perfect blue city."] ,
    id:1 ,
    logo:"assets/popular/chefchaouen.jpeg" ,
    name: "chefchaouen,Blue city",
    photos: ["assets/popular/chefchaouen1.jpeg","assets/popular/chefchaouen2.jpeg","assets/popular/chefchaouen3.jpeg","assets/popular/chefchaouen.jpeg"]),
    //  AudioModel(
    // audio: 'test.mp3',
    // desc: "",
    // flagname:"Create By GooTo" ,
    // id:1 ,
    // logo:"assets/Rabat.webp" ,
    // name: "Rabat Capital,History",
    // photos: ["assets/Rabat.webp","assets/theatreRabat.jpeg","assets/rabatcapitale.jpg"]),
    //      AudioModel(
    // audio: 'test.mp3',
    // desc: "",
    // flagname:"Create By GooTo" ,
    // id:1 ,
    // logo:"Rabat.webp" ,
    // name: "Rabat Capital,History",
    // photos: ["assets/Rabat.webp","assets/theatreRabat.jpeg","assets/rabatcapitale.jpg"]),

];
