module MathOptimization
    include("linear/LinearEquations.jl");
    include("nonlinear/NonlinearEquations.jl");

    export LinearEquations;
    export NonlinearEquations;
end # module MathOptimization