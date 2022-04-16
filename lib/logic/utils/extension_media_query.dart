import 'package:flutter/cupertino.dart';

extension ExtensionMediaQuery on BuildContext {
  
  //Bunlar BuildContext'e enjekte edilirler. artık context.width(0.5) dediğimde Ekran boyutuna göre çarpıp double
  //değer döndürecek bende bunu Container veya başka yerlerde kullanacağım. Kullanırken bu sayfayı import etmek zorundayız
  //ExtensionMediaQuery deyip import ettikten sonra kullanabiliriz.
  //Bu bizi sürekli MediaQuery.of(context).size.width * 0.1 gibi işlemden kurtaracaktır.
  double width(value) => MediaQuery.of(this).size.width * value;
  double height(value) => MediaQuery.of(this).size.height * value;
}
