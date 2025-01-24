using ForwardDiff

# Function to find first derivative of a function in point x
function d(f::Function, x::T) where {T <: Real}
    return ForwardDiff.derivative(f, x);
end

"""
    function Newton_Raphson(f::Function, x::Real)

In numerical analysis, the Newton–Raphson method, also known simply as Newton's method,
named after Isaac Newton and Joseph Raphson, is a root-finding algorithm which produces 
successively better approximations to the roots (or zeroes) of a real-valued function.

# Arguments:
    - `f` : A real-valued function
    - `x` : Real value representing starting point
    - 'criteria' : A function which checks whether we obtained an acceptable solution. 
                 Accepts current root estimate and iteration

# Examples:
```julia
function y(x)
    return (x-1)^2 - 4;
end

println(Newton_Raphson(y, -2)) # ~ -1
println(Newton_Raphson(y, 5))  # ~ 3
```

# Overloads:
"""
function Newton_Raphson(f::Function, x::Real)
    return Newton_Raphson(f,
                          x,
                          (x,i) -> return abs(f(x)) < 0.001 || i > 10;)
end

function Newton_Raphson(f::Function, x::Real, criteria::Function)
    i = 0; # Iteration counter
    xi = x; # Solution in i-th iteration
    x_best = x; # Best of all solutions
    while !criteria(xi, i)
        i+=1;

        xi = xi - f(xi)/d(f,xi);
        
        x_best = (abs(f(xi)) <= abs(f(x_best))) ? xi : x_best;
    end

    return x_best
end