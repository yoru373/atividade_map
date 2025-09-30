import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapaSP extends StatefulWidget {
  @override
  _MapaSPState createState() => _MapaSPState();
}

class _MapaSPState extends State<MapaSP> {
  List<LatLng> pontosCasa = [
    LatLng(-23.44934842298527, -46.71061598820703), // perto da minha casa
    LatLng(-23.445036107415188, -46.72306325192928), // shopping cantareira
    LatLng(-23.444729220230784, -46.717171187620906), // minha escola
    LatLng(-23.5300, -46.7053), // Senac Lapa Tito
    LatLng(-23.486042378494417, -46.726198545875675), // terminal Pirituba
  ];

  List<LatLng> pontosOutros = [
    LatLng(-23.550520, -46.633308), // Centro SP
    LatLng(-23.561414, -46.655881), // Av. Paulista
    LatLng(-23.543178, -46.629184), // Luz
    LatLng(-23.589068, -46.658985), // Ibirapuera
    LatLng(-23.532923, -46.791398), // Pirituba
  ];

  late List<LatLng> pontosAtuais;

  List<Color> cores = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.purple,
  ];

  @override
  void initState() {
    super.initState();
    pontosAtuais = pontosCasa;
  }

  void trocarPontos() {
    setState(() {
      pontosAtuais = pontosAtuais == pontosCasa ? pontosOutros : pontosCasa;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Mapa - SP")),
      body: FlutterMap(
        options: MapOptions(initialCenter: pontosAtuais[0], initialZoom: 12),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.atvd_diego_map',
          ),
          MarkerLayer(
            markers: List.generate(pontosAtuais.length, (i) {
              return Marker(
                point: pontosAtuais[i],
                width: 40,
                height: 40,
                child: Icon(
                  Icons.location_pin,
                  color: cores[i % cores.length],
                  size: 40,
                ),
              );
            }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: trocarPontos,
        child: Icon(Icons.swap_horiz),
        tooltip: "Escolher outro local",
      ),
    );
  }
}
