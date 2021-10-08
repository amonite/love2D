-- How to use tables/arrays 
-- decalre array {,} 
  fruits = {"pineapple", "banana","lemon", "kiwi"}

  -- edit table
  table.insert(fruits,"orange")
  table.remove(fruits,4)

  -- to get the length of the table using a function
  function tableLen(table)
    local n = 0
    for p in pairs(table) do 
      n=n+1 
    end 
    return n
  end

  print("length of table using a function :"..tableLen(fruits)) 
  print("length of table :".. #fruits)
  print(fruits[1])
  -- print all the items in the list
  for i=1,#fruits do
    print(fruits[i])
  end 
  -- print all items with index 
  for i, v in ipairs(fruits) do
    print(i,v)
  end 

  