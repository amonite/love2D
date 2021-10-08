function gx.load()
  player = {
      x = 10,
      y = 5,
      size = 20
  }

  data = {}

  --Je ne comprends pas bien comment on peut attribuer à l'objet data une propriété qui n'a pas été définie au préalable.

  data.player = {
      x = player.x,
      y = player.y,
      size = player.size
  }

  print(data.player.x)

end 

