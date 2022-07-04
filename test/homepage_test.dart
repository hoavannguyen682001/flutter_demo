import 'package:flutter/material.dart';
import 'package:flutter_demo/homepage.dart';
import 'package:flutter_test/flutter_test.dart';

Finder inputPrice() => find.byKey(const Key('inputPrice'));
Finder nextBtn() => find.text('Next');
Finder checkBtn() => find.text('Check');


void main() {
  testWidgets('Home page test Change Products after each click', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomePage()
    ));
    expect(find.text(products[0].name), findsOneWidget);

    for(int i = 1; i< products.length; i++){
      await tester.tap(find.text('Check'));
      await tester.pump();
      await tester.tap(nextBtn());
      await tester.pump();
      expect(find.text(products[i].name), findsOneWidget);
    }

    await tester.tap(find.text('Check'));
    await tester.pump();
    await tester.tap(nextBtn());
    await tester.pump();
    expect(find.text(products[products.length-1].name), findsOneWidget);
  });

  testWidgets('Check product price and show next product', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomePage()
    ));


    expect(nextBtn(), findsNothing);
    expect(find.byKey(const Key('result')),findsNothing);

    await tester.enterText(inputPrice(),'100');
    await tester.tap(checkBtn());
    await tester.pump();
    expect(checkBtn(), findsOneWidget);
    expect(find.byKey(const Key('result')),findsOneWidget);

    expect(find.text('pass'), findsOneWidget);

    await tester.tap(nextBtn());
    await tester.pump();

    expect(nextBtn(), findsNothing);
    expect(find.byKey(const Key('result')),findsNothing);
    await tester.enterText(inputPrice(),'100');
    await tester.tap(checkBtn());
    await tester.pump();
    expect(checkBtn(), findsOneWidget);
    expect(find.byKey(const Key('result')),findsOneWidget);

    expect(find.text('fail'), findsOneWidget);


  });
}
