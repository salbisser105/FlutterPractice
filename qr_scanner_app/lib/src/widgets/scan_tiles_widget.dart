import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner_app/src/providers/providers.dart';
import 'package:qr_scanner_app/src/utils/utils.dart';


class ScanTilesWidget extends StatelessWidget {
  
  final String type;

  // ignore: use_key_in_widget_constructors
  const ScanTilesWidget({  required this.type});


  @override
  Widget build(BuildContext context) {
    
    final scanListProvider = Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scans;

    return ListView.builder(
      itemCount: scans.length,
      itemBuilder: ( _, i ) => Dismissible(
        key: UniqueKey(),
        background: Container(
          color: Colors.red,
        ),
        onDismissed: (DismissDirection direction) {
          Provider.of<ScanListProvider>(context, listen: false)
              .deleteScanById(scans[i].id!);
        },
        child: ListTile(
          leading: Icon( 
            type == 'http'
              ? Icons.home_outlined
              : Icons.map_outlined, 
            color: Theme.of(context).primaryColor 
          ),
          title: Text( scans[i].value ),
          subtitle: Text( scans[i].id.toString() ),
          trailing: const Icon( Icons.keyboard_arrow_right, color: Colors.grey ),
          onTap: () => launchURL(context, scans[i]),
        ),
      )
    );


  }
}