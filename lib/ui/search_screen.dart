import 'dart:async';

import 'package:avtoservicelocator/bloc/common/bloc_provider.dart';
import 'package:avtoservicelocator/bloc/search_bloc.dart';
import 'package:avtoservicelocator/data/utils.dart';
import 'package:avtoservicelocator/model/autoservice_item.dart';
import 'package:avtoservicelocator/ui/search_screen_item.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  SearchBloc _bloc;
  final Completer<GoogleMapController> _controller = Completer();
  LatLng _target;
  MapType _currentMapType = MapType.normal;
  Set<Marker> _markers = <Marker>{};

  final TextEditingController _searchQueryController = TextEditingController();
  String _searchQuery;

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of(context);
    _bloc.context = context;
    _bloc.outAutoServiceItems.listen(_updateMarkers);
    _searchQueryController.addListener(_updateSearchQuery);
    if (_bloc.currentUser?.location == null) {
      _target = Utils.stringToLatLng(location: _bloc.defaultLocation);
    } else {
      _target = Utils.stringToLatLng(location: _bloc.currentUser.location);
    }

  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
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
        appBar: AppBar(
          leading: Icon(
            Icons.search,
            size: 28,
            color: Colors.white,
          ),
          title: TextField(
            controller: _searchQueryController,
            textInputAction: TextInputAction.search,
            enableInteractiveSelection: false,
            decoration: InputDecoration(
              hintText: 'Поиск СТО...',
              border: InputBorder.none,
              hintStyle: TextStyle(color: Colors.white70, fontSize: 20.0),
            ),
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.clear),
              onPressed: _clearSearchQuery,
            ),
          ],
        ),
        body: DefaultTabController(
            length: 2,
            child: Column(
              children: <Widget>[
                Container(
                  color: Colors.white,
                  child: TabBar(
                    labelColor: Colors.blue,
                    tabs: <Widget>[
                      Tab(text: 'Список'),
                      Tab(text: 'На карте'),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    child: TabBarView(
                      physics: NeverScrollableScrollPhysics(),
                      children: <Widget>[
                        StreamBuilder(
                          stream: _bloc.outAutoServiceItems,
                          builder: (BuildContext context,
                              AsyncSnapshot<List<AutoServiceItem>> snapshot) {
                            if (snapshot.data == null ||
                                snapshot.data.isEmpty) {
                              return Center(child: CircularProgressIndicator());
                            } else {
                              return ListView.separated(
                                  padding: EdgeInsets.all(0),
                                  itemCount: snapshot.data.length,
                                  itemBuilder:
                                      (BuildContext context, int index) =>
                                          SearchScreenItem(
                                              snapshot.data[index], _bloc),
                                  separatorBuilder:
                                      (BuildContext context, int index) =>
                                          const Divider(
                                            thickness: 5,
                                            color: Colors.black12,
                                          ));
                            }
                          },
                        ),
                        Stack(children: <Widget>[
                          GoogleMap(
                            onMapCreated: _onMapCreated,
                            initialCameraPosition:
                                CameraPosition(target: _target, zoom: 12.0),
                            myLocationEnabled: true,
                            myLocationButtonEnabled: true,
                            mapType: _currentMapType,
                            markers: _markers,
                          ),
                          Align(
                              alignment: Alignment(0.97, -0.925),
                              child: buttonMapType),
                        ])
                      ],
                    ),
                  ),
                ),
              ],
            )),
        bottomNavigationBar: _bottomNavigationBar());
  }

  BottomNavigationBar _bottomNavigationBar() => BottomNavigationBar(
        currentIndex: _bloc.bottomNavigationBarIndex,
        onTap: (int index) => _bloc.onTapBottomNavigationBar(index),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black54,
        selectedIconTheme: IconThemeData(size: 28),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt),
            title: Text('Заявки'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('Поиск СТО'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            title: Text('Профиль'),
          ),
        ],
      );

  void _updateMarkers(List<AutoServiceItem> list) {
    Set<Marker> markers = <Marker>{};

    list.forEach((AutoServiceItem item) {
      markers.add(Marker(
        markerId: MarkerId(item.id),
        position: Utils.stringToLatLng(location: item.location),
        infoWindow: InfoWindow(
            title: '${item.name}, рейтинг ${item.userRating}',
            snippet: item.address,
            onTap: () {
              _bloc.onTapAutoServiceItem(item: item);
            }),
        anchor: Offset(0.0, 1.0),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
      ));
    });

    setState(() {
      _markers = markers;
    });
  }

  void _updateSearchQuery() {
    var newQuery = _searchQueryController.text;
//    setState(() {
    _searchQuery = newQuery;
//    });
    _bloc.setFilterAutoService(query: newQuery);
  }

  void _clearSearchQuery() {
    _searchQueryController.clear();
    _updateSearchQuery();
  }

  void _onTapButtonMapType() {
    setState(() {
      _currentMapType =
          _currentMapType == MapType.normal ? MapType.hybrid : MapType.normal;
    });
  }
}
