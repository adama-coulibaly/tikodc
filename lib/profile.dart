import 'package:flutter/material.dart';
import 'package:tikodc/util/profiletab_1.dart';
import 'package:tikodc/util/profiletab_2.dart';
import 'package:tikodc/util/profiletab_3.dart';



class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Adama C', style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Icon(Icons.person_add, color: Colors.black),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 12.0),
              child: Icon(
                Icons.menu,
                color: Colors.black,
              ),
            )
          ],
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
                          margin: EdgeInsets.all(5),
                          height: 100.0,
                          width: 100.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50), 
                              //Ici on midifie les dimensions: Hauteurs et largeur
                              image: DecorationImage(
                                image: AssetImage("assets/images/adama.jpg"),
                                fit: BoxFit.cover, //change le type de l'image
                              ))
                              ),

            // username
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                '@AdamaC',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),

            // number of following, followers, likes
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: Column(
                      children: const [
                        Text(
                          '1038',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 24),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Abonnement',
                          style: TextStyle(color: Colors.grey, fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Column(
                      children: const [
                        Text(
                          '300',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 24),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Abonnés',
                          style: TextStyle(color: Colors.grey, fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: const [
                        Text(
                          '2309',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 24),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '  J\'aimes  ',
                          style: TextStyle(color: Colors.grey, fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 15),

            // buttons -> edit profile, insta links, bookmark
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                  child: Text('Editer le profile',
                      style: TextStyle(color: Colors.black, fontSize: 20,
                     )),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(5)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Container(
                    padding: EdgeInsets.all(15),
                    child: Icon(
                      Icons.camera_alt,
                      color: Colors.grey[800],
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(5)),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  child: Icon(
                    Icons.bookmark_border,
                    color: Colors.grey[800],
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(5)),
                ),
              ],
            ),
            SizedBox(height: 15),

            // bio
            Text(
              'Description',
              style: TextStyle(color: Colors.grey[700]),
            ),

            // default tab controller

            const TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.grid_3x3, color: Colors.black),
                ),
                Tab(
                  icon: Icon(Icons.favorite, color: Colors.black),
                ),
                Tab(
                  icon: Icon(Icons.lock_outline_rounded, color: Colors.black),
                ),
              ],
            ),

            Expanded(
              child: TabBarView(
                children: [
                  FirstTab(),
                  SecondTab(),
                  ThirdTab(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
