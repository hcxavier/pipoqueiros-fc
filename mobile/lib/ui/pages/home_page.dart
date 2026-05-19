import 'package:flutter/material.dart';
import 'package:mobile/components/widgets.dart';
import 'package:mobile/ui/pages/betting_group_detail_page.dart';
import 'package:mobile/ui/pages/my_betting_groups_page.dart';
import 'package:mobile/ui/pages/new_betting_group.dart';
import 'package:mobile/ui/pages/search_betting_group.dart';
import 'package:mobile/ui/view_models/home_view_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 1);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeViewModel(),
      child: Builder(
        builder: (context) {
          final viewModel = context.watch<HomeViewModel>();
          return Scaffold(
            extendBody: true,
            body: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                viewModel.setIndex(index);
              },
              children: [
                const NewBettingGroupPage(),
                const MyBettingGroupsPage(),
                const SearchBettingGroupPage(),
                const BettingGroupDetailPage(),
              ],
            ),
            bottomNavigationBar: CustomNavigationBar(
              pageController: _pageController,
              viewModel: viewModel,
            ),
          );
        },
      ),
    );
  }
}
