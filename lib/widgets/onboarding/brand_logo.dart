import 'package:flutter/material.dart';

class BrandLogo extends StatelessWidget {
  const BrandLogo({super.key, this.size = 92});

  final double size;

  @override
  Widget build(BuildContext context) {
    final primary = const Color(0xFF2B5876);
    final outline = const Color(0xFF8CA6BB);

    return SizedBox(
      width: size * 1.3,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: size,
            height: size * 1.05,
            child: Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  top: 0,
                  child: Container(
                    width: size * 0.34,
                    height: size * 0.34,
                    decoration: BoxDecoration(
                      border: Border.all(color: outline, width: 1.2),
                    ),
                    child: CustomPaint(painter: _GridPainter(outline)),
                  ),
                ),
                Positioned(
                  top: size * 0.16,
                  child: Container(
                    width: size * 0.46,
                    height: size * 0.56,
                    decoration: BoxDecoration(
                      border: Border.all(color: primary, width: 1.8),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(size * 0.05),
                        topRight: Radius.circular(size * 0.05),
                        bottomLeft: Radius.circular(size * 0.02),
                        bottomRight: Radius.circular(size * 0.02),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: size * 0.08,
                        vertical: size * 0.1,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _WindowColumn(height: size * 0.13),
                          _WindowColumn(height: size * 0.22),
                          _WindowColumn(height: size * 0.18),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: size * 0.08,
                  child: Transform.rotate(
                    angle: -0.88,
                    child: Container(
                      width: size * 0.78,
                      height: size * 0.48,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(size),
                        border: Border.all(color: primary, width: 3),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Transform.translate(
            offset: Offset(0, -size * 0.05),
            child: Column(
              children: [
                ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [
                      Color(0xFF8BA6BC),
                      Color(0xFF294F6B),
                      Color(0xFFC2D0DB),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ).createShader(bounds),
                  child: Text(
                    'Finis',
                    style: TextStyle(
                      fontSize: size * 0.28,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -1.5,
                      color: Colors.white,
                      height: 0.9,
                    ),
                  ),
                ),
                SizedBox(height: size * 0.012),
                Text(
                  'RENOVATIONS & CONSTRUCTION',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: primary,
                    fontSize: size * 0.052,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.4,
                    height: 1,
                  ),
                ),
                SizedBox(height: size * 0.016),
                Text(
                  'BUILDING FOR THE FUTURE!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: primary,
                    fontSize: size * 0.042,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.1,
                    height: 1,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _WindowColumn extends StatelessWidget {
  const _WindowColumn({required this.height});

  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        _WindowBox(height: height * 0.42),
        SizedBox(height: height * 0.14),
        _WindowBox(height: height * 0.42),
      ],
    );
  }
}

class _WindowBox extends StatelessWidget {
  const _WindowBox({required this.height});

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 5,
      height: height,
      decoration: BoxDecoration(
        color: const Color(0xFF2B5876),
        borderRadius: BorderRadius.circular(1),
      ),
    );
  }
}

class _GridPainter extends CustomPainter {
  const _GridPainter(this.color);

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    for (var i = 1; i < 3; i++) {
      final dx = size.width / 3 * i;
      canvas.drawLine(Offset(dx, 0), Offset(dx, size.height), paint);
    }

    for (var i = 1; i < 4; i++) {
      final dy = size.height / 4 * i;
      canvas.drawLine(Offset(0, dy), Offset(size.width, dy), paint);
    }

    canvas.drawLine(Offset(0, size.height), Offset(size.width / 2, 0), paint);
    canvas.drawLine(
      Offset(size.width, size.height),
      Offset(size.width / 2, 0),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant _GridPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}
