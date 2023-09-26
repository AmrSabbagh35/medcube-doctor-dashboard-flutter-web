import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:medsquare_web/components/appointmentCard.dart';
import 'package:medsquare_web/components/custom_text.dart';
import 'package:medsquare_web/constants/style.dart';

class AppointmentsLarge extends StatefulWidget {
  @override
  State<AppointmentsLarge> createState() => _AppointmentsLargeState();
}

class _AppointmentsLargeState extends State<AppointmentsLarge> {
  List<AppointmentCard> items = [
    AppointmentCard(
      name: 'Jamal Abbas',
      date: '23/10/2022',
      time: '3:00',
      desc:
          'Cillum sit eu minim enim cupidatat Lorem laborum et aute Nostrud duis fugiat culpa qui est. Excepteur id dolor quis exercitation commodo amet amet eiusmod. Esse enim consectetur aliqua proident officia eu veniam deserunt voluptate ad minim elit eiusmod ullamco.inim Lorem.Incididunt culpa elit officia incididunt dolor do reprehenderit. Reprehenderit eiusmod magna excepteur irure esse ut aute officia ad dolor. Occaecat exercitation officia velit do do fugiat duis magna. Est minim occaecat quis non quis occaecat consequat mollit velit pariatur voluptate id est. Non in deserunt anim laborum Lorem ullamco aliquip dolore laborum nulla. Qui dolor ad cupidatat officia reprehenderit deserunt ad eiusmod commodo.',
      callback: () {},
    ),
    AppointmentCard(
      name: 'Hala Akkad',
      date: '23/10/2022',
      time: '10:00',
      desc:
          'Cillum sit eu minim enim cupidatat Lorem laborum et aute minim Lorem.',
      callback: () {},
    ),
    AppointmentCard(
      name: 'Dareen Slaibi',
      time: '12:00',
      date: '23/10/2022',
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
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: GridView.builder(
            itemCount: items.length,
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2,
              mainAxisSpacing: 100,
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
