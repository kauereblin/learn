https://learn.microsoft.com/en-us/cpp/cpp/references-cpp?view=msvc-170

# Compilers

Translate C++ code into machine code that the CPU can execute. They perform syntax checking, optimization, and code generation.

Each cpp file (translation unit) generate an object file (.obj) that contains machine code.

### Preprocessor

The preprocessor handles directives that start with `#`, such as `#include`, `#define`, and `#ifdef`. It processes these directives before the actual compilation starts, allowing for conditional compilation and macro definitions.

### Optimization

The compiler can optimize the code to improve performance, reduce size, or both. Optimization can include inlining functions, removing dead code, and reordering instructions.

#### Const

The `const` keyword is used to define variables that cannot be modified after initialization. It can be applied to variables, pointers, and member functions.

```cpp
const int x = 10; // x cannot be modified

const int* ptr = &x; // ptr points to a constant integer
// cannot modify the value pointed to by ptr, but can change the pointer itself

int* const ptr2 = &x; // ptr2 is a constant pointer to an integer
// cannot change the address stored in ptr2, but can modify the value pointed

const int* const ptr3 = &x; // ptr3 is a constant pointer to a constant integer
```

In member functions, `const` can be used to indicate that the function does not modify the object:

```cpp
class MyClass {
public:
    void myMethod() const // this method does not modify the object
    {
        // ...
    }
};
```

#### Mutable

Reverse of `const`, allowing a member variable to be modified even in a `const` member function. This is useful for caching or lazy initialization.

```cpp
class MyClass {
public:
    mutable int x; // can be modified even in const member functions

    void getX() const
    {
        x = 42; // allowed because x is mutable
    }
};
```

In lambda expressions, `mutable` allows you to modify captured variables by value without affecting the original variable outside the lambda

#### New

The `new` operator allocates memory for an object or array of objects on the heap and returns a pointer to the allocated memory. It is used for dynamic memory allocation.

The objects created with `new` must be deleted using the `delete` operator to avoid memory leaks. If not deleted, the memory remains allocated until the program terminates.

Another way to allocate memory is using `malloc`, which allocates raw memory without calling constructors. It requires manual management of memory and does not call destructors when the memory is freed using `free`.

#### Explicit

The `explicit` keyword is used to prevent implicit conversions of constructors that take a single argument. It ensures that the constructor can only be called explicitly, preventing unintended conversions.

```cpp
class MyClass {
public:
    explicit MyClass(int value)
    {
        // ...
    }
};

MyClass obj1(10); // explicit call, ok
MyClass obj2 = 10; // error, implicit conversion not allowed
```

---

# Linker

The link process happens after the compilation of individual translation units. The linker combines these object files into a single executable or library. It resolves references between different object files and libraries, ensuring that all symbols are correctly linked.

Checks for symbol conflicts, missing symbols (entry point), and ensures that all necessary libraries are included.

`static` term defines a variable or function with internal linkage, meaning it is only visible within the translation unit where it is defined. This prevents name conflicts across different translation units.

`inline` functions are expanded at the point of call, which can reduce function call overhead and reduce linking errors but may increase code size. The compiler decides whether to inline a function based on its complexity and usage.

### Static Variables and Functions

Another cpp file can view variables or functions if they are declared with `extern` reserved word in the current cpp file. But if the variable or function is declared as `static`, it will not be visible outside the translation unit.

In structs and classes, `static` members are shared across all instances of the class, meaning they belong to the class itself rather than any particular instance. They can be accessed using the class name.

```cpp
struct MyStruct {
    static int staticVar;
    static void staticMethod() {
        std::cout << "Static method called" << std::endl;
    }
};

int MyStruct::staticVar = 0;

int main() {
    MyStruct::staticVar = 10;
    MyStruct::staticMethod();

    std::cout << "Static variable: " << MyStruct::staticVar << std::endl; // prints "Static variable: 10", the last value assigned to staticVar
    return 0;
}
```

Static functions access only static members of the class or struct, and they cannot access non-static members directly.

---

# Stack and Heap Memory

The main difference between stack and heap memory is how they are allocated and managed, the performance in this cases.

## Stack

The stack is a region of memory used for static memory allocation. It stores local variables, function parameters, and return addresses. The stack grows and shrinks automatically as functions are called and return.

Local variables are automatically deallocated when they go out of scope, and the stack pointer is adjusted accordingly.

## Heap

Where memory leaks happen.

