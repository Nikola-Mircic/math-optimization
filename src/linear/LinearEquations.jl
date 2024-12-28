module LinearEquations

    include("cramer.jl");
    include("gauss.jl");
    include("doolittle.jl");
    include("crout.jl");

    export cramer;
    export gauss;
    export doolittle;
    export crout;
end