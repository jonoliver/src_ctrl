choir = false
pluck = false
choir = true
pluck = true

live_loop :saw do
  s = scale :c2, :aeolian
  synth :tech_saws, note: s.choose, sustain: 1, release: 0, amp: 0.8
  sleep 1
end

live_loop :kick do
  3.times do
    sample :drum_bass_hard, rate: 0.8
    sleep 0.75
    sample :drum_bass_hard
    sleep 0.75
  end
  sample :drum_bass_hard, rate: 0.8
  sleep 0.75
  sleep 0.75
end

live_loop :snare do
  with_fx :hpf, cutoff: 80 do
    sleep 1
    sample :sn_dub, rate: 0.5
    sleep 0.5
    sleep 1
    sample :sn_dub, rate: 0.5, finish: 0.3
    sleep 0.5
    sleep 1
    sample :sn_dub, rate: 0.5
    sleep 0.5
    sleep 1
    sample :sn_dub, rate: -0.5, start: 0.3
    sleep 0.5
  end
end

live_loop :hat do
  sleep 1
  if one_in(2)
    8.times do
      ##| sample :drum_cymbal_closed, rate: 2
      sleep 0.0312
    end
  end
end

live_loop :hat_fast do
  with_fx :hpf, cutoff: 120 do
    if one_in(2)
      [1, 2, 4].choose.times do
        sample :drum_cymbal_closed, rate: 2
        sleep [0.25, 0.125].choose
      end
    else
      sleep 0.5
    end
  end
end


live_loop :wat do
  r = ring(:c6, :e5, :c6, :e6)
  with_fx :hpf, cutoff: 100 do
    with_fx :gverb do
      with_fx :ring_mod do
        synth :pluck, note: r.tick if pluck
      end
    end
  end
  sleep 0.75
end

live_loop :ambi do
  with_fx :slicer, phase: 0.125 do
    sample :ambi_choir, amp: 0.5 if choir
    sleep 1
    sample :ambi_choir, amp: 0.5 if choir
    sample :ambi_drone, rate: -1, finish: 0.25, amp: 0.5 if choir
    sleep 1
    sample :ambi_choir, amp: 0.5 if choir
    sleep 1
  end
end


live_loop :ambi2 do
  with_fx :slicer, phase: 0.125 do
    4.times do
      sample :ambi_lunar_land, amp: 0.35
      sleep 1
    end
    sleep 2
  end
end
