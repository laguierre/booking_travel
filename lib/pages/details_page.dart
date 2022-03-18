import 'package:booking_travel/models/data.dart';
import 'package:booking_travel/utils.dart';
import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key, this.i = 0}) : super(key: key);

  final int i;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    ScrollController controller = ScrollController();
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: size.height * 0.45,
                  width: size.width,
                  decoration: const BoxDecoration(
                      boxShadow: [boxShadow],
                      color: Colors.transparent,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                  child: Hero(
                    tag: destinations[i].imageUrl,

                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                      child: Image.asset(
                        destinations[i].imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                Container(
                  padding: const EdgeInsets.only(left: 10, right: 20),
                  height: 50,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(FontAwesomeIcons.arrowLeft),
                        color: Colors.black,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      Expanded(child: Container()),
                      const FaIcon(
                        FontAwesomeIcons.magnifyingGlass,
                        color: Colors.black,
                      ),
                      const SizedBox(width: 25),
                      const FaIcon(
                        FontAwesomeIcons.bars,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      width: size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(destinations[i].city,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 35)),
                          const SizedBox(height: 10),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const FaIcon(
                                FontAwesomeIcons.locationArrow,
                                color: Colors.white,
                                size: 20,
                              ),
                              const SizedBox(width: 10),
                              Text(destinations[i].country,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 20)),
                              Expanded(child: Container()),
                              const FaIcon(
                                Icons.add_location_alt_outlined,
                                color: Colors.white,
                                size: 25,
                              ),
                            ],
                          ),
                        ],
                      )),
                )
              ],
            ),
            Expanded(
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    controller: controller,
                    scrollDirection: Axis.vertical,
                    itemCount: activities.length,
                    itemBuilder: (context, i) {
                      return Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 3),
                        height: size.height * 0.28,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Positioned(
                                right: 13,
                                child: Container(
                                    padding: EdgeInsets.only(
                                        left: size.width * 0.3,
                                        top: 30,
                                        right: 15),
                                    height: size.height * 0.25,
                                    width: size.width * 0.84,
                                    decoration: BoxDecoration(
                                        boxShadow: const [boxShadow],
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(activities[i].name,
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 20,
                                                    overflow:
                                                        TextOverflow.ellipsis)),
                                            Expanded(child: Container()),
                                            Column(
                                              children: [
                                                Text('\$${activities[i].price}',
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 20)),
                                                const Text('per pax',
                                                    style: TextStyle(
                                                        color: Colors.grey))
                                              ],
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 15),
                                        Text(activities[i].type,
                                            style: const TextStyle(
                                                color: Colors.grey)),
                                        const SizedBox(height: 5),
                                        Row(
                                          children: [
                                            for (int j = 0;
                                                j < activities[i].rating;
                                                ++j)
                                              const Icon(
                                                Icons.star,
                                                color: Colors.yellow,
                                              )
                                          ],
                                        ),
                                        Expanded(child: Container()),
                                        Row(
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 15, vertical: 7),
                                              decoration: BoxDecoration(
                                                  color: kPrimaryColor
                                                      .withOpacity(0.4),
                                                  borderRadius:
                                                      BorderRadius.circular(10)),
                                              child: Text(
                                                  activities[i].startTimes[0]),
                                            ),
                                            const SizedBox(width: 10),
                                            Container(
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 15, vertical: 7),
                                              decoration: BoxDecoration(
                                                  color: kPrimaryColor
                                                      .withOpacity(0.4),
                                                  borderRadius:
                                                      BorderRadius.circular(10)),
                                              child: Text(
                                                  activities[i].startTimes[1]),
                                            ),
                                          ],
                                        ),
                                        Expanded(child: Container()),
                                      ],
                                    ))),
                            Positioned(
                              left: 15,
                              child: Container(
                                width: size.width * 0.33,
                                height: size.height * 0.22,
                                decoration: BoxDecoration(
                                    boxShadow: const [boxShadow],
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20)),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset(
                                    activities[i].imageUrl,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
