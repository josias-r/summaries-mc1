= Introduction
== STM32H573
#rect()[
  #image("/assets/image.png")
]
== Zephyr
#rect()[
  #image("/assets/image-1.png")
]
== C Var Attributes
#rect()[
  #table(
    columns: (auto, 1fr),
    [*Type*], [Implies size, i.e. number of bytes in memory],
    [*Name*], [Used to access the memory region],
    [*Value*], [Content/data stored in the memory region],
    [*Address (Location)*], [Location in memory where the variable resides],
    [*Scope*], [Part of the source code in which the name is visible (known)],
    [*Lifetime*],
    [When is the variable created (allocation of memory) and when is it destroyed (deallocation of memory)],
  )

  *C*: Sizes of integer types depend on _arch and compiler_! Find it in `C99 - stdint.h`

  Also, pointers are _platform_ dependent.
]
== C Declarations vs Definitions
#rect()[
  ```C
  struct position_t {             // specification of a structure,
      uint32_t u;                 // (i.e. declaration of type)
      uint32_t v;                 // Neither a declaration
  };                              // nor a definition of a variable

  struct position_t pos_1;        // definition of variable pos_1
                                  // of type 'struct position_t'

  extern struct position_t pos_2; // declaration of variable pos_2
                                  // of type 'struct position_t'

  typedef struct {                // declare a new type location_t \
    uint32_t r;                   // so you can omit the \
    uint32_t s;                   // keyword struct in variable \
  } location_t;                   // definitions and declarations

  location_t loc_1;               // definition of loc_1 w/o keyword struct \
  extern location_t loc_2;        // declaration of loc_2 w/o keyword struct
  ```

  Note: `structs` can change in size depending on the order or whether they are compiled as compact or not.
]

#rect()[
  #image("/assets/image-2.png")
]

== Lifetime of Variables
#rect(inset: 0.5pt)[
  #table(
    columns: (1fr, 1.5fr, 1.8fr, 1.5fr),
    align: left,
    [*Type*], [*Creation*], [*Initialization*], [*Destruction*],

    [*Automatic* \ _Local variables in registers or on the stack_],
    [Each time the program enters the function in which it is defined],
    [Default: #underline[No] initialization \ \ If definition contains an assignment: Each time program enters block],
    [On each return from function],

    [*Static Allocation* \ _Memory objects in DATA sections_ \ (1) Global variables \ (2) Module-wide variables with qualifier `static` \ (3) Variables within functions with qualifier `static`],
    [#underline[Once]: Start of program],
    [#underline[Once]: Start of program],
    [At program termination \ _On bare-metal embedded systems there is usually no 'program termination'; in practice these objects exist for the entire time the MCU is powered._],

    [*Dynamic Allocation* \ _Memory objects on the heap_],
    [By calling `malloc()`],
    [Responsibility of programmer: Source code has to explicitly write initial values],
    [By calling `free()`],
  )

]
