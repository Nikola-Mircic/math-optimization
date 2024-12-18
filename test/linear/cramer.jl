using .LinearEquations;

@testset "Cramer's rule " begin
    A = [ 1 -2  3;
        1  4  5;
        -2  1  3];

    B = [ 5;
        27;
        -1]

    x = cramer(A, B);

    x = map(x) do xi 
        round(Int64, xi); 
    end;
    
    @test x[1] == 5;
    @test x[2] == 3;
    @test x[3] == 2;
end