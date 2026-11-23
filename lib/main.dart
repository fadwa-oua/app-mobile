import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Color(0xFFF7A6B9),
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.black,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );
  runApp(const BurgerQueenApp());
}

const hotPink = Color(0xFFE91E63);
const topPink = Color(0xFFF7A6B9);
const pagePink = Color(0xFFFFF1F3);
const cardPink = Color(0xFFFFB9CA);
const brownText = Color(0xFF6B504B);

class BurgerQueenApp extends StatelessWidget {
  const BurgerQueenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Burger Queen',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: pagePink,
        colorScheme: ColorScheme.fromSeed(seedColor: hotPink),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pagePink,
      appBar: AppBar(
        toolbarHeight: 56,
        backgroundColor: topPink,
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.transparent,
        leadingWidth: 52,
        leading: const Icon(Icons.local_mall, color: Color(0xFF333333), size: 17),
        centerTitle: true,
        title: const Text(
          'Burger Queen',
          style: TextStyle(
            color: brownText,
            fontSize: 15,
            fontWeight: FontWeight.w900,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(Icons.account_circle, color: Color(0xFF555555), size: 20),
          ),
        ],
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RestaurantHeader(),
            PromoBlock(),
            BurgerBlock(),
            SideBlock(),
            DrinkBlock(),
            DessertBlock(),
          ],
        ),
      ),
    );
  }
}