The heap is a region of memory used for dynamic memory allocation. It allows you to allocate memory at runtime using operators like `new` and `delete`. Memory allocated on the heap must be manually managed, meaning you need to explicitly deallocate it when it is no longer needed.

`new` calls malloc to allocate memory and calls the constructor of the object, while `delete` calls the destructor and frees the memory. The program maintain a free list of memory blocks that can be reused for future allocations. When the free list is exhausted, the heap manager may request more memory from the operating system being very expensive.

---

# Casting

Casting is the process of converting a variable from one type to another. C++ provides several types of casting operators to perform safe and explicit conversions.

- `static_cast`: Used for safe conversions between related types, such as converting a base class pointer to a derived class pointer. It performs compile-time checks and is the most commonly used cast.

- `dynamic_cast`: Used for safe downcasting in class hierarchies with virtual functions. It checks the actual type of the object at runtime and returns a null pointer if the cast is not valid. It requires the base class to have at least one virtual function.

- `const_cast`: Used to add or remove the `const` qualifier from a variable. It allows you to modify a `const` variable, but it should be used with caution as it can lead to undefined behavior if the original variable was truly `const`.

- `reinterpret_cast`: Used for low-level casting, such as converting a pointer to an integer or vice versa. It does not perform any type checking and should be used with caution, as it can lead to undefined behavior if the types are incompatible.

- `C-style cast`: A legacy casting method that can perform any of the above casts, but it is less safe and should be avoided.

---

# Constructors

### Member Initializer List

Constructors can use a member initializer list to initialize member variables before the constructor body executes. This is particularly useful for initializing `const` members or reference members, which must be initialized at the time of object creation.

It's also more efficient than assigning values in the constructor body, as it avoids an extra construction, the default and with the argument.

---

# Destructors

### Virtual Destructors

When a class is superset of another class, it must have a virtual destructor to ensure that the derived class's destructor is called when an object is deleted through a base class pointer. This prevents resource leaks and ensures proper cleanup of resources.

```cpp
class Base {
public:
    virtual ~Base() {
        std::cout << "Base destructor called" << std::endl;
    }
};

class Derived : public Base {
public:
    ~Derived() {
        std::cout << "Derived destructor called" << std::endl;
    }
};

int main() {
    Base* ptr = new Derived();
    delete ptr; // Calls Derived destructor first, then Base destructor
    return 0;
}
```

---

# Argument Evaluation Order

### C++14

Compiler optimizations can lead to unexpected behavior when passing multiple arguments to a function, especially when using post-increment operators. The order in which arguments are evaluated is not guaranteed, which can result in undefined behavior.

```cpp
void foo(int a, int b) {
    std::cout << "a: " << a << ", b: " << b << std::endl;
}

int main() {
    int x = 0;
    foo(x++, x++); // undefined behavior, order of evaluation is not guaranteed
    // x can be incremented in any order, leading to unpredictable results
}
```

### C++17

C++ standard source

> The postfix-expression is sequenced before each expression in the expression-list and any default argument.

```cpp
void foo(int a, int b) {
    std::cout << "a: " << a << ", b: " << b << std::endl;
}
int main() {
    int x = 0;
    foo(x++, x++); // well-defined behavior, x is incremented in the order of evaluation
    // x will be 2 after this call, the argument evaluation order is still undefined
}
```

---

# Virtual Tables

Virtual tables (vtables) are a mechanism used in C++ to support dynamic dispatch of virtual functions. Each class with virtual functions has a vtable, which is an array of pointers to the virtual functions defined in that class.

When an object of a class with virtual functions is created, it contains a pointer to the vtable for that class. When a virtual function is called on that object, the program looks up, in runtime, the function pointer in the vtable and calls the appropriate function based on the actual type of the object.

## Virtual Functions

Virtual functions allow you to achieve polymorphism in C++. They enable a derived class to override a base class method, allowing the program to decide at runtime which method to call based on the actual object type.

### Drawbacks

- Aditional memory is required to store the vtable (virtual table) pointer for each object that has virtual functions. Additional _vptr member in the object that points to the vtable, if the class has or inherits a virtual function.

- Searching the vtable at runtime to find the correct function to call.

---

# Smart Pointers

Smart pointers are objects that manage the lifetime of dynamically allocated memory, automatically deallocating it when no longer needed. They help prevent memory leaks and dangling pointers.

## Types of Smart Pointers

- `auto_ptr`: Deprecated in C++11, it was the first smart pointer introduced. It provides exclusive ownership of a dynamically allocated object but has issues with copy semantics and ownership transfer.

- `std::unique_ptr`: Represents exclusive ownership of a dynamically allocated object. It cannot be copied, only moved.

