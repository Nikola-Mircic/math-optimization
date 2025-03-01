@testset verbose = true "Nonlinear methods" begin
    include("newton-raphson.jl");
    include("halley.jl");
    include("bisection.jl");
    include("false_position.jl");
end