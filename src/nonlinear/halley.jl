using ForwardDiff

# Function to find first derivative of a function in point x
function d(f::Function, x::T) where {T <: Real}
    return ForwardDiff.derivative(f, x);
end

# Function to find second derivative of a function in point x
function d2(f::Function, x::T) where {T <: Real}
    return ForwardDiff.derivative((x)->d(f,x), x);
end

"""
    function Halley(f::Function, x::Real)

In numerical analysis, Halley's method is a root-finding algorithm used for functions
of one real variable with a continuous second derivative. Edmond Halley was an 
English mathematician and astronomer who introduced the method now called by his name.

The algorithm is second in the class of Householder's methods, after Newton's method.
Like the latter, it iteratively produces a sequence of approximations to the root;
their rate of convergence to the root is cubic

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

println(Halley(y, -2)) # ~ -1
println(Halley(y, 5))  # ~ 3
```

# Overloads:
"""
function Halley(f::Function, x::Real)
    return Halley(f,
                  x,
                  (x,i) -> return abs(f(x)) < 0.001 || i > 10;)
end

function Halley(f::Function, x::Real, criteria::Function)
    i = 0; # Iteration counter
    xi = x; # Solution in i-th iteration
    x_best = x; # Best of all solutions
    while !criteria(xi, i)
        i+=1;

        xi = xi - 2*f(xi)*d(f,xi) / (2 * d(f,xi)^2 - f(xi)*d2(f, xi));
        
        x_best = (abs(f(xi)) <= abs(f(x_best))) ? xi : x_best;
    end

    return x_best
end