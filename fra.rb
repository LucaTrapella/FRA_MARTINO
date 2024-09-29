#SCALE

scale_notes=[60,62,64,65,67,69,71,72]
print("hello")

#ARPEGGIOS

notes1 = [60, 64, 67]
notes2 = [59, 64, 67]
notes3 = [57, 64, 67]
in_thread do
  with_fx :level, amp: 0.5 do
    loop do
      4.times do
        notes1.each do |n|
          play n
          sleep 0.25
        end
      end
      
      4.times do
        notes1.each do |n|
          play n
          sleep 0.25
        end
      end
      
      4.times do
        notes2.each do |n|
          play n
          sleep 0.25
        end
      end
      
      4.times do
        notes3.each do |n|
          play n
          sleep 0.25
        end
      end
    end
  end
end


# FRA MARTINO MELODY
def fm1
  [60, 62, 64, 60].each do |nota|
    # a block of instructions
    play nota
    sleep 0.5
  end
  puts "barr 1"
end

# another way to use blocks is with {}
def fm2
  [64, 65].each { |nota| play nota; sleep 0.5}
  play 67
  sleep 1
  puts "barr 2"
end

def fm3
  [67, 69, 67, 65, 64].each { |nota| play nota; sleep 0.25 }
  sleep 0.25
  play 60
  sleep 0.5
  puts "barr 3"
end

def fm4
  [60, 55].each { |n| play n; sleep 0.5}
  play 60
  sleep 1
  puts "barr 4"
end



whole_song = [:fm1, :fm2, :fm3, :fm4]


in_thread do
  with_fx :level, level: 1 do
    with_fx :pan, pan: -1 do
      with_fx :reverb,amp:2, room: 0.8 do
        use_synth :kalimba
        loop {send(whole_song.sample)}
      end
    end
  end
end


in_thread do
  with_fx :level, amp: 1 do
    with_fx :pan, pan: 0.9 do
      with_fx :reverb, amp:2 , room: 0.8 do
        use_synth :kalimba
        loop {send(whole_song.sample)}
      end
    end
  end
end
