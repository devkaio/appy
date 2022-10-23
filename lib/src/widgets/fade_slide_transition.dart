// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';

class FadeSlideTransition extends StatelessWidget {
  final AnimationController controller;
  final Tween<Offset> slideAnimationTween;
  final Widget child;
  final double begin;
  final double end;
  final int? index;
  final double? singleItemDurationInterval;

  const FadeSlideTransition({
    super.key,
    required this.controller,
    required this.slideAnimationTween,
    required this.child,
    required this.begin,
    required this.end,
    this.index,
    this.singleItemDurationInterval,
  });

  const FadeSlideTransition.staggered({
    super.key,
    required this.controller,
    required this.slideAnimationTween,
    required this.child,
    required this.index,
    required this.singleItemDurationInterval,
    this.begin = 0.0,
    this.end = 1.0,
  })  : assert(singleItemDurationInterval != null),
        assert(index != null);

  double get _begin => index != null && singleItemDurationInterval != null
      ? _calculateBegin()
      : begin;
  double get _end => index != null && singleItemDurationInterval != null
      ? _calculateEnd()
      : end;

  double _calculateBegin() {
    final delay = (singleItemDurationInterval! * index!).toDouble();

    return begin + delay < 1.0
        ? begin + delay
        : 1.0 - singleItemDurationInterval!;
  }

  double _calculateEnd() {
    final delay = (singleItemDurationInterval! * index!).toDouble();
    return begin + delay + singleItemDurationInterval! < end
        ? begin + delay + singleItemDurationInterval!
        : end;
  }

  Animation<double> get _fadeAnimation => Tween<double>(
        begin: 0.0,
        end: 1.0,
      ).animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(
            _begin,
            _end,
            curve: Curves.ease,
          ),
        ),
      );

  Animation<Offset> get _slideAnimation => slideAnimationTween.animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(
            _begin,
            _end,
            curve: Curves.ease,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: child,
      ),
    );
  }
}
