live_loop :drumz do
  with_fx :krush, gain: 10, cutoff: 90  do
    sample :loop_safari, rate: 0.25, beat_stretch: 4
  end
  sleep 4
end

live_loop :drumz2 do
  with_fx fx_names.sample, cutoff: 50 do
    sample :loop_safari, rate: 0.25, beat_stretch: 4
  end
  sleep 4
end

live_loop :drone do
  with_fx fx_names.sample do
    sample :ambi_choir, amp: 3, beat_stretch: 4, pitch: rrand(-10, 10)
  end
  with_fx fx_names.shuffle.sample do
    sample :ambi_drone, amp: 3, beat_stretch: 4, pitch: rrand(-10, 10)
  end
  sleep 4
end