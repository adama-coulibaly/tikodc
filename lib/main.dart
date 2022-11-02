import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:carousel_slider/carousel_slider.dart';


//  ICI  C'EST LA CLASSE PRINCIPALE MAIN
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}):super(key: key);

  Widget build(BuildContext context){
    return MaterialApp(
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Accueil(),
      bottomNavigationBar: BottomNavigationBar(
        items:  <BottomNavigationBarItem>[   

// ICI ON DECLARE LES MENUS DE NOTRE BOTTOM_NAV_BAR

          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.flash_on),
            label: 'Now',
          ),
          BottomNavigationBarItem(
           icon: Image.asset('assets/images/tiktok_add.png',height: 25,
           ),
           label: '',
          
           
            ),

          BottomNavigationBarItem(
            icon: Icon(Icons.comment_outlined),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
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

class Accueil extends StatelessWidget{
   Accueil({Key? key}) :super(key: key);

final List<Map> tikodcItems = [
  {
    "video":"assets/videos/video_1.mp4",
  },
  {
    "video":"assets/videos/video_2.mp4",
  },
  {
    "video":"assets/videos/video_3.mp4",
  },
  {
    "video":"assets/videos/video_4.mp4",
  },
    {
    "video":"assets/videos/video_5.mp4",
  },
    {
    "video":"assets/videos/video_6.mp4",
  },
];


  @override
  Widget build(BuildContext context){
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
            children: [VideoWidgets(videoUrl:i['video']),
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
  _VideoWidgetsState createState() => _VideoWidgetsState(this.videoUrl);
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

  class PostContent extends StatelessWidget{
    const PostContent({Key? key}):super(key: key);

    @override
    Widget build(BuildContext buildContext){
      return Column(
        children: [
          Container(
            height: 100,
            color: Colors.blue,
          ),
          Expanded(child: Container(
            color: Colors.red,
          ))
        ],
      ); 
    }
  }