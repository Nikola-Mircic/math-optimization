using .NonlinearEquations;

@testset "Halley's method " begin
    # Simple quadratic function with roots at x1 = -1 and x2 = 3
    function y(x)
        return (x-1)^2 - 4;
    end

    @test abs(Halley(y, -2) + 1) <= 0.001;
    @test abs(Halley(y, 5) - 3)  <= 0.001;

    # A more complex function with four different roots
    function y2(x)
        return x^4 - 2x^3 - 3x^2 + 3x;
    end

    @test abs(Halley(y2, -2) + 1.46) <= 0.001;
    @test abs(Halley(y2, -0.5))      <= 0.001;
    @test abs(Halley(y2, 1) - 0.76)  <= 0.001;
    @test abs(Halley(y2, 3) - 2.699) <= 0.001;
end