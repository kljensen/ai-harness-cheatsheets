// Shared cheatsheet template library
// Dense, colorful, printable US Letter landscape

// ─── Theme Tokens ────────────────────────────────────────────────
#let themes = (
  classic: (
    name: "Classic",
    ui: (
      paper:          white,
      text-primary:   rgb("#1F2937"),
      text-muted:     rgb("#5F6B7A"),
      text-subtle:    rgb("#6B7280"),
      text-path:      rgb("#334155"),
      text-footer:    rgb("#9CA3AF"),
      surface-keycap: rgb("#F3F4F6"),
      border-keycap:  rgb("#D1D5DB"),
      surface-code:   rgb("#F8FAFC"),
      header-text:    white,
    ),
    accent: (
      blue:     rgb("#2563EB"),
      indigo:   rgb("#4F46E5"),
      violet:   rgb("#7C3AED"),
      purple:   rgb("#9333EA"),
      pink:     rgb("#DB2777"),
      rose:     rgb("#E11D48"),
      orange:   rgb("#EA580C"),
      amber:    rgb("#D97706"),
      emerald:  rgb("#059669"),
      teal:     rgb("#0D9488"),
      cyan:     rgb("#0891B2"),
      slate:    rgb("#475569"),
    ),
    tint: (
      blue:     rgb("#EFF6FF"),
      indigo:   rgb("#EEF2FF"),
      violet:   rgb("#F5F3FF"),
      purple:   rgb("#FAF5FF"),
      pink:     rgb("#FDF2F8"),
      rose:     rgb("#FFF1F2"),
      orange:   rgb("#FFF7ED"),
      amber:    rgb("#FFFBEB"),
      emerald:  rgb("#ECFDF5"),
      teal:     rgb("#F0FDFA"),
      cyan:     rgb("#ECFEFF"),
      slate:    rgb("#F8FAFC"),
    ),
  ),

  open_sorbet: (
    name: "Open Sorbet",
    ui: (
      paper:          white,
      text-primary:   rgb("#212529"),
      text-muted:     rgb("#495057"),
      text-subtle:    rgb("#6C757D"),
      text-path:      rgb("#343A40"),
      text-footer:    rgb("#868E96"),
      surface-keycap: rgb("#F1F3F5"),
      border-keycap:  rgb("#DEE2E6"),
      surface-code:   rgb("#F8F9FA"),
      header-text:    rgb("#1F2937"),
    ),
    accent: (
      blue:     rgb("#A5D8FF"),
      indigo:   rgb("#D0BFFF"),
      violet:   rgb("#E5DBFF"),
      purple:   rgb("#EEBEFA"),
      pink:     rgb("#FFC9C9"),
      rose:     rgb("#FFA8A8"),
      orange:   rgb("#FFD8A8"),
      amber:    rgb("#FFEC99"),
      emerald:  rgb("#B2F2BB"),
      teal:     rgb("#96F2D7"),
      cyan:     rgb("#99E9F2"),
      slate:    rgb("#DEE2E6"),
    ),
    tint: (
      blue:     rgb("#E7F5FF"),
      indigo:   rgb("#F3F0FF"),
      violet:   rgb("#F8F0FC"),
      purple:   rgb("#FAF0FF"),
      pink:     rgb("#FFF0F6"),
      rose:     rgb("#FFF5F5"),
      orange:   rgb("#FFF4E6"),
      amber:    rgb("#FFF9DB"),
      emerald:  rgb("#EBFBEE"),
      teal:     rgb("#E6FCF5"),
      cyan:     rgb("#E3FAFC"),
      slate:    rgb("#F8F9FA"),
    ),
  ),

  radix_gentle: (
    name: "Radix Gentle",
    ui: (
      paper:          white,
      text-primary:   rgb("#1C2024"),
      text-muted:     rgb("#60646C"),
      text-subtle:    rgb("#80838D"),
      text-path:      rgb("#60646C"),
      text-footer:    rgb("#8B8D98"),
      surface-keycap: rgb("#F4F4F6"),
      border-keycap:  rgb("#DADCE2"),
      surface-code:   rgb("#F8F8FA"),
      header-text:    rgb("#1F2937"),
    ),
    accent: (
      blue:     rgb("#8DA4EF"),
      indigo:   rgb("#6E56CF"),
      violet:   rgb("#9B9EF0"),
      purple:   rgb("#CF91D8"),
      pink:     rgb("#DD93C2"),
      rose:     rgb("#E592A3"),
      orange:   rgb("#EC9455"),
      amber:    rgb("#FFC53D"),
      emerald:  rgb("#65BA74"),
      teal:     rgb("#56BA9F"),
      cyan:     rgb("#60B3D7"),
      slate:    rgb("#B9BBC6"),
    ),
    tint: (
      blue:     rgb("#EDF2FE"),
      indigo:   rgb("#F4F0FE"),
      violet:   rgb("#F0F1FE"),
      purple:   rgb("#FBEBFB"),
      pink:     rgb("#FEE9F5"),
      rose:     rgb("#FEEAED"),
      orange:   rgb("#FFEFD6"),
      amber:    rgb("#FFF7C2"),
      emerald:  rgb("#E9F6E9"),
      teal:     rgb("#E6F7ED"),
      cyan:     rgb("#E1F6FD"),
      slate:    rgb("#F0F0F3"),
    ),
  ),

  pastel_blossom: (
    name: "Pastel Blossom",
    ui: (
      paper:          white,
      text-primary:   rgb("#2F2A36"),
      text-muted:     rgb("#5E556B"),
      text-subtle:    rgb("#7B7389"),
      text-path:      rgb("#433A50"),
      text-footer:    rgb("#948BA4"),
      surface-keycap: rgb("#F9F4FA"),
      border-keycap:  rgb("#E4DAE8"),
      surface-code:   rgb("#FDF9FD"),
      header-text:    rgb("#312A3B"),
    ),
    accent: (
      blue:     rgb("#BFD7FF"),
      indigo:   rgb("#CFC8FF"),
      violet:   rgb("#E2D4FF"),
      purple:   rgb("#EFCBFF"),
      pink:     rgb("#F8CDE8"),
      rose:     rgb("#FFC9D6"),
      orange:   rgb("#FFD9B8"),
      amber:    rgb("#FFECAA"),
      emerald:  rgb("#CDEFC9"),
      teal:     rgb("#C3EFE4"),
      cyan:     rgb("#C7ECFF"),
      slate:    rgb("#DFE2EA"),
    ),
    tint: (
      blue:     rgb("#EEF5FF"),
      indigo:   rgb("#F2EFFF"),
      violet:   rgb("#F7F1FF"),
      purple:   rgb("#FBF1FF"),
      pink:     rgb("#FFF2FA"),
      rose:     rgb("#FFF1F5"),
      orange:   rgb("#FFF4EA"),
      amber:    rgb("#FFF9E6"),
      emerald:  rgb("#F0FBEF"),
      teal:     rgb("#ECFBF7"),
      cyan:     rgb("#EDF9FF"),
      slate:    rgb("#F5F6FA"),
    ),
  ),

  mint_latte: (
    name: "Mint Latte",
    ui: (
      paper:          white,
      text-primary:   rgb("#22312B"),
      text-muted:     rgb("#4C5F57"),
      text-subtle:    rgb("#6B7D75"),
      text-path:      rgb("#334940"),
      text-footer:    rgb("#8AA097"),
      surface-keycap: rgb("#F1F7F4"),
      border-keycap:  rgb("#D5E4DD"),
      surface-code:   rgb("#F6FBF8"),
      header-text:    rgb("#203128"),
    ),
    accent: (
      blue:     rgb("#B8DDF5"),
      indigo:   rgb("#C8D3F4"),
      violet:   rgb("#DCCDF2"),
      purple:   rgb("#E8CFEA"),
      pink:     rgb("#F3D0DC"),
      rose:     rgb("#F5CABF"),
      orange:   rgb("#F6D7B8"),
      amber:    rgb("#F4E3AE"),
      emerald:  rgb("#BFE4C7"),
      teal:     rgb("#BEE7DE"),
      cyan:     rgb("#BEE3EB"),
      slate:    rgb("#D8DFDC"),
    ),
    tint: (
      blue:     rgb("#EEF6FC"),
      indigo:   rgb("#F1F4FC"),
      violet:   rgb("#F6F2FB"),
      purple:   rgb("#FAF3FA"),
      pink:     rgb("#FCF3F7"),
      rose:     rgb("#FDF4F1"),
      orange:   rgb("#FDF6EE"),
      amber:    rgb("#FCF9ED"),
      emerald:  rgb("#EFF8F1"),
      teal:     rgb("#EDF9F6"),
      cyan:     rgb("#EDF8FA"),
      slate:    rgb("#F3F6F4"),
    ),
  ),

  nord_soft: (
    name: "Nord Soft",
    ui: (
      paper:          white,
      text-primary:   rgb("#2E3440"),
      text-muted:     rgb("#4C566A"),
      text-subtle:    rgb("#5F6C82"),
      text-path:      rgb("#3B4252"),
      text-footer:    rgb("#7F8CA3"),
      surface-keycap: rgb("#E5E9F0"),
      border-keycap:  rgb("#D8DEE9"),
      surface-code:   rgb("#EEF2F7"),
      header-text:    rgb("#24303E"),
    ),
    accent: (
      blue:     rgb("#81A1C1"),
      indigo:   rgb("#5E81AC"),
      violet:   rgb("#B48EAD"),
      purple:   rgb("#A78EBE"),
      pink:     rgb("#BF7A88"),
      rose:     rgb("#D08770"),
      orange:   rgb("#D9A074"),
      amber:    rgb("#EBCB8B"),
      emerald:  rgb("#A3BE8C"),
      teal:     rgb("#8FBCBB"),
      cyan:     rgb("#88C0D0"),
      slate:    rgb("#D8DEE9"),
    ),
    tint: (
      blue:     rgb("#E8EDF4"),
      indigo:   rgb("#E4EBF3"),
      violet:   rgb("#EEE8F2"),
      purple:   rgb("#F1ECF4"),
      pink:     rgb("#F5EBEE"),
      rose:     rgb("#F7EEE9"),
      orange:   rgb("#F7F0EA"),
      amber:    rgb("#F8F4E8"),
      emerald:  rgb("#EEF4EA"),
      teal:     rgb("#EAF4F4"),
      cyan:     rgb("#E9F4F7"),
      slate:    rgb("#F1F4F8"),
    ),
  ),

  catppuccin_latte_soft: (
    name: "Catppuccin Latte Soft",
    ui: (
      paper:          white,
      text-primary:   rgb("#4C4F69"),
      text-muted:     rgb("#5C5F77"),
      text-subtle:    rgb("#6C6F85"),
      text-path:      rgb("#43465E"),
      text-footer:    rgb("#8C8FA1"),
      surface-keycap: rgb("#E6E9EF"),
      border-keycap:  rgb("#DCE0E8"),
      surface-code:   rgb("#F5F7FA"),
      header-text:    rgb("#3F4159"),
    ),
    accent: (
      blue:     rgb("#7287FD"),
      indigo:   rgb("#1E66F5"),
      violet:   rgb("#8839EF"),
      purple:   rgb("#EA76CB"),
      pink:     rgb("#DD7878"),
      rose:     rgb("#DC8A78"),
      orange:   rgb("#FE640B"),
      amber:    rgb("#DF8E1D"),
      emerald:  rgb("#40A02B"),
      teal:     rgb("#179299"),
      cyan:     rgb("#04A5E5"),
      slate:    rgb("#BCC1CF"),
    ),
    tint: (
      blue:     rgb("#EAEFFF"),
      indigo:   rgb("#E8EEFF"),
      violet:   rgb("#F0E9FF"),
      purple:   rgb("#FBEFFC"),
      pink:     rgb("#FCEEEF"),
      rose:     rgb("#FDF0EE"),
      orange:   rgb("#FEF1E8"),
      amber:    rgb("#FCF4E9"),
      emerald:  rgb("#EEF7EB"),
      teal:     rgb("#EAF6F6"),
      cyan:     rgb("#E8F6FD"),
      slate:    rgb("#F3F5F8"),
    ),
  ),

  lavender_mist: (
    name: "Lavender Mist",
    ui: (
      paper:          white,
      text-primary:   rgb("#2F2B3A"),
      text-muted:     rgb("#59526B"),
      text-subtle:    rgb("#776F89"),
      text-path:      rgb("#423D52"),
      text-footer:    rgb("#9088A1"),
      surface-keycap: rgb("#F4F2FA"),
      border-keycap:  rgb("#E2DFF0"),
      surface-code:   rgb("#FAF8FF"),
      header-text:    rgb("#302C3D"),
    ),
    accent: (
      blue:     rgb("#C5D6FF"),
      indigo:   rgb("#CFCBFF"),
      violet:   rgb("#DCCBFF"),
      purple:   rgb("#E8CCFF"),
      pink:     rgb("#F2CFEF"),
      rose:     rgb("#F8CFDD"),
      orange:   rgb("#F8D8C2"),
      amber:    rgb("#F6E6BC"),
      emerald:  rgb("#D3EECB"),
      teal:     rgb("#CBEDE4"),
      cyan:     rgb("#CBE9F8"),
      slate:    rgb("#DFE0EA"),
    ),
    tint: (
      blue:     rgb("#EEF3FF"),
      indigo:   rgb("#F1EFFF"),
      violet:   rgb("#F5F0FF"),
      purple:   rgb("#FAF0FF"),
      pink:     rgb("#FCF1FB"),
      rose:     rgb("#FDF1F7"),
      orange:   rgb("#FDF4EE"),
      amber:    rgb("#FCF8ED"),
      emerald:  rgb("#F1F9EE"),
      teal:     rgb("#EEF9F6"),
      cyan:     rgb("#EEF8FC"),
      slate:    rgb("#F5F6FA"),
    ),
  ),

  paper_garden: (
    name: "Paper Garden",
    ui: (
      paper:          white,
      text-primary:   rgb("#2F352E"),
      text-muted:     rgb("#5A6558"),
      text-subtle:    rgb("#788073"),
      text-path:      rgb("#434A40"),
      text-footer:    rgb("#90998A"),
      surface-keycap: rgb("#F4F6EF"),
      border-keycap:  rgb("#E0E5D8"),
      surface-code:   rgb("#F9FAF4"),
      header-text:    rgb("#30372E"),
    ),
    accent: (
      blue:     rgb("#BCD5E7"),
      indigo:   rgb("#C8CCE7"),
      violet:   rgb("#D8CCE4"),
      purple:   rgb("#E5CEE3"),
      pink:     rgb("#F0D2DF"),
      rose:     rgb("#F4D1CC"),
      orange:   rgb("#F6DEC4"),
      amber:    rgb("#F4E7BD"),
      emerald:  rgb("#CFE5C7"),
      teal:     rgb("#CAE6D9"),
      cyan:     rgb("#C7E2E9"),
      slate:    rgb("#D9DED6"),
    ),
    tint: (
      blue:     rgb("#EEF4F8"),
      indigo:   rgb("#F1F2F8"),
      violet:   rgb("#F5F2F7"),
      purple:   rgb("#F8F3F8"),
      pink:     rgb("#FBF3F7"),
      rose:     rgb("#FBF3F1"),
      orange:   rgb("#FCF6F0"),
      amber:    rgb("#FBF8EF"),
      emerald:  rgb("#F1F7EF"),
      teal:     rgb("#EEF8F4"),
      cyan:     rgb("#EEF7F9"),
      slate:    rgb("#F4F6F2"),
    ),
  ),

  sunrise_chalk: (
    name: "Sunrise Chalk",
    ui: (
      paper:          white,
      text-primary:   rgb("#322C28"),
      text-muted:     rgb("#625550"),
      text-subtle:    rgb("#84766F"),
      text-path:      rgb("#4A3F3A"),
      text-footer:    rgb("#9C8F88"),
      surface-keycap: rgb("#FAF4ED"),
      border-keycap:  rgb("#EBDCCD"),
      surface-code:   rgb("#FFF8F2"),
      header-text:    rgb("#3A312D"),
    ),
    accent: (
      blue:     rgb("#C7DDF1"),
      indigo:   rgb("#D4D1EF"),
      violet:   rgb("#E2D1EF"),
      purple:   rgb("#ECCFE8"),
      pink:     rgb("#F5CEDD"),
      rose:     rgb("#F9CEC8"),
      orange:   rgb("#F8D9BF"),
      amber:    rgb("#F6E7B5"),
      emerald:  rgb("#D7E8C7"),
      teal:     rgb("#D0E9DE"),
      cyan:     rgb("#CCE6ED"),
      slate:    rgb("#E2DED7"),
    ),
    tint: (
      blue:     rgb("#F0F6FA"),
      indigo:   rgb("#F3F2FA"),
      violet:   rgb("#F7F2FA"),
      purple:   rgb("#FAF2F8"),
      pink:     rgb("#FCF2F7"),
      rose:     rgb("#FDF2F2"),
      orange:   rgb("#FCF5EF"),
      amber:    rgb("#FCF9ED"),
      emerald:  rgb("#F3F8EE"),
      teal:     rgb("#EFF9F5"),
      cyan:     rgb("#EEF8FA"),
      slate:    rgb("#F6F4F1"),
    ),
  ),

  dusty_ocean: (
    name: "Dusty Ocean",
    ui: (
      paper:          white,
      text-primary:   rgb("#26343A"),
      text-muted:     rgb("#4F626B"),
      text-subtle:    rgb("#6F8088"),
      text-path:      rgb("#384A52"),
      text-footer:    rgb("#899AA2"),
      surface-keycap: rgb("#EFF5F7"),
      border-keycap:  rgb("#D6E2E6"),
      surface-code:   rgb("#F4FAFC"),
      header-text:    rgb("#25363E"),
    ),
    accent: (
      blue:     rgb("#BDD8E8"),
      indigo:   rgb("#C8D1E8"),
      violet:   rgb("#D7D1E6"),
      purple:   rgb("#E2D2E2"),
      pink:     rgb("#EFD2DF"),
      rose:     rgb("#F1D3D2"),
      orange:   rgb("#F0DBC8"),
      amber:    rgb("#ECE3C2"),
      emerald:  rgb("#CFE3D0"),
      teal:     rgb("#C8E3DD"),
      cyan:     rgb("#C7E0E6"),
      slate:    rgb("#D9E0E3"),
    ),
    tint: (
      blue:     rgb("#EEF5F9"),
      indigo:   rgb("#F1F3F9"),
      violet:   rgb("#F5F3F8"),
      purple:   rgb("#F8F3F8"),
      pink:     rgb("#FBF3F8"),
      rose:     rgb("#FBF4F4"),
      orange:   rgb("#FBF6F1"),
      amber:    rgb("#F9F8F0"),
      emerald:  rgb("#F1F7F2"),
      teal:     rgb("#EEF8F5"),
      cyan:     rgb("#EEF7F9"),
      slate:    rgb("#F3F6F7"),
    ),
  ),
  // ─── New Anti-Easter Themes ─────────────────────────────────────

  tailwind_pro: (
    name: "Tailwind Professional",
    ui: (
      paper:          white,
      text-primary:   rgb("#1F2937"),
      text-muted:     rgb("#5F6B7A"),
      text-subtle:    rgb("#6B7280"),
      text-path:      rgb("#334155"),
      text-footer:    rgb("#9CA3AF"),
      surface-keycap: rgb("#F3F4F6"),
      border-keycap:  rgb("#D1D5DB"),
      surface-code:   rgb("#F8FAFC"),
      header-text:    white,
    ),
    accent: (
      blue:     rgb("#2563EB"),
      indigo:   rgb("#4F46E5"),
      violet:   rgb("#7C3AED"),
      purple:   rgb("#9333EA"),
      pink:     rgb("#DB2777"),
      rose:     rgb("#E11D48"),
      orange:   rgb("#EA580C"),
      amber:    rgb("#D97706"),
      emerald:  rgb("#059669"),
      teal:     rgb("#0D9488"),
      cyan:     rgb("#0891B2"),
      slate:    rgb("#475569"),
    ),
    tint: (
      blue:     rgb("#F8FAFC"),
      indigo:   rgb("#F8FAFC"),
      violet:   rgb("#F8FAFC"),
      purple:   rgb("#F8FAFC"),
      pink:     rgb("#F8FAFC"),
      rose:     rgb("#F8FAFC"),
      orange:   rgb("#F8FAFC"),
      amber:    rgb("#F8FAFC"),
      emerald:  rgb("#F8FAFC"),
      teal:     rgb("#F8FAFC"),
      cyan:     rgb("#F8FAFC"),
      slate:    rgb("#F8FAFC"),
    ),
  ),

  slate_wash: (
    name: "Slate Wash",
    ui: (
      paper:          white,
      text-primary:   rgb("#1E293B"),
      text-muted:     rgb("#475569"),
      text-subtle:    rgb("#64748B"),
      text-path:      rgb("#334155"),
      text-footer:    rgb("#94A3B8"),
      surface-keycap: rgb("#F1F5F9"),
      border-keycap:  rgb("#CBD5E1"),
      surface-code:   rgb("#F8FAFC"),
      header-text:    white,
    ),
    accent: (
      blue:     rgb("#2563EB"),
      indigo:   rgb("#4F46E5"),
      violet:   rgb("#7C3AED"),
      purple:   rgb("#9333EA"),
      pink:     rgb("#DB2777"),
      rose:     rgb("#E11D48"),
      orange:   rgb("#EA580C"),
      amber:    rgb("#D97706"),
      emerald:  rgb("#059669"),
      teal:     rgb("#0D9488"),
      cyan:     rgb("#0891B2"),
      slate:    rgb("#475569"),
    ),
    tint: (
      blue:     rgb("#F1F5F9"),
      indigo:   rgb("#F8FAFC"),
      violet:   rgb("#F5F5F4"),
      purple:   rgb("#FAFAF9"),
      pink:     rgb("#F9FAFB"),
      rose:     rgb("#F5F5F5"),
      orange:   rgb("#FAFAFA"),
      amber:    rgb("#FEFCE8"),
      emerald:  rgb("#F8FAFC"),
      teal:     rgb("#F0FDFA"),
      cyan:     rgb("#ECFEFF"),
      slate:    rgb("#F8FAFC"),
    ),
  ),

  ink_wash: (
    name: "Ink & Wash",
    ui: (
      paper:          white,
      text-primary:   rgb("#2C2825"),
      text-muted:     rgb("#5C5550"),
      text-subtle:    rgb("#7A7268"),
      text-path:      rgb("#3E3830"),
      text-footer:    rgb("#9A9288"),
      surface-keycap: rgb("#F2F0EC"),
      border-keycap:  rgb("#DDD9D2"),
      surface-code:   rgb("#F7F5F2"),
      header-text:    white,
    ),
    accent: (
      blue:     rgb("#4A6FA5"),
      indigo:   rgb("#5B5EA6"),
      violet:   rgb("#7B6B8D"),
      purple:   rgb("#8B6B8D"),
      pink:     rgb("#A5707A"),
      rose:     rgb("#B5736B"),
      orange:   rgb("#C08552"),
      amber:    rgb("#A8892E"),
      emerald:  rgb("#5A8A6A"),
      teal:     rgb("#4A8A82"),
      cyan:     rgb("#4A8A9A"),
      slate:    rgb("#6B7B8A"),
    ),
    tint: (
      blue:     rgb("#FAF9F7"),
      indigo:   rgb("#FAF9F7"),
      violet:   rgb("#FAF9F7"),
      purple:   rgb("#FAF9F7"),
      pink:     rgb("#FAF9F7"),
      rose:     rgb("#FAF9F7"),
      orange:   rgb("#FAF9F7"),
      amber:    rgb("#FAF9F7"),
      emerald:  rgb("#FAF9F7"),
      teal:     rgb("#FAF9F7"),
      cyan:     rgb("#FAF9F7"),
      slate:    rgb("#FAF9F7"),
    ),
  ),

  blueprint: (
    name: "Blueprint",
    ui: (
      paper:          white,
      text-primary:   rgb("#1E293B"),
      text-muted:     rgb("#475569"),
      text-subtle:    rgb("#64748B"),
      text-path:      rgb("#334155"),
      text-footer:    rgb("#94A3B8"),
      surface-keycap: rgb("#F1F5F9"),
      border-keycap:  rgb("#CBD5E1"),
      surface-code:   rgb("#F8FAFC"),
      header-text:    white,
    ),
    accent: (
      blue:     rgb("#1D4ED8"),
      indigo:   rgb("#3730A3"),
      violet:   rgb("#5B21B6"),
      purple:   rgb("#6B21A8"),
      pink:     rgb("#BE185D"),
      rose:     rgb("#9F1239"),
      orange:   rgb("#C2410C"),
      amber:    rgb("#B45309"),
      emerald:  rgb("#047857"),
      teal:     rgb("#0F766E"),
      cyan:     rgb("#0E7490"),
      slate:    rgb("#334155"),
    ),
    tint: (
      blue:     rgb("#F8FAFC"),
      indigo:   rgb("#F8FAFC"),
      violet:   rgb("#F8FAFC"),
      purple:   rgb("#F8FAFC"),
      pink:     rgb("#F8FAFC"),
      rose:     rgb("#F8FAFC"),
      orange:   rgb("#F8FAFC"),
      amber:    rgb("#F8FAFC"),
      emerald:  rgb("#F8FAFC"),
      teal:     rgb("#F8FAFC"),
      cyan:     rgb("#F8FAFC"),
      slate:    rgb("#F8FAFC"),
    ),
  ),

  anthropic: (
    name: "Anthropic",
    ui: (
      paper:          white,
      text-primary:   rgb("#2C2A26"),
      text-muted:     rgb("#5A5650"),
      text-subtle:    rgb("#78736A"),
      text-path:      rgb("#3E3A34"),
      text-footer:    rgb("#98928A"),
      surface-keycap: rgb("#F2F0EB"),
      border-keycap:  rgb("#DDD9D0"),
      surface-code:   rgb("#F7F5F0"),
      header-text:    white,
    ),
    accent: (
      blue:     rgb("#3366AA"),
      indigo:   rgb("#4A5899"),
      violet:   rgb("#6B5B95"),
      purple:   rgb("#8B6990"),
      pink:     rgb("#B06080"),
      rose:     rgb("#C07060"),
      orange:   rgb("#CC8844"),
      amber:    rgb("#BB9933"),
      emerald:  rgb("#558866"),
      teal:     rgb("#448877"),
      cyan:     rgb("#4488AA"),
      slate:    rgb("#667788"),
    ),
    tint: (
      blue:     rgb("#FAF8F5"),
      indigo:   rgb("#FAF8F5"),
      violet:   rgb("#FAF8F5"),
      purple:   rgb("#FAF8F5"),
      pink:     rgb("#FAF8F5"),
      rose:     rgb("#FAF8F5"),
      orange:   rgb("#FAF8F5"),
      amber:    rgb("#FAF8F5"),
      emerald:  rgb("#FAF8F5"),
      teal:     rgb("#FAF8F5"),
      cyan:     rgb("#FAF8F5"),
      slate:    rgb("#FAF8F5"),
    ),
  ),

  nord_functional: (
    name: "Nord Functional",
    ui: (
      paper:          white,
      text-primary:   rgb("#2E3440"),
      text-muted:     rgb("#4C566A"),
      text-subtle:    rgb("#5F6C82"),
      text-path:      rgb("#3B4252"),
      text-footer:    rgb("#7F8CA3"),
      surface-keycap: rgb("#E5E9F0"),
      border-keycap:  rgb("#D8DEE9"),
      surface-code:   rgb("#EEF2F7"),
      header-text:    white,
    ),
    accent: (
      blue:     rgb("#5E81AC"),
      indigo:   rgb("#4E6A92"),
      violet:   rgb("#8B6EA0"),
      purple:   rgb("#A06EA0"),
      pink:     rgb("#BF616A"),
      rose:     rgb("#D08770"),
      orange:   rgb("#C08040"),
      amber:    rgb("#C5A838"),
      emerald:  rgb("#6E9A6E"),
      teal:     rgb("#6BA0A0"),
      cyan:     rgb("#6AADBD"),
      slate:    rgb("#7B8894"),
    ),
    tint: (
      blue:     rgb("#E8ECF2"),
      indigo:   rgb("#E8ECF2"),
      violet:   rgb("#EDEBF2"),
      purple:   rgb("#EDEBF2"),
      pink:     rgb("#F0EBEC"),
      rose:     rgb("#F0EDEB"),
      orange:   rgb("#F0EDEB"),
      amber:    rgb("#F0EEEB"),
      emerald:  rgb("#EBF0EB"),
      teal:     rgb("#EBF0EF"),
      cyan:     rgb("#EBF0F2"),
      slate:    rgb("#EBEDF0"),
    ),
  ),

  warm_terra: (
    name: "Warm Terra",
    ui: (
      paper:          white,
      text-primary:   rgb("#302B25"),
      text-muted:     rgb("#5E5648"),
      text-subtle:    rgb("#7D7466"),
      text-path:      rgb("#433C32"),
      text-footer:    rgb("#9E9688"),
      surface-keycap: rgb("#F0ECE5"),
      border-keycap:  rgb("#DDD6CA"),
      surface-code:   rgb("#F6F3EE"),
      header-text:    white,
    ),
    accent: (
      blue:     rgb("#567A9E"),
      indigo:   rgb("#5D6599"),
      violet:   rgb("#7E6896"),
      purple:   rgb("#966888"),
      pink:     rgb("#A8606E"),
      rose:     rgb("#B86A55"),
      orange:   rgb("#C47D3E"),
      amber:    rgb("#A89030"),
      emerald:  rgb("#5E8E5C"),
      teal:     rgb("#4D877A"),
      cyan:     rgb("#4D8595"),
      slate:    rgb("#70787A"),
    ),
    tint: (
      blue:     rgb("#F6F5F2"),
      indigo:   rgb("#F6F5F2"),
      violet:   rgb("#F6F5F2"),
      purple:   rgb("#F6F5F2"),
      pink:     rgb("#F6F5F2"),
      rose:     rgb("#F6F5F2"),
      orange:   rgb("#F6F5F2"),
      amber:    rgb("#F6F5F2"),
      emerald:  rgb("#F6F5F2"),
      teal:     rgb("#F6F5F2"),
      cyan:     rgb("#F6F5F2"),
      slate:    rgb("#F6F5F2"),
    ),
  ),

  ocean_deep: (
    name: "Ocean Deep",
    ui: (
      paper:          white,
      text-primary:   rgb("#1B2832"),
      text-muted:     rgb("#3E5060"),
      text-subtle:    rgb("#5A7080"),
      text-path:      rgb("#2A3D4E"),
      text-footer:    rgb("#7A8E9E"),
      surface-keycap: rgb("#EDF1F5"),
      border-keycap:  rgb("#D0D9E2"),
      surface-code:   rgb("#F2F5F8"),
      header-text:    white,
    ),
    accent: (
      blue:     rgb("#1A56A8"),
      indigo:   rgb("#3944A8"),
      violet:   rgb("#5E3F99"),
      purple:   rgb("#7A3F8A"),
      pink:     rgb("#A33D65"),
      rose:     rgb("#B84545"),
      orange:   rgb("#C06A25"),
      amber:    rgb("#A88A18"),
      emerald:  rgb("#2D7D4A"),
      teal:     rgb("#1A7A70"),
      cyan:     rgb("#1878A0"),
      slate:    rgb("#4A5E6E"),
    ),
    tint: (
      blue:     rgb("#F0F3F7"),
      indigo:   rgb("#F0F2F7"),
      violet:   rgb("#F2F1F7"),
      purple:   rgb("#F3F1F6"),
      pink:     rgb("#F5F1F4"),
      rose:     rgb("#F5F2F2"),
      orange:   rgb("#F5F3F0"),
      amber:    rgb("#F4F4F0"),
      emerald:  rgb("#F0F4F1"),
      teal:     rgb("#F0F5F4"),
      cyan:     rgb("#F0F4F7"),
      slate:    rgb("#F1F3F5"),
    ),
  ),

  mono_slate: (
    name: "Mono Slate",
    ui: (
      paper:          white,
      text-primary:   rgb("#18181B"),
      text-muted:     rgb("#3F3F46"),
      text-subtle:    rgb("#52525B"),
      text-path:      rgb("#27272A"),
      text-footer:    rgb("#A1A1AA"),
      surface-keycap: rgb("#F4F4F5"),
      border-keycap:  rgb("#D4D4D8"),
      surface-code:   rgb("#F4F4F5"),
      header-text:    white,
    ),
    accent: (
      blue:     rgb("#2563EB"),
      indigo:   rgb("#4338CA"),
      violet:   rgb("#6D28D9"),
      purple:   rgb("#7E22CE"),
      pink:     rgb("#BE185D"),
      rose:     rgb("#BE123C"),
      orange:   rgb("#C2410C"),
      amber:    rgb("#B45309"),
      emerald:  rgb("#047857"),
      teal:     rgb("#0F766E"),
      cyan:     rgb("#0E7490"),
      slate:    rgb("#3F3F46"),
    ),
    tint: (
      blue:     rgb("#FAFAFA"),
      indigo:   rgb("#FAFAFA"),
      violet:   rgb("#FAFAFA"),
      purple:   rgb("#FAFAFA"),
      pink:     rgb("#FAFAFA"),
      rose:     rgb("#FAFAFA"),
      orange:   rgb("#FAFAFA"),
      amber:    rgb("#FAFAFA"),
      emerald:  rgb("#FAFAFA"),
      teal:     rgb("#FAFAFA"),
      cyan:     rgb("#FAFAFA"),
      slate:    rgb("#FAFAFA"),
    ),
  ),

  colorbrewer_set3: (
    name: "ColorBrewer Set3",
    ui: (
      paper:          white,
      text-primary:   rgb("#1F2937"),
      text-muted:     rgb("#586174"),
      text-subtle:    rgb("#6B7280"),
      text-path:      rgb("#334155"),
      text-footer:    rgb("#9CA3AF"),
      surface-keycap: rgb("#F3F4F6"),
      border-keycap:  rgb("#D1D5DB"),
      surface-code:   rgb("#F8FAFC"),
      header-text:    rgb("#1F2937"),
    ),
    accent: (
      blue:     rgb("#80B1D3"),
      indigo:   rgb("#BEBADA"),
      violet:   rgb("#BC80BD"),
      purple:   rgb("#FCCDE5"),
      pink:     rgb("#FB8072"),
      rose:     rgb("#D9D9D9"),
      orange:   rgb("#FDB462"),
      amber:    rgb("#FFED6F"),
      emerald:  rgb("#B3DE69"),
      teal:     rgb("#8DD3C7"),
      cyan:     rgb("#80B1D3"),
      slate:    rgb("#CCEBC5"),
    ),
    tint: (
      blue:     rgb("#F4F8FB"),
      indigo:   rgb("#F5F4F9"),
      violet:   rgb("#F7F2F7"),
      purple:   rgb("#FEF5FA"),
      pink:     rgb("#FEF3F2"),
      rose:     rgb("#F6F6F6"),
      orange:   rgb("#FEF6EE"),
      amber:    rgb("#FFFCEF"),
      emerald:  rgb("#F5FAEF"),
      teal:     rgb("#F2FAF8"),
      cyan:     rgb("#F4F8FB"),
      slate:    rgb("#F5FAF3"),
    ),
  ),

  github_primer: (
    name: "GitHub Primer",
    ui: (
      paper:          white,
      text-primary:   rgb("#1F2328"),
      text-muted:     rgb("#59636E"),
      text-subtle:    rgb("#6E7781"),
      text-path:      rgb("#32383F"),
      text-footer:    rgb("#8C959F"),
      surface-keycap: rgb("#F6F8FA"),
      border-keycap:  rgb("#D0D7DE"),
      surface-code:   rgb("#F6F8FA"),
      header-text:    white,
    ),
    accent: (
      blue:     rgb("#0969DA"),
      indigo:   rgb("#4338CA"),
      violet:   rgb("#8250DF"),
      purple:   rgb("#8250DF"),
      pink:     rgb("#BF3989"),
      rose:     rgb("#CF222E"),
      orange:   rgb("#BC4C00"),
      amber:    rgb("#9A6700"),
      emerald:  rgb("#1A7F37"),
      teal:     rgb("#0D7A82"),
      cyan:     rgb("#0969DA"),
      slate:    rgb("#59636E"),
    ),
    tint: (
      blue:     rgb("#F6F8FA"),
      indigo:   rgb("#F6F8FA"),
      violet:   rgb("#F6F8FA"),
      purple:   rgb("#F6F8FA"),
      pink:     rgb("#F6F8FA"),
      rose:     rgb("#F6F8FA"),
      orange:   rgb("#F6F8FA"),
      amber:    rgb("#F6F8FA"),
      emerald:  rgb("#F6F8FA"),
      teal:     rgb("#F6F8FA"),
      cyan:     rgb("#F6F8FA"),
      slate:    rgb("#F6F8FA"),
    ),
  ),

  dracula_light: (
    name: "Dracula Light",
    ui: (
      paper:          white,
      text-primary:   rgb("#282A36"),
      text-muted:     rgb("#44475A"),
      text-subtle:    rgb("#6272A4"),
      text-path:      rgb("#383A4A"),
      text-footer:    rgb("#8890AA"),
      surface-keycap: rgb("#F0F0EA"),
      border-keycap:  rgb("#D8D8D2"),
      surface-code:   rgb("#F4F4EE"),
      header-text:    white,
    ),
    accent: (
      blue:     rgb("#6272A4"),
      indigo:   rgb("#5060AA"),
      violet:   rgb("#BD93F9"),
      purple:   rgb("#BD93F9"),
      pink:     rgb("#FF79C6"),
      rose:     rgb("#FF5555"),
      orange:   rgb("#FFB86C"),
      amber:    rgb("#F1FA8C"),
      emerald:  rgb("#50FA7B"),
      teal:     rgb("#47C9A2"),
      cyan:     rgb("#8BE9FD"),
      slate:    rgb("#6272A4"),
    ),
    tint: (
      blue:     rgb("#F4F4EE"),
      indigo:   rgb("#F4F4EE"),
      violet:   rgb("#F6F4FA"),
      purple:   rgb("#F6F4FA"),
      pink:     rgb("#FAF4F8"),
      rose:     rgb("#FAF4F4"),
      orange:   rgb("#FAF6F2"),
      amber:    rgb("#FAFAF2"),
      emerald:  rgb("#F4FAF4"),
      teal:     rgb("#F2FAF8"),
      cyan:     rgb("#F2F8FA"),
      slate:    rgb("#F4F4EE"),
    ),
  ),
)

