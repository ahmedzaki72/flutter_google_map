import 'package:flutter/material.dart';
import 'package:flutter_map_app/providers/offices_Provider.dart';
import 'package:flutter_map_app/widgets/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GoogleMapController myController;

  LatLng _latlng = LatLng(31.002722, 31.428169);

  void _onMapCreate(GoogleMapController controller) {
    myController = controller;
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final offices = Provider.of<OfficesProvider>(context).officesList;
    print(offices);
    return Scaffold(
      body: Stack(
              children: [
                GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: _latlng,
                    zoom: 11.0,
                  ),
                  onMapCreated: _onMapCreate,
                ),
                ResultContainer(),
              ],
            ),
    );
  }
}

