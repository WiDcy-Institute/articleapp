import 'package:articleapp/article.dart';
import 'package:articleapp/article_service.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Article API Demo"),
      ),
      body: FutureBuilder(
        future: ArticleService().readData(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.done){
              if(snapshot.hasData){
                  List<Article> articles = snapshot.data as List<Article>;
                return ListView.builder(
                  itemCount: articles.length,
                  itemBuilder: (context, index) {
                    Article article = articles[index];
                      return Card(
                          child: ListTile(
                            title: Text("${article.title}"),
                            subtitle: Text("${article.body}"),
                            trailing: Icon(Icons.navigate_next),
                          ),
                      );
                  },);
              }else{
                return Center(
                  child: Text("No Data"),
                );
              }
          }else{
              return Center(
                child: CircularProgressIndicator(),
              );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), 
    );
  }
}
