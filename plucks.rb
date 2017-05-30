live_loop :lead do
  use_random_seed rrand(1, 100000)
  with_fx :echo do
    with_synth :pluck do
      play_pattern_timed scale(:a3, :harmonic_minor).shuffle.take([4,5,6,7,8].choose), (Array.new(4, 0.25))
      play_pattern_timed scale(:a2, :harmonic_minor, num_octaves: 2).shuffle.take([4,5,6,7,8].choose), (Array.new(4, 0.25))
      play_pattern_timed scale(:a4, :harmonic_minor, num_octaves: 3).shuffle.take([4,5,6,7,8].choose), (Array.new(4, 0.25))
    end
  end
  sleep 1
end
