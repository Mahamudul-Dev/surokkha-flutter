import 'package:flutter/material.dart';

class DetailsCard extends StatelessWidget {
  const DetailsCard(
      {super.key,
      required this.serial,
      required this.name,
      required this.certificate,
      required this.nid,
      required this.passport,
      required this.date,
      required this.createdBy,
      required this.onDelete,
      required this.onDownload,
      required this.onPdfView});
  final String serial;
  final String name;
  final String certificate;
  final String nid;
  final String passport;
  final String date;
  final String createdBy;
  final Function() onDelete;
  final Function() onPdfView;
  final Function() onDownload;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: MediaQuery.of(context).size.width >= 900
            ? Material(
                elevation: 3.5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Flex(direction: Axis.horizontal, children: [
                    Expanded(
                      flex: 3,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 150,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text('Serial:'),
                                Text('Name:'),
                                Text('Certificate:'),
                                Text('NID:'),
                                Text('Passport:'),
                                Text('Creation Date:'),
                                Text('Created By:')
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(serial),
                              Text(name),
                              Text(certificate),
                              Text(nid),
                              Text(passport),
                              Text(date),
                              Text(createdBy)
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              ElevatedButton(
                                onPressed: onDelete,
                                style: const ButtonStyle(
                                    backgroundColor:
                                        MaterialStatePropertyAll(Colors.red)),
                                child: const Text('Delete'),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              ElevatedButton(
                                  onPressed: onPdfView,
                                  style: const ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(
                                          Colors.blue)),
                                  child: const Text('View')),
                              const SizedBox(width: 15),
                              ElevatedButton(
                                  onPressed: onDownload,
                                  style: const ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(
                                          Colors.green)),
                                  child: const Text('Download'))
                            ],
                          ),
                        ))
                  ]),
                ),
              )
            : Material(
                elevation: 3.5,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 150,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text('Serial:'),
                                Text('Name:'),
                                Text('Certificate:'),
                                Text('NID:'),
                                Text('Passport:'),
                                Text('Creation Date:'),
                                Text('Created By:')
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(serial),
                              Text(name),
                              Text(certificate),
                              Text(nid),
                              Text(passport),
                              Text(date),
                              Text(createdBy)
                            ],
                          ),
                        ],
                      ),

                      // buttons
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: onDelete,
                            style: const ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.red)),
                            child: const Text('Delete'),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          ElevatedButton(
                              onPressed: onPdfView,
                              style: const ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll(Colors.blue)),
                              child: const Text('View')),
                          const SizedBox(width: 15),
                          ElevatedButton(
                              onPressed: onDownload,
                              style: const ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll(Colors.green)),
                              child: const Text('Download'))
                        ],
                      ),
                    ],
                  ),
                ),
              ));
  }
}
