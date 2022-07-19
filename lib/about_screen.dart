import 'package:bugelas/constraints.dart';
import 'package:flutter/material.dart';
import 'package:bugelas/sidebar.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideBar(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: blackBase,
        elevation: 0,
        title: Text('About'),
        centerTitle: true,
      ),
      body: Body(),
    );
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(defaultPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Expanded(
              child:
                Container(
                  decoration: BoxDecoration(
                    color: brightBlue,
                    borderRadius: BorderRadius.circular(defaultBorderRadius * 2),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(defaultPadding * 2),
                    child: 
                      Text('Bugelas is a small home-made business which offers food and drinks made with natural ingredients and of course safe for consumption', style: TextStyle(
                          fontSize: 16.0,
                          color: pureWhite
                        ),
                        textAlign: TextAlign.center,
                      ),
                  ),
                ),
              ),
          ],
          ),
    );
  }
}
