using .LinearEquations;

@testset "Doolittle's method " begin
    A = [ 2  1 -1;
         -3 -1  2;
         -2  1  2];

    L, U = doolittle(A);
 
    @test L == [   1    0    0;
                -1.5    1    0;
                -1.0  4.0    1];
    @test U == [2    1      -1;
                0  0.5     0.5;
                0    0    -1.0];
end