import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../widgets/top_navbar.dart';
import '../../base/no_data_page.dart';
import '../../utils/dimensions.dart';
import '../../widgets/big_text.dart';
import '../../data/firebase.dart';
import '../../utils/colors.dart';

class ShoppingPage extends StatefulWidget {
  const ShoppingPage({Key? key}) : super(key: key);

  @override
  _ShoppingPage createState() => _ShoppingPage();
}

class _ShoppingPage extends State<ShoppingPage> {
  late Database db;
  FirebaseAuth auth = FirebaseAuth.instance;
  List doc = [];
  initialize() {
    db = Database();
    db.initialize();
    db.readShoppingList().then((value) => {
          setState(() {
            doc = value;
          })
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
        if (!snapshot.hasData) return const Text('Loading...');
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
                      right: Dimensions.size50,
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
                                            right: Dimensions.size30,
                                          ),
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                    doc[index]['image'])),
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
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.all(
                                                    Dimensions.size20,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      Dimensions.size20,
                                                    ),
                                                    color: Colors.white,
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () {
                                                          db.removeItem(
                                                              doc, index);
                                                        },
                                                        child: Icon(
                                                          Icons.remove,
                                                          color: AppColors
                                                              .signColor,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                          horizontal: 5.0,
                                                        ),
                                                        child: BigText(
                                                          text: doc[index]
                                                                  ['quantity']
                                                              .toString(),
                                                        ),
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {
                                                          db.addItem(
                                                              doc, index);
                                                        },
                                                        child: Icon(
                                                          Icons.add,
                                                          color: AppColors
                                                              .signColor,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ))
                                    ],
                                  ),
                                );
                              })))
                  : const NoDataPage(text: 'Your cart is empty.')
            ],
          ),
        );
      },
    );
  }
}
