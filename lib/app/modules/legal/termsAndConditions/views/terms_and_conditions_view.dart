import 'package:flutter/material.dart';
import 'package:portfolio/app/helpers/constants/app_colors.dart';

class TermsAndConditionsView extends StatelessWidget {
  const TermsAndConditionsView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isWide = MediaQuery.of(context).size.width > 1200;

    return Scaffold(
      backgroundColor: AppColors.dawnPink,
      appBar: AppBar(
        title: Text(
          "Paper Trade",
          style: theme.textTheme.titleMedium?.copyWith(
            color: AppColors.limedSpruce.withOpacity(.55),
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: AppColors.dawnPink.withOpacity(.92),
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: Stack(
        children: [
          // Decorative blobs
          Positioned(
            top: -100,
            right: -100,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                color: AppColors.spectra.withOpacity(.07),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            left: -80,
            bottom: -80,
            child: Container(
              width: 260,
              height: 260,
              decoration: BoxDecoration(
                color: AppColors.talipTree.withOpacity(.06),
                shape: BoxShape.circle,
              ),
            ),
          ),

          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1100),
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: isWide ? 80 : 20,
                  vertical: 24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ── Hero ──────────────────────────────────────────────
                    _TermsHeroSection(theme: theme),

                    const SizedBox(height: 20),

                    // ── Stats Strip ───────────────────────────────────────
                    const _TermsStatsStrip(),

                    const SizedBox(height: 20),

                    // ── Acceptance Banner ─────────────────────────────────
                    const _AcceptanceBanner(),

                    const SizedBox(height: 20),

                    // ── Section 1: Introduction ───────────────────────────
                    _TermsAccordion(
                      sectionLabel: "01",
                      title: "Introduction",
                      icon: Icons.handshake_outlined,
                      initiallyOpen: true,
                      content: _introContent(theme),
                    ),

                    // ── Section 2: Eligibility ────────────────────────────
                    _TermsAccordion(
                      sectionLabel: "02",
                      title: "Eligibility",
                      icon: Icons.verified_user_outlined,
                      content: _eligibilityContent(theme),
                    ),

                    // ── Section 3: Account Registration ───────────────────
                    _TermsAccordion(
                      sectionLabel: "03",
                      title: "Account Registration",
                      icon: Icons.account_circle_outlined,
                      content: _accountContent(theme),
                    ),

                    // ── Section 4: Educational Purpose ────────────────────
                    _TermsAccordion(
                      sectionLabel: "04",
                      title: "Educational & Simulation Purpose",
                      icon: Icons.school_outlined,
                      content: _educationalContent(theme),
                    ),

                    // ── Section 5: No Financial Advice ────────────────────
                    _TermsAccordion(
                      sectionLabel: "05",
                      title: "No Financial Advice",
                      icon: Icons.money_off_outlined,
                      content: _financialAdviceContent(theme),
                    ),

                    // ── Simulation Disclaimer Banner ──────────────────────
                    const _SimulationDisclaimerBanner(),

                    const SizedBox(height: 16),

                    // ── Section 7: Market Data Disclaimer ─────────────────
                    _TermsAccordion(
                      sectionLabel: "07",
                      title: "Market Data Disclaimer",
                      icon: Icons.bar_chart_outlined,
                      content: _marketDataContent(theme),
                    ),

                    // ── Section 8: User Responsibilities ──────────────────
                    _TermsAccordion(
                      sectionLabel: "08",
                      title: "User Responsibilities",
                      icon: Icons.checklist_outlined,
                      content: _userResponsibilitiesContent(theme),
                    ),

                    // ── Section 9: Prohibited Activities ─────────────────
                    _TermsAccordion(
                      sectionLabel: "09",
                      title: "Prohibited Activities",
                      icon: Icons.block_outlined,
                      content: _prohibitedContent(theme),
                    ),

                    // ── Section 10: Intellectual Property ────────────────
                    _TermsAccordion(
                      sectionLabel: "10",
                      title: "Intellectual Property",
                      icon: Icons.copyright_outlined,
                      content: _ipContent(theme),
                    ),

                    // ── Section 11: Third-Party Services ──────────────────
                    _TermsAccordion(
                      sectionLabel: "11",
                      title: "Third-Party Services",
                      icon: Icons.hub_outlined,
                      content: _thirdPartyContent(theme),
                    ),

                    // ── Section 12: Limitation of Liability ───────────────
                    _TermsAccordion(
                      sectionLabel: "12",
                      title: "Limitation of Liability",
                      icon: Icons.gavel_outlined,
                      content: _liabilityContent(theme),
                    ),

                    // ── Section 13: Account Suspension ────────────────────
                    _TermsAccordion(
                      sectionLabel: "13",
                      title: "Account Suspension & Termination",
                      icon: Icons.person_off_outlined,
                      content: _suspensionContent(theme),
                    ),

                    // ── Section 14: Changes to Terms ──────────────────────
                    _TermsAccordion(
                      sectionLabel: "14",
                      title: "Changes to Terms",
                      icon: Icons.update_outlined,
                      content: _changesContent(theme),
                    ),

                    // ── Section 15: Governing Law ─────────────────────────
                    _TermsAccordion(
                      sectionLabel: "15",
                      title: "Governing Law",
                      icon: Icons.balance_outlined,
                      content: _governingLawContent(theme),
                    ),

                    const SizedBox(height: 8),

                    // ── Contact Card ──────────────────────────────────────
                    _TermsContactCard(theme: theme),

                    const SizedBox(height: 60),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// HERO
// ─────────────────────────────────────────────────────────────────────────────

class _TermsHeroSection extends StatelessWidget {
  final ThemeData theme;
  const _TermsHeroSection({required this.theme});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(36),
      decoration: BoxDecoration(
        color: AppColors.spectra,
        borderRadius: BorderRadius.circular(28),
      ),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: [
          // Decorative circle inside hero
          Positioned(
            top: -40,
            right: -40,
            child: Container(
              width: 180,
              height: 180,
              decoration: BoxDecoration(
                color: AppColors.talipTree.withOpacity(.12),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            bottom: -60,
            left: -30,
            child: Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                color: AppColors.dawnPink.withOpacity(.05),
                shape: BoxShape.circle,
              ),
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Badge
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 7,
                ),
                decoration: BoxDecoration(
                  color: AppColors.talipTree,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                        color: const Color(0xFF2a1f00).withOpacity(.5),
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      "Last Updated • June 1, 2026",
                      style: TextStyle(
                        color: Color(0xFF2a1f00),
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.2,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              Text(
                "Terms &\nConditions",
                style: theme.textTheme.displayLarge?.copyWith(
                  color: AppColors.dawnPink,
                  height: 1.1,
                  letterSpacing: -0.5,
                ),
              ),

              const SizedBox(height: 16),

              Text(
                "By using Paper Trade, you agree to these terms. Please read them carefully before accessing or using our platform.",
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: AppColors.dawnPink.withOpacity(.78),
                  height: 1.7,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// STATS STRIP
// ─────────────────────────────────────────────────────────────────────────────

class _TermsStatsStrip extends StatelessWidget {
  const _TermsStatsStrip();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _TermsStatCard(value: "15", label: "Sections"),
        const SizedBox(width: 12),
        _TermsStatCard(value: "IN", label: "Governing Law"),
        const SizedBox(width: 12),
        _TermsStatCard(value: "⚖️", label: "Fair & Clear", isEmoji: true),
      ],
    );
  }
}

class _TermsStatCard extends StatelessWidget {
  final String value;
  final String label;
  final bool isEmoji;

  const _TermsStatCard({
    required this.value,
    required this.label,
    this.isEmoji = false,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: AppColors.limedSpruce.withOpacity(.1)),
        ),
        child: Column(
          children: [
            isEmoji
                ? Text(value, style: const TextStyle(fontSize: 22))
                : Text(
                    value,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: AppColors.limedSpruce,
                    ),
                  ),
            const SizedBox(height: 4),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: AppColors.redDamask,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// ACCEPTANCE BANNER
// ─────────────────────────────────────────────────────────────────────────────

class _AcceptanceBanner extends StatelessWidget {
  const _AcceptanceBanner();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.spectra.withOpacity(.07),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.spectra.withOpacity(.2)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: AppColors.spectra,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.verified_outlined,
              color: AppColors.dawnPink,
              size: 20,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "BY USING PAPER TRADE, YOU ACCEPT THESE TERMS",
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                    color: AppColors.spectra,
                    letterSpacing: 0.7,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  "Accessing or using Paper Trade means you have read, understood, and agreed to be bound by these Terms & Conditions. If you do not agree, please discontinue use of the application.",
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: AppColors.limedSpruce.withOpacity(.75),
                    height: 1.65,
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

// ─────────────────────────────────────────────────────────────────────────────
// SIMULATION DISCLAIMER BANNER (replaces Section 6 inline)
// ─────────────────────────────────────────────────────────────────────────────

class _SimulationDisclaimerBanner extends StatelessWidget {
  const _SimulationDisclaimerBanner();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.redDamask.withOpacity(.08),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.redDamask.withOpacity(.25)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: AppColors.redDamask,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.trending_up_rounded,
              color: AppColors.dawnPink,
              size: 20,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "06 — SIMULATED TRADING DISCLAIMER",
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                    color: AppColors.redDamask,
                    letterSpacing: 0.7,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  "All trades within Paper Trade use virtual funds only. No real securities, stocks, or financial instruments are bought or sold at any time. Simulated trading performance does not predict, guarantee, or represent real-world investment results.",
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: AppColors.paarl,
                    height: 1.65,
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

// ─────────────────────────────────────────────────────────────────────────────
// ACCORDION
// ─────────────────────────────────────────────────────────────────────────────

class _TermsAccordion extends StatefulWidget {
  final String sectionLabel;
  final String title;
  final IconData icon;
  final List<Widget> content;
  final bool initiallyOpen;

  const _TermsAccordion({
    required this.sectionLabel,
    required this.title,
    required this.icon,
    required this.content,
    this.initiallyOpen = false,
  });

  @override
  State<_TermsAccordion> createState() => _TermsAccordionState();
}

class _TermsAccordionState extends State<_TermsAccordion>
    with SingleTickerProviderStateMixin {
  late bool _open;
  late AnimationController _controller;
  late Animation<double> _expandAnim;
  late Animation<double> _rotateAnim;

  @override
  void initState() {
    super.initState();
    _open = widget.initiallyOpen;
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      value: _open ? 1.0 : 0.0,
    );
    _expandAnim = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _rotateAnim = Tween<double>(
      begin: 0,
      end: 0.5,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggle() {
    setState(() => _open = !_open);
    _open ? _controller.forward() : _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggle,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.only(bottom: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
          border: Border.all(
            color: _open
                ? AppColors.spectra.withOpacity(.30)
                : AppColors.limedSpruce.withOpacity(.1),
          ),
        ),
        child: Column(
          children: [
            // Header row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              child: Row(
                children: [
                  // Accent bar
                  Container(
                    width: 4,
                    height: 34,
                    decoration: BoxDecoration(
                      color: AppColors.spectra,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  const SizedBox(width: 14),

                  // Icon badge
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: _open
                          ? AppColors.spectra.withOpacity(.1)
                          : AppColors.limedSpruce.withOpacity(.07),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      widget.icon,
                      size: 20,
                      color: _open ? AppColors.spectra : AppColors.limedSpruce,
                    ),
                  ),
                  const SizedBox(width: 14),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.sectionLabel,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w800,
                            color: AppColors.limedSpruce.withOpacity(.4),
                            letterSpacing: 0.5,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          widget.title,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: AppColors.limedSpruce,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Chevron
                  AnimatedBuilder(
                    animation: _rotateAnim,
                    builder: (context, child) => Transform.rotate(
                      angle: _rotateAnim.value * 3.14159,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: _open
                              ? AppColors.spectra
                              : AppColors.limedSpruce.withOpacity(.07),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          size: 20,
                          color: _open
                              ? AppColors.dawnPink
                              : AppColors.limedSpruce,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Expandable body
            SizeTransition(
              sizeFactor: _expandAnim,
              child: Column(
                children: [
                  const Divider(
                    height: 1,
                    thickness: 1,
                    color: Color(0x1A2F484C),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(22, 18, 22, 22),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: widget.content,
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
}

// ─────────────────────────────────────────────────────────────────────────────
// CONTACT CARD
// ─────────────────────────────────────────────────────────────────────────────

class _TermsContactCard extends StatelessWidget {
  final ThemeData theme;
  const _TermsContactCard({required this.theme});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.limedSpruce, AppColors.spectra],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(28),
      ),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: [
          Positioned(
            bottom: -50,
            right: -50,
            child: Container(
              width: 180,
              height: 180,
              decoration: BoxDecoration(
                color: AppColors.talipTree.withOpacity(.1),
                shape: BoxShape.circle,
              ),
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Tag
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: AppColors.talipTree.withOpacity(.2),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: const Text(
                  "Questions?",
                  style: TextStyle(
                    color: AppColors.talipTree,
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.5,
                  ),
                ),
              ),

              const SizedBox(height: 16),

              Text(
                "Contact Us",
                style: theme.textTheme.headlineMedium?.copyWith(
                  color: AppColors.dawnPink,
                  letterSpacing: -0.3,
                ),
              ),

              const SizedBox(height: 12),

              Text(
                "If you have questions about these Terms & Conditions, or would like to report a violation, please reach out using the contact details below.",
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: AppColors.dawnPink.withOpacity(.75),
                  height: 1.7,
                ),
              ),

              const SizedBox(height: 26),

              // Name row
              _TermsContactRow(
                icon: Icons.person_outline_rounded,
                primary: "Sourav Kumar",
                secondary: "Developer & Owner",
              ),

              const SizedBox(height: 14),

              // Email row
              _TermsContactRow(
                icon: Icons.email_outlined,
                primary: "info.sourav174@gmail.com",
                secondary: "For terms-related inquiries",
                selectable: true,
              ),

              const SizedBox(height: 14),

              // Jurisdiction row
              _TermsContactRow(
                icon: Icons.location_on_outlined,
                primary: "India",
                secondary: "Governing Jurisdiction",
              ),

              const SizedBox(height: 22),

              Divider(color: AppColors.dawnPink.withOpacity(.12), height: 1),

              const SizedBox(height: 16),

              Text(
                "We aim to respond to all inquiries within a reasonable timeframe.",
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.dawnPink.withOpacity(.5),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _TermsContactRow extends StatelessWidget {
  final IconData icon;
  final String primary;
  final String secondary;
  final bool selectable;

  const _TermsContactRow({
    required this.icon,
    required this.primary,
    required this.secondary,
    this.selectable = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 38,
          height: 38,
          decoration: BoxDecoration(
            color: AppColors.talipTree.withOpacity(.18),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: AppColors.talipTree, size: 20),
        ),
        const SizedBox(width: 14),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            selectable
                ? SelectableText(
                    primary,
                    style: const TextStyle(
                      color: AppColors.dawnPink,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  )
                : Text(
                    primary,
                    style: const TextStyle(
                      color: AppColors.dawnPink,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
            const SizedBox(height: 2),
            Text(
              secondary,
              style: TextStyle(
                color: AppColors.dawnPink.withOpacity(.55),
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// CONTENT HELPERS
// ─────────────────────────────────────────────────────────────────────────────

Widget _tBodyText(String text) => Padding(
  padding: const EdgeInsets.only(bottom: 10),
  child: Text(
    text,
    style: const TextStyle(
      fontSize: 14,
      height: 1.85,
      color: Color(0xFF4a6468),
      fontWeight: FontWeight.w400,
    ),
  ),
);

Widget _tBulletItem(String text) => Padding(
  padding: const EdgeInsets.only(left: 4, bottom: 6),
  child: Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(top: 8, right: 10),
        child: Container(
          width: 6,
          height: 6,
          decoration: const BoxDecoration(
            color: AppColors.spectra,
            shape: BoxShape.circle,
          ),
        ),
      ),
      Expanded(
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 14,
            height: 1.75,
            color: Color(0xFF4a6468),
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    ],
  ),
);

Widget _tHighlight(String text) => Container(
  margin: const EdgeInsets.only(top: 10),
  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
  decoration: BoxDecoration(
    color: AppColors.spectra.withOpacity(.07),
    borderRadius: BorderRadius.circular(10),
    border: Border.all(color: AppColors.spectra.withOpacity(.15)),
  ),
  child: Text(
    text,
    style: const TextStyle(
      fontSize: 14,
      height: 1.65,
      color: AppColors.spectra,
      fontWeight: FontWeight.w600,
    ),
  ),
);

Widget _tWarningHighlight(String text) => Container(
  margin: const EdgeInsets.only(top: 10),
  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
  decoration: BoxDecoration(
    color: AppColors.redDamask.withOpacity(.07),
    borderRadius: BorderRadius.circular(10),
    border: Border.all(color: AppColors.redDamask.withOpacity(.2)),
  ),
  child: Text(
    text,
    style: const TextStyle(
      fontSize: 14,
      height: 1.65,
      color: AppColors.paarl,
      fontWeight: FontWeight.w600,
    ),
  ),
);

// ─────────────────────────────────────────────────────────────────────────────
// SECTION CONTENT
// ─────────────────────────────────────────────────────────────────────────────

List<Widget> _introContent(ThemeData theme) => [
  _tBodyText("Welcome to Paper Trade."),
  _tBodyText(
    "These Terms & Conditions govern your access to and use of the Paper Trade application. By creating an account, signing in, or otherwise accessing the application, you confirm that you have read, understood, and agree to be bound by these Terms.",
  ),
  _tBodyText(
    "If you do not agree to any part of these Terms, please discontinue use of the application immediately.",
  ),
];

List<Widget> _eligibilityContent(ThemeData theme) => [
  _tBodyText("By using Paper Trade, you represent and warrant that:"),
  _tBulletItem(
    "You will use the application in compliance with all applicable local, state, national, and international laws and regulations.",
  ),
  _tBulletItem(
    "You are responsible for maintaining the confidentiality and security of your account credentials at all times.",
  ),
  _tBulletItem(
    "You will notify us promptly if you become aware of any unauthorized use of your account or any security breach.",
  ),
  _tHighlight(
    "If you are accessing Paper Trade on behalf of an organization, you represent that you have the authority to bind that organization to these Terms.",
  ),
];

List<Widget> _accountContent(ThemeData theme) => [
  _tBodyText(
    "Paper Trade uses Google Sign-In for authentication. To use the application, you must sign in with a valid Google account.",
  ),
  _tBulletItem(
    "Authentication is performed securely using Google tokens. Neither Firebase Authentication nor Supabase Authentication is used.",
  ),
  _tBulletItem(
    "You are responsible for the accuracy of all information associated with your Google account.",
  ),
  _tBulletItem(
    "You are solely responsible for all activities that occur under your account, whether or not authorized by you.",
  ),
  _tBulletItem(
    "You may not share your account credentials or allow any other person to access your account.",
  ),
  _tHighlight(
    "Paper Trade is not responsible for any loss or damage arising from unauthorized access to your account resulting from your failure to maintain account security.",
  ),
];

List<Widget> _educationalContent(ThemeData theme) => [
  _tBodyText(
    "Paper Trade is designed exclusively for educational, informational, and practice purposes.",
  ),
  _tBodyText(
    "The application provides a simulated trading environment to help users learn about stock markets, develop investment strategies, and gain practical experience — without risking real money.",
  ),
  _tBulletItem(
    "All portfolio values, trade executions, and account balances within the application are entirely virtual.",
  ),
  _tBulletItem(
    "The application is not a licensed brokerage, investment advisor, or financial services provider.",
  ),
  _tHighlight(
    "Use of Paper Trade is intended solely for learning and skill-building. It should not be treated as a substitute for professional financial guidance.",
  ),
];

List<Widget> _financialAdviceContent(ThemeData theme) => [
  _tBodyText(
    "Nothing within Paper Trade — including market data, portfolio analytics, trade simulations, or any other content — constitutes financial, investment, tax, or legal advice.",
  ),
  _tBodyText(
    "All information provided by the application is for general informational and educational purposes only.",
  ),
  _tWarningHighlight(
    "Before making any real-world investment decisions, you should consult with a qualified and licensed financial professional who understands your individual circumstances.",
  ),
];

List<Widget> _marketDataContent(ThemeData theme) => [
  _tBodyText(
    "Market data displayed within Paper Trade may be sourced from third-party providers and may be delayed, incomplete, or inaccurate.",
  ),
  _tBulletItem(
    "Paper Trade does not guarantee the accuracy, timeliness, completeness, or reliability of any market data or pricing information.",
  ),
  _tBulletItem(
    "Prices displayed are for simulation purposes only and may not reflect real-time or accurate market conditions.",
  ),
  _tBulletItem(
    "Paper Trade shall not be liable for any decisions made based on information provided within the application.",
  ),
  _tHighlight(
    "Always verify financial information through authoritative and licensed market data sources before making real-world decisions.",
  ),
];

List<Widget> _userResponsibilitiesContent(ThemeData theme) => [
  _tBodyText("As a user of Paper Trade, you agree to:"),
  _tBulletItem(
    "Use the application only for lawful purposes and in accordance with these Terms.",
  ),
  _tBulletItem(
    "Maintain the security of your account and promptly report any unauthorized access.",
  ),
  _tBulletItem(
    "Not misuse, disrupt, or interfere with the normal operation of the application or its servers.",
  ),
  _tBulletItem(
    "Not use the application in any manner that could harm, disable, or impair Paper Trade or its users.",
  ),
  _tBulletItem(
    "Provide accurate information when required and keep it up to date.",
  ),
];

List<Widget> _prohibitedContent(ThemeData theme) => [
  _tBodyText(
    "The following activities are strictly prohibited when using Paper Trade:",
  ),
  _tBulletItem(
    "Attempting to gain unauthorized access to the application, its servers, databases, or connected services.",
  ),
  _tBulletItem(
    "Reverse engineering, decompiling, disassembling, or otherwise attempting to derive the source code of the application.",
  ),
  _tBulletItem(
    "Using automated bots, scrapers, or scripts to extract data or interact with the application.",
  ),
  _tBulletItem(
    "Interfering with, disrupting, or degrading the performance of the application or its infrastructure.",
  ),
  _tBulletItem("Creating fake, duplicate, or fraudulent accounts."),
  _tBulletItem(
    "Manipulating rankings, leaderboards, statistics, or other competitive elements through illegitimate means.",
  ),
  _tBulletItem(
    "Transmitting viruses, malware, or any harmful code through the application.",
  ),
  _tWarningHighlight(
    "Violations of these prohibitions may result in immediate account termination and may be reported to relevant legal authorities.",
  ),
];

List<Widget> _ipContent(ThemeData theme) => [
  _tBodyText(
    "All intellectual property within Paper Trade — including but not limited to the application name, branding, logos, user interface design, source code, content, graphics, and features — is owned exclusively by the developer and owner of Paper Trade.",
  ),
  _tBulletItem(
    "You may not copy, reproduce, distribute, modify, or create derivative works from any part of the application without express written permission.",
  ),
  _tBulletItem(
    "You may not use the Paper Trade name, logo, or branding for any commercial purpose.",
  ),
  _tHighlight(
    "Unauthorized use of Paper Trade's intellectual property is a violation of these Terms and may constitute an infringement of applicable intellectual property laws.",
  ),
];

List<Widget> _thirdPartyContent(ThemeData theme) => [
  _tBodyText(
    "Paper Trade may integrate with or rely on the following third-party services to deliver its functionality:",
  ),
  _tBulletItem(
    "Google Sign-In — for secure user authentication via Google accounts.",
  ),
  _tBulletItem(
    "Market data providers — for sourcing stock prices and financial data used in simulations.",
  ),
  _tBulletItem(
    "Analytics and infrastructure services — for app performance monitoring and cloud hosting.",
  ),
  _tBodyText(
    "These services operate under their own terms of service and privacy policies. Paper Trade is not responsible for the practices of these third parties.",
  ),
  _tHighlight(
    "By using Paper Trade, you acknowledge that your use of Google Sign-In is also subject to Google's Terms of Service and Privacy Policy.",
  ),
];

List<Widget> _liabilityContent(ThemeData theme) => [
  _tBodyText(
    "Paper Trade is provided on an \"as is\" and \"as available\" basis, without warranties of any kind — either express or implied.",
  ),
  _tBulletItem(
    "The developer does not warrant that the application will be uninterrupted, error-free, or free of viruses or harmful components.",
  ),
  _tBulletItem(
    "To the fullest extent permitted by applicable law, the developer shall not be liable for any indirect, incidental, special, consequential, or punitive damages.",
  ),
  _tBulletItem(
    "The developer is not responsible for any financial losses, investment decisions, or outcomes resulting from reliance on information provided by the application.",
  ),
  _tWarningHighlight(
    "Paper Trade is a simulation tool. Any resemblance between simulated performance and actual market results is coincidental and does not indicate future performance.",
  ),
];

List<Widget> _suspensionContent(ThemeData theme) => [
  _tBodyText(
    "Paper Trade reserves the right to suspend, restrict, or permanently terminate your account at its sole discretion, including in cases where:",
  ),
  _tBulletItem("You violate any provision of these Terms & Conditions."),
  _tBulletItem(
    "Your account is found to be involved in fraudulent, abusive, or harmful activity.",
  ),
  _tBulletItem(
    "Continued access poses a risk to the security or integrity of the application or other users.",
  ),
  _tBodyText(
    "Upon termination, your right to access and use the application will immediately cease. Provisions that by their nature should survive termination will continue to apply.",
  ),
];

List<Widget> _changesContent(ThemeData theme) => [
  _tBodyText(
    "We may update these Terms & Conditions periodically to reflect changes in the application, legal requirements, or our business practices.",
  ),
  _tBodyText(
    "Any changes will be posted within the application with an updated revision date visible at the top of this page.",
  ),
  _tHighlight(
    "Continued use of Paper Trade after updated Terms become effective constitutes your acceptance of the revised Terms. If you do not agree to the updated Terms, please discontinue use of the application.",
  ),
];

List<Widget> _governingLawContent(ThemeData theme) => [
  _tBodyText(
    "These Terms & Conditions and any disputes arising out of or related to the use of Paper Trade shall be governed by and construed in accordance with the laws of India.",
  ),
  _tBodyText(
    "Any legal disputes or claims arising from the use of Paper Trade shall be subject to the exclusive jurisdiction of the competent courts located in India.",
  ),
  _tHighlight(
    "If any provision of these Terms is found to be unlawful or unenforceable under applicable law, that provision will be limited or eliminated to the minimum extent necessary, and the remaining provisions will continue in full force and effect.",
  ),
];
