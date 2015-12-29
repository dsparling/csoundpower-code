<CsoundSynthesizer>
<CsOptions>
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 4
nchnls = 2
0dbfs = 1

; Slightly more complex instrument
instr 1
kphasramp line 0.1, p3, 1.5
klfo lfo 1, (0.1 + kphasramp), 2
aphas phasor (klfo - kphasramp)/20
aphas2 phasor (klfo + kphasramp)/20
ifilelength = 709288
aphas = aphas * ifilelength
aphas2 = aphas2 * ifilelength
audioL table aphas, 1
audioR table aphas2, 1
outs audioL, audioR
endin

</CsInstruments>
<CsScore>
f1 0 1048576 1 "olive.aiff" 0 4 0
f2 0 8192 10 1
i1 0 5 0.5

</CsScore>
</CsoundSynthesizer>
