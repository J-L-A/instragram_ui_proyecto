import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class InstagramProfileScreen extends StatefulWidget {
  @override
  _InstagramProfileScreenState createState() => _InstagramProfileScreenState();
}

class _InstagramProfileScreenState extends State<InstagramProfileScreen> with SingleTickerProviderStateMixin {
  List<VideoPlayerController> _videoControllers = [];
  bool _isLoading = true;
  late TabController _tabController;
  
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _initializeVideoControllers();
  }

  void _initializeVideoControllers() {
    // Lista de videos locales
    List<String> videoAssets = [
      'assets/videos/video1.mp4',
      'assets/videos/video2.mp4',
      'assets/videos/video3.mp4',
      'assets/videos/video4.mp4',
      'assets/videos/video5.mp4',
      'assets/videos/video6.mp4',
    ];

    // Inicializar controladores de video
    _videoControllers = videoAssets.map((asset) {
      return VideoPlayerController.asset(asset)
        ..initialize().then((_) { // Aquí suele ocurrir un error, correr Flutter pub get y flutter run por favor con la opción número 2
          setState(() {}); // Actualizar la interfaz cuando el video esté listo 
        });
    }).toList();

    // Simular carga
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        title: Row(
          children: [
            Text(
              'lechuga',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            Icon(Icons.keyboard_arrow_down_rounded, size: 16, color: Colors.black),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add_box_outlined, color: Colors.black, size: 28),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.menu, color: Colors.black, size: 28),
            onPressed: () {},
          ),
        ],
      ),
      body: _isLoading 
        ? Center(child: CircularProgressIndicator())
        : ListView(
        children: [
          // Encabezado de perfil
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.red, Colors.orange],
                        ),
                        border: Border.all(
                          color: Colors.white,
                          width: 2,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.grey[200],
                          backgroundImage: AssetImage('assets/images/profile.jpg'),
                        ),
                      ),
                    ),
                    SizedBox(width: 24),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildStatColumn('6', 'Posts'),
                          _buildStatColumn('226k', 'Followers'),
                          _buildStatColumn('2,943', 'Following'),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Text(
                  'Lechu',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                  )
                ),
                SizedBox(height: 2),
                Text(
                  'Una lechuga con Instagram variado',
                  style: TextStyle(fontSize: 14)
                ),
                SizedBox(height: 4),
                Text(
                  'www.lechugaverde.com',
                  style: TextStyle(
                    color: Colors.blue[800],
                    fontWeight: FontWeight.w500,
                    fontSize: 14
                  )
                ),
                SizedBox(height: 12),
                
                // Botones de acción
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {},
                        child: Text(
                          'Following',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.grey[200],
                          minimumSize: Size(0, 34),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {},
                        child: Text(
                          'Message',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.grey[200],
                          minimumSize: Size(0, 34),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    OutlinedButton(
                      onPressed: () {},
                      child: Icon(
                        Icons.person_add_outlined,
                        color: Colors.black,
                        size: 16,
                      ),
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.grey[200],
                        minimumSize: Size(0, 34),
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          
          // Historias destacadas
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildStoryHighlight("Recetas", Icons.restaurant),
                  _buildStoryHighlight("Viajes", Icons.flight),
                  _buildStoryHighlight("Vida", Icons.favorite),
                  _buildStoryHighlight("Amigos", Icons.people),
                  _buildStoryHighlight("Trabajo", Icons.work),
                  _buildStoryHighlight("+", Icons.add, isAdd: true),
                ],
              ),
            ),
          ),
          
          // Pestañas
          TabBar(
            controller: _tabController,
            indicatorColor: Colors.black,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(icon: Icon(Icons.grid_on)),
              Tab(icon: Icon(Icons.play_arrow_outlined)),
              Tab(icon: Icon(Icons.person_pin_outlined)),
            ],
          ),
          
          // Contenido de las pestañas
          Container(
            height: MediaQuery.of(context).size.width, // Altura aproximada para la cuadrícula
            child: TabBarView(
              controller: _tabController,
              children: [
                // Pestaña de cuadrícula
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 2,
                    mainAxisSpacing: 2,
                  ),
                  itemCount: _videoControllers.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        // Reproducir/pausar video al tocar
                        setState(() {
                          _videoControllers[index].value.isPlaying
                              ? _videoControllers[index].pause()
                              : _videoControllers[index].play();
                        });
                      },
                      child: Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Container(
                            color: Colors.black,
                            child: AspectRatio(
                              aspectRatio: 1.0, // Relación de aspecto cuadrada
                              child: VideoPlayer(_videoControllers[index]),
                            ),
                          ),
                          if (!_videoControllers[index].value.isInitialized)
                            Center(child: CircularProgressIndicator(color: Colors.white)),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Icon(
                              index % 2 == 0 ? Icons.play_arrow : Icons.collections,
                              color: Colors.white,
                              size: 16,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                
                // Pestaña de reels
                Center(child: Text('Reels', style: TextStyle(color: Colors.grey))),
                
                // Pestaña de etiquetas
                Center(child: Text('Tagged', style: TextStyle(color: Colors.grey))),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), activeIcon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), activeIcon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.add_box_outlined), activeIcon: Icon(Icons.add_box), label: 'Add'),
          BottomNavigationBarItem(icon: Icon(Icons.ondemand_video_outlined), activeIcon: Icon(Icons.ondemand_video), label: 'Reels'),
          BottomNavigationBarItem(
            icon: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey, width: 1),
              ),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/profile.jpg'),
              ),
            ), 
            label: 'Profile'
          ),
        ],
        currentIndex: 4,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
      ),
    );
  }

  Widget _buildStatColumn(String value, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          value, 
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18
          )
        ),
        SizedBox(height: 2),
        Text(
          label, 
          style: TextStyle(
            color: Colors.black87,
            fontSize: 14
          )
        ),
      ],
    );
  }
  
  Widget _buildStoryHighlight(String title, IconData icon, {bool isAdd = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Container(
            width: 68,
            height: 68,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isAdd ? Colors.grey.shade300 : Colors.grey.shade400,
                width: 1,
              ),
            ),
            child: Center(
              child: Icon(
                icon,
                size: 28,
                color: Colors.black87,
              ),
            ),
          ),
          SizedBox(height: 4),
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // Limpiar controladores de video
    for (var controller in _videoControllers) {
      controller.dispose();
    }
    _tabController.dispose();
    super.dispose();
  }
}