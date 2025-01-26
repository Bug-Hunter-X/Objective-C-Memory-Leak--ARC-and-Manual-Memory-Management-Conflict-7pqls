# Objective-C Memory Leak: ARC and Manual Memory Management Conflict

This repository demonstrates a common Objective-C memory leak that occurs when developers mix ARC (Automatic Reference Counting) and manual memory management techniques, often involving temporary objects.  The `bug.m` file shows the problematic code, where a string is allocated but not properly released, leading to a memory leak.  The `bugSolution.m` file provides the corrected version, showing how to avoid this pitfall.

## How to Reproduce

1. Clone this repository.
2. Open `bug.m` and examine the `someMethod` function.
3. Build and run the project (requires an Objective-C development environment).
4. Use memory profiling tools to verify the memory leak.

## Solution

The solution is to correctly manage the memory of temporary variables when not using properties managed by ARC.  The corrected code, shown in `bugSolution.m`, demonstrates this.