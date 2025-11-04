import 'package:flutter/material.dart';

import 'border_atom.dart';



class ContainerDecorated extends StatelessWidget {
  const ContainerDecorated({super.key, this.borderRadius, this.child, this.color, this.colorBorder,  this.padding, this.onTap, this.paddingEdgeInsets, this.shadow, this.elevation, this.linearGradient, this.radialGradient, this.width, this.height, this.margin, this.marginEdgeInsets, this.onHover,this.constraints});
  final double? borderRadius;
  final Widget? child;
  final Color? color;
  final Color? colorBorder;
  final double? padding;
  final Function()? onTap;
  final Function(bool)? onHover;
  final EdgeInsets? paddingEdgeInsets;
  final List<BoxShadow>? shadow;
  final double? elevation;
  final LinearGradient? linearGradient;
  final RadialGradient? radialGradient;
  final double? width;
  final double? height;
  final double? margin;
  final EdgeInsets? marginEdgeInsets;
  final BoxConstraints? constraints;



  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: marginEdgeInsets??EdgeInsets.all(margin??0.0),
        child: Material(elevation: elevation??0,borderRadius: BorderRadius.circular(borderRadius??BorderAtom.borderRadiusValue),child: InkWell(onHover: onHover,onTap: onTap,child: Container(constraints: constraints,height: height,width: width,padding: paddingEdgeInsets??EdgeInsets.all(padding??4),decoration: BoxDecoration(gradient: linearGradient??radialGradient,boxShadow: shadow,borderRadius: BorderRadius.circular(borderRadius??BorderAtom.borderRadiusValue ),border: Border.all(color: colorBorder??Colors.transparent),color: color??Colors.grey.shade200),child: child,))),
      );
  }
}
