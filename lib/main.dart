import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Achimota'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  bool isLoved = true;
  void _favOnOff() {
    setState(() {
      isLoved = !isLoved;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: const Icon(
          Icons.menu,
          color: Colors.green
        ),
        backgroundColor: Colors.white,
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                  Icons.location_on,
                  color: Colors.green
              ),
              Text(
                widget.title,
                style: TextStyle( color: Colors.black),
              ),
            ],
          )
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const CircleAvatar(
              radius: 16,
              backgroundImage: NetworkImage("https://docs.flutter.dev/assets/images/dash/dash-fainting.gif"),
            ))
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Stack(
                children: [
                  Container(
                    height: 150,
                    width:  MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 50, top: 20),
                    child: SizedBox(
                      width: 120,
                      child: Text(
                        'Peace in the head, peace in the stomach',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50, top: 80),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                              )
                          )
                      ),
                      child: const Text(
                          'Order Now',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16)
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                ListingComponent('Category', true),
                SizedBox(
                  height: 110,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      ListType_1('Breakfast', Colors.pink),
                      ListType_1('Lunch', Colors.green),
                      ListType_1('Snack', Colors.yellow),

                      ListType_1('Breakfast', Colors.pink),
                      ListType_1('Lunch', Colors.green),
                      ListType_1('Snack', Colors.yellow),
                    ],
                  ),
                ),
                ListingComponent('Popular Now', false),
                SizedBox(
                  height: 200,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      ListType_2('Fufu with Goat meat', Colors.redAccent, isLoved),
                      ListType_2('Barbecue Chicken', Colors.cyan, isLoved),
                    ],
                  ),
                ),

                ListingComponent('Feature Items', false),
                SizedBox(
                  height: 150,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      ListType_3('Sandwich', Colors.redAccent),
                      ListType_3('Waffle', Colors.lightGreen),
                      ListType_3('Cookies', Colors.orangeAccent),
                      ListType_3('Chocolate', Colors.cyan),

                      ListType_3('Sandwich', Colors.redAccent),
                      ListType_3('Waffle', Colors.lightGreen),
                      ListType_3('Cookies', Colors.orangeAccent),
                      ListType_3('Chocolate', Colors.cyan),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  ListingComponent(String typename, bool isVisible){
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               Text(
                  typename,
               ),
               Visibility(
                 visible: isVisible,
                 child: GestureDetector(
                     onTap: () {},
                     child: const Text(
                       'See All',
                       style: TextStyle(color: Colors.green, decoration: TextDecoration.underline),
                    )
                 )
               ),
            ],
          ),
        )
      ],
    );
  }

  ListType_1(String cardname, Color bgcolor){
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 16, bottom: 16.0),
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: 130,
            decoration: BoxDecoration(
              color: bgcolor,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, top: 10),
            child: Text(cardname, style: TextStyle(color: Colors.black),),
          ),
        ],
      ),
    );
  }

  ListType_2(String cardname, Color bgcolor, bool isLoved){
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 16, bottom: 16.0),
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: 150,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Container(
            height: 120,
            width: 150,
            decoration: BoxDecoration(
              color: bgcolor,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 105.0),
            child: IconButton(
              onPressed: _favOnOff,
              icon: isLoved ? const Icon(Icons.favorite_outlined) : const Icon(Icons.favorite_outline),
              color: Colors.green,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 128),
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 90,
                  child: Text(
                    softWrap: true,
                    textAlign: TextAlign.center,
                    cardname,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14),
                  ),
                ),
                //Expanded(child: SizedBox(width: 10,)),
                Icon(Icons.star, size: 20, color: Colors.yellowAccent,),
                Text(
                    '5.0',
                    style: TextStyle(color: Colors.white, fontSize: 14)
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  ListType_3(String cardname, Color bgcolor){
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 16, bottom: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 90,
            width: 90,
            decoration: BoxDecoration(
              color: bgcolor,
              borderRadius: BorderRadius.circular(45),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(cardname, style: TextStyle(color: Colors.black),),
          ),
        ],
      ),
    );
  }

}

