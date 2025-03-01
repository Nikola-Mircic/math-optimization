module NonlinearEquations
    include("newton-raphson.jl");
    include("halley.jl");
    include("bisection.jl");
    include("false_position.jl");

    export Newton_Raphson;
    export Halley;
    export Bisection;
    export FalsePosition;
end