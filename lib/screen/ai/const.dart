const String GEMINI_API_KEY = 'AIzaSyDHRCG6Ig1LIn28lfRljDrdNZIHvF5a908';

var  places= {
  "plages": {
      "Casablanca": [
          {"nom": "Plage de tamaris"},
          {"nom": "Paloma","image":"https://scontent.frba2-1.fna.fbcdn.net/v/t39.30808-6/302709714_522321386365229_7094487219566670857_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=6ee11a&_nc_eui2=AeGjzofm3OLAMMyjo_CY2KespVZuALaQmk6lVm4AtpCaTvh9_88uTgbMBuK4b_0TqVMWQsaMsckMxJZt_IUg79Ln&_nc_ohc=2cGEEuEwAxYQ7kNvgGKdif6&_nc_ht=scontent.frba2-1.fna&oh=00_AYA0GdgJIUDJJrDLCtQwwQwC7ePblxZMUVSi8EZF7w_ZSQ&oe=66A6DB66"}
      ],
      "mohammedia": [
          {"nom": "sablet"},
          {"nom": "malisman"}
      ]
  },
  "popular_destination_in_morocco_et_leur_image": [
      {
          "nom": "Essouira","image":"https://www.visitmorocco.com/sites/default/files/styles/thumbnail_events_slider/public/thumbnails/image/essaouira-port-in-morocco-shot-after-sunset-at-blue-hour-ruslan-kalnitsky.jpg",
          "Activities": [
              {"Activitie_name": "3-hour surf lesson with local"},
              {"Activitie_name": "Hour Horseback Ride on Essaouira Beach"}
          ]
      },
      {"nom": "Akchour"},
      {"nom":"dakhla","image":"https://www.visitmorocco.com/sites/default/files/thumbnails/image/adonet.fr___11.-Les-meilleurs-plages-%C3%A0-visiter-pendant-votre-s%C3%A9jour-%C3%A0-Agadir.jpg","description":"Located in the south of Morocco, Dakhla is a small part of paradise, lost between the waters of the Atlantic and the sands of the Sahara. It gives you a complete change of scenery. Kilometres of beaches expand from one side of the town to the other: an opportunity to relax, and indulge in all kinds of water activities. These shores are one of the most beautiful ones in Morocco"},
      {"nom":"ifrane","image":"https://www.visitmorocco.com/sites/default/files/thumbnails/image/ifrane-lac.jpg"},
      {"nom":"azilal","image":"https://www.visitmorocco.com/sites/default/files/thumbnails/image/azilal.jpg"},
      {"nom":"chfchaouane","image":"https://www.carwiz.rent/data/public/2022-12/cw_chefchaouen4_1639c4a1400fac.jpg"},
      {"nom":"casablanca","image":"https://media.tacdn.com/media/attractions-splice-spp-674x446/11/e7/a0/db.jpg"},
      {"nom":"alhouciema","image":"https://friendlymorocco.com/wp-content/uploads/2017/05/Al-Hoceima-Morocco-Things-To-Do-as-a-tourist-950x640.jpg"},
      {"nom": "Bin el ouidane"},
      {"nom":"El jadida","image":"https://passporterapp.com/en/blog/wp-content/uploads/2022/02/El-Jadida-Morocco.jpeg"},
      {"nom": "Taghazout"},
      {"nom": "Bin el Ouidane lake"},
      {"nom":"fes","image":"https://cdn.kimkim.com/files/a/images/2383dec353573d5fdab0c729fdf446159f972d95/big-cb0f68b7a02884a4ddc0c21ae1bc9c08.jpg"},
      {"nom":"agadir","image":"https://www.visitmorocco.com/sites/default/files/thumbnails/image/Catamaran_0.jpg"},
      {"nom":"Marrakech","image":"https://www.visitmorocco.com/sites/default/files/styles/thumbnail_destination_background_top5/public/thumbnails/image/koutoubia-mosque-minaret-located-at-medina-quarter-of-marrakesh-morocco-balate-dorin.jpg"},
      {"nom":"Meknes","image":"https://www.visitmorocco.com/sites/default/files/styles/thumbnail_events_slider/public/thumbnails/image/sahrij-swani-an-artificial-lake-in-meknes-morocco-leonid-andronov.jpg"},
      {"nom": "Lalla Takerkoust"},
      
      {
          "nom": "Ouarzazate",
          "image": "https://www.visitmorocco.com/sites/default/files/styles/thumbnail_events_slider/public/thumbnails/image/kasbah-amridil-skoura-ouarzazate-region.jpg"
      },
      {
          "nom": "Saidia",
          "image": "https://www.visitmorocco.com/sites/default/files/styles/thumbnail_events_slider/public/thumbnails/image/hotel-be-live.jpg"
      },
      {
          "nom": "Rabat",
          "image": "https://www.visitmorocco.com/sites/default/files/styles/thumbnail_events_slider/public/thumbnails/image/oudayas.jpg"
      },
      {
          "nom": "Safi",
          "image": "https://www.visitmorocco.com/sites/default/files/styles/thumbnail_destination_background_top5/public/thumbnails/image/dar-el-bahar-fortress-at-safi-on-the-atlantic-coast-morocco-anibal-trejo_0.jpg"
      },
      {
          "nom": "Tangier",
          "image": "https://www.grayline.com/wp-content/uploads/2023/02/Things-to-do-in-TANGIER-MOROCCO-Gray-Line-Worldwide.jpg"
      },
      {
          "nom": "Taroudant",
          "image": "https://www.visitmorocco.com/sites/default/files/thumbnails/image/desert_1.jpg"
      },
      {
          "nom": "Tetouan",
          "image": "https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEg1u2i481kAbHJy6cjDfZhOh8b9eDfyz6gMc4HTI2euS8GXYT5CKGGVvTvySTdu-fRe9Pt0LI30BLfNF4e338bthU3vcrqWS_v9B7b-Tkow62vwq4Rw-5d-acTJXwGHuPXBVFjLoKj3vxlM/s1600/Snapseed+371+%25281%2529-min.jpg"
      },
      
      
      {
          "nom": "Merzouga",
          "Activities": [
              {"Activitie_name": "3-day desert Safari with food"}
          ]
      },
      {
          "nom": "beni mellal",
          "Activities": [
              {"Activitie_name": "parachute air club"}
          ]
      },
      {"nom":"lalla Takersout"}
],
"hi":{"hi":"salut comment je peux vous aider pour choisir les plages des villes les destinations populaire et les activité frequent"},
"morrocan_mens_clothes_and_images":{
    "belgha ou babouche":[
        {"image":"https://scontent.frba3-2.fna.fbcdn.net/v/t45.5328-4/417946436_436018312424150_2729781561339719751_n.jpg?stp=dst-jpg_s960x960&_nc_cat=106&ccb=1-7&_nc_sid=247b10&_nc_eui2=AeGnErm7lRj7F8x0DXl4QCEYBCj5CxloBZMEKPkLGWgFk5JvxYBJyc8_6lTJjXJC4h2Q9bRvJ2VgY6qbjedaqMSU&_nc_ohc=I2RTx9yZetIQ7kNvgENF4ZJ&_nc_ht=scontent.frba3-2.fna&oh=00_AYBLfGxayQDbjuFZkUkQ7NbeDfi5uqjoq1T6xlBW9RM-3Q&oe=66AD3659","price":"entre 50DH et 300DH "}],
    "jelaba":[
        {"image":"https://scontent.frba3-1.fna.fbcdn.net/v/t45.5328-4/436411878_981566273362752_5508133611688022201_n.jpg?stp=dst-jpg_s960x960&_nc_cat=104&ccb=1-7&_nc_sid=247b10&_nc_eui2=AeF1LS1Ruz6VH6Enk8sGCcd2xmeDppiedfbGZ4OmmJ519rUqcV5tuJ0gzDwcD69gNV-EivsEAI5vUmzbUesVedoR&_nc_ohc=hF9eVJM14AYQ7kNvgFqW--f&_nc_ht=scontent.frba3-1.fna&oh=00_AYA3A3e6XMmHY54gmMjp6np_sX6b2PBVrVmRdVZrrqLckQ&oe=66AD443C","price":"entre 300dh et 400dh"}]
}

};