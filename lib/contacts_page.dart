import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyAppForm extends StatelessWidget {
  const MyAppForm({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color(0xff6750A4),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xff6750A4),
          elevation: 10,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
      title: 'Contacts Page',
      home: const ContactsPage(),
    );
  }
}

class ContactsPage extends StatefulWidget {
  const ContactsPage({super.key});

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _numberPhoneController = TextEditingController();
  final List<Map<String, String>> _items = [
    {
      'name': 'Name 3',
      'numberPhone': '+62123456781',
    },
    {
      'name': 'Name 2',
      'numberPhone': ' +62123456782',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 81,
                      ),
                      SvgPicture.asset(
                        'assets/icons/mobile_friendly.svg',
                      ),
                      const SizedBox(
                        height: 17,
                      ),
                      const Text(
                        'Create New Contacts',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xff1C1B1F),
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Text(
                        '''A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made.''',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color(0xff49454F),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Divider(
                thickness: 1.0,
                color: Color(0xffCAC4D0),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color(0xffE7E0EC),
                          labelText: 'Name',
                          hintText: 'Insert Your Name'),
                      controller: _nameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Nama harus diisi';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _items.add({'Name': value!});
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color(0xffE7E0EC),
                          labelText: 'Nomor',
                          hintText: '+62 ....'),
                      controller: _numberPhoneController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Nomor harus diisi';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _items.add({'Nomor': value!});
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 21),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      backgroundColor: const Color(0xff6750A4),
                    ),
                    child: const Text(
                      'Submit',
                      style: TextStyle(fontSize: 14),
                    ),
                    onPressed: () {
                      String name = _nameController.text;
                      String numberPhone = _numberPhoneController.text;
                      Map<String, String> item = {
                        'name': name,
                        'numberPhone': numberPhone,
                      };
                      _items.add(item);
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 49,
            ),
            const Center(
              child: Text(
                'List Contacts',
                style: TextStyle(
                  color: Color(0xff1C1B1F),
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: Card(
                color: const Color(0xffFFFBFE),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(28),
                    topRight: Radius.circular(28),
                  ),
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemCount: _items.length,
                  itemBuilder: (BuildContext context, index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(16, 6, 28, 6),
                      child: ListTile(
                        leading: CircleAvatar(
                            backgroundColor: const Color(0xffEADDFF),
                            foregroundColor: Colors.black,
                            child: Text(
                              _items[index]['name']![0],
                            )),
                        title: Text(
                          _items[index]['name']!,
                          style: const TextStyle(
                            color: Color(0xff1C1B1F),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        subtitle: Text(
                          _items[index]['numberPhone']!,
                          style: const TextStyle(
                            color: Color(0xff49454F),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
