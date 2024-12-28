using LinearAlgebra;

"""

    function doolittle(A::Matrix)

The Doolittle Algorithm is a method for performing LU Decomposition,
where a given matrix is decomposed into a lower triangular matrix `L`
and an upper triangular matrix `U`. This decomposition is widely used in
solving systems of linear equations, inverting matrices, and computing determinants.

# Arguments:
        - `A` : coeficient matrix

# Returns:
    - `L` : Lower triangular matrix
    - `U` : Upper triangular matrix

"""
function doolittle(A::Matrix{T}) where {T <: Number}
    (row, col) = size(A);

    L = zeros(Number, row, col);
    U = zeros(Number, row, col);
    
    for i in 1:row
        # i-th row of L matrix
        for j in 1:i
            if j==i
                L[i, i] = 1;
                break;
            end

            sum = 0;
            for k in 1:j-1
                sum += L[i, k] * U[k, j];
            end

            L[i, j] = (A[i, j] - sum)/U[j, j];
        end

        # i-th row of U matrix
        for j in i:col
            U[i, j] = A[i, j];

            for k in 1:i-1
                U[i, j] -= L[i, k] * U[k, j];
            end
        end
    end

    return L, U;
end