- `std::shared_ptr`: Represents shared ownership of a dynamically allocated object. Multiple `shared_ptr` instances can point to the same object, and the object is deleted when the last `shared_ptr` pointing to it is destroyed or reset.

- `std::weak_ptr`: A non-owning smart pointer that can be used to break circular references between `shared_ptr` instances. It does not affect the reference count of the object it points to.

`std::make_unique` and `std::make_shared` create `unique_ptr` and `shared_ptr` instances. They are preferred over using `new` directly, as they provide better exception safety and performance.

---

# Function Pointers

Function pointers are variables that store the address of a function. They allow you to pass functions as arguments, return functions from other functions, and create arrays of functions.

```cpp
#include <iostream>
void MyFunction(int x) {
    std::cout << "Value: " << x << std::endl;
}

void PrintValue(void (*func)(int), int value) {
    std::cout << "Calling function with value: " << value << std::endl;
    func(value);
}

int main() {
    void (*funcPtr)(int) = MyFunction;
    funcPtr(10);

    typedef void (*FuncPtrType)(int);
    FuncPtrType anotherFuncPtr = MyFunction;
    anotherFuncPtr(20);

    PrintValue(funcPtr, 30);

    return 0;
}
```

---

# Lambda Expressions

Lambda expressions are a way to define anonymous functions in C++. They allow you to create function objects on the fly, which can capture variables from their surrounding scope.

They are particularly useful for short-lived functions, such as those used in algorithms or event handling.

```cpp
#include <iostream>
#include <vector>
#include <algorithm>

void MyFunction(const std::function<void(int)>& func, int value) {
    func(value);
}

int main() {
    std::vector<int> numbers = {1, 2, 3, 4, 5};

    auto printNumber = [](int n) {
        std::cout << n << " ";
    };

    std::for_each(numbers.begin(), numbers.end(), printNumber);
    // Output: 1 2 3 4 5
    std::cout << std::endl;

    std::transform(numbers.begin(), numbers.end(), numbers.begin(),
                   [](int n) { return n * 2; });

    std::for_each(numbers.begin(), numbers.end(), printNumber);
    // Output: 2 4 6 8 10
    std::cout << std::endl;

    MyFunction(printNumber, 69);
    // Output: 42

    return 0;
}
```

In lambda expressions, you can capture variables from the surrounding scope by value or by reference. The capture clause is specified in square brackets `[]`.

- Capture by value: `[=]` captures all variables by value.
- Capture by reference: `[&]` captures all variables by reference.
- Capture specific variables: `[x, &y]` captures `x` by value and `y` by reference.
- Capture class context: `[this]` captures the `this` pointer, allowing access to class members.
- Capture nothing: `[]` captures no variables, using the parameters with reference.

---

# Templates

Similar to macros.

Templates allow you to write generic and reusable code in C++. They enable the creation of functions and classes that can operate with any data type.

Define a blueprint to the compiler to generate code for specific types when the template is instantiated.

`class` and `typename` have the same behavior in template definitions to specify type parameters.

The templates doesn't exist in the final compiled code, only the instantiated versions for the types used in the program. Compiling without errors when defined templates are not called.

Prefered to define templates in header files, because allow implicit instantiation. In cpp files, only works if the template is explicitly instantiated for the types used.

---

# Multithreading

Multithreading allows a program to perform multiple tasks concurrently, improving performance and responsiveness. C++ includes thread creation, synchronization, and atomic operations.

## Thread Creation

You can create threads using the `std::thread` class, which represents a single thread of execution. Threads can be created by passing a function or a callable object to the `std::thread` constructor.

If you don't call `join()` or `detach()` on a thread before it goes out of scope, the program will terminate with an undefined behavior (usually std::terminate ).

```cpp
#include <iostream>
#include <thread>

void MyFunction(int id) {
    std::cout << "Thread " << id << " is running" << std::endl;
}

int main() {
    std::thread t1(MyFunction, 1);
    std::thread t2(MyFunction, 2);

    t1.join(); // Wait for thread t1 to finish
    t2.join(); // Wait for thread t2 to finish

    return 0;
}
```

### Athomic Operations

### Mutexes and Semaphores

---

# LValue & RValue

- refs R & L Values

### LValue 

>  LValue "location values"

Are the left value of the equal sign, mostly the location of the variable assigned;

### RValue

Are the right value of the equal sign, temporary objects that do not have a persistent memory location;

Can be a return of a function, since it's a temporary value;

##### Example

