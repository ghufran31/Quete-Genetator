import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data/quotes_data.dart';
import '../models/quote_model.dart';
import '../theme/app_theme.dart';
import '../widgets/animated_button.dart';
import '../widgets/quote_card.dart';
import 'favorites_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late Quote _currentQuote;
  final Random _random = Random();
  final List<Quote> _favorites = [];

  late AnimationController _fadeController;
  late AnimationController _slideController;
  late AnimationController _bgController;

  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _bgAnimation;

  int _quoteCount = 0;

  @override
  void initState() {
    super.initState();
    _currentQuote = _getRandomQuote();

    // Card fade+slide animation
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _slideController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeOut),
    );
    _slideAnimation =
        Tween<Offset>(
          begin: const Offset(0, 0.1),
          end: Offset.zero,
        ).animate(
          CurvedAnimation(parent: _slideController, curve: Curves.easeOut),
        );

    // Subtle background pulsing
    _bgController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat(reverse: true);
    _bgAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _bgController, curve: Curves.easeInOut),
    );

    _fadeController.forward();
    _slideController.forward();
  }

  Quote _getRandomQuote() {
    final q = predefinedQuotes[_random.nextInt(predefinedQuotes.length)];
    return q;
  }

  Future<void> _showNewQuote() async {
    HapticFeedback.lightImpact();
    await _fadeController.reverse();
    setState(() {
      _currentQuote = _getRandomQuote();
      _quoteCount++;
    });
    _slideController.reset();
    _fadeController.forward();
    _slideController.forward();
  }

  void _toggleFavorite() {
    HapticFeedback.mediumImpact();
    setState(() {
      if (_favorites.any((q) => q.text == _currentQuote.text)) {
        _favorites.removeWhere((q) => q.text == _currentQuote.text);
        _showSnack('Removed from favorites', Icons.heart_broken_rounded,
            AppTheme.secondary);
      } else {
        _favorites.add(_currentQuote);
        _showSnack(
            'Added to favorites!', Icons.favorite_rounded, AppTheme.secondary);
      }
    });
  }

  bool get _isFavorite =>
      _favorites.any((q) => q.text == _currentQuote.text);

  void _showSnack(String msg, IconData icon, Color color) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(icon, color: color, size: 18),
            const SizedBox(width: 10),
            Text(msg, style: GoogleFonts.poppins(fontSize: 13)),
          ],
        ),
        backgroundColor: AppTheme.bgCardLight,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.all(16),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _slideController.dispose();
    _bgController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.bgDark,
      body: AnimatedBuilder(
        animation: _bgAnimation,
        builder: (context, child) {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppTheme.bgDark,
                  Color.lerp(
                    AppTheme.bgDark,
                    const Color(0xFF12102B),
                    _bgAnimation.value,
                  )!,
                  AppTheme.bgDark,
                ],
              ),
            ),
            child: child,
          );
        },
        child: Stack(
          children: [
            // Orb top-right
            Positioned(
              top: -60,
              right: -40,
              child: Container(
                width: 220,
                height: 220,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      AppTheme.primary.withOpacity(0.12),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
            // Orb bottom-left
            Positioned(
              bottom: 100,
              left: -60,
              child: Container(
                width: 260,
                height: 260,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      AppTheme.secondary.withOpacity(0.08),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),

            SafeArea(
              child: Column(
                children: [
                  _buildHeader(context),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          const SizedBox(height: 10),
                          _buildStats(),
                          const SizedBox(height: 16),
                          QuoteCard(
                            quote: _currentQuote,
                            fadeAnimation: _fadeAnimation,
                            slideAnimation: _slideAnimation,
                          ),
                          const SizedBox(height: 16),
                          _buildActionRow(),
                          const SizedBox(height: 24),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: AnimatedNewQuoteButton(
                              onPressed: _showNewQuote,
                            ),
                          ),
                          const SizedBox(height: 32),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
      child: Row(
        children: [
          // Logo icon
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              gradient: AppTheme.primaryGradient,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: AppTheme.primary.withOpacity(0.35),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: const Icon(
              Icons.format_quote_rounded,
              color: Colors.white,
              size: 22,
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'QuoteVerse',
                style: GoogleFonts.playfairDisplay(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.textPrimary,
                ),
              ),
              Text(
                'Daily Inspiration',
                style: GoogleFonts.poppins(
                  fontSize: 11,
                  color: AppTheme.textMuted,
                  letterSpacing: 1.0,
                ),
              ),
            ],
          ),
          const Spacer(),
          // Favorites button
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (_, _, _) =>
                    FavoritesScreen(favorites: _favorites),
                transitionDuration: const Duration(milliseconds: 400),
                transitionsBuilder: (_, animation, _, child) {
                  return SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(1, 0),
                      end: Offset.zero,
                    ).animate(
                      CurvedAnimation(parent: animation, curve: Curves.easeOut),
                    ),
                    child: child,
                  );
                },
              ),
            ),
            child: Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: AppTheme.secondary.withOpacity(0.12),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: AppTheme.secondary.withOpacity(0.3),
                ),
              ),
              child: Stack(
                children: [
                  const Center(
                    child: Icon(
                      Icons.favorite_rounded,
                      color: AppTheme.secondary,
                      size: 20,
                    ),
                  ),
                  if (_favorites.isNotEmpty)
                    Positioned(
                      top: 6,
                      right: 6,
                      child: Container(
                        width: 14,
                        height: 14,
                        decoration: BoxDecoration(
                          gradient: AppTheme.primaryGradient,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            '${_favorites.length}',
                            style: const TextStyle(
                              fontSize: 8,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStats() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          _StatChip(
            label: 'Total Quotes',
            value: '${predefinedQuotes.length}',
            icon: Icons.library_books_rounded,
            color: AppTheme.primary,
          ),
          const SizedBox(width: 10),
          _StatChip(
            label: 'Explored',
            value: '$_quoteCount',
            icon: Icons.explore_rounded,
            color: AppTheme.accent,
          ),
          const SizedBox(width: 10),
          _StatChip(
            label: 'Saved',
            value: '${_favorites.length}',
            icon: Icons.bookmark_rounded,
            color: AppTheme.secondary,
          ),
        ],
      ),
    );
  }

  Widget _buildActionRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          // Favorite toggle
          Expanded(
            child: _ActionButton(
              icon: _isFavorite
                  ? Icons.favorite_rounded
                  : Icons.favorite_border_rounded,
              label: _isFavorite ? 'Saved' : 'Save',
              color: AppTheme.secondary,
              onTap: _toggleFavorite,
              filled: _isFavorite,
            ),
          ),
          const SizedBox(width: 12),
          // Share button
          Expanded(
            child: _ActionButton(
              icon: Icons.share_rounded,
              label: 'Share',
              color: AppTheme.accentBlue,
              onTap: () => _showSnack(
                'Share feature coming soon!',
                Icons.share_rounded,
                AppTheme.accentBlue,
              ),
            ),
          ),
          const SizedBox(width: 12),
          // Random again
          Expanded(
            child: _ActionButton(
              icon: Icons.shuffle_rounded,
              label: 'Shuffle',
              color: AppTheme.accent,
              onTap: _showNewQuote,
            ),
          ),
        ],
      ),
    );
  }
}

class _StatChip extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final Color color;

  const _StatChip({
    required this.label,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        decoration: BoxDecoration(
          color: AppTheme.bgCard,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: color.withOpacity(0.2)),
        ),
        child: Row(
          children: [
            Icon(icon, size: 14, color: color),
            const SizedBox(width: 6),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    value,
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: color,
                    ),
                  ),
                  Text(
                    label,
                    style: GoogleFonts.poppins(
                      fontSize: 9,
                      color: AppTheme.textMuted,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;
  final bool filled;

  const _ActionButton({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
    this.filled = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: filled ? color.withOpacity(0.2) : AppTheme.bgCard,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: color.withOpacity(filled ? 0.5 : 0.2),
          ),
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 20),
            const SizedBox(height: 4),
            Text(
              label,
              style: GoogleFonts.poppins(
                fontSize: 11,
                color: color,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