#let default-theme = themes.paper_garden
#let theme-state = state("cheatsheet-theme", default-theme)

// Backwards-compatible aliases for existing callsites.
#let colors = themes.classic.accent
#let tints = themes.classic.tint
#let ui = themes.classic.ui

#let theme-ui(key, default: auto) = context {
  let th = theme-state.at(here())
  if default == auto {
    th.ui.at(key)
  } else {
    th.ui.at(key, default: default)
  }
}

#let theme-accent(kind, default: auto) = context {
  let th = theme-state.at(here())
  if default == auto {
    th.accent.at(kind)
  } else {
    th.accent.at(kind, default: default)
  }
}

#let theme-from-name(name) = themes.at(name, default: default-theme)

// ─── Fonts ───────────────────────────────────────────────────────
#let body-font = ("Arial", "Liberation Sans", "Nimbus Sans", "Helvetica")
#let mono-font = ("Menlo", "DejaVu Sans Mono", "Liberation Mono", "Courier New")

// ─── Sizing ──────────────────────────────────────────────────────
#let body-size = 8.6pt
#let mono-size = 7.9pt
#let header-size = 9pt
#let title-size = 16pt
#let subtitle-size = 9pt
#let section-title-size = 9pt
#let subsection-title-size = 7pt

// ─── Spacing ─────────────────────────────────────────────────────
#let card-gap = 2.2mm
#let card-radius = 3pt
#let card-inset = 2.1mm
#let header-inset = (x: 2.6mm, y: 1.3mm)
#let row-gap = 0.9mm

