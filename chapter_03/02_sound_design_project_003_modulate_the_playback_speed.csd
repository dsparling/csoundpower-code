<CsoundSynthesizer>
<CsOptions>
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 4
nchnls = 2
0dbfs = 1

instr 1
; Original
aphas phasor 1/p3
; Make it back up
;klfo lfo 1, 0.25, 1
;aphas phasor (klfo + 0.1)/p3
ifilelength = 709288
aphas = aphas * ifilelength
audio table aphas, 1

; fixed frequency for sine wav
;asine oscil 1, 200, 2
; ramp generator - modulate frequency of sine wave with it
kramp line 200, p3, 1000
asine oscil 1, kramp, 2
audio = audio * asine
outs audio, audio
endin

</CsInstruments>
<CsScore>
f1 0 1048576 1 "olive.aiff" 0 4 0
f2 0 8192 10 1
i1 0 5 0.5

</CsScore>
</CsoundSynthesizer>
