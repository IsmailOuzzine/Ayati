import 'package:ayati/choose_surat.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  late SharedPreferences? _prefs ;
  late int? _mark = 0;

  void
  nitMark() async{
    _prefs = await SharedPreferences.getInstance();
    _mark = await _prefs?.getInt('mark');
  }

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
    _textEditingController = TextEditingController();
    initMark();
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
      backgroundColor: Color.fromRGBO(255, 255, 203, 1),
      appBar: AppBar(
        title : const Text(
            'آياتي - المصحف الشريف',
          style: TextStyle(
            fontWeight: FontWeight.bold
          ),
        ),
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
              child : Center(
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/logo.jpg'),
                  radius: 60.0,
                ),
              ),
            ),
            TextButton.icon(
              style: TextButton.styleFrom(
                padding: EdgeInsets.all(20.0),
              ),
              icon: const Icon(
                Icons.app_registration_rounded,
                color: Colors.brown,
              ),
              label: const Text(
                    'تغيير السورة',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.brown,
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
              icon: const Icon(
                  Icons.auto_stories,
                color: Colors.brown,
              ),
              label: const Text(
                    'تغيير الصفحة',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.brown,
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
              icon: const Icon(
                Icons.edit_note_rounded,
                color: Colors.brown,
              ),
              label: const Text(
                    'تغيير الحزب',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.brown,
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
              icon: const Icon(
                Icons.format_list_numbered,
                color: Colors.brown,
              ),
              label: const Text(
                    'تغيير الجزء',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.brown,
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
                  icon: const Icon(
                      Icons.book_outlined,
                    color: Colors.brown,
                  ),
                  label: const Text(
                      'تغيير العلامة',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.brown,
                        fontSize: 16.0
                    ),
                  ),
                  onPressed: () async {
                    _mark = _currentIndex;
                    await _prefs?.setInt('mark', _mark!);
                    Navigator.of(context).pop();
                  },
                ),
                TextButton.icon( // change to mark
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 0),
                ),
                  icon: const Icon(
                    Icons.bookmark,
                    color: Colors.brown,
                  ),
                  label: const Text(
                      'انتقل إلى العلامة',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.brown,
                        fontSize: 16.0
                    ),
                  ),
                  onPressed: () async {
                    Navigator.of(context).pop();
                    myCarousel.jumpToPage(_mark!);
                  },
                ),
              ],
            )
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