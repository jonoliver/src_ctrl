def play_random_scale notes, time
  play_pattern_timed notes.shuffle, time
end

fx = [:bitcrusher, :distortion, :flanger, :krush, :whammy, :wobble, :slicer]

KEY = 'B'

with_fx :reverb do
  with_fx :bitcrusher do
    use_bpm 40
    use_synth :blade
    live_loop :piano1 do
      use_random_seed rand(1000)
      times = [0.5, 0.5, 0.5, 0.25]
      play_random_scale scale("#{KEY}3", :minor, num_octaves: 2), times.shuffle
    end
    live_loop :piano2 do
      use_random_seed rand(1000)
      play_random_scale chord("#{KEY}1", :minor), 1
    end
    live_loop :piano4 do
      use_random_seed rand(1000)
      play_random_scale chord("#{KEY}2", :minor), 0.5
    end
  end
end

live_loop :bd do
  sample :bd_boom
  sleep 4
end
live_loop :bd_808 do
  sample :bd_haus
  sleep 2
end
live_loop :snare do
  sleep 2
  with_fx :krush do
    with_fx :echo, amp: 0.25, decay: 1.5 do
      sample :elec_lo_snare
    end
  end
  sleep 2
end
live_loop :hat do
  sleep 0.5
  sample :drum_cymbal_closed
  sleep 0.5
end