// ─── Keycap Component ────────────────────────────────────────────
#let keycap(key) = context {
  let th = theme-state.at(here())
  box(
    fill: th.ui.surface-keycap,
    stroke: 0.4pt + th.ui.border-keycap,
    radius: 1.5pt,
    inset: (x: 1.8pt, y: 0.8pt),
    baseline: 0.8pt,
    text(font: mono-font, size: mono-size, weight: "semibold", key)
  )
}

// ─── Code Component ──────────────────────────────────────────────
#let code(content) = context {
  let th = theme-state.at(here())
  box(
    fill: th.ui.surface-code,
    radius: 1pt,
    inset: (x: 1.5pt, y: 0.5pt),
    baseline: 0.5pt,
    text(font: mono-font, size: mono-size, content)
  )
}

// ─── Entry Row (key + description) ──────────────────────────────
#let entry(key, desc) = context {
  let th = theme-state.at(here())
  block(spacing: row-gap,
    grid(
      columns: (auto, 1fr),
      column-gutter: 1.8mm,
      align: (left, left),
      box(text(font: mono-font, size: mono-size, weight: "semibold", fill: th.ui.text-primary, key)),
      text(size: body-size, fill: th.ui.text-muted, desc),
    )
  )
}

// ─── Stacked Entry (for long keys/commands) ──────────────────────
#let entry-stack(key, desc) = context {
  let th = theme-state.at(here())
  text(font: mono-font, size: mono-size, weight: "semibold", fill: th.ui.text-primary, key)
  linebreak()
  text(size: body-size, fill: th.ui.text-muted, desc)
}

