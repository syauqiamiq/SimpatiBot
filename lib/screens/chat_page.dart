import 'package:flutter_dialogflow_v2/flutter_dialogflow_v2.dart' as df;
import 'package:flutter/material.dart';
import 'package:simpati_bot/utils/colorPallete.dart';

class ChatPage extends StatefulWidget {
  ChatPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final List<ChatMessage> messages = <ChatMessage>[];
  final TextEditingController textController = TextEditingController();
  String message = '';
  Widget _buildTextComposer() {
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).accentColor),
      child: Container(
        margin: EdgeInsets.fromLTRB(10, 0, 10, 15),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: textController,
                autocorrect: false,
                onSubmitted: (message.isEmpty) ? null : _handleSubmitted,
                style: TextStyle(color: Colors.white, fontSize: 14),
                decoration: InputDecoration(
                  fillColor: Colors.grey,
                  filled: true,
                  hintText: 'Masukkan Pesanmu',
                  hintStyle: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.w200,
                      fontSize: 14),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.circular(25),
                      gapPadding: 0),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(color: Colors.transparent)),
                ),
                onChanged: (value) {
                  setState(() {
                    message = value;
                  });
                },
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                  icon: Icon(
                    Icons.send,
                    color: Colors.grey,
                  ),
                  onPressed: () => message.trim().isNotEmpty
                      ? _handleSubmitted(textController.text)
                      : null),
            ),
          ],
        ),
      ),
    );
  }

  void response(query) async {
    textController.clear();
    df.AuthGoogle authGoogle = await df.AuthGoogle(
            fileJson: 'lib/services/credentials/simpati-eask.json')
        .build();
    df.Dialogflow dialogflow =
        df.Dialogflow(authGoogle: authGoogle, sessionId: '123456');
    df.DetectIntentResponse response =
        await dialogflow.detectIntentFromText(query, "id");
    ChatMessage message = ChatMessage(
      text: response.queryResult.fulfillmentText,
      name: 'SIMPATI Bot',
      type: false,
    );
    setState(() {
      messages.insert(0, message);
    });
  }

  void _handleSubmitted(String text) {
    textController.clear();
    ChatMessage message = ChatMessage(
      text: text,
      name: 'Muhammad Prayuda Riansyah',
      type: true,
    );
    setState(() {
      messages.insert(0, message);
    });
    response(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Pallete.primaryColor,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 20,
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
                padding: EdgeInsets.all(0),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Image(
              image: AssetImage('lib/assets/images/logo.png'),
              width: 50,
              height: 50,
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'SIMPATI BOT',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Nunito',
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  'Always Active',
                  style: TextStyle(
                      color: Colors.white, fontFamily: 'Nunito', fontSize: 14),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Column(children: <Widget>[
          Flexible(
              child: ListView.builder(
            padding: EdgeInsets.all(8.0),
            reverse: true,
            itemBuilder: (_, int index) => messages[index],
            itemCount: messages.length,
          )),
          Divider(height: 1.0),
          Container(
            child: _buildTextComposer(),
          ),
        ]),
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  ChatMessage({this.text, this.name, this.type});

  final String text;
  final String name;
  final bool type;

  List<Widget> otherMessage(context) {
    return <Widget>[
      Container(
        margin: const EdgeInsets.only(right: 16.0),
        child: CircleAvatar(
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.grey,
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: AssetImage('lib/assets/images/logo.png'),
                  fit: BoxFit.fill),
            ),
          ),
        ),
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(this.name,
                style: TextStyle(
                    color: Colors.grey[600],
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w600,
                    fontSize: 15)),
            Container(
              margin: const EdgeInsets.only(top: 5.0),
              padding: EdgeInsets.all(10),
              constraints: BoxConstraints(maxWidth: 180),
              decoration: BoxDecoration(
                  color: Colors.grey[600],
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(10))),
              child: Text(text, style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    ];
  }

  List<Widget> myMessage(context) {
    return <Widget>[
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(this.name,
                style: TextStyle(
                    color: Colors.grey[600],
                    fontFamily: 'Nunito',
                    fontSize: 15,
                    fontWeight: FontWeight.w600)),
            Container(
              margin: const EdgeInsets.only(top: 5.0),
              padding: EdgeInsets.all(10),
              constraints: BoxConstraints(maxWidth: 180),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(15)),
                  color: Colors.grey[600]),
              child: Text(text, style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
      Container(
        margin: const EdgeInsets.only(left: 16.0),
        child: CircleAvatar(
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: AssetImage('lib/assets/images/yuda.jpg'),
                  fit: BoxFit.fill),
            ),
          ),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: this.type ? myMessage(context) : otherMessage(context),
      ),
    );
  }
}
