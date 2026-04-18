import 'package:flutter/material.dart';

extension SliverWidget on Widget {
  SliverToBoxAdapter toSliverNoPadding() {
    return SliverToBoxAdapter(child: this);
  }

  SliverPadding toSliverPadding({required EdgeInsetsGeometry padding}) {
    return SliverPadding(
      padding: padding,
      sliver: SliverToBoxAdapter(child: this),
    );
  }
}
