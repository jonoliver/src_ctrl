use_bpm 40
live_loop :wow do
  sleep 1
end
live_loop :yah do
  sample :loop_industrial, beat_stretch: 4, rate: -1
  sleep 4
end
live_loop :yah2 do
  sample :loop_industrial, amp: 1, beat_stretch: 2
  sleep 2
  sample :loop_industrial, beat_stretch: 2, pitch: -0.05
  sleep 2
end
live_loop :wat do
  ##| with_fx :wobble do
  ##| with_fx :slicer, min_cutoff: 0, phase: 0.0625  do
  s = sample :ambi_lunar_land, amp: 0.3, rate: 0.6
  ##| end
  ##| end
  sleep 4
end
live_loop :wat2 do
  sample :bass_dnb_f, rate: 0.65
  sleep 2
end
live_loop :wat3 do
  notes = ring(:a1, :c2, :b1, :a1)
  with_fx :tanh do
    ##| with_fx :wobble, cutoff_min: 80, cutoff_max: 100, res: 0, phase: 2, phase_slide: 0 do |w|
    
    4.times do
      synth :dsaw, amp: 0.6, note: notes.tick, attack: 0, release: 3, sustain: 1
      sleep 4
    end
  end
end

live_loop :wat4 do
  ##| stop
  sync :wat
  with_fx :wobble, cutoff_min: 80, phase: 1 do
    18.times do
      ##| sample :elec_blip, amp: 0.9, rate: rrand(1, 2)
      s = scale :a4, :minor
      
      synth :dpulse, note: s.choose, amp: 0.2
      sleep [0.125, 0.25].choose
    end
  end
end

##| live_loop :boops do
##|   4.times do
##|     sample :elec_beep, amp: 0.3, rate: rrand(0.5, 3.5)
##|     sleep 0.0625
##|   end
##| end