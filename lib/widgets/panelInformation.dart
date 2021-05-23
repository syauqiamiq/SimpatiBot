import 'package:flutter/material.dart';
import 'package:simpati_bot/utils/colorPallete.dart';

class PanelInformation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(children: <Widget>[
       
          DraggableScrollableSheet(
                initialChildSize: 0.7,
                maxChildSize: 0.95,
                minChildSize: 0.7,
                builder: (BuildContext context, myScrollController) {
                  return Container(
                    
                    height: 450,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          offset: Offset(0,-3),
                          blurRadius: 10
                        ),
                      ]
                    ),
                    margin: EdgeInsets.only(top: 40),
                    child: ClipRRect(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
                    child: Container(
                      color: Colors.white70,
                      padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
                      
                    ),
                  ),
                  );
                  

                }),
       
      ]
      ),
    );
    
  }
}