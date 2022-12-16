import 'package:flutter/material.dart';

import '../models/gorden.dart';

class Detail_mb extends StatelessWidget {
  final Data mb;

  const Detail_mb({Key? key, required this.mb}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Color.fromARGB(255, 158, 43, 43),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: new Icon(Icons.arrow_back_ios_new_rounded),
          color: Colors.black,
          onPressed: () {
            print('back');
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text(
          'Fore Coffee',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 13, 155, 0),
              fontFamily: 'Poppins'),
        ),
        actions: [
          IconButton(
            icon: new Icon(Icons.logout_rounded),
            color: Colors.black,
            onPressed: () {
              print('Sudah Logout');
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: width,
          child: Stack(
            children: [
              Container(
                height: height * 0.55,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(mb.image.toString()),
                        fit: BoxFit.cover)),
              ),
              Container(
                width: width,
                margin: EdgeInsets.only(top: height * 0.5),
                padding: EdgeInsets.all(30),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      mb.name.toString(),
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      mb.price.toString(),
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Description',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w400)),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      mb.description.toString(),
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          fontWeight: FontWeight.normal,
                          letterSpacing: 0.5,
                          wordSpacing: 1.5),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Price',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              'Rp.' + mb.price.toString(),
                              style: TextStyle(
                                  color: Color.fromARGB(255, 32, 32, 32),
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.fromLTRB(35, 10, 35, 10),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              primary: Color.fromARGB(255, 13, 155, 0)),
                          child: Text(
                            'Buy',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
