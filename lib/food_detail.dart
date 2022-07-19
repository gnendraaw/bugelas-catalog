import 'package:bugelas/constraints.dart';
import 'package:flutter/material.dart';
import 'package:bugelas/catalog_data.dart';

class FoodDetail extends StatelessWidget {
  final Catalog catalogData;

  FoodDetail({required this.catalogData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: blackBase,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
          actions: [FavButton()],
          centerTitle: true,
          title: Text(
            'Bugelas Catalog',
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
          ),
        ),
        body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth <= 800) {
            return Body(
              data: catalogData,
            );
          } else {
            return WebPage(data: catalogData);
          }
        }));
  }
}

class Body extends StatelessWidget {
  final Catalog data;

  Body({required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(defaultBorderRadius * 2),
                child: Image.asset(data.imageAsset,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover)),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.all(defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    data.name,
                    style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.w600,
                        color: blackBase),
                    textAlign: TextAlign.left,
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi bibendum in dui et sagittis. Sed quis sem dui. Donec tempus eleifend gravida. Morbi vitae erat maximus, luctus dui non, faucibus arcu. ',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: blackBase.withOpacity(.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Price(data: data),
        ],
      ),
    );
  }
}

class Price extends StatelessWidget {
  final Catalog data;

  Price({required this.data});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: brightBlue,
          borderRadius: BorderRadius.circular(defaultBorderRadius),
        ),
        child: Padding(
          padding: EdgeInsets.all(defaultPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        'Price',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                          color: pureWhite.withOpacity(.5),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'IDR ${data.price}',
                        style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.w600,
                            color: pureWhite),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: pureWhite.withOpacity(.15),
                      borderRadius: BorderRadius.circular(defaultBorderRadius),
                    ),
                    child: Center(
                      child: Text(
                        'Back to main page',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: pureWhite,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FavButton extends StatefulWidget {
  @override
  _FavButtonState createState() => _FavButtonState();
}

class _FavButtonState extends State<FavButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
      icon:
          Icon(isFavorite ? Icons.favorite : Icons.favorite_border, color: red),
    );
  }
}

class WebPage extends StatelessWidget {
  final Catalog data;

  WebPage({required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: defaultPadding * 4, vertical: defaultPadding * 4),
      child: Container(
        decoration: BoxDecoration(
          color: pureWhite,
          borderRadius: BorderRadius.circular(defaultBorderRadius * 4),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(defaultPadding * 2),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(defaultBorderRadius * 2),
                  child: Image.asset(data.imageAsset,
                      height: MediaQuery.of(context).size.height,
                      fit: BoxFit.cover),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: defaultPadding * 2),
                      child: Text(
                        data.name,
                        style: TextStyle(
                            fontSize: 32.0, fontWeight: FontWeight.w600),
                      )),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: defaultPadding * 2),
                    child: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi bibendum in dui et sagittis. Sed quis sem dui. Donec tempus eleifend gravida. Morbi vitae erat maximus, luctus dui non, faucibus arcu.',
                      style: TextStyle(
                          fontSize: 24.0, color: blackBase.withOpacity(.5)),
                    ),
                  ),
                  SizedBox(
                    height: defaultPadding * 2,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: defaultPadding * 2),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: brightBlue,
                        borderRadius:
                            BorderRadius.circular(defaultBorderRadius * 2),
                      ),
                      padding: EdgeInsets.all(defaultPadding * 2),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Price',
                            style: TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.w600,
                                color: pureWhite.withOpacity(.5)),
                          ),
                          Text(
                            'IDR ${data.price}',
                            style: TextStyle(
                                fontSize: 32.0,
                                fontWeight: FontWeight.w600,
                                color: pureWhite),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
