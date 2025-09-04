import 'package:arquitetura_mvc/controllers/todo_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TodoView extends ConsumerStatefulWidget {
  const TodoView({Key? key}) : super(key: key);

  @override
  ConsumerState<TodoView> createState() => _TodoViewState();
}

class _TodoViewState extends ConsumerState<TodoView> {
  int todoId = 1;

  @override
  Widget build(BuildContext context) {
    final todoAsync = ref.watch(todoProvider(todoId));
    return Scaffold(
      appBar: AppBar(title: const Text('Consulta API - TODO')),
      body: Center(
        child: todoAsync.when(
          data: (todo) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('ID: ${todo.id}', style: const TextStyle(fontSize: 20)),
              Text('Título: ${todo.title}', style: const TextStyle(fontSize: 20)),
              Text('Concluído: ${todo.completed ? "Sim" : "Não"}', style: const TextStyle(fontSize: 20)),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (todoId > 1) todoId--;
                      });
                    },
                    child: const Text('Anterior'),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        todoId++;
                      });
                    },
                    child: const Text('Próximo'),
                  ),
                ],
              ),
            ],
          ),
          loading: () => const CircularProgressIndicator(),
          error: (err, stack) => Text('Erro: ${err.toString()}'),
        ),
      ),
    );
  }
}
