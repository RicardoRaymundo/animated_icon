import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //Retira a faixa 'debug' da tela
      title: 'Animated Icon',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Animated Icon'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with TickerProviderStateMixin {

  //Declarando variáveis de controle de animação dos ícones
  AnimationController _animationController;
  bool isPlaying = false;

  AnimationController _ellipsisAnimationController;
  bool isPlayingEllipsis = false;

  AnimationController _playAnimationController;
  bool isPlayingPlay = false;

  //Definindo as propriedades dos controladores de animação
  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _ellipsisAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _playAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 1000));
  }

  //Funções que descarta o objeto de controle de animação após o encerramento da animação
  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
    _ellipsisAnimationController.dispose();
    _playAnimationController.dispose();
  }


  //Funções que alternam entre os dois estados dos icones
  void _handleOnPressed() {
    setState(() {
      isPlaying = !isPlaying;
      isPlaying
          ? _animationController.forward()
          : _animationController.reverse();
    });
  }
  void _onEllipsisButton() {
    setState(() {
      isPlayingEllipsis = !isPlayingEllipsis;
      isPlayingEllipsis
          ? _ellipsisAnimationController.forward()
          : _ellipsisAnimationController.reverse();
    });
  }
  void _onPlayButton() {
    setState(() {
      isPlayingPlay = !isPlayingPlay;
      isPlayingPlay
          ? _playAnimationController.forward()
          : _playAnimationController.reverse();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FloatingActionButton(
              onPressed: _handleOnPressed,
              tooltip: 'Animated Icon',
              child: AnimatedIcon(
                icon: AnimatedIcons.menu_home,
                progress: _animationController,
                semanticLabel: 'Show menu',
              ),
            ),
            Container(
              height: 30,
            ),
            FloatingActionButton(
              onPressed: _onEllipsisButton,
              tooltip: 'Animated Icon',
              child: AnimatedIcon(
                icon: AnimatedIcons.ellipsis_search,
                progress: _ellipsisAnimationController,
                semanticLabel: 'Show menu',
              ),
            ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onPlayButton,
        tooltip: 'Animated Icon',
        child: AnimatedIcon(
          icon: AnimatedIcons.play_pause,
          progress: _playAnimationController,
          semanticLabel: 'Show menu',
        ),
      ),
    );
  }
}
