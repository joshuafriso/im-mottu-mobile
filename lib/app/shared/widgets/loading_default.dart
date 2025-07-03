import 'package:flutter/material.dart';
import 'package:im_mottu_mobile/app/shared/utils/responsively.dart';

class LoadingDefault extends StatelessWidget {
  final Color color;
  const LoadingDefault({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: Responsively.auto(150),
        width: Responsively.auto(150),
        child: Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(color))),
      ),
    );
  }
}
