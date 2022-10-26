import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../widgets/small_text.dart';
import '../../widgets/top_navbar.dart';
import '../../base/no_data_page.dart';
import '../../utils/dimensions.dart';
import '../../widgets/big_text.dart';
import '../../data/firebase.dart';
import '../../utils/colors.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  _ListPage createState() => _ListPage();
}

class _ListPage extends State<ListPage> {
  late Database db;
  FirebaseAuth auth = FirebaseAuth.instance;
  List shoppingList = [];
  List doc = [];
  initialize() {
    db = Database();
    db.initialize();
    db.readProducts().then((value) => {
          setState(() {
            doc = value;
          }),
        });
    db.readShoppingList().then((value) => {
          setState(() {
            shoppingList = value;
          }),
        });
  }

  @override
  void initState() {
    super.initState();
    initialize();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('${auth.currentUser?.uid}')
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return Container(
                height: Dimensions.size510,
                alignment: Alignment.center,
                child: CircularProgressIndicator(
                  color: AppColors.mainColor,
                ),
              );
        }
        return Scaffold(
          body: Stack(
            children: [
              TopNavbar(
                icon: const Icon(Icons.list_rounded),
              ),
              doc.isNotEmpty
                  ? Positioned(
                      top: Dimensions.size20 * 4.5,
                      left: Dimensions.size20,
                      right: Dimensions.size20,
                      bottom: 0,
                      child: MediaQuery.removePadding(
                          context: context,
                          removeTop: true,
                          child: ListView.builder(
                              itemCount: doc.length,
                              itemBuilder: (_, index) {
                                return SizedBox(
                                  height: Dimensions.size20 * 5,
                                  width: double.maxFinite,
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                        child: Container(
                                          width: Dimensions.size20 * 5,
                                          height: Dimensions.size20 * 5,
                                          margin: EdgeInsets.only(
                                            bottom: Dimensions.size10,
                                            right: Dimensions.size10,
                                          ),
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                  doc[index]['image']),
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              Dimensions.size20,
                                            ),
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                          child: SizedBox(
                                        height: Dimensions.size20 * 5,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                BigText(
                                                  text: doc[index]['name'],
                                                  color:
                                                      AppColors.mainBlackColor,
                                                ),
                                              ],
                                            ),
                                            if (doc[index]['expired_date'] !=
                                                null)
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  SmallText(
                                                    text: "Expired Date:",
                                                    textAlign: TextAlign.center,
                                                    fontWeight: FontWeight.w500,
                                                    size: Dimensions.size10,
                                                  ),
                                                  SmallText(
                                                    text: doc[index]
                                                            ['expired_date']
                                                        .toString(),
                                                    textAlign: TextAlign.center,
                                                    fontWeight: FontWeight.w400,
                                                    size: Dimensions.size15,
                                                  ),
                                                ],
                                              ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                (shoppingList.toString()
                                                            .contains(doc[index]
                                                                ['name']) ==
                                                        false)
                                                    ? TextButton(
                                                        style: ButtonStyle(
                                                          shape: MaterialStateProperty
                                                              .all<
                                                                  RoundedRectangleBorder>(
                                                            RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius.circular(
                                                                      Dimensions
                                                                          .size20),
                                                            ),
                                                          ),
                                                          backgroundColor:
                                                              MaterialStateProperty
                                                                  .all<Color>(
                                                                      AppColors
                                                                          .mainColor),
                                                        ),
                                                        onPressed: () {
                                                          db.addToShoppingList(
                                                              doc[index]
                                                                  ['name'],
                                                              doc[index]
                                                                  ['image'],
                                                              1);

                                                          initialize();
                                                        },
                                                        child: SmallText(
                                                          text:
                                                              "Add To Shopping List",
                                                          color: Colors.white,
                                                          size:
                                                              Dimensions.size10,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      )
                                                    : SmallText(
                                                        text:
                                                            "The product has been added to the shopping cart",
                                                        size: 8,
                                                      )
                                              ],
                                            )
                                          ],
                                        ),
                                      ))
                                    ],
                                  ),
                                );
                              })))
                  : const NoDataPage(text: 'Your products list is empty.')
            ],
          ),
        );
      },
    );
  }
}