```cpp
int a = 10; // a is LValue, 10 is RValue
int b = a; // b is LValue, a is RValue
```

```cpp
int GetValue() {
    return 10;
}

int main() {
    int a = GetValue();
    GetValue() = 20; // Error, GetValue() is RValue
}
```

```cpp
int& GetValue() {
    static int value = 10; // static to keep the reference valid
    return value; // returns an LValue reference
}

int main() {
    int a = GetValue();
    GetValue() = 20; // Now this works, GetValue() is LValue
}
```

```cpp
int& a = 10; // error, cannot bind RValue to LValue reference
const int& b = 10; // ok, can bind RValue to const LValue reference
int&& b = 10; // ok, can bind RValue to RValue reference
```

#### LValue Reference

A reference to an LValue, which allows you to modify the original variable.

```cpp
int a = 10;    // a is LValue
int& refA = a; // refA is an LValue reference to a
refA = 20;    // modifies a, now a is 20
```

#### RValue Reference

A reference to an RValue, which allows you to bind temporary values.

```cpp
int&& rvalueRef = 0; // rvalueRef is an RValue reference to the temporary value 0

int GetValue() {
    return 10;
}

int&& rvalueRef = GetValue(); // rvalueRef is an RValue reference to the temporary value returned by GetValue()
```

In function parameters, you can use RValue references to accept temporary values:

```cpp
void ProcessValue(int&& value) {
    // value is an RValue reference, can be used as a temporary
    std::cout << "Processing: " << value << std::endl;
}
int main() {
    ProcessValue(10); // 10 is an RValue, can be passed to ProcessValue
}
```

### Move Semantics

Move semantics allow the transfer of resources from one object to another without copying, which can significantly improve performance, especially for large objects.

When an object is moved, its resources are transferred to another object, leaving the original object in a valid but unspecified state. This is done using RValue references and move constructors/assignment operators.

#### Contructors

Constructors can take LValue and RValue references as parameters to allow for efficient initialization of objects.

```cpp
class MyClass {
public:
    MyClass(int& value) // LValue reference constructor
    {
        std::cout << "LValue constructor called with: " << value << std::endl;
    }

    MyClass(int&& value) // RValue reference constructor
    {
        std::cout << "RValue constructor called with: " << value << std::endl;
    }

    MyClass(const MyClass& other) // Copy constructor
    {
        std::cout << "Copy constructor called" << std::endl;
    }

    MyClass(MyClass&& other) // Move constructor
    {
        std::cout << "Move constructor called" << std::endl;
    }

    MyClass& operator=(const MyClass& other) // Copy assignment operator
    {
        std::cout << "Copy assignment operator called" << std::endl;
        return *this;
    }

    MyClass& operator=(MyClass&& other) // Move assignment operator
    {
        std::cout << "Move assignment operator called" << std::endl;
        return *this;
    }

    ~MyClass()
    {
        std::cout << "Destructor called" << std::endl;
    }
};

int main() {
    int x = 10;
    MyClass obj1(x); // Calls LValue constructor
    MyClass obj2(20); // Calls RValue constructor

    MyClass obj3(obj1); // Calls Copy constructor
    MyClass obj4(std::move(obj2)); // Calls Move constructor

    obj3 = obj1; // Calls Copy assignment operator
    obj4 = std::move(obj2); // Calls Move assignment operator

    return 0;
}
```

Example of a custom string class that implements move semantics:

```cpp
class String {
public:
    String(const char* str) : data(new char[strlen(str) + 1])
    {
        strcpy(data, str);
    }

    String(const String& other) : data(new char[strlen(other.data) + 1])
    {
        strcpy(data, other.data);
    }

    String(String&& other) noexcept : data(other.data)
    {
        other.data = nullptr; // Transfer ownership
    }

    String& operator=(const String& other)
    {
        if (this != &other)
        {
            delete data;
            data = new char[strlen(other.data) + 1];
            strcpy(data, other.data);
        }

        return *this;
    }

    String& operator=(String&& other) noexcept
    {
        if (this != &other)
        {
            delete data;
            data = other.data;
            other.data = nullptr; // Transfer ownership
        }

        return *this;
    }

    ~String()
    {
        delete data;
    }

    void Print() const
    {
        std::cout << data << std::endl;
    }

private:
    char* data;
};

int main() {
    String str1("Hello");
    String str2("World");

    str1.Print(); // Output: Hello
    str2.Print(); // Output: World

    String str3 = std::move(str1); // Move constructor
    str3.Print(); // Output: Hello
    str1.Print(); // Output: (empty, str1 is now in a valid but unspecified state)

    str2 = std::move(str3); // Move assignment operator
    str2.Print(); // Output: Hello

    return 0;
}

```

