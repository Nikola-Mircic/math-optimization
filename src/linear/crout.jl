using LinearAlgebra;

"""

    function crout(A::Matrix)

The Crout matrix decomposition is an LU decomposition which decomposes a matrix into a
lower triangular matrix `L` and an upper triangular matrix `U`. This decomposition is widely used in
solving systems of linear equations, inverting matrices, and computing determinants.

# Arguments:
        - `A` : coeficient matrix

# Returns:
    - `L` : Lower triangular matrix
    - `U` : Upper triangular matrix

"""
function crout(A::Matrix{T}) where {T <: Number}
    (row, col) = size(A);

    L = zeros(Number, row, col);
    U = zeros(Number, row, col);
    
    for i in 1:row
        U[i, i] = 1;
    end

    for i in 1:row
        # i-th row of L matrix
        for j in 1:i
            s = dot(L[i, 1:j-1], U[1:j-1, j]);

            L[i, j] = A[i, j] - s;
        end

        # i-th row of U matrix
        for j in i:col
            s = dot(L[i, 1:j-1], U[1:j-1, j]);
            
            U[i, j] = (A[i, j] - s)/L[i,i];
        end
    end

    return L, U;
end