// ─── Flow Entry (single-column, wraps naturally) ─────────────────
#let entry-flow(key, desc) = context {
  let th = theme-state.at(here())
  block(spacing: row-gap)[
    #text(font: mono-font, size: mono-size, weight: "semibold", fill: th.ui.text-primary, key)
    #h(0.8mm)
    #text(size: body-size, fill: th.ui.text-muted, desc)
  ]
}

// ─── Path Line (for long filesystem paths in prose sections) ─────
#let path-line(path) = context {
  let th = theme-state.at(here())
  box(
    fill: th.ui.surface-code,
    radius: 1pt,
    inset: (x: 1.5pt, y: 0.8pt),
    baseline: 0.5pt,
    text(font: mono-font, size: mono-size, fill: th.ui.text-path, path),
  )
}

// ─── Subsection Header ──────────────────────────────────────────
#let subsection(title, kind: auto, accent: auto, body) = context {
  let th = theme-state.at(here())
  let label-color = if accent != auto { accent } else if kind != auto {
    th.accent.at(kind, default: th.accent.blue).darken(25%)
  } else { th.ui.text-subtle }

  block(above: 2.4mm, below: 0.5mm,
    text(
      size: subsection-title-size,
      weight: "bold",
      fill: label-color,
      upper(title)
    )
  )
  body
}

