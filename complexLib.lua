local function new(a, b) -- cria um número complexo
		return {r=a, i=b}
	end

local function toComplex(a) -- torna um numero real ou uma string em um complexo
		local z = nil
		if type(a) == "number" then
			z = new(a, 0)
		end

		if type(a) == "string" then
			local x=string.match(a, "%d+")
			local y=string.match(a, "(%d+)i")
			z = new(tonumber(x), tonumber(y))
		end

		if z==nil then
			error("failed to create complex number", 3)
		end

		return z
	end

local function checkComplex (z) -- testa se a entrada é um complexo válido
      if not ((type(z) == "table")
         and tonumber(z.r) and tonumber(z.i)) then
        error("bad complex number", 3)
      end
	end

local function tostringc(z) -- retorna um complexo como uma string-
		checkComplex(z)
		local str = ""

		if z.i < 0 then
			str = tostring(z.r) .. " - " .. tostring(math.abs(z.i)) .. "i"
		else
			str = tostring(z.r) .. " + " .. tostring(z.i) .. "i"
		end

		return str
	end

local function add(z1, z2) -- soma dois complexos
		checkComplex(z1)
		checkComplex(z2)
		return new(z1.r+z2.r, z1.i+z2.i)
	end

local function sub(z1, z2) -- subtrai dois complexos (z1-z2)
		checkComplex(z1)
		checkComplex(z2)
		return new(z1.r-z2.r, z1.i-z2.i)
	end

local function prod(z1, z2) --faz o produto de 2 complexos
		checkComplex(z1)
		checkComplex(z2)
		return new(z1.r*z1.r-z1.i*z2.i, z1.r*z2.i+z1.i*z2.r)
	end

local function mul(a, z) -- faz o produto de um complexo por um real
		checkComplex(z)
		b = toComplex(a)
		return new(a*z.r, a*z.i)
	end

local function conj(z) -- calcula o conjulgado de um complexo
		checkComplex(z)
		return new(z.r,-z.i)
	end

local function mod(z) -- calcula o modulo de um complexo
		checkComplex(z)
		local z2=prod(z, conj(z))
		local n=math.sqrt(z2.r)
		return n
	end

local function div(z1, z2) -- divide dois complexos (z1/z2)
	local p=mod(z2)
	local z3= prod(z1, conj(z2))
	return new(z3.r/p^2, z3.i/p^2)
end

complex={
	new=new,
	toComplex=toComplex,
	add=add,
	sub=sub,
	prod=prod,
	mod=mod,
	conj=conj,
	div=div,
	i=new(0, 1),
	mul=mul,
	toString=tostringc
}

return complex