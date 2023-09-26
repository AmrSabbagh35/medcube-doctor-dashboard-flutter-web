import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medsquare_web/components/categCard.dart';
import 'package:medsquare_web/constants/sizes.dart';
import 'package:medsquare_web/constants/style.dart';

class PredictionsCategories extends StatefulWidget {
  const PredictionsCategories({Key? key}) : super(key: key);

  @override
  State<PredictionsCategories> createState() => _PredictionsCategoriesState();
}

class _PredictionsCategoriesState extends State<PredictionsCategories> {
  bool getnow = false;
  List<CategCard> cards = [
    CategCard(icon: FontAwesomeIcons.brain, name: 'Stroke', callback: () {}),
    CategCard(icon: FontAwesomeIcons.droplet, name: 'Anemia', callback: () {}),
    CategCard(
        icon: FontAwesomeIcons.heartPulse,
        name: 'Heart Disease',
        callback: () {}),
    CategCard(
        icon: FontAwesomeIcons.suitcaseMedical,
        name: 'Diabetes',
        callback: () {}),
    CategCard(
        icon: FontAwesomeIcons.userInjured,
        name: 'Chronic Kidney',
        callback: () {}),
    CategCard(
        icon: FontAwesomeIcons.hospitalUser,
        name: 'Hospital Staying Duration',
        callback: () {}),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.6,
          child: GridView.builder(
            itemCount: cards.length,
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 2,
              crossAxisSpacing: 100,
              mainAxisSpacing: 100,
            ),
            itemBuilder: (BuildContext context, int index) {
              final CategCard c = cards[index];
              return CategCard(icon: c.icon, name: c.name, callback: () {});
            },
          ),
        ),
        getnow
            ? Container(
                width: 500,
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 6),
                        color: lightGrey.withOpacity(.1),
                        blurRadius: 12)
                  ],
                  border: Border.all(color: lightGrey, width: .5),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Results',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      buildresult(title: 'Stroke', content: 'No'),
                      SizedBox(
                        height: 10,
                      ),
                      buildresult(title: 'Anemia', content: 'No'),
                      SizedBox(
                        height: 10,
                      ),
                      buildresult(title: 'Heart Disease', content: 'No'),
                      SizedBox(
                        height: 10,
                      ),
                      buildresult(
                          title: 'Diabetes', content: 'Yes', color: Colors.red),
                      SizedBox(
                        height: 10,
                      ),
                      buildresult(title: 'Chronic Kidney', content: 'No'),
                      SizedBox(
                        height: 10,
                      ),
                      buildresult(title: 'Hospital Staying', content: '2 days'),
                    ],
                  ),
                ),
              )
            : ElevatedButton(
                onPressed: () {
                  setState(() {
                    getnow = true;
                  });
                },
                child: Text('get results')),
      ],
    );
  }

  Row buildresult({title, content, color = Colors.green}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          '$title : ',
          style: TextStyle(
              color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        SizedBox(width: 2),
        Text(
          '$content',
          style: TextStyle(
              color: color, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ],
    );
  }
}
