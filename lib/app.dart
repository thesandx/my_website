import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

@client
class App extends StatelessComponent {
  const App({super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: 'app-container', [
      const HeroSection(),
      const DetailsSection(),
      const TravelSection(),
      const RSVPSection(),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css.import('https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700&family=Lato:wght@300;400&display=swap'),
    css('body').styles(
      margin: Margin.zero,
      padding: Padding.zero,
      backgroundColor: Color('#fafaf9'),
      color: Color('#1f2937'),
      fontFamily: FontFamily.list([FontFamily('sans-serif')]),
    ),
    css('.app-container').styles(
      display: Display.flex,
      flexDirection: FlexDirection.column,
      alignItems: AlignItems.center,
      minHeight: 100.vh,
    ),
    css('h1, h2, h3').styles(
      fontFamily: FontFamily.list([FontFamily('Playfair Display'), FontFamily('serif')]),
      color: Color('#d97706'),
      textAlign: TextAlign.center,
    ),
    css('p').styles(
      fontFamily: FontFamily.list([FontFamily('Lato'), FontFamily('sans-serif')]),
    ),
    css('section').styles(
      width: 100.percent,
      maxWidth: 800.px,
      padding: Padding.all(2.rem),
      boxSizing: BoxSizing.borderBox,
      display: Display.flex,
      flexDirection: FlexDirection.column,
      alignItems: AlignItems.center,
    ),
    css('.hero').styles(
      padding: Padding.only(top: 4.rem, bottom: 4.rem),
    ),
    css('.hero h1').styles(
      fontSize: 3.5.rem,
      margin: Margin.only(top: 1.rem, bottom: 0.5.rem),
    ),
    css('.hero h2').styles(
      fontSize: 1.5.rem,
      fontWeight: FontWeight.w300,
      letterSpacing: 4.px,
      margin: Margin.zero,
    ),
    css('.date-display p').styles(
      fontSize: 2.rem,
      color: Color('#d97706'),
      margin: Margin.only(top: 2.rem),
      fontWeight: FontWeight.bold,
    ),
    css('.separator').styles(
      width: 80.px,
      height: 2.px,
      backgroundColor: Color('#d97706'),
      margin: Margin.only(top: 1.5.rem),
    ),
    css('.cta-button').styles(
      display: Display.inlineBlock,
      margin: Margin.only(top: 1.5.rem),
      padding: Padding.symmetric(vertical: 0.8.rem, horizontal: 2.rem),
      backgroundColor: Color('#d97706'),
      color: Color('#fafaf9'),
      textDecoration: TextDecoration.none,
      radius: BorderRadius.all(Radius.circular(4.px)),
      fontWeight: FontWeight.bold,
    ),
    css('.cta-button:hover').styles(
      backgroundColor: Color('#b45309'),
    ),
    css('.travel-desc').styles(
      margin: Margin.only(bottom: 3.rem),
    ),
    css('.timeline').styles(
      display: Display.flex,
      flexDirection: FlexDirection.row,
      justifyContent: JustifyContent.spaceBetween,
      width: 100.percent,
    ),
    css('.step').styles(
      flex: Flex(grow: 1, shrink: 0),
      display: Display.flex,
      flexDirection: FlexDirection.column,
      alignItems: AlignItems.center,
      textAlign: TextAlign.center,
      padding: Padding.all(1.5.rem),
      backgroundColor: Color('white'),
      radius: BorderRadius.all(Radius.circular(8.px)),
    ),
    css('.step-icon').styles(
      display: Display.flex,
      alignItems: AlignItems.center,
      margin: Margin.only(bottom: 1.rem),
    ),
    css('.step h3').styles(
      margin: Margin.only(bottom: 0.5.rem),
      fontSize: 1.25.rem,
    ),
    css('@media (max-width: 600px)', [
      css('.timeline').styles(
        flexDirection: FlexDirection.column,
      ),
    ]),
    css('.rsvp-button').styles(
      margin: Margin.only(top: 2.rem),
      backgroundColor: Color('#059669'), // WhatsApp secondary green
    ),
    css('.rsvp-button:hover').styles(
      backgroundColor: Color('#047857'),
    ),
  ];
}

class HeroSection extends StatelessComponent {
  const HeroSection({super.key});

  @override
  Component build(BuildContext context) {
    return section(classes: 'hero', [
      div(classes: 'icon-rings', [
        svg(width: 60.px, height: 60.px, viewBox: '0 0 24 24', [
          path([], d: 'M12 2C8.69 2 6 4.69 6 8c0 1.05.27 2.04.75 2.91C4.34 12.15 3 14.91 3 18c0 2.21 1.79 4 4 4s4-1.79 4-4c0-3.09-1.34-5.85-3.75-7.09.48-.87.75-1.86.75-2.91 0-3.31-2.69-6-6-6zm0 2c2.21 0 4 1.79 4 4s-1.79 4-4 4-4-1.79-4-4 1.79-4 4-4zM7 14c2.21 0 4 1.79 4 4s-1.79 4-4 4-4-1.79-4-4 1.79-4 4-4zm10-12c-3.31 0-6 2.69-6 6 0 1.05.27 2.04.75 2.91C9.34 12.15 8 14.91 8 18c0 2.21 1.79 4 4 4s4-1.79 4-4c0-3.09-1.34-5.85-3.75-7.09.48-.87.75-1.86.75-2.91 0-3.31-2.69-6-6-6zm0 2c2.21 0 4 1.79 4 4s-1.79 4-4 4-4-1.79-4-4 1.79-4 4-4zm-5 10c2.21 0 4 1.79 4 4s-1.79 4-4 4-4-1.79-4-4 1.79-4 4-4z', attributes: {'fill': '#d97706'}),
        ]),
      ]),
      h1([text('Anushka & Sandeep')]),
      h2([text('SAVE THE DATE')]),
      div(classes: 'date-display', [
        p([text('09 . 03 . 2026')]),
      ]),
      div(classes: 'separator', []),
    ]);
  }
}

class DetailsSection extends StatelessComponent {
  const DetailsSection({super.key});

  @override
  Component build(BuildContext context) {
    return section(classes: 'details', [
      div(classes: 'icon-calendar', [
        svg(width: 40.px, height: 40.px, viewBox: '0 0 24 24', [
          path([], d: 'M19 4h-1V2h-2v2H8V2H6v2H5c-1.11 0-1.99.9-1.99 2L3 20c0 1.1.89 2 2 2h14c1.1 0 2-.9 2-2V6c0-1.1-.9-2-2-2zm0 16H5V10h14v10zm0-12H5V6h14v2zm-7 5h5v5h-5z', attributes: {'fill': '#d97706'}),
        ]),
      ]),
      h2([text('The Venue')]),
      p([text('Laxmisagar, Darbhanga, Bihar, India')]),
      a(
        classes: 'cta-button',
        href: 'https://www.google.com/maps/search/?api=1&query=Laxmisagar,+Darbhanga',
        target: Target.blank,
        [text('Get Directions')],
      ),
    ]);
  }
}

class TravelSection extends StatelessComponent {
  const TravelSection({super.key});

  @override
  Component build(BuildContext context) {
    return section(classes: 'travel', [
      h2([text('Travel Guide')]),
      p(classes: 'travel-desc', [text('How to reach our celebration')]),
      div(classes: 'timeline', [
        div(classes: 'step', [
          div(classes: 'step-icon', [
            svg(width: 32.px, height: 32.px, viewBox: '0 0 24 24', [
              path([], d: 'M21 16v-2l-8-5V3.5c0-.83-.67-1.5-1.5-1.5S10 2.67 10 3.5V9l-8 5v2l8-2.5V19l-2 1.5V22l3.5-1 3.5 1v-1.5L13 19v-5.5l8 2.5z', attributes: {'fill': '#d97706'}),
            ]),
            span([text(' OR ')]),
            svg(width: 32.px, height: 32.px, viewBox: '0 0 24 24', [
              path([], d: 'M12 2c-4.42 0-8 3.58-8 8v10c0 1.1.9 2 2 2h12c1.1 0 2-.9 2-2V10c0-4.42-3.58-8-8-8zm0 18c-1.1 0-2-.9-2-2s.9-2 2-2 2 .9 2 2-.9 2-2 2zm1-5h-2V5h2v10z', attributes: {'fill': '#d97706'}),
            ]),
          ]),
          h3([text('Step 1: Arrive')]),
          p([text('Darbhanga Airport (DBR) or Darbhanga Junction Railway Station.')]),
        ]),
        div(classes: 'step', [
          div(classes: 'step-icon', [
            svg(width: 32.px, height: 32.px, viewBox: '0 0 24 24', [
              path([], d: 'M18.92 6.01C18.72 5.42 18.16 5 17.5 5h-11c-.66 0-1.21.42-1.42 1.01L3 12v8c0 .55.45 1 1 1h1c.55 0 1-.45 1-1v-1h12v1c0 .55.45 1 1 1h1c.55 0 1-.45 1-1v-8l-2.08-5.99zM6.85 7h10.29l1.04 3H5.81l1.04-3zM19 17H5v-5h14v5z', attributes: {'fill': '#d97706'}),
            ]),
          ]),
          h3([text('Step 2: Transit')]),
          p([text('Take a taxi or auto-rickshaw directly to Laxmisagar.')]),
        ]),
      ]),
    ]);
  }
}

class RSVPSection extends StatelessComponent {
  const RSVPSection({super.key});

  @override
  Component build(BuildContext context) {
    return section(classes: 'rsvp', [
      h2([text('RSVP')]),
      p([text('We would love to have you with us.')]),
      a(
        classes: 'cta-button rsvp-button',
        href: 'https://wa.me/918709328224?text=Hi%20Sandeep,%20I%20will%20be%20attending%20the%20wedding!',
        target: Target.blank,
        [text('Confirm Presence via WhatsApp')],
      ),
      div(styles: Styles(height: 4.rem), []),
    ]);
  }
}
