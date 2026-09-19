import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ombook/main.dart';

void main() {
  testWidgets('OmBook app loads', (WidgetTester tester) async {
    await tester.pumpWidget(const OmBookApp());
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
