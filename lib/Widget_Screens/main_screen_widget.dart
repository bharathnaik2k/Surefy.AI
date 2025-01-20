import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:surefy/utils/colors/colors.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({super.key});

  @override
  State<MainScreenWidget> createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  final List _contacts = [];
  // bool _isLoading = false;
  Future<List> _fetchContacts() async {
    try {
      final PermissionStatus permissionStatus =
          await Permission.contacts.request();

      if (permissionStatus == PermissionStatus.granted) {
        final contacts =
            await FlutterContacts.getContacts(withProperties: true);
        setState(() {
          _contacts.clear();
          _contacts.addAll(contacts);
        });
        return _contacts;
      } else {
        _showPermissionDeniedDialog();
      }
    } on Exception catch (e) {
      _showErrorDialog('Error fetching contacts: $e');
    } finally {}
    return _contacts;
  }

  void _showPermissionDeniedDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Permission Required'),
        content: const Text(
          'Contacts permission is required to fetch contacts. '
          'Please enable it in settings.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              openAppSettings();
            },
            child: const Text('Open Settings'),
          ),
        ],
      ),
    );
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    _fetchContacts();
    super.initState();
  }

  int Index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset("assets/images/logo_label.png"),
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(right: 10, left: 10),
              child: Row(
                children: [
                  mainButton(
                    Index == 0 ? lightBlue : Colors.grey,
                    () {},
                    "Calls",
                    Index == 0 ? Colors.white : Colors.black,
                  ),
                  const SizedBox(width: 5),
                  mainButton(
                    Index == 1
                        ? lightBlue
                        : const Color.fromARGB(255, 211, 211, 211),
                    () {},
                    "Contacts",
                    Index == 1 ? Colors.white : Colors.black,
                  ),
                  const SizedBox(width: 5),
                  mainButton(
                    Index == 2
                        ? lightBlue
                        : const Color.fromARGB(255, 211, 211, 211),
                    () {},
                    "Messages",
                    Index == 2 ? Colors.white : Colors.black,
                  ),
                  const SizedBox(width: 5),
                  mainButton(
                    Index == 3
                        ? lightBlue
                        : const Color.fromARGB(255, 211, 211, 211),
                    () {},
                    "Favorites",
                    Index == 3 ? Colors.white : Colors.black,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _contacts.length,
              itemBuilder: (context, index) {
                Contact contact = _contacts.elementAt(index);
                return Text(contact.displayName);
              },
            ),
          ),
        ],
      ),
    );
  }

  TextButton mainButton(Color seletedColor, VoidCallback onPressed,
      String buttonText, Color textNiconColor) {
    return TextButton(
      style: ButtonStyle(
        shadowColor: const MaterialStatePropertyAll(Colors.black),
        elevation: const MaterialStatePropertyAll(3),
        minimumSize: const MaterialStatePropertyAll(Size.zero),
        padding: const MaterialStatePropertyAll(
          EdgeInsets.only(right: 14, left: 18, top: 5, bottom: 5),
        ),
        backgroundColor: MaterialStatePropertyAll(
          seletedColor,
        ),
      ),
      onPressed: onPressed,
      child: Row(
        children: [
          Text(
            buttonText,
            style: TextStyle(color: textNiconColor),
          ),
          Icon(
            Icons.keyboard_arrow_down_outlined,
            color: textNiconColor,
          )
        ],
      ),
    );
  }
}
