import 'package:flutter/material.dart';
import 'package:projeto_atividade/network/response/asset/asset_response.dart';

class AssetNode extends StatefulWidget {
  final AssetResponse asset;
  final List<Widget> childNodes;
  final double marginLeft;
  final double nodeIndent;

  const AssetNode({
    super.key,
    required this.asset,
    required this.childNodes,
    required this.marginLeft,
    required this.nodeIndent,
  });

  @override
  _AssetNodeState createState() => _AssetNodeState();
}

class _AssetNodeState extends State<AssetNode> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    IconData? getIcon() {
      if (widget.asset.sensorType == "vibration" && widget.asset.status == "alert") {
        return Icons.circle;
      } else if (widget.asset.sensorType != null) {
        return Icons.bolt;
      }
      return null;
    }

    Color? getIconColor() {
      if (widget.asset.sensorType == "vibration" && widget.asset.status == "alert") {
        return const Color(0xFFED3833);
      } else if (widget.asset.sensorType != null) {
        return const Color(0xFF52C41A);
      }
      return null;
    }

    double? getIconSize() {
      if (widget.asset.sensorType == "vibration" && widget.asset.status == "alert") {
        return 12;
      } else if (widget.asset.sensorType != null) {
        return 20;
      }
      return null;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: widget.marginLeft),
          child: ListTile(
            tileColor: Colors.white,
            contentPadding: EdgeInsets.only(left: widget.childNodes.isNotEmpty ? 0 : 14, right: 16.0),
            leading: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (widget.childNodes.isNotEmpty)
                  IconButton(
                    icon: Icon(
                      _isExpanded ? Icons.expand_more : Icons.keyboard_arrow_right,
                      color: Colors.black,
                      size: 20,
                    ),
                    onPressed: () {
                      setState(() {
                        _isExpanded = !_isExpanded;
                      });
                    },
                  ),
                if (widget.asset.sensorType != null)
                  Image.asset('assets/icon/component.png')
                else
                  Image.asset('assets/icon/asset.png')
              ],
            ),
            title: Row(
              children: [
                Flexible(
                  child: Text(
                    widget.asset.name!,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                if (getIcon() != null)
                  Icon(
                    getIcon(),
                    color: getIconColor(),
                    size: getIconSize(),
                  ),
              ],
            ),
            dense: true,
            onTap: () {
              if (widget.childNodes.isNotEmpty) {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              }
            },
          ),
        ),
        if (_isExpanded)
          Padding(
            padding: EdgeInsets.only(left: widget.marginLeft + widget.nodeIndent),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widget.childNodes,
            ),
          ),
      ],
    );
  }
}
