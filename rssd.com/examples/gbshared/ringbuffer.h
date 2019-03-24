#include <string.h> // memcpy
#include "assert.h"
/* General purpose ring buffer. Elements are pushed to tail and
 * popped off the head.
 *
 * More than that, this structure is carefully designed to 
 * provide a lock-free way to pass data between tasks.  That
 * is data can be appended (pushed) by one task and retrieved
 * (popped) by another task knowing that data will not
 * be corrupted even if there is an interrrupt and task switch.
 * Also the is_empty function can be used in a mult-tasking
 * environment.  Note the absence of a function to return
 * the number of elements in the buffer as there was no 
 * thread safe way to implement this.
 *
 * Note that the operations push and pop ARE NOT THREADSAFE.
 * That is, neither one can be called from more than one task.
 * However, each one does not have to be in the same task as
 * the other.
 *
 * In practice, this restriction maintains the utility of the
 * data structure, but it requires the programmer to be
 * conscious of this restriction.  It could be easy to overlook.
 */

#define RINGBUFFER_TYPE(T, count)                \
    struct {                                     \
        unsigned char head;                      \
        unsigned char tail;                      \
        T storage[count + 1];                    \
    } ringbuffer_ ## T

#define RINGBUFFER_DEFINITION(name, T)           \
    ringbuffer_ ## T name = {0, 0}

#define RINGBUFFER(name, T, count)               \
    typedef RINGBUFFER_TYPE(T,count);            \
    RINGBUFFER_DEFINITION(name, T)

/* utility */
#define ringbuffer_isempty(name)                 \
    (name.head == name.tail)

#define ringbuffer_isoverflowed(name)            \
    (name.head == name.tail)

#define ringbuffer_start(name)                   \
    0

#define ringbuffer_end(name)                     \
    (sizeof(name.storage)/sizeof(name.storage[0]))

/* append to tail */
/* implementation detail */
#define ringbuffer_next_push_address(name)       \
    (& name.storage[name.tail])

//#define ringbuffer_next_push_value(name)         \
//    (name.storage[name.tail])

/* update item - THEN pointer 
 * This is to prevent is empty from returning false
 * before an item is actually ready to be read
 */
#define ringbuffer_push(name)                    \
    {                                            \
        if(++name.tail == ringbuffer_end(name))  \
            name.tail = ringbuffer_start(name);  \
        assert(! ringbuffer_isoverflowed(name)); /* overflow !!! */ \
    }

#define ringbuffer_push_address(name, t)         \
    {                                            \
        memcpy(                                  \
            ringbuffer_next_push_address(name),  \
            (t),                                 \
            sizeof(*t)                           \
        );                                       \
        ringbuffer_push(name);                   \
    }

#define ringbuffer_push_value(name, t)           \
    {                                            \
        *ringbuffer_next_push_address(name) = (t); \
        ringbuffer_push(name);                   \
    }

/* retrieve from head */
/* implementation detail */
#define ringbuffer_next_pop_address(name)        \
    (& name.storage[name.head])

#define ringbuffer_next_pop_value(name)          \
    (name.storage[name.head])

/* note: update pointer THEN return item
 * Opposite of the above 
 * This prevents from is empty returning true 
 * to more than one task */
#define ringbuffer_pop(name)                     \
    (                                            \
    (++name.head == ringbuffer_end(name)) ?      \
        (name.head = ringbuffer_start(name))     \
        :                                        \
        name.head                                \
    )

#define ringbuffer_pop_address(name, t)          \
    {                                            \
        char x = name.head;                      \
        assert(! ringbuffer_isempty(name)); /* underflow !!! */ \
        ringbuffer_pop(name);                    \
        memcpy(                                  \
            (t),                                   \
            & name.storage[x],                   \
            sizeof(*t)                           \
        );                                       \
    }

#define ringbuffer_pop_value(name)               \
    (                                            \
        ringbuffer_pop(name),                    \
        name.storage[                            \
            (name.head == ringbuffer_start(name) ? \
                (ringbuffer_end(name) - 1)       \
            :                                    \
                (name.head - 1))                 \
        ]                                        \
    )

/* The following isn't lock-free thread-safe !!! 
 * Don't use in multi-thread environment 
 */

#define ringbuffer_count(name)                   \
    (                                            \
        (name.tail < name.head) ?                \
            (name.tail + ringbuffer_end(name) - name.head) \
        :                                        \
            (name.tail - name.head)              \
    )

#define STACK(name, T, count) \
    RINGBUFFER(name, T, count)

#define stack_push_value(name, t) \
    ringbuffer_push_value(name, t)

#define stack_pop_value(name)                               \
    (                                                       \
        name.tail = (name.tail == ringbuffer_start(name)) ? \
            name.tail = ringbuffer_end(name)                \
        :                                                   \
            --(name.tail),                                  \
        /* assert(! ringbuffer_isempty(name)); underflow !!! */\
        *ringbuffer_next_push_address(name)        \
    )

#define stack_isempty(name)  \
    ringbuffer_isempty(name)
