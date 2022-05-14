import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ChooseSurat extends StatelessWidget {

  List<String> surats = [
    'الفاتحة', 'البقرة', 'آل عمران', 'النساء', 'المائدة',
    'الأنعام', 'الأعراف', 'الأنفال', 'التوبة', 'يونس',
    'هود', 'يوسف', 'الرعد', 'إبراهيم', 'الحجر', 'النحل',
    'الإسراء', 'الكهف', 'مريم'
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
                  child: ListTile(
                    title: Text(e),
                    onTap: () {
                      print(surats.indexOf(e));
                    //  Navigator.pop(context, surats.indexOf(e));

                      Get.back(result: surats.indexOf(e));
                    },
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
