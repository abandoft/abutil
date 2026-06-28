import 'package:abutil/abutil.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('platform helpers', () {
    test('getPlatform returns a known enum value', () {
      expect(PlatformType.values, contains(getPlatform()));
    });

    test('category helpers are mutually consistent', () {
      expect(isMobile(), getPlatform().isMobile);
      expect(isDesktop(), getPlatform().isDesktop);
      expect(isWeb(), getPlatform() == PlatformType.web);
    });
  });

  group('update helpers', () {
    test('detects newer versions', () {
      expect(hasUpdate(1, 2), isTrue);
      expect(hasUpdate(2, 2), isFalse);
    });

    test('detects stale update timestamps', () {
      final DateTime now = DateTime(2026, 6, 28);

      expect(mustUpdate('', '2026-01-01', now: now), isTrue);
      expect(mustUpdate('2026-06-01', '2026-01-01', now: now), isTrue);
      expect(mustUpdate('2026-06-01', '2026-04-01', now: now), isFalse);
      expect(
        mustUpdate(
          DateTime(2026, 6, 1),
          DateTime(2026, 1, 1),
          now: now,
        ),
        isTrue,
      );
    });

    test('invalid update timestamps do not throw', () {
      expect(mustUpdate('', 'not-a-date'), isFalse);
      expect(mustUpdate('not-a-date', 'also-not-a-date'), isFalse);
    });
  });

  group('Reboot', () {
    testWidgets('maybeBegin returns false without ancestor', (tester) async {
      late BuildContext capturedContext;
      await tester.pumpWidget(
        Builder(
          builder: (context) {
            capturedContext = context;
            return const SizedBox();
          },
        ),
      );

      expect(Reboot.maybeBegin(capturedContext), isFalse);
    });

    testWidgets('begin rebuilds the child subtree', (tester) async {
      int buildCount = 0;
      late BuildContext capturedContext;

      await tester.pumpWidget(
        Reboot(
          child: Builder(
            builder: (context) {
              capturedContext = context;
              buildCount += 1;
              return const SizedBox();
            },
          ),
        ),
      );

      expect(buildCount, 1);
      Reboot.begin(capturedContext);
      await tester.pump();
      expect(buildCount, 2);
    });
  });
}
