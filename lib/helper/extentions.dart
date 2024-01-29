import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension ContextExtensions on BuildContext {
  AppLocalizations get loc {
    final localizations = AppLocalizations.of(this);
    assert(localizations != null, 'No AppLocalizations found in the context');
    return localizations!;
  }
}
