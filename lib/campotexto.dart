import 'package:flutter/material.dart';

class Campotexto extends StatefulWidget {
  const Campotexto({super.key});

  @override
  State<Campotexto> createState() => _CampotextoState();
}

class _CampotextoState extends State<Campotexto> {

  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
  String _textoResultado = "";


  void _calcular(){

    double? precoAlcool = double.tryParse(_controllerAlcool.text);
    double? precoGasolina = double.tryParse(_controllerGasolina.text);

    if (precoAlcool == null || precoGasolina == null){
      setState(() {
        _textoResultado = "Número inválido! Insira um valor acima de 0 contendo (.)";
      });
    }else{
      if(precoAlcool/precoGasolina >= 0.7){
        setState(() {
          _textoResultado = "É melhor abastecer com gasolina";
        });
      }
      else{
        setState(() {
          _textoResultado = "É melhor abastecer com álcool";
        });
      }
    }
    
  }


  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Álcool ou gasolina",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 32),
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //imagem - logo
          Padding(
            padding: EdgeInsets.all(32),
            child: Image.asset("img_logo/logo.png"),
          ),
          //texto
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 20),
            child: Text(
              "Saiba qual é a melhor opção de abastecimento para o seu carro",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 22
              ),
            ),
          ),
          //campo de texto
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Preço do álcool, ex.: 1.59"
              ),
              controller: _controllerAlcool,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            child: TextField( 
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Preço da gasolina, ex.: 3.50"
            ),
            controller: _controllerGasolina,
          ),
        ),
        //botão
        SizedBox(height: 28),
        Center(
          child: SizedBox(
            width: 200,
            height: 50,
            child: ElevatedButton(
              onPressed: _calcular,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 4,
              ),
              child: Text(
                "Calcular",
                style: TextStyle(
                  fontSize:20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ), 
              ),
            ),
          ),
        ),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 32),
          child: Text(
            _textoResultado,
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.bold
            ),
          ),
        )

          
        ],
      ),
        ),
      )
    );
  }
}