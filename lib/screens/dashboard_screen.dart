
import 'package:flutter/material.dart';
import '../models/livro.dart';

class DashboardScreen extends StatelessWidget {
  final List<Livro> livros;

  DashboardScreen({required this.livros});

  @override
  Widget build(BuildContext context) {
    // Contar quantos livros há em cada categoria
    final romanceCount = livros.where((livro) => livro.categoria.nome == 'Romance').length;
    final suspenseCount = livros.where((livro) => livro.categoria.nome == 'Suspense').length;
    final terrorCount = livros.where((livro) => livro.categoria.nome == 'Terror').length;
    final ficcaoCount = livros.where((livro) => livro.categoria.nome == 'Ficção').length;
    final fantasiaCount = livros.where((livro) => livro.categoria.nome == 'Fantasia').length;
    final autoAjudaCount = livros.where((livro) => livro.categoria.nome == 'Autoajuda').length;
    final religiaoCount = livros.where((livro) => livro.categoria.nome == 'Religião').length;
    final educacaoCount = livros.where((livro) => livro.categoria.nome == 'Educação').length;

    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Resumo de Livros',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.brown[800],
              ),
            ),
            SizedBox(height: 16),
            _buildCategoryCard(context, 'Romance', romanceCount, Icons.book),
            _buildCategoryCard(context, 'Suspense', suspenseCount, Icons.local_library),
            _buildCategoryCard(context, 'Terror', terrorCount, Icons.dark_mode),
            _buildCategoryCard(context, 'Ficção', ficcaoCount, Icons.theaters),
            _buildCategoryCard(context, 'Fantasia', fantasiaCount, Icons.star),
            _buildCategoryCard(context, 'Autoajuda', autoAjudaCount, Icons.self_improvement),
            _buildCategoryCard(context, 'Religião', religiaoCount, Icons.church),
            _buildCategoryCard(context, 'Educação', educacaoCount, Icons.school),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryCard(BuildContext context, String category, int count, IconData icon) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Icon(icon, color: Colors.brown),
        title: Text(
          'Livros de $category',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text('Total de livros: $count'),
      ),
    );
  }
}