def wear(smell)
  if smell >= 10
    sample :drum_snare_hard
  else
    sample :drum_tom_hi_hard, rate: smell
    sleep 0.1
    wear(smell + 1)
  end
end

def wash(temperature)
  play temperature
  sleep 1
end

def dry(dryer)
  sample dryer
  sleep 1
end

def iron
  use_synth :growl
  play 60
  sleep 1
end

def dirty?
  1 == [1,2].choose
end

def treat_stain
  sample :ambi_choir
  sleep 2
end

live_loop :laundry_1 do
  sync :tick
  wear(1)
  treat_stain if dirty?
  wash(60)
  dry(:guit_harmonics)
  iron
end

live_loop :laundry_2 do
  sync :tick
  wear(5)
  treat_stain if dirty?
  wash(90)
  dry(:elec_cymbal)
end

live_loop :time do
  sync :tick
  sample :drum_bass_hard
  sleep 0.5
  sample :drum_snare_hard
  sleep 0.5
end

live_loop :tick do
  sleep 1
end