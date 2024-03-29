

```@meta
CurrentModule = UTCGP
DocTestSetup = quote
  # list integer
  using UTCGP.listinteger_iscond:is_sup_0
  using UTCGP.listinteger_iscond:is_eq_0
  using UTCGP.listinteger_iscond:is_less_0

  using UTCGP.listinteger_iscond:compare_tuple_a_gr_b
  using UTCGP.listinteger_iscond:compare_tuple_a_eq_b
  using UTCGP.listinteger_iscond:compare_tuple_a_less_b
end
```

```@contents
Pages = ["list_integer.md"]
```

# LIST Integer Operations

## Basic operations 

### Module 

### Functions 


## Comparison against 0

### Module
```@docs
UTCGP.listinteger_iscond
```

### Functions

```@docs
UTCGP.listinteger_iscond.is_sup_0
```
```jldoctest
julia> is_sup_0([-5,-1,0,1,5])
5-element Vector{Int64}:
 0
 0
 0
 1
 1
```
```@docs
UTCGP.listinteger_iscond.is_eq_0
```
```jldoctest
julia> is_eq_0([-5,-1,0,1,5])
5-element Vector{Int64}:
 0
 0
 1
 0
 0
```
```@docs
UTCGP.listinteger_iscond.is_less_0
```
```jldoctest
julia> is_less_0([-5,-1,0,1,5])
5-element Vector{Int64}:
 1
 1
 0
 0
 0
```

```@docs
UTCGP.listinteger_iscond.compare_tuple_a_gr_b
```
```jldoctest
julia> compare_tuple_a_gr_b([(0.1,0.2), (0.1,0.1), (0.1,0.0)])
3-element Vector{Int64}:
 0
 0
 1
```
```@docs
UTCGP.listinteger_iscond.compare_tuple_a_eq_b
```
```jldoctest
julia> compare_tuple_a_eq_b([(0.1,0.2), (0.1,0.1), (0.1,0.0)])
3-element Vector{Int64}:
 0
 1
 0
```
```@docs
UTCGP.listinteger_iscond.compare_tuple_a_less_b
```
```jldoctest
julia> compare_tuple_a_less_b([(0.1,0.2), (0.1,0.1), (0.1,0.0)])
3-element Vector{Int64}:
 1
 0
 0
```
