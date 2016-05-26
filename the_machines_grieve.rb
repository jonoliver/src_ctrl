play_drums = false
drum_length = 16
drum_rate = -1
wobbler_amp = 0
noise_amp = 0.8
wobbler_fx = { phase: 0.5, cutoff_min: 50, cutoff_max: 100 }
##| wobbler_fx = { phase: 2 }

with_fx :reverb, mix: 0.9, room: 0.9, damp: 0.9 do
  
  live_loop :kick do
    stop unless play_drums
    sync :boom
    sample :bd_haus
    sleep 4
  end
  live_loop :kick_fast do
    stop
    sync :boom
    with_fx :gverb, amp: 0.6 do
      sample :bd_haus, amp: rrand(0.8, 1)
      sleep 0.375
      sample :drum_tom_lo_hard, amp: 0.4
      sleep 0.125
      sample :bd_haus, amp: 0.4
      sleep 0.25
      sample :bd_haus, amp: 0.6
      sleep 0.25
    end
  end
  live_loop :snare do
    stop unless play_drums
    sync :boom
    sleep 2
    sample :elec_lo_snare#, release: 0.0625
    sleep 1
    with_fx :echo, phase: 0.125, decay: 1 do
      sample :drum_snare_hard, amp: 0.8, rate: 0.85
    end
    sleep 1
  end
  
  live_loop :metronome do
    ##| sample :elec_tick, amp: 2, rate: 5
    sleep 1
  end
  
  live_loop :drums do
    stop unless play_drums
    sync :boom
    with_fx :gverb do
      with_fx :distortion do
        sample :loop_compus, rate: drum_rate, amp: 0.15, pre_amp: 10, beat_stretch: drum_length
        sleep drum_length
      end
    end
  end
  
  live_loop :creeps do
    use_synth :blade
    puts "SEED:"
    puts current_random_seed
    n = (scale :D4, :harmonic_minor).choose
    puts "SEED:"
    puts current_random_seed
    ##| use_random_seed 238184.14306640625
    play n, amp: 2, attack: [0.6, 1].choose, pan: -0.8
    sleep [0.5, 0.75].choose
  end
  live_loop :creeps2 do
    use_synth :growl
    ##| n = (scale :D4, :harmonic_minor).choose
    play_pattern_timed [62, 64, 65, 70, 69, 65, 73, 74], [1], amp: 0.4, attack: 0.8, release: 2, pan: 0.8
    sleep [0.5, 0.75].choose
  end
  
  live_loop :wobbler do
    ##| stop
    sync :boom
    use_synth :dsaw
    
    with_fx :wobble, wobbler_fx do
      with_fx :bitcrusher, pre_amp: 3 do
        s = play :D1, decay: 1, release: 4, amp: wobbler_amp
        sleep 8
      end
    end
    
    live_loop :main do
      wobbler_amp = 0
      play_drums = true
      puts tick
      bar = look/4
      puts bar
      wobbler_amp = wobbler_amp + 0.1 if bar.between? 4, 8
      case bar
      when 8
      end
      
      sleep 1
    end
    
  end
  live_loop :drone do
    stop
    use_synth :dark_ambience
    play :D2, attack: 4, sustain: 4, release: 4, amp: 1
    sleep 4
  end
  
  live_loop :boom do
    sample :drum_tom_lo_hard, rate: rrand(0.02, 0.06), amp: 2
    sleep 4
  end
end
up = true
live_loop :noise_amp do
  stop
  new_val = noise_amp + (up ? 0.05 : -0.05)
  if new_val > 0.4 && new_val < 0.8
    noise_amp = new_val
  end
  puts noise_amp
  up = !up if (tick != 0 && tick % 8 == 0)
  puts up
  ##| up = false if noise_amp > 0.8
  ##| up = true if noise_amp < 0.4
  sleep 1
end

live_loop :noise do
  stop
  use_synth :noise
  play :D2, attack: 2, sustain: 2, amp: noise_amp
  sleep 4
end


live_loop :ghastly do
  sample :ambi_haunted_hum, pitch: rrand(-24, 24), amp: noise_amp
  sleep rand(1)
end
live_loop :ghastly2 do
  sample :ambi_dark_woosh, pitch: rrand(0, 24), amp: noise_amp
  sleep rand(1)
end

