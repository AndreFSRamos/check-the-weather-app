import 'package:flutter/material.dart';
import 'package:webservice/model/clima.dart';
import 'package:webservice/repo/api_hgbrasil_repo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Web Service - Aula 01',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:const MyHomePage(title: 'Web Service - Aula 01'),
    );
  }
}

class MyHomePage extends StatefulWidget {
 const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ClimaRepository climaRepo = ClimaRepository();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: FutureBuilder<Clima?>(
          future: climaRepo.getClima("Curitiba,PR"),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
              case ConnectionState.none:
                return const Center(child: CircularProgressIndicator());
              default:
                if (snapshot.hasError) {
                  return Container();
                } else {
                  return Center( child: Text("${snapshot.data!.city} - Temperatura: ${snapshot.data!.temp}°C"));
                }
            }
          }), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
