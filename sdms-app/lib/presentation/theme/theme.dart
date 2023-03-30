part of main;

/// The [SdmsText] extension
///
/// Declared outside of [_theme] so it can be referenced
const SdmsText _sdmsText = SdmsText();

/// The Default Theme for the App; accessed via Theme.of(context)
ThemeData get _theme => ThemeData(
      // Theme extensions, accessible via `Theme.of(context).extension<FooClass>()!;`
      extensions: const <ThemeExtension<dynamic>>[
        _sdmsText,
      ],
      // The default color of the [Material] that underlies the [Scaffold]
      scaffoldBackgroundColor: ConstColors.lightBlue,
      // The default [TextField] or [TextFormField] style. 14pt label, rounded
      // stroke on the border, no color change on selected / unselected.
      inputDecorationTheme: InputDecorationTheme(
        fillColor: Colors.white,
        filled: true,
        labelStyle: const TextStyle(fontSize: 14),
        contentPadding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: ConstColors.darkBlue,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: ConstColors.yellow,
          ),
        ),
      ),
    );
