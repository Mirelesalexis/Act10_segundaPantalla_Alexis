import 'package:flutter/material.dart';

void main() => runApp(const AppDominos());

class AppDominos extends StatelessWidget {
  const AppDominos({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: const SeccionMasComida(),
    );
  }
}

class SeccionMasComida extends StatelessWidget {
  const SeccionMasComida({super.key});

  final Color azulCeruleo = const Color(0xFF007BA7);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F7),
      
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: azulCeruleo),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.account_circle, size: 60, color: Colors.white),
                  SizedBox(height: 10),
                  Text("Bienvenido", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home, color: azulCeruleo),
              title: const Text("Inicio"),
              onTap: () {},
            ),
          ],
        ),
      ),

      appBar: AppBar(
        elevation: 0,
        backgroundColor: azulCeruleo,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "DOMINO'S", 
                  style: TextStyle(fontWeight: FontWeight.w900, color: Colors.white, fontSize: 20)
                ),
                Text(
                  "ALEXIS", 
                  // CORRECCIÓN 1: .withValues en lugar de .withOpacity
                  style: TextStyle(fontWeight: FontWeight.w400, color: Colors.white.withValues(alpha: 0.8), fontSize: 12, letterSpacing: 2)
                ),
              ],
            ),
            const SizedBox(width: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Image.network(
                'https://raw.githubusercontent.com/Mirelesalexis/imagen-dominos/refs/heads/main/Icono%20Dominos.png',
                height: 30,
                width: 30,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) => 
                  const Icon(Icons.fastfood, color: Colors.white),
              ),
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            _buildFriesBanner(),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  _rectanguloProducto(
                    "Aros de Cebolla", 
                    "Cebollas frescas empanizadas y doradas.",
                    "\$3.00", 
                    'https://raw.githubusercontent.com/Mirelesalexis/imagen-dominos/refs/heads/main/aros.jpg'
                  ),
                  _rectanguloProducto(
                    "Dedos de Queso", 
                    "Mozzarella derretida con especias italianas.",
                    "\$5.00", 
                    'https://raw.githubusercontent.com/Mirelesalexis/imagen-dominos/refs/heads/main/ded.jpg'
                  ),
                  _rectanguloProducto(
                    "Papas fritas", 
                    "Papas naturales con el toque de sal ideal.",
                    "\$3.00", 
                    'https://raw.githubusercontent.com/Mirelesalexis/imagen-dominos/refs/heads/main/pap.jpg'
                  ),
                  _rectanguloProducto(
                    "Nuggets de pollo", 
                    "Pechuga de pollo crujiente (8 piezas).",
                    "\$3.00", 
                    'https://raw.githubusercontent.com/Mirelesalexis/imagen-dominos/refs/heads/main/ng.jpg'
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _rectanguloProducto(String titulo, String info, String precio, String? urlImagen) {
    return Container(
      width: double.infinity,
      height: 110,
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          // CORRECCIÓN 2: .withValues para la sombra
          BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10, offset: const Offset(0, 5)),
        ],
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 110,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
              child: urlImagen != null 
                ? Image.network(
                    urlImagen,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: Colors.grey.shade200,
                      child: Icon(Icons.fastfood, color: Colors.grey.shade400, size: 40),
                    ),
                  )
                : Container(color: Colors.grey.shade200),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titulo, 
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    info,
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      height: 1.2,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    // CORRECCIÓN 3: .withValues para el fondo del precio
                    color: azulCeruleo.withValues(alpha: 0.1), 
                    borderRadius: BorderRadius.circular(8),
                    // CORRECCIÓN 4: .withValues para el borde del precio
                    border: Border.all(color: azulCeruleo.withValues(alpha: 0.3)), 
                  ),
                  child: Text(
                    precio, 
                    style: TextStyle(
                      color: azulCeruleo, 
                      fontWeight: FontWeight.w900, 
                      fontSize: 14
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Icon(Icons.add_circle, color: azulCeruleo, size: 32),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFriesBanner() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        height: 220,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          // CORRECCIÓN 5: .withValues en la sombra del banner
          boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.1), blurRadius: 10)],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Stack(
            children: [
              Image.network(
                'https://images.pexels.com/photos/1583884/pexels-photo-1583884.jpeg?auto=compress&cs=tinysrgb&w=800',
                width: double.infinity,
                height: 220,
                fit: BoxFit.cover,
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    // CORRECCIÓN 6: .withValues en el gradiente
                    colors: [Colors.transparent, Colors.black.withValues(alpha: 0.8)],
                  ),
                ),
                padding: const EdgeInsets.all(20),
                alignment: Alignment.bottomLeft,
                child: const Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
