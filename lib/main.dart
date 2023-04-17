import 'dart:math';

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
            DetailPage(generateMockClothesItems(10, "女裝")[1]),
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
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;

    final List<ClothesItem> womenClothes = generateMockClothesItems(10, "女裝");
    final List<ClothesItem> menClothes = generateMockClothesItems(10, "男裝");
    final List<ClothesItem> assesories = generateMockClothesItems(10, "配件");

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
          title: Center(
        child: Image.asset(
          'assets/Image_Logo02.png',
          width: 200,
          height: 200,
        ),
      )),
      body: isMobile
          ? HomeMobilePage(womenClothes, menClothes, assesories)
          : HomeWebPage(womenClothes, menClothes, assesories),
    );
  }
}

class HomeMobilePage extends StatelessWidget {
  final List<ClothesItem> womenClothes;
  final List<ClothesItem> menClothes;
  final List<ClothesItem> assesories;
  // const HomeMobilePage(List<ClothesItem> womenClothes, List<ClothesItem> menClothes, List<ClothesItem> assesories, {
  //   super.key, required this.womenClothes, required this.menClothes, required this.assesories,
  // });

  HomeMobilePage(this.womenClothes, this.menClothes, this.assesories);

  @override
  Widget build(BuildContext context) {
    return Column(
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
                        itemCount: womenClothes.length,
                        itemBuilder: (context, index) {
                          return cardListView(womenClothes[index]);
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
                        itemCount: menClothes.length,
                        itemBuilder: (context, index) {
                          return cardListView(menClothes[index]);
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
                    itemCount: assesories.length,
                    itemBuilder: (context, index) {
                      return cardListView(assesories[index]);
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class HomeWebPage extends StatelessWidget {
  final List<ClothesItem> womenClothes;
  final List<ClothesItem> menClothes;
  final List<ClothesItem> assesories;
  // const HomeMobilePage(List<ClothesItem> womenClothes, List<ClothesItem> menClothes, List<ClothesItem> assesories, {
  //   super.key, required this.womenClothes, required this.menClothes, required this.assesories,
  // });

  HomeWebPage(this.womenClothes, this.menClothes, this.assesories);
  @override
  Widget build(BuildContext context) {
    return Column(
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
                            itemCount: womenClothes.length,
                            itemBuilder: (context, index) {
                              return cardListView(womenClothes[index]);
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
                            itemCount: menClothes.length,
                            itemBuilder: (context, index) {
                              return cardListView(menClothes[index]);
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
                        itemCount: assesories.length,
                        itemBuilder: (context, index) {
                          return cardListView(assesories[index]);
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
    );
  }
}

class cardListView extends StatelessWidget {
  ClothesItem clothesItem;

  cardListView(this.clothesItem);

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
                      builder: (context) => DetailPage(clothesItem)),
                );
              },
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Image.asset(
                      height: 50,
                      clothesItem.imageUrl,
                    ),
                  ),
                  Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(clothesItem.name),
                          Text(clothesItem.price),
                        ],
                      )),
                ],
              ))),
    );
  }
}

class DetailPage extends StatefulWidget {
  var clothesItem;

  DetailPage(this.clothesItem);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  // final String title;
  // final int price;
  // final String photo;

  @override
  State<DetailPage> createState() => DetailPagestate(clothesItem);
}

class DetailPagestate extends State<DetailPage> {
  var clothesItem;

  DetailPagestate(this.clothesItem);

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
            title: Center(
          child: Image.asset(
            'assets/Image_Logo02.png',
            width: 200,
            height: 200,
          ),
        )),
        body: SingleChildScrollView(
            child: Center(
          child: Container(
            width: 700,
            padding: const EdgeInsets.only(top: 32),
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
                            clothesItem.imageUrl,
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
                                margin:
                                    const EdgeInsets.symmetric(vertical: 5.0),
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
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 20.0),
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
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 20.0),
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
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 20.0),
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
                    Expanded(child: ShaderMask(shaderCallback: (Rect bounds) {
                      return LinearGradient(
                              colors: [Colors.red, Colors.blue],
                              stops: [0.0, 1.0],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              tileMode: TileMode.mirror)
                          .createShader(bounds);
                    })),
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
          ),
        )));
  }
}

