import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class NavigationPage extends StatelessWidget {
  const NavigationPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _NotificationProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Notifications Page'),
          backgroundColor: Colors.pink,
        ),
        floatingActionButton: const FloatingButton(),
        bottomNavigationBar: const BottomNavigation(),
      ),
    );
  }
}

class FloatingButton extends StatelessWidget {
  const FloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        final provider =
            Provider.of<_NotificationProvider>(context, listen: false);
        provider.numero += 1;
        provider.bounceController.forward(from: 0.0);
      },
      backgroundColor: Colors.pink,
      child: const FaIcon(FontAwesomeIcons.play),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final number =
        Provider.of<_NotificationProvider>(context, listen: false).numero;
    return BottomNavigationBar(
      currentIndex: Provider.of<_NotificationProvider>(context, listen: false)
          .selectedPage,
      selectedItemColor: Colors.pink,
      onTap: (int value) {
        Provider.of<_NotificationProvider>(context, listen: false)
            .selectedPage = value;
      },
      items: [
        BottomNavigationBarItem(
          label: 'Bone',
          icon: Spin(
              animate:
                  // Provider.of<_NotificationProvider>(context, listen: false)
                  //         .selectedPage ==
                  //     0,
                  false,
              child: FaIcon(FontAwesomeIcons.bone)),
        ),
        BottomNavigationBarItem(
          label: 'Notifications',
          icon: Stack(
            children: [
              const FaIcon(FontAwesomeIcons.bell),
              Positioned(
                right: 0,
                top: 0,
                child: BounceInDown(
                  from: 15,
                  animate:
                      Provider.of<_NotificationProvider>(context, listen: false)
                              .numero !=
                          0,
                  child: Bounce(
                    controller: (controller) =>
                        Provider.of<_NotificationProvider>(context)
                            .bounceController = controller,
                    from: 10,
                    child: Container(
                        width: 12,
                        height: 12,
                        decoration: const BoxDecoration(
                            color: Colors.redAccent, shape: BoxShape.circle),
                        alignment: Alignment.center,
                        child: Text(
                          '$number',
                          style:
                              const TextStyle(color: Colors.white, fontSize: 7),
                        )),
                  ),
                ),
              ),
            ],
          ),
        ),
        BottomNavigationBarItem(
          label: 'My dog',
          icon: Swing(
              animate: false,
              // Provider.of<_NotificationProvider>(context).selectedPage == 2,
              child: FaIcon(FontAwesomeIcons.dog)),
        ),
      ],
    );
  }
}

class _NotificationProvider extends ChangeNotifier {
  int _numero = 0;

  int _selectedPage = 0;
  late AnimationController _bounceController;

  int get numero => _numero;

  set numero(int value) {
    _numero = value;
    notifyListeners();
  }

  int get selectedPage => _selectedPage;

  set selectedPage(int page) {
    if (page == 1) {
      numero = 0;
    }
    _selectedPage = page;
    notifyListeners();
  }

  AnimationController get bounceController => _bounceController;

  set bounceController(AnimationController controller) {
    _bounceController = controller;
  }
}
