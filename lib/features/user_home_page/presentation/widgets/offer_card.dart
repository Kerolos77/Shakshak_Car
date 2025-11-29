import 'dart:async';

import 'package:flutter/material.dart';

import '../../data/models/driver_offer.dart';

class OfferCard extends StatefulWidget {
  final DriverOffer offer;
  final VoidCallback onAccept;
  final VoidCallback onRefuse;

  OfferCard(
      {required this.offer, required this.onAccept, required this.onRefuse});

  @override
  _OfferCardState createState() => _OfferCardState();
}

class _OfferCardState extends State<OfferCard> {
  late int remainingTime;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    remainingTime = widget.offer.offerDuration;
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (remainingTime > 1) {
          remainingTime--;
        } else {
          timer.cancel();
          widget.onRefuse(); // Automatically refuse after time runs out
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text("Driver: ${widget.offer.driverName}"),
        subtitle: Text("Price: ${widget.offer.price}"),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("$remainingTime s"),
            IconButton(
              icon: Icon(Icons.check, color: Colors.green),
              onPressed: () {
                _timer.cancel();
                widget.onAccept();
              },
            ),
            IconButton(
              icon: Icon(Icons.close, color: Colors.red),
              onPressed: () {
                _timer.cancel();
                widget.onRefuse();
              },
            ),
          ],
        ),
      ),
    );
  }
}
