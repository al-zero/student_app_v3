import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('testing image');
    return Scaffold(
      body: Center(
        child: ShaderMask(
          shaderCallback: (bounds) => LinearGradient(colors: [
            Colors.white70,
            Colors.white70,
          ], begin: Alignment.bottomCenter, end: Alignment.center)
              .createShader(bounds),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.5,

            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/midlands.jpg',),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.white, BlendMode.dstATop))
            ),
          ),
        ),
      ),
    );
  }
}
