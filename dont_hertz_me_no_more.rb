# generate hertz based on fibonacci sequence
define :fibonacci do |start, length|
  length.times.reduce([0, start]) { |arr, i|
    arr << arr[-2] + arr[-1]
  }[2, length]
end

# convert hertz to midi notes
notes = ring *fibonacci(288, 5).map{ |hz| hz_to_midi hz }

live_loop :fib do
  with_fx :reverb do
    synth :pretty_bell, note: notes.sample, release: rrand(0.1, 1)
    sleep 0.125
  end
end