To move some object to another object, you can use the `std::move` function, which casts the object to an RValue reference (`operator&&`), allowing the move constructor or move assignment operator to be called.

---

# Maps

Maps are associative containers that store elements in key-value pairs. They allow fast retrieval of values based on their keys, making them useful for various applications.

> The key must be hashable and comparable, meaning it must support equality and ordering operations. The value can be any type.

If the new key is already present in the map, the value will be updated with the new value. If the key is not present, a new key-value pair will be added to the map and returned as reference, if the key has a lessthan operator.

You can use `find` method to check if a key exists in the map before creating one for that key, then use `at` to get that value. If the key is not found, `find` returns an iterator to the end of the map, which can be checked against `end()`.

## Types of Maps

- `std::map`: A sorted associative container that stores key-value pairs in a balanced binary tree (usually a Red-Black tree). It provides logarithmic time complexity for insertions, deletions, and lookups.

- `std::unordered_map`: An unsorted associative container that stores key-value pairs in a hash table. It provides average constant time complexity for insertions, deletions, and lookups, but does not maintain any order of elements.

- `std::multimap`: Similar to `std::map`, but allows multiple elements with the same key. It is also sorted and provides logarithmic time complexity for operations.

- `std::unordered_multimap`: Similar to `std::unordered_map`, but allows multiple elements with the same key. It provides average constant time complexity for operations, but does not maintain any order of elements.

```cpp
#include <iostream>
#include <map>
#include <unordered_map>

struct MyKey {
    int id;
    std::string name;

    // Define comparison operator for std::map
    bool operator<(const MyKey& other) const {
        return id < other.id;
    }
};

template <>
struct std::hash<MyKey> {
    std::size_t operator()(const MyKey& key) const {
        return std::hash<std::string>()(key.name) ^ std::hash<int>()(key.id);
    }
};

int main() {
    std::map<MyKey, int> myMap;
    myMap[{1, "Alice"}] = 100;
    myMap[{2, "Bob"}] = 200;
    myMap[{1, "Alice"}] += 50; // Update value for existing key
    for (const auto& pair : myMap) {
        std::cout << "Key: (" << pair.first.id << ", " << pair.first.name << "), Value: " << pair.second << std::endl;
    }

    return 0;
}
```

## Differences Between Maps

- `std::map` is sorted by keys, while `std::unordered_map` is not. This means that `std::map` maintains the order of elements based on their keys, while `std::unordered_map` does not guarantee any specific order.

- `std::map` uses a balanced binary tree for storage, while `std::unordered_map` uses a hash table. This affects the performance of operations, with `std::map` having O(log n) time complexity and `std::unordered_map` having average O(1) time complexity.

- `std::map` allows only unique keys, while `std::multimap` allows multiple elements with the same key. This means that in a `std::map`, each key can only appear once, while in a `std::multimap`, multiple elements can share the same key.

- `std::unordered_map` and `std::unordered_multimap` allow multiple elements with the same key, similar to `std::multimap`, but they do not maintain any order of elements.

- `std::map` and `std::multimap` provide iterators that traverse elements in sorted order, while `std::unordered_map` and `std::unordered_multimap` provide iterators that do not guarantee any specific order.

# Notation

- `O(1)`: Constant time complexity, the operation takes the same amount of time regardless of the input size.

- `O(n)`: Linear time complexity, the operation takes time proportional to the input size.

- `O(log n)`: Logarithmic time complexity, the operation takes time proportional to the logarithm of the input size. This is common in operations on balanced binary trees, such as `std::map`.

- `O(n log n)`: Linearithmic time complexity, the operation takes time proportional to the input size multiplied by the logarithm of the input size. This is common in sorting algorithms.

- `O(2^n)`: Exponential time complexity, the operation takes time proportional to 2 raised to the power of the input size. This is common in recursive algorithms with multiple branches.

- `O(n!)`: Factorial time complexity, the operation takes time proportional to the factorial of the input size. This is common in algorithms that generate all permutations of a set.

# Links

https://www.youtube.com/playlist?list=PLlrATfBNZ98dudnM48yfGUldqGD0S4FFb

https://en.cppreference.com/w/cpp/language/reference.html
https://en.cppreference.com/w/cpp/language/templates.html
https://learn.microsoft.com/en-us/cpp/cpp/references-cpp?view=msvc-170
