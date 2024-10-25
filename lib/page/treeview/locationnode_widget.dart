import 'package:flutter/material.dart';
import 'package:projeto_atividade/network/response/locations/locations_response.dart';

class LocationNode extends StatefulWidget {
  final LocationsResponse location;
  final List<Widget> childNodes;
  final double marginLeft;
  final double nodeIndent;

  const LocationNode({
    super.key,
    required this.location,
    required this.childNodes,
    required this.marginLeft,
    required this.nodeIndent,
  });

  @override
  _LocationNodeState createState() => _LocationNodeState();
}

class _LocationNodeState extends State<LocationNode> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: widget.marginLeft),
          child: ListTile(
            tileColor: Colors.white,
            contentPadding: EdgeInsets.only(left: widget.childNodes.isNotEmpty ? 0 : 14),
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
                Image.asset('assets/icon/location.png')
              ],
            ),
            title: Text(
              widget.location.name!,
            ),
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
