use_bpm 80


live_loop :scratch do
  rando = rrand(0.5, 2.5)
  sample :vinyl_scratch, rate: rando, amp: rrand(0.4, 0.9)
  sleep [0.75, 0.5, 0.25, 0.25, 0.25].choose
end

live_loop :drums do
  ##| stop
  sample :loop_amen, beat_stretch: 4, finish: (one_in(4) ? 0.85 : 1)
  sleep 4
end

live_loop :rhty do
  stop
  sync :drums
  with_fx :pan, pan: -1 do
    4.times do
      synth :prophet, note: :DS3, sustain: 0.5
      sleep 1
    end
    4.times do
      with_fx :distortion do
        s = synth :prophet, note: :AF1, sustain: 0.5
        sleep 1
      end
    end
  end
end

live_loop :rhty2 do
  stop
  sync :drums
  detune = 0.5
  with_fx :pan, pan: 1 do
    4.times do
      synth :prophet, note: :DS3 + detune, attack: 0.5
      sleep 1
    end
    4.times do
      with_fx :distortion do
        s = synth :prophet, note: :AF1  + detune, attack: 0.5
        sleep 1
      end
    end
  end
end

live_loop :choir do
  ##| stop
  sync :drums
  with_fx :slicer, phase: 0.125, amp_min: 0.4, amp_max: 0.8 do
    with_fx :krush do
      ##| with_fx :flanger, amp: 0.5 do
      4.times do
        sample :ambi_choir, rate: 1, finish: 0.25
        sleep 1
      end
      4.times do
        sample :ambi_choir, rate: 0.5, finish: 0.25
        sleep 1
      end
    end
    ##| end
  end
end
