import 'package:flutter/material.dart';

void main() {
	runApp(MyTodoApp());
}

class MyTodoApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return MaterialApp (
			title: 'My Todo App',
			theme: ThemeData(
				primarySwatch: Colors.blue,
			),
			home: TodoListPage(),
		);
	}
}

class TodoListPage extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
        title: Text('リスト一覧'),
      ),
			body: ListView(
				children: <Widget>[
					Card(
						child: ListTile(
							title: Text('にんじんを買う'),
						),
					),
					Card(
						child: ListTile(
							title: Text('たまねぎを買う'),
						),
					),
					Card(
						child: ListTile(
							title: Text('じゃがいもを買う'),
						),
					),
					Card(
						child: ListTile(
							title: Text('カレールーを買う'),
						),
					),
					Card(
						child: ListTile(
							title: Text('にんじんを買う'),
						),
					),
				],
			),
			floatingActionButton: FloatingActionButton(
				onPressed: () {
					Navigator.of(context).push(
						MaterialPageRoute(builder: (context) {
							return TodoAddPage();
						}),
					);
				},
				child: Icon(Icons.add),
			),
		);
	}
}

class TodoAddPage extends StatefulWidget {
	@override
	_TodoAddPageState createState() => _TodoAddPageState();
}

class _TodoAddPageState extends State<TodoAddPage> {
	String _text = '';

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text('リスト追加'),
			),
			body: Container(
				padding: EdgeInsets.all(64),
				child: Column(
					mainAxisAlignment: MainAxisAlignment.center,
					children: <Widget>[
						Text(_text, style: TextStyle(color: Colors.blue)),
						const SizedBox(height: 8),
						TextField(
							onChanged: (String value) {
								setState(() {
									_text = value;
								});
							},
						),
						const SizedBox(height: 8),
						Container(
							width: double.infinity,
							child: ElevatedButton(
                style: ElevatedButton.styleFrom(
									primary: Colors.blue,
								),
                onPressed: () {
									Navigator.of(context).pop(_text);
								},
                child: Text('リスト追加', style: TextStyle(color: Colors.white)),
              ),
            ),
						const SizedBox(height: 8),
						Container(
							width: double.infinity,
							child: TextButton(
								onPressed: () {
									Navigator.of(context).pop();
								},
								child: Text('キャンセル'),
							),
						),
					],
				),
			),
		);
	}
}