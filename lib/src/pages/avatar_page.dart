import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        title: Text('Avatar Page'),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://scontent-qro1-2.xx.fbcdn.net/v/t1.6435-9/224660143_1768313676680903_3436146392338794911_n.jpg?_nc_cat=105&ccb=1-5&_nc_sid=09cbfe&_nc_eui2=AeFYCEsoBsCvj7Us_WOiAugqJFYcNZ8xftUkVhw1nzF-1avsTbLM4pHjH4t0_B52kopoCy1Q6ZomOmRO3to-RRed&_nc_ohc=GuSLqxLtIVoAX-gwLn_&_nc_ht=scontent-qro1-2.xx&oh=c316a98601da5f9d9625f1d3430dd138&oe=619052FA'),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text('CJ'),
              backgroundColor: Colors.white,
            ),
          ),
        ],
      ),
      body: Center(
        child: FadeInImage(
          placeholder: AssetImage('assets/jar-loading.gif'),
          image: NetworkImage(
              'https://scontent-qro1-2.xx.fbcdn.net/v/t1.6435-9/245685659_419282902900705_1616916243331209765_n.jpg?_nc_cat=1&ccb=1-5&_nc_sid=730e14&_nc_eui2=AeHk0ezxFCDme_T3ZnOTc4V9gj5jjaRU9teCPmONpFT213kFkOJYJQt248pzn7UmgBhB5W5h0u8hO4DFBsYuv2g3&_nc_ohc=cair_Mn37ZUAX9JNpEe&_nc_ht=scontent-qro1-2.xx&oh=43d93bda32884cec3863d08b8cb69d0f&oe=618E9F77'),
          fadeInDuration: Duration(milliseconds: 200),
        ),
      ),
    );
  }
}
