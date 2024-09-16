import 'package:flutter/material.dart';
import '../models/livro.dart';
import '../models/categoria.dart';
import 'listagem_screen.dart';

class FormularioScreen extends StatefulWidget {
  @override
  _FormularioScreenState createState() => _FormularioScreenState();
}

class _FormularioScreenState extends State<FormularioScreen> {
  final _formKey = GlobalKey<FormState>();
  String _titulo = '';
  String _autor = '';
  String _descricao = '';
  double _preco = 0.0;
  String _categoria = '';
  String _imagemUrl = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Adicionar Livro')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Título'),
                onSaved: (value) => _titulo = value!,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o título.';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Autor'),
                onSaved: (value) => _autor = value!,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o autor.';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Descrição'),
                onSaved: (value) => _descricao = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Preço'),
                keyboardType: TextInputType.number,
                onSaved: (value) => _preco = double.tryParse(value!) ?? 0.0,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o preço.';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Categoria'),
                onSaved: (value) => _categoria = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'URL da Imagem'),
                onSaved: (value) => _imagemUrl = value!,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    final livro = Livro(
                      titulo: _titulo,
                      autor: _autor,
                      descricao: _descricao,
                      preco: _preco,
                      categoria: Categoria(nome: _categoria),
                      imagemUrl: _imagemUrl,
                    );
                    
                    // Salvar livro usando o método estático
                    await Livro.saveLivro(livro);
                    
                    // Carregar a lista de livros atualizada
                    final livros = await Livro.loadLivros();
                    
                    // Navegar para a ListagemScreen com a lista de livros
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ListagemScreen(livros: livros),
                      ),
                    );
                  }
                },
                child: Text('Salvar Livro'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}