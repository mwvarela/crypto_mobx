import 'package:crypto_mobx/api/api.dart';
import 'package:crypto_mobx/controllers/cryptoController.dart';
import 'package:crypto_mobx/pages/home/widget/crypto_card.dart';
import 'package:crypto_mobx/utils/margin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _controller = CryptoController();

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 240, 240, 1),
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Crypto',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildCard(),
            _buildList(),
          ],
        ),
      ),
    );
  }

  void _loadData() async {
    var load = await CryptoApi.getData(context);
    if (load != null) _controller.changeCryptoData(load.data);
  }

  _buildCard() => Flexible(
        flex: 1,
        child: Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.all(18.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(7.0)),
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [0.1, 0.5, 0.7, 0.9],
              colors: [
                Colors.pink[300],
                Colors.pink[400],
                Colors.red[300],
                Colors.red[400],
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Total Value',
                style: TextStyle(color: Colors.white),
              ),
              cYM(8),
              Text(
                '\$580.00',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 35.0,
                ),
              ),
            ],
          ),
        ),
      );

  _buildList() {
    print(_controller?.cryptoData?.length ?? 0);
    return Flexible(
      flex: 2,
      child: Observer(
        builder: (_) => ListView.builder(
          itemCount: _controller?.cryptoData?.length ?? 0,
          itemBuilder: (_, index) {
            return CryptoCard(
              cryptoData: _controller?.cryptoData[index],
            );
          },
        ),
      ),
    );
  }
}
