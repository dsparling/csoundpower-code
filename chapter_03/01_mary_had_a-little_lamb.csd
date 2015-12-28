<CsoundSynthesizer>
<CsOptions>
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 10
nchnls = 2
0dbfs = 1

giSine ftgen 0, 0, 8192, 10, 1

instr 1

; setup:
iamp = p4 * 0.6
ifreq = cpspch(p5)
idetune = 0.7
index = 3

; envelopes:
kindexenv linseg index, 0.05, (index * 0.5), (p3 - 0.05), 0
kampenv linseg 0, 0.01, iamp, (p3 - 0.01), 0

; tone generators:
aout foscil kampenv, ifreq - idetune, 1, 1, kindexenv, giSine
aout2 foscil kampenv, ifreq + idetune, 1, 1, kindexenv, giSine

; output:
outs aout, aout2

endin

</CsInstruments>
<CsScore>

; set tempo:
t 0 120

; melody:
i1 0 1 0.6 8.04
i1 1 1 0.5 8.02
i1 2 1 0.4 8.00
i1 3 1 0.5 8.02
i1 4 1 0.6 8.04
i1 5 1 0.7 8.04
i1 6 1 0.8 8.04

</CsScore>
</CsoundSynthesizer>
