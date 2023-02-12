import 'package:etiya_project/pages/covid_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('appbar Widget Test', (tester) async {
    var appbar = find.byKey(const ValueKey('mainappbar'));

    await tester.pumpWidget(MaterialApp(home: CovidPage()));
    await tester.pumpAndSettle();

    expect(appbar, findsOneWidget); //appbar varmı diye bakılıyor varsa ok
  });
}
