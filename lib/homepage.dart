import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/productInfo.dart';

//List products

final List<ProductInfo> products = [
  ProductInfo('Bluetooth Mouse', 100),
  ProductInfo('KeyBoard', 250),
  ProductInfo('HeadPhone', 120),
  ProductInfo('Camera', 10),
  ProductInfo('Speaker', 18)
];

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _indexProduct = 0;
  int? _inputPrice;
  String _result = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hãy chọn giá đúng'),
      ),
      body: Center(
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.only(top: 40)),
            Text(products[_indexProduct].name),
            const Padding(padding: EdgeInsets.only(top: 20)),
            SizedBox(
              width: 100,
              child: TextField(
                key: const Key('inputPrice'),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                onChanged: (value) {
                  _inputPrice = int.tryParse(value);
                },
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 20)),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    _result = _inputPrice == products[_indexProduct].price
                        ? 'pass'
                        : 'fail';
                  });
                },
                child: const Text('Check')),
            Visibility(
                visible: _result.isNotEmpty,
                child: Text(
                  _result,
                  key: const Key('result'),
                )),
            Visibility(
              visible: _result.isNotEmpty,
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _result = '';
                      if (_indexProduct < 4) {
                        _indexProduct++;
                      }
                    });
                  },
                  child: const Text('Next')),
            )
          ],
        ),
      ),
    );
  }
}
