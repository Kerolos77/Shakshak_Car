import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shakshak/core/utils/styles.dart';
import 'package:shakshak/features/base_layout/presentation/views/base_layout_view.dart';
import 'package:shakshak/features/rides/data/models/ride.dart';
import 'package:shakshak/features/rides/presentation/view_models/rides_cubit.dart';

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

  List<String> get titles => [
        S.of(context).activeRides,
        S.of(context).completedRides,
        S.of(context).canceledRides,
      ];

  @override
  void initState() {
    super.initState();
    context.read<RidesCubit>().getRides(inCity: 0);
  }

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
                  style: Styles.textStyle16Bold(context).copyWith(
                    color: isSelected
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).colorScheme.onSurface,
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
                      OutstationRidesListView(rides: active),
                      OutstationRidesListView(rides: completed),
                      OutstationRidesListView(rides: canceled),
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
