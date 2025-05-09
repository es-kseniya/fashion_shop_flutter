Image.asset(
'assets/images/banner.jpg',
errorBuilder: (context, error, stackTrace) {
return Text('Ошибка: $error');
},
)