module NonlinearEquations
    include("newton-raphson.jl");
    include("halley.jl");

    export Newton_Raphson;
    export Halley;
end