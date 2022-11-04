import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'main.dart';

void main() {
  runApp( inscription_phone());
}

class inscription_phone extends StatelessWidget{
  // const connexion({super.key});
final List<Tab> myTabs = <Tab>[
  const Tab(text: 'Telephone',),
 const Tab(text: 'Adresse email',) 
];


  @override 
  Widget build(BuildContext context){
    return DefaultTabController(length: myTabs.length, 
    child: Scaffold(appBar: 
    AppBar( 

      // ICI ON FAIT APPEL A UN BOUTON DE RETOUR

      leading: const BackButton(color: Colors.black),
      title: const Center(
        child: Text('Inscription',
        style: TextStyle(
          color: Colors.black,
        ),
        ),
      ),
      bottom: TabBar(tabs: myTabs), 
      backgroundColor: Colors.white,
    ),

    body: const TabBarView(
      children: [
          telephone(),
          email()

      ]),
   
    ),
    );
  }
}

// Mon container de formulaire pour le telephone

class telephone extends StatelessWidget {
  const telephone({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        children: [
          Container(
           
           child:Stack(

             children: [
               (

                InternationalPhoneNumberInput(
                  onInputChanged: (value) {},
                inputDecoration: const InputDecoration(
                  contentPadding: EdgeInsets.only(bottom: 15,left: 0),
                  // border: InputBorder.all
                ),
                  )
              ),
              
             ],

             
           ), 

  
          ),

    const SizedBox(height: 20,),
          Container(
            child:
            TextButton(
  style: TextButton.styleFrom(
    primary: Colors.white,
    backgroundColor: Colors.black
  ),
  onPressed: () { },
  child: const Text('Inscription',
  style: TextStyle(
    fontSize: 20,
  ),),
)
          ),
        ],
      ),
    );
  }
}

// ICI MON WIDGET POUR LA SAISIE DE L'ADRESSE
class email extends StatelessWidget {
  const email({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0.0),
      child: Column(
        children: [
          Container(
            child:
             Container(
              child: const 
              TextField(
                decoration: InputDecoration(
                    labelText: 'Entrer votre email', 
                  ),
              ),
            ),       
          ),

          const SizedBox(height: 5,
          ),

          Container(
            child: 
            Container(
              child: const 
              TextField(
              decoration: InputDecoration(
                labelText: 'Pseudo',
              ),
              ),
            ),
          ),

            Container(
            child: 
            Container(
              child: const 
              TextField(
              decoration: InputDecoration(
                labelText: 'Mot de passe',
              ),
              ),
            ),
          ),

            Container(
            child: 
            Container(
              child: const 
              TextField(
              decoration: InputDecoration(
                labelText: 'Confirmer',
              ),
              ),
            ),
          ),

  
const SizedBox(height: 5,),
          Container(
            child:
            TextButton(
  style: TextButton.styleFrom(
    primary: Colors.white,
    backgroundColor: Colors.black
  ),
  onPressed: () {},
  child: const InkWell(
   child: Text('S\'inscrire ',
  style: TextStyle(
    fontSize: 20,
  ),
  )



  )
  ,
)
          ),
        ],
      ),
    );
  }
}