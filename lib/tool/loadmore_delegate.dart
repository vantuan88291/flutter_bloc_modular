import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:loadmore/loadmore.dart';

class LoadmoreDelegate extends LoadMoreDelegate {
  @override
  double widgetHeight(LoadMoreStatus status) {
    return status == LoadMoreStatus.nomore ? 0 : 50;
  }
  @override
  Widget buildChild(LoadMoreStatus status,
          {builder = DefaultLoadMoreTextBuilder.english}) =>
      Visibility(
        visible: status == LoadMoreStatus.idle,
        child: Center(
          child: SizedBox(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.redAccent),
              strokeWidth: 2,
            ),
            height: 20.0,
            width: 20.0,
          ),
        ),
      );
}
