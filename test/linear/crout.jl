using .LinearEquations;

@testset "Crout's method " begin
    A = [ 2  1 -1;
         -3 -1  2;
         -2  1  2];

    L, U = crout(A);
 
    @test L == [   2    0    0;
                  -3  0.5    0;
                  -2  2.0 -1.0];
    @test U == [1  0.5  -0.5;
                0    1     1;
                0    0     1];
end