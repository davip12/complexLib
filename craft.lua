local function new(a, b)
		return {r=a, i=b}
	end


local function checkComplex (z)
      if not ((type(z) == "table")
         and tonumber(z.r) and tonumber(z.i)) then
        error("bad complex number", 3)
      end
	end

local function add(z1, z2)
		checkComplex(z1)
		checkComplex(z2)
		return new(z1.r+z2.r, z1.i+z2.i)
	end

local function sub(z1, z2)
		checkComplex(z1)
		checkComplex(z2)
		return new(z1.r-z2.r, z1.i-z2.i)
	end

local function prod(z1, z2)
		checkComplex(z1)
		checkComplex(z2)
		return new(z1.r*z1.r-z1.i*z2.i, z1.r*z2.i+z1.i*z2.r)
	end

local function conj(z)
	checkComplex(z)
		return new(z.r,-z.i)
	end

local function mod(z)
		checkComplex(z)
		z2=prod(z, conj(z))
		local n=math.sqrt(z2.r)
		return n
	end

local function div(z1, z2) -- z1/z2
	local p=mod(z2)
	local z3= prod(z1, conj(z2))
	return new(z3.r/p^2, z3.i/p^2)
	-- body
end

complex={}
	complex.new=new
	complex.add=add
	complex.sub=sub
	complex.prod=prod
	complex.mod=mod
	complex.conj=conj
	complex.div=div
	complex.i=complex.new(0, 1)

z1=complex.new(1, 5)
z2=complex.new(2, -1)

z3=complex.prod(z1, z2)
z4=complex.mod(complex.add(z1, z2))

for i, v in pairs(z3) do
	print (i, v)
end

print(z4)
