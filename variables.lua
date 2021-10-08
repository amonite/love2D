print("Hello World")

-- Globals
n=1.5
x=10
y=5
name="Valeria"
Name="Conan"

-- print("n ="+n) not allowed !!
-- instead use .. to concatenate strings
print("n = "..n)
n=n+1
print("n = "..n)
print(x+y)
print(name)
print(name.." and "..Name)
-- Locals
local test --doesn't need to be initialized
test = 101
print test