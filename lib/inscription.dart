import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'Connexion.dart';

void main() {
  runApp(const MonProfil());
}

class MonProfil extends StatelessWidget {
  const MonProfil({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TikTok',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: Scaffold(
        appBar: AppBar(
        title: const Center(
            child: Text('Profile',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),),
            
          ),
           backgroundColor:Colors.white,
        ),
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Icon(
                Icons.person_outline,
                color: Colors.grey,
                size: 100.0,
              ),
              const SizedBox(
                height: 15.0,
              ),
              const Text(
                'Créer un compte',
                style: TextStyle(color: Colors.black87),
              ),
              const SizedBox(
                height: 15.0,
              ),
              SizedBox(
                width: 200.0,
                child: Builder(
                  builder: (context) => ElevatedButton(
                    onPressed: () {
                      _openPopup(context);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red[400],
                        textStyle: const TextStyle( color: Colors.white)
                    ),
                    child: const Text('S\'inscrire'),
                  ),
                ),
              ),

          SizedBox(
            height: 150,
          ),

               

             ],
          ),
        ),
      ),

     

    );
  }
}

void _openPopup(context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    builder: (BuildContext bc) {
      return SizedBox(
        height: MediaQuery.of(context).size.height * .90,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Center(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () => Navigator.pop(
                        context,
                      ),
                      child: const Icon(
                        Icons.close,
                      ),
                    ),
                    const Icon(Icons.more),
                  ],
                ),
                const SizedBox(
                  height: 50.0,
                ),
                const Text(
                  'Connectez-vous',
                  style: TextStyle(
                    fontSize: 25.0,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  'Créez un profil, suivez d\'autres comptes, créez vos propres vidéos, et plus encore.',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black54,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                ButtonTheme(
                  minWidth: 250.0,
                  child: ElevatedButton(
                    onPressed: () => {},
                    style: ElevatedButton.styleFrom(
                      elevation: 0.0, backgroundColor: Colors.white,
                      shape: const RoundedRectangleBorder(
                        side: BorderSide(color: Colors.grey, width: 1.5),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          Expanded(
                            flex: 1,
                            child: FaIcon(FontAwesomeIcons.user,
                            color: Colors.grey,),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              'Utiliser le téléphone ou l\'e-mail',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                ButtonTheme(
                  minWidth: 250.0,
                  child: ElevatedButton(
                    onPressed: () => {},
                    style: ElevatedButton.styleFrom(
                      elevation: 0.0, 
                      backgroundColor: Colors.white,
                      shape: const RoundedRectangleBorder(
                        side: BorderSide(color: Colors.grey, width: 1.5),
                      ),
                    ),



                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          Expanded(
                            flex: 1,
                            child: FaIcon(
                              FontAwesomeIcons.facebook,
                              color: Colors.blue,
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              'Continuer avec Facebook',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                ButtonTheme(
                  minWidth: 250.0,
                  child: ElevatedButton(
                    onPressed: () => {},
                    style: ElevatedButton.styleFrom(
                      elevation: 0.0, backgroundColor: Colors.white,
                      shape: const RoundedRectangleBorder(
                        side: BorderSide(color: Colors.grey, width: 1.5),
                      ),
                    ),

                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          Expanded(
                            flex: 1,
                            child: FaIcon(
                              FontAwesomeIcons.google,
                              color: Colors.red,
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              'Continuer avec Google',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                ButtonTheme(
                  minWidth: 250.0,
                  child: ElevatedButton(
                    onPressed: () => {},
                    style: ElevatedButton.styleFrom(
                      elevation: 0.0, backgroundColor: Colors.white,
                      shape: const RoundedRectangleBorder(
                        side: BorderSide(color: Colors.grey, width: 1.5),
                      ),
                    ),

                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          Expanded(
                            flex: 1,
                            child: FaIcon(
                              FontAwesomeIcons.twitter,
                              color: Colors.lightBlue,
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              'Continuer avec Twitter',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 120,
                ),
                Container(
                  child: const Text('En continuant, tu acceptes les Condition d\'utilisation de TikTok et confirmes les avoir lu la Politique de confidentialité de TikTok.',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.black45, 
                    
                    
                  ),),
                ),
               const  SizedBox(
                  height: 50,
                ),
// -----------------------------------------DEMANDE DE COMPTE
             Center(
              child:  Container(
                child: Row(
                  
                  children:  [
                    const SizedBox(width: 20,),
                    const Text('Avez-vous déja un compte ?',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 17,
                      
                    ),
                  
                    ),
                    const SizedBox(width: 15,),
                    InkWell(
                      child:const Text('Connexion',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.red,
                        fontSize: 20, 
                      ),
                    ),

                    // --------------------------ICI on declare la page ciblées
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                        connexion()));
                    },
                    )
                    
                  ],
                  
                ),

                
                
              ),
             )



              ],
            ),
          ),
        ),
      );
    },
   
  );
  
}

