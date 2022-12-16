import 'package:griya_gorden/GordenDataModel.dart';
import 'package:griya_gorden/service/gorden_service.dart';
import 'package:flutter/material.dart';
import 'package:griya_gorden/models/gorden.dart';
import 'package:flutter/services.dart' as rootBundle;

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        elevation: 0,
        title: const Text(
          'Griya Gorden',
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontFamily: 'Poppins Bold',
            fontSize: 20,
          ),
        ),
      ),
      body: FutureBuilder<List<Data>>(
        future: GordenService.getDataGorden(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: Text('Sedang loading...'));
          } else {
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: GridView.builder(
                    itemCount: snapshot.data!.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                    ),
                    itemBuilder: (context, index) {
                      return Stack(children: [
                        Container(
                            width: double.infinity,
                            height: double.infinity,
                            child: Image.network(
                              "${snapshot.data![index].image}",
                              fit: BoxFit.cover,

                              // height: 100,
                              // width: 130,
                            )),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: double.infinity,
                              color: Colors.black26,
                              child: Text(
                                '${snapshot.data![index].name}',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              color: Colors.black26,
                              child: Text(
                                '${snapshot.data![index].price}',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.amber,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                            )
                          ],
                        )
                      ]);
                    }),
              );
            }
          }
        },
      ),
    );
  }
}
  

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key? key}) : super(key: key);

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: buildAppBar(),
//       body: Body(),
//       bottomNavigationBar: MyBottomNavBar(),
//     );
//   }

//   AppBar buildAppBar() {
//     return AppBar(
//       elevation: 0,
//       leading: IconButton(
//         icon: SvgPicture.asset("assets/icons/menu.svg"),
//         onPressed: () {},
//       ),
//     );
//   }
// }
