import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/');
          },
          icon: const Icon(
            color: Colors.black,
            Icons.arrow_back_ios_new,
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          //User Profile
          Padding(
              padding: const EdgeInsets.fromLTRB(25.0, 30.0, 8.0, 30.0),
              child: Column(children: <Widget>[
                const Center(
                  child: Icon(
                    Icons.circle,
                    size: 100.0,
                  ),
                ),
                Center(
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Name',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                )
              ])),
          //Community tab
          const Padding(
            padding: EdgeInsets.fromLTRB(25, 0.0, 0, 8.0),
            child: Text(
              'Join our community',
              style: TextStyle(fontSize: 25.0),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 20.0),
            child: Divider(),
          ),
          //Discord
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(
              Icons.discord,
              size: 30.0,
              color: Colors.grey,
            ),
            label: const Text('Discord',
                style: TextStyle(color: Colors.grey, fontSize: 18.0)),
            style: ButtonStyle(
              alignment: Alignment.centerLeft,
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  const EdgeInsets.only(left: 12.0, top: 8.0)),
            ),
          ),
          const SizedBox(height: 20.0),
          //Reddit
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.reddit, size: 30.0, color: Colors.grey),
            label: const Text('Reddit',
                style: TextStyle(color: Colors.grey, fontSize: 18.0)),
            style: ButtonStyle(
              alignment: Alignment.centerLeft,
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  const EdgeInsets.only(left: 12.0, top: 8.0)),
            ),
          ),
          const SizedBox(height: 20.0),
          //Instagram
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(FontAwesomeIcons.instagram,
                size: 30.0, color: Colors.grey),
            label: const Text('Instagram',
                style: TextStyle(color: Colors.grey, fontSize: 18.0)),
            style: ButtonStyle(
              alignment: Alignment.centerLeft,
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  const EdgeInsets.only(left: 12.0, top: 8.0)),
            ),
          ),

          //Rate & Share
          const Padding(
              padding: EdgeInsets.fromLTRB(25, 25, 0, 8.0),
              child: Text(
                'Spread happiness',
                style: TextStyle(fontSize: 25.0),
              )),
          const Padding(
            padding: EdgeInsets.only(bottom: 20.0),
            child: Divider(),
          ),
          //Share
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.share, size: 30.0, color: Colors.grey),
            label: const Text('Share the app',
                style: TextStyle(color: Colors.grey, fontSize: 18.0)),
            style: ButtonStyle(
              alignment: Alignment.centerLeft,
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  const EdgeInsets.only(left: 12.0, top: 8.0)),
            ),
          ),
          const SizedBox(height: 20.0),
          //Rate
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.rate_review_outlined,
                size: 30.0, color: Colors.grey),
            label: const Text('Rate the app',
                style: TextStyle(color: Colors.grey, fontSize: 18.0)),
            style: ButtonStyle(
              alignment: Alignment.centerLeft,
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  const EdgeInsets.only(left: 12.0, top: 8.0)),
            ),
          ),

          //Contact
          const Padding(
            padding: EdgeInsets.fromLTRB(25, 25, 0, 8.0),
            child: Text(
              'Contact us',
              style: TextStyle(fontSize: 25.0),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 20.0),
            child: Divider(),
          ),
          //Email
          Padding(
            padding: const EdgeInsets.only(bottom: 30.0),
            child: TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.mail, size: 30.0, color: Colors.grey),
              label: const Text('E-Mail',
                  style: TextStyle(color: Colors.grey, fontSize: 18.0)),
              style: ButtonStyle(
                alignment: Alignment.centerLeft,
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    const EdgeInsets.only(left: 12.0, top: 8.0)),
              ),
            ),
          ),
          const SizedBox(
            height: 50.0,
          )
        ],
      ),
    );
  }
}
