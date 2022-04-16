part of 'extension_translate_body.dart';

class TranslateBody extends StatelessWidget {
  const TranslateBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Center(
        child: SingleChildScrollView(
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
