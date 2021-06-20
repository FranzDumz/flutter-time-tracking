import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:udemy_app/common_widgets/CustomRaisedButton.dart';

void main() {
  testWidgets('', (WidgetTester tester) async {
    var pressed = false;
    await tester.pumpWidget(MaterialApp(home: CustomRaisedButton(child: Text('tap me'),
    onPressed: ()=>pressed = true,)));
    final button = find.byType(RaisedButton);
    expect(button, findsOneWidget);
    expect(find.byType(FlatButton), findsNothing);
    expect(find.text('tap me'), findsOneWidget);
    await tester.tap(button);
  });
}
