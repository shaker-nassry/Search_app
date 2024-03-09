import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'colorslist.dart';

class HomeScreen extends StatelessWidget {
  static const String routename = "Home Screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromRGBO(0, 32, 63, 1),
        title: Text('Search App'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        color: Color.fromRGBO(173, 240, 209, 1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.search),
                labelText: 'Search...',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color.fromRGBO(0, 32, 63, 1)),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromRGBO(0, 32, 63, 1), width: 3),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onChanged: (query) {
                Provider.of<ColorsList>(context, listen: false)
                    .filterColors(query);
              },
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Consumer<ColorsList>(builder: (context, colorList, child) {
                return
                  ListView.separated(
                      separatorBuilder: (context, index) {
                        return Divider(
                          color: Color.fromRGBO(0, 32, 63, 1) ,
                          thickness: 1,
                        );
                      },
                      itemCount: colorList.filteredColors.length,
                      itemBuilder: (context, index) {
                        return ListTile (
                          title: Text(colorList.filteredColors[index] ,
                            style:TextStyle(
                              fontWeight: FontWeight.bold,
                            ),

                          ),
                        );
                      }
                  );
              }),
            ),
          ],
        ),
      ),
    );
  }
}