= Power Management
#rect(inset: 1pt)[
  #image("/assets/image-8.png")
]
#rect(inset: 1pt)[
  #image("/assets/image-4.png")
]
#rect()[
  *Shrinking semiconductor process dimensions*

  + #text(fill: rgb("#0070c0"))[*+ Increase performance*]
    - Shorter gate delays \
      $arrow.r$ higher switching frequencies

  + Lower the supply voltage
    - Reduces the dynamic power consumption, e.g.
    - #text(fill: rgb("#c00070"))[$
        overline(P)_(1.8V) = frac(1.8^2, 2.5^2) dot overline(P)_(2.5V) = bold(0.52 dot overline(P)_(2.5V))
      $]

  + -- Increase the power density
    - I.e. the chip gets hot-spots

  + -- Increase leakage currents
    - I.e. there is current flowing even if the switch (transistor) is open

]
#rect(inset: 1pt)[
  #image("/assets/image-5.png")
]
#rect(inset: 1pt)[
  #image("/assets/image-6.png")
]
#rect(inset: 1pt)[
  #image("/assets/image-7.png")
]
