<!-- $theme: gaia -->
<!-- page_number: true -->

## Writing Advanced Matlab Code
### SSW
#### David Eriksson & Eric Lee

---

# Outline
1. MATLAB performance examples

---

## MATLAB programming practices

- Preallocate
- Vectorize
- Place independent operations outside loops
- Create new variables if data type changes
- Use short-circuit operators
- Avoid global variables
- Avoid overloading built-ins
- Avoid using "data as code"

---

# Example 1: Dynamic memory allocation

1. We only allocate once (good)
2. MATLAB uses column-major, so it can just extend the memory when we add a column (ok)
3. Adding a row forces us to move most of the elements in X (bad)
4. MATLAB first forms [X, x] before assigning (bad)
5. Avoids the for-loop, fastest way I know of

**Note:** 3-4 allocate $\mathcal{O}(np^2)$ memory

---

# Example 2: Sparse memory allocation

1. Add element by element to the sparse matrix
2. Say what the non-zero elements are but assign values later
3. Initialize with non-zero values

**Note:** 1 requires inserting elements into the compressed sparse column (CSC) format (expensive)

**Note:** 2 avoids inserting elements, but need to fill out the values

---

# Example 3: Using ()

1. Matrix times vector $\mathcal{O}(n^2)$
2. MATLAB evaluates from left to right, same as above
3. Dot product $\mathcal{O}(n)$

**Note:** Equivalent mathematically, but vastly different flop counts

---

# Example 4: Never trust JIT!

- MATLAB uses Just-in-Time (JIT) compilation to optimize your code
- Don't expect JIT to always speed-up your code!
	- Better to write efficient code than rely on GIT
- JIT can speed up 1 and 2, but not 3
	- A bit surprising since 3 is so similar to 1

---

# Example 5: Symmetry

- MATLAB uses the fact that $A^TA$ and $AA^T$ are symmetric to speed up the computation!

---

# Example 6: Inlining

- Inline simple functions that are called frequently
- The communication overhead can be significant

---

# Example 7: Indexing

- Both logical indexing and find are much faster than the loop
- JIT is able to vectorize the loop

---

# Example 8: More rows or more columns?

- The code is ~70 times faster when we have more rows than columns
- CSC is great for quickly acessing columns
	- Not great if the columns are small
	- Larger speed-up makes the matvecs faster
----
# Profiling
- Program analysis that measures memory/time complexity of a program and the frequency/duration of function calls.
- Lots of software for profiling out there
	- Language specific; MATLAB has own!
	- MATLAB Profiler rich with features
----
# Profiling using GUI

----
# Profiling in Code
```{r, eval=FALSE}
profile('on')
...
dostuff() // we would like dostuff to run faster
...
profile('viewer')
profsave()
```
----
# Parallel Pool

- Set of workers allocated before large task
- Expensive to allocate and deallocate!
- Workers located on local or remote machine
	- local is the default
----
# Pool Managment
```{r, eval=FALSE}
parpool(4) //Before parallel area
...
...
p = gcp('nocreate') //nocreate flag
delete(p)
```
- Pool also automatically created at the start of parallel function calls
	- Manual managment in code base is superior (and very easy)
----
# Parallel Loops
```{r, eval=FALSE}
for i = 1:n
    dostuff(i)
end
```
```{r, eval=FALSE}
parfor i = 1:
    dostuff(i)
end
```
- Note that loop iterations are independent!
- Ordering of loop nondeterministic
	- i.e. 6, 2, 3, 1, 5, 4
----
# Other Paradigms Supported
- Mapreduce
- SPSD (Single Program Multiple Data)
- Shared Arrays 
	- (Distributed Memory Paradigms)
- Most of these can be accomplished via parfor
	- these implementations are optimized and less of a headache 
- No While-Looping (out-of-the-box)
----
# Interactive Parallel
```{r, eval=FALSE}
pmode('start',4) //opens up GUI
...
...
pmode('quit')
```
- Interative Parallel mode provides a GUI to each worker
	- GUI limited (not regular MATLAB command line)
----
# Limitations 
- Not good for fine-grained managment
	-  "I want worker A to do task A, worker B to do task B ... worker K to do task K"
- Hacky (and very inefficient) Solution: 
```{r, eval=FALSE}
function hacky(data_1, data_2 ... data_k)
parfor i = 1:k
    switch idx
    	case 1
        case 2
        ...
        case k
    end
end
```
----
# Limitations
- Some functions will use parallelism 
	- Hard to know ... sometimes adding workers slows down code
	- Toolboxes in Comp Bio, Optimization, Singal Processing
- In general, far less expressive than a dedicated parallel language
	- but nonetheless an **excellent** tool for many purposes