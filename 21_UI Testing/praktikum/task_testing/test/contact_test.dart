import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:task_form/contact_form.dart';

void main() {
  testWidgets('ContactForm widget test', (WidgetTester tester) async {
    // Build our ContactForm widget
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: ContactForm(),
      ),
    ));


    expect(find.text('Name'), findsOneWidget);
    expect(find.text('Phone Number'), findsOneWidget);
    expect(find.text('Submit'), findsOneWidget);

 
    await tester.tap(find.text('Submit'));
    await tester.pump();

   
    final nameField = find.byType(TextField).at(0);
    final phoneField = find.byType(TextField).at(1);

    await tester.enterText(nameField, 'Arya');
    await tester.enterText(phoneField, '082131312');

    await tester.tap(find.text('Submit'));
    await tester.pump();

 
  });
}
