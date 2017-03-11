<!-- $theme: gaia -->
<!-- page_number: true -->

## Writing Advanced Matlab Code
### SSW
#### David Eriksson & Eric Lee

---

# Outline
1. MATLAB performance examples

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

Note: 1 requires inserting elements into the compressed sparse column format (expensive)

Note: 2 avoids inserting elements, but need to fill out the values

---

