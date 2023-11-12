// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:appy/src/constants.dart';
import 'package:appy/src/data/models/design_pattern.dart';
import 'package:appy/src/data/repositories/markdown_repository.dart';
import 'package:appy/src/pages/design_pattern_details/widgets/design_pattern_details_header.dart';
import 'package:appy/src/widgets/fade_slide_transition.dart';
import 'package:appy/src/widgets/platform_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class DesignPatternDetails extends StatefulWidget {
  final DesignPattern designPattern;
  final Widget example;
  const DesignPatternDetails({
    Key? key,
    required this.designPattern,
    required this.example,
  }) : super(key: key);

  @override
  State<DesignPatternDetails> createState() => _DesignPatternDetailsState();
}

class _DesignPatternDetailsState extends State<DesignPatternDetails>
    with TickerProviderStateMixin {
  final MarkdownRepository repository = MarkdownRepository();
  final double _animationIntervalStart = 0.65;
  final double _appBarHeight = 56.0;

  late AnimationController _fadeSlideAnimationController;
  late ScrollController _scrollController;

  late TabController _tabController;
  double _appBarElevation = 0.0;
  double _appBarTitleOpacity = 0.0;
  double _bottomNavigationBarElevation = 4.0;

  @override
  void initState() {
    super.initState();

    _fadeSlideAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1200))
      ..forward();
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          _appBarElevation =
              _scrollController.offset > _scrollController.initialScrollOffset
                  ? 4.0
                  : 0.0;

          _appBarTitleOpacity = _scrollController.offset >
                  _scrollController.initialScrollOffset + _appBarHeight / 2
              ? 1.0
              : 0.0;
          _bottomNavigationBarElevation = _scrollController.offset ==
                  _scrollController.position.maxScrollExtent
              ? 0.0
              : 4.0;
        });
      });
    _tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _fadeSlideAnimationController.dispose();
    _scrollController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  void onBottomNavigationBarItemTap(int index) {
    setState(() {
      _tabController.index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: FadeSlideTransition(
        controller: _fadeSlideAnimationController,
        slideAnimationTween: Tween<Offset>(
          begin: const Offset(0.0, 1.0),
          end: const Offset(0.0, 0.0),
        ),
        begin: _animationIntervalStart,
        end: 1.0,
        child: BottomNavigationBar(
          currentIndex: _tabController.index,
          backgroundColor: Constants.defaultBackGroundColor,
          elevation: _bottomNavigationBarElevation,
          selectedIconTheme: const IconThemeData(size: 20.0),
          selectedItemColor: Colors.black,
          unselectedIconTheme: const IconThemeData(size: 20.0),
          unselectedItemColor: Colors.black45,
          items: const [
            BottomNavigationBarItem(
              label: "Descrição",
              icon: Icon(Icons.list_alt),
            ),
            BottomNavigationBarItem(
              label: "Exemplo",
              icon: Icon(Icons.lightbulb),
            ),
          ],
          onTap: onBottomNavigationBarItemTap,
        ),
      ),
      body: Stack(
        children: [
          Hero(
            tag: '${widget.designPattern.id}_background',
            child: Container(
              color: Constants.defaultBackGroundColor,
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
                    preferredSize: Size.fromHeight(_appBarHeight),
                    child: AppBar(
                      centerTitle: true,
                      title: AnimatedOpacity(
                        opacity: _appBarTitleOpacity,
                        duration: const Duration(
                          milliseconds: 250,
                        ),
                        child: Text(
                          widget.designPattern.title,
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                      backgroundColor: Constants.defaultBackGroundColor,
                      elevation: _appBarElevation,
                      leading: const PlatformBackButton(color: Colors.black),
                    ),
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      ScrollConfiguration(
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FadeSlideTransition(
                                controller: _fadeSlideAnimationController,
                                slideAnimationTween: Tween<Offset>(
                                  begin: const Offset(0.0, 0.25),
                                  end: const Offset(0.0, 0.0),
                                ),
                                begin: 0.0,
                                end: _animationIntervalStart,
                                child: DesignPatternDetailsHeader(
                                  designPattern: widget.designPattern,
                                ),
                              ),
                              const SizedBox(height: Constants.large),
                              FadeSlideTransition(
                                controller: _fadeSlideAnimationController,
                                slideAnimationTween: Tween<Offset>(
                                  begin: const Offset(0.0, 0.05),
                                  end: const Offset(0.0, 0.0),
                                ),
                                begin: _animationIntervalStart,
                                end: 1.0,
                                child: FutureBuilder<String>(
                                  future:
                                      repository.get(widget.designPattern.id),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      return MarkdownBody(data: snapshot.data!);
                                    }
                                    return CircularProgressIndicator(
                                      backgroundColor:
                                          Constants.defaultBackGroundColor,
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.black.withOpacity(0.65),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: Constants.large),
                        child: widget.example,
                      )
                    ],
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
