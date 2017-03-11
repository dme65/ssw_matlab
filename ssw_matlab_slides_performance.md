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

Note: 3-4 allocate $\mathcal{O}(np^2)$ memory

---

# Example 2: Sparse memory allocation

1. Add element by element to the sparse matrix
2. Say what the non-zero elements are but assign values later
3. Initialize with non-zero values

Note: 1 requires inserting elements into the compressed sparse column (CSC) format (expensive)

Note: 2 avoids inserting elements, but need to fill out the values

---

# Example 3: Using ()

1. Matrix times vector $\mathcal{O}(n^2)$
2. MATLAB evaluates from left to right, same as above
3. Dot product $\mathcal{O}(n)$

Note: Equivalent mathematically, but vastly different flop counts

---

# Example 4: Never trust JIT!

- MATLAB uses Just-in-Time (JIT) compilation to optimize your code
- Don't expect JIT to always speed-up your code!
	- Better to write efficient code than rely on GIT
- JIT can speed up 1 and 2, but not 3
	- A bit surprising since 3 is so close to 

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