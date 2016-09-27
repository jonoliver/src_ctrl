live_loop :hay do
  lower_co = 64
  upper_co = 126
  duration = 32
  co = ((line lower_co, upper_co, steps: duration) + (line upper_co, lower_co, steps: duration)).tick
  notes = ring(:b3, :d5, :b4, :d3)
  with_fx :wobble do
    with_fx :ixi_techno, mix: 0.8 do
      with_fx :slicer, phase: 0.125 do
        synth :zawa, note: notes.sample, sustain: 0.125, release: 0.125, cutoff: co #rrand(60, 130)
      end
    end
  end
  sleep 0.125
end
in_thread do
  sleep 6
  live_loop :bass do
    notes = ring(:b1, :d1)
    ##| notes = scale(:b1, :minor, octaves: 1)
    with_fx :ixi_techno do
      synth :chipbass, note: notes.sample, sustain: 0.25, release: 0.25
    end
    sleep 0.25
  end
end
in_thread do
  sleep 40
  live_loop :hay2 do
    notes = ring(:b1, :d1)
    notes = scale(:b3, :minor, octaves: 3)
    
    with_fx :krush do
      with_fx :slicer, phase: 0.125 do
        with_fx :wobble, phase: 1 do
          synth :dtri, note: notes.sample, amp: 0.2, sustain: 0.25, release: 0.25
        end
      end
    end
    sleep 0.25
  end
end
in_thread do
  sleep 8
  live_loop :kick do
    sample :bd_tek
    sleep 4
  end
  
  live_loop :hat do
    sleep 0.25
    sample :drum_cymbal_closed
    sleep 0.25
  end
  live_loop :sample do
    with_fx :ixi_techno do
      sample :loop_garzul#, finish: 0.5
    end
    sample :loop_garzul
    sleep sample_duration :loop_garzul
  end
  
end
in_thread do
  sleep 8
  live_loop :wat do
    sync :metronome
    ##| stop
    with_fx :ixi_techno do
      sleep 2
      sample :guit_e_slide#, rate: 0.8
      sleep 2
    end
  end
end
live_loop :metronome do
  sleep 0.125
end