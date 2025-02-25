module NonlinearEquations
    include("newton-raphson.jl");
    include("halley.jl");
    include("bisection.jl");

    export Newton_Raphson;
    export Halley;
    export Bisection;
end