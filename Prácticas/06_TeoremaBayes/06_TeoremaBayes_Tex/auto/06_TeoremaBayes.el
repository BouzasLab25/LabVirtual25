(TeX-add-style-hook
 "06_TeoremaBayes"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("article" "letterpaper" "12pt")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("babel" "spanish") ("inputenc" "utf8") ("geometry" "top=2.5cm" "bottom=2.5cm" "left=2.5cm" "right=2.5cm")))
   (TeX-run-style-hooks
    "latex2e"
    "article"
    "art12"
    "babel"
    "inputenc"
    "graphicx"
    "geometry"
    "hyperref"))
 :latex)

