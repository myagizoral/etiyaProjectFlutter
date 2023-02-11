import 'package:etiya_project/constants/navigator/app_router.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/covid_bloc/covid_bloc.dart';
import '../models/covid_model.dart';
import 'package:auto_route/auto_route.dart';
import 'covid_detail_page.dart';
import 'dart:developer';

class CovidPage extends StatefulWidget {
  @override
  _CovidPageState createState() => _CovidPageState();
}

class _CovidPageState extends State<CovidPage> {
  int indexSnapshot = 0;

  List<Map<String, dynamic>> allCountry = [];

  final CovidBloc _covidBloc = CovidBloc();
  @override
  void initState() {
    _covidBloc.add(GetCovidList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('COVID-19 Takip Platformu')),
      body: _buildListCovid(),
    );
  }

  Widget _buildListCovid() {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: BlocProvider(
        create: (_) => _covidBloc,
        child: BlocListener<CovidBloc, CovidState>(
          listener: (context, state) {
            if (state is CovidError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message!),
                ),
              );
            }
          },
          child: BlocBuilder<CovidBloc, CovidState>(
            builder: (context, state) {
              if (state is CovidInitial) {
                return _buildLoading();
              } else if (state is CovidLoading) {
                return _buildLoading();
              } else if (state is CovidLoaded) {
                return _buildCard(context, state.covidModel);
              } else if (state is CovidError) {
                return Container();
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, CovidModel model) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        TextField(
          onSubmitted: (value) {
            if (value.toLowerCase() == model.countries![listebul(model, value)].country.toString().toLowerCase()) {
              context.router.navigate(CovidDetailRoute(
                  snapShot: indexSnapshot,
                  Country: (model.countries![listebul(model, value)].country).toString(),
                  CountryCode:
                      (model.countries![listebul(model, value)].countryCode).toString(),
                  NewConfirmed:
                      (model.countries![listebul(model, value)].newConfirmed)!.toInt(),
                  TotalConfirmed:
                      (model.countries![listebul(model, value)].totalConfirmed)!.toInt(),
                  TotalDeaths:
                      (model.countries![listebul(model, value)].totalDeaths)!.toInt()));
            }
          },
          decoration: const InputDecoration(
              labelText: 'Search', suffixIcon: Icon(Icons.search)),
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: covidBuilder(model),
        ),
      ],
    );
  }

  ListView covidBuilder(CovidModel model) {
    return ListView.builder(
      itemCount: model.countries!.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            context.router.navigate(CovidDetailRoute(
                snapShot: indexSnapshot,
                Country: (model.countries![index].country).toString(),
                CountryCode: (model.countries![index].countryCode).toString(),
                NewConfirmed: (model.countries![index].newConfirmed)!.toInt(),
                TotalConfirmed:
                    (model.countries![index].totalConfirmed)!.toInt(),
                TotalDeaths: (model.countries![index].totalDeaths)!.toInt()));
          },
          child: Container(
            margin: EdgeInsets.all(8.0),
            child: Card(
              child: Container(
                margin: EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      "${model.countries![index].country}",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildLoading() => Center(child: CircularProgressIndicator());

  listebul(CovidModel model, String value) {
    for (int i = 0; i <= model.countries!.length; i++) {
      if (value.toLowerCase() == model.countries![i].country.toString().toLowerCase()) {
        return i;
      }
    }
  }
}
