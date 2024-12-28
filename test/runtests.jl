using NumericalAnalysis;
using Test;

@testset verbose = true "Numerical analysis" begin
    include("linear/cramer.jl");
    include("linear/gauss.jl");
    include("linear/doolittle.jl");
    include("linear/crout.jl");
end