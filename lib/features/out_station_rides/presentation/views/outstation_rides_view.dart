import 'package:flutter/material.dart';
import 'package:shakshak/core/resources/app_colors.dart';
import 'package:shakshak/core/utils/styles.dart';
import 'package:shakshak/features/base_layout/presentation/views/base_layout_view.dart';

import '../../../../generated/l10n.dart';
import '../widgets/outstation_rides_list_view.dart';

class OutstationRidesView extends StatefulWidget {
  const OutstationRidesView({super.key});

  @override
  State<OutstationRidesView> createState() => _OutstationRidesViewState();
}

class _OutstationRidesViewState extends State<OutstationRidesView> {
  final PageController _pageController = PageController();
  int _selectedIndex = 0;

  final List<String> titles = [
    'Active\nRides',
    'Completed\nRides',
    'Canceled\nRides'
  ];

  void _onTap(int index) {
    setState(() => _selectedIndex = index);
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _onPageChanged(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return BaseLayoutView(
      title: S.of(context).outstationRides,
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(titles.length, (index) {
              final isSelected = index == _selectedIndex;
              return GestureDetector(
                onTap: () => _onTap(index),
                child: Text(
                  titles[index],
                  textAlign: TextAlign.center,
                  style: Styles.textStyle16Bold.copyWith(
                    color: isSelected ? AppColors.primaryColor : Colors.black,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
                  ),
                ),
              );
            }),
          ),
          const Divider(),
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: _onPageChanged,
              children: [
                OutstationRidesListView(),
                OutstationRidesListView(),
                OutstationRidesListView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
