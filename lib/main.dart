import 'package:flutter/material.dart';
import 'screens/dashboard_screen.dart';
import 'screens/listagem_screen.dart';
import 'screens/formulario_screen.dart';
import 'models/livro.dart';
import 'models/categoria.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Biblioteca Digital',
      theme: ThemeData(
        primaryColor: Color(0xFFAD8C74), // Marrom claro
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.brown,
          accentColor: Color(0xFFB29F8E), // Marrom mais claro
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFFAD8C74), // Marrom claro
          titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        drawerTheme: DrawerThemeData(
          backgroundColor: Color(0xFFB29F8E), // Marrom mais claro
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Color(0xFFB29F8E), // Marrom mais claro
          selectedItemColor: Color(0xFFAD8C74), // Marrom claro
          unselectedItemColor: Color(0xFFE5DFDA), // Bege claro
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Color(0xFFAD8C74)), // Marrom claro
          bodyMedium: TextStyle(color: Color(0xFFE5DFDA)), // Bege claro
        ),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // Atualizando a lista de livros com novas categorias
  final List<Livro> _livros = [
    // Livros de Romance
    Livro(
      titulo: 'A Culpa é das Estrelas',
      autor: 'John Green',
      descricao: 'Descrição do Livro',
      preco: 29.99,
      categoria: Categoria(nome: 'Romance'),
      imagemUrl: 'https://m.media-amazon.com/images/I/517OqD31evL.jpg',
    ),
    Livro(
      titulo: 'Um Dia',
      autor: 'David Nicholls',
      descricao: 'Descrição do Livro',
      preco: 24.90,
      categoria: Categoria(nome: 'Romance'),
      imagemUrl: 'https://m.media-amazon.com/images/I/71q5kg2L29L._SL1500_.jpg',
    ),
    Livro(
      titulo: 'É Assim que Acaba',
      autor: 'Colleen Hoover',
      descricao: 'Descrição do Livro',
      preco: 29.00,
      categoria: Categoria(nome: 'Romance'),
      imagemUrl: 'https://m.media-amazon.com/images/I/91r5G8RxqfL._SL1500_.jpg',
    ),
    Livro(
      titulo: 'Teto para Dois',
      autor: 'Beth O\'Leary',
      descricao: 'Descrição do Livro',
      preco: 44.00,
      categoria: Categoria(nome: 'Romance'),
      imagemUrl: 'https://m.media-amazon.com/images/I/61Q8bQdhklL._SL1434_.jpg',
    ),
    Livro(
      titulo: 'Os Sete Maridos de Evelyn Hugo',
      autor: 'Taylor Jenkins Reid',
      descricao: 'Descrição do Livro',
      preco: 45.00,
      categoria: Categoria(nome: 'Romance'),
      imagemUrl: 'https://m.media-amazon.com/images/I/91yEPgRcELL._SL1500_.jpg',
    ),
    Livro(
      titulo: 'A cinco passos de você',
      autor: 'Rachael Lippincott',
      descricao: 'Descrição do Livro',
      preco: 50.00,
      categoria: Categoria(nome: 'Romance'),
      imagemUrl: 'https://m.media-amazon.com/images/I/81Hv3wRgZpL._SL1500_.jpg',
    ),
    Livro(
      titulo: 'Água para elefantes',
      autor: 'Sara Gruen',
      descricao: 'Descrição do Livro',
      preco: 65.70,
      categoria: Categoria(nome: 'Romance'),
      imagemUrl: 'https://m.media-amazon.com/images/I/91eSOZIrPlL._SL1500_.jpg',
    ),
    Livro(
      titulo: 'Vermelho, Branco e Sangue Azul',
      autor: 'Casey McQuiston',
      descricao: 'Descrição do Livro',
      preco: 39.99,
      categoria: Categoria(nome: 'Romance'),
      imagemUrl: 'https://m.media-amazon.com/images/I/71SYepTUsDL._SL1500_.jpg',
    ),
    Livro(
      titulo: 'Por lugares incríveis',
      autor: 'Jennifer Niven',
      descricao: 'Descrição do Livro',
      preco: 65.00,
      categoria: Categoria(nome: 'Romance'),
      imagemUrl: 'https://m.media-amazon.com/images/I/918Maoi6OML._SL1500_.jpg',
    ),
    // Livros de Suspense
    Livro(
      titulo: 'O Silêncio dos Inocentes',
      autor: 'Thomas Harris',
      descricao: 'Descrição do Livro',
      preco: 32.00,
      categoria: Categoria(nome: 'Suspense'),
      imagemUrl: 'https://m.media-amazon.com/images/I/91ETm9i7AAL._SL1500_.jpg',
    ),
    // Livros de Terror
    Livro(
      titulo: 'It: A Coisa',
      autor: 'Stephen King',
      descricao: 'Descrição do Livro',
      preco: 45.00,
      categoria: Categoria(nome: 'Terror'),
      imagemUrl: 'https://m.media-amazon.com/images/I/91g9Dvtf+jL._SL1500_.jpg',
    ),
    // Livros de Ficção e Fantasia
    Livro(
      titulo: 'O Hobbit',
      autor: 'J.R.R. Tolkien',
      descricao: 'Descrição do Livro',
      preco: 39.90,
      categoria: Categoria(nome: 'Fantasia'),
      imagemUrl: 'https://m.media-amazon.com/images/I/91M9xPIf10L._SL1500_.jpg',
    ),
    // Livros de Autoajuda
    Livro(
      titulo: 'O Poder do Hábito',
      autor: 'Charles Duhigg',
      descricao: 'Descrição do Livro',
      preco: 29.90,
      categoria: Categoria(nome: 'Autoajuda'),
      imagemUrl: 'https://m.media-amazon.com/images/I/815iPX0SgkL._SL1500_.jpg',
    ),
    // Livros de Religião
    Livro(
      titulo: 'A Bíblia Sagrada',
      autor: 'Diversos Autores',
      descricao: 'Descrição do Livro',
      preco: 89.90,
      categoria: Categoria(nome: 'Religião'),
      imagemUrl: 'https://m.media-amazon.com/images/I/71PhRNn5teL._SL1100_.jpg',
    ),
    // Livros de Educação
    Livro(
      titulo: 'Pedagogia do oprimido',
      autor: 'Paulo Freire',
      descricao: 'Descrição do Livro',
      preco: 35.00,
      categoria: Categoria(nome: 'Educação'),
      imagemUrl: 'https://m.media-amazon.com/images/I/811oKbyTXNL._SL1500_.jpg',
    ),
  ];

  // Função para contar quantos livros existem em uma categoria específica
  int getTotalLivrosPorCategoria(String categoriaNome) {
    return _livros.where((livro) => livro.categoria.nome == categoriaNome).length;
  }

  final List<Widget> _pages = []; // A lista será inicializada no initState()

  @override
  void initState() {
    super.initState();
    // Inicializando as páginas com a lista de livros apenas na ListagemScreen
   _pages.addAll([
  DashboardScreen(livros: _livros),  // Passa a lista de livros para o DashboardScreen
  ListagemScreen(livros: _livros),  // Passando a lista de livros para a Listagem
  FormularioScreen(),
]);



  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Biblioteca Digital'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              decoration: BoxDecoration(
                color: Color(0xFFAD8C74), // Marrom claro
              ),
            ),
            ListTile(
              title: Text('Dashboard'),
              onTap: () {
                _onItemTapped(0);
                Navigator.pop(context); // Fecha o drawer
              },
            ),
            ListTile(
              title: Text('Listagem de Livros'),
              onTap: () {
                _onItemTapped(1);
                Navigator.pop(context); // Fecha o drawer
              },
            ),
            ListTile(
              title: Text('Adicionar Livro'),
              onTap: () {
                _onItemTapped(2);
                Navigator.pop(context); // Fecha o drawer
              },
            ),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Listagem',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Adicionar',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}