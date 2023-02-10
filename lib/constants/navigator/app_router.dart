import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:etiya_project/pages/covid_page.dart';
import 'package:flutter/material.dart';

import '../../pages/covid_detail_page.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(replaceInRouteName: 'Page,Route', routes: <AutoRoute>[
  AutoRoute(page: CovidPage, initial: true),
  AutoRoute(page: CovidDetailPage)
])
// extend the generated private router
class AppRouter extends _$AppRouter {}
