

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final wordPair = WordPair.random();
    // List<WordPair> _suggestions = <WordPair>[];
    // TextStyle _biggerFont = const TextStyle(fontSize: 18);
    return MaterialApp(
      title: 'Welcome to Flutter',
      theme: ThemeData(primaryColor: Colors.white),
      home: Scaffold(
        body: RandomWords(),
      ),
    );
  }
}

class RandomWords extends StatefulWidget {
  // RandomWords(this._suggestions, this._biggerFont);
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final List<WordPair> _suggestions = <WordPair>[];
  final TextStyle _biggerFont = const TextStyle(fontSize: 18);
  final Set<WordPair> _saved = Set<WordPair>();

  Widget _buildRow(
    WordPair pair,
  ) {
    final bool alreadySaved = _saved.contains(pair);
    print(alreadySaved);
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
        // textAlign: TextAlign.center,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if(alreadySaved) {
            _saved.remove(pair);
          }
          else {
            print(pair);
            _saved.add(pair);
          }
          
        });
      },
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(itemBuilder: (BuildContext _context, int i) {
      if (i.isOdd) {
        return Divider();
      }

      final int index = i ~/ 2;
      if (index >= _suggestions.length) {
        _suggestions.addAll(generateWordPairs().take(10));
      }
      return _buildRow(
        _suggestions[index],
      );
    });
  }

  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (BuildContext context) {
        final Iterable<ListTile> tiles = _saved.map((WordPair pair) {
          return ListTile(
            title: Text(pair.asPascalCase, style: _biggerFont,),
          );
        });
        final List<Widget> divided = ListTile.divideTiles(tiles: tiles, context: context).toList();
        return Scaffold(
          appBar: AppBar(
            title: Text("Saved Suggestion"),
          ),
          body: ListView(children: divided,),
        );
      })
    );
  }

  @override
  Widget build(BuildContext context) {
    // final wordPair = WordPair.random();
    // final List<WordPair> _suggestions = <WordPair>[];
    // final  TextStyle _biggerFont = const TextStyle(fontSize: 18);
    // return Text(
    //   wordPair.asPascalCase,
    // );
    return Scaffold(
      appBar: AppBar(
        title: Text("Startup Name Generator"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.list), onPressed: _pushSaved)
        ],
      ),
      body: _buildSuggestions(),
    );
  }
}
