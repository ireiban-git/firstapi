import 'package:firstapi/model/horariogx.dart';
import 'package:firstapi/service/customservice.dart';
import 'package:firstapi/model/HorarioPost.dart';

class HorarioService {
  List<Horario> getHorarios() {
    Horario h = Horario(
        fecha: DateTime(2023, 6, 5, 0, 0, 0, 0, 0), dia: 'Lunes', horas: []);
    Hora hora = Hora(
        hora: DateTime(2023, 6, 5, 6, 0, 0, 0, 0),
        asistentes: 10,
        openBoxSiNo: false);
    h.horas.add(hora);
    return [h];
  }

  Future<List<Horario>> obtenerHorarios() async {
    var horarioPost =
        HorarioPost(iBoxNid: 1, iFecha: DateTime.now(), iSemanaSiNo: false);
    String response = '';
    response = await CustomService().post('/swgenerarhorario', horarioPost);
    //.then((response) => {});
    return horarioGxFromJson(response).horario;
  }
}
