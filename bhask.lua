
complexLib="complexLib.lua"

dofile(complexLib)

function bhask(a, b, c)
	local delta = b^2-4*a*c
	local newDelta = math.abs(delta)
	local x1 = nil
	local x2 = nil
	
	if delta < 0 then
		local y1 = complex.new((-b)/(2*a), (math.sqrt(newDelta))/(2*a))
		local y2 = complex.new((-b)/(2*a), (-math.sqrt(newDelta))/(2*a))
		x1 = complex.toString(y1)
		x2 = complex.toString(y2)
	else
		x1=(-b+math.sqrt(delta))/(2*a)
		x2=(-b-math.sqrt(delta))/(2*a)
	end

	return x1, x2
end

function main()
	-- solve x² - 6x + 25 = 0
	r1, r2 = bhask(1, -6, 25)

	print(r1, r2)
end

main()