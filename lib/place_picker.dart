import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';

class PickPlaceByPlacePickerPack extends StatefulWidget {
  @override
  State<PickPlaceByPlacePickerPack> createState() =>
      _PickPlaceByPlacePickerPackState();
}

class _PickPlaceByPlacePickerPackState
    extends State<PickPlaceByPlacePickerPack> {
  var selectedPlace;
  var addddress;
  var latitttude;
  var longitttude;

  @override
  Widget build(BuildContext context) {
    return PlacePicker(
      apiKey: "AIzaSyBAgOEteCv3TMp2Y09u-R-uHypaDaq16MY",
      initialPosition: const LatLng(24.8607, 67.0011),
      useCurrentLocation: true,
      // selectInitialPosition: true,
      onPlacePicked: (result) async {
        selectedPlace = result;
        addddress = result.formattedAddress.toString();
        latitttude = result.geometry!.location.lat.toString();
        longitttude = result.geometry!.location.lng.toString();
        print(selectedPlace);
        print(addddress);
        print(latitttude);
        print(longitttude);
        print(result);
      },
      region: 'pk',
      selectedPlaceWidgetBuilder: (_, selectedPlace, state, isSearchBarFocused) {
        print("state: $state, isSearchBarFocused: $isSearchBarFocused");
        return isSearchBarFocused
            ? Container()
            : FloatingCard(
                color: Colors.lightGreen,
                bottomPosition: 50.0,
                leftPosition: 50.0,
                rightPosition: 50.0,
                width: 500,
                borderRadius: BorderRadius.circular(12.0),
                child: state == SearchingState.Searching
                    ? const Center(child: CircularProgressIndicator())
                    : Container(
                        padding: const EdgeInsets.fromLTRB(0, 15, 0, 10),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Flexible(
                                      child: Text(
                                        selectedPlace!.formattedAddress
                                            .toString(),
                                        style: const TextStyle(
                                          fontSize: 15,
                                          color: Colors.white,
                                          letterSpacing: 0.5,
                                          fontWeight: FontWeight.w300,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ]),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    MaterialButton(
                                        padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                                        onPressed: () async {
                                          print(selectedPlace);
                                          print(addddress);
                                          print(latitttude);
                                          print(longitttude);
                                          print(selectedPlace);
                                          print(state);
                                          print(isSearchBarFocused);
                                        },
                                        color: Colors.white,
                                        child: const Text(
                                          "Confirm Location",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.black,
                                            letterSpacing: 0.5,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ))
                                  ]),
                              const SizedBox(
                                height: 10,
                              )
                            ]),
                      ),
              );
      },
    );
  }
}
