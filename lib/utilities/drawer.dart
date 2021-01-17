import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:medifly/utilities/profile_Screen.dart';

class Drawerpop extends StatelessWidget {
  const Drawerpop({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, ProfileScreen.id);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 30, left: 15),
                          child: Container(
                            width: 150,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                'images/AdLogo.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 38.5,
                              ),
                              child: Text(
                                'Hello!',
                                style: kMainText.copyWith(
                                    color: Colors.white70, fontSize: 18.0),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Expanded(
                              child: Center(
                                child: Container(
                                  height: 20.0,
                                  width: 150.0,
                                  child: Text(
                                    'UserName from firebase',
                                    textAlign: TextAlign.center,
                                    softWrap: false,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                color: kPrimaryColorBlue,
              ),
            ),
            SizedBox(
              height: 6.0,
            ),
            Expanded(
              flex: 5,
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    DrawerTileButton(
                      drawerIcon: Icons.person,
                      title: 'Profile',
                      onPressed: () {
                        Navigator.pushNamed(context, ProfileScreen.id);
                      },
                    ),
                    // Divider(),
                    DrawerTileButton(
                      drawerIcon: Icons.feedback,
                      title: 'Feedback',
                    ),
                    // Divider(),
                    DrawerTileButton(
                      drawerIcon: Icons.info,
                      title: 'About',
                    ),
                    // Divider(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DrawerButton extends StatelessWidget {
  const DrawerButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Row(
            children: [
              Icon(
                Icons.person,
                color: kPrimaryColorBlue,
              ),
              SizedBox(
                width: 12.0,
              ),
              Text(
                'Profile',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerTileButton extends StatelessWidget {
  DrawerTileButton({this.drawerIcon, this.title, this.onPressed});
  final IconData drawerIcon;
  final String title;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      focusColor: kCardsColor,
      leading: Icon(
        drawerIcon,
        color: kPrimaryColorBlue,
      ),
      title: Text(title),
      onTap: onPressed,
    );
  }
}
