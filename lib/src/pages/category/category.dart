// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:appy/src/constants.dart';
import 'package:appy/src/data/models/design_pattern_category.dart';
import 'package:appy/src/pages/category/widgets/design_pattern_card.dart';
import 'package:appy/src/widgets/fade_slide_transition.dart';
import 'package:appy/src/widgets/platform_back_button.dart';
import 'package:flutter/material.dart';

import '../../widgets/coming_soon.dart';

class Category extends StatefulWidget {
  final DesignPatternCategory category;

  const Category({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category>
    with SingleTickerProviderStateMixin {
  final _animationIntervalStart = 0.65;
  final _appBarHeigh = 56.0;
  late AnimationController _fadeSlideAnimationController;
  late ScrollController _scrollController;
  double _appBarElevation = 0.0;
  double _appBarTitleOpacity = 0.0;

  @override
  void initState() {
    super.initState();

    _fadeSlideAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..forward();

    _scrollController = ScrollController()
      ..addListener(
        () {
          setState(
            () {
              _appBarElevation = _scrollController.offset >
                      _scrollController.initialScrollOffset
                  ? 4.0
                  : 0.0;

              _appBarTitleOpacity = _scrollController.offset >
                      _scrollController.initialScrollOffset + _appBarHeigh / 2
                  ? 1.0
                  : 0.0;
            },
          );
        },
      );
  }

  @override
  void dispose() {
    _fadeSlideAnimationController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Hero(
            tag: '${widget.category.id}_background',
            child: Container(
              color: Color(widget.category.color),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                FadeSlideTransition(
                  controller: _fadeSlideAnimationController,
                  slideAnimationTween: Tween<Offset>(
                    begin: const Offset(0.0, 0.5),
                    end: const Offset(0.0, 0.0),
                  ),
                  begin: 0.0,
                  end: _animationIntervalStart,
                  child: PreferredSize(
                    preferredSize: Size.fromHeight(_appBarHeigh),
                    child: AppBar(
                      centerTitle: true,
                      title: AnimatedOpacity(
                        opacity: _appBarTitleOpacity,
                        duration: const Duration(milliseconds: 250),
                        child: Text(
                          widget.category.title,
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .apply(color: Colors.white),
                        ),
                      ),
                      backgroundColor: Color(widget.category.color),
                      elevation: _appBarElevation,
                      leading: const PlatformBackButton(color: Colors.white),
                    ),
                  ),
                ),
                Expanded(
                  child: ScrollConfiguration(
                    behavior: const ScrollBehavior(),
                    child: SingleChildScrollView(
                      controller: _scrollController,
                      padding: const EdgeInsets.fromLTRB(
                        Constants.large,
                        Constants.zero,
                        Constants.large,
                        Constants.large,
                      ),
                      child: Column(
                        children: [
                          FadeSlideTransition(
                            controller: _fadeSlideAnimationController,
                            slideAnimationTween: Tween<Offset>(
                              begin: const Offset(0.0, 0.5),
                              end: const Offset(0.0, 0.0),
                            ),
                            begin: 0.0,
                            end: _animationIntervalStart,
                            child: Row(
                              children: [
                                Text(
                                  widget.category.title,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4!
                                      .copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: Constants.large),
                          for (var i = 0;
                              i < widget.category.patterns.length;
                              i++)
                            FadeSlideTransition.staggered(
                              index: i,
                              controller: _fadeSlideAnimationController,
                              slideAnimationTween: Tween<Offset>(
                                begin: const Offset(0.0, 0.1),
                                end: const Offset(0.0, 0.0),
                              ),
                              singleItemDurationInterval: 0.05,
                              begin: _animationIntervalStart,
                              end: 1.0,
                              child: Container(
                                margin:
                                    const EdgeInsets.only(top: Constants.large),
                                child: DesignPatternCard(
                                  designPattern: widget.category.patterns[i],
                                ),
                              ),
                            ),
                          if (widget.category.patterns.isEmpty)
                            FadeSlideTransition(
                              controller: _fadeSlideAnimationController,
                              slideAnimationTween: Tween<Offset>(
                                begin: const Offset(0.0, 0.5),
                                end: const Offset(0.0, 0.0),
                              ),
                              begin: 0.0,
                              end: _animationIntervalStart,
                              child: const ComingSoon(),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
