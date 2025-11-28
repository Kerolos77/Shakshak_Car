import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shakshak/features/driver/new_rides/presentation/widgets/no_trips_widget.dart';
import 'package:shakshak/features/driver/new_rides/presentation/widgets/online_offline_toggle_button.dart';

import '../../../../../core/services/service_locator.dart';
import '../../../outstation/presentation/widgets/driver_rides_list_item.dart';
import '../../data/repo/new_ride_repo.dart';
import '../view_model/ride_cubit.dart';
import '../view_model/ride_state.dart';

class NewRidesViews extends StatefulWidget {
  const NewRidesViews({super.key});

  @override
  State<NewRidesViews> createState() => _NewRidesViewsState();
}

class _NewRidesViewsState extends State<NewRidesViews> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RideCubit(sl<NewRideRepo>())
        ..connectToWebSocket()
        ..fetchRides(),
      child: BlocConsumer<RideCubit, RideState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = context.read<RideCubit>();
          return Scaffold(
            body: Column(
              children: [
                OnlineOfflineToggleButton(),
                Expanded(
                  child: cubit.rides.isEmpty
                      ? const NoTripsWidget()
                      : ListView.builder(
                          itemCount: cubit.rides.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                                title: DriverRidesListItem(
                              isOutstation: index == 0,
                              isNew: true,
                              ride: cubit.rides[index],
                            ));
                          },
                        ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

// void connectToSocket() {
//   IO.Socket socket = IO.io(
//     'wss://shakshak.net:6001',
//     IO.OptionBuilder()
//         .setTransports(['websocket'])
//         .disableAutoConnect()
//         .setQuery({'appKey': 'key'}) // غيّر الـ key
//         .build(),
//   );
//
//   // ✅ Event Listeners للـ Socket
//   socket.onConnect((_) {
//     print('✅ Socket connected');
//   });
//
//   socket.onDisconnect((_) {
//     print('❌ Socket disconnected');
//   });
//
//   socket.onError((data) {
//     print('⚠️ Socket error: $data');
//   });
//
//   socket.onReconnect((attempt) {
//     print('🔁 Reconnecting... attempt: $attempt');
//   });
//
//   socket.onReconnectError((error) {
//     print('❌ Reconnect error: $error');
//   });
//
//   socket.onReconnectFailed((_) {
//     print('❌ Failed to reconnect');
//   });
//
//   echo = Echo(
//     broadcaster: EchoBroadcasterType.SocketIO,
//     client: socket,
//   );
//
//   echo.channel('drivers').listen('drivers1', (data) {
//     print("🚗 حدث جديد: $data");
//   });
//
//   socket.connect();
// }
}
