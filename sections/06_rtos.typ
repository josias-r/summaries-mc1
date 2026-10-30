= RTOS - Real-Time Operating System (i.e. Zephyr)
#rect()[
  #highlight[TODO: just yotted down slides for now, filter for relevancy]
]
== Typical functions
#rect()[
  - Scheduling and dispatching tasks
    - Managing the execution of "parallel" tasks
  - Abstract the hardware and control the access to resources
    - Processor, memory, peripherals, interfaces, ...
    - E.g., a timer or a calendar clock for time references and defined delays
  - Inter-task communication
    - Message-system and exchange of events and data between tasks
  - Task synchronization
    - Signaling/events and mutual exclusion (mutexes, semaphores, ...)
]
== Process vs Thread
#rect()[
  - *Process:* A unit of work, a running program (covered in MC2)
  - *Thread:* An independent flow of control that can be scheduled individually. Each thread has its own context (register set) and stack _but shares the data section with other threads_
]
#rect()[
  + Scheduler 1)
    - Organizes the queue(s) of threads
    - Selects the next eligible thread according to the
  scheduling policy.
  - Various policies, none is “perfect”
  + Dispatcher
    - Takes the thread at the head of the queue
  and “puts it on” the processor
  + Threads get their share of execution time until 2)
    - They block on (wait for) some I/O
    - Sleep deliberately / wait on some event
    - A higher-priority thread wants to run
    - They used up their maximum time quota
  + Then they may have to wait until it’s their turn again
]
== Cooperative vs Preemptible Threads
#rect()[
  #image("/assets/image-13.png")
]
== Context Switch
#rect()[
  #image("/assets/image-14.png")
  Take register -> store in stack (usually) -> load new PC -> run ISR -> recover register values -> continue were left off
]
= Threads and Scheduling in Zephyr
#rect(inset: 1pt)[
  #image("/assets/image-15.png")
]
#rect(inset: 1pt)[
  #image("/assets/image-16.png")
]
== Spawning Threads
#rect()[
  + *Declare Thread at compile time*
    + Use the `K_THREAD_DEFINE()` macro to declare a thread at compile time. This macro takes the following parameters:
      - Thread name
      - Stack size
      - Thread entry function
      - Thread entry function parameters (up to 3)
      - Thread priority (lower number = higher priority)
      - Thread options (optional)
      - Delay in _ms_
  + *Create Thread at runtime*
    + Use the `k_thread_create()` function to create a thread at runtime. This function takes the following parameters:
      - Pointer to a `k_thread` structure that will hold the thread's state
      - Pointer to thread's stack: `K_THREAD_STACK_DEFINE(stack_area, size)`
      - Stack size `K_THREAD_STACK_SIZEOF(stack_area)`
      - Thread entry function
      - Thread entry function parameters (up to 3)
      - Thread priority (lower number = higher priority)
      - Thread options (optional)
      - `K_NO_WAIT` or `K_MSEC(ms)` to specify when the thread should start
]
#rect()[
  + TODO: Scheduling concepts slides
]