// ─── Intro Blurb ─────────────────────────────────────────────────
#let section-intro(content, tint: auto) = context {
  let th = theme-state.at(here())
  block(
    width: 100%,
    text(size: body-size, weight: "medium", style: "italic", fill: th.ui.text-subtle, content),
  )
  v(1.8mm)
}

// ─── Section Card ────────────────────────────────────────────────
#let section(
  title: "",
  kind: "blue",
  accent: auto,
  tint: auto,
  header-text: auto,
  icon: "",
  body,
) = context {
  let th = theme-state.at(here())
  let accent-color = if accent == auto { th.accent.at(kind, default: th.accent.blue) } else { accent }
  let tint-color = if tint == auto {
    if "tint" in th {
      th.tint.at(kind, default: accent-color.lighten(82%))
    } else {
      accent-color.lighten(82%)
    }
  } else {
    tint
  }
  let header-color = if header-text == auto { th.ui.at("header-text", default: white) } else { header-text }

  block(
    width: 100%,
    radius: card-radius,
    clip: true,
    stroke: 0.3pt + accent-color.lighten(45%),
    stack(
      spacing: 0pt,
      // Header band
      block(
        width: 100%,
        fill: accent-color,
        inset: header-inset,
        text(
          size: section-title-size,
          weight: "bold",
          fill: header-color,
          tracking: 0.3pt,
          upper(title)
        )
      ),
      // Body
      block(
        width: 100%,
        fill: tint-color,
        inset: card-inset,
        body
      ),
    )
  )
}

