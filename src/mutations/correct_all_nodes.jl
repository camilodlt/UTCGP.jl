
function correct_all_nodes!(
    ut_genome::UTGenome,
    model_architecture::modelArchitecture,
    meta_library::MetaLibrary,
    shared_inputs::SharedInput,
)
    for single_genome in ut_genome
        correct_all_nodes!(
            single_genome,
            meta_library,
            model_architecture,
            ut_genome,
            shared_inputs,
        )
    end
end

function correct_all_nodes!(
    genome::SingleGenome,
    meta_library::MetaLibrary,
    model_architecture::modelArchitecture,
    ut_genome::UTGenome,
    shared_inputs::SharedInput,
)
    for node in genome
        correct_node!(
            node,
            meta_library[node.y_position],
            model_architecture,
            ut_genome,
            shared_inputs,
        )
    end
end

function correct_node!(
    node::AbstractEvolvableNode,
    library::Library,
    model_architecture::modelArchitecture,
    ut_genome::UTGenome,
    shared_inputs::SharedInput,
)
    max_calls = 1000
    call_nb = 0
    while !check_functionning_node(
        node,
        library,
        ut_genome,
        shared_inputs,
        model_architecture,
    )
        mutate_one_element_from_node!(node)
        if call_nb > max_calls
            @warn "Can't find a correct mutation after $call_nb"
            # if force_fn
            #     node.node_material[1].value = 1  # Convention for default fn
            #     @warn "Node didn't find a functionning call after $max_calls iterations. Current call : $call_nb"
            # end
        end
    end
end

