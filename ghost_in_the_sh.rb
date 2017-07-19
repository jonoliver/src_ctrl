live_loop :ghastly do
  sample :ambi_haunted_hum, pitch: rrand(-24, 24)
  sleep rand(1)
end
live_loop :ghastly2 do
  sample :ambi_dark_woosh, pitch: rrand(0, 24)
  sleep rand(1)
end
