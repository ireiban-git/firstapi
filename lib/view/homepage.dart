import 'package:firstapi/service/horarioservice.dart';
import 'package:firstapi/service/usuarioservice.dart';
import 'package:flutter/material.dart';
import 'package:firstapi/model/usuario.dart';
import 'package:firstapi/model/horariogx.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String customTitle = 'API Try';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Usuario>? lista;
  List<Hora>? horarios;
  List<Horario>? dias;
  var isLoaded = false;
  @override
  void initState() {
    super.initState();
    //getLista();
    getHorarios();
  }

  @override
  Widget build(BuildContext context) {
    //throw UnimplementedError();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.customTitle),
      ),
      body: Visibility(
        visible: isLoaded,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.grey[300],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          DateFormat.Hm()
                              .format(horarios![index].hora)
                              .toString(),
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          horarios?[index].asistentes.toString() ?? '',
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          horarios?[index].hora.toString() ?? '',
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    )),
                  ],
                ));
          },
          itemCount: horarios?.length,
        ),
      ),
    );
  }

  void getLista() async {
    lista = await UsuarioService().getUsuarios();
    if (lista != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  void getHorarios() async {
    //horarios = HorarioService().getHorarios();
    dias = await HorarioService().obtenerHorarios();
    if (dias != null) {
      horarios = dias!.first.horas;
      setState(() {
        isLoaded = true;
      });
    }
  }
}
