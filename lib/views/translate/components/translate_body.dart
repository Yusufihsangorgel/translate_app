part of 'extension_translate_body.dart';

class TranslateBody extends StatefulWidget {
  const TranslateBody({Key? key}) : super(key: key);

  @override
  State<TranslateBody> createState() => _TranslateBodyState();
}

class _TranslateBodyState extends State<TranslateBody> {
  var message = "";
  var country = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Center(
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _image(context),
              _translateField(context),
              _translateBilgi,
              _loginButton(context),
              // _register(context),
            ],
          ),
        ),
      ),
    );
  }
}
