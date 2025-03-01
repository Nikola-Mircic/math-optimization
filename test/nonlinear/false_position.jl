using .NonlinearEquations;

@testset "False postiont method " begin
    # A function with four different roots
    function y(x)
        return x^4 - 2x^3 - 3x^2 + 3x;
    end

    @test abs(FalsePosition(y, -2, -1) + 1.46) <= 0.001;
    @test abs(FalsePosition(y, -1, 0.5))       <= 0.001;
    @test abs(FalsePosition(y, 0.5, 1) - 0.76) <= 0.001;
    @test abs(FalsePosition(y, 2, 3) - 2.699)  <= 0.001;
end