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
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          '$Country',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 28,
                              color: Colors.teal),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '* Ülke Kodu : $CountryCode',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '* Yeni Tespitler : $NewConfirmed',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '* Toplam Tespit Sayısı : $TotalConfirmed',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '* Toplam Ölüm : $TotalDeaths',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
