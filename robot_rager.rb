SPL = :loop_amen
RATE = 1
DUR = 1

live_loop :drums do
  fx = ring(:bitcrusher, :krush, :whammy, :panslicer, :hpf, :distortion, :ixi_techno).tick
  puts fx
  with_fx fx, amp: 2  do
    with_fx :wobble, res: 0.5, phase: 2, amp: 2 do
      4.times{ run_beat }
    end
  end
end

define :run_beat do
  val = 0.5
  a1 = {ring(:start, :finish).choose => val}
  a2 = {ring(:finish, :start).choose => val}
  sample SPL, rate: RATE, **a1
  sleep DUR
  sample SPL, rate: (RATE * [1, -1].choose), **a2
  sleep DUR
end
live_loop :bass do
  use_random_seed rrand(1, 100000)
  n = ring(33, 36, 40, 38).tick
  puts n
  with_fx :ixi_techno, cutoff_min: 70, cutoff_max: 90 do
    with_synth :dsaw do
      4.times do
        play n, release: 0.3
        sleep 0.25
      end
      sleep 1
      4.times do
        play n, release: 0.25
        sleep 0.25
      end
      sleep 1
    end
  end
end

live_loop :kick do
  ##| sample :bd_haus
  sleep 0.5 #one_in(4) ? 0.125 : 0.5
end

live_loop :hat do
  ##| sample :drum_cymbal_closed
  sleep one_in(4) ? 0.25 : 0.125
end

live_loop :beep do
  sleep 1
  with_fx :flanger do
    8.times do
      sleep 0.125
      sample :elec_beep, pre_amp: 1.5, rate: rrand(1.5, 4.5), amp: rrand(0.4, 0.6) #if one_in(4)
    end
  end
end

live_loop :beep2 do
  with_fx :wobble do
    16.times do
      sleep 0.0625
      sample :elec_beep, pre_amp: 1.5, rate: rrand(1.5, 4.5), amp: rrand(0.4, 0.6) #if one_in(4)
    end
  end
  sleep 1

end
