
import 'package:flutter/material.dart';

class StepProgressHeader extends StatelessWidget {
  final int current; // 1‑based
  final List<IconData> icons;

  /// Colors
  final Color doneColor; // completed steps
  final Color activeColor; // current step
  final Color pendingOutline; // outline for future steps
  final Color doneConnector; // connector between two completed
  final Color activeConnector; // connector into the current step
  final Color pendingConnector; // connector into future steps
  final Color textColor;

  const StepProgressHeader({
    super.key,
    required this.current,
    required this.icons,
    this.doneColor = const Color(0xFF2EAF5F), // green
    this.activeColor = const Color(0xFF4285F4), // blue
    this.pendingOutline = const Color(0xFFB0BEC5), // grey
    this.doneConnector = const Color(0xFF2EAF5F),
    this.activeConnector = const Color(0xFF4285F4),
    this.pendingConnector = const Color(0x33FFFFFF), // faint on dark appbar
    this.textColor = Colors.white70,
  });

  @override
  Widget build(BuildContext context) {
    final total = icons.isEmpty ? 1 : icons.length;
    final safeCurrent = current.clamp(1, total); // 1..total
    final pct = safeCurrent / total;

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 6, 20, 12),
      child: Column(
        children: [
          Text(
            'Step $safeCurrent of $total • ${(pct * 100).round()}% Complete',
            style: TextStyle(color: textColor),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              for (int i = 0; i < total; i++) ...[
                _StepDot(
                  icon: icons[i],
                  state: i < safeCurrent - 1
                      ? _StepState.done
                      : (i == safeCurrent - 1
                          ? _StepState.active
                          : _StepState.pending),
                  doneColor: doneColor,
                  activeColor: activeColor,
                  pendingOutline: pendingOutline,
                ),
                if (i != total - 1)
                  Expanded(
                    child: _ConnectorBar(
                      index: i,
                      currentIndex: safeCurrent - 1,
                      done: doneConnector,
                      active: activeConnector,
                      pending: pendingConnector,
                    ),
                  ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

enum _StepState { pending, active, done }

class _StepDot extends StatelessWidget {
  final IconData icon;
  final _StepState state;
  final Color doneColor;
  final Color activeColor;
  final Color pendingOutline;

  const _StepDot({
    required this.icon,
    required this.state,
    required this.doneColor,
    required this.activeColor,
    required this.pendingOutline,
  });

  @override
  Widget build(BuildContext context) {
    final Color bg = switch (state) {
      _StepState.done => doneColor,
      _StepState.active => activeColor,
      _ => Colors.transparent,
    };
    final Color border = switch (state) {
      _StepState.pending => pendingOutline,
      _ => bg,
    };
    final Color iconColor =
        state == _StepState.pending ? pendingOutline : Colors.white;

    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: bg,
        shape: BoxShape.circle,
        border: Border.all(color: border, width: 3),
        boxShadow: bg == Colors.transparent
            ? null
            : [BoxShadow(color: Colors.black.withValues(alpha: 0.10), blurRadius: 6)],
      ),
      child: Icon(icon, color: iconColor, size: 22),
    );
  }
}

class _ConnectorBar extends StatelessWidget {
  final int index;
  final int currentIndex; // 0‑based current
  final Color done;
  final Color active;
  final Color pending;

  const _ConnectorBar({
    required this.index,
    required this.currentIndex,
    required this.done,
    required this.active,
    required this.pending,
  });

  @override
  Widget build(BuildContext context) {
    // between i and i+1
    final Color color = index < currentIndex - 0
        ? done // both sides completed -> green
        : (index == currentIndex // into the current -> blue
            ? active
            : pending); // future
    return Container(
      height: 4,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
