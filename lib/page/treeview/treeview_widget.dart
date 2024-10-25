import 'package:flutter/widgets.dart';
import 'package:projeto_atividade/page/treeview/assetnode_widget.dart';
import 'package:projeto_atividade/page/treeview/locationnode_widget.dart';
import 'package:projeto_atividade/network/response/asset/asset_response.dart';
import 'package:projeto_atividade/network/response/locations/locations_response.dart';

class TreeViewWidget extends StatelessWidget {
  final List<AssetResponse> assets;
  final List<LocationsResponse> locations;
  final double nodeIndent;

  const TreeViewWidget({
    super.key,
    required this.assets,
    required this.locations,
    this.nodeIndent = 8.0,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ...locations.where((loc) => loc.parentId == null).map(
              (location) => buildLocationNode(
                location,
                locations,
                assets,
                0.0,
              ),
            ),
        ...assets
            .where(
              (asset) => asset.locationId == null && asset.parentId == null,
            )
            .map((asset) => buildAssetNode(asset, assets, 0.0)),
      ],
    );
  }

  Widget buildLocationNode(
    LocationsResponse location,
    List<LocationsResponse> allLocations,
    List<AssetResponse> allAssets,
    double marginLeft,
  ) {
    List<Widget> children = [];

    List<LocationsResponse> directChildLocations = allLocations
        .where(
          (loc) => loc.parentId == location.id,
        )
        .toList();
    for (var childLocation in directChildLocations) {
      children.add(
        buildLocationNode(
          childLocation,
          allLocations,
          allAssets,
          marginLeft + nodeIndent,
        ),
      );
    }

    List<AssetResponse> locationAssets = allAssets
        .where(
          (ass) => ass.locationId == location.id,
        )
        .toList();
    for (var asset in locationAssets) {
      children.add(
        buildAssetNode(
          asset,
          allAssets,
          marginLeft + nodeIndent,
        ),
      );
    }

    return LocationNode(
      location: location,
      childNodes: children,
      marginLeft: marginLeft,
      nodeIndent: nodeIndent,
    );
  }

  Widget buildAssetNode(
    AssetResponse asset,
    List<AssetResponse> allAssets,
    double marginLeft,
  ) {
    List<Widget> children = [];

    List<AssetResponse> directChildAssets = allAssets
        .where(
          (ass) => ass.parentId == asset.id,
        )
        .toList();
    for (var childAsset in directChildAssets) {
      children.add(
        buildAssetNode(
          childAsset,
          allAssets,
          marginLeft + nodeIndent,
        ),
      );
    }

    return AssetNode(
      asset: asset,
      childNodes: children,
      marginLeft: marginLeft,
      nodeIndent: nodeIndent,
    );
  }
}
