import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

import '../widgets/text_widget.dart';

class SecondTab extends StatelessWidget {
  const SecondTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 50),
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: 5,
            itemBuilder: ((context, index) {
              return InkWell(
                splashColor: Colors.grey,
                onTap: () {},
                child: Ink(
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      //border: Border.all(color: appBarColor, width: 2),
                    ),
                    height: 150,
                    width: 200,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset('assets/images/fblogo.png', height: 80),
                            const TextBold(
                                text: 'Facebook',
                                color: Colors.black,
                                fontSize: 16),
                          ],
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              'Looking for',
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontFamily: 'QReg',
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(
                              width: 120,
                              child: Text(
                                'Computer Engineer',
                                style: TextStyle(
                                  fontFamily: 'QBold',
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Expanded(
                              child: SizedBox(
                                height: 5,
                              ),
                            ),
                            TextRegular(
                                text: '"Tap for more details"',
                                color: Colors.grey,
                                fontSize: 10),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
        searchBarJob(),
      ],
    );
  }
}

Widget searchBarJob() {
  return FloatingSearchBar(
    hint: 'Search Job',
    openAxisAlignment: 0.0,
    axisAlignment: 0.0,
    scrollPadding: const EdgeInsets.only(top: 16, bottom: 20),
    elevation: 4.0,
    physics: const BouncingScrollPhysics(),
    onQueryChanged: (query) {
      //Your methods will be here
    },
    automaticallyImplyDrawerHamburger: false,
    transitionCurve: Curves.easeInOut,
    transitionDuration: const Duration(milliseconds: 500),
    transition: CircularFloatingSearchBarTransition(),
    debounceDelay: const Duration(milliseconds: 500),
    actions: [
      FloatingSearchBarAction(
        showIfOpened: false,
        child: CircularButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            print('Places Pressed');
          },
        ),
      ),
      FloatingSearchBarAction.searchToClear(
        showIfClosed: false,
      ),
    ],
    builder: (context, transition) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Material(
          color: Colors.white,
          child: Container(
            height: 200.0,
            color: Colors.white,
            child: ListView(
              children: const [
                ListTile(
                  title: Text('Home'),
                  subtitle: Text('more info here........'),
                ),
                ListTile(
                  title: Text('Home'),
                  subtitle: Text('more info here........'),
                ),
                ListTile(
                  title: Text('Home'),
                  subtitle: Text('more info here........'),
                ),
                ListTile(
                  title: Text('Home'),
                  subtitle: Text('more info here........'),
                ),
                ListTile(
                  title: Text('Home'),
                  subtitle: Text('more info here........'),
                ),
                ListTile(
                  title: Text('Home'),
                  subtitle: Text('more info here........'),
                ),
                ListTile(
                  title: Text('Home'),
                  subtitle: Text('more info here........'),
                ),
                ListTile(
                  title: Text('Home'),
                  subtitle: Text('more info here........'),
                ),
                ListTile(
                  title: Text('Home'),
                  subtitle: Text('more info here........'),
                ),
                ListTile(
                  title: Text('Home'),
                  subtitle: Text('more info here........'),
                ),
                ListTile(
                  title: Text('Home'),
                  subtitle: Text('more info here........'),
                ),
                ListTile(
                  title: Text('Home'),
                  subtitle: Text('more info here........'),
                ),
                ListTile(
                  title: Text('Home'),
                  subtitle: Text('more info here........'),
                ),
                ListTile(
                  title: Text('Home'),
                  subtitle: Text('more info here........'),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
