import 'dart:ffi';

import 'package:ayati/Model/mushaf.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ayati/Model/mushaf.dart';

class ChooseMushaf extends StatelessWidget {

  static List<Mushaf> mushafs = [
    Mushaf(
      bgcolor: Color.fromRGBO(255, 255, 204, 1),
      fontColor: Colors.brown,
      appBarColor: Colors.brown,
      name: 'warsh',
      logoPath: 'logo.jpg',
      asset: true,
      path: 'images/warsh/',
      filesExt: 'png',
    ),
    Mushaf(
      bgcolor: Colors.white,
      fontColor: Colors.blueGrey,
      appBarColor: Colors.blueGrey,
      name: 'hafs',
      logoPath: 'logo.jpg',
      asset: false,
      path: 'https://www.e-quran.com/language/french/french4/images/qp',
      filesExt: 'gif',
    )
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(250, 250, 255, 1),
      body: Container(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.fromLTRB(20, 40, 20, 0),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Color.fromRGBO(255, 255, 204, 1),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          blurStyle: BlurStyle.outer
                      )
                    ]
                  ),
                  child: Column(
                    children: [
                      const Center(
                        child: Text(
                          'ورش عن نافع',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.brown,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              'images/warsh/293.png',
                              height: 250,
                              width: 250*15 / 24,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              'images/warsh/1.png',
                              height: 250,
                              width: 250*15 / 24,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  print('-- -- -- Mushaf 0 -- -- --');
                  Get.back(result: 0);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        blurStyle: BlurStyle.outer
                      )
                    ]
                  ),
                  child: Column(
                    children: [
                      const Center(
                        child: Text(
                          'حفص عن عاصم',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Color.fromRGBO(68, 129, 156, 1)
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.network(
                              'https://www.e-quran.com/language/french/french4/images/qp293.gif',
                              height: 200,
                              width: 200*3/4,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.network(
                              'https://www.e-quran.com/language/french/french4/images/qp1.gif',
                              height: 200,
                              width: 200*3/4,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  print('-- -- -- Mushaf 1 -- -- --');
                  Get.back(result: 1);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

