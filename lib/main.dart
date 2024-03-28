import 'package:flutter/material.dart';
import 'package:klemina_tebeleva/pages/Catalog.dart';
import 'package:klemina_tebeleva/pages/Comic.dart';
import 'signup.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      //home: SignUpApp(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class SignUpApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: LoginPage(),
      home: SignUpPage(),
    );
  }
}

class _LoginPageState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        painter: BackgroundSignIn(),
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 33),
              child:  Column(
                children: <Widget>[
                  _getHeader(),
                  _getInputs(),
                  _getSignIn(context),
                  _getBottomRow(context),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

_getHeader(){
  return Expanded(
    flex: 2,
    child: Container(
      alignment: Alignment.bottomLeft,
      child: Text(
        'Добро пожаловать!',
        style: TextStyle(color: Colors.white,
            fontStyle: FontStyle.italic,
            fontSize: 37
        ),
      ),
    ),
  );
}

_getInputs(){
  return Expanded(
    flex: 4,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextField(
          decoration: InputDecoration(labelText: 'Логин'),
        ),
        SizedBox(
          height: 15,
        ),
        TextField(
          decoration: InputDecoration(labelText: 'Пароль'),
        ),
        SizedBox(
          height: 15,
        ),
      ],
    ),
  );
}

_getSignIn(context){
  return Expanded(
    flex: 1,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget> [
        GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => ComicsCatalog()));
            }, //фигура как переход
            child: CircleAvatar(
              backgroundColor: Colors.red.shade800,
              radius: 30,
              child: Icon(Icons.arrow_forward_ios, color: Colors.white,),
            )
        )
      ],
    ),
  );
}

_getBottomRow(context) {
  return Expanded(
    flex: 2,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SignUpPage()));
          },
          child: Text('Регистрация', style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.underline),
          ),
        ),
        Text('Забыл пароль', style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            decoration: TextDecoration.underline),
        ),
      ],
    ),
  );
}

class BackgroundSignIn extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size){
    var sw = size.width;
    var sh = size.height;
    var paint = Paint();

    Path mainBackground = Path();
    mainBackground.addRect(Rect.fromLTRB(0,0, sw, sh));
    paint.color = Colors.grey.shade100;
    canvas.drawPath(mainBackground, paint);

    //фигура синяя
    Path blueWawe = Path();
    blueWawe.lineTo(sw,0);
    blueWawe.lineTo(sw,sh*0.5);
    blueWawe.quadraticBezierTo(sw*0.5,sh*0.45,sw* 0.2, 0);
    blueWawe.close();
    paint.color = Colors.blue.shade800;
    canvas.drawPath(blueWawe, paint);

    //фигура красная
    Path RedWawe = Path();
    RedWawe.lineTo(sw,0);
    RedWawe.lineTo(sw,sh*0.1);
    RedWawe.cubicTo(sw * 0.95, sh * 0.15, sw * 0.65, sh * 0.15, sw * 0.6 ,sh*0.38);
    RedWawe.cubicTo(sw * 0.52, sh * 0.52, sw * 0.05, sw * 0.45, 0 , sh * 0.4);
    RedWawe.close();
    paint.color = Colors.red.shade800;
    canvas.drawPath(RedWawe, paint);

  }



  @override
  bool shouldRepaint(CustomPainter oldDelegate){
    return oldDelegate != this;

  }

}

