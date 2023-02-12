import 'package:etiya_project/constants/navigator/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/covid_bloc/covid_bloc.dart';
import '../models/covid_model.dart';
import 'package:auto_route/auto_route.dart';


import 'classes/functions.dart';

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
    final post = Functions();
    return Scaffold(
      key: Key('mainScaffold'),
      drawer: Drawer(
          child: Container(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Mustafa Yağız ORAL',
                style: TextStyle(fontSize: 25),
              ),
            ),
            ListTile(
              title: Text(post.returnpost()),
              onTap: () {},
            ),
             ListTile(
              title: Text('v1.0.0'),
              onTap: () {},
            ),
          ],
        ),
      )),
      appBar: AppBar(
        key: const Key('mainappbar'),
        title: const Text('COVID-19 Takip Platformu')),
      body: _buildListCovid(),
    );
  }

  Widget _buildListCovid() {
    return Container(
      margin: const EdgeInsets.all(8.0),
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
          key:const Key('inputfield'),
          style: const TextStyle(color: Colors.red, fontSize: 23),
          onChanged: (value) {
            final findindex = Functions();
            int index = findindex.findIndex(model, value);
            if (value.toLowerCase() ==
                model.countries![index].country.toString().toLowerCase()) {
              context.router.navigate(CovidDetailRoute(
                  snapShot: indexSnapshot,
                  Country: (model.countries![index].country).toString(),
                  CountryCode: (model.countries![index].countryCode).toString(),
                  NewConfirmed: (model.countries![index].newConfirmed)!.toInt(),
                  TotalConfirmed:
                      (model.countries![index].totalConfirmed)!.toInt(),
                  TotalDeaths: (model.countries![index].totalDeaths)!.toInt()));
            }
          },
          decoration: const InputDecoration(
            labelText: 'Ülke Gir :',
            suffixIcon: Icon(Icons.search),
            labelStyle:
                TextStyle(color: Colors.blue, fontSize: 25 
                    ),
          ),
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
            margin:const EdgeInsets.all(8.0),
            child: Card(
              child: Container(
                margin: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      "${model.countries![index].country}",
                      style:
                          const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
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

  Widget _buildLoading() => const Center(child: CircularProgressIndicator());

}
