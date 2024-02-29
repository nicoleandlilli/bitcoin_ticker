import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PriceScreenState();
  }
}

class _PriceScreenState extends State<PriceScreen> {

  String selectedCurrency = 'USD';

  List<DropdownMenuItem<String>> getDropdownItem(){
    List<DropdownMenuItem<String>> dropdowItems = [];

    for(int i =0; i < currentciesList.length; i++){
      String currency = currentciesList[i];

      var newItem = DropdownMenuItem(child: Text(currency),
      value: currency,);

      dropdowItems.add(newItem);
    }
    return dropdowItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = ? USD',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            // height: 100.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: DropdownButton<String>(
              value: selectedCurrency,
              items: getDropdownItem(),

            //   [
            //     DropdownMenuItem(child: Text('USD'),value: 'USD',),
            //     DropdownMenuItem(child: Text('EUR'),value: 'EUR',),
            //     DropdownMenuItem(child: Text('GBP'),value: 'GBP',),
            // ],
              onChanged: (value){

                setState(() {
                  selectedCurrency = value!;
                });
            },),
          ),
        ],
      ),
    );
  }
}
