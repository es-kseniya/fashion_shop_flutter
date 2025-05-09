Image.asset(
'assets/image/banner.jpg',
errorBuilder: (context, error, stackTrace) {
return Column(
children: [
const Icon(Icons.error, color: Colors.red, size: 50),
Text('Path: assets/image/banner.jpg'),
Text('Error: $error'),
],
);
},
)