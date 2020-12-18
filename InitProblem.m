function Problem = InitProblem()
    global ACSOption barrier
    n = ACSOption.Width * ACSOption.Height;  %for test
    n = ACSOption.Width;
    MatrixTau = (ones(n,n))*ACSOption.C;  
    Problem = struct('dis',barrier,'tau',MatrixTau);
end
