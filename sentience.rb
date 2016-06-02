define :play_random_scale do |notes, time|
  c = play_pattern_timed notes.shuffle, time
end
my_synth_names = synth_names.to_a.reject{|s|s.to_s.include? 'noise'}
use_bpm 40

KEY = 'B'

##| my_fx = :bitcrusher
##| my_synth = :blade
##| my_fx = :vowel
my_fx = :reverb
my_synth = :dtri
##| my_fx = fx_names.choose


with_fx :reverb do
  with_fx my_fx do
    use_synth my_synth
    live_loop :high_melody do
      random_seed = rand(1000)
      ##| use_synth my_synth_names.choose
      ##| use_synth :dtri
      use_random_seed random_seed
      times = [0.5, 0.5, 0.5, 0.25]
      #times = [0.25, 0.25, 0.25, 0.5]
      with_fx :slicer, phase: 0.125 do
        play_random_scale scale("#{KEY}3", :minor, num_octaves: 2), times.shuffle
      end
    end
    live_loop :bass_melody do
      use_random_seed rand(1000)
      ##| use_synth :dtri
      ##| use_synth my_synth_names.choose
      play_random_scale chord("#{KEY}1", :minor), 1
    end
    live_loop :mid_melody do
      use_random_seed rand(1000)
      ##| use_synth :dtri
      ##| use_synth my_synth_names.choose
      play_random_scale chord("#{KEY}2", :minor), 0.5
    end
  end
  live_loop :piano5 do
    use_synth :dpulse
    use_random_seed rand(1000)
    with_fx :gverb, amp: 0.6 do
      with_fx :slicer, phase: 0.125, pulse_witdh: 0.35 do
        with_fx :bitcrusher do
          ##| play_random_scale  chord(:B2, :minor ), 1
          
          sleep 1
        end
      end
    end
  end
end

fast_kick = false
fast_kick_prob = 8
fast_hat = false
fast_hat_prob = 8
full_band = false


define :pick_up do
  fast_kick = true
  fast_hat = true
  fast_kick_prob = 4
  fast_hat_prob = 4
end
define :go_hard do
  pick_up
  fast_kick_prob = 2
  fast_hat_prob = 2
  full_band = true
end
define :drop_it do
  fast_kick = false
  fast_hat = false
  full_band = false
end

live_loop :live_main do
  case tick
  when 0
    drop_it
  when 15
    pick_up
  when 30
    go_hard
  when 46
    fast_kick_prob = 4
  when 64
    drop_it
  when 74
    pick_up
  when 80
    go_hard
  when 90
    drop_it
  when 108
    go_hard
  end
  puts look
  ##| 118
  ##| 142
  ##| 168
  ##| 194
  ##| 220
  ##| 246
  ##| go_hard
  sleep 1
end

##| live_loop :rando, seed: 20 do
##|   puts tick
##|   if one_in 2
##|     go_hard
##|   else
##|     drop_it
##|   end
##|   sleep 4
##| end
##|
live_loop :bd do
  sample :bd_boom
  sleep 4
end

with_fx :ixi_techno, mix: 1, cutoff_min: 100 do
  
  
  live_loop :snare do
    sleep 2
    with_fx :krush do
      with_fx :echo, amp: 0.25, decay: 1.5 do
        sample :elec_lo_snare
      end
    end
    sleep 2
  end
  live_loop :kick do
    sample :bd_haus
    sleep 2
  end
  live_loop :kick_fast do
    16.times do
      sample :bd_haus, amp: rrand(0.8, 1) if fast_kick && one_in(fast_kick_prob)
      sleep 0.125
    end
  end
  live_loop :hat do
    sleep 0.5
    sample :drum_cymbal_closed
    sleep 0.5
  end
  live_loop :hat_fast do
    16.times do
      sleep 0.125
      sample :drum_cymbal_closed, amp: rrand(0.8, 1) if fast_hat && one_in(fast_hat_prob)
    end
  end
  live_loop :hat_fast2 do
    16.times do
      sleep 0.125
      sample :elec_beep, amp: 1.5, rate: rrand(1.5, 4.5), amp: rrand(0.4, 0.6) if fast_hat && one_in(4)
    end
  end
  live_loop :open_hat do
    with_fx :level, amp: 0.3 do
      
      ##| sleep 2
      ##| sample :drum_cymbal_open, rate: -1, decay_level: 0.025
      ##| sleep 1.75
      sleep 3.75
      sample :drum_cymbal_open
      sleep 0.25
    end
  end
end