List<ClothesItem> generateMockClothesItems(int count, String category) {
  final random = Random();

  return List<ClothesItem>.generate(count, (index) {
    final int id;
    final String name;
    final String imageUrl;
    if (category == "男裝") {
      id = 100 + random.nextInt(99);
      name = getRandomClothingName();
      imageUrl = 'assets/pngwing.png';
    } else if (category == "女裝") {
      id = 200 + random.nextInt(99);
      name = getRandomClothingName();
      imageUrl = 'assets/pngwingwomne.png';
    } else if (category == "配件") {
      id = 300 + random.nextInt(99);
      name = getRandomAssesoriesName();
      imageUrl = 'assets/women.jpg';
    } else {
      id = 400 + random.nextInt(99);
      name = getRandomClothingName();
      imageUrl = 'assets/women.jpg';
    }

    final price = "NT\$ ${random.nextInt(10000)}";
    final colors = getRandomClothingColors();
    final sizes = getRandomClothingSizes();
    const colorHint = "實品顏色依單品照為主";
    final material = getRandomClothingMaterial();
    final thickLevel = getRandomClothingThick();
    final flexibility = getRandonClothingFlexibility();
    final materialOrigin = getRandomClothingOrigin();
    final processOrigin = getRandomClothingOrigin();

    return ClothesItem(
        id: id,
        name: name,
        imageUrl: imageUrl,
        price: price,
        colors: colors,
        sizes: sizes,
        colorHint: colorHint,
        material: material,
        thickLevel: thickLevel,
        flexibility: flexibility,
        materialOrigin: materialOrigin,
        processOrigin: processOrigin);
  });
}

class ClothesItem {
  final int id;
  final String name;
  final String imageUrl;
  final String price;
  final List<Color> colors;
  final List<String> sizes;
  final String colorHint;
  final String material;
  final String thickLevel;
  final String materialOrigin;
  final String processOrigin;
  final String flexibility;

  ClothesItem(
      {required this.id,
      required this.name,
      required this.imageUrl,
      required this.price,
      required this.colors,
      required this.sizes,
      required this.colorHint,
      required this.material,
      required this.thickLevel,
      required this.materialOrigin,
      required this.processOrigin,
      required this.flexibility});
}

String getRandomClothingName() {
  final clothingNames = [
    'T-Shirt',
    '牛仔褲',
    '毛衣',
    '連帽衫',
    '夾克',
    '短袖',
    '半身裙',
    '連身裙',
    '瑜珈褲',
    '外套',
    '襯衫',
    '皮衣',
    '羽絨衣',
    '皮草大衣',
    '羊毛大衣',
  ];

  final random = Random();
  int randomIndex = random.nextInt(clothingNames.length);

  return clothingNames[randomIndex];
}

List<Color> getRandomClothingColors() {
  final clothingColors = [
    Colors.black,
    Colors.white,
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.pink,
    Colors.purple,
    Colors.brown,
  ];

  final random = Random();
  int sampleSize = random.nextInt(5) + 1;

  return clothingColors.take(sampleSize).toList();
}

List<String> getRandomClothingSizes() {
  final clothingSizes = [
    'S',
    'M',
    'L',
    'XL',
  ];

  final random = Random();
  int sampleSize = random.nextInt(4) + 1;

  return clothingSizes.take(sampleSize).toList();
}

String getRandomClothingMaterial() {
  final clothingMaterial = [
    '棉 100%',
    '棉 80% / 聚酯纖維 20%',
    '棉 70% / 聚酯纖維 30%',
    '棉 60% / 聚酯纖維 40%',
    '聚酯纖維 100%',
    '聚酯纖維 80% / 棉 20%',
    '天然蠶絲 100%',
    '羊毛 100%',
    '鵝絨 100%',
  ];

  final random = Random();
  int randomIndex = random.nextInt(clothingMaterial.length);

  return clothingMaterial[randomIndex];
}

String getRandomClothingThick() {
  final clothingThick = [
    '薄',
    '厚',
  ];

  final random = Random();
  int randomIndex = random.nextInt(clothingThick.length);

  return clothingThick[randomIndex];
}

String getRandonClothingFlexibility() {
  final clothingFlexcibility = [
    '有',
    '無',
  ];

  final random = Random();
  int randomIndex = random.nextInt(clothingFlexcibility.length);

  return clothingFlexcibility[randomIndex];
}

String getRandomClothingOrigin() {
  final clothingOrigin = [
    "台灣",
    "日本",
    "韓國",
    "美國",
    "英國",
    "中國",
    "菲律賓",
    "印尼",
    "越南",
    "泰國",
  ];

  final random = Random();
  int randomIndex = random.nextInt(clothingOrigin.length);

  return clothingOrigin[randomIndex];
}

String getRandomAssesoriesName() {
  final assesoriesNames = [
    '皮帶',
    '手套',
    '帽子',
    '襪子',
    '圍巾',
    '鞋子',
    '皮包',
    '手提包',
    '領帶',
    '領帶夾',
  ];

  final random = Random();
  int randomIndex = random.nextInt(assesoriesNames.length);

  return assesoriesNames[randomIndex];
}
