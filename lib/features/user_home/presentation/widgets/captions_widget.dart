import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shakshak/core/extentions/glopal_extentions.dart';

import '../../../../core/utils/styles.dart';
import '../view_models/user_home_cubit/user_home_cubit.dart';
import '../view_models/user_home_cubit/user_home_states.dart';

class CaptionsWidget extends StatefulWidget {
  const CaptionsWidget({
    super.key,
    this.cycleDuration = const Duration(seconds: 3),
  });

  final Duration cycleDuration;

  @override
  State<CaptionsWidget> createState() => _CaptionsWidgetState();
}

class _CaptionsWidgetState extends State<CaptionsWidget> {
  Timer? _timer;
  int _currentCaptionIndex = 0;
  List<String> _captions = [];

  @override
  void initState() {
    super.initState();
    context.read<UserHomeCubit>().getCaptions();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startCaptionCycle(List<String> captions) {
    if (captions.isEmpty) return;

    _captions = captions;
    _timer?.cancel();

    _timer = Timer.periodic(widget.cycleDuration, (timer) {
      setState(() {
        _currentCaptionIndex = (_currentCaptionIndex + 1) % _captions.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserHomeCubit, UserHomeState>(
      buildWhen: (previous, current) =>
          current is UserHomeCaptionLoading ||
          current is UserHomeCaptionSuccess ||
          current is UserHomeCaptionFailure,
      listener: (context, state) {
        if (state is UserHomeCaptionSuccess) {
          final captions = state.userHomeCaptionModel.captions
              .map((item) => item.caption)
              .toList();

          if (captions.isNotEmpty) {
            _startCaptionCycle(captions);
          }
        }
      },
      builder: (context, state) {
        if (state is UserHomeCaptionSuccess && _captions.isNotEmpty) {
          return Container(
            padding: EdgeInsets.all(8.r),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).primaryColor,
                  Theme.of(context).colorScheme.secondary,
                ],
              ),
            ),
            child: Row(
              children: [
                Icon(Icons.error,
                    color: Theme.of(context).colorScheme.onPrimary, size: 24.r),
                8.pw,
                Expanded(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    child: Text(
                      _captions[_currentCaptionIndex],
                      key: ValueKey<String>(_captions[_currentCaptionIndex]),
                      style: Styles.textStyle16(context).copyWith(
                          color: Theme.of(context).colorScheme.onPrimary),
                    ),
                  ),
                ),
                8.pw,
                Icon(Icons.chevron_right,
                    color: Theme.of(context).colorScheme.onPrimary, size: 28.r),
              ],
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
