(TeX-add-style-hook
 "10_DetecciónSeñales"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("article" "letterpaper" "12pt")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("babel" "spanish") ("algorithm2e" "spanish" "onelanguage" "ruled") ("inputenc" "utf8") ("geometry" "top=2cm" "bottom=2cm" "left=2cm" "right=2cm") ("bclogo" "tikz")))
   (TeX-run-style-hooks
    "latex2e"
    "article"
    "art12"
    "babel"
    "algorithm2e"
    "inputenc"
    "graphicx"
    "caption"
    "subcaption"
    "geometry"
    "hyperref"
    "verbatim"
    "amssymb"
    "mathtools"
    "bclogo")
   (TeX-add-symbols
    '("ddfrac" 2)))
 :latex)

