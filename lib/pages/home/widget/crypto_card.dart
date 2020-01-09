import 'package:crypto_mobx/models/cryptoModel.dart';
import 'package:crypto_mobx/utils/margin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CryptoCard extends StatelessWidget {
  final CryptoData cryptoData;

  const CryptoCard({Key key, this.cryptoData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: (DismissDirection direction) {},
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: Colors.white,
        ),
        margin: EdgeInsets.symmetric(horizontal: 18.0, vertical: 9.0),
        child: ListTile(
          contentPadding: EdgeInsets.all(10.0),
          leading: _buildImage(),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      cryptoData?.name ?? '',
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    cYM(8.0),
                    Text(
                      cryptoData?.symbol ?? '',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                        fontSize: 11.0,
                      ),
                    ),
                  ],
                ),
              ),
              cXM(8.0),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      '\$${double.parse(cryptoData?.price).toStringAsFixed(2)}',
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                          fontSize: 14.0, fontWeight: FontWeight.bold),
                    ),
                    cYM(8.0),
                    Text(
                      'Rank: ${cryptoData?.rank ?? 'NaN'}',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                          fontSize: 11.0),
                    ),
                  ],
                ),
              ),
              Container(),
            ],
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                '\$${double?.parse(cryptoData?.md?.priceChange ?? '0.00')}',
                overflow: TextOverflow.clip,
                style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              cYM(8.0),
              Text(
                '${double.parse(cryptoData?.high).toStringAsFixed(2)}',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.red,
                    fontSize: 11.0),
              ),
            ],
          ),
        ),
      ),
      key: Key(cryptoData.id),
    );
  }

  _buildImage() => Card(
        child:
            cryptoData?.logoUrl != null && cryptoData?.logoUrl.contains('svg')
                ? CircleAvatar(
                    maxRadius: 21.0,
                    child: SvgPicture.network(cryptoData?.logoUrl ?? ''),
                    backgroundColor: Colors.white,
                  )
                : CircleAvatar(
                    maxRadius: 21.0,
                    backgroundImage: NetworkImage(cryptoData?.logoUrl ??
                        'https://i.pinimg.com/originals/1f/7d/ec/1f7dec824ddfabb03b890b08d6c3e548.png'),
                  ),
        elevation: 3.0,
        shape: CircleBorder(),
        clipBehavior: Clip.antiAlias,
      );
}
