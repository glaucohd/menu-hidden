import 'package:flutter/material.dart';

class MenuHidden extends StatefulWidget {
  @override
  _MenuHiddenState createState() => _MenuHiddenState();
}

class _MenuHiddenState extends State<MenuHidden> {
  Map<String, dynamic> mapList = {
    "Basic": {
      "expanded": true,
      "items": [
        'AppBar',
        'Column',
        'Container',
        'FlutterLogo',
        'Icon',
        'Image',
        'Placeholder',
        'MaterialButton',
        'Row',
        'Scaffold',
        'Text'
      ]
    },
    "Layout": {
      "expanded": false,
      "items": [
        'Container',
        'GridView',
        'ListView',
        'Stack',
      ]
    },
    "Material": {
      "expanded": false,
      "items": [
        'AppBar',
        'BottomNavigationBar',
        'Drawer',
        'TabBar',
      ]
    },
    "Buttons": {
      "expanded": false,
      "items": [
        'ButtonBar',
        'DropdownButton',
        'TextButton',
        'FloatingActionButton',
        'IconButton',
        'PopupMenuButton',
        'MaterialButton',
      ]
    }
  };

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetsList = <Widget>[];
    widgetsList.add(Padding(
      padding: EdgeInsets.only(top: 20, left: 10),
      child: Container(
        child: Text('Lista de widgets'),
      ),
    ));

    this.mapList.forEach((String category, dynamic widgets) {
      widgetsList.add(Padding(
        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
        child: ExpansionPanelList(
          expansionCallback: (int i, bool status) {
            setState(() {
              //quando um item abre outro fecha
              /*mapList.forEach((cat, value) {
                if (cat != category) {
                  mapList[cat]['expanded'] = false;
                }
              });*/

              mapList[category]['expanded'] = !status;
            });
          },
          children: [
            ExpansionPanel(
                canTapOnHeader: true,
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return Container(
                    padding: EdgeInsets.all(10),
                    child: Text(category),
                  );
                },
                body: Container(
                  child: GridView.count(
                    crossAxisCount: 2,
                    children: this._gridItem(widgets['items']),
                  ),
                  height: MediaQuery.of(context).size.height / 4,
                ),
                isExpanded: widgets['expanded'])
          ],
        ),
      ));
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('Menu Hidden'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: widgetsList,
        ),
      ),
    );
  }

  List<Widget> _gridItem(List<String> items) {
    List<Widget> result = <Widget>[];

    items.forEach((element) {
      result.add(Padding(
        padding: EdgeInsets.all(5),
        child: GestureDetector(
          onTap: () {},
          child: Container(
            color: Colors.blue,
            child: Center(
              child: Text(element),
            ),
          ),
        ),
      ));
    });
    return result;
  }
}
