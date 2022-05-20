import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ayati/Model/surat.dart';

class ChooseSurat extends StatelessWidget {
  
  List<Surat> surats = [
    Surat(name: 'الفاتحة',  page: 0, nbAyat: 7), Surat(name: 'البقرة', page: 1, nbAyat: 258), Surat(name: 'آل عمران', page: 49, nbAyat: 200), Surat(name: 'النساء', page: 76, nbAyat: 175), Surat(name: 'المائدة', page: 105, nbAyat: 120),
    Surat(name: 'الأنعام', page: 127, nbAyat: 0), Surat(name: 'الأعراف', page: 150, nbAyat: 0), Surat(name: 'الأنفال', page: 176, nbAyat: 0), Surat(name: 'التوبة', page: 186, nbAyat: 0), Surat(name: 'يونس', page: 207, nbAyat: 0), 
    Surat(name: 'هود', page: 220, nbAyat: 0), Surat(name: 'يوسف', page: 234, nbAyat: 0), Surat(name: 'الرعد', page: 248, nbAyat: 0), Surat(name: 'إبراهيم', page: 254, nbAyat: 0), Surat(name: 'الحجر', page: 261, nbAyat: 0),
    Surat(name: 'النحل', page: 266, nbAyat: 0), Surat(name: 'الإسراء', page: 281, nbAyat: 0), Surat(name: 'الكهف', page: 292, nbAyat: 0), Surat(name: 'مريم', page: 304, nbAyat: 0), Surat(name: 'طه', page: 311, nbAyat: 0), 
    Surat(name: 'الأنبياء', page: 321, nbAyat: 0), Surat(name: 'الحج', page: 331, nbAyat: 0), Surat(name: 'المؤمنون', page: 341, nbAyat: 0), Surat(name: 'النور', page: 349, nbAyat: 0), Surat(name: 'الفرقان', page: 358, nbAyat: 0),
    Surat(name: 'الشعراء', page: 366, nbAyat: 0), Surat(name: 'النمل', page: 376, nbAyat: 0), Surat(name: 'القصص', page: 384, nbAyat: 0), Surat(name: 'العنكبوت', page: 395, nbAyat: 0), Surat(name: 'الروم', page: 403, nbAyat: 0), 
    Surat(name: 'لقمان', page: 410, nbAyat: 0), Surat(name: 'السجدة', page: 414, nbAyat: 0), Surat(name: 'الأحزاب', page: 417, nbAyat: 0), Surat(name: 'سبأ', page: 427, nbAyat: 0), Surat(name: 'فاطر', page: 433, nbAyat: 0),
    Surat(name: 'يس', page: 439, nbAyat: 0), Surat(name: 'الصافات', page: 445, nbAyat: 0), Surat(name: 'ص', page: 452, nbAyat: 0), Surat(name: 'الزمر', page: 547, nbAyat: 0), Surat(name: 'غافر', page: 466, nbAyat: 0), 
    Surat(name: 'فصلت', page: 476, nbAyat: 0), Surat(name: 'الشورى', page: 482, nbAyat: 0), Surat(name: 'الزخرف', page: 488, nbAyat: 0), Surat(name: 'الدخان', page: 495, nbAyat: 0), Surat(name: 'الجاثية', page: 498, nbAyat: 0),
    Surat(name: 'الأحقاف', page: 501, nbAyat: 0), Surat(name: 'محمد', page: 506, nbAyat: 0), Surat(name: 'الفتح', page: 510, nbAyat: 0), Surat(name: 'الحجرات', page: 514, nbAyat: 0), Surat(name: 'ق', page: 517, nbAyat: 0), 
    Surat(name: 'الذاريات', page: 519, nbAyat: 0), Surat(name: 'الطور', page: 522, nbAyat: 0), Surat(name: 'النجم', page: 525, nbAyat: 0), Surat(name: 'القمر', page: 527, nbAyat: 0), Surat(name: 'الرحمن', page: 530, nbAyat: 0),
    Surat(name: 'الواقعة', page: 533, nbAyat: 0), Surat(name: 'الحديد', page: 536, nbAyat: 0), Surat(name: 'المجادلة', page: 541, nbAyat: 0), Surat(name: 'الحشر', page: 544, nbAyat: 0), Surat(name: 'الممتحنة', page: 548, nbAyat: 0),
    Surat(name: 'الصف', page: 550, nbAyat: 0), Surat(name: 'الجمعة', page: 552, nbAyat: 0), Surat(name: 'المنافقون', page: 553, nbAyat: 0), Surat(name: 'التغابن', page: 555, nbAyat: 0), Surat(name: 'الطلاق', page: 557, nbAyat: 0),
    Surat(name: 'التحريم', page: 559, nbAyat: 0), Surat(name: 'الملك', page: 561, nbAyat: 0), Surat(name: 'القلم', page: 563, nbAyat: 0), Surat(name: 'الحاقة', page: 565, nbAyat: 0), Surat(name: 'المعارج', page: 567, nbAyat: 0), 
    Surat(name: 'نوح', page: 569, nbAyat: 0), Surat(name: 'الجن', page: 571, nbAyat: 0), Surat(name: 'المزمل', page: 573, nbAyat: 0), Surat(name: 'المدثر', page: 574, nbAyat: 0), Surat(name: 'القيامة', page: 576, nbAyat: 0),
    Surat(name: 'الإنسان', page: 577, nbAyat: 0), Surat(name: 'المرسلات', page: 579, nbAyat: 0), Surat(name: 'النبأ', page: 581, nbAyat: 0), Surat(name: 'النازعات', page: 582, nbAyat: 0), Surat(name: 'عبس', page: 584, nbAyat: 0), 
    Surat(name: 'التكوير', page: 585, nbAyat: 0), Surat(name: 'الإنفطار', page: 586, nbAyat: 0), Surat(name: 'المطففين', page: 586, nbAyat: 0), Surat(name: 'الإنشقاق', page: 588, nbAyat: 0), Surat(name: 'البروج', page: 589, nbAyat: 0),
    Surat(name: 'الطارق', page: 590, nbAyat: 0), Surat(name: 'الأعلى', page: 590, nbAyat: 0), Surat(name: 'الغاشية', page: 591, nbAyat: 0), Surat(name: 'الفجر', page: 592, nbAyat: 0), Surat(name: 'البلد', page: 593, nbAyat: 0), 
    Surat(name: 'الشمس', page: 594, nbAyat: 0), Surat(name: 'الليل', page: 594, nbAyat: 0), Surat(name: 'الضحى', page: 595, nbAyat: 0), Surat(name: 'الشرح', page: 595, nbAyat: 0), Surat(name: 'التين', page: 596, nbAyat: 0),
    Surat(name: 'العلق', page: 596, nbAyat: 0), Surat(name: 'القدر', page: 597, nbAyat: 0), Surat(name: 'البينة', page: 597, nbAyat: 0), Surat(name: 'الزلزلة', page: 598, nbAyat: 0), Surat(name: 'العاديات', page: 598, nbAyat: 0), 
    Surat(name: 'القارعة', page: 599, nbAyat: 0), Surat(name: 'التكاثر', page: 599, nbAyat: 0), Surat(name: 'العصر', page: 600, nbAyat: 0), Surat(name: 'الهمزة', page: 600, nbAyat: 0), Surat(name: 'الفيل', page: 600, nbAyat: 0),
    Surat(name: 'قريش', page: 601, nbAyat: 0), Surat(name: 'الماعون', page: 601, nbAyat: 0), Surat(name: 'الكوثر', page: 601, nbAyat: 0), Surat(name: 'الكافرون', page: 602, nbAyat: 0), Surat(name: 'النصر', page: 602, nbAyat: 0), 
    Surat(name: 'المسد', page: 602, nbAyat: 0), Surat(name: 'الإخلاص', page: 603, nbAyat: 0), Surat(name: 'الفلق', page: 603, nbAyat: 0), Surat(name: 'الناس', page: 603, nbAyat: 0)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.zero,
        padding: const EdgeInsets.all(50.0),
        child: ListView(
          children: surats.map((e) {
            return Card(
              margin: EdgeInsets.fromLTRB(0, 15.0, 0, 0),
              color: Colors.grey[300],
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Center(
                  child: TextButton(
                    onPressed: () {
                      print(surats.indexOf(e));
                      //  Navigator.pop(context, surats.indexOf(e));
                      Get.back(result: e.page);
                    },
                    child: Center(
                      child: Text(
                        e.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
/*child: ListTile(
  title: Text(e.name),
  onTap: () {
    print(surats.indexOf(e));
    //  Navigator.pop(context, surats.indexOf(e));
    Get.back(result: surats.indexOf(e));
  },
),*/
