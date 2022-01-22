import 'package:flutter/material.dart';
import 'package:resident_app/src/helpers/scalable_dp_helper.dart';
import 'package:resident_app/src/ui/shared/colors.dart';

class CloseActionButton extends StatelessWidget {
  const CloseActionButton({Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SDP.init(context);
    return IconButton(
      iconSize: SDP.sdp(24.0),
      visualDensity: VisualDensity.compact,
      icon: Container(
        decoration: BoxDecoration(
          color: BaseColors.primary,
          borderRadius: BorderRadius.circular(SDP.sdp(5.0)),
        ),
        padding: EdgeInsets.all(SDP.sdp(4.0)),
        child: Icon(
          Icons.close,
          color: Colors.white,
          size: SDP.sdp(16.0),
        ),
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }
}
