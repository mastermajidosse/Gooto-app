class AudioModel {
  String audio;
  int? id;
  String name;
  String logo;
  String desc;
  List<String> photos;
  String? flagname;

  AudioModel({
    required this.audio,
    required this.desc,
    this.id,
    required this.name,
    required this.logo,
    this.flagname,
    required this.photos,
  });
  static AudioModel fromData(map) {
    print(map['tags'].toString());
    return AudioModel(
      id: map['id'],
      desc: map['description'].toString(),
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
    desc: "Create By GooTo",
    flagname:"Create By GooTo" ,
    id:1 ,
    logo:"assets/popular/rabat.jpeg" ,
    name: "Rabat,CapitalHistory",
    photos: ["assets/Rabat.webp","assets/theatreRabat.jpeg","assets/rabatcapitale.jpg","assets/popular/rabat.jpeg"]),
     AudioModel(
    audio: 'agadir.wav',
    desc: "",
    flagname:"Create By GooTo" ,
    id:1 ,
    logo:"assets/popular/Agadire.jpeg" ,
    name: "Agadir,Bride of the South ",
    photos: ["assets/popular/agadire2.jpeg","assets/popular/agadire3.jpeg","assets/popular/agadire4.jpeg","assets/popular/Agadirs-beach.webp"]),
     AudioModel(
    audio: 'chaoun.wav',
    desc: "",
    flagname:"Create By GooTo" ,
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