class ComicsCatalog extends StatelessWidget {
  final List<Comic> _comics = [
    Comic(
      title: 'Удивительный Человек-Паук #300. Первое появление Венома',
      description: 'Легендарный юбилейный выпуск! Когда-то Питер Паркер привез с другой планеты удивительный костюм-симбиот, способный принимать любые формы и наделяющий носителя невероятной силой. Но все плюсы перевесил один жирный минус: симбиот попытался слиться с Человеком-пауком и захватить его сознание! Герою с трудом удалось избавиться от инопланетного костюма и вернуться к своей обычной жизни. Но теперь пришельца ведёт ненависть и он нашёл того, кто желает смерти Питеру Паркеру почти так же сильно... Узрите, скоро родится Веном!',
      price: '300',
      images: ['https://ir.ozone.ru/s3/multimedia-f/wc1000/6397084731.jpg', 'https://ir.ozone.ru/s3/multimedia-0/wc1000/6643412928.jpg', 'https://ir.ozone.ru/s3/multimedia-k/wc1000/6643412984.jpg', 'https://ir.ozone.ru/s3/multimedia-l/wc1000/6643412985.jpg'],
    ),
    Comic(
      title: 'MARVEL: Что если?.. Росомаха стал королём вампиров',
      description: 'Парад безумия в классических выпусках «Что, если?» продолжается! На этот раз вам посчастливится попасть в альтернативную вселенную, где в битве Людей Икс с небезызвестным графом Дракулой Росомаха неволей стал преемником трона короля вампиров. Неуязвимый мутант-вампир — что может быть ужаснее?! Узнаете!',
      price: '300',
      images: ['https://ir.ozone.ru/s3/multimedia-5/wc1000/6272959277.jpg', 'https://ir.ozone.ru/s3/multimedia-x/wc1000/6643404861.jpg', 'https://ir.ozone.ru/s3/multimedia-5/wc1000/6643404941.jpg','https://ir.ozone.ru/s3/multimedia-x/wc1000/6643404897.jpg'],
    ),
    Comic(
      title: 'Встречайте: Скруллы!',
      description: 'Кому можно верить? Уорнеры — типичная семейка. Отец работает в Старк Энтерпрайзес. Мать — в аппарате сенатора. Девочки учатся в средней школе Стэмфорда. Однако есть в них кое-что уникальное: они... скруллы! Пришельцы-перевёртыши, которые внедрились в наше общество, чтобы проложить дорогу завоевателям! Ведомая долгом, Мэдисон Уорнер отправляется в одно из опаснейших мест: на пижамную вечеринку! Тем временем отец семейства Карл встречается с Железным Человеком. Обычный денёк семьи Уорнеров. Но что может разрушить семейные узы и раскрыть личности героев? Загадочный человек в шляпе принесёт им смерть... или избавление? И что же такое проект “Цветение”? Окунитесь в историю, о которой все будут говорить ещё долгие годы, и взгляните на скруллов по-новому!',
      price: '300',
      images: ['https://ir.ozone.ru/s3/multimedia-8/wc1000/6626044448.jpg'],
    ),
    Comic(
      title: 'Человек-Паук - Нападение Чёрной Кошки',
      description: 'Человек-Паук оказывается в центре войны банд в Нью-Йорке. Он противостоит таким противникам как Кувалда и Маджи, но неожиданное появление его прежней возлюбленной, Фелиции Харди, также известной как Чёрная Кошка, переворачивает мир с ног на голову! Какой же секрет скрывает Чёрная Кошка?',
      price: '300',
      images: ['https://img.drawnstories.ru/img/Marvel-Comics/Spider-Man/Limited-series/the-black-cat-strikes/the-black-cat-strikes-l.jpg'],
    ),
    Comic(
      title: 'Комикс Темная власть: Мисс Марвел',
      images: ['https://img.drawnstories.ru/img/Marvel-Comics/dark-reign/Miss-Marvel/Miss-Marvel-l.jpg'],
      description: 'Это эволюция мисс Марвел по мере того, как мантия переходит от одной героини к другой! Кэрол Дэнверс много лет сражалась в роли мисс Марвел, черпая вдохновение и имя у героя кри Мар-Велла, известного большей части Земли как Капитан Марвел. Но с приходом к власти бывшего суперзлодея Нормана Осборна, который взял под свой контроль "Мстителей", Дэнверс запрещено не только носить ее костюм, но даже использовать имя мисс Марвел.',
      price: '300',
    ),
  ];

  int _selectedComicIndex = 0;

  List<Map<String, String>> favoriteComics = [];
  List<Map<String, String>> cartComics = [];

  void addToFavorites(_comics, int index) {
    setState( {
      favoriteComics.add(_comics[index])
    });
  }

  void addToCart(_comics, int index) {
    setState( {
    cartComics.add(_comics[index])
    });
  }

  void navigateToFavorites(context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => FavoritesPage(favoriteComics: favoriteComics)));
  }

  void navigateToCart(context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage(cartComics: cartComics)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Каталог комиксов', style: TextStyle(color: Colors.black)),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _comics.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ComicPage(_comics[index])));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            _comics[index].images[0],
                            width: 100,
                            height: 120,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(_comics[index].title),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _comics.length,
              itemBuilder: (context, int index) {
                return ListTile(
                  title: Text(_comics[index].title),
                  leading: CircleAvatar(
                    backgroundColor: Colors.deepPurple,
                    child: ClipOval(
                      child: Image.network(
                        _comics[index].images[0],
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ComicPage(_comics[index])));
                  },
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _comics.length,
              itemBuilder: (context,int index) {
                return ListTile(
                  title: Text(_comics[index].title),
                  leading: Image.network(_comics[index].images[index]),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.favorite),
                        onPressed:() {
                          addToFavorites(index);
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.shopping_cart),
                        onPressed: () {
                          addToCart(index);
                        },
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ComicPage(_comics[index])));
                  },
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: navigateToFavorites,
            child: Text('Избранное'),
          ),
          ElevatedButton(
            onPressed: navigateToCart,
            child: Text('Корзина'),
          ),
        ],
      ),
    );
  }

  void setState(Set<void> set) {}
}

class FavoritesPage extends StatelessWidget {
  final List<Map<String, String>> favoriteComics;

  FavoritesPage({required this.favoriteComics});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Избранное'),
      ),
      body: ListView.builder(
        itemCount: favoriteComics.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(favoriteComics[index]['title']!),
            trailing: Icon(Icons.favorite),
          );
        },
      ),
    );
  }
}

class CartPage extends StatelessWidget {
  final List<Map<String, String>> cartComics;

  CartPage({required this.cartComics});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Корзина'),
      ),
      body: ListView.builder(
        itemCount: cartComics.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(cartComics[index]['title']!),
            trailing: Icon(Icons.shopping_cart),
          );
        },
      ),
    );
  }
}
