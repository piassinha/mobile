import 'package:flutter/material.dart';
import 'chamados_screen.dart'; 

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, 
      body: SafeArea(
        child: Row(
          children: [
            _buildVerticalNavBar(context), // barra lateral
            _buildMainContent(),         // painel com conteudo
          ],
        ),
      ),
    );
    }
  }

  Widget _buildVerticalNavBar(BuildContext context) {
    return Container(
      width: 80,
      color: const Color(0xFF001122),
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'assets/logob.png',
            height: 40,
          ),
          Column(
            children: [
              // icones:
              _buildNavIcon(
                icon: Icons.home,
                isSelected: true,
                onTap: () {
                },
              ),
              _buildNavIcon(
                icon: Icons.people_outline,
                isSelected: false,
                onTap: () {
                  // ao clicar vai pra tela de chamados:
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const ChamadosScreen()),
                  );
                },
              ),
              _buildNavIcon(icon: Icons.work_outline, isSelected: false, onTap: () {}),
              _buildNavIcon(icon: Icons.grid_view_outlined, isSelected: false, onTap: () {}),
              _buildNavIcon(icon: Icons.apartment_outlined, isSelected: false, onTap: () {}),
              _buildNavIcon(icon: Icons.build_outlined, isSelected: false, onTap: () {}),
              _buildNavIcon(icon: Icons.description_outlined, isSelected: false, onTap: () {}),
            ],
          ),
          const CircleAvatar(
            radius: 20,
            backgroundColor: Colors.blueGrey,
            child: Text(
              'GM',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavIcon({
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue.withOpacity(0.8) : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(
          icon,
          color: isSelected ? Colors.white : Colors.grey[400],
          size: 28,
        ),
      ),
    );
  }

  /// parte de conteudo principal:
  Widget _buildMainContent() {
    return Expanded(
      // container cria o bloco 
      child: Container(
        margin: const EdgeInsets.only(top: 16, right: 16, bottom: 16),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(24),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildSalesCard(),
                const SizedBox(height: 24),
                
                _buildMapCard(),
                const SizedBox(height: 44),

                _buildPhoneCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSalesCard() {
  return Container(
    decoration: BoxDecoration(
      color: Color(0xFF001122), // fundo azul escuro (pode mudar)
      borderRadius: BorderRadius.circular(16), // cantos arredondados
    ),
    padding: EdgeInsets.all(16), // espaço interno
    child: Center(
      child: Image.asset(
        'assets/sales.png',
        width: 220, // define o tamanho da imagem
        height: 180,
        fit: BoxFit.contain,
      ),
    ),
  );
}

  Widget _buildMapCard() {
 return Container(
    decoration: BoxDecoration(
      color: Color(0xFF001122), // fundo azul escuro (pode mudar)
      borderRadius: BorderRadius.circular(16), // cantos arredondados
    ),
    padding: EdgeInsets.all(16), // espaço interno
    child: Center(
      child: Image.asset(
        'assets/mapa.png',
        width: 260, // define o tamanho da imagem
        height: 140,
        fit: BoxFit.contain,
      ),
    ),
  );
}

Widget _buildPhoneCard() {
  return Container(
    width: 200,  // bloco maior
    padding: EdgeInsets.all(16),  // espaçamento interno confortável
    decoration: BoxDecoration(
      color: Color(0xFF001122),
      borderRadius: BorderRadius.circular(16),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'SUA CENTRAL DE CHAMADOS RÁPIDA E ORGANIZADA',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 10),
        Image.asset(
          'assets/phone.png',
          width: 250,  // imagem bem maior
          height: 270,
          fit: BoxFit.contain,
        ),
      ],
    ),
  );
}
