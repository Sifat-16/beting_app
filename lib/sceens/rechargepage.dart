
import 'package:beting_app/Helper/fbase.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/mainadminmodel.dart';


class RechargeScreen extends StatefulWidget {
  const RechargeScreen({Key? key}) : super(key: key);

  @override
  State<RechargeScreen> createState() => _RechargeScreenState();
}

class _RechargeScreenState extends State<RechargeScreen> {
  FireBase fireBase = FireBase();
  TextEditingController amount = TextEditingController();
  TextEditingController transactionId = TextEditingController();
  final List<String> items = [
    '500',
    '1000',
    '1500',
    '2000',
  ];
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text("Recharge",
              style: GoogleFonts.oleoScript(color: Colors.white)),
          bottom: TabBar(tabs: [
            Tab(
              child: Text("Bkash",
                  style: GoogleFonts.oleoScript(color: Colors.white)),
            ),
            Tab(
              child: Text("Roket",
                  style: GoogleFonts.oleoScript(color: Colors.white)),
            ),
            Tab(
              child: Text("Nogod",
                  style: GoogleFonts.oleoScript(color: Colors.white)),
            ),
            Tab(
              child: Text("Binance",
                  style: GoogleFonts.oleoScript(color: Colors.white)),
            ),
          ]),
        ),
        body: TabBarView(children: [
          SizedBox(
            height: 200,
            child: Column(
              children: [
                StreamBuilder<MainAdminModel>(
                    stream: fireBase.mainadmindatas(),
                    builder: (context, snapshot) {
                      return snapshot.hasData
                          ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextButton(
                            onPressed: () {
                              Clipboard.setData(ClipboardData(
                                  text: snapshot.data!.bkashnumber))
                                  .then((value) {
                                final snackbar = SnackBar(
                                    content: Text(
                                        "Copied: ${snapshot.data!.bkashnumber}"));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackbar);
                              });
                            },
                            child: Text(
                                "Send Money to this number ${snapshot.data!.bkashnumber}")),
                      )
                          : const CircularProgressIndicator();
                    }),
                DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    hint: Text(
                      'Select Pakage',
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: items
                        .map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ))
                        .toList(),
                    value: selectedValue,
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value as String;
                        amount.text = selectedValue!;
                      });
                    },
                    buttonHeight: 40,
                    buttonWidth: 140,
                    itemHeight: 40,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: transactionId,
                    decoration: const InputDecoration(
                        hintText: "input your transactionId",
                        border: OutlineInputBorder()),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      fireBase
                          .rechargeTobalance(
                          amount.text.trim(), transactionId.text.trim())
                          .then((value) {
                        print(value);
                      });
                    },
                    child: const Text("Send request"))
              ],
            ),
          ),
          SizedBox(
            height: 200,
            child: Column(
              children: [
                StreamBuilder<MainAdminModel>(
                    stream: fireBase.mainadmindatas(),
                    builder: (context, snapshot) {
                      return snapshot.hasData
                          ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextButton(
                            onPressed: () {
                              Clipboard.setData(ClipboardData(
                                  text: snapshot.data!.bkashnumber))
                                  .then((value) {
                                final snackbar = SnackBar(
                                    content: Text(
                                        "Copied: ${snapshot.data!.bkashnumber}"));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackbar);
                              });
                            },
                            child: Text(
                                "Send Money to this number ${snapshot.data!.bkashnumber}")),
                      )
                          : const CircularProgressIndicator();
                    }),
                DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    hint: Text(
                      'Select Item',
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: items
                        .map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ))
                        .toList(),
                    value: selectedValue,
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value as String;
                      });
                    },
                    buttonHeight: 40,
                    buttonWidth: 140,
                    itemHeight: 40,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: transactionId,
                    decoration: const InputDecoration(
                        hintText: "input your transactionId",
                        border: OutlineInputBorder()),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      fireBase
                          .rechargeTobalance(
                          selectedValue == items[0]
                              ? "6"
                              : selectedValue == items[1]
                              ? "10"
                              : selectedValue == items[2]
                              ? "25"
                              : "40",
                          transactionId.text.trim())
                          .then((value) {
                        print(value);
                      });
                    },
                    child: const Text("Send request"))
              ],
            ),
          ),
          SizedBox(
            height: 200,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                      onPressed: () {
                        Clipboard.setData(const ClipboardData(
                            text: "03898928292"))
                            .then((value) {
                          final snackbar =   SnackBar(
                              content: Text(
                                  "Copied:ehfiohefoewhfio"));
                          ScaffoldMessenger.of(context)
                              .showSnackBar(snackbar);
                        });
                      },
                      child: const Text(
                          "Send Money to this number 9389282829}")),
                ),

                DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    hint: Text(
                      'Select Item',
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: items
                        .map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ))
                        .toList(),
                    value: selectedValue,
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value as String;
                      });
                    },
                    buttonHeight: 40,
                    buttonWidth: 140,
                    itemHeight: 40,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: transactionId,
                    decoration: const InputDecoration(
                        hintText: "input your transactionId",
                        border: OutlineInputBorder()),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {

                    },
                    child: const Text("Send request"))
              ],
            ),
          ),
          SizedBox(
            height: 200,
            child: Column(
              children: [
                StreamBuilder<MainAdminModel>(
                    stream: fireBase.mainadmindatas(),
                    builder: (context, snapshot) {
                      return snapshot.hasData
                          ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextButton(
                            onPressed: () {
                              Clipboard.setData(ClipboardData(
                                  text: snapshot.data!.binaryaccount))
                                  .then((value) {
                                final snackbar = SnackBar(
                                    content: Text(
                                        "Copied: ${snapshot.data!.binaryaccount}"));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackbar);
                              });
                            },
                            child: Text(
                                " Binance accpont:${snapshot.data!.binaryaccount}")),
                      )
                          : const CircularProgressIndicator();
                    }),
                DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    hint: Text(
                      'Select Item',
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: items
                        .map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ))
                        .toList(),
                    value: selectedValue,
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value as String;
                      });
                    },
                    buttonHeight: 40,
                    buttonWidth: 140,
                    itemHeight: 40,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: transactionId,
                    decoration: const InputDecoration(
                        hintText: "input your transactionId",
                        border: OutlineInputBorder()),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {

                    },
                    child: const Text("Send request"))
              ],
            ),
          )
        ]),
      ),
    );
  }
}