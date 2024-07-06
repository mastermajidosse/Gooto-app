import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gooto/utils/img_bigger.dart';

class ImageScreen extends StatefulWidget {
  const ImageScreen({super.key});

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  List<String> images = [
    "https://media.gettyimages.com/id/982105760/fr/photo/ait-benhaddou-ancienne-ville-dans-lafrique-du-nord-maroc.jpg?s=612x612&w=0&k=20&c=Spv0EVF35oIW5KyDszTi_k_7--u1hmkFO9kVD4P4xU4=",
    "https://media.gettyimages.com/id/1294321554/fr/photo/mosqu%C3%A9e-de-koutoubia-le-matin-marrakech-maroc.jpg?s=612x612&w=0&k=20&c=FkV-foSN3510UUPrP7Ol1F4P1hgRjKl1hQdyZklRXtA=",
    "https://media.gettyimages.com/id/182059497/fr/photo/le-maroc.jpg?s=612x612&w=0&k=20&c=c2s0vUjNYXmH0wxdryNsiBl2UuGuChdoM_ROuREjdHc=",
    "https://media.gettyimages.com/id/653452628/fr/photo/rues-de-f%C3%A8s.jpg?s=612x612&w=0&k=20&c=KAOm52SeKt3IqHJiTLUEa7Xh_JfSL4Ar5CbAP1HNRcs=",
    "https://media.gettyimages.com/id/1294325441/fr/photo/pavillon-saadien-jardins-de-menara-et-atlas-%C3%A0-marrakech-maroc-afrique.jpg?s=612x612&w=0&k=20&c=212u0_kobcCmJpI0qXUJwRDjmdeAqWQLqTeqXD51DJM=",
    "https://media.gettyimages.com/id/155157473/fr/photo/les-touristes-en-train-de-chameaux-%C3%A0-sahara-dirig%C3%A9e-par-un-guide.jpg?s=612x612&w=0&k=20&c=iBPl5vONS28V3lB0UMaZdpdMA9LVrGl0QviKPlZBxu8=",
    "https://media.gettyimages.com/id/505134700/fr/photo/alleyway-%C3%A0-chefchaouen-morocoo.jpg?s=612x612&w=0&k=20&c=ynxI_BemfMmp9YiDmtq_DddFxXj2qsv_kN6e41SRq_A=",
    "https://media.gettyimages.com/id/1450546518/fr/photo/picturesque-view-of-rabat-moroccos-capital-city.jpg?s=612x612&w=0&k=20&c=D80Cjyh-6IpOq2kAd-fJaYlDQxU-pZWSD2St3VT2qd8=",
    "https://media.gettyimages.com/id/1334705699/fr/vectoriel/maroc-drapeau-du-pays-africain.jpg?s=612x612&w=0&k=20&c=fBfXAQX-laPsaWeDnUdphoXwfblnpQb7WJLoh3s1c58=",
    "https://media.gettyimages.com/id/985889774/fr/photo/tapis-faits-main-et-des-tapis-maroc.jpg?s=612x612&w=0&k=20&c=wQeX4IWf4kSOOUXjhOGT7B65JX6YkaBLEFB37H0rtu0=",
    "https://media.gettyimages.com/id/1146362539/fr/photo/low-angle-view-of-koutoubia-mosque-in-marrakesh-morocco.jpg?s=612x612&w=0&k=20&c=xch9uT5NofEl-nOH4cptZWsNR_fRMzFWUly3EMLrF2A=",
    "https://media.gettyimages.com/id/181048438/fr/photo/maroc-dans-une-mosqu%C3%A9e.jpg?s=612x612&w=0&k=20&c=nReT1xUMaldZFLf5pNaQCuCrOlj3GaoSjfOXnrszayg=",
    "https://media.gettyimages.com/id/1448165132/fr/photo/doha-qatar-morocco-players-celebrate-after-the-1-0-win-during-the-fifa-world-cup-qatar-2022.jpg?s=612x612&w=0&k=20&c=DFVL_SgnmRvLPn4YZKBeMX4H8B5S0EY7LK8yueWljY8=",
    "https://media.gettyimages.com/id/1170272200/fr/photo/mosqu%C3%A9e-hassan-ii-%C3%A0-casablanca-sur-le-fond-bleu-de-ciel-sans-nuages.jpg?s=612x612&w=0&k=20&c=uWsjCIRPbTkaRM9LclCxOYuOHVqZeilsOvPgoxkCKho=",
    "https://media.gettyimages.com/id/1147845167/fr/photo/ancient-village-set-in-hill.jpg?s=612x612&w=0&k=20&c=WRUtS4S5pCL1VF0us8z30_E_v-yCIXK-T6XI-2Q3AxU=",
    "https://media.gettyimages.com/id/481618375/fr/photo/jeune-culture-touareg-avec-chameau-sur-sahara-occidental-en-afrique.jpg?s=612x612&w=0&k=20&c=BBf2_iNrAPuRZv_8VacNvySzUhx3eAJZvMxmtkYX2W0=",
    "https://media.gettyimages.com/id/184104044/fr/photo/arche-de-larchitecture-marocaine-avec-des-carreaux-mod%C3%A8le-de-design-int%C3%A9rieur.jpg?s=612x612&w=0&k=20&c=uDTugrfIsFC_tQ_DlVKyZsmuwyxaagRRADBeE7VBUe8=",
    "https://media.gettyimages.com/id/1464913338/fr/photo/wide-shot-couple-talking-to-spice-shop-owner-in-the-souks-of-marrakech.jpg?s=612x612&w=0&k=20&c=47O1ZwggqQay_QwkIzSTUFggKZPegfyfjO_v4WY6K_A=",
    "https://media.gettyimages.com/id/1447197551/fr/photo/al-rayyan-qatar-morocco-players-celebrates-after-the-teams-victory-in-the-penalty-shoot-out.jpg?s=612x612&w=0&k=20&c=ApzO51JIuja9eju-WLfpyDrKdVacY6MB0YELfWU0E6c=",
    "https://media.gettyimages.com/id/471994791/fr/photo/homme-travaillant-dans-une-tannerie-maroc-f%C3%A8s.jpg?s=612x612&w=0&k=20&c=8D3s53hJde1SI8Sy1EnoMhHhbiiYxMTLPFuKLmvetkA=",
    "https://media.gettyimages.com/id/1448189352/fr/photo/doha-qatar-achraf-dari-and-walid-cheddira-of-morocco-celebrate-the-teams-1-0-victory-in-the.jpg?s=612x612&w=0&k=20&c=QMHiRzaM7uJ9jumWw2YSdtV-zzskwF8P2BpLjmigHdo=",
    "https://media.gettyimages.com/id/1653681224/fr/photo/marrakesh-morocco-a-view-of-a-person-on-rubble-after-a-7-magnitude-earthquake-in-marrakesh.jpg?s=612x612&w=0&k=20&c=BymKuCMrcOaN09DXTEGKXotDBwyyxrUh7pZGgz_envw=",
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: 26, left: 8, right: 8),
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: images.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    barrierColor: Colors.transparent,
                    builder: (context) {
                      return ImageBigger.imagePopAssNet(
                        images[index],
                        context,
                      );
                    });
              },
              child: Container(
                width: 200,
                height: 200,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  image: DecorationImage(
                    // image: AssetImage("assets/ci/" + images[index]),
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      images[index],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
