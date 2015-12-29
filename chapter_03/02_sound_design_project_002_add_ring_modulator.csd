<CsoundSynthesizer>
<CsOptions>
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 4
nchnls = 2
0dbfs = 1

instr 1
audio loscil p4, 1, 1, 1
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
f 1 0 0 1 "olive.aiff" 0 4 0
f2 0 8192 10 1
i1 0 5 0.5

</CsScore>
</CsoundSynthesizer>
