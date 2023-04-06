import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        'home': (context) => MyHomePage(title: 'Flutter Demo Home Page'),
        'detail': (context) =>
            DetailPage(title: 'Flutter Demo Home Page', price: 200, photo: ""),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.grey,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Column(
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Image.asset(
              'assets/Image_Logo02.png',
              width: 200,
              height: 200,
            ),
          ])
        ],
      )),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20.0),
            height: 200.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: null,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/women.jpg',
                      width: 200,
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text('女裝'),
                    Expanded(
                      child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 20.0),
                          height: 200.0,
                          width: 300,
                          child: Flexible(
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: null,
                              itemBuilder: (context, index) {
                                return cardListView(
                                    "Net 女裝", 200, 'assets/pngwingwomne.png');
                              },
                            ),
                          )),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text('男裝'),
                    Expanded(
                      child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 20.0),
                          height: 200.0,
                          width: 300,
                          child: Flexible(
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: null,
                              itemBuilder: (context, index) {
                                return cardListView(
                                    "Net 男裝", 100, 'assets/pngwing.png');
                              },
                            ),
                          )),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text('配件'),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 20.0),
                        height: 600.0,
                        width: 300,
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: null,
                          itemBuilder: (context, index) {
                            return cardListView(
                                "Net 配件", 150, 'assets/pngwing.png');
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}

class cardListView extends StatelessWidget {
  String name;
  int price;
  String photo;

  cardListView(this.name, this.price, this.photo);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: Colors.white,
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
              onTap: () {
                print("success");
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailPage(
                          title: 'Flutter Demo Home Page',
                          price: 200,
                          photo: photo)),
                );
              },
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Image.asset(
                      height: 50,
                      photo,
                    ),
                  ),
                  Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(name),
                          Text('NT $price 元'),
                        ],
                      )),
                ],
              ))),
    );
  }
}

class DetailPage extends StatefulWidget {
  const DetailPage({
    super.key,
    required this.title,
    required this.price,
    required this.photo,
  });

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  final int price;
  final String photo;

  @override
  State<DetailPage> createState() => DetailPagestate(title, price, photo);
}

class DetailPagestate extends State<DetailPage> {
  DetailPagestate(this.title, this.price, this.photo);

  String title;
  int price;
  String photo;

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
            // Here we take the value from the MyHomePage object that was created by
            // the App.build method, and use it to set our appbar title.
            title: Column(
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Image.asset(
                'assets/Image_Logo02.png',
                width: 200,
                height: 200,
              ),
            ])
          ],
        )),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                      flex: 1,
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Image.asset(
                          photo,
                        ),
                      )),
                  Container(
                    width: 10,
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: Text(
                                "NET 白上衣襯衫",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 5.0),
                              child: Text("20230415"),
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(vertical: 15.0),
                              child: Text(
                                  style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold),
                                  "NT100"),
                            ),
                            Divider(
                              color: Colors.grey,
                              thickness: 1,
                              indent: 20,
                            ),
                            Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 20.0),
                                child: Row(
                                  children: [
                                    Text("顏色"),
                                    Container(
                                      width: 10,
                                    ),
                                    SizedBox(
                                      height: 20,
                                      width: 1,
                                      child: Container(
                                        color: Colors.grey[300],
                                      ),
                                    ),
                                    Container(
                                      width: 20,
                                    ),
                                    Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        color: Colors.green,
                                      ),
                                      padding: EdgeInsets.all(2),
                                    ),
                                    Container(
                                      width: 20,
                                    ),
                                    Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        color: Colors.blue,
                                      ),
                                      padding: EdgeInsets.all(2),
                                    )
                                  ],
                                )),
                            Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 20.0),
                                child: Row(
                                  children: [
                                    Text("尺寸"),
                                    Container(
                                      width: 10,
                                    ),
                                    SizedBox(
                                      height: 20,
                                      width: 1,
                                      child: Container(
                                        color: Colors.grey[300],
                                      ),
                                    ),
                                    Container(
                                      width: 10,
                                    ),
                                    Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      color: Colors.grey,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'S',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      color: Colors.grey,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'M',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      color: Colors.grey,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'L',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                            Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 20.0),
                                child: Row(
                                  children: [
                                    Text("數量"),
                                    Container(
                                      width: 10,
                                    ),
                                    SizedBox(
                                      height: 20,
                                      width: 1,
                                      child: Container(
                                        color: Colors.grey[300],
                                      ),
                                    ),
                                    Container(
                                      width: 10,
                                    ),
                                    Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      color: Colors.grey,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          '-',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 30,
                                    ),
                                    Text("1"),
                                    Container(
                                      width: 30,
                                    ),
                                    Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      color: Colors.grey,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          '+',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                            Container(
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                color: Colors.grey,
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Text(
                                    '請選擇尺寸',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Text('食品顏色依單品照為主'),
                            Text('棉 100%'),
                            Text("厚薄 : 薄片"),
                            Text('彈性 : 無'),
                            Text('素材產地 / 日本'),
                            Text('加工產地 / 中國'),
                          ],
                        )),
                  ),
                ],
              ),
              Container(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(flex: 1, child: Text("細部說明")),
                  Expanded(
                    flex: 10,
                    child: Divider(
                      color: Colors.grey,
                      thickness: 1,
                      indent: 20,
                    ),
                  ),
                ],
              ),
              Container(
                height: 20,
              ),
              Text(
                  "They met in California on Wednesday, a week after President Tsai was feted in New York with a leadership award Ms Tsai hailed their strong and unique partnership, and Mr McCarthy said that arms sales to Taiwan must continue."),
              Container(
                height: 20,
              ),
              Image.asset(
                'assets/pngwing.png',
                height: 600.0,
              ),
              Container(
                height: 20,
              ),
              Image.asset(
                'assets/pngwing.png',
                height: 600.0,
              ),
              Container(
                height: 20,
              ),
              Image.asset(
                'assets/pngwing.png',
                height: 600.0,
              ),
            ],
          ),
        ));
  }
}
