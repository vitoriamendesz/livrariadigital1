import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'categoria.dart';

class Livro {
  final String titulo;
  final String autor;
  final String descricao;
  final double preco;
  final Categoria categoria;
  final String imagemUrl;

  Livro({
    required this.titulo,
    required this.autor,
    required this.descricao,
    required this.preco,
    required this.categoria,
    required this.imagemUrl,
  });

  // Converter Livro para JSON
  Map<String, dynamic> toJson() => {
    'titulo': titulo,
    'autor': autor,
    'descricao': descricao,
    'preco': preco,
    'categoria': categoria.nome,
    'imagemUrl': imagemUrl,
  };

  // Converter JSON para Livro
  factory Livro.fromJson(Map<String, dynamic> json) => Livro(
    titulo: json['titulo'],
    autor: json['autor'],
    descricao: json['descricao'],
    preco: json['preco'],
    categoria: Categoria(nome: json['categoria']),
    imagemUrl: json['imagemUrl'],
  );

  // Salvar o livro no armazenamento local
  static Future<void> saveLivro(Livro livro) async {
    final prefs = await SharedPreferences.getInstance();
    final livrosJson = prefs.getStringList('livros') ?? [];
    final livrosList = livrosJson.map((json) => Livro.fromJson(jsonDecode(json))).toList();
    livrosList.add(livro);
    final updatedLivrosJson = livrosList.map((livro) => jsonEncode(livro.toJson())).toList();
    await prefs.setStringList('livros', updatedLivrosJson);
  }

  // Carregar todos os livros do armazenamento local
  static Future<List<Livro>> loadLivros() async {
    final prefs = await SharedPreferences.getInstance();
    final livrosJson = prefs.getStringList('livros') ?? [];
    return livrosJson.map((json) => Livro.fromJson(jsonDecode(json))).toList();
  }
}
