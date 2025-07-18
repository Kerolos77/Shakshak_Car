import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shakshak/core/resources/app_colors.dart';
import 'package:shakshak/core/utils/styles.dart';
import 'package:shakshak/features/base_layout/presentation/views/base_layout_view.dart';
import 'package:shakshak/features/rides/presentation/view_models/rides_cubit.dart';

import '../../../../generated/l10n.dart';
import '../../data/models/ride.dart';
import '../widgets/rides_list.dart';

class RidesView extends StatefulWidget {
  const RidesView({super.key});

  @override
  State<RidesView> createState() => _RidesViewState();
}

class _RidesViewState extends State<RidesView> {
  @override
  void initState() {
    super.initState();
    context.read<RidesCubit>().getRides(inCity: 1);
  }

  final PageController _pageController = PageController();
  int _selectedIndex = 0;

  List<String> get titles => [
        S.of(context).activeRides,
        S.of(context).completedRides,
        S.of(context).canceledRides,
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
      title: S.of(context).rides,
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
            child: BlocBuilder<RidesCubit, RidesState>(
              builder: (context, state) {
                if (state is RidesLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is RidesFailure) {
                  return Center(child: Text(state.errorMessage));
                } else if (state is RidesSuccess) {
                  final data = state.ridesModel.data;
                  final List<Ride> searching = data?.searching ?? [];
                  final List<Ride> started = data?.started ?? [];
                  final List<Ride> placed = data?.placed ?? [];
                  final List<Ride> completed = data?.completed ?? [];
                  final List<Ride> canceled = data?.canceled ?? [];
                  final List<Ride> active = [
                    ...searching,
                    ...started,
                    ...placed,
                  ];
                  return PageView(
                    controller: _pageController,
                    onPageChanged: _onPageChanged,
                    children: [
                      RidesList(rides: active),
                      RidesList(rides: completed),
                      RidesList(rides: canceled),
                    ],
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}
