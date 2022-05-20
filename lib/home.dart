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
  /*List<int> pages = [
    0, 1, 49, 76, 105, 127, 150, 176, 186, 207,
    220, 234, 248, 254, 261, 266, 281, 292, 304, 311,
    321, 331, 341, 349, 358, 366, 376, 384, 395, 403,
    410, 414, 417, 427, 433, 439, 445, 452, 547, 466,
    476, 482, 488, 495, 498, 501, 506, 510, 514, 517,
    519, 522, 525, 527, 530, 533, 536, 541, 544, 548,
    550, 552, 553, 555, 557, 559, 561, 563, 565, 567,
    569, 571, 573, 574, 576, 577, 579, 581, 582, 584,
    585, 586, 586, 588, 589, 590, 590, 591, 592, 593,
    594, 594, 595, 595, 596, 596, 597, 597, 598, 598,
    599, 599, 600, 600, 600, 601, 601, 601, 602, 602,
    602, 603, 603, 603
  ];*/
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
                final i = (await Get.to(() => ChooseSurat()) ?? 0);
                print('newSuratPage : $i');
                myCarousel.jumpToPage(i);
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
