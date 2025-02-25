"""
    function Bisection(f::Function, x::Real, y::Real)

In mathematics, the bisection method is a root-finding method that applies
to any continuous function for which one knows two values with opposite signs.
The method consists of repeatedly bisecting the interval defined by these
values and then selecting the subinterval in which the function changes sign,
and therefore must contain a root.

It is a very simple and robust method, but
it is also relatively slow. Because of this, it is often used to obtain a 
rough approximation to a solution which is then used as a starting point
for more rapidly converging methods.

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

println(Bisection(y, 1, 2)) # ~ 1.41
println(Bisection(y, 2, 3))  # ~ 2.40
```

# Overloads:
"""
function Bisection(f::Function, x::Real, y::Real)
    return Bisection(f,
                  x,
                  y,
                  (x,i) -> return abs(f(x)) < 0.001 )
end

function Bisection(f::Function, x::Real, y::Real, criteria::Function)
    if sign(f(x)) == sign(f(y))
        println("Function values at the end of the interval must be of opposite signs!")
        println("Provided: f(x)=$(f(x)) and f(y)=$(f(y))")
        return nothing;
    end

    if x > y
        x, y = y, x
    end

    i = 0; # Iteration counter
    xi = x + (y-x)/2;

    while !criteria(xi, i)
        i += 1;

        if sign(f(x)) == sign(f(xi))
            x = xi
        else
            y = xi
        end

        xi = x + (y-x)/2;
    end

    return xi;
end