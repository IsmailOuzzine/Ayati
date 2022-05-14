import 'package:ayati/choose_surat.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // List<String> netImgs = [];
  List<String> assetImgs = [];
  List<int> pages = [0, 1, 49, 76, 105, 127, 150, 176, 186, 207, 220, 234, 248, 254, 261, 266, 281, 292, 600];
  CarouselController myCarousel = CarouselController();

  @override
  Widget build(BuildContext context) {
    /*for (int i = 1; i < 604; i++) {
      netImgs.add('https://www.e-quran.com/language/french/french4/images/qp$i.gif');
    }*/
    for (int i = 1; i < 605; i++) {
      assetImgs.add('$i.png');
    }

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title : const Text('آياتي - المصحف الشريف'),
        backgroundColor: Colors.brown[600],
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.brown,
              ),
              child : Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              title: const Text('تغيير السورة'),
              onTap: () async {
                Navigator.pop(context);
                final i = (await Get.to(ChooseSurat()) ?? 0);
                print('newSuratPage : $i');
                myCarousel.jumpToPage(pages[i]);
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Update the state of the app
                // print('Item 2');
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          CarouselSlider.builder(
            itemCount: 604,
            carouselController: myCarousel,
            itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
              return Container(
                    padding: const EdgeInsets.all(0),
                    child: InteractiveViewer(
                        child: Image.asset('images/warsh/${assetImgs[itemIndex]}')),
                  );
                },
            options: CarouselOptions(
                aspectRatio: 15/24,
                autoPlay: false,
                enableInfiniteScroll: false,
                viewportFraction: 1.0,
                initialPage: 0,
                reverse: true
            ),
          ),
        ],
      ),
    );
  }
}
