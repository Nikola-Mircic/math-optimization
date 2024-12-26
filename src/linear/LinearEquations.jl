module LinearEquations

    include("cramer.jl");
    include("gauss.jl");
    include("doolitlle.jl");

    export cramer;
    export gauss;
    export doolitlle;
end