class RestaurantHeader extends StatelessWidget {
  const RestaurantHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: topPink,
      padding: const EdgeInsets.fromLTRB(27, 8, 27, 16),
      child: Container(
        height: 78,
        padding: const EdgeInsets.fromLTRB(12, 10, 12, 11),
        decoration: BoxDecoration(
          color: Colors.white.withAlpha(238),
          borderRadius: BorderRadius.circular(5),
          boxShadow: const [
            BoxShadow(
              color: Color(0x16000000),
              blurRadius: 3,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          children: [
            const Row(
              children: [
                Icon(Icons.location_on, color: Color(0xFF2F2F2F), size: 18),
                SizedBox(width: 5),
                Expanded(
                  child: Text(
                    'Mon restaurant le plus proche',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Color(0xFF292929),
                      fontSize: 11,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                Text('4km', style: TextStyle(color: brownText, fontSize: 10)),
              ],
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              height: 31,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.touch_app, color: Colors.white, size: 15),
                label: const Text(
                  'Commander',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: hotPink,
                  elevation: 0,
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PromoBlock extends StatelessWidget {
  const PromoBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle('En ce moment'),
          const SizedBox(height: 8),
          Center(
            child: SizedBox(
              width: 292,
              height: 346,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.asset(
                      'assets/images/layer-burger.jpg',
                      width: 292,
                      height: 346,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 18,
                    alignment: Alignment.center,
                    color: topPink,
                    child: const Text(
                      'Venez personnaliser votre Burger',
                      style: TextStyle(
                        color: hotPink,
                        fontSize: 10,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BurgerBlock extends StatelessWidget {
  const BurgerBlock({super.key});

  static const burgers = [
    BurgerItem(
      image: 'assets/images/twins.jpg',
      title: 'Twins',
      text: 'Les burgers jumeaux qui font la paire',
    ),
    BurgerItem(
      image: 'assets/images/big-queen.jpg',
      title: 'Big Queen',
      text: 'Pour celles qui portent la couronne',
    ),
    BurgerItem(
      image: 'assets/images/egg-bacon-burger.jpg',
      title: 'Egg Bacon',
      text: 'Le burger des l\u00e8ves t\u00f4t',
    ),
    BurgerItem(
      image: 'assets/images/prince.jpg',
      title: 'Prince',
      text: 'Le pr\u00e9f\u00e9r\u00e9 des futurs rois',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 0, 9),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle('Chaud devant'),
          const SizedBox(height: 2),
          const Text(
            'Le meilleur de nos burgers \u00e0 port\u00e9e de clic',
            style: TextStyle(
              color: brownText,
              fontSize: 11,
              fontWeight: FontWeight.w600,
              height: 1,
            ),
          ),
          const SizedBox(height: 9),
          SizedBox(
            height: 182,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: burgers.length,
              separatorBuilder: (_, __) => const SizedBox(width: 18),
              itemBuilder: (context, index) => BurgerCard(item: burgers[index]),
            ),
          ),
        ],
      ),
    );
  }
}

class BurgerCard extends StatelessWidget {
  const BurgerCard({required this.item, super.key});

  final BurgerItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 158,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: cardPink,
        borderRadius: BorderRadius.circular(13),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(item.image, height: 111, fit: BoxFit.cover),
          const SizedBox(height: 4),
          Text(
            item.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: brownText,
              fontSize: 18,
              height: 1,
              fontWeight: FontWeight.w900,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 6, 8, 0),
            child: Text(
              item.text,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: brownText,
                fontSize: 10,
                fontStyle: FontStyle.italic,
                height: 1.15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SideBlock extends StatelessWidget {
  const SideBlock({super.key});

  static const sides = [
    LineItem(image: 'assets/images/fries.jpg', label: 'Frites classique'),
    LineItem(image: 'assets/images/patate-douce.jpg', label: 'Frites de patate douce'),
    LineItem(image: 'assets/images/poutine.jpg', label: 'Poutine'),
    LineItem(image: 'assets/images/potatoes.jpg', label: 'Potatoes'),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 0, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle('Les accompagnements'),
          const SizedBox(height: 6),
          ...sides.map((item) => SideRow(item: item)),
        ],
      ),
    );
  }
}

class SideRow extends StatelessWidget {
  const SideRow({required this.item, super.key});

  final LineItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 87,
      decoration: const BoxDecoration(
        color: Color(0xFFFFF7F8),
        border: Border(bottom: BorderSide(color: Color(0xFFE5CCD1), width: 1)),
      ),
      child: Row(
        children: [
          const SizedBox(width: 4),
          ClipOval(
            child: Image.asset(item.image, width: 70, height: 70, fit: BoxFit.cover),
          ),
          const SizedBox(width: 18),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 6),
              child: Text(
                item.label,
                textAlign: TextAlign.right,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: hotPink,
                  fontSize: 13,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DrinkBlock extends StatelessWidget {
  const DrinkBlock({super.key});

  static const drinks = [
    LineItem(image: 'assets/images/classic-cola.jpg', label: 'Le classique'),
    LineItem(image: 'assets/images/sparkling.jpg', label: 'Eau gazeuse'),
    LineItem(image: 'assets/images/orange-soda.jpg', label: "A l'orange"),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle('Une petite soif?'),
          const SizedBox(height: 6),
          Row(
            children: drinks
                .map(
                  (item) => Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: DrinkCard(item: item),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}

class DrinkCard extends StatelessWidget {
  const DrinkCard({required this.item, super.key});

  final LineItem item;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 199,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned.fill(child: Image.asset(item.image, fit: BoxFit.cover)),
          Container(
            width: double.infinity,
            height: 25,
            alignment: Alignment.center,
            color: topPink,
            child: Text(
              item.label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: hotPink,
                fontSize: 11,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DessertBlock extends StatelessWidget {
  const DessertBlock({super.key});

  static const desserts = [
    LineItem(image: 'assets/images/oreo-ice.jpg', label: 'Glace Oreo'),
    LineItem(image: 'assets/images/strawberry-waffle.jpg', label: 'Cr\u00eape fraise'),
    LineItem(image: 'assets/images/donut.jpg', label: 'Donut'),
    LineItem(image: 'assets/images/cupcake.jpg', label: 'Cupcake'),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle('La touche sucr\u00e9e pour finir en beaut\u00e9'),
          const SizedBox(height: 7),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: desserts.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 18,
              mainAxisSpacing: 16,
              childAspectRatio: 1.17,
            ),
            itemBuilder: (context, index) => DessertCard(item: desserts[index]),
          ),
        ],
      ),
    );
  }
}

class DessertCard extends StatelessWidget {
  const DessertCard({required this.item, super.key});

  final LineItem item;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned.fill(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(item.image, fit: BoxFit.cover),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(2),
          ),
          child: Text(
            item.label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: hotPink,
              fontSize: 12,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ],
    );
  }
}

class SectionTitle extends StatelessWidget {
  const SectionTitle(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: brownText,
        fontSize: 18,
        height: 1,
        fontWeight: FontWeight.w900,
      ),
    );
  }
}

class BurgerItem {
  const BurgerItem({
    required this.image,
    required this.title,
    required this.text,
  });

  final String image;
  final String title;
  final String text;
}

class LineItem {
  const LineItem({
    required this.image,
    required this.label,
  });

  final String image;
  final String label;
}
