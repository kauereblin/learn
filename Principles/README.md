# SOLID

- **[S]ingle Responsibility Principle**: A class/method should have only one responsability.

- **[O]pen/Closed Principle**: A class should be open for extension but closed for modification.

- **[L]iskov Substitution Principle**: A superclass should be substitutable for its subclasses and the application should still function.

- **[I]nterface Segregation Principle**: A client should not be forced to implement an interface that it does not use.

- **[D]ependency Inversion Principle**: High-level should not depend on low-level. Both should depend on abstractions. Abstractions should not depend on details. Details should depend on abstractions. Depend on abstraction, not on concretions.

# KISS

> Keep It Simple, Stupid.

Direct and clear codes are better for developing, maintaining, and scaling. Don’t optimize unless there is a requirement.

Break the problem into smaller parts and solve them one by one. Don't try to solve everything at once.

# DRY

> Don't Repeat Yourself.

*Rule of three*. Reuse and reduce duplicated code. Focus on centralize the business logic. Less code results in better maintainibility.

# YAGNI

> You aren't gonna need it.

It's a principle of XP, that suggest to don't create unessential code, avoiding over-engineering. Don’t optimize prematurely!

# TDA

> Tell, Don't Ask.

It's a principle that suggest to avoid asking for the state of an object to make a decision. Instead, tell the object what to do.

```
class Foo {
    private int value;
    get() {
        return value;
    }

    set(int value) {
        this.value = value;
    }
}

foo = new Foo();
if (foo.get() > 10) {
    foo.set(foo.get() + 1);
}

// ---

class Foo {
    // ...

    incrementGreaterTen(value) {
        if (value > 10) {
            value++;
        }
    }
}

foo = new Foo();
foo.incrementGreaterTen(11);

```

# TDD

> Test-Driven Development.

Write tests before writing the code:

1. Write a test that fails.

2. Write the code that makes the test pass.

3. Refactor the code.

4. Repeat.

# BDD

> Behavior-Driven Development.

It's a software development methodology that focus on the behavior of the software:

1. Define the behavior of the software.

2. Write the tests that describe the behavior.

3. Write the code that makes the tests pass.

4. Refactor the code.

5. Repeat.

# ACID

- **[A]tomicity**: All operations in a transaction must be completed successfully, otherwise the transaction is aborted.

- **[C]onsistency**: The database must remain in a consistent state before and after the transaction.

- **[I]solation**: Transactions should be isolated from each other.

- **[D]urability**: Once a transaction is committed, it must remain committed.

# CAP Theorem

> Brewer’s Theorem

- **[C]onsistency**: All nodes see the same data at the same time.

- **[A]vailability**: A guarantee that every request receives a response about whether it was successful or failed.

- **[P]artition Tolerance**: The system continues to operate despite network partitions.

**Take Two.**

The CAP theorem states that it is not possible to guarantee all three of the desirable properties — consistency, availability, and partition tolerance at the same time in a distributed system with data replication.
