live_loop :drums do
  ##| stop
  drum_length = 8
  drum_rate = 0.1
  with_fx :gverb do
    with_fx :distortion do
      sample :loop_compus, rate: drum_rate, amp: 0.15, pre_amp: 5, beat_stretch: drum_length
      sleep drum_length*10
    end
  end
end


live_loop :drums2 do
  ##| stop
  drum_length = 4
  drum_rate = 0.1
  with_fx :gverb do
    with_fx :distortion do
      sample :loop_breakbeat, rate: drum_rate, amp: 0.1, pre_amp: 10, beat_stretch: drum_length
      sleep drum_length*10
    end
  end
end

live_loop :eerie do
  drum_length = 4
  drum_rate = rrand(0.1, 1)
  with_fx :gverb do
    with_fx :distortion do
      sample :ambi_haunted_hum, rate: drum_rate, amp: 0.15, pre_amp: rrand(1,10), beat_stretch: drum_length
      sleep drum_length
    end
  end
end

live_loop :wat do
  drum_length = 4
  drum_rate = rrand(0.1, 1)
  with_fx :gverb do
    with_fx :distortion do
      sample :ambi_piano, rate: drum_rate, amp: 0.15, pre_amp: 10, beat_stretch: drum_length
      sleep drum_length
    end
  end
end

live_loop :wat2 do
  drum_length = 4
  drum_rate = rrand(-0.9, 0.9)
  with_fx :gverb do
    with_fx :distortion do
      sample :ambi_glass_hum, rate: drum_rate, amp: 0.15, pre_amp: 10, beat_stretch: drum_length
      sleep drum_length
    end
  end
end

live_loop :watt do
  stop
  drum_length = 4
  drum_rate = rrand(0.1, 0.3)
  with_fx :gverb do
    with_fx :distortion do
      sample :misc_crow, rate: drum_rate, amp: 0.15, pre_amp: 10, beat_stretch: drum_length
      sleep drum_length
    end
  end
end
