use_bpm 176

kick = in_thread do
  loop do
    with_fx :lpf, cutoff: 100 do
      sample :bd_tek, rate: 0.9, pre_amp: 1.5
      sleep 2
    end
  end
end

snare = in_thread do
  loop do
    with_fx :hpf, cutoff: 90 do
      sleep 2
      sample :sn_dub, rate: 0.5, finish: 0.3
      sleep 2
    end
  end
end

hat = in_thread do
  sleep 32
  loop do
    with_fx :lpf, cutoff: 120 do
      sample :drum_cymbal_closed, pre_amp: 10, finish: 0.05, amp: 0.18#, rate: 0.5
      sleep 0.5
    end
  end
end

bass = in_thread do
  sleep 32
  loop do
    with_synth :tb303 do
      with_synth_defaults sustain: 0.5, release: 0, amp: 0.6 do
        with_fx :ixi_techno, phase: 4, cutoff_min: 50, cutoff_max: 90, res: 0.8 do
          sleep 1
          play_pattern_timed [:c1, :c2, :c1, :g1, :g1, :g1, :as1], [1, 1, 1, 1.5, 1, 0.5, 2]
          play_pattern_timed [:c1, :c2, :c1, :c1, :as1, :g1, :c1, :c1], [1, 1, 1, 2, 0.5, 0.5, 0.5, 0.5]
        end
      end
    end
  end
end

lead = in_thread do
  sleep 96
  loop do
    with_fx :flanger, amp: 0.5 do
      with_fx :krush, amp: 0.5 do
        with_synth :pretty_bell do
          play_pattern_timed [:g5, :f5, :f5, :e5, :ds5, :d5, :as4, :as4, :a4, :c5], [3, 5, 3, 5, 3, 5, 1, 1, 1, 4]
          sleep 1
        end
      end
    end
  end
end

sleep 160
snare.kill
kick.kill
hat.kill
bass.kill
sleep 64
lead.kill
