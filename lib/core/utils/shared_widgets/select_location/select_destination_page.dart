import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../features/user_home/presentation/view_models/user_home_cubit/user_home_cubit.dart';
import '../../../../features/user_home/presentation/widgets/select_destination_widget.dart';
import 'select_destination_map_screen.dart';

class SelectDestinationPage extends StatefulWidget {
  const SelectDestinationPage({
    super.key,
    required this.cubit,
  });

  final UserHomeCubit cubit;

  @override
  State<SelectDestinationPage> createState() => _SelectDestinationPageState();
}

class _SelectDestinationPageState extends State<SelectDestinationPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.cubit,
      child: SelectDestinationWidget(
        changeMapTap: () async {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BlocProvider.value(
                value: widget.cubit,
                child: SelectDestinationMapScreen(
                  homeCubit: widget.cubit,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
