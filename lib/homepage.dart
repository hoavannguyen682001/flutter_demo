import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sale 100% con mạc bụt 100 củ'),
      ),
      body: Center(
       child: Column(
         children:  [
           const Padding(padding: EdgeInsets.only(top: 40)),
           const Text('Hãy chọn giá đúng'),
           const Padding(padding: EdgeInsets.only(top: 20)),
           SizedBox(
             width: 100,
             child: TextField(
               keyboardType: const TextInputType.numberWithOptions(decimal: true),
               inputFormatters: [FilteringTextInputFormatter.digitsOnly],
             ),
           ),
           const Padding(padding: EdgeInsets.only(top: 20)),
           ElevatedButton(onPressed:() {},
               child: const Text('Check'))
         ],
        ),
      ),
    );
  }
}
