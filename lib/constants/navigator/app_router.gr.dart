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
  }) : super(
          CovidDetailRoute.name,
          path: '/covid-detail-page',
          args: CovidDetailRouteArgs(
            key: key,
            snapShot: snapShot,
          ),
        );

  static const String name = 'CovidDetailRoute';
}

class CovidDetailRouteArgs {
  const CovidDetailRouteArgs({
    this.key,
    required this.snapShot,
  });

  final Key? key;

  final int snapShot;

  @override
  String toString() {
    return 'CovidDetailRouteArgs{key: $key, snapShot: $snapShot}';
  }
}
