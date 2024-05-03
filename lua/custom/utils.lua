function Clamp(var, low, high)
    if var > high then
        var = high
    elseif var < low then
        var = low
    end

    return var
end
