
import 'package:flutter/material.dart';
import 'package:tikodc/profile.dart';
import 'package:video_player/video_player.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:math' as math;

import 'inscription.dart';

//  ICI  C'EST LA CLASSE PRINCIPALE MAIN
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'TikODC',
      debugShowCheckedModeBanner: false,
      home: menuBottom(),
    );
  }
}

//  Menu d'en bas
class menuBottom extends StatefulWidget {
  const menuBottom({super.key});
  @override
  State<menuBottom> createState() => _menuBottomState();
}

// Ici on declare les affichages par rapport aux differents cliques

class _menuBottomState extends State<menuBottom> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }



final List<Widget> _pages = [
  Accueil(),
  Profile(),
  Profile(),
  Profile(),
 const MonProfil()
];
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
// ICI ON DECLARE LES MENUS DE NOTRE BOTTOM_NAV_BAR

          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Accueil',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.flash_on),
            label: 'Now',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/tiktok_add.png',
              height: 25,
            ),
            label: '',
          ),

          const BottomNavigationBarItem(
            icon: Icon(Icons.comment_outlined),
            label: 'Messages',
            


          ),

          const BottomNavigationBarItem(
              icon: Icon(Icons.person_outline,),
              label: 'Profil',
             
              ),
        ],
        currentIndex: _selectedIndex,

        // //Les propietés pour pouvoir modifier les icones : BottomNavBar
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFF141518),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}

// LA page d'accueil

class Accueil extends StatefulWidget{
    Accueil({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Accueil();

}

class _Accueil extends State<Accueil> {

  final List<Map> tikodcItems = [
    {
      "video": "assets/videos/video_0.mp4",
    },
    {
      "video": "assets/videos/video_1.mp4",
    },
    {
      "video": "assets/videos/video_2.mp4",
    },
    {
      "video": "assets/videos/video_3.mp4",
    },
    {
      "video": "assets/videos/video_4.mp4",
    },
    {
      "video": "assets/videos/video_5.mp4",
    },
    {
      "video": "assets/videos/video_6.mp4",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: double.infinity,
        scrollDirection: Axis.vertical,
        viewportFraction: 1.0,
      ),
      items: tikodcItems.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              color: Color(0xFF141518),
              child: Stack(
                children: [
                  VideoWidgets(videoUrl: i['video']),
                  const PostContent()
                ],
              ),
            );
          },
        );
      }).toList(),
    );
  }
}

// MES VIDEOS

class VideoWidgets extends StatefulWidget {
  const VideoWidgets({Key? key, required this.videoUrl}) : super(key: key);
  final String videoUrl;

  @override
  _VideoWidgetsState createState() => _VideoWidgetsState(videoUrl);
}

class _VideoWidgetsState extends State<VideoWidgets> {
  late VideoPlayerController _controller;
  final String videoUrl;
  _VideoWidgetsState(this.videoUrl);

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(videoUrl)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        _controller.play();
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return VideoPlayer(_controller);
  }
}

// Les contenus ici

class PostContent extends StatefulWidget{
    const PostContent({Key? key}) : super(key: key);
    
      @override
      State<StatefulWidget> createState()=> _PostContent();

}

class _PostContent extends State<PostContent> {

  @override
  Widget build(BuildContext buildContext) {
    return Column(
      children: [
        Container(
          height: 100,
          padding: const EdgeInsets.only(top: 40),
          // color: Colors.blue,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Abonnement',
                
                style: TextStyle(
                    color: Colors.white54, fontWeight: FontWeight.w600),
              ),
              SizedBox(width: 25),
              Text(
                'Pour moi',
                style: TextStyle(
                    color: Colors.white54, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        Expanded(
            child: Container(
          child: Row(
            children: [
              
              Expanded(
                  child: Container(
                // color: Colors.red.withOpacity(0.5),
                padding: EdgeInsets.all(10),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '@Adams',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 10),

                      // SizedBox(height: 15),
                      Text(
                        'Ceci est une petite description de cette vidéo',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: const [
                          Icon(
                            Icons.music_note,
                            color: Colors.white,
                            size: 15,
                          ),
                          SizedBox(width: 5),
                          Text(
                            'Music de tonton Dr KEB',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ]),
              )),

              // Profil avec l'icone d'ajout en rouge
              Container(
                width: 80,
                // color: Colors.green,
                child: Column(
                  // Within the `FirstRoute` widget
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 80,
                      // color: Colors.blue,
                      child: Stack(
                          alignment: AlignmentDirectional.bottomCenter,
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              child: Container(
                               
                                child: const  CircleAvatar(
                                 radius: 20,
                                  backgroundImage:
                                      AssetImage('assets/images/adama.jpg'),
                                  ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 15,
                              ),
                            ),
                          ]),
                    ),

                    //  Icone de j'aime (LIKES)
                    SizedBox(
                      height: 80,
                      child: Column(children: [
                        Icon(
                          Icons.favorite,
                          color: Colors.white.withOpacity(0.85),
                          size: 45,
                        ),
                        const Text(
                          '909.9M',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600),
                        )
                      ]),
                    ),
                    //  Icone de messages (LIKES)
                    SizedBox(
                      height: 80,
                      child: Column(children: [
                        Icon(
                          Icons.message_sharp,
                          color: Colors.white.withOpacity(0.85),
                          size: 45,
                        ),
                        const Text(
                          '102.1M',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600),
                        )
                      ]),
                    ),

//  Icone des favories (LIKES)

                    SizedBox(
                      height: 80,
                      child: Column(children: [
                        Icon(
                          Icons.share,
                          color: Colors.white.withOpacity(0.85),
                          size: 45,
                        ),
                        const Text(
                          '909.9M',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600),
                        )
                      ]),
                    ),
                    AnimatedLogo(),
                    const SizedBox(height: 15),
                  ],
                ),
              )
            ],
          ),
        ))
      ],
    );
  }
}

class AnimatedLogo extends StatefulWidget {
  AnimatedLogo({Key? key}) : super(key: key);

  @override
  _AnimatedLogoState createState() => _AnimatedLogoState();
}

class _AnimatedLogoState extends State<AnimatedLogo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 4000),
      vsync: this,
    );
    _controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, child) {
        return Transform.rotate(
          angle: _controller.value * 2 * math.pi,
          child: child,
        );
      },
      child: Container(
        height: 45,
        width: 45,
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          image: DecorationImage(
            image: AssetImage("assets/images/disc_icon.png"),
          ),
        ),
        child: Image.asset('assets/images/tiktok_icon.png'),
      ),
    );
  }
}
