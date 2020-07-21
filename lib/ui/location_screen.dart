import 'dart:async';

import 'package:avtoservicelocator/bloc/common/bloc_provider.dart';
import 'package:avtoservicelocator/bloc/location_bloc.dart';
import 'package:avtoservicelocator/data/utils.dart';
import 'package:avtoservicelocator/model/autoservice.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  LocationBloc _bloc;
  AutoService _autoService;
  final Completer<GoogleMapController> _controller = Completer();
  LatLng _target;
  MapType _currentMapType = MapType.normal;
  final Set<Marker> _markers = {};

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);

    setState(() {
      _markers.add(Marker(
        markerId: MarkerId(_target.toString()),
        position: _target,
        infoWindow: InfoWindow(
            title:
                '${_autoService.name}, рейтинг ${_autoService.userRating}',
            snippet: _autoService.address),
        anchor: Offset(0.0, 1.0),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
      ));
    });
  }

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of(context);
    _bloc.context = context;
    _autoService = _bloc.autoService;
    _target = Utils.stringToLatLng(location: _autoService.location);
  }

  @override
  Widget build(BuildContext context) {
    var buttonBack = Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.blue,
        ),
        child: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ));

    var buttonMapType = Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.blue,
        ),
        child: IconButton(
          icon: const Icon(Icons.layers),
          color: Colors.white,
          onPressed: _onTapButtonMapType,
        ));

    return Scaffold(
        body: Stack(children: <Widget>[
      GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(target: _target, zoom: 17.0),
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        mapType: _currentMapType,
        markers: _markers,
      ),
      Align(alignment: Alignment(-0.97, -0.91), child: buttonBack),
      Align(alignment: Alignment(0.97, -0.91), child: buttonMapType),
    ]));
  }

  void _onTapButtonMapType() {
    setState(() {
      _currentMapType =
          _currentMapType == MapType.normal ? MapType.hybrid : MapType.normal;
    });
  }
}
