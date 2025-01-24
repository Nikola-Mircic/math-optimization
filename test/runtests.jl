using MathOptimization;
using Test;

@testset verbose = true "Mathematical optimization" begin
    include("linear/cramer.jl");
    include("linear/gauss.jl");
    include("linear/doolittle.jl");
    include("linear/crout.jl");

    include("nonlinear/newton-raphson.jl");
end