import 'package:flutter/material.dart';

void main() {
  runApp(const ShopRoom());
}

class ShopRoom extends StatelessWidget {
  const ShopRoom({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Магазин одежды',
      theme: ThemeData(
          primarySwatch: Colors. purple,
        appBarTheme: AppBarTheme(
        color: Colors. purple,),
        scaffoldBackgroundColor: const Color(0xFFC989EF), // Светло-фиолетовый фон
      ),

      home: const FashionScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class FashionScreen extends StatelessWidget {
  const FashionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Магазин одежды ~Нити_Любви~'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Локальное изображение (баннер)
              Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey[200],
                ),
                child: Image.asset(
                  'lib/image/banner.jpg',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
                ),
              ),
              const SizedBox(height: 20),

              // Stateless карточки товаров
              const ProductCard(
                title: "Платье",
                description: "Платье женское белое вечернее миди",
                price: "₽2 198",
                imageUrl: "https://i.pinimg.com/736x/10/d3/72/10d372d589674a457038ce903ebb6ab6.jpg",
              ),
              const ProductCard(
                title: "Комплект",
                description: "Блуза с джинсами ",
                price: "₽4 677",
                imageUrl: "https://i.pinimg.com/736x/36/78/41/367841906907700547afebbeca8a3886.jpg",
              ),
              const ProductCard(
                title: "Комплект",
                description: "Летний костюм ",
                price: "₽3 200",
                imageUrl: "https://i.pinimg.com/736x/b6/09/cd/b609cda6ccc4afb19ea02dba423b3c8f.jpg",
              ),

              // Stateful карточка с счетчиком
              CounterProductCard(
                title: "Комплект",
                description: "Твидовый жакет с юбкой",
                price: "₽9 100",
                imageUrl: "https://i.pinimg.com/736x/99/22/00/992200bfbcd130fd459813cf5b071a81.jpg",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// StatelessWidget - карточка товара
class ProductCard extends StatelessWidget {
  final String title;
  final String description;
  final String price;
  final String imageUrl;

  const ProductCard({
    super.key,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Изображение из интернета
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
            child: Image.network(
              imageUrl,
              width: 120,
              height: 120,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                width: 120,
                height: 120,
                color: Colors.grey[300],
                child: const Icon(Icons.broken_image),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    price,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
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

// StatefulWidget - карточка с счетчиком
class CounterProductCard extends StatefulWidget {
  final String title;
  final String description;
  final String price;
  final String imageUrl;

  const CounterProductCard({
    super.key,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  @override
  State<CounterProductCard> createState() => _CounterProductCardState();
}

class _CounterProductCardState extends State<CounterProductCard> {
  int count = 1;

  void increment() => setState(() => count++);
  void decrement() => setState(() => count > 1 ? count-- : null);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Изображение товара
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
            child: Image.network(
              widget.imageUrl,
              width: 120,
              height: 120,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                width: 120,
                height: 120,
                color: Colors.grey[300],
                child: const Icon(Icons.broken_image),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.price,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple,
                        ),
                      ),
                      // Кнопки +/-
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove),
                              onPressed: decrement,
                              iconSize: 18,
                            ),
                            Text('$count'),
                            IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: increment,
                              iconSize: 18,
                            ),
                          ],
                        ),
                      ),
                    ],
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
