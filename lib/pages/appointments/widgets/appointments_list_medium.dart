import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:medsquare_web/components/appointmentCard.dart';
import 'package:medsquare_web/components/custom_text.dart';
import 'package:medsquare_web/constants/style.dart';

class AppointmentsMedium extends StatefulWidget {
  @override
  State<AppointmentsMedium> createState() => _AppointmentsMediumState();
}

class _AppointmentsMediumState extends State<AppointmentsMedium> {
  List<AppointmentCard> items = [
    AppointmentCard(
      name: 'Dr.Eyad Akawi',
      date: '20/10/2022',
      time: '16:00',
      desc:
          'Cillum sit eu minim enim cupidatat Lorem laborum et aute minim Lorem.',
      callback: () {},
    ),
    AppointmentCard(
      name: 'Dr.Sara Bori',
      date: '12/1/2022',
      time: '10:00',
      desc:
          'Cillum sit eu minim enim cupidatat Lorem laborum et aute minim Lorem.',
      callback: () {},
    ),
    AppointmentCard(
      name: 'Dr.Hamdan Ayoub',
      time: '15:00',
      date: '4/8/2022',
      desc:
          'Cillum sit eu minim enim cupidatat Lorem laborum et aute minim Lorem.',
      callback: () {},
    ),
    AppointmentCard(
      name: 'Dr.Ranim Dabba',
      time: '6:00',
      date: '2/13/2022',
      desc:
          'Cillum sit eu minim enim cupidatat Lorem laborum et aute minim Lorem.',
      callback: () {},
    ),
    AppointmentCard(
      name: 'Dr.Bader Shrouk',
      time: '12:00',
      date: '20/5/2022',
      desc:
          'Cillum sit eu minim enim cupidatat Lorem laborum et aute minim Lorem.',
      callback: () {},
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 1400,
          height: MediaQuery.of(context).size.height,
          child: GridView.builder(
            itemCount: items.length,
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1,
            ),
            itemBuilder: (BuildContext context, int index) {
              final AppointmentCard card = items[index];

              return AppointmentCard(
                  name: card.name,
                  time: card.time,
                  date: card.date,
                  desc: card.desc,
                  callback: () {
                    setState(() {
                      items.remove(items[index]);
                      Get.snackbar('Deleted', 'Check Deleted Appointments',
                          barBlur: 20,
                          duration: Duration(milliseconds: 1000),
                          shouldIconPulse: true,
                          icon: Icon(Icons.delete));
                    });
                  });
            },
          ),
        )
      ],
    );
  }
}
