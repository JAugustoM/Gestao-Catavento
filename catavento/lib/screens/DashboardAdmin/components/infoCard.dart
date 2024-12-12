import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final String nome;
  final String codigo;
  final String descricao;
  final String status;
  final String imageUrl;

  const InfoCard({
    super.key,
    required this.nome,
    required this.codigo,
    required this.descricao,
    required this.status,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    imageUrl,
                    width: 120,
                    height: 120,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildInfoRow("Nome", nome),
                      const SizedBox(height: 8),
                      _buildInfoRow("Código", codigo),
                      const SizedBox(height: 8),
                      _buildInfoRow("Status", status),
                      const SizedBox(height: 8),
                      _buildInfoRow("Descrição", descricao),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            value,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black54,
            ),
            maxLines: null,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
