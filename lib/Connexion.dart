import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'main.dart';

void main() {
  runApp( connexion());
}

class connexion extends StatelessWidget{
  // const connexion({super.key});
final List<Tab> myTabs = <Tab>[
  const Tab(text: 'Telephone',),
 const Tab(text: 'Email',) 
];


  @override 
  Widget build(BuildContext context){
    return DefaultTabController(length: myTabs.length, 
    child: Scaffold(appBar: 
    AppBar( 

      // ICI ON FAIT APPEL A UN BOUTON DE RETOUR

      leading: const BackButton(color: Colors.black),
      title: const Center(
        child: Text('Connexion',
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
  child: const Text('Connexion',
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
                labelText: 'Mot de passe',
              ),
              ),
            ),
          ),
const SizedBox(height: 35,),
 Container(
            child: 
            Container(
              child:  
              InkWell(
                onTap: ()  => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Container(child: 
          const Text('Rénitialisé le mot de passe'),
          ),
          content: const Text('Téléphone'),
                   
          
          actions: <Widget>[
            
            TextButton(
              onPressed: () => Navigator.pop(context, 'cancel'),
              child: const Text('cancel'),
            ),
          ],
        ),
      ),
                child: const Text('Mot de passe oublié ?',
              style: TextStyle(
                color: Colors.red,
                fontSize: 20,
              ),),
              )
            ),
          ),
  
const SizedBox(height: 25,),
          Container(
            child:
            TextButton(
  style: TextButton.styleFrom(
    primary: Colors.white,
    backgroundColor: Colors.black
  ),
  onPressed: () {},
  child: const InkWell(
   child: Text('Se connecter',
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

