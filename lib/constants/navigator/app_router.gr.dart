// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    CovidRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: CovidPage(),
      );
    },
    CovidDetailRoute.name: (routeData) {
      final args = routeData.argsAs<CovidDetailRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: CovidDetailPage(
          key: args.key,
          snapShot: args.snapShot,
          Country: args.Country,
          CountryCode: args.CountryCode,
          NewConfirmed: args.NewConfirmed,
          TotalConfirmed: args.TotalConfirmed,
          TotalDeaths: args.TotalDeaths,
        ),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          CovidRoute.name,
          path: '/',
        ),
        RouteConfig(
          CovidDetailRoute.name,
          path: '/covid-detail-page',
        ),
      ];
}

/// generated route for
/// [CovidPage]
class CovidRoute extends PageRouteInfo<void> {
  const CovidRoute()
      : super(
          CovidRoute.name,
          path: '/',
        );

  static const String name = 'CovidRoute';
}

/// generated route for
/// [CovidDetailPage]
class CovidDetailRoute extends PageRouteInfo<CovidDetailRouteArgs> {
  CovidDetailRoute({
    Key? key,
    required int snapShot,
    required String Country,
    required String CountryCode,
    required int NewConfirmed,
    required int TotalConfirmed,
    required int TotalDeaths,
  }) : super(
          CovidDetailRoute.name,
          path: '/covid-detail-page',
          args: CovidDetailRouteArgs(
            key: key,
            snapShot: snapShot,
            Country: Country,
            CountryCode: CountryCode,
            NewConfirmed: NewConfirmed,
            TotalConfirmed: TotalConfirmed,
            TotalDeaths: TotalDeaths,
          ),
        );

  static const String name = 'CovidDetailRoute';
}

class CovidDetailRouteArgs {
  const CovidDetailRouteArgs({
    this.key,
    required this.snapShot,
    required this.Country,
    required this.CountryCode,
    required this.NewConfirmed,
    required this.TotalConfirmed,
    required this.TotalDeaths,
  });

  final Key? key;

  final int snapShot;

  final String Country;

  final String CountryCode;

  final int NewConfirmed;

  final int TotalConfirmed;

  final int TotalDeaths;

  @override
  String toString() {
    return 'CovidDetailRouteArgs{key: $key, snapShot: $snapShot, Country: $Country, CountryCode: $CountryCode, NewConfirmed: $NewConfirmed, TotalConfirmed: $TotalConfirmed, TotalDeaths: $TotalDeaths}';
  }
}
