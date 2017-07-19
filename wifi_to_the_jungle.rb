use_bpm 300
live_loop :hat do
  sleep 1 if one_in(2)
  sample :drum_bass_hard
  sleep 1
end

live_loop :kick do
  sample :bd_fat
  sleep 4
end

live_loop :snare do
  sleep 2
  sample :elec_mid_snare
  sleep 2
end

live_loop :snare2 do
  sleep 1
  sample :elec_hollow_kick
end

live_loop :drums do
  with_fx :distortion, amp: 0.6 do
    with_fx :wobble, phase: 16 do
      sample :loop_safari, beat_stretch: 32
    end
  end
  sleep 32
end

live_loop :yo do
  with_fx :distortion, pre_amp: 2, amp: 0.4 do
    ##| with_fx :wobble, phase: 4, res: 0, cutoff_min: 80, cutoff_max: 129 do
    4.times do
      sample :bass_dnb_f
      sleep 4
    end
    sleep 16
    ##| end
  end
end

live_loop :yo2 do
  sample :elec_beep, rate: rrand(1,5), amp: 0.75#, pan: -1
  sleep [1, 0.5].choose
end

live_loop :yo3 do
  use_random_seed rrand_i(0, 10000)
  sample :elec_twip, rate: rrand(1, 3), amp: 0.75#, pan: 1
  sleep [1, 0.5].choose
end


live_loop :uh do
  sample :ambi_lunar_land#, beat_stretch: 12
  sleep 16
  ##| sample :ambi_lunar_land, rate: -1
  sleep 16
end

live_loop :guh do
  sleep 16
  sample :ambi_lunar_land, rate: -1, beat_stretch: 16
  sleep 16
end
