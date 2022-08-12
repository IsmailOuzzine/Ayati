import 'package:ayati/Model/mushaf.dart';
import 'package:ayati/choose_mushaf.dart';
import 'package:ayati/choose_surat.dart';
import 'package:ayati/pref_service.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // List<String> netImgs = [];
  List<String> Imgs = [];

  CarouselController myCarousel = CarouselController();
  late TextEditingController _textEditingController;
  late int _currentIndex;
  late int _mark;
  late Mushaf choosedMushaf;

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
    _textEditingController = TextEditingController();
    // print(Get.arguments);
    _mark = Get.arguments[0];
    choosedMushaf = Get.arguments[1];
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    /*return Scaffold(
      body: Center(
        child: Text(
          'Get.arguments : ${Get.arguments[1]}'
        ),
      ),
    );*/
    for (int i = 1; i < 605; i++) {
      Imgs.add('$i.${choosedMushaf.filesExt}');
    }

    return Scaffold(
      backgroundColor: choosedMushaf.bgcolor,
      appBar: AppBar(
        title : const Text(
            'آياتي - المصحف الشريف',
          style: TextStyle(
            fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: choosedMushaf.appBarColor,
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: choosedMushaf.fontColor,
              ),
              child : Center(
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/${choosedMushaf.logoPath}'),
                  radius: 60.0,
                ),
              ),
            ),
            TextButton.icon(
              style: TextButton.styleFrom(
                padding: EdgeInsets.all(20.0),
              ),
              icon: Icon(
                Icons.app_registration_rounded,
                color: choosedMushaf.fontColor,
              ),
              label: Text(
                    'تغيير السورة',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: choosedMushaf.fontColor,
                      fontSize: 16.0
                  ),
                ),
              onPressed: () async {
                Navigator.pop(context);
                final i = (await Get.to(() => ChooseSurat()) ?? _currentIndex);
                print('newSuratPage : $i');
                myCarousel.jumpToPage(i);
              },
            ),
            TextButton.icon( // PAGE changing
              style: TextButton.styleFrom(
                padding: EdgeInsets.all(20.0),
              ),
              icon: Icon(
                  Icons.auto_stories,
                color: choosedMushaf.fontColor,
              ),
              label: Text(
                    'تغيير الصفحة',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: choosedMushaf.fontColor,
                      fontSize: 16.0
                  ),
                ),
              onPressed: () async {
                final int i = await openDialog('choosePage') ?? _currentIndex;
                print('////////////////////////newSuratPage : $i////////////////////////////////');
                Navigator.of(context).pop();
                myCarousel.jumpToPage(i);
              } ,
            ),
            TextButton.icon( // HIZB changing
              style: TextButton.styleFrom(
                padding: EdgeInsets.all(20.0),
              ),
              icon: Icon(
                Icons.edit_note_rounded,
                color: choosedMushaf.fontColor,
              ),
              label: Text(
                    'تغيير الحزب',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: choosedMushaf.fontColor,
                      fontSize: 16.0
                  ),
                ),
              onPressed: () async {
                final int i = await openDialog('chooseHizb') ?? _currentIndex;
                print('////////////////////////newSuratPage : $i////////////////////////////////');
                Navigator.of(context).pop();
                myCarousel.jumpToPage(i);
              },
            ),
            TextButton.icon( // JUZ' changing
              style: TextButton.styleFrom(
                padding: EdgeInsets.all(20.0),
              ),
              icon: Icon(
                Icons.format_list_numbered,
                color: choosedMushaf.fontColor,
              ),
              label: Text(
                    'تغيير الجزء',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: choosedMushaf.fontColor,
                      fontSize: 16.0
                  ),
                ),
              onPressed: () async {
                final int i = await openDialog('chooseJUZ') ?? _currentIndex;
                print('////////////////////////newSuratPage : $i////////////////////////////////');
                Navigator.of(context).pop();
                myCarousel.jumpToPage(i);
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton.icon( // change the mark
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 0),
                ),
                  icon: Icon(
                      Icons.book_outlined,
                    color: choosedMushaf.fontColor,
                  ),
                  label: Text(
                      'تغيير العلامة',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: choosedMushaf.fontColor,
                        fontSize: 16.0
                    ),
                  ),
                  onPressed: () async {
                    await PrefService.setMark(_currentIndex);
                    Navigator.of(context).pop();
                  },
                ),
                TextButton.icon( // change to mark
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 0),
                ),
                  icon: Icon(
                    Icons.bookmark,
                    color: choosedMushaf.fontColor,
                  ),
                  label: Text(
                      'انتقل إلى العلامة',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: choosedMushaf.fontColor,
                        fontSize: 16.0
                    ),
                  ),
                  onPressed: () async {
                    Navigator.of(context).pop();
                    myCarousel.jumpToPage(_mark);
                  },
                ),
              ],
            ),
            TextButton.icon(
              style: TextButton.styleFrom(
                padding: EdgeInsets.all(20.0),
              ),
              icon: Icon(
                Icons.app_registration_rounded,
                color: choosedMushaf.fontColor,
              ),
              label: Text(
                'تغيير المصحف',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: choosedMushaf.fontColor,
                    fontSize: 16.0
                ),
              ),
              onPressed: () async {
                Navigator.pop(context);
                final i = (await Get.to(() => ChooseMushaf()) ?? PrefService.choosedMushafIndex);
                print('newMushaf : $i');
                await PrefService.setMushaf(i);
                setState(() {
                  choosedMushaf = ChooseMushaf.mushafs[i];
                  for (int i = 1; i < 605; i++) {
                    Imgs[i-1] = '$i.${choosedMushaf.filesExt}';
                  }
                  myCarousel.jumpToPage(_currentIndex);
                });
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
             CarouselSlider.builder(
                itemCount: 604,
                carouselController: myCarousel,
                itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
                  print('choosedMushaf.asset : ${choosedMushaf.asset}');
                  if (choosedMushaf.asset) {
                    return Container(
                      padding: const EdgeInsets.all(0),
                      child: InteractiveViewer(
                          child: Image.asset('${choosedMushaf.path}${Imgs[itemIndex]}')),
                    );
                  }
                  else {
                    return Container(
                      padding: const EdgeInsets.all(0),
                      child: InteractiveViewer(
                          child: Image.network('${choosedMushaf.path}${Imgs[itemIndex]}')),
                    );
                  }
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
                    // shared ...
                    print('_currentIndex = $_currentIndex');
                    setState((){});
                  },
                ),
              ),
            ],
          )
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
                  signed: false, decimal: false
                ),
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, _currentIndex),
                  child: const Text('إلغاء'),
                ),
                TextButton(
                  onPressed: () {
                    int n = _currentIndex;
                    try {
                      n = int.parse(_textEditingController.text) - 1;
                    } catch (e) {
                      n = _currentIndex;
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
    else if (type == 'chooseJUZ') {
      var myList = [];
      for(int i  = 1; i <= 30; i++) {
        myList.add(i);
      }
      return showDialog<int>(
        context: context,
        builder: (BuildContext context) =>
            AlertDialog(
              title: const Text('تغيير الجزء'),
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
                            Navigator.of(context).pop(ChooseSurat.getHizb(e*2 - 1));
                          },
                          child: Center(
                            child: Text(
                              'الجزء ${e.toString()}',
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