with_fx :reverb, mix: 0.8 do
  live_loop :hellfarm do
    sp_name = choose sample_names :misc
    sp_time = [1, 2].choose
    sp_rate = 0.5
    s = sample sp_name, amp: rrand(1.5,2), cutoff: rrand(70, 130), rate: sp_rate * choose([0.5, 1]), pan: rrand(-1, 1), pan_slide: sp_time
    control s, pan: rrand(-1, 1)
    sleep sp_time
  end
end

live_loop :drone do
  with_fx :reverb, room: 1 do
    with_fx fx_names.sample do
      sample :ambi_choir, attack: 1, amp: 3, beat_stretch: 4, pitch: rrand(-10, 10)
    end
    with_fx fx_names.shuffle.sample do
      sample :ambi_drone, attack: 1, amp: 3, beat_stretch: 4, pitch: rrand(-10, 10)
    end
  end
  sleep 4
end

define :drums do |effect|
  with_fx effect, gain: 10, cutoff: 0, cutoff_slide: 4  do |fx|
    s = sample :loop_safari, rate: 0.25, beat_stretch: 4, pan: 0, pan_slide: 4
    control fx, cutoff: rrand(60, 100)
    control s, pan: rrand(-0.5, 0.5)
  end
  sleep 4
end

live_loop :drumz do
  drums :krush
end

live_loop :drumz2 do
  drums fx_names.sample
end
