Settings = {
    Name = "MAX_LOW",
    Period = 30,
    line=
    {
        {
            Name = "1",
            Color = RGB(255, 0, 0),
            Type = TYPE_LINE,
            Width = 3
        },
        {
            Name = "2",
            Color = RGB(0, 255, 0),
            Type = TYPE_LINE,
            Width = 3
        }
    }
}

function Init()
    return 2
end

function OnCalculate(index)
    if index < Settings.Period then
        return nil
    else
        local min = L(index-Settings.Period)
        local max = H(index-Settings.Period)
        for i = index-Settings.Period, index do
            if L(i) < min then
                min = L(i)
            end
            if H(i) > max then
                max = H(i)
            end
        end
        return min, max
    end
end