# -*- coding: utf-8 -*-

""" Union of lists
Exports :

- **bundle_concat_list_generic** :
    - list_concat

"""

using ..UTCGP: list_generic_basic
using .list_generic_basic

# ########### #
# CONCAT LIST #
# ########### #

bundle_concat_list_generic = FunctionBundle(identity_list, new_list)

# FUNCTIONS ---


"""Concats two lists, should be of the same type.

Although the types of the lists elements are not enforced.

T is a generic type.

Parameters
----------
list_a : list[T]
           A given list. In this case all elements are asumed
           to be of the same type.

list_b : list[T]
           A given list. In this case all elements are asumed
           to be of the same type.

Returns
-------
list[T]
        The **union** of both lists

Examples
--------
>>> list_concat([1,2,3,4], [1,2])
[1,2,3,4,1,2]

>>> pick_from_inclusive_generic([1], [3])
[1,3]

>>> pick_from_inclusive_generic([], [])
[]
"""
function list_concat(list_a::Vector{T}, list_b::Vector{T}, args...)::Vector{T} where {T}
    list_c = [copy(list_a); copy(list_b)]
    return list_c
end

append_method!(bundle_concat_list_generic, FunctionWrapper(list_concat))