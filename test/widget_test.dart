
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_animation_marathon/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const AnimationMarathonApp());

    // Verify that the app shows the title.
    expect(find.text('Animation Marathon'), findsOneWidget);
  });
}
