import 'package:bugelas/catalog_data.dart';
import 'package:flutter/material.dart';
import 'package:bugelas/constraints.dart';
import 'package:bugelas/food_detail.dart';
import 'package:bugelas/sidebar.dart';

class MainScreenNew extends StatefulWidget {
  @override
  _MainScreenNewState createState() => _MainScreenNewState();
}

class _MainScreenNewState extends State<MainScreenNew> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: SideBar(),
        appBar: AppBar(
          foregroundColor: blackBase,
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text('Bugelas Catalog'),
          centerTitle: true,
        ),
        body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth <= 760) {
            return Body();
          } else if (constraints.maxWidth <= 1200) {
            return WebPage(gridCount: 2);
          } else {
            return WebPage(
              gridCount: 3,
            );
          }
        }));
  }
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Catalog> dataOnSearch = [];
  TextEditingController textController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    textController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(defaultPadding),
      child: Column(
        children: [
          TextField(
            controller: textController,
            onChanged: (value) {
              setState(() {
                dataOnSearch = catalogData
                    .where((element) => element.name
                        .toLowerCase()
                        .contains(value.toLowerCase()))
                    .toList();
              });
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: pureWhite,
              contentPadding: EdgeInsets.symmetric(
                  horizontal: defaultPadding * 2,
                  vertical: defaultPadding * 1.5),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(defaultBorderRadius * 3),
                  borderSide: BorderSide.none),
              hintText: 'Looking for something?',
              hintStyle: TextStyle(
                color: blackBase.withOpacity(.5),
              ),
              suffixIcon: Padding(
                padding: EdgeInsets.symmetric(horizontal: defaultPadding * 2),
                child: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                final Catalog data = catalogData[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return FoodDetail(
                          catalogData: textController.text.isNotEmpty
                              ? dataOnSearch[index]
                              : data);
                    }));
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: defaultPadding / 2),
                    child: Container(
                      decoration: BoxDecoration(
                        color: pureWhite,
                        borderRadius:
                            BorderRadius.circular(defaultBorderRadius * 2),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(defaultPadding),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                      defaultBorderRadius * 2),
                                  child: Image.asset(
                                      textController.text.isNotEmpty
                                          ? dataOnSearch[index].imageAsset
                                          : data.imageAsset,
                                      height: 112,
                                      fit: BoxFit.cover)),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  textController.text.isNotEmpty
                                      ? dataOnSearch[index].name
                                      : data.name,
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600,
                                      color: blackBase),
                                ),
                                Text(
                                  'IDR ${textController.text.isNotEmpty ? dataOnSearch[index].price : data.price}',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600,
                                    color: brightBlue,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              itemCount: textController.text.isNotEmpty
                  ? dataOnSearch.length
                  : catalogData.length,
            ),
          ),
        ],
      ),
    );
  }
}

class WebPage extends StatefulWidget {
  int gridCount;

  WebPage({required this.gridCount});

  @override
  _WebPageState createState() => _WebPageState(gridCount: gridCount);
}

class _WebPageState extends State<WebPage> {
  List<Catalog> dataOnSearch = [];
  TextEditingController textController = TextEditingController();

  int gridCount;

  _WebPageState({required this.gridCount});
  
  @override
  void dispose() {
    super.dispose();
    textController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width <= 1200
              ? defaultPadding * 12
              : defaultPadding * 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          TextField(
            controller: textController,
            onChanged: (value) {
              setState(() {
                dataOnSearch = catalogData
                    .where((element) => element.name
                        .toLowerCase()
                        .contains(value.toLowerCase()))
                    .toList();
              });
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: pureWhite,
              contentPadding: EdgeInsets.symmetric(
                  horizontal: defaultPadding * 2,
                  vertical: defaultPadding * 1.5),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(defaultBorderRadius * 3),
                  borderSide: BorderSide.none),
              hintText: 'Looking for something?',
              hintStyle: TextStyle(
                color: blackBase.withOpacity(.5),
              ),
              suffixIcon: Padding(
                padding: EdgeInsets.symmetric(horizontal: defaultPadding * 2),
                child: Icon(Icons.search),
              ),
            ),
          ),
          SizedBox(height: defaultPadding * 2),
          Expanded(
            child: GridView.count(
                crossAxisCount:
                    MediaQuery.of(context).size.width <= 1200 ? 2 : 3,
                mainAxisSpacing: defaultPadding * 2,
                crossAxisSpacing: defaultPadding * 2,
                children: textController.text.isNotEmpty
                    ? dataOnSearch.map((data) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return FoodDetail(catalogData: data);
                            }));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: pureWhite,
                              borderRadius: BorderRadius.circular(
                                  defaultBorderRadius * 2),
                            ),
                            child: Column(
                              children: <Widget>[
                                Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: EdgeInsets.all(defaultPadding * 2),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                            defaultBorderRadius * 2),
                                        child: Image.asset(data.imageAsset,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            fit: BoxFit.cover)),
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.only(
                                            bottom: defaultPadding / 2),
                                        child: Text(
                                          data.name,
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            bottom: defaultPadding / 2),
                                        child: Text(
                                          'IDR ${data.price}',
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.w600,
                                              color: brightBlue),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList()
                    : catalogData.map((data) {
                        return InkWell(
                          onTap: () {
                            Navigator.push((context),
                                MaterialPageRoute(builder: (context) {
                              return FoodDetail(catalogData: data);
                            }));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: pureWhite,
                              borderRadius: BorderRadius.circular(
                                  defaultBorderRadius * 2),
                            ),
                            child: Column(
                              children: <Widget>[
                                Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: EdgeInsets.all(defaultPadding * 2),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                            defaultBorderRadius * 2),
                                        child: Image.asset(data.imageAsset,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            fit: BoxFit.cover)),
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.only(
                                            bottom: defaultPadding / 2),
                                        child: Text(
                                          data.name,
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            bottom: defaultPadding / 2),
                                        child: Text(
                                          'IDR ${data.price}',
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.w600,
                                              color: brightBlue),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList()),
          ),
        ],
      ),
    );
  }
}
