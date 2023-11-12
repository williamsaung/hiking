import '../../configs/export_config.dart';
import '../../models/export_models.dart';
import '../../services/export_services.dart';
import '../../widgets/export_widgets.dart';
import 'map_ctrl.dart';

class mapPage extends StatefulWidget {
  const mapPage({Key? key}) : super(key: key);

  @override
  State<mapPage> createState() => _MapPageState();
}

class _MapPageState extends State<mapPage> {
  late GoogleMapController mapController;
  CustomInfoWindowController _customInfoWindowController =
      CustomInfoWindowController();
  late MapController controller;
  Set<Marker> markers = {};
  final CampsiteService campsiteService = CampsiteService();
  LatLng _center = const LatLng(0, 0); // Initialize with default values
  final LocationService _locationService = LocationService();

  @override
  void initState() {
    super.initState();
    controller = Get.put(MapController());
    loadData();
  }

  @override
  void dispose() {
    Get.delete<MapController>();
    super.dispose();
  }

  void _onMapCreated(GoogleMapController controller) {
    _customInfoWindowController.googleMapController = controller;
  }

  loadData() async {
    try {
      var response = campsiteService.getCampsiteList();
      await campsiteService.returnResponse(response, onSuccess: (jsonString) {
        for (var element in jsonString['results']) {
          markers.add(Marker(
            markerId: MarkerId(element['id'].toString()),
            icon: element['is_premium'] == true
                ? BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueGreen)
                : BitmapDescriptor.defaultMarker,
            position: LatLng(element['latitude'], element['longitude']),
            onTap: () {
              _customInfoWindowController.addInfoWindow!(
                Container(
                  height: 400,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 300,
                        height: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(element['thumbnail_image']),
                              fit: BoxFit.fitWidth,
                              filterQuality: FilterQuality.high),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 10, left: 10, right: 10),
                        child: Text(
                          element['name'],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 10, left: 10, right: 10),
                        child: Text(
                          element['price'].toString(),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 10, left: 10, right: 10),
                        child: Text(
                          element['address'],
                          maxLines: 5,
                        ),
                      ),
                      controller.userId == element['created_user_id']
                          ? Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 10, right: 10),
                              child: Column(
                                children: [
                                  Text(
                                    "Booking Request Number : ${element['booking_request']}",
                                  ),
                                  Text(
                                    "Booking Confirmed Number : ${element['booking_confirmed']}",
                                  ),
                                ],
                              ),
                            )
                          : Container(),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 10, left: 10, right: 10),
                        child: ElevatedButton(
                          child: const Text("See details"),
                          onPressed: () async {
                            await controller.goDetails(element);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                LatLng(element['latitude'], element['longitude']),
              );
            },
          ));
        }
      });
    } catch (e) {
      print('CampsiteList $e');
      rethrow;
    }
    setState(() {});
  }

  Future<void> _getLocation() async {
    try {
      final locationData = await _locationService.getCurrentLocation();
      if (locationData != null) {
        setState(() {
          _center = LatLng(locationData.latitude!, locationData.longitude!);
        });
      } else {
        // Handle the case when location data is null (permissions issue, disabled services, etc.).
      }
    } catch (e) {
      print('Error getting location: $e');
      // Handle any exceptions that occur during location retrieval.
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.green[700],
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Maps Sample App'),
          elevation: 2,
        ),
        body: Stack(
          children: [
            GoogleMap(
              onMapCreated: _onMapCreated,
              myLocationEnabled: true,
              markers: markers,
              onTap: (position) {
                _customInfoWindowController.hideInfoWindow!();
              },
              onCameraMove: (position) {
                _customInfoWindowController.onCameraMove!();
              },
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 11.0,
              ),
            ),
            CustomInfoWindow(
              controller: _customInfoWindowController,
              height: 400,
              width: 300,
              offset: 35,
            ),
          ],
        ),
      ),
    );
  }
}
