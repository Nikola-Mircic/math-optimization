"""
    function FalsePosition(f::Function, x::Real, y::Real)

In mathematics, the regula falsi, method of false position, or
false position method is a very old method for solving an
equation with one unknown; this method, in modified form, is
still in use. In simple terms, the method is the trial and error
technique of using test ("false") values for the variable and
then adjusting the test value according to the outcome.
This is sometimes also referred to as "guess and check".
Versions of the method predate the advent of algebra and the
use of equations. 

# Arguments:
    - `f` : A real-valued function
    - `x` : Beggining of the starting interval
    - `y` : End of the starting interval
    - 'criteria' : A function which checks whether we obtained an acceptable solution. 
                 Accepts current root estimate and iteration

# Examples:
```julia
function y(x)
    return (x-3)^3 - x^2 + 6;
end

println(FalsePosition(y, 1, 2)) # ~ 1.41
println(FalsePosition(y, 2, 3))  # ~ 2.40
```

# Overloads:
"""
function FalsePosition(f::Function, x::Real, y::Real)
    return FalsePosition(f,
                  x,
                  y,
                  (x,i) -> return abs(f(x)) < 0.001 )
end

function FalsePosition(f::Function, x::Real, y::Real, criteria::Function)
    if sign(f(x)) == sign(f(y))
        println("Function values at the end of the interval must be of opposite signs!")
        println("Provided: f(x)=$(f(x)) and f(y)=$(f(y))")
        return nothing;
    end

    i = 0; # Iteration counter
    xi = nextPoint(f, x, y);

    while !criteria(xi, i)
        i += 1;

        if sign(f(x)) == sign(f(xi))
            x = xi
        else
            y = xi
        end

        xi = nextPoint(f, x, y);
    end

    return xi;
end

function nextPoint(f::Function, x::Real, y::Real,)
    p = y * f(x) - x * f(y);
    p /= f(x) - f(y);

    return p;
end