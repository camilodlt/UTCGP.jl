# -*- coding::utf-8 -*-

function evaluate_program(
    program::Program,
    chromosomes_types::Vector{Type},
    metalibrary::MetaLibrary,
)::Any
    local output = nothing
    local calling_node = nothing
    @assert length(program) > 0
    for (ith_operation, operation) in enumerate(program)
        fn, calling_node, inputs = (operation.fn, operation.calling_node, operation.inputs)
        # calling_node._functionning_node(
        #     chromosomes_types=chromosomes_types,
        #     library=metalibrary.libraries[calling_node.type_position],
        # )
        if calling_node.value === nothing
            # Only calc if the node is nothing. If not it means that
            # the value was already computed. No need to recompute twice.
            inputs_values = []
            for operationInput in inputs
                node = extract_input_node_from_operationInput(operationInput)
                push!(inputs_values, get_node_value(node))
            end
            res = fn(inputs_values...)  # TODO add possible node params? besides inputs
            calling_node.value = res
        end
    end

    @assert calling_node isa OutputNode
    return output
end

function evaluate_individual_programs(
    individual_programs::IndividualPrograms,
    chromosomes_types::Vector{Type},
    metalibrary::MetaLibrary,
)::Vector{<:Any}
    outputs = []
    for (ith_program, program) in enumerate(individual_programs)
        output = evaluate_program(program, chromosomes_types, metalibrary)
        push!(outputs, output)
    end
    return outputs
end

function evaluate_population_programs(
    population_programs::PopulationPrograms,
    model_architecture::modelArchitecture,
    metalibrary::MetaLibrary,
)
    Vector{Vector{<:Any}}
    n_individuals = length(population_programs)
    @assert n_individuals > 0 "No individuals to evaluate"
    pop_outputs = [Vector() for _ = 1:n_individuals]
    for (ith_individual, individual_programs) in enumerate(population_programs)
        push!(
            pop_outputs[ith_individual],
            evaluate_individual_programs(
                individual_programs,
                model_architecture.chromosomes_types,
                metalibrary,
            ),
        )
    end
    return pop_outputs
end