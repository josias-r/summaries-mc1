= Structuring Embedded SW
== Asynchronous Callbacks
#rect()[
  ```c
  void example_function(void);/* function declaration */

  /* definition of a pointer called f1_ptr pointing to a function with no parameters and no return value */
  void (*f1_ptr)(void);

  f1_ptr = NULL;              /* set f1_ptr to NULL */

  /* checking whether f1_ptr points to an object or not */
  if (f1_ptr != NULL) {
      /* ... */
  }

  /* assign address of example_function to f1_ptr */
  f1_ptr = &example_function;
  f1_ptr = example_function;  /* the same as the line before */

  f1_ptr();                   /* calling the function that f1_ptr points to,
                               * i.e. example_function */
  ```

]
== SOLID
#rect(inset: 1pt)[
  #image("/assets/image-9.png")
]
== Avoid revealing structures to callee
#rect()[
  Instead, simply provide create/destroy functions in a module already, so the callee is not tempted to access strucutres of clients directly (and therefore unnecessarily depending on it, without explicit interface by module)
]
