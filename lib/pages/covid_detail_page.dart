import 'package:flutter/material.dart';

class CovidDetailPage extends StatelessWidget {
   int snapShot;
   String Country;
   String CountryCode;
   int NewConfirmed;
   int TotalConfirmed;
   int TotalDeaths;

  CovidDetailPage(
      {Key? key,
      required this.snapShot,
      required this.Country,
      required this.CountryCode,
      required this.NewConfirmed,
      required this.TotalConfirmed,
      required this.TotalDeaths})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 275,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/covid.jpeg"),
                      fit: BoxFit.cover),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                child: Column(
                  children: [
                    Text(
                      'Ülke : $Country',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                    ),
                     Text(
                      'Ülke Kodu : $CountryCode',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                     Text(
                      'Yeni Tespitler : $NewConfirmed',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                     Text(
                      'Toplam Tespit Sayısı : $TotalConfirmed',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                     Text(
                      'Toplam Ölüm : $TotalDeaths',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
