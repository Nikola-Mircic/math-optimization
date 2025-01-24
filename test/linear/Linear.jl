@testset verbose = true "Linear methods" begin
    include("cramer.jl");
    include("gauss.jl");
    include("doolittle.jl");
    include("crout.jl");
end