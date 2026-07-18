import 'package:flutter_test/flutter_test.dart';
import 'package:random_quete_generator/main.dart';

void main() {
  testWidgets('QuoteVerse app smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const QuoteVerseApp());
    expect(find.byType(QuoteVerseApp), findsOneWidget);
  });
}
