<CsoundSynthesizer>
<CsOptions>
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 4
nchnls = 2
0dbfs = 1

instr 1
; original
;audio loscil p4, 1, 1, 1
; Change the playback speed
;kramp line 0.5, p3, 1.5
;audio loscil p4, kramp, 1, 1
; Warbling effect with lfo opcode and triangle wave
klfo lfo 0.2, 7, 1
audio loscil p4, klfo + 1, 1, 1
outs audio, audio
endin

</CsInstruments>
<CsScore>
f 1 0 0 1 "olive.aiff" 0 4 0
i1 0 5 0.5

</CsScore>
</CsoundSynthesizer>
