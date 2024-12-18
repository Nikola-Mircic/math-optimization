using .LinearEquations;

@testset "Gauss–Jordan elimination " begin
    A = [ 2  1 -1;
         -3 -1  2;
         -2  1  2];

    B = [  8;
         -11;
          -3];

    x = gauss(A, B);

    x = round.(Int64, x);
    
    @test x[1] == 2;
    @test x[2] == 3;
    @test x[3] == -1;
end