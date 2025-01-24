using MathOptimization;
using Test;

@testset verbose = true "Mathematical optimization" begin
    include("linear/Linear.jl");
    include("nonlinear/Nonlinear.jl");
end