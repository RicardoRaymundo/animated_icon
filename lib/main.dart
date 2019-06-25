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
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  bool isPlaying = false;

  //Definindo as propriedades do controlador de animação
  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
  }

  //Função que descarta o objeto de controle de animação após o encerramento da animação
  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  //Função que alterna entre os dois estados dos icones
  void _handleOnPressed() {
    setState(() {
      isPlaying = !isPlaying;
      isPlaying
          ? _animationController.forward()
          : _animationController.reverse();
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
              height: 20,
            ),
            FloatingActionButton(
              onPressed: _handleOnPressed,
              tooltip: 'Animated Icon',
              child: AnimatedIcon(
                icon: AnimatedIcons.ellipsis_search,
                progress: _animationController,
                semanticLabel: 'Show menu',
              ),
            ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _handleOnPressed,
        tooltip: 'Animated Icon',
        child: AnimatedIcon(
          icon: AnimatedIcons.play_pause,
          progress: _animationController,
          semanticLabel: 'Show menu',
        ),
      ),
    );
  }
}
