import 'package:flutter/material.dart';
import '../models/livro.dart';

class ListagemScreen extends StatefulWidget {
  final List<Livro> livros;

  ListagemScreen({required this.livros});

  @override
  _ListagemScreenState createState() => _ListagemScreenState();
}

class _ListagemScreenState extends State<ListagemScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listagem de Livros'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Volta para a tela anterior
          },
        ),
      ),
      body: widget.livros.isEmpty
          ? Center(child: Text('Nenhum livro encontrado'))
          : ListView.builder(
              itemCount: widget.livros.length,
              itemBuilder: (context, index) {
                final livro = widget.livros[index];
                return Card(
                  child: ListTile(
                    leading: Image.network(livro.imagemUrl, width: 50, fit: BoxFit.cover),
                    title: Text(livro.titulo),
                    subtitle: Text('${livro.autor} - ${livro.preco.toStringAsFixed(2)}'),
                  ),
                );
              },
            ),
    );
  }
}