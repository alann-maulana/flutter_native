import 'package:example/form_dialog.dart';
import 'package:example/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_native/flutter_native.dart';

class ListViewPage extends StatefulWidget {
  static const ROUTE = MyHomePage.ROUTE + '/listview';

  @override
  ListViewPageState createState() {
    return new ListViewPageState();
  }
}

class ListViewPageState extends State<ListViewPage> {
  List<dynamic> _list;

  Future<void> _handleRefresh() async {
    await new Future.delayed(Duration(seconds: 2));
    if (mounted) {
      setState(() {
        _list = [
          {
            "_id": "5c344ad4af05cd30121c7864",
            "index": 0,
            "age": 17,
            "name": "Guerrero Hester",
            "gender": "male",
            "picture": "https://randomuser.me/api/portraits/men/1.jpg",
            "email": "guerrerohester@acrodance.com"
          },
          {
            "_id": "5c344ad4a9f9150ccdf900bf",
            "index": 1,
            "age": 16,
            "name": "Alfreda Hughes",
            "gender": "female",
            "picture": "https://randomuser.me/api/portraits/women/2.jpg",
            "email": "alfredahughes@acrodance.com"
          },
          {
            "_id": "5c344ad415fb79aa47eec868",
            "index": 2,
            "age": 39,
            "name": "Collins George",
            "gender": "male",
            "picture": "https://randomuser.me/api/portraits/men/3.jpg",
            "email": "collinsgeorge@acrodance.com"
          },
          {
            "_id": "5c344ad471f50d9c8307d9eb",
            "index": 3,
            "age": 44,
            "name": "Francesca Farley",
            "gender": "female",
            "picture": "https://randomuser.me/api/portraits/women/4.jpg",
            "email": "francescafarley@acrodance.com"
          },
          {
            "_id": "5c344ad4de73132200e57e07",
            "index": 4,
            "age": 26,
            "name": "Rosemarie Tyson",
            "gender": "female",
            "picture": "https://randomuser.me/api/portraits/women/5.jpg",
            "email": "rosemarietyson@acrodance.com"
          },
          {
            "_id": "5c344ad4790881df9363bbd8",
            "index": 5,
            "age": 25,
            "name": "Johnston Romero",
            "gender": "male",
            "picture": "https://randomuser.me/api/portraits/men/6.jpg",
            "email": "johnstonromero@acrodance.com"
          },
          {
            "_id": "5c344ad43e6ffad22ebdec86",
            "index": 6,
            "age": 45,
            "name": "Eve Rosa",
            "gender": "female",
            "picture": "https://randomuser.me/api/portraits/women/7.jpg",
            "email": "everosa@acrodance.com"
          },
          {
            "_id": "5c344ad4de1d70ea7a3359e4",
            "index": 7,
            "age": 39,
            "name": "Case Beck",
            "gender": "male",
            "picture": "https://randomuser.me/api/portraits/men/8.jpg",
            "email": "casebeck@acrodance.com"
          },
          {
            "_id": "5c344ad4c8af773bf47b0865",
            "index": 8,
            "age": 20,
            "name": "Rosa Young",
            "gender": "male",
            "picture": "https://randomuser.me/api/portraits/men/9.jpg",
            "email": "rosayoung@acrodance.com"
          },
          {
            "_id": "5c344ad447c018d04d50e44d",
            "index": 9,
            "age": 27,
            "name": "Middleton Parks",
            "gender": "male",
            "picture": "https://randomuser.me/api/portraits/men/10.jpg",
            "email": "middletonparks@acrodance.com"
          },
        ];
      });
    }
    return null;
  }

  _handleShowAddForm() async {
    final result = await Navigator.push(
      context,
      NativePageRoute.create(
        builder: (context) => FormDialog(),
        fullscreenDialog: true,
      ),
    );

    if (result == true) {
      print('Saved');
    }
  }

  @override
  void initState() {
    super.initState();

    _handleRefresh();
  }

  @override
  Widget build(BuildContext context) {
    NativeListView listView;

    if (_list != null) {
      final children = _list.map((json) {
        return NativeListTile(
          title: Text(json['name'], style: TextStyle(fontSize: 18.0)),
          subtitle: Text(json['email'], style: TextStyle(fontSize: 14.0)),
        );
      }).toList();

      listView = NativeListView(children: children);
    }

    final loading = Center(
        child: NativeProgressIndicator(
      radius: 20.0,
    ));

    return new NativeScaffold(
      appBar: NativeAppBar(
        title: Text('List View'),
        iosLargeTitle: true,
        iosTrailing: new NativeIconButton(
          icon: Icon(CupertinoIcons.add),
          onPressed: _handleShowAddForm,
        ),
      ),
      androidFab: FloatingActionButton(
        onPressed: _handleShowAddForm,
        child: Icon(Icons.add),
      ),
      onRefresh: _list != null ? _handleRefresh : null,
      body: NativeStatelessWidget(
        material: (context) => listView == null ? loading : listView,
        cupertino: (context) =>
            listView == null ? SliverFillRemaining(child: loading) : listView,
      ),
    );
  }
}
