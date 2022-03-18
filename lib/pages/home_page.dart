import 'package:booking_travel/pages/details_page.dart';
import 'package:booking_travel/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../models/data.dart';
import '../models/provider/topbutton_provider_model.dart';
import '../widgets/home_page_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _pageController = PageController(viewportFraction: 0.75);

  @override
  Widget build(BuildContext context) {
    int numberButtonPressed = Provider.of<TopButtonModel>(context).number;
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kPadding),
              child: Row(
                children: [
                  const Text(
                    "What you would like\nto find?",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30),
                  ),
                  Expanded(child: Container()),
                ],
              ),
            ),
            const SizedBox(height: 30),
            TopButton(numberButtonPressed: numberButtonPressed),
            const SizedBox(height: 30),
            const Labels(
              label: 'Top Destinations',
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: size.height * 0.47,
              width: double.infinity,
              child: PageView.builder(
                controller: _pageController,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: destinations.length,
                itemBuilder: (context, int i) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(PageRouteBuilder(
                            pageBuilder: (context, animation, _) {
                          return FadeTransition(
                            opacity: Tween<double>(begin: 0.0, end: 1.0)
                                .animate(CurvedAnimation(
                                    parent: animation, curve: Curves.easeOut)),
                            child: DetailsPage(i: i),
                          );
                        }));
                      },
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Container(
                            height: size.height * 0.25,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                boxShadow: const [boxShadow],
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    '${destinations[i].activities.length} activities',
                                    style: const TextStyle(
                                        letterSpacing: 1.0,
                                        fontSize: 23,
                                        fontWeight: FontWeight.w700)),
                                const SizedBox(height: 15),
                                Text(destinations[i].description,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      letterSpacing: 1.0,
                                    ))
                              ],
                            ),
                          ),
                          Positioned(
                            top: 0,
                            child: Container(
                              width: size.width * 0.62,
                              height: size.height * 0.32,
                              decoration: BoxDecoration(
                                  boxShadow: const [boxShadow],
                                  borderRadius: BorderRadius.circular(20)),
                              child: Hero(
                                tag: destinations[i].imageUrl,

                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.asset(
                                      destinations[i].imageUrl,
                                      fit: BoxFit.cover,
                                    )),
                              ),
                            ),
                          ),
                          Positioned(
                              top: size.height * 0.24,
                              left: size.width * 0.07,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(destinations[i].city,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 25,
                                          letterSpacing: 1,
                                          fontWeight: FontWeight.bold)),
                                  const SizedBox(height: 5),
                                  Row(
                                    children: [
                                      const FaIcon(
                                        FontAwesomeIcons.locationArrow,
                                        color: Colors.white,
                                        size: 13,
                                      ),
                                      const SizedBox(width: 10),
                                      Text(destinations[i].country,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 18)),
                                    ],
                                  )
                                ],
                              ))
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            const Labels(
              label: 'Exclusive Hotels',
            ),
            SizedBox(
              height: size.height * 0.34,
              width: double.infinity,
              child: PageView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: hotels.length,
                  itemBuilder: (context, int i) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          left: kPadding, right: kPadding, bottom: 10),
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Container(
                            height: size.height * 0.3,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                boxShadow: const [boxShadow],
                                borderRadius: BorderRadius.circular(25)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: Image.asset(
                                hotels[i].imageUrl,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.only(
                                bottom: 10, left: 15, right: 15),
                            height: size.height * 0.09,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                boxShadow: [boxShadow],
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(25),
                                    bottomRight: Radius.circular(25))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(hotels[i].name,
                                        style: const TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.w700)),
                                    const SizedBox(height: 4),
                                    Text(hotels[i].address,
                                        style: const TextStyle(fontSize: 20)),
                                  ],
                                ),
                                Text('\$${hotels[i].price}',
                                    style: const TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    ));
  }
}

class Labels extends StatelessWidget {
  const Labels({
    Key? key,
    required this.label,
  }) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
                letterSpacing: 1.0, fontWeight: FontWeight.w700, fontSize: 24),
          ),
          const Text("See All",
              style: TextStyle(
                  color: kPrimaryColor, letterSpacing: 1.0, fontSize: 16)),
        ],
      ),
    );
  }
}

class TopButton extends StatelessWidget {
  const TopButton({
    Key? key,
    required this.numberButtonPressed,
  }) : super(key: key);

  final int numberButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          for (int i = 0; i < iconsButtonTop.length; i++)
            RoundedTopButton(
              icon: iconsButtonTop[i],
              buttonColor: i == numberButtonPressed
                  ? kSecondaryColor
                  : Colors.grey.shade200,
              iconColor: i == numberButtonPressed ? kPrimaryColor : Colors.grey,
              onTap: () {
                Provider.of<TopButtonModel>(context, listen: false).number = i;
              },
            )
        ],
      ),
    );
  }
}
