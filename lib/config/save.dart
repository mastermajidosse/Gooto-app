import 'package:shared_preferences/shared_preferences.dart';

class Save {
//   static const String app_name = 'Gooto';
//   static const String app_version = 'version 1.0.0';
//   static const int app_v_code = 1;
//   static bool testing = false;

  static SharedPreferences? prefs;

  static List<String> citiesSaves = [];

  static Future<void> saveCities(List<String> cities) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('cities', cities);
  }

  static Future<List<String>> getCities() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('cities') ?? [];
  }

  getonlyonce() {
    return prefs!.getBool("adsonce");
  }

  setonlyonce(booll) async {
    print(booll);
    return await prefs!.setBool("adsonce", booll);
  }

  static final Allcities = [
    'All Cities',
    'Casablanca',
    'Fes',
    'Tanger',
    'Marrakesh',
    'Sale',
    'Meknes',
    'Rabat',
    'Oujda',
    'Kenitra',
    'Agadir',
    'Tetouan',
    'Temara',
    'Safi',
    'Mohammedia',
    'Khouribga',
    'El Jadida',
    'Beni Mellal',
    "Aït Melloul",
    "Nador",
    "Dar Bouazza",
    "Taza",
    "Settat",
    "Berrechid",
    "Khemisset",
    "Inezgane",
    "Ksar El Kebir",
    "Larache",
    "Guelmim",
    "Khenifra",
    "Berkane",
    "Taourirt",
    "Bouskoura",
    "Fquih Ben Salah",
    "Dcheira El Jihadia",
    "Oued Zem",
    "El Kelaa Des Sraghna",
    "Sidi Slimane",
    "Errachidia",
    "Guercif",
    "Oulad Teima",
    "Ben Guerir",
    "Tifelt",
    "Lqliaa",
    "Taroudant",
    "Sefrou",
    "Essaouira",
    "Fnideq",
    "Sidi Kacem",
    "Tiznit",
    "Tan-Tan",
    "Ouarzazate",
    "Souk El Arbaa",
    "Youssoufia",
    "Lahraouyine",
    "Martil",
    "Ain Harrouda",
    "Suq as-Sabt",
    "Skhirat",
    "Ouazzane",
    "Benslimane",
    "Al Hoceima",
    "Beni Ansar",
    "Mdiq",
    "Sidi Bennour",
    "Midelt",
    "Azrou",
    "Drargua"
  ];
}