// ─── Page Title Bar ─────────────────────────────────────────────
#let page-title(title, subtitle: none, accent: auto, mark: none) = context {
  let th = theme-state.at(here())
  let bar = if accent == auto { th.accent.blue } else { accent }
  let header-color = th.ui.at("header-text", default: white)

  block(
    width: 100%,
    inset: (x: 3mm, y: 2mm),
    fill: bar,
    radius: 2pt,
    {
      if mark == none {
        text(size: title-size, weight: "bold", fill: header-color, tracking: 0.5pt, title)
      } else {
        grid(
          columns: (auto, 1fr),
          column-gutter: 1.5mm,
          align: (left + horizon, left + horizon),
          mark,
          text(size: title-size, weight: "bold", fill: header-color, tracking: 0.5pt, title),
        )
      }
      if subtitle != none {
        h(3mm)
        text(size: subtitle-size, fill: header-color.darken(25%), subtitle)
      }
    }
  )
}

// ─── Footer ─────────────────────────────────────────────────────
#let page-footer(left-text, right-text) = context {
  let th = theme-state.at(here())
  block(
    width: 100%,
    inset: (x: 1mm, y: 0mm),
    grid(
      columns: (1fr, 1fr),
      text(size: 5pt, fill: th.ui.text-footer, left-text),
      align(right, text(size: 5pt, fill: th.ui.text-footer, right-text)),
    )
  )
}

// ─── Main Cheatsheet Setup ──────────────────────────────────────
#let cheatsheet(
  title: "Cheat Sheet",
  subtitle: none,
  theme: default-theme,
  accent: auto,
  col-count: 4,
  col-gutter: card-gap,
  body,
) = {
  theme-state.update(theme)

  set page(
    paper: "us-letter",
    flipped: true,
    margin: (x: 6mm, y: 5mm),
    fill: theme.ui.paper,
  )
  set text(
    font: body-font,
    size: body-size,
    weight: "regular",
    fill: theme.ui.text-primary,
    hyphenate: false,
  )
  set par(leading: 0.42em, spacing: 0.32em, justify: false)

  body
}
