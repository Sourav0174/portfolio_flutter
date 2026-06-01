import 'package:flutter/material.dart';
import 'package:portfolio/app/helpers/constants/app_colors.dart';

class PrivacyPolicyView extends StatelessWidget {
  const PrivacyPolicyView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isWide = MediaQuery.of(context).size.width > 1200;

    return Scaffold(
      backgroundColor: AppColors.dawnPink,
      appBar: AppBar(
        title: Text(
          "Paper Trading",
          style: theme.textTheme.titleMedium?.copyWith(
            color: AppColors.limedSpruce.withOpacity(.55),
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: AppColors.dawnPink.withOpacity(.92),
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            decoration: const BoxDecoration(
              color: AppColors.limedSpruce,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.arrow_back_rounded,
              color: AppColors.dawnPink,
              size: 20,
            ),
          ),
        ),
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
                color: AppColors.talipTree.withOpacity(.09),
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
                color: AppColors.redDamask.withOpacity(.06),
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
                    _HeroSection(theme: theme),

                    const SizedBox(height: 20),

                    // ── Stats Strip ───────────────────────────────────────
                    const _StatsStrip(),

                    const SizedBox(height: 20),

                    // ── Introduction ──────────────────────────────────────
                    _PolicyAccordion(
                      sectionLabel: "Intro",
                      title: "Introduction",
                      initiallyOpen: true,
                      content: _introContent(),
                    ),

                    // ── Section 1 ─────────────────────────────────────────
                    _PolicyAccordion(
                      sectionLabel: "01",
                      title: "Information We Collect",
                      content: _collectContent(),
                    ),

                    // ── Section 2 ─────────────────────────────────────────
                    _PolicyAccordion(
                      sectionLabel: "02",
                      title: "How We Use Your Information",
                      content: _useContent(),
                    ),

                    // ── Disclaimer Banner (Section 3) ─────────────────────
                    const _DisclaimerBanner(),

                    const SizedBox(height: 16),

                    // ── Section 4 ─────────────────────────────────────────
                    _PolicyAccordion(
                      sectionLabel: "04",
                      title: "Data Security",
                      content: _securityContent(),
                    ),

                    // ── Section 5 ─────────────────────────────────────────
                    _PolicyAccordion(
                      sectionLabel: "05",
                      title: "Third-Party Services",
                      content: _thirdPartyContent(),
                    ),

                    // ── Section 6 ─────────────────────────────────────────
                    _PolicyAccordion(
                      sectionLabel: "06",
                      title: "Data Retention",
                      content: _retentionContent(),
                    ),

                    // ── Section 7 ─────────────────────────────────────────
                    _PolicyAccordion(
                      sectionLabel: "07",
                      title: "Children's Privacy",
                      content: _childrenContent(),
                    ),

                    // ── Section 8 ─────────────────────────────────────────
                    _PolicyAccordion(
                      sectionLabel: "08",
                      title: "Changes to This Policy",
                      content: _changesContent(),
                    ),

                    const SizedBox(height: 8),

                    // ── Contact Card ──────────────────────────────────────
                    _ContactCard(theme: theme),

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

class _HeroSection extends StatelessWidget {
  final ThemeData theme;
  const _HeroSection({required this.theme});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(36),
      decoration: BoxDecoration(
        color: AppColors.limedSpruce,
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
                color: AppColors.talipTree.withOpacity(.1),
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
                        color: AppColors.limedSpruce.withOpacity(.5),
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
                "Privacy\nPolicy",
                style: theme.textTheme.displayLarge?.copyWith(
                  color: AppColors.dawnPink,
                  height: 1.1,
                  letterSpacing: -0.5,
                ),
              ),

              const SizedBox(height: 16),

              Text(
                "Your privacy matters to us. Learn how Paper Trading collects, uses, stores, and protects your information while using our platform.",
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

class _StatsStrip extends StatelessWidget {
  const _StatsStrip();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _StatCard(value: "8", label: "Sections"),
        const SizedBox(width: 12),
        _StatCard(value: "0", label: "Ads or Tracking"),
        const SizedBox(width: 12),
        _StatCard(value: "🔒", label: "Your Data", isEmoji: true),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final String value;
  final String label;
  final bool isEmoji;

  const _StatCard({
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
// ACCORDION
// ─────────────────────────────────────────────────────────────────────────────

class _PolicyAccordion extends StatefulWidget {
  final String sectionLabel;
  final String title;
  final List<Widget> content;
  final bool initiallyOpen;

  const _PolicyAccordion({
    required this.sectionLabel,
    required this.title,
    required this.content,
    this.initiallyOpen = false,
  });

  @override
  State<_PolicyAccordion> createState() => _PolicyAccordionState();
}

class _PolicyAccordionState extends State<_PolicyAccordion>
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
                ? AppColors.talipTree.withOpacity(.35)
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
                      color: AppColors.redDamask,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  const SizedBox(width: 14),

                  // Number badge
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppColors.limedSpruce.withOpacity(.07),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      widget.sectionLabel,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                        color: AppColors.limedSpruce,
                      ),
                    ),
                  ),
                  const SizedBox(width: 14),

                  Expanded(
                    child: Text(
                      widget.title,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: AppColors.limedSpruce,
                      ),
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
                              ? AppColors.talipTree
                              : AppColors.limedSpruce.withOpacity(.07),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          size: 20,
                          color: _open
                              ? const Color(0xFF2a1f00)
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
                    indent: 0,
                    endIndent: 0,
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
// DISCLAIMER BANNER
// ─────────────────────────────────────────────────────────────────────────────

class _DisclaimerBanner extends StatelessWidget {
  const _DisclaimerBanner();

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
              Icons.info_outline_rounded,
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
                  "PAPER TRADING DISCLAIMER",
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                    color: AppColors.redDamask,
                    letterSpacing: 0.7,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  "This is a simulation platform for learning and practice only. No real money, securities, stocks, or financial instruments are bought or sold. All trades, profits, and portfolio values are entirely virtual and do not constitute financial advice.",
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
// CONTACT CARD
// ─────────────────────────────────────────────────────────────────────────────

class _ContactCard extends StatelessWidget {
  final ThemeData theme;
  const _ContactCard({required this.theme});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.spectra, AppColors.limedSpruce],
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
                  "Need Help?",
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
                "Reach Out to Us",
                style: theme.textTheme.headlineMedium?.copyWith(
                  color: AppColors.dawnPink,
                  letterSpacing: -0.3,
                ),
              ),

              const SizedBox(height: 12),

              Text(
                "If you have any questions regarding this Privacy Policy, your account data, or would like to request account-related assistance, feel free to contact us.",
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: AppColors.dawnPink.withOpacity(.75),
                  height: 1.7,
                ),
              ),

              const SizedBox(height: 26),

              // Name row
              _ContactRow(
                icon: Icons.person_outline_rounded,
                primary: "Sourav Kumar",
                secondary: "Developer & Owner",
              ),

              const SizedBox(height: 14),

              // Email row
              _ContactRow(
                icon: Icons.email_outlined,
                primary: "sourav174@gmail.com",
                secondary: "For privacy-related inquiries",
                selectable: true,
              ),

              const SizedBox(height: 22),

              Divider(color: AppColors.dawnPink.withOpacity(.12), height: 1),

              const SizedBox(height: 16),

              Text(
                "We aim to respond to privacy-related inquiries as soon as reasonably possible.",
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

class _ContactRow extends StatelessWidget {
  final IconData icon;
  final String primary;
  final String secondary;
  final bool selectable;

  const _ContactRow({
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

Widget _bodyText(String text) => Padding(
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

Widget _bulletItem(String text) => Padding(
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
            color: AppColors.talipTree,
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

Widget _highlight(String text) => Container(
  margin: const EdgeInsets.only(top: 10),
  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
  decoration: BoxDecoration(
    color: AppColors.limedSpruce.withOpacity(.06),
    borderRadius: BorderRadius.circular(10),
  ),
  child: Text(
    text,
    style: const TextStyle(
      fontSize: 14,
      height: 1.65,
      color: AppColors.limedSpruce,
      fontWeight: FontWeight.w600,
    ),
  ),
);

// ── Content lists ────────────────────────────────────────────────────────────

List<Widget> _introContent() => [
  _bodyText("Welcome to Paper Trading."),
  _bodyText(
    "Paper Trading is a virtual stock market simulation platform designed for educational and practice purposes. This Privacy Policy explains how we collect, use, and protect your information when you use our application.",
  ),
  _bodyText(
    "By creating an account or using Paper Trading, you agree to the collection and use of information in accordance with this Privacy Policy.",
  ),
];

List<Widget> _collectContent() => [
  _bodyText("When you create an account, we may collect:"),
  _bulletItem("Full Name"),
  _bulletItem("Email Address"),
  _bulletItem("Password"),
  _bodyText(
    "Your password is stored securely using industry-standard security practices and is never stored in plain text.",
  ),
  _bodyText("We also store information related to your activity:"),
  _bulletItem("Virtual trading transactions"),
  _bulletItem("Portfolio holdings"),
  _bulletItem("Watchlists"),
  _bulletItem("Trading history"),
  _bulletItem("Account preferences"),
];

List<Widget> _useContent() => [
  _bodyText("We use the information we collect to:"),
  _bulletItem("Create and manage your account"),
  _bulletItem("Authenticate and secure user access"),
  _bulletItem("Maintain your virtual portfolio and trading history"),
  _bulletItem("Provide customer support"),
  _bulletItem("Improve application functionality and performance"),
  _bulletItem("Detect and prevent unauthorized access or misuse"),
  _highlight(
    "We do not sell, rent, or trade your personal information to third parties.",
  ),
];

List<Widget> _securityContent() => [
  _bodyText(
    "We take reasonable measures to protect your information from unauthorized access, disclosure, alteration, or destruction.",
  ),
  _bodyText(
    "However, no method of electronic transmission or storage is completely secure, and we cannot guarantee absolute security.",
  ),
];

List<Widget> _thirdPartyContent() => [
  _bodyText(
    "Paper Trading may use trusted third-party services to support application functionality, including:",
  ),
  _bulletItem("Authentication services"),
  _bulletItem("Cloud hosting services"),
  _bulletItem("Analytics and monitoring services"),
  _bodyText(
    "These services may process information only as necessary to provide their functionality.",
  ),
];

List<Widget> _retentionContent() => [
  _bodyText(
    "We retain your account information and trading records for as long as your account remains active.",
  ),
  _bodyText(
    "If you request deletion of your account, we will make reasonable efforts to remove your personal information from our systems, subject to technical, operational, and legal requirements.",
  ),
];

List<Widget> _childrenContent() => [
  _bodyText(
    "Paper Trading is not intended for children under 13 years of age.",
  ),
  _bodyText(
    "We do not knowingly collect personal information from children under 13. If we become aware that such information has been collected, we will take appropriate steps to remove it.",
  ),
];

List<Widget> _changesContent() => [
  _bodyText("We may update this Privacy Policy from time to time."),
  _bodyText(
    "Any changes will be posted on this page with an updated revision date. Continued use of the application after changes become effective constitutes acceptance of the revised Privacy Policy.",
  ),
];
