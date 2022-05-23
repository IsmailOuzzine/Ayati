import 'dart:ffi';

import 'package:ayati/choose_surat.dart';
import 'package:flutter/foundation.dart';
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

  CarouselController myCarousel = CarouselController();
  late TextEditingController _textEditingController;
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
    _textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /*for (int i = 1; i < 604; i++) {
      netImgs.add('https://www.e-quran.com/language/french/french4/images/qp$i.gif');
    }*/
    for (int i = 1; i < 605; i++) {
      assetImgs.add('$i.png');
    }

    return Scaffold(
      backgroundColor: Colors.grey[100],
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
                final i = (await Get.to(() => ChooseSurat()) ?? _currentIndex);
                print('newSuratPage : $i');
                myCarousel.jumpToPage(i);
              },
            ),
            ListTile( // PAGE changing
              title: const Text('تغيير الصفحة'),
              onTap: () async {
                final int i = await openDialog('choosePage') ?? _currentIndex + 1;
                print('////////////////////////newSuratPage : $i////////////////////////////////');
                Navigator.of(context).pop();
                myCarousel.jumpToPage(i-1);
              } ,
            ),
            ListTile( // HIZB changing
              title: const Text('تغيير الحزب'),
              onTap: () async {
                final int i = await openDialog('chooseHizb') ?? _currentIndex + 1;
                print('////////////////////////newSuratPage : $i////////////////////////////////');
                Navigator.of(context).pop();
                myCarousel.jumpToPage(i);
              },
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
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
                  reverse: true,
                  onPageChanged: (index, reason) {
                    _currentIndex = index;
                    print('_currentIndex = $_currentIndex');
                    setState((){});
                  },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<int?> openDialog (String type) async {
    if (type == 'choosePage') {
      return showDialog<int>(
        context: context,
        builder: (BuildContext context) =>
            AlertDialog(
              title: const Text('تغيير الصفحة'),
              content: TextField(
                maxLength: 3,
                autofocus: true,
                controller: _textEditingController,
                keyboardType: const TextInputType.numberWithOptions(
                  signed: false, decimal: false),
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child: const Text('إلغاء'),
                ),
                TextButton(
                  onPressed: () {
                    int n = _currentIndex + 1;
                    try {
                      n = int.parse(_textEditingController.text);
                    } catch (e) {
                      n = _currentIndex + 1;
                    }
                    Navigator.pop(context, n);
                  },
                  child: const Text('انتقل'),
                ),
              ],
            ),
      );
    }
    else if (type == 'chooseHizb') {
      var myList = [];
      for(int i  = 1; i <= 60; i++) {
        myList.add(i);
      }
      return showDialog<int>(
        context: context,
        builder: (BuildContext context) =>
        AlertDialog(
          title: const Text('تغيير الحزب'),
          content: SizedBox(
            width: 200.0,
            height: 400.0,
            child: ListView(
              children: myList.map((e) {
                return Card(
                  child: Center(
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.brown[50]),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop(ChooseSurat.getHizb(e));
                      },
                      child: Center(
                        child: Text(
                          'الحزب ${e.toString()}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.brown
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      );
    